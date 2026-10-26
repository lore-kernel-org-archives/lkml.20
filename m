Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979990;
	b=n/GsRby2m4JM7jmKPaKKl2gG3IMPvbkB/qAi5ActVF/CbdiN9thubZL+e7n0b5qZAOKD
	 yAgXDG+kON75xEm8ebzNPqgEMt6nWnZlFiq9l0znaJRFzjDKjtRmyLnOm9pdX6HiTm4Wn
	 3kuVCzD1VACemzTG+SYBcZZcHcQMk50jbsXwRC1+t/qjeohpwlGQNCMAoQvidMIGh/SW4
	 yHq9b0cJJB4REzfBWTy09fkFuOLhe2YSnG278VPoKGgsmutmGHGA0+6pp+9xrrW4FO+Sz
	 ejyaJatFQusy+paifyGY4MxDaljIbmgaeFDPhZEFtFewWMLvzDVkhmg28/AgZ4ugizQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979990;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=iSbhqqfG3e76ofxeSYQhozA0asyEhHmy1/0BG1qOveA=;
	b=xjFXtOn33vRkh8jim59Y0XpblhzC0/FoFC74st8Eo/esTQmzU5ZafpUnMd9tq288kN5l
	 xoa6Z8w4XSfqaBCu/4msouRSIxYXYgiLwEwC8y+eYRVV555/ZFvNlB9sKZujYHR0fnUQ1
	 GBRWhpj72Cwb0LdU/YjGmxCACEeK1h60WWfmBj9+/+onWxoTTTPuKK4SbYkaQmjapI4AW
	 j6lxQdE+0dvfHZ1HOFGx6bYi5qtOXJTdRJV3Kjat5i1YJR9yS6KmjixQ/B8Yim+VU9ZPu
	 DU3qwTYiyfJ5+qn01gqRlhe599ZZhvxx8wOdr91xwBw7ChhkHft2K/a8tviNcEMg/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=nsMj95tB;
	arc=none smtp.remote-ip=202.108.3.18
Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn [202.108.3.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86CF606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B86CF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=nsMj95tB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792979988;
	bh=iSbhqqfG3e76ofxeSYQhozA0asyEhHmy1/0BG1qOveA=;
	h=From:Subject:Date:Message-ID;
	b=nsMj95tBEgMzhlmZZcUl7A/Z/5KfNIsWG92kkYmYPKEd8xSQSNXrLkSlrdLqU6KL7
	 7CtnvTcq/tfMrLhTy1x2suyqufQnhdoi6MbrYooNteby9hCYxpdkRC0pqqjQMY/Fvb
	 6VSKO7X7zRG028vpyYOLfmTYXIni+CvkvH6axDEs=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6ADEB40E0000266A; Mon, 26 Oct 2026 09:59:43 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7312134456600
X-SMAIL-UIID: 9A0143A573B346929E6AC1560BFC77B7-20261026-095943-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [dm?] KASAN: null-ptr-deref Read in dm_kcopyd_client_destroy
Date: Mon, 26 Oct 2026 09:59:42 +0800
Message-ID: <20261026015942.167369-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6addec28.412b1182.196980.00aa.GAE@google.com>
References: <6addec28.412b1182.196980.00aa.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4169c9c90532

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..b562bf59124c 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2544,6 +2544,7 @@ static int cache_create(struct cache_args *ca, struct cache **result)
 	if (IS_ERR(cache->copier)) {
 		*error = "could not create kcopyd client";
 		r = PTR_ERR(cache->copier);
+		cache->copier = NULL;
 		goto bad;
 	}
 
