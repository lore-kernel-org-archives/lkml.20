Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899874;
	b=cUE6d2Cz/lQ/Bdgugl2gr5ez2Jh6knxkJmtxKEq4nXGoCzFYWHkbaDLTgyUupom2es29
	 gOhgomkO/LkCp8Y7sgWT4u1wtABlPCApJqDfo8ni7cN3ihAvOSjvYjF6LNjSgJgRaNsZr
	 TVU8c7LaF5DALwXQflcjVCwiSfDyNWGkh2Fw6mxlcH5YiAVmF3XHonEb1c+hAd5GyzfvC
	 PTYTZ4bGFktNwlHFpZg3ePifFnWlrxVnT0Mje198iCU3RpNpnLzIgOLP0u3wLBUtSqq06
	 q/soriZq4+VbsnVSrVl/3o2jNvsvp4NwtlRFjBOS4K87+mauP9H5TdhFnqgViZVLXng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LFDK+1ulkRfFlkLwBfdTjH+FHi2P6fwT2yU7wsIpXvs=;
	b=YcsBdGYagg40Ss+LRQ3oDGx0Kjo1s/1HWG3/tTrh41jJt2kTzi0l0I0N0B27XJ/4yebb
	 X1c7+S//rq9tGJrCRvbOpwgFnHknFP0ETM37CvWRl+/oQ7l5+PFh9eMaJkvvIS7J1phAp
	 AXRb2Cx+Eq1eXt26AuIO+h/6OPnFcB4KZF9lg84UfSbDaxWTEsG9eLCKOHR9wKyYDEbyN
	 NRsINC6XNTbrtw71+H16rj61t3vyW1XWUOWB06KoGel6y9iem8XnortIyV9H3ZoZTa/KF
	 PonHpKTXQ9PAuQCVIpgr0PAxjXG7ruKX69ilainB14mqg1VXp8YDKyrZ41W1nU0pgdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Vw2qb8eu;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A5F606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A5F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Vw2qb8eu
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9eb579c0eso10514465ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792899873; x=1793504673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFDK+1ulkRfFlkLwBfdTjH+FHi2P6fwT2yU7wsIpXvs=;
        b=Vw2qb8euRlJUMv45mYZE9Io8oRd7Avf9nw74WzUdB1H/4vBSaXMrLJjfphc9q+wfya
         sFdmWtZ/ZANGnObXe/kZiRxWie0Cl/PvMqqXrmKT5CJTBND1p83Pn/55Zi35T1UF+BO5
         5qPNXgM7l/OmB84SlIpdL5CnFJL+Sf8LtUmF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792899873; x=1793504673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFDK+1ulkRfFlkLwBfdTjH+FHi2P6fwT2yU7wsIpXvs=;
        b=p5aXuAjCpThh4x8avX47ZdXoSSi+zSxaQsFuJbrKFNVQzH47Mgex6Jd7GtT1zpwisw
         kpYavPpVc312fmC1d9iyjCFOIwmvarEcmdqdJSq5fqIBp8PDavXY/PMpNQOKdGa1p2uU
         iNyJMdd/HH8RwgGqgxItXGRVQcOdi7WtniB4UE8IoqsXOS5A6srpgWCRsKtY5dC6Ys4H
         3rSG7QdnDBp1lvL71btBZi1C5VjtRUelPEYICom1pAMDtQsx7pTfaAl9HAi+oR6x7jkN
         CV1p/51sANKOuC/G8psQk2CpznGGAAmZ9TI9rNqqZSy+r+wVUwDilGwkmdjfymMztz6i
         e+7w==
X-Gm-Message-State: AFq9FYJvQ7QJ5CfKuEv9Vtj6NeWUHVKgulLVkF5sCaoN8QWvFapVYxff
	tDTKISRJEEgsmkcrs7Bl4Vr+/DagPZoqtNsXZv9B+tCGMTFVLlViLVBqy9Nj3ep3D2U=
X-Gm-Gg: AYBFou07uz0mzh5CxUkzutvNhqd/1hnP6aLCLySsRntGBt52Es7VwOSE4NKppjF3cux
	Xt2OKT9KuVdTCNAWRshjDI3t5WHHKohMSzSZGibi+dHaF2esPBsZqfTJcLasGnl5iwrjp1KQcgz
	b+mSiaAFTn9ctZxrjq8Rz5E5Ss5frV5SW28tVpu3TNGXLZEZRoH5cZ44Rwf5cK7zSEzUa1C+pmd
	EnC34l6ZBAj0pqEqLApv/7l4ugoeFwmSAi1Ahh7qUmpmKTD2Ii4dJsvnC6pILJG132we4F8P2hx
	hgEcG2hSXuJxgsIJm359vMFr0AI8LO8QEG3sjwv7R4IfBdHdf+PjKopT18XLSCcZBXbcngcl9HG
	Hka/9KgzE/MdrSt4vxEP6Z0BxNYFgFOJDCwHe8Lic64N8HYY3XUwv/MiQSJkf7RtSpspM1rMuil
	n2cPvzKuWhQ0jvAxlL6esTj2fAoxYGrx0dU5BoaF5/ygmnrUFWm44FbGiUx7j5mZd9ten9MwBDl
	JCAzFZDBA8H9+qa7YmtbbWVKY6p3qz+4JoJj9QBrlGF60ThUTNK0bj0GAkJQ/bGx4WW6iqZKVgn
	at/wnMi5njQr4lU3FM4=
X-Received: by 2002:a17:90b:4b05:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3adeb197eafmr2837181a91.64.1792899873454;
        Sat, 24 Oct 2026 20:44:33 -0700 (PDT)
Received: from shiro (p1469046-ipxg00b01sizuokaden.shizuoka.ocn.ne.jp. [153.223.97.46])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm4181927a91.8.2026.10.24.20.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:44:32 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linux-sh@vger.kernel.org,
	linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Colton Pawielski <colton.pawielski@gmail.com>
Subject: [PATCH v2 2/2] sh: landisk_defconfig: enable PATA_ARTOP for the ATP865
Date: Sun, 25 Oct 2026 12:44:10 +0900
Message-ID: <20261025034410.808796-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025034410.808796-1-daniel@0x0f.com>
References: <20261025034410.808796-1-daniel@0x0f.com>
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

The landisk defconfig currently has a similar but incorrect IDE
driver selected so IDE doesn't work out of the box on the models
that use a PCI IDE controller.

Select the right one.

Fixes: b7aaf16d10bd ("sh: remove CONFIG_IDE from most defconfig")
Reviewed-by: Florian Fuchs <fuchsfl@gmail.com>
Tested-by: Colton Pawielski <colton.pawielski@gmail.com> # 3x LANDISK
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/sh/configs/landisk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/configs/landisk_defconfig b/arch/sh/configs/landisk_defconfig
index 2b7e10c9acee..6b5ec1f3ad71 100644
--- a/arch/sh/configs/landisk_defconfig
+++ b/arch/sh/configs/landisk_defconfig
@@ -28,7 +28,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_ATA=y
 CONFIG_ATA_GENERIC=y
-CONFIG_PATA_ATP867X=y
+CONFIG_PATA_ARTOP=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
-- 
2.55.0

