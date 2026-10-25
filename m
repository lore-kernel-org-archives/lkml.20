Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792913511;
	b=UrgDmP6n7kIuDpVXfxi8QtybY9yNIHjbgkTMhlSCGt40sa2Gpndml7vT6jVDV2pB4dgN
	 gkTTzRbr0xz+YeEM7CoJ+MdHa9RAPmNdHv1aJp/BqcK1a9BFnR403neYxxGL0c6WmFi0x
	 w4BCal4LB3Ww8Jj+fwHjHHEoM2OWUwX2BTQtNrwJC+BoioE46yYRx6XLFu9Kcl6O17dWR
	 ei3KsOL0TcRsuiA4VhtilZSRYh8MgxLyV2TjDtSM6QfFoi0rne/PhK/ORvPUYwA+YsYxn
	 gukui26k+ih8+mvQ/JBD13Gg08HUgcNPkcX6AQ+yZDNvcOyPt4u5K2wDtu/tcgbNmcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792913511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FcxHNNwYWKeHjjE84+HBT2CorhyixjN1OSIrgYoYL2o=;
	b=DJPCtBcWOpy31HEg2gy3kKkBfT/bJtwRm2iZ/HrSCl/CSSH0EEowz49NW/Nm3V0GVFc5
	 EaZVsrNotCyAxLNHVxGoe2MxU1alI+3SC04bpfiMNxFJhMkFRhnplj9ntVLc6YIL7L7hG
	 cYchv9cdjrnenoHgbjjeLLZ49n6VIVNKg1Thxit0X1OWV089aQURy31Zebra8XfybI2hJ
	 4LKhxXFrzM9f3Ngz2IDi9YVhFzxGBUwwunVcPWgK0TpKTkpKy/TNkuQGsKrL4IMouoo9X
	 d47vKX/1Z2RWubOC2Bxtk3YEaw2SxXbyqcFcBPC4EoJ6fuHmpQAUmVf9XXL/Ax53R0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="y/cWJBta";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C271606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C271606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y/cWJBta
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso21089825e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792913508; x=1793518308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcxHNNwYWKeHjjE84+HBT2CorhyixjN1OSIrgYoYL2o=;
        b=y/cWJBtadCDkUwIRpDUyDF5RbDvZLEt7trvtu32AONUpv2qtZ/5z8xKMdwnduPNzl9
         nqvJQEGOlpTj7aim32x0J0V8H7vJlfNwqOdwu3n1VNaRATIu/7a+C+6LPLH95n7ZdSxO
         u6nXz7Ra/FhYZpFB+i1fe/OIH2I0hnE1f5bZHROA0qIi4FZLqiRXVQK94y7c0coCLn1Y
         BclJ44/UVeJBr06j5UtqCRx6lb3b1Lq8KkYgEHqntYTLOxAKLHe9FHKPNSaYlQimlYzR
         dnFlr1Lxo2eFI0NZ5uVsO/UVugB6egCO559MjX2LORvZ0vRgsVPusMFHEZ7zWqRgvcv+
         mGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792913508; x=1793518308;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcxHNNwYWKeHjjE84+HBT2CorhyixjN1OSIrgYoYL2o=;
        b=XJTVdL8RLXVb3VwFa7xwU52MpCjNAVaZYfVW7uBPmCFg6sJeepemWeHClGpPs34Czs
         l2cbQ73GO0m4RxYSP3WotMYgy2OQvIn6k5++4oMM+UISuOZpJb4mGkJzxT4T+CHHNVrl
         ccnrL0XmG4Imc6LtB8EdMNFSuE9kjFODiMsUT0LK1mJJOJXFKoa0Hc9/N7xCj4U7KS2L
         ECL3HTnkHMut1G6YhcMNXqBQE3GAfYkEGdjBBv3p3i2YD3Yiw0GLSFQWc6hQj3h3ZZ/z
         GX57PQZ+ZKgO9QoSTVPw5iUPRr6m/38zu/LTs717gPvApfYNfAhJlUGKszGkxxhAXuPj
         l3Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxdi+R6UDmOZ7DUja5UmPMwNZffd2OkRDPzTBtJ/OMe4F3ugcpa0/xjMWlBVDz+KFJDZXJ7Mj03poKFGWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx8+IYO6owe624hc5m65oqW3Ipxe7Jelb0MtCGqj4Xa/12o1Do
	DzcJeLKo5LyrxLsiQNGcAGdaf8T6F6jG3mN0swsmr7lnKiYSlBpwtex7zuExYuj9Ah8=
X-Gm-Gg: AYBFou340su4RW/8P3kbJ43tFH2c7aEnV/5bMrFkHF0L+J7SCm7Gl6Q8xShgzEcKK2f
	7X1bKXYWKPJK0evEYSxTJRNgXTXwfy7xX9oVhXHL1j/shjAOnRySzCsQxU3WrxoSRO024/EX1ii
	nkUEn9s+U2Dixf57j6tQvtldASgPLBnAmPpbf8SePRre8LP31JAGp30C3gnDlJnJ7aXGgYCq4Bo
	9/WBiM8TKLVovdXXxKdxOK71WkeF5zRuURGIK9n2vlZ5fv9UZTeM3rk3K1GO11FSLlGuj+sDYnA
	NvcRClJdKG2vRItCvyIS/kpoBVHYhsE2AAWtltI1Us5si3I9QPB5T2DKNBkM55rBCxSDZ9V/mCA
	v1/V6PCHxMR+C7PqgPJZ/dcVZTetnVDh0qyMMp1saakDoa0oP5+YnmhBKusP1Wldx1wrLyk/sJ+
	IQPNLy8XjpoXPsnrE+SdnDHQSkTKkepF5CE8TR0fqyouY5Xav2PwE0r88FW6HUc2G0g20aLXXPy
	PVrELSPvYMcL4vDFPCP303jgzQmvm3d6NV073Hgt1RtQjzZr0LFBbcKTYcgZXHTRvxjw0p+uvo8
	3YIK+UwNT9z3FIjrRKYjYlejhRPWYoJinJmqvkMA11KxTRjVhh9kWgfiE3XhwRRQYH1aaUbcP+L
	NQfyEPHBkG6/KDSI45/8=
X-Received: by 2002:a05:600c:46c3:b0:4a2:fd2:9855 with SMTP id 5b1f17b1804b1-4a35acbd173mr62562205e9.13.1792913507871;
        Sun, 25 Oct 2026 00:31:47 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm107744875e9.2.2026.10.25.00.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 00:31:47 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic X1600
Date: Sun, 25 Oct 2026 08:31:46 +0100
Message-ID: <20261025073146.25326-1-olivier@mgcrea.io>
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
before any console exists.

The value is in the X1600 programming manual, 2.2 "PRID of X1600-CPU":
"For X1600, its value is 0x00D0000", a digit short (the X1830 manual's
same sentence gives 0x00D00100); the chip reads 0x00d00000.

Add implementation 0 as PRID_IMP_XBURST and handle it as
PRID_IMP_XBURST_REV2, as for the X1830, which also reports company D0:
write-combine through the WA bit, and none of the REV1 workarounds.

Tested on a HiBy R1 (X1600) on v7.3: it reports "00d00000 (Ingenic
XBurst)", mips32r2 and 1099 BogoMIPS at 1104 MHz, and boots to userspace
straight from the boot ROM's USB loader after a reset, so without the
HPTLB_DIS write of the REV1 path.

Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---

Notes:
    v2: the Letux kernel's handling (commits ee3e4e8baeb6 and b799b9a5e4d3,
    Nikolaus): no SoC in the macro name, and the REV2 path, as for the X1830.
    v1 put the X1600 on the REV1 path, which its commit message didn't say.
    Letux's PRID_IMP_XBURST2_R2 (X2600) is left out: I can't test it.
    Added the manual reference Maciej asked for.
    
    v1: https://lore.kernel.org/all/20261023204205.48222-1-olivier@mgcrea.io/

 arch/mips/include/asm/cpu.h  | 1 +
 arch/mips/kernel/cpu-probe.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd21f..c43c9364ddd0 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -186,6 +186,7 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
+#define PRID_IMP_XBURST		0x0000	/* XBurst®1 (X1600)			*/
 #define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
 #define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
 #define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d49..7da5591f6024 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1814,6 +1814,8 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		}
 		fallthrough;
 
+	/* XBurst®1 (X1600) */
+	case PRID_IMP_XBURST:
 	/* XBurst®1 with MXU2.0 SIMD ISA */
 	case PRID_IMP_XBURST_REV2:
 		/* Ingenic uses the WA bit to achieve write-combine memory writes */

base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
-- 
2.39.5

