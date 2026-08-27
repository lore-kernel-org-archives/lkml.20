Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F01E3CB55A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818407; cv=none; b=RT6eKgdVU00ceyuk+fHrTcLFVVlcmbfzhyIM4a1ReRDWxteIut+dM3NZm2d0HnV/qZWs6Xsmd04rSGrW9FF4QEzdjcvTCjTJMxd/YKyHGvP0H0bBrd/5Ch7xzXMlNoKt3VLj/sICvdY9nxNIRGwiWz1mV5Dicsz6nYEnb1+9hRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818407; c=relaxed/simple;
	bh=t8GjYgE6EMM19F6RxsbIprvmjnmTi3x/F720AMusbb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wq5aop3Lo0ELBNLa8DE7SDvvYKh31ujBu5NduElDs3Vlvm7ourwUvnnKJh0MFi6+uUv4rqBMNBCOKldQedr0yudA4BVOC0NfBgI5ttVEUFUTKrWH8SkssEl/QmZnoGrY+m1ujrIwnAmkd7jdAGS6r+eMYPyYGpFx/+IKpB5CVWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4TXXrG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPyJXvUJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4TXXrG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPyJXvUJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R6PY2726540
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=id40phT/RVjPBVcSNSIiEA
	JtrrPWIXKWs4eDewBUW7Y=; b=T4TXXrG5mznvvHMuzsQsomR5dUgk9AJf6OyNfB
	lyAXpheWtmstCGBZNAxbj2C+VGa6lfxBrXGd9/l3UcELF6l68HODNctYtv3byaWy
	+jWc5pZRZhMUDpElISKE4V2kX3AG7R+ZbulbzftrfIQuh85PA0CgZTkDFKqkEqkw
	zZnLQR8WQacKpzTHzLS6HcO8WBS3qAlDArYMTDyn95VuXdnxCwAqk5i8M1rcmSH9
	b5vsEOX/v/WFa4Iiupx/aEDu1h5pz+1GdnEP107XJs0DDj1GWSl5Bj4RqYgGB46n
	UuTxNr2YZR1w3F6aSFLByd7I0VSU+7uT34o95OFghSV/YTkw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6ett7v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:13:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso2260327a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787818401; x=1788423201; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=id40phT/RVjPBVcSNSIiEAJtrrPWIXKWs4eDewBUW7Y=;
        b=TPyJXvUJFSuqZLYjtle5Avi+aaaB9QyiYnwnUaXAQmUvSis+ad69O9HRhA+XGeXrzS
         z9zZ38rlfaHAiQEPt0PzBLSanRMJwzy+3srd3ZuE6FKKEhwbDTEa/bDiVIHz8zhEiH8J
         u0pi+PqLd7rGaj60+Tnsd+Cgjb+C9dJZOFpnGB6zrzzF2C3rsf4z+8VHz055qzqWbZJz
         Y9rHUvZSe6/y0/hVsq9lkwQluTh5MpbmC1WU+AWA7iG25AbemovU0Y2ZSi2NBOEOTUva
         yClEdddDEUhhekS5dFrX2h8vMaT4WVLPD+JitjY47ldeDsXxsPI0Hif4++2vbL9XN7kL
         KCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818401; x=1788423201;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=id40phT/RVjPBVcSNSIiEAJtrrPWIXKWs4eDewBUW7Y=;
        b=RJRLLXygllGXUumI6dYOjZDauXSebpcOjnKyEp2lvL6bopZ4HilKmK2LlfP+Q5EizW
         v99dD0Itrfhjc2Y4QwzMhrtL6cW8EMtHjvqdNOlrf1wk7IfOkDBGukByI3UDlHinxTql
         C0T2FgLhi45U3WPlYbm2YeSU3YMo88k04LzSo8WmoamrL0+tgI83/0LhqnqJqYH8uihC
         Ipgm5sDXIZ1/quP4D6nFfXTxda5gbg+RaJYWOGdQsuowimumYVnJW/DP6fe6mxWbnUIE
         g6iX1Ih8QLaF6yLvPymo70XPtdqJOEQpcNjr/BYmC+xam+2UoyobOavIy0LITJG21Y8W
         J21A==
X-Forwarded-Encrypted: i=1; AHgh+RrG2NAqLQj3F9AL+07VSr/fAIFVWgNEuaHztaqBEpw4VntT6/EpG5mghR0mF6bT/SroUKB35zCoqMviY/I=@vger.kernel.org
X-Gm-Message-State: AFuF++kO44DTp1ovxk+zlw3YrV/qPNhcm+MHH2XFach/FR6wY2z4RUDb
	iLR4fInN7bjSGaKnsFguIsbjNim1GJRxj8YCg7iwHwyUyGC658bXaZuOjs7ECPkf7Z+Wfu+v0L/
	6IHDc6ye8K2imBOnHGzg7g+O8Jwe/MYs07qwGTxl32sk6Qz6/NLMAfnPL3XrvaTQmOE4=
X-Gm-Gg: AR+sD106LADUvss1iS2GbRMVfNpelRK/5sLKA4OC75jQmtx2xQtrobbe9Yuh5F0zXvp
	n5uxPMVO1DVX/rDY8BQdOtvnZoU73WCL5vmzceYd4rj0qQUcAxRWrIs4xRSTbfjVW7UYoChTvYz
	fhaR6GcMfXMzqfqr3Ril69Nug8Cmgjd6Ccvjqa5LACokf2wxP9ic7/seJuo2ghnMw+8U8nIYo5Q
	UNzZ5R4es0qEu9POwnJ/MHQkTfPgHV6wYysGQjEQblSjJhFyyEj7eU0AevEhcAgsqe8RR0IxTVS
	0f6xQZ4RZyt4MYO83iNCxiZHV7CMt+qDE3we/AS22Vtt+6oaVcSM6qRUPiURW0O1f7LFIYy+x0e
	9D1CxTRPx5628SDE6ZM5GCJGJRY8434ZZyWpEpW0myQHIRanG+wgxW1G+/E+BGdxj
X-Received: by 2002:a17:90b:2b4c:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3966d4592fdmr28943900a91.13.1787818401070;
        Thu, 27 Aug 2026 01:13:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4c:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3966d4592fdmr28943788a91.13.1787818400563;
        Thu, 27 Aug 2026 01:13:20 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm14214847c88.1.2026.08.27.01.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:13:20 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 01:13:17 -0700
Subject: [PATCH] soc: qcom: smem: fix 32-bit overflow in DDR frequency
 calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJzxj2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMz3fScytzSoviUosTcZF1T0zSzRANTA4vEVAMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAFiYxknAAAAA=
X-Change-ID: 20260826-glymur_dramc-55f6a0508ae0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787818399; l=3071;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=t8GjYgE6EMM19F6RxsbIprvmjnmTi3x/F720AMusbb0=;
 b=B0ErN2NGLU/2NSWGmZznEQYgJHMExgLbXLVYViJMztoFeovGlPkME0b0eHA3zk1LxFZKBmYJF
 rb8Y8wZvZoCBrsBElFQ6S68Vu8Hsw+UYy5O1szNAC29U6OjRJIENlRY
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a8ff1a1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y8tzQJoX9WwRSfPLOGYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: WAMn2XR7r9w-1XkB4xM4i-_HSJrdGPNm
X-Proofpoint-GUID: WAMn2XR7r9w-1XkB4xM4i-_HSJrdGPNm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA2NyBTYWx0ZWRfX4KwBqatlOkwb
 /Dgy72+xIF8gQKU3wuXyZUQVcEcyPeR8TmiA+UJge4oBUUvjrU0EqhS2qxJ6IENh5w0PSyT6t6L
 GlXYxKqX3e0PIkCf9OvCJazfIxXshrkbUIiuw4IMfBVGANyCd9mQarIcDJhap8XNjtwOvZOIz5z
 Ou/LNZCMFukWR7byf4RwTBk++G6JEPYHIwfcsfnLEYEXYTmSTzSYc7Pp4lhg15OwqojGI98aEk3
 FYVBIpxrqr/m/QWTmiq/NbGR7lYdv7gI4pcoZxZ5WKjFB1PFrSQiLLt9Vuta+cJxj0ngoSj33h3
 CD/TmgpWOM1HXIQCJXe0MSAKihSDFDG4oeD0vLBAH2n/LTFcfkfPRlHC3A46pA0Nqc1Oy3RFi1c
 NaC76ZKFduynjKME4ODb6L+Y+B3VVDZSMfeTtwJ+ntqVQODug318hI3liiyLZ5Q0DP+yxH5yVXp
 4SP1lv1HeU3Miqlsbog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA2NyBTYWx0ZWRfX1BYzpWCSK139
 XPVtQ9OMPAC6u42344lxpJm84N6meX8Du7HRJVzFGH46cz79Ug4y+M7stteZPx/cK4di88FVz1e
 WftA0AfaMbBgKnWv3m9kitqopcdyWzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270067

The DDR frequency in SMEM is reported in kHz and converted to Hz by
multiplying it by 1000. Since the SMEM frequency value is a u32, using
an unsuffixed integer constant causes the multiplication to be performed
with 32-bit arithmetic.

This overflows for DDR frequencies above 4294967 kHz, resulting in an
incorrect frequency being reported through the SMEM DRAM interface.

Use an unsigned long constant for the multiplication so the calculation
is performed with 64-bit arithmetic on the supported Qualcomm platforms.
Apply the fix consistently to the v3, v3.1, v4, v5, and v7 SMEM parsers.

Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/smem_dramc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 63ebe7f6db59..9612230a03be 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -219,7 +219,7 @@ static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }
@@ -232,7 +232,7 @@ static void smem_dram_parse_v3_14freqs_data(struct smem_dram *dram, void *data)
 		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
 
 		if (freq_entry->freq_khz && freq_entry->enabled)
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_entry->freq_khz;
 	}
 }
 
@@ -248,7 +248,7 @@ static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }
@@ -265,7 +265,7 @@ static void smem_dram_parse_v5_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }
@@ -282,7 +282,7 @@ static void smem_dram_parse_v7_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }

---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260826-glymur_dramc-55f6a0508ae0

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

