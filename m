Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407D348C4B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058158; cv=none; b=DO/dpaArpgSPPuXB2mr2taoVoVRHNasJtAlUStoPWKIR0TlixMJ02pgvr6oYZZcEPG8TujA/po3u5JEWoivLh6gclGhozay06cE/YlzRNT4QukjFScYo8Ua0IoHwm/A6bPtnbUUpb/d33NKeF+rPWPWsrF6goHwzBaPGhz1V/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058158; c=relaxed/simple;
	bh=B+xQa6aWfmJa8pgwrofKzJvK3PURgsj7wVoF8yt4ddg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZ/6Ty6zkpyTMnCEJYrDNHsAJQQDpw0gNLZsMj4ZAMbJazeTRXtdqLAfY3FbBnDnBXcdLKJfqnZr3MnthRU3gIlP4EF8GqfmFy9MyQ+bIpXRYRqGEciFnc1pdPjhcZcS3AAWIjeesxm7MPtKh3vqRpQgngAgZO/5TrYIwJGen9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aen46/Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU3uSjUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aen46/Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SU3uSjUT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jS6o2809286
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=; b=Aen46/Krbej98b8C
	LesDKNiB6nAn2RhbQZHG+DByVuGiiMKPTZeOhTiQCVQFT8fg4iCPBJKorqj7IWeL
	ZehWBsfpeUQz6zjqqKglJAlsioG+jREQUB07npAiHS+vi8ZKQ6I+E4NnE2tEAlJf
	TtAJIAs3AvtgwgLfa25T4cwdP9Dm6fhkNNUXEFrq1WRhVxWbMbEdfwhXdb6C01M4
	4Umqy9d9rQ/r5Mx9t00r5x6o4LvABuv7hBLjRi8hFpCdz1GrLf3CLzkSHAkTaeYZ
	aQR/j5/+tSWZccep93mxiV5jdIcKWCyVrraDb/C/BTPLEkH2MRA3Fn8kyGU04PR8
	tqYXgg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sxhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso6044810c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058146; x=1792662946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=SU3uSjUTOvK20ZViBgxdOB1gNmzVsjSt3CFD56hfi4B4cAqmuYsx8lhpwwR8NgjxoS
         +flp62cQwJHNQcilmiSSUUoOdL84ws5t4+z/Pd/J+tckRjQHOwlA9TypxK6s/tRMmGxD
         FW7Yj+VvnJqFZhr0FVisiUXeg9ht1/4NB/OTZGlZi/GE6voJQ+0RymV2v4SyOswt3brV
         vLanNKf/mPCcdkuV0QXKEx3sX3NnhwY4qzp8xcuynqhKvTHdEXQVdCW77GskpNYVOOZ3
         Yf2TE1bgyKo6C7ePbQjl84PxrtJb+N79zWxYuXcwvaV/DKKo9NdJtnnUgxgwxNnX7JY3
         nflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058146; x=1792662946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=bQHOOUgDjrmrn5yNQpugPpAG2bb4nYtG3YIJupa5Zm94F9iHu35m/QW4x0w2IotuJW
         3O366e+ILt4+uWk8WlRbm//yg5Zzanju6B2UE1FJgE0eqQefsCkwVXBTSElKZtOZl5Me
         HauUNawt7/ttoHVyhqmvRqzST+tNEzirT+ZRnh4kGJwbwCDjNJISphWzGDdBB5OVk/ZK
         pN+4mNwys8ldx1irrREmXTKpfEyVAUtQ+7/+e/xM9tsrhpzXEMzZxMvLdhtGRj237mJP
         lseiXGPbpOP/tgihRmolNknlKjRPuG3m2QnzOFwvXz/mD0/37h1yGxS5tcEzhlpcu+Zp
         EwqA==
X-Forwarded-Encrypted: i=1; AKwUvBywqTTnckHBOIh2ekUUuPTmVjJEAVwj3M9sM+dM9EM3WpxUs/PI7o/jlAONWo53yg9iv7BnngKc3C/kazY=@vger.kernel.org
X-Gm-Message-State: AFq9FYISmJlkf+2dBLQOrnwOEaYdLjOf8laVCXMLI3nSHKFWKqHG5rlZ
	a6GhyhcttEvbvqb+g7+zDdsYV6QdyZj5+PKj9mXh3bzAyIOqJ3zksWpLobvggA2uV9rMYrVvWPP
	61SG4obN6JiwLbmfmvXynUj6rDv+fDnCUPrGKeWXL9ej22MqAjs963fkBxwsfEF1vmE0=
X-Gm-Gg: AYBFou1qWpUU2l9j3Jf/IvFH/2fApZoL5MHoLiY62ZtYfIuU5Qcd+vsH3/2OJYBRtWK
	+C9AF5MPgPpgyDvJkEqm8BN/x+G2bBHjmJsLesnfG/Vx6bji0wzWOW4nLHY8ObD9SKXfUBg6jMv
	eyMwq60A50UEFPZlXNqRj132U3w26tc2TzSiNidCZsAZJrlO10P1KwxunouYyYL/yGXrwUsMM2Y
	EWKQt6w6bWmI1h7f/GgUQU8eGJUyOsm9ysIOwWGO2eik5/gLgVPiiCA44Nwg2aH9LzJlb74DTJa
	bap1ppr2D8qZhZN87FpFMPKM1LKJ2Cj5e2sZ8HBGlLX54Q6o/dPwUibnQ01ghG9R//EXfhfAyT0
	vhOjxhNwuZswH6mw4llvMnxZvIaNz
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902765c88.44.1792058146117;
        Thu, 15 Oct 2026 02:55:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902738c88.44.1792058145567;
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:19 +0530
Subject: [PATCH v2 3/9] arm64: delay: Move USECS_TO_CYCLES() to generic
 header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-3-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2581;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B+xQa6aWfmJa8pgwrofKzJvK3PURgsj7wVoF8yt4ddg=;
 b=8Qsz/wTwPE8obmSszofPzNsTV3AW55FSO0pTbnSQ8pL9/PopWeZZUe3RYhaBB1KpOzqbR+2wf
 Wv2lcWzDyyFCGsPOWNA6LQvNsuv8/3dekFfOSjD6FM7QFxHqs7+fJJV
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a323 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5RFle6wAAL-XeIEoYeUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX3Rd6vP7xIdvA
 d0JiEvefTYXOxR8Vr2bXdvTa8xkN9Px5/YSbp0q6l8tsJ8ZoqlXV7MrmFKaTmDLHJcuhC6YFIoE
 CSrWlVeITelsVITGwBN4te0hTsrp4aS6sq2d23Nt5nWP0LtekC1zuMWmqxj5m3rSFkMsH6newD9
 eaK13BIzdqEaZ1Z+8QpI44N2Uy9eIjGAUY485fKbDLJNlDmq8mz7w6yRMDZ0XMfmhag4DZybL+a
 JZxN3Vfn4MtEEsAJpM2ViKHEnfpPagJmQtrWNMVldXBbL9fa6LR09faNiutM5lLlKfHoKoC/6V8
 mvrmowNhrN6Y/2yMMubLNdNu4df3mWXfWsssj8ozSerk5ysqTM/Sox9PwMJ2O0OxZAcHELttwnP
 jF1Rw2ezw4RFM2hl7aVOTM35nLhx0u9Y6m1qldYlr5YEM7oPNeVkoD4xWyiHdc2zOnc9vl661t3
 XrDKw8BN/p3QF3xpB1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXwognotue+h31
 CKux5sy34Arb4UZll10io6a+M0ygep2J6Qm2Jg/b+zUaDnnglXKITbvJdtRnO9UEET262y+Jnjr
 yLNbzZRMNUbBNNSPdBkUaaTxln46TrM=
X-Proofpoint-GUID: XMAGeN8LVahuVwnoWpV0rIql7A0WuDu9
X-Proofpoint-ORIG-GUID: XMAGeN8LVahuVwnoWpV0rIql7A0WuDu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

USECS_TO_CYCLES() converts a microsecond delay to arch timer cycles.
rpmh-rsc carries a private copy of it and of its xloops_to_cycles()
helper, and the MPM irqchip now needs the same conversion.

Move both to linux/delay.h and drop the rpmh-rsc copy, so there is one
definition for drivers to use.

No functional change.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/lib/delay.c      | 8 --------
 drivers/soc/qcom/rpmh-rsc.c | 8 --------
 include/linux/delay.h       | 8 ++++++++
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a9ec3953657a6bc8c0de0da4399fc..117ac5a2f13df1935dbcbc7bf32901f7a4411295 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -15,14 +15,6 @@
 
 #include <clocksource/arm_arch_timer.h>
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(unsigned long xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 /*
  * Force the use of CNTVCT_EL0 in order to have the same base as WFxT.
  * This avoids some annoying issues when CNTVOFF_EL2 is not reset 0 on a
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493d9e06c048930b8a14a38660df4b1..4a664d522142747427de5589f8aa90b3e3b74bd9 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -146,14 +146,6 @@ enum {
  *  +---------------------------------------------------+
  */
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(u64 xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 static u32 rpmh_rsc_reg_offset_ver_2_7[] = {
 	[RSC_DRV_TCS_OFFSET]		= 672,
 	[RSC_DRV_CMD_OFFSET]		= 20,
diff --git a/include/linux/delay.h b/include/linux/delay.h
index 68b2a69dd24d6c135f9f749c1e2f15f8b3bdb141..31e1a3dfe2dfc1a9dea7fd6d7db735f9a2507474 100644
--- a/include/linux/delay.h
+++ b/include/linux/delay.h
@@ -17,6 +17,14 @@ extern unsigned long loops_per_jiffy;
 
 #include <asm/delay.h>
 
+#define USECS_TO_CYCLES(time_usecs)			\
+	xloops_to_cycles((time_usecs) * 0x10C7UL)
+
+static inline unsigned long xloops_to_cycles(unsigned long xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
 /*
  * Using udelay() for intervals greater than a few milliseconds can
  * risk overflow for high loops_per_jiffy (high bogomips) machines. The

-- 
2.34.1

