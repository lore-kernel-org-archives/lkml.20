Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606463;
	b=FpcpN2zaAlP29eQ36lfpgf+ZUMh0b8/zYkMEMmEYh9BRsVYVxyVGolylaSzKC0d2mhyA
	 eQBimc60PSPemUa+I6E7DqrWqLgzFanaFia1sCoqpSIQ6JLOi3Mst46QCciaOAs5PHyJz
	 aWwA9rtiQJElLHBBFZnEADKx+SY+QiG0bsw0zwdcqxA1Vxnl4sZC1GxWwO65wWc3zdBtT
	 GxM2Ti0+B1mUWwFMOoD9DziJRwDq/9lw6pFIDn+wmpRGxTqkh1L9Se1nV2d69o78pIO0F
	 ZtrCqMGBKn+3s2HnEwy1C1keWVpZFKBqOmza8Af59E20uJUABhqlbLfj2+395dDAl7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606463;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RzgtFaOMl3e++/4Mgek1F5K+PxJuljImpzeVlMGCTB4=;
	b=2hqz/1Upda3fMzmWt6cAWI0UB+BO35Xq8BZ+aPxbBEakHjiIH0QO54JF4b1OKq9LBhOa
	 mh131wQ1dwapzj6Py1mDn1ei4Bh8i1ZJzM1iF2jfIRlN7NWdBR5lxusux9NS9+CISSMyU
	 Z/aYk/5up0gfrgJM888XQeYH5JDZqXF/XyibBOymO7stBHtLSmQ1kRyZepZJUK+Xr7bMN
	 t6VqwyfKY8+p9TFqkOHutc6Nbr0KAOIIOrmFPvcN1afmwhooFrI/Ko9EbVrvYHiS5Rkhr
	 6pAnLVwkI3kyP6mM+U9dkchqQT9M8CwfZ1VXSuAXjk+BpCMSkocyLGn8cHnv0jLRGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=f0sCH6zL;
	arc=none smtp.remote-ip=202.108.3.163
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D75606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D75606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=f0sCH6zL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793606461;
	bh=RzgtFaOMl3e++/4Mgek1F5K+PxJuljImpzeVlMGCTB4=;
	h=From:Subject:Date:Message-ID;
	b=f0sCH6zLgkTk3kWl6411eQkds2pqFAIwR27wqBpi9twJIp5dH/iS2mub6urECBBb7
	 kl2ma2V11PDrP+jn4C0JUgbRQA0OCzD36LWvUWOu9ao5iAmyGT4ia2ZEUYu1PTX2Dh
	 0MM12xxoxGBsxqpRL6QCzfShS5cSzKqcNqK3EpCs=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AE843310000458B; Mon, 2 Nov 2026 16:00:52 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 9106766291824
X-SMAIL-UIID: 5E1A7E7ADA524944B1DE89ACE827168A-20261102-160052-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [dm?] WARNING: zero-size vmalloc in cache_ctr
Date: Mon,  2 Nov 2026 16:00:49 +0800
Message-ID: <20261102080049.417712-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ae61f5d.61c4c7f9.11e392.001b.GAE@google.com>
References: <6ae61f5d.61c4c7f9.11e392.001b.GAE@google.com>
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

#syz test

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..e3a202f0b08d 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2149,6 +2149,11 @@ static int parse_origin_dev(struct cache_args *ca, struct dm_arg_set *as,
 		return r;
 	}
 
+	if (ca->ti->len > get_dev_size(ca->origin_dev)) {
+		*error = "Device size larger than cached device";
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
