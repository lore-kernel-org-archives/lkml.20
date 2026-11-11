Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367679;
	b=lvtRanA3LmZ0U2cUGR5g/4wQJlOzzo8KJxjYKVG1lbyiUN9/Rlvu2P7cOo8GsgZ72703
	 qivmJiEXagkLDpIoS//33L0f6gTsNn2DHwsePsX7IET1sgwCj3YERLRPEi+tZEmUPuEak
	 cXyU5PD4H6ju8v8h0obDryMF2QH6b7C59ESY5m5OLZJFfDag6NQjRkmAwgLpBX6+M/Xgu
	 rHX22LlK2ryGhpMdpvn1MjpTQGpJg7NjtT1ak0tP1ttrSBPpsOKXFRfc4XnXwDh5NV6me
	 v7q17gHSlCVFnAcxioD5poKH3GlMz/X4SrC3MGs5HUAV/BEdKUr7reG0PEsaMM0L+zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NnXwX3mhbFBCtPNDjVP4JRFl+h/k9geedy1O43m05/8=;
	b=RXrnmVLW0nuoGAH4ZhzYvhx+jA1Xd3f/8OKFIF+TbcgPdqlyKDKjOlcX1ArWT+sDYIFt
	 VOzVkcFXqGnP6aZnnZJppI1siU6D1pkV9WYbHoWj4X5FD5wL7bLUeNRjQ/mct7HUBMJwW
	 oR4Yjbm7puURp1kzfsOXUdgpeA1AOakGO7zqQUX96BjJJDbyQfRAVAB+UBYtesQhRomYP
	 Qy891IM+yEyfdagxaSXeXSQBp42GCy1fg6pavwrhphy4aXbHDYr+1pRBcF39Jnv0a727x
	 hZTkMi2fLJm+ZeujiJwsG5Yn715say5m19ECayFQyxRShI9O2Sp8291CaCFlez48uRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7Yr1kXW;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2211B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7Yr1kXW
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso289456eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794367678; x=1794972478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnXwX3mhbFBCtPNDjVP4JRFl+h/k9geedy1O43m05/8=;
        b=G7Yr1kXWbesBwpFdZxtyKSaOTaPcCqab4Vwc9kB5tcK7PIA0OTosLbaJRrmXvpwsvy
         hcm36lv3wOZvjpV9buuI26VHBIfDEp9vXd7DPkv12CrYECDocIWEJNp2e7QLnI64wtNj
         sDKBTkgPOwX78JeqXlftRRouzqWW/X4KaeaRnm3o42wHWPXt2cXOL8HwB5v+ykJAK6ie
         PvIudyMmSMWa3zSsHdqmI8KwSkinUGeuBkDfZtZDaZs52ZgxxXR9ow778MoMBk+vIKiy
         4T/RQeJT/Vizec+IbKM17Ly/Y4MUyqlliHkqL+lBNOJu/wuJhuaBHnarboElTtcpL+xs
         ZI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367678; x=1794972478;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnXwX3mhbFBCtPNDjVP4JRFl+h/k9geedy1O43m05/8=;
        b=ayzRfD2PGe8GgFj2HH1FRsbExWDlg/7o5JRBy6ZkNr2Duqf2kVZvZVOqK9prB23Q4d
         2aBf+tSPT+T4jbff9jcnRnUU3cd4wp4/DXYGM0zF0fjdS7pegQDK0BrPuEuHC50vJavy
         OUdtaR8KtUvm/pV1Iyea8ZOj2RXXeBBsvk1iXnNrfC7OL4D+iwmjz2ve/NT+/3DeIftC
         bOve9IOA8AuU/JZqn2Y5mk2Ash6teljm4hX6wfmNheWEsDYVaUx6/3OqcYH1FHsXVqnj
         by6d6p/yZWbViiOtQrrpD7jwYOddrEGhkdsoSoz5QUWAqAQ1ZcHhs0sbahIQTpTyn0lu
         J/Yw==
X-Forwarded-Encrypted: i=1; AL+hErHCHoauBVN1deaFxMQbXWO9hAMsMQKKnAZOazR2y7UAFu8j5XSRJ/CSs7W8pfOjubOQm11U17IPtrUIK9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wYn2HWeoXhPqgcAaQsUaevNtFsKtO3Zh3EAnBGIb6t3+/1ali
	2jhPLr3vXBW4xg9UJEWz73HmDNHkNR4K0fu2xS4kciNAJYITBSD9ouK4
X-Gm-Gg: AYBFou0Ygy2Bn8+Rb+YjvRfqXsg/q7pODHd2jktSph3uAuceTXYoKJsM9NyGJeDoGQq
	euMHySMi/BxYwmoysWeCjFwVmf8Ofac2yDkZd/K6jC/nvyun1IBN/M+D1GMLybKN049TWztZP5K
	mfxJJh998HvVkoK0aKAtlB+TXE0DRD5qK6KEjN8wpn7BeHG0pm+vsaKsP2mwoIVwXg5vQ0L0TFO
	tZpeo8Ze0OySJwL4rHTCH7VmmTlF5Nb17PSvWy38wOjncdTXVRH7rVfuejDoe7BxShC3dGYvImg
	DFCPa/rYbCvnDJ+bxZhkBvWNQ+Ugj5h3dI7knLm0HOfuRyafKbFQ9X9Wt2I91ItYGylPiY4Bog+
	928vMdVpcrI5jHSUq++H8oQDghE/gNrx4pSqP9kK98PpWE5balYAUOKra5GPMJicu42expORxdL
	bHwO/OqlKqogTDFEqrt4V2D+h4fm2dzGJnJ0KODz5qXoFI8gvCegsGE7rmUFKKOhiCMHErNFP0D
	XNUWpWWI27pXP2SN4yUEejWyx3qFDPN90Iev3/2b+qUu8iDXfSLqen/WmzN/h780D5Mi2ODWCxi
	CNHVv3t9LP3kQodPP3Y/dENPQ0wcS9WqvchsAPuDcRdKivOLZaBq
X-Received: by 2002:a05:7301:c011:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37683a53694mr1662811eec.2.1794367678022;
        Tue, 10 Nov 2026 19:27:58 -0800 (PST)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm13113892eec.14.2026.11.10.19.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:27:57 -0800 (PST)
From: diasyzhangqing@gmail.com
To: Jan Kara <jack@suse.cz>
Cc: diasyzhangqing@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	syzbot+d4ecb9a1e5b3dcf8baec@syzkaller.appspotmail.com,
	diasyzhang@tencent.com
Subject: Re: [PATCH] ext4: make concurrent DEFAULT shutdown waits killable
Date: Wed, 11 Nov 2026 11:27:43 +0800
Message-ID: <20261111032743.549426-1-diasyzhangqing@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <glup36pqwuh2wsxjozp3x4kne2spsud65ftlw744p72hmh54mx@hi2s256gr3iy>
References: <6af1e75f.3e87765f.91969.0010.GAE@google.com> <20261110132118.11265-1-diasyzhangqing@gmail.com> <glup36pqwuh2wsxjozp3x4kne2spsud65ftlw744p72hmh54mx@hi2s256gr3iy>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue 10-11-26 21:35:56, Jan Kara wrote:
> Err, no. This is really syzkaller self-inflicted damage we aren't going to
> work around. If anything you could make the wait on bd_fsfreeze_mutex
> in bdev_freeze() killable. That will actually be a sensible change and
> should address syzbot warning as well.

Thanks, that's indeed simpler.  All current callers of bdev_freeze()
(the generic FIFREEZE ioctl, ext4, ntfs, ntfs3, xfs) already propagate
the error, so only the wait itself needs to change:

---


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
 block/bdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/bdev.c b/block/bdev.c
index f20f91b3176e..e57be2320423 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -301,7 +301,9 @@ int bdev_freeze(struct block_device *bdev)
 {
 	int error = 0;
 
-	mutex_lock(&bdev->bd_fsfreeze_mutex);
+	error = mutex_lock_killable(&bdev->bd_fsfreeze_mutex);
+	if (error)
+		return error;
 
 	/* A device being removed from its filesystem refuses freezes. */
 	if (!atomic_inc_unless_negative(&bdev->bd_fsfreeze_count)) {
-- 
2.43.7

