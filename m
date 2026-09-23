Received: from va-2-55.ptr.blmpb.com (va-2-55.ptr.blmpb.com [209.127.231.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BF749B1EF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162642; cv=none; b=GXUjdxR+45j7JtzZYiY4XVYg2/3X9hCMBOeetgg6MmW/NVvjQrVmfj1owO/pc779Y+9tR6aLNG67Km3RXB8TA4v9NOug1bEqp8DcmFqwn5Xq3rWIr09/Zt1fSPQbWOlXvzYytq16mpza5JTZ8UvQbVkWQUXQcbxTVHxGR1EgeFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162642; c=relaxed/simple;
	bh=jWa+1IFgCZrNjNXiwQnuLWYI46HHUEwvbGXCyk9jkcw=;
	h=To:From:Date:Message-Id:Mime-Version:References:Subject:
	 Content-Type:In-Reply-To:Cc; b=jM3pXr34UjE9W9XuCZYLoBIa8VUiXvLqFa9N22EZXSWdheaEFA2Lsom9IQ9uLLTk/LZFTAHP0pN6jQ0YukCRi1QiWg/kM99gLL6tGCWWbngFlhhDdg5GGVUpwtAi6Odb5TBHtqVyzOsvlia+uQE1oxjsEO8DTUeqSi8mOoKpCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=grzHRcGG; arc=none smtp.client-ip=209.127.231.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="grzHRcGG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1790162629;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bC0/fN7waNqoJr2je2YuDDBCo+ld0k0RwfKkIsE8pEM=;
 b=grzHRcGG3//3TzDCrnfvIsPw7uoKVhw2740OVWgCCQUymFfc/73pCw83alD3gCxcugkhgu
 Cg3QV6bJhC+dpwXmjj0y4A7cl/1Zktcq+/olai/XmMPyKgtKjIgQS3aeTRUCa7YTaMHK5r
 mVevLk2t2Vt4Bg+0qIrylY3Q7FwCUHkqSD+5QEzfWXIgNbu05rLhPzMWmWEtacg7QmOZYy
 PISQlP2lp077Pykji+yGeCdIaqMjrLfao1FTawU89Q2QzapTrTSzgiHha0pbchlquRgel1
 CrAg07pDliKUG1S5G4Ch9IFmtTZrix0Zzlzz8XnUNwjp7EGhqcXQHMAMsi3fcA==
Received: from [192.168.1.104] ([39.182.0.179]) by smtp.larksuite.com with ESMTPS; Wed, 23 Sep 2026 11:23:48 +0000
To: "Svyatoslav Nikolenko" <nsvatoslav515@gmail.com>, <song@kernel.org>, 
	"yu kuai" <yukuai@fygo.io>
From: "yu kuai" <yukuai@fygo.io>
Date: Wed, 23 Sep 2026 19:23:45 +0800
Message-Id: <314ed63c-e29b-4fa0-9f24-57b5f868fab6@fygo.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: yu kuai <yukuai@fygo.io>
References: <20260922125418.2715-1-nsvatoslav515@gmail.com>
X-Lms-Return-Path: <lba+26ab3b6c5+f27c93+vger.kernel.org+yukuai@fygo.io>
Reply-To: yukuai@fygo.io
Subject: Re: [PATCH] md/raid5: fix NULL pointer dereference in raid5_has_ppl
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20260922125418.2715-1-nsvatoslav515@gmail.com>
Cc: <magiclinan@didiglobal.com>, <xiao@kernel.org>, 
	<linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: quoted-printable

Hi,

=E5=9C=A8 2026/9/22 20:54, Svyatoslav Nikolenko =E5=86=99=E9=81=93:
> Check if conf->mddev is non-NULL in raid5_has_ppl() before testing flags =
to
> prevent a KASAN null-ptr-deref during free_conf() cleanup paths.
>
> Reported-by: syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com
> Tested-by: syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
>   drivers/md/raid5-log.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Looks like this is already fixed by:

https://patch.msgid.link/20260915081731.122933-1-chengzhihao1@huawei.com

>
> diff --git a/drivers/md/raid5-log.h b/drivers/md/raid5-log.h
> index c8332502669e..5a144051b142 100644
> --- a/drivers/md/raid5-log.h
> +++ b/drivers/md/raid5-log.h
> @@ -51,7 +51,7 @@ static inline bool raid5_has_log(struct r5conf *conf)
>  =20
>   static inline bool raid5_has_ppl(struct r5conf *conf)
>   {
> -	return test_bit(MD_HAS_PPL, &conf->mddev->flags);
> +	return conf->mddev && test_bit(MD_HAS_PPL, &conf->mddev->flags);
>   }
>  =20
>   static inline int log_stripe(struct stripe_head *sh, struct stripe_head=
_state *s)

--=20
Thanks,
Kuai
