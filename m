Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCF93C1411
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273259; cv=none; b=rRiDVUBkRKnIGpqVH7UUNJb6OLDg2YDJyTZo+VEACiG/8zoYCgGIRBMdEo1XRGp+ibEdQAa7tDcI8qHfUjB5w/oQBjhK3X5u5w3NH9O8afWknX04SQZJzJPRots2ASeoMu1ACHteYNxHz/zaHcix+aJlacGv9let3BgGGAh9FjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273259; c=relaxed/simple;
	bh=mboNFI0NzNca1nuO6WYgZ42DSDFcnlyM3BkqxONnINQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sh9MitZ3F4yQ/87LPRRwC8Y8aMmzXJkr9MzNYZa0MVSjfn998zC4mNAXUF3qpx4G/VSjWaae7giYyXmcaXzPAoow6vfxTxLNyJSWCBuL7Ebk7Bv/YlDAUBDbfv8ERhMlNAPkFvqzGFi4hZ9QWPvQZgsrdcsNE+qn43RZveIY+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCUUpHGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKSMQ4Mp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCUUpHGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKSMQ4Mp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eB2Z095668
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfgie0JUgoj2t3qdSY96bh/GuBapB4o0d4bNUXr17Dw=; b=TCUUpHGqUNnSnBbM
	Ka2gFF6b1N63N8paycB00rfSWKRnvI978SQVTmHjYXiv1kPbeg6CFqEhC+rZ6Orh
	lkcmeGrD7AxdoyL901td0qGJoVR6I4y4jzjlyUljPLWVX1iWqbw8x1RTRoncimlz
	rXCXrkGeitLizDdnlbXL/8vXm7BEskhZUa13SpiWsYNgSFpAsElUwjFc5RMbpdoM
	6VlYiNvUPE6sj2e1EhVCntjLcUmkd8qnMKK99pBZJwxT/dTGN3q85l5LnxCJ3mf1
	xWYZ5nuCFc/8PtEONrWZmCeZl6ZdS50dTQjvzlEJWGzLDD2gCetF8AcvT3LeSuzm
	QQetEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jkup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:54:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e834ff4d0so242960985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273256; x=1791878056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pfgie0JUgoj2t3qdSY96bh/GuBapB4o0d4bNUXr17Dw=;
        b=MKSMQ4Mpiy+TCzLof5W/FzpvvGT6pdG5U2uVkddvmu9WPS/RM61JuV+8qWvd9+FtQI
         1lBw1R0ZhItVU6Q7zNWq9T1fiduW7Ooa0KrUMtrJmInPpSFh3itBbFn2J9GA6aKxW07I
         Tup+gNF/GGeTVfOoVZZo3ecQX3WEwIF090dbCuZpS/BXMZ8V9DLsbhQ5sD+4PzY2X0NE
         BNADZU5PGCYBF839nQ6F9SUdvNbcmpSG7YCyIHT4TIad3bTcTscugcJL5TGlh/zT/y1k
         Q6xBo8M8jjeFLdtNjV4qEsBVY3SIGKKACW8fpHpvtW+LLMiY2h9lL7OscSI0RtBxSuvF
         sbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273256; x=1791878056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfgie0JUgoj2t3qdSY96bh/GuBapB4o0d4bNUXr17Dw=;
        b=Q3EtqqOEw59FhEhJ14rQFybgZpqwz45bjcrnYJ8lNZ2CyPMCS5B30oXBDCZKiXzY6T
         mNfdUfIPEjIVoh3vgVru7Ww+c52rHlOzQjPQAEikFkQ8ZnY7Yv1m/vxVTr0STteovWWB
         87vINuxuwNiCgyO7r+iJh9xZLEuzudir8OWtdU49g83m85C+vR1enQPbB8eeN0L5tUsY
         T3NBnzkghNFsyIjpEPIVZctfnti0/nk5hpKAWzzm7J5ws6E016NguaGgMcGO3/IvUR7a
         HFUbafhQQiq+AUONPUSS6Q50Ea0nQTqQjHMAYD6gRk8wXdSs6vkpqDQ4l4B2bH4eJL96
         Tmwg==
X-Gm-Message-State: AFuF++nBHa5tsf3mh2tJxwgiRxk0PQeAKMFg94VOMQLOBqYpGJbwNMJQ
	/UAxKMLgn6U4nSwPK5UURfKzBNEDxPrMlIX56qgRIAnKDESY7EbRJgQ00/fauuK522FpAZJa4F9
	Ma5qgQEYytV2gldhzI1HiSyaRcETpC6b902cLn/vmSEWmZygN5JSBVH7xw8aAwAv1QZA=
X-Gm-Gg: AYBFou3aA9VVW0a8hSCuOg9UodvC76Z1fYuQjfZemun6c9BlCqOjOZ4bIqHdQ3yhJ+b
	2IxFgOTEuPKCM043d9sZgWHk/qQxtxyP6wxWIqU1bGMTm75pW3YQP0ZqPyx5qbpfz+GaXPDoxGW
	RKs1fNIwj277xyeXGNpx6C+YY/7vlB3RFK65r8D6XpF2BT6atrR/T5xzvmltbElSb3Zxuha2dWg
	SXCtxYwJj5ToQge8IwdwaIAhJhzaCjhS7sNHuS96DpN3GbFgGl0q5NfxN6fUx7/RjFlNGEOGceI
	dqZu6IZn9UROj8b2E1KykWLfUfqs3lO/F35348c9FQDVn7dEgpg1AKGcLbMvZXeGc+DL6ZFSaFj
	lOHTQYbtvmRgifV1kHVycY0YZaB5K+QSPnN9Ptw==
X-Received: by 2002:a05:620a:3950:b0:93c:1ecc:20d3 with SMTP id af79cd13be357-93e8f39c11cmr107848085a.28.1791273255793;
        Tue, 06 Oct 2026 00:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3950:b0:93c:1ecc:20d3 with SMTP id af79cd13be357-93e8f39c11cmr107845685a.28.1791273255279;
        Tue, 06 Oct 2026 00:54:15 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca806fsm50828115e9.3.2026.10.06.00.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:14 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 6/6] riscv: hwprobe: Report SiFive vector extensions only when available
Date: Tue,  6 Oct 2026 09:53:03 +0200
Message-ID: <20261006075303.205216-7-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zTw9i3cXxDtvjT4pUAAHk57HMSyc_coX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX9JZunvofdVZD
 mTAQ3fl6uzysAA3bxXzVGD67+b50w59cykfeT6eN/x5uUX7FZPFtnSWoF3hHOnmZEVh5ATqX5qY
 kVtbP571HeMXzK9Fj6WHrX/48vb4Fn8=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4a928 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uPCuBOvzkMiWwmi2Qq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX6+YkMZFTEtCs
 Adp96qJkees4puaGwpd7+pcq86tVUL8LHaJ5rBJNv4yYGIEytbyIQBOsPBwAM6zoHHSJ3ebO3qr
 rUOlk32lLO7a8+6aLc1r171yfk066Yg3Nz859i3uyFP0vS1Dmi2W3lSHeOhDv8D/eOYIkuG4XKg
 tbnBbrmiqU9hrBfzQa3/pzHHRzC9j929I9rtuSMHeAcCYPQIgo5Nve8/S/JQVO1bgst249JzemZ
 F+D23IRY2mSjwOD3iadbgi1vw1IYGhDZrZPqDnuP3nRXS2jDCiSzbP+KBM4jpmrPGqhIQnc+r3B
 j4QNSh9pvq91VVZd37NbaxOKqwbTX1cRDrRCBtJK98JY8/uy2n+rvOZ8didDBl5nD4qdRxFLNLV
 1fUn8oVbXnX6SFL4L/P8VnZDP+F6oKwAmnDnIFQTANlRRTtqajj3PUE+gsKm8exy5i5KKdFCgN8
 Hpf5iVtTtKQQSX9DEXg==
X-Proofpoint-GUID: zTw9i3cXxDtvjT4pUAAHk57HMSyc_coX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031

User-mode use of the SiFive vector extensions requires non-Off
sstatus.VS, which we set only when has_vector() (CONFIG_RISCV_ISA_V and
Zve32x on all harts).  Xsfvfnrclipxfqf and Xsfvfwmaccqqq also execute
floating-point instructions, which additionally require non-Off
sstatus.FS and hence has_fpu().  hwprobe reports the extensions from the
per-hart vendor ISA bitmaps alone, so it can advertise extensions that
are always disabled in user-mode.

Report correct environment to user-mode.

Fixes: 1a6274f03534 ("riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq")
Fixes: 1d91224394c9 ("riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension")
Fixes: d9669e33c8fa ("riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension")
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
 Same as THeadVector, this could be optimized better.

 .../kernel/vendor_extensions/sifive_hwprobe.c      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 1f77f6309763..bcea4f7a81c4 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <asm/switch_to.h>
+#include <asm/vector.h>
 #include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/vendor_hwprobe.h>
@@ -14,9 +16,13 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 {
 	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
 				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
-		VENDOR_EXT_KEY(XSFVQMACCDOD);
-		VENDOR_EXT_KEY(XSFVQMACCQOQ);
-		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
-		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+		if (has_vector()) {
+			VENDOR_EXT_KEY(XSFVQMACCDOD);
+			VENDOR_EXT_KEY(XSFVQMACCQOQ);
+			if (has_fpu()) {
+				VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+				VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+			}
+		}
 	});
 }
-- 
2.55.0

