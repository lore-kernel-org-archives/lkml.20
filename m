Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392730AD1A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321817; cv=none; b=eKI8oGNFUTQlUeBsAErcYFDgRDf1LKNhJgDUDVw8jPbITHLwPZegGWgTsGaNKQosWDAUXMxGeDFoz+USB1l78OmxuiLdRCQMBBkL9s0gvy7cKARQ+ftqiDpLb48A0ZZkVYupkrhWSlWv23lVV3DDVPe1tI/FRbbyl2Xz2azxvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321817; c=relaxed/simple;
	bh=H82uNs05rcQXiusDpxHLDjWxrLTVCIzBWcYLtZSsnyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdzYHeICTpSdJ92Y5MhTgezIrRqdd1qXpQ1xjCsUfW5pMjydw1ZgXiusXZ5K7OpPMHRtSHOBy993OXg0I59QdnDYVWygwzkREQvp2pfcDxPUWMAEJlwn9uVGTTz3BKhexb6RtLmH+rTlaKVI7stUcpB2rbJXKkZpuFRVRDN9Xio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHI8dRAN; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHI8dRAN"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2cf49dc298bso4153045ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321816; x=1788926616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z732JAXycq9WRUoUJDAwDalT5so2OYem8jYiHVfL/3k=;
        b=VHI8dRANLux1r6d9cZzKLYL+/7ZXJjbYVOk/kzEgTYcORdHWp90axJA4GtH9w7QHNk
         F6GrSKXsGfUf6UGTCoQvI0ppuafaLYxCBNKOX3QAw1+U4jKubVcf/XJCoBmJufa9CJXi
         ZWWyZVgzjTvZUpgz/k4OOlf2RuZ3nUmCTBiy/+ueaAfSshC5hRGjfQ/dzWMFSKkuKKpx
         UN+v7ZL/iS5ysFPJYSYfVcz4B1OZPRI/Cn81wEfNBDz1Tss/yc1+5Aou/eVC9PfMJIf4
         I1QnlSkij+sxSw7SIYykg/duiQNWHPKCenG2mDoXSlduAojXyW7F2yooFXkREKZQ1908
         SesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321816; x=1788926616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z732JAXycq9WRUoUJDAwDalT5so2OYem8jYiHVfL/3k=;
        b=Z+c4di0CgLPPzMzFZTFGfAtetG12gFUftMt1f8aC4pY7A23zbNvEPR2KRwBeHYuxUH
         kdyAJVC3/RcbYW7nu6JzSRjA+Z/1hr1fhKPr8dRCMJkkrV67li3I2sNLLrU2hkUezlYR
         xZK7eAQYWShH15nmdKngxozhEji2/T03zZmQNujhguJHj+bvGsdums13SACUhbLr6tGw
         I3XTLektjHcKl2NEEOiyz1lmuO1Sgj7PzpLsHQM9u4b42tImTABsOdt95Gnp8Zp3T8CS
         If+xyFMUSslzg3qAC0ghEBreyaDnkDzJLHVns+J2hRSBH1usSfOhgCnFHZp1+JGJVrd+
         lD5A==
X-Forwarded-Encrypted: i=1; AKwUvBwo7Ov4S4m6/tCAnsz8/koyEsPN4Tm6NHlzHpFOi3vRPwHkW5jtHhH/Pwp1yCh0y6gVTFaKIlvResCOyTk=@vger.kernel.org
X-Gm-Message-State: AFuF++n39IIyCG3sIywIvx21YymwTuhBsWcZKeBdfd4ub88mdjHXKuGX
	U1SZ7Qpc9Jyn9FdMCrq0FVBqQzQUsNDT0YEWvvUbjIN8rin+HRPCND/K
X-Gm-Gg: AYBFou1O7rG7xXTJnWW4ctgVx7DT9tbIjK/i1yf2t/E60JZqLoDEZ25Kvm3V4Ghvjka
	vNaHUOFH/9rhZTd4GaE7ZJjgr4MaQetiirA2Q/lSqp52Dxe3X8O7WoBIKX9G1H8eqFtyx2dks8c
	5xTCZJXQcQ6kmrP/0xkx2Q2sNCvye0EfUpBft+Z0Bm8ECoG0izBf2f3MfbsFcFrBYtiZeTai1MV
	Pxqk9RCE881VY6PLp7ARttaL47qUsdVAzwTJdBT9/f7CMlNE4czeiEctbMTJF6MegnSC4MztWRG
	FFcAbNeci5KiTN6D2QihhpEMhXgutuX1NGcMDQnJ6QBMYKQ/iOOiy6kfDZf8I9l4fL2C7EmrARl
	DKoQA+3K3RrPHbGfY9+S29nqPazYTB2jtGpWFp92CeP0F8LExCVKhfDu86HwQH8e0+YfrWPzDw9
	+zBRKt7eZ2dwxd9WeF3ACYVBM4fQDNqEvCEpBuEWcBeJYrSjLTZ49yT95GVg==
X-Received: by 2002:a17:902:ce84:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2daec43ee8fmr24850995ad.0.1788321815953;
        Tue, 01 Sep 2026 21:03:35 -0700 (PDT)
Received: from fedora ([59.172.176.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4d5e8esm5930125ad.81.2026.09.01.21.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:03:35 -0700 (PDT)
From: XingWang Xiang <v3rdant.xiang@gmail.com>
To: mitch@sfgoth.com,
	3chas3@gmail.com,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	XingWang Xiang <v3rdant.xiang@gmail.com>
Subject: [PATCH net] atm: pppoatm: reject duplicate backend assignment
Date: Wed,  2 Sep 2026 13:03:20 +0900
Message-ID: <20260902040320.4007552-1-v3rdant.xiang@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pppoatm_assign_vcc() installs a backend without checking whether the VCC
already has one.

Calling ATM_SETBACKEND twice makes the second pppoatm_vcc save
pppoatm_push() as its lower push callback and overwrites the first
pppoatm_vcc in user_back. When the VCC is closed, the outer
pppoatm_push() clears user_back and invokes the saved pppoatm_push(),
which then dereferences the NULL user_back pointer.

Reject the assignment when user_back is already populated.
do_vcc_ioctl() holds ioctl_mutex while invoking backend handlers, so
concurrent backend assignments cannot race past this check.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: XingWang Xiang <v3rdant.xiang@gmail.com>
---
 net/atm/pppoatm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/atm/pppoatm.c b/net/atm/pppoatm.c
index 6da52d12d..93ba22f43 100644
--- a/net/atm/pppoatm.c
+++ b/net/atm/pppoatm.c
@@ -396,6 +396,8 @@ static int pppoatm_assign_vcc(struct atm_vcc *atmvcc, void __user *arg)
 	if (be.encaps != PPPOATM_ENCAPS_AUTODETECT &&
 	    be.encaps != PPPOATM_ENCAPS_VC && be.encaps != PPPOATM_ENCAPS_LLC)
 		return -EINVAL;
+	if (atmvcc->user_back)
+		return -EBUSY;
 	pvcc = kzalloc_obj(*pvcc);
 	if (pvcc == NULL)
 		return -ENOMEM;

base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
-- 
2.52.0

