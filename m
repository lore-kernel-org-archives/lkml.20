Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663220;
	b=jsmoi7GUKFIizd1cGfg1fLB8TdtWyKEw9kIYUgsvPDtWx9rhPENGEPSCiKPVGfVVmKFd
	 EUhbRVEQhYWeF5nUT4FDKukJty/2a0xPU5ZmmjDLZhDMq8YzBmkyBOJKP0X/TiZu/rZSO
	 gi0xeX2yNSgyMe7wGr7uu6YujUeea5wJpdSqEVzqqqhGibdE6iGvVX5TJT9+22UPeW8I8
	 ewid/EeVv36fZOeRJ4BFyYrcdwDfAki/bor1sz+KQMPQNEVh8xY3fi94ltT+9dZBVeTVU
	 85c71d4YlzgiE67IF9eys4WhzMu7c9wcwFvN4OR30//cP5OGEGsoeDnxcVJNF6NWPrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
	b=VkxS0DgcBS3kAU3Cla4pcTs/IEy//BjzWbfBiK8vN78ujOm7Lfk11VToR7q2i6BaLTPT
	 kFVDva1nYH33vu0NQt2b2Z8ARbnq2AZ4NiSpu/PzMQgMerbjSJoNe465JXEh4yqudRbc4
	 LuIyN6pc7P5YPZyns5hPkuMxjhSLAImRDbS/iRq37I3+6w9RAxI9iVUtVNnULCQnntksj
	 ABdaEIZTUrF6BqbOwBhmWSWJU+u/p3Peu4p/MALUzn5F9Zo9fSOVr6TTmKB28il6woXTT
	 gum8ZR7K69XNcX4uurr/j7ZeNes7geym/uzZG5VcZYctxXjECBjX9mKzNlfrtMA07QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E57rxJzc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPLcLM87;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30699606A89D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30699606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E57rxJzc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPLcLM87
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wRmO3379696
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NUZ1WVR0lUU
	U/sgz51lkZn9LFadklqZ6tAy41kZyrkg=; b=E57rxJzcWbMfxwa/w6RQtiAFL1Y
	fgfg4I6+ekZjXaBONjBGxqb6gHVcyEyYhM/iPVU0jdvw1q/ONWaC0kO7N4Kq2ZhS
	s2IDvktIHUZb+NzH7vzRTlt4a8YL+MpIIv80+UgfxXNko4hIRUP+EHNA7u1jC9Z8
	0+T9svKKuPAyBDAxpGRzCynlBoDIjYM2HewMOvlR6lWgRQRwq8HjGIhqDqZhTeV9
	Ksd+j+Jr7PL20QFezmNxQQdFI0lVjjSG0plNas5p4yrfhZJUleFf+eigZdJlhp9o
	V2H6GBeR9aL9gmO6X4F97uVyapk/tdl4w44BJ6xflbSUkgTS22O7VL0vJug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0vbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so24605395ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663218; x=1795268018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
        b=RPLcLM87BXv845Oynl+SJayiyNu+wioRBXyTMXCRgFNitO1big/3nl03RfF8stSrGs
         Ykutw8jLXNN9OINyOABVtEFlljfOttDntXsOgnrFhz35VkO4GyyjUagCVnddjlNh3Ljr
         5V5qaBBdzlsweGttzPxWkSB25RphmA2f4prsBANnUGn/v3NyySGJ/GXV4SAKjv/AxX/F
         zS/y49JRSFLa0jdos1oZf9zGRnoovWdu6yutIrgh7xnHsZehazF9KSAQ46/sGrEGWisS
         /SnfpiFC4TDeyOPs520kP6+KGYOucPEdv91biZAxor/Z3e1j/1r2FQdJYBuHyzXwvyzI
         YyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663218; x=1795268018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
        b=TmSkGoCJQ7rmOHAb+Zjk2cjKkv6rjTwFseyA2mTrFjWwd0D3KYsUt/uuwtyIosg+tg
         l2A7uo19Tg2WklW9J3mBsUq2pgJiRJ6BZcjqk7AIgfyGNpTcwn2Jwbq/zKjyb0T1mgBL
         TKQDq1Svu4bpXnzBxCWJVF8+lc+OyeXpAFW3iygZ4s0bpRtCQT+JelkCQF0A8sXKVBQu
         Bz3Sn6dWKLXTvS87irDJMIgYHwY6zLbDeScmxnW6lYzZaycr1kKpLNiWjwlOJqMtiKI+
         F312s7bicKZLVOvYmDqHYxXjXW+R8FHC1i2EOLlQM0jzrSwZ3TtwtW7zgW+NTzWyva9A
         gveA==
X-Forwarded-Encrypted: i=1; AL+hErFz/63/qR6OXnX/IjoSKQfjh1NzBh7IoQBK4CJAUxV4Do7HUKR9md4ruAznKolFrqfLBu3FdwBs7k7gTIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zM/UL3//XOZ247gHX74HLr2k3VG2ezFPx9gNuKcIdytpx+Btb
	fXZh6ApS/LDj3wFOU/xUDeVdqcbOyaAQaOMtD3AfDWlVl335cKkZMH/dYGMIGI47Z4UsjNsFWBK
	6ffyC6rjQ9WNBFevr2k7CeYYy2GfgBs3i9UpWXX8AX28hjcYgHlQnuPk/tubgra3YlfWM9e67jE
	9h8Q==
X-Gm-Gg: AYBFou1eeMbTD+5mXnnQx+LSPmfQJD+3b+eeRmMlahZhVtSYY4x7AmAt3StP/9dBjuY
	K4Y+Ugeoc7mMkiireFuYtylP+U3h0ObYXPRfqbdNt/x1BUnF1nJ8QjiSh+JWIbp7baWVnsqT4vg
	+OXtJZCCb1XzBtmKQVaPQAJLbsdKfiY/QzKKtTYVAZTLlWFM8iyOoLjelyPqpMcsnsFBIr9dJD4
	iqV6ALBgFU1krnLBxyrzZyUSEsUBIBQNtYuJZfj4qCn1nWbkUHDsydE8X86DJQnKTRmCvdHod0C
	ganNVDcERQ1lc5/BdKSPW6exAHBVndey3Fe9V0UbY0uwfT82sHQgsl/So40sn86e5X05iyHCfsH
	HKIJ8fy+oIa8V/Vqfq8mIiGh0j7qGofGbApcvOEUbIUWRt29hZ7C3DhxA5VL92Z7tzb2d9gkMGB
	p4sYKbNYkRH80ecVYzLC4+Cz4XOGdYsYSRUUvG
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr53341005ad.22.1794663218187;
        Sat, 14 Nov 2026 05:33:38 -0800 (PST)
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr53340785ad.22.1794663217742;
        Sat, 14 Nov 2026 05:33:37 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:37 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/4] soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
Date: Sat, 14 Nov 2026 21:33:02 +0800
Message-ID: <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX3nKq4h09zNIa
 Rn5Hwrx5XD2258vm58HbbZ9YTDx2jEMTafvA/r4/sQy4iip/d2EnhWY48NvvPUuWGFwyo5dgwFV
 6vKldr5VW1Ne6HRkjFImtdIPM9c4i6xjfQt0YYb3RVfX1COvchmJ9gg6F61ewqfW3kRakB2cSyJ
 UOmslkmD4juTopmOjtKnB26I0/r7mFkbWotAPaJkO/2Ofuyw3qWedEvaYLjFNuTXvtTNifUOUpe
 tmElMkG7769fQbfOZ3iBqzqEVLTcpVhqQnzYRu50SF/ZLLcN/WruTtRKlCKixHOrwOmDlUnusZg
 /v73plfUPVT09cySyZU5H7V4TT4npomf0CTl5QT5HirSORlD9GI+VrUsARMTth71c74JWne6vt9
 hNUSaK2V+VSw79H3CV/t9Seit0HLBxv/nt8beLZsiYUebCOFcYDUS60pnPgmsrRoUcyC9Y4zy9e
 R1t0CDOpRCB0zJFoasg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX9/uBMXAoK7gL
 w4DnxHwcXEzFoAuwzozj+RUKQZi8/Er3MS3qKgqEEI2VU+FyTNANLVNrFr8q9v98ZubqDcru2/W
 VHh+4kCRCps6ZmJ4F8eT+aJrP62+zr4=
X-Proofpoint-ORIG-GUID: i_-GNfPsuBtxxCPJQb6L5dP2JvvK7knm
X-Proofpoint-GUID: i_-GNfPsuBtxxCPJQb6L5dP2JvvK7knm
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af86333 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=CRdk7aJQni9bi6iwJNIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

SoC ID 690 is QAM8797P/QAM8397P rather than SA8797P, which is 648.
Update the soc_id table to follow the corrected dt-bindings, so that
boards with these modules no longer report "SA8797P" as machine.

As ID 690 is shared by both QAM8797P and QAM8397P, name it "QAM8x97P"
to cover both.

Fixes: b0bc160c311a ("soc: qcom: socinfo: Add SoC ID for Nord SA8797P")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 68148defb508..ecb4369fd309 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },
@@ -541,7 +542,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
-	{ qcom_board_id(SA8797P) },
+	{ qcom_board_id_named(QAM8797P, "QAM8x97P") },
 	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
-- 
2.43.0

