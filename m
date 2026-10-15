Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1C49E5F4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048535; cv=none; b=hbLSevQoTKwsVgkuu+wW4pKCEZLmCFYn6PeSLkZUvMav2lURqY0eNFukEKZSeG/DArMJEdmIuxRSUfFNaTsZC4VgmL8xDSXGUGJxN+LHb1Dc0iuEj6v7iX+73u2iA9AoP2GG/15CvL0BKrblc7rl+KZaUz874IijEmJAZTQF0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048535; c=relaxed/simple;
	bh=zTrQ0pnN7G23f4y5+DEkzLuFDBliETbsQnTkcWQjkzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u6cj/u5HStEPpC011uUA+o7PHjbbJ6zw5LOmTeLChcYng5qvTruxmaNZX+nNEvgMR7ZAmTJY01jqYCMKPw5icyvj/vCSKt9/p3QKLONB0JmC6S6uH9QIcoPouO9JRWBmnjXD8KcTOmnJXGVhB/UqgArUwC/jOA5wtSy4QT8MV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAS7w4qu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeKtS2y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAS7w4qu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeKtS2y9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xC8B1640507
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dcmUFnDKtfp
	Iw0d7LSYds4+3SyLAxv2N1/UX8KL9lgU=; b=PAS7w4qu4x4N3vmYQAWNk+T5nUW
	CIqAO3o3LglTr6nfOytdL+JPDrSyJDQ/30xTCJq866jS0SUPUFrELtfU8c9JefZT
	OxHll50hrFIajgDHjDPsyXTz3ZPFY63yRcgKdTpDLlQDVHi3XNP55NsHjRNjG6nz
	al7TNZ7sbC8YUURR8VUh/+dOBA88kQKTJ1Azk6w2kJX6hyot58soxLZdnTJLF0Go
	gAr8Chv8oe8MsiwOoRwCkpUpTJQdbQdWhoGMyJsYmRXt5SD92Ld1V1Tyzpnv1zYk
	K/GyAhj7c8NqxQU9bifHwCCVxg2kNSJJcdjLh8aydnggGJQJx/mYNa+6JJg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhgq69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2367571a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048524; x=1792653324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcmUFnDKtfpIw0d7LSYds4+3SyLAxv2N1/UX8KL9lgU=;
        b=GeKtS2y9jpDpGT13GAw8RE4OHO9co7rGSHr7dwWUrKxFejU2CQJYXjjA5O1mPOb5ZH
         /dZdo2s3DRyHtHyH6dh5v56l+eBesz45vNW8fL1/nJZnCWsG7MQh+sWLFQpQBC7bbKeD
         OYkdz2DLg2yLLNypZBe1emuUDjkuouWCkoP2Lc0ErDhjGTNggWPOn9V7XJHhmQtH8AZn
         VUIMMY1u4mT1WfGQYwezprNtKmFD9J61MSXPJJGJr8qn/oJrDSdfhqnMBh3TjS+SVoUo
         f/u+Xgx7bnKe3yCSXyZHMsMAV/T9An3nWM/7uWogC75vvMDDadyFpOFvtjJ0zY+cfM9Q
         yvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048524; x=1792653324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcmUFnDKtfpIw0d7LSYds4+3SyLAxv2N1/UX8KL9lgU=;
        b=SFTHVuvHc9Y9iCEzTpSyBEGcPQQTsdX85gb4BbKoWzhdJH38x9P1/JZR+zAkohqFk7
         G1TqBR9vSTQ/0Gx4g5D52rCT8kqQ+wVSIAgs2G7gMub9hJwK0uJtkpfHc2N1iaFQRB48
         AFAY/dQJZ0I0GbFhp5FcQ8W5z9+AIJJaCnWMQWCqR8aMYkEfCvfI6ZMIRBKEwfC6ik2V
         RUvR4Dc1dUJwrN81gnyDsnroiC5IpRHPD6wsu7Sj1K8jvzTIGIZzYooqf38hSDyG2NJd
         5r/T0T2GzLp/2RZWliD/+8Hs9AFKfP2v53XZxpiBEyWlbL00fK9dx/ntncOawiTBeJE6
         dMKw==
X-Forwarded-Encrypted: i=1; AKwUvBz4KiZM/RUD8gYldrLSo95p7kLfxUz6RiaOT+b7P0JOZFbC4WrvLaafaMJcxEPX9mYxoeJSSz9cmkrxtTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK87ES5QkGT6laM0244htxqlSk1AxO0BGqvVatNJuu+m3i+XB30
	PQQAeClnPT60saUlVK81js/siUxYJMEAWgGYuSLLlc69LULXTYSoKq2CBgnThXWwLDDoNP8ab0J
	QxSxaNrfWL1j+n1ykFAs2YWL2sdXo/MtGY31B9JK9JnJt7xqzmdYbtmYnvyUyUfj2yow=
X-Gm-Gg: AYBFou2JO5ZTIOel2FSiXnjWaTsF/B5v81uvEYRIRdQHgZcDDNFqwyIbistyXjkw//z
	FQpWgPjDWrLOmgZYY6SUi6wpw+LdUR6c4MjKBgHBqp3dkXFN/iaG7g2v00ZQc88Lj6KS/XRMnQR
	6d0olakAMY7bcgM9erZG0xvq19kYbOujjv0UHChPbiXX0Uy9I2e9gMzRIfYcT6BNrDepAmYqspp
	d5ceRqlT5UwUys8YaRBG1bYKLP6gGJRjkRNl74aRCtmK829mV9m4MylETjSwDW0sCgu4Nb3cPMV
	50tSJHr0DSnFlr9nz5hQw+KNhUKGd7aPabUz2gxkGYb/BedRDmTUtSY9lVU2QbCb+BAtRYz00SF
	gErjbIbKJE1sUluPOWwmacgD9pJEg06cdnAKHWnd3Viqkw+VzVXW3h7rV8O/TQ8DE89FfwHcX
X-Received: by 2002:a17:90b:5346:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3ac86a05c0amr2801048a91.63.1792048524338;
        Thu, 15 Oct 2026 00:15:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3ac86a05c0amr2801028a91.63.1792048523781;
        Thu, 15 Oct 2026 00:15:23 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:23 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:08 +0800
Message-Id: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX8zqNcPBgUQBR
 fSPujgyvcksvMOVqiGDyMM3xt0M6Og+8yOXWGTNhBOK4pdsoI+1zb6rEiF1fmQbJ/uPXixiYDVa
 N5kS1sBoV0vn7Aue4Wyk6cnIXtk+tZvlaUVhU5WcBtFETL9E/LzrNzVGX2mx9mkaQSbKMpe6uS1
 J5eSsxJQeL0vyk+2a1gz0qsy7SgqcuyhcRwiZl2jI7krCqDA0BXp+0I+biAP/Gdhtkn4fSQ0VUi
 y/FR5fGWkK8a3tn4gMRDtcEa8qwaQz5LUX4fsyyuVoxFi68Ueuhok8xZs6p6dxogJS3k9ATAiff
 CmsI1bLsIXnHcerHa8lGonW0vT+p0PqNPA7yYE+eVoPBaKxizdYqZmfy+sQRwi1dNa9LGMrn/Rc
 EMkSEp9ull90WjQOJSkGP9DEvLXmAhbI0vbAm1nfLYz7m6FRYxYSBTSWXz54vmrFWOIBrY96vUD
 lVsG32d0k3Ge82hKqyA==
X-Proofpoint-GUID: FWq2eExASZ3yB0skwizM-CRoDfuOR9oJ
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad07d8d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lhXw38L0c4fPFhUHQqIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX9Eu90McATuqz
 AQw8x3VZzhzR3RHwpEhIOhi9v2A9y5Hqst+yKxTmbecqCKSy6TO5kxEv4QEN+/RjzpKWZ9wjg+I
 KqMaPhxl1m9iVUFGK6j5//fKjfvNawk=
X-Proofpoint-ORIG-GUID: FWq2eExASZ3yB0skwizM-CRoDfuOR9oJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable CMA pool. FastRPC
assigns the entire region to the DSP through qcom_scm_assign_mem()
during probe without allocating the pages from CMA. Consequently,
the pages remain available for movable HLOS allocations even after
HLOS access to the region has been revoked.

On Kodiak, a synchronous external abort was reported during storage
testing when the kernel accessed memory within the ADSP remote heap.
The faulting address was outside the HLOS stage-2 mapping.

Replace reusable with no-map to prevent the region from being reused
for normal kernel allocations and exclude it from the kernel's
standard memory mapping.

Fixes: 9d7d847ff1c50 ("arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap")
Link: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..057d7e62b2dd 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -194,7 +194,7 @@ rmtfs_mem: rmtfs@9c900000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

