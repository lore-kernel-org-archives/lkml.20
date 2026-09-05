Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D72DF134
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568567; cv=none; b=C58IUkt84pXmFwvkC9+0w1JMH8Egnaqt4D/VVG90ZzHeweBz3HAurx4E/WuA27DmsPr+vI18lcvUeVBC9de/wJ0nLVY8r2irrQ4CD2Y4guPNu36a/P+w8HxOD8PtVxrND/iKHrLLUZhogugh7onTl8CP8gc6PY1fC2Z4eTmy0IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568567; c=relaxed/simple;
	bh=4ocR7EIzawTfTG7p/inFgc30YXw4KjBNKt9fYUmExSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rlGpcTMl+V24LJ6T5emxKJoCZi4aGCsd2Er6NGyYkvxsTGLGxo69ftvpHcV/B4VBbm/vwemJN0J2aoOlbPOUuAj4OyKGGYyITzlriNTBp0nwnu88/IQK7hfK039jfZgcyjV2ymXWGKPH3EU5o87LSTO72qiv1Ekw2wPJBdKHAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svZS+au8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svZS+au8"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1649143a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788568561; x=1789173361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD3OLCMtVZNmVhZuxqAq1q8x8oye3KoraYKv1uY4dv4=;
        b=svZS+au8HnLlsqOl0KVxOqPanEvmr5rMmdq72mQzFkomkr7dV/SlMEdiWViNW3s5Ex
         KpkRhpBwnJqrOjVJ+i8GJKegqVgAyCwT7cdlhtHZBJz9fJC2zY00xsWb7vSCyuK5vsYP
         Sfsm/RhUvOUKqSt+tSgdQfDwKLXn4YYHGpAGoNmhXJ8zAK441v7Fw4z2QdE6rlbqWaFH
         pfKG8ylaIaIPa6536XQGstvuc0g15PK4u2hs2VI9AsDXRSQfmRTQPr5/JaZMdZI+b81o
         GvHumgbXV9JVmRFd0vmMG2V28i1EqQU7w93UoYXvqnMy9LJPDj3Pxy9DcLBG7yTyDBBB
         SKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788568561; x=1789173361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD3OLCMtVZNmVhZuxqAq1q8x8oye3KoraYKv1uY4dv4=;
        b=Ffdiv3UQTSAY5wXEfEo4nD+54hhB9uI/QoF/n5Mlimwem+f3u66edA5LOfR3Uh4OKg
         hQse2/fF5wfynYK5syNKEEcoSivcXygqo180i2ta57C2SYiRTtqy9ZCkjRd63re3vMpc
         eZSRP2rtQxclHkw0CK4tbKh/r16eM7qd7w/WzlrCglNFHQiCdjBX+a63KEGtzDeH05za
         cJTTHcR8IZXCJAjoOli4lh4mtPR1Tk23Rrf2A0gr9JH4wUw3xQmzgbIgsP7nEz6X6vBs
         IJdW4F/Dgsd8CrcFGrKbVjeFwVBiVS840/7jm/AYd3pVVzC7sQRoqiI7FdSkpyDDxdZw
         LzOA==
X-Forwarded-Encrypted: i=1; AKwUvBxvQ2Jgt16XnsQnuVlc4qHqCnrXC+EXNvg6/2YdrI2girNLJp/zEUFSRkRqFtYyz6iR69kxFVN+/6NirNw=@vger.kernel.org
X-Gm-Message-State: AFuF++mawa1HV6MCQsaKCP5huIfOuVVPBoo7v6w4hm329nSN98xZMn2h
	A5fFnQIY1I71OCDAjZKAmjcHnJzBYO4JWkpIECc4SVsmdK9Jp6cwSSDg
X-Gm-Gg: AYBFou1S/yDWDfuBaUfHUFGA7o2WEebE45q8RpvZczT0YaZuQy9Lf2YNw6nKqf/naKI
	xP9xmoSIx+IJDVm2WXMbQVAT1kjNx1kOi1JFW2Jhfgd+s26PftBo0NlNXt5VpxETzCe/YrKiN5G
	mC+Wt7v/bU14hlpb4yDVURddTPdgDdFdhnhoFsTMExRPhh1qb17Gx1s+e5w26CD9y2Z1oE5pwqX
	DAu4AZEpS8Kk2eu7zgOUAN6Rrqj+A3A5Wg10LoDM3yzxG/TxRJ+lrObAmxPz1UKX5tEkPF+kaTI
	mNWm7K6+JY7tODPxk2l9wxiQ3lP63dZHICfAEdlLcoEU3CYHNH7hSCUgrJqMwwsUP8zELg0Z3p2
	rSXA/mjuHe18NBXbUWwSw7irHOspaoOBrdvsIlp/V+Lag1MoetzHwPdPeUMcEfTxzTc+wT4wTlp
	+aWKvXi66ywIwxx76dOgOotC4ftWLYDM03aVUFdyQa/DSftreASws+2A5r9Uh0
X-Received: by 2002:a17:90b:50cc:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39b26202ebamr14823913a91.14.1788568561231;
        Fri, 04 Sep 2026 17:36:01 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:4132:9566:38a4:e435])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm6549744a91.14.2026.09.04.17.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:36:00 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH usb-next v2] USB: gadget: Fix UAF in gadgetfs_fill_super()
Date: Fri,  4 Sep 2026 17:35:58 -0700
Message-ID: <20260905003558.1686039-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gadgetfs_fill_super() fails, it's error path calls
put_dev() which drops refcount inside the_device to 0
and frees the objet. But the_device pointer is not
cleared, leading to point at freed memory.

VFS will then call gadgetfs_kill_sb() after mount
failure leading to put_dev() to be called on the
already freed pointer.

Fix by setting the_device = NULL during error path
before calling put_dev() inside gadgetfs_fill_super()
so that gadgetfs_kill_sb() skips put_dev().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
---

Changes from v1:
    
    Removed unecessary reference to syzkaller in the description.

    Added Reviewed-by: tag.


 drivers/usb/gadget/legacy/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..3e2bce7543d4 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
 	if (rc) {
 		put_dev(dev);
+		the_device = NULL;
 		goto Enomem;
 	}
 
-- 
2.43.0

