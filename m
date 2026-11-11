Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359837;
	b=eH6NEPzVq+zStf00Ee8/aoqGEACKaS5hAzex3OmTVKpc+BtGhbkbwHZnmidqAv1/cWO6
	 l13AHkfHtVHwIjRYTHx8Gib6ESY/PKA0sSgjXedtSF5Ic+tjCD1fyP/xVDFIvgdrToios
	 HJFvw6L2VW+YHYxzR1iVgqFE9YT1vfHN4ayvMal5s48FSPJi/zVOWqFc83GqoV5PKgbi/
	 GHvb21TajwrmnrGfINXIYfvGO9et8fVIQTF0znxnRCGxGBd6GobZrxN8Y+gO93ZIDhu67
	 rkBN2wCuNUi+02qOF+wFjrIz2XgxjWPK0zK3URlqT+EUzhCIQl0D9kgR45zjWyEQEVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359837;
	h=DMARC-Filter:DKIM-Signature:To:Cc:From:Mime-Version:
	 X-Lms-Return-Path:X-Original-From:Message-Id:References:Subject:
	 Content-Type:Received:User-Agent:Reply-To:Date:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FRQiyK5wJHX+Y1daTLJ2LKb8Axz2eA5lQft1YdiVGfc=;
	b=puCdQLeDoqUi3FOEmKRkH8KWBwwl+/FNM6mgvCgNxT4/YwDYr11ndWcnTuw1uzP5Sxfl
	 AHZUy0As7poo+gCtsQtJKqqz610jG1VQWscIR+i7Ige7fQHd5G1TZ+TN4PodJHEkhf/gh
	 UOSzuMgGMJhp3E63paUsN0AZJdy8cBSTPwPykXo1XS2dloH3OklCu8AMxvacX+2HqR2uj
	 2o/3M7MtrrYPvMwWVDz4zDv4mGkbkh6Dl1+0cp3SwJfAjtywHknsbkvrjUIbb32YPrlVm
	 A4xL8gDqDRmMR4/LgCTltcVuc77tqKp0RPm068Kw7PRQnbJypaTA62jHVhV4CC1wXkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=EefnTuwY;
	arc=none smtp.remote-ip=209.127.231.54
Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=EefnTuwY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1794359826;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=FRQiyK5wJHX+Y1daTLJ2LKb8Axz2eA5lQft1YdiVGfc=;
 b=EefnTuwY61fLIkSVE3kBqheu+HHRcrnhh+mXYw/F37xDS6ceQJhIq/yusMsayi0yysM+Oa
 Tc3PudLrjj1a+OT99tVdT3Eu779Est0rOalBmbfvhfJar/0nY1Om+s8njl8e0YEPtt6oae
 ONZXMii6ictxr6umS2XXWXRzZwq7Pdj/q47omamMs1X9XDDLLwicCr6fWW8/k+yyTswoik
 nYura3K71hGtWx6MmeGjhmu2DBdlz1GkGi6vNRboDeOEwwmmStJyKudlWHevnKIizcTsiT
 EylB4bWBBualvUa6jEobALGp/oEInfLuYItmyZkAsAwTXav+jWI5fsXPHgl5+Q==
To: "Sajal Gupta" <sajal2005gupta@gmail.com>, "Song Liu" <song@kernel.org>, 
	"yu kuai" <yukuai@fygo.io>
Cc: "Li Nan" <magiclinan@didiglobal.com>, "Xiao Ni" <xiao@kernel.org>, 
	<linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com>
From: "yu kuai" <yukuai@fygo.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26af3c212+c6db65+vger.kernel.org+yukuai@fygo.io>
X-Original-From: yu kuai <yukuai@fygo.io>
Message-Id: <ec20137c-0261-4ef4-8b23-a21b2a129a6d@fygo.io>
References: <20261102122430.39209-1-sajal2005gupta@gmail.com>
Subject: Re: [PATCH] md: fix use-after-free in md_attr_store()
Content-Type: text/plain; charset=UTF-8
Received: from [192.168.1.104] ([39.182.0.55]) by smtp.larksuite.com with ESMTPS; Wed, 11 Nov 2026 01:17:05 +0000
User-Agent: Mozilla Thunderbird
Reply-To: yukuai@fygo.io
Date: Wed, 11 Nov 2026 09:17:02 +0800
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261102122430.39209-1-sajal2005gupta@gmail.com>

=E5=9C=A8 2026/11/2 20:23, Sajal Gupta =E5=86=99=E9=81=93:

> md_attr_store() calls sysfs_break_active_protection() for a "clear"
> write to array_state before it calls mddev_get().
> sysfs_break_active_protection() does kobject_get() on the mddev
> kobject. If the array is concurrently being deleted, the kobject
> refcount can already be zero, which triggers "refcount_t: addition on 0;
> use-after-free".
>
> Fix by calling mddev_get() first. If the array is being deleted it
> fails with -EBUSY before the kobject is touched, and if it succeeds the
> array cannot be freed until mddev_put(). The -EBUSY path no longer
> needs to call sysfs_unbreak_active_protection().
>
> Fixes: 9e59d609763f ("md: call del_gendisk in control path")
> Reported-by:syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com
> Closes:https://syzkaller.appspot.com/bug?extid=3Ddcad997ed2b5bd95cc5e
> Tested-by:syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com
> Signed-off-by: Sajal Gupta<sajal2005gupta@gmail.com>
> ---
>   drivers/md/md.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
Applied

--=20
Thanks,
Kuai
