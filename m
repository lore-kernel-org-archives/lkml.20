Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788129;
	b=2c2wsxC9hSv6ns78I5GjML2zjgh9jA5MD3RQ/vcP68A88E0EJ837kRbm+ULQQdy/bJmC
	 72aKviKz47mOUESj90ozZYPKDO8045a+R2gCe67qCJ75JhrKEIvVwcAqXYAdq9eccM/UL
	 OtG7Ogn/6R/qUNIrTTWtFqREkYsS796YJqF1PxlAWl33qZZRCly3A0bflAZlUni//qU1y
	 ty98KaqcEAn6EDQrmS+FthHz9/dbhaCUEPe/29MvXA6pjmVxd9jJWJc+zJt4k7N1mIvxY
	 ahfhvYi/OqG0A4nmuOR5Ns1MOcd2MxOhcS0GSzFYIsnmPEjf0XkIAw3s9K97Sa+mAtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6PCVir3npc/uS+4yLjSPNS2cjSBLb6KpsRqgCKleykM=;
	b=hbBPCUKvUuioWkzsLv64pj4iOv2Ip1/CrPVi86M6Nd40utm+HtLYq6rcKcz9LJJ+AzSR
	 R/FNV0aEdtgQ//BqP0vofrEabzb4VRuhfZT0hutsAVauRKQDKDa47a4+mYmzsE/8SYimj
	 B8vTHOofr4SB2Un8XMLgDNyazig46lOEMo2zREgXwNsin3Res80pHnwpT/RN09BNJL5ux
	 uOdTS59f+ViXYV6ebO4YiWDbhUDEqjOHrsjV1qBk5OdLgvGowILNfAqmYxVUYzJFYVvB/
	 cLQUosajgIR0OHvyfQfbgvhuLTGAklGHUGwUfLzlhDzgb3ys/hg7KqE/Q6kBNMtJiJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wJ4TYCH2;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5745606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5745606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wJ4TYCH2
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so9097305e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788127; x=1793392927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PCVir3npc/uS+4yLjSPNS2cjSBLb6KpsRqgCKleykM=;
        b=wJ4TYCH28ARZj3dmJxVUohrPxY5RKX1Kuc/zNHfUzZQGJzsKxHQC+/dVLBtcfifk3X
         FnyFJ5rQno3hE2EO81iWdZL9ql6k/5y+r25vqKRqrBS/dXKjkWe0l59LpKAnAr+WhvrT
         cqUEimZlhBVoS8F97HCV4IisScb0ypbECnzkHe68qlThPBa2hpeN92eBAzUfXeXW/Ezz
         bbjAEoyyTqimOjMGwg4qE64jRcP0ZOosOP+vYHnLrHOlHP/MICCwEIskNA14S7QutRYQ
         OPtEXFJjN/0epur2Kewt6C4PoroPFSH+LcMFYFc8mwXqgZZLKO96I2R6sBjGct+UFbSH
         j4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788127; x=1793392927;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PCVir3npc/uS+4yLjSPNS2cjSBLb6KpsRqgCKleykM=;
        b=CyCEJSPRlLP084M2V3zyP/TBPt65njx6s0gROl8PCw+VC0wdWJYjy29RfY6eQuX1p/
         XMvleSuHLzoyAQviYweJYKVmhGdVDmiASdWgWVIus08+l0WVwkh13y7FGwWDgQKZrp1+
         cC/B3EwaBFegqCPhHd2fiGMMLuJLU3w6iBGQZt/VrOqlKM/Y2IvwRloic3C95Lvggbv9
         Txg/UYgD3B/nV5BNba+AKF2p2rO08WDCKHEkLM/q+UrwhPIpEhwoPBO5M+5Z4aWzQsws
         R5ShRUpziU6NhFeZbUsVm38rmLroh3ZKgvVbnqYpKEU0j1hInWrWOhZUAchB2AdGU+62
         3QxA==
X-Forwarded-Encrypted: i=1; AKwUvBxf9zMRKmV4gECmw72IfhLPue8DXRLjBEGSJ9b5pJQCbkCOpQ//+czWa/seKOIEoW9cS8ISDPK8BKezUxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwhGofpkFdphFb1tt76x25UEuFQAQ1mMyA2eVM4FNmCpFLa/mE
	R+k+jgNIc4/4n/1NB+q1SqjR1adu1GnrhhNbNhogN5vqYrX/qeXDeKWFqav5OkYVTyA=
X-Gm-Gg: AYBFou0soildRRXFx1M64NtZ6p6LUqF2J+cf1UNxcHpnYSs01CyGO8KmWM4BY4WvET8
	rB00R3p4ixBUFaxzFtN/bLwirawaQLTal5xaKWDyzSDOjjxwBIaZraNwetdMFgmobIJ7ocqsxyh
	UITMgKBeECK1W15RAkkxesFXTqDKFwRezOJeaz/6UqGV4oqkiauuteYNTkkgEkKMJAn3yAxgOyc
	LlcAZoMYWWG0PfOLCLLqdORstRcbzpvL09StncsJPGbXCUwWHectKMEIZGp2uz++fpdTZXX5yKj
	HLzemgrWHxtJKRkScVLLm+Xhpqj1FsfdVYfNP/TFYQxLCuCQoOU1tfNWBpGYLKr9HRLoDAcizgK
	i5vmPl4pBMI/OH/XyBiu3yjA8C9Tew0iS5Jl+1Q/tEgZXJd1wQKxxjkRQGfeRFokoVl+IHMbGwi
	FEqzkwtmP1wsDSctKfSJDpvO6/zvkecoq7dEaqyCZ4Zny0hQrrSjQTDtYH6Zp8ZsPLJOm/D8tr6
	/v4mi2pA5rOCC6Ry3WAVDuB6PiSh0CVUZjjSYRO7FF3ofik3q+nABh28N3vgZMKssJK4pgEqwBa
	JPX7tKNp8Vs=
X-Received: by 2002:a05:600c:818f:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4a35acab86bmr610025e9.29.1792788127005;
        Fri, 23 Oct 2026 13:42:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm7985305e9.0.2026.10.23.13.42.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:06 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic X1600
Date: Fri, 23 Oct 2026 22:42:05 +0200
Message-ID: <20261023204205.48222-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600 reports PRId 0x00d00000: company Ingenic D0, implementation 0,
which cpu_probe_ingenic() rejects with "Unknown Ingenic Processor ID!"
before any console exists. It is an XBurst1 core like the X1830's, which
shares the D0 company ID, so handle it the same way.

Tested on a HiBy R1 (X1600), which boots v7.3 with this.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 arch/mips/include/asm/cpu.h  | 1 +
 arch/mips/kernel/cpu-probe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd21f..ff7b63587daa 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -186,6 +186,7 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
+#define PRID_IMP_XBURST_X1600	0x0000	/* XBurst®1 in the X1600 (PRId 0x00d00000)	*/
 #define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
 #define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
 #define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d49..e3b547307c77 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1769,6 +1769,7 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	switch (c->processor_id & PRID_IMP_MASK) {
 
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
+	case PRID_IMP_XBURST_X1600:
 	case PRID_IMP_XBURST_REV1:
 
 		/*

base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
-- 
2.39.5

