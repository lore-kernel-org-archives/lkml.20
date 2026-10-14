Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C5348465
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967112; cv=none; b=A8W/vwwoBr6jlAUk/I2tXrt3M4qOURU3Mrqr1sF4SINXzdfPehdXBoOQfeTi0sq/+qagoLC2CBe0tnmJHs/hp1hHN0RvtA4fhix7rS9PNGT4/bpVwe1Gq/bNGf1qGwLcZE7GTWYCqOrps6jdNvPVfVNcYn5c3B47r9L681JmYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967112; c=relaxed/simple;
	bh=JNgT2oTJIx5xBbDHq0D6uqDXAg/tmRWNO5zxHKbbGho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bXVejfXo3aZk2RkYcuFpsl00CRYrst0ZQb98pLXivJYMFaxgcagL29yX/w6fAYJpMpw7YP2yLjev2B/mCy8KnAVlE2TMhEYhexyXoSpEXq4RWS4f16lJnh4wokyFDUHJ0XgCopPQhOLkYJjnSwOr2e6EMzCvG49zUxKIFjqI2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QohxCooC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVQ/Bz4N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QohxCooC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVQ/Bz4N"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663Oe3365336
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+S
	szrYIGjA=; b=QohxCooCXCApvMT6vrem0LVAMvV6pgcvyqvFWEwYYpET3Msi5Wn
	01PPKdHKNEEXb+HWm/y1N1QDXaTQ4jux70ZEY5HY3599uixAC38ft5UFjnwI5UO7
	8eHdwC9cbKf5sAwzw6PTiTwYPOjOzhTK/2yRS7LUib2+ZCQZHXPPSSeiI80a5YUI
	oDBdgp/Pamq9DyeHJlFZatDsH2JgsUXOdpULDdGJIxRySqV4jjBYGo2pBTc5h59m
	rNGK5CAcrQc3jUTXUMtQmAWemDtzlZNHOHCw5Ecs3bjIiGlTZ11IORLvH9JfXHfA
	724L0e/D17pgm+Zs7x1Zwk/rKDM7R1d0EPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620kng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab9850456aso213919a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967109; x=1792571909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+SszrYIGjA=;
        b=XVQ/Bz4NMWYMue0PIIi4QHsxAY8o0zxOA0E3IIplbiQesnhyKlVeCGldKNl8V37ulF
         my0KW8GSg5MEC+vUtqWf68g2PBO2uS0d+GuQy/pCNeiOrdbgJMaBTAOLuHESh5v9frLa
         zwwXn96+yhm+SJs6yvibb3o6MU9UdyRkUnse4HeZj1Uxu5c+2JXRhjOmoARvE0rOg4Hb
         fWVjUlfS9WO1OgBRcyvJ/KG6loasAyoEwD/C2pI9Mdh1d5TIR8pomCD0DP01Hc9zF6fC
         O7K88l7YHRtNCa64J7RAst3+IHJPDgxtA0yybUX/4HsvglwOwm0QzfIfRLmOFUlPvBb9
         Fq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967109; x=1792571909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+SszrYIGjA=;
        b=2fCqNXvySWwFer/oHWuOztQOsxagzCrO/FCapKppVUUwuNNF4AV5dSu+gm3eSPRUN8
         3G0fZg2ftk8A42OAsGC0cq3vFLyppmSfKMLlbongvybcbTHpf47JDMDRCXzUS+93gMCL
         YCad97Slv/rHppUTGY6ugrT5Qx2jUSNs0hxSlY3TfNAzlmBs09uioTrfNI6FsHTVQwcW
         8gNVl+5hwmc260OSYXNfI7JZt/tHAZaIEtR8nHcDMvjPeAR8xkZwEy0WOr37UOkbXlBg
         tNFjZuD1ijoWPLXeTF5wsweGmMZB3h0SY+1YVJ8WxxjSveVdmIrYUI/wrrFLaLhsV/jd
         zCrw==
X-Forwarded-Encrypted: i=1; AKwUvBzumSUcwWpHZaAvITrKS+zksYr3DNYOnHLV+1dup2V+Itfl0gz8WqkOvb9gdJx96ktdE03t/Db/60taYHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ0OLID3Jgn+JAI8mipgWixw1WbWsLiBX37cW8JtkkSjJ7ECwX
	jfwZKaK6t0n1cwyKPL2fSq7SE5Pz9zJD4zZFJlNrZrf/ul4QT7AFzdHM7lGRIUDyKaI+Te0Yqi3
	bJ7I76Pt/KdYRZCIXDcsdNPdShF0wthpx6AZ8GClWSM++rIipW4cTQB6f1ZY9n00eI10=
X-Gm-Gg: AYBFou0PbACcpp0oMeSdPDPhXt7tXDfKpLtXCXu8U5YZGGt2/XOKwm5mVnZrrA7S8hX
	AnDuoJpJtFY3ckKPmkES98Ci5u9IdHLj/Yx3ORjdXji9cPsYOwJRKJf3FRGYDQ/fHEY9syZNM2g
	/1YZpTKkPFYAYVZY18+BCk32r5b9ro+bgFHu6BxlJgLLh/OaX2hJ576rdej5E9QDKEbORAqI0iW
	Fl8KMMnHHS6Wp3n7lVlyrObHTpa0l9iMU6lXpjnvDJWPqYv/KHlpYhpy+kqAGUi4e1Eti6yp+eU
	STnyTUAj6Q73qiaqK3b2BC2SxYw0WaCZz3cmXm9uNjmD4fe5udXQOz+jMGHhqSfmDo/+qKfbCSC
	L/dU7/uX0oc0RWkHeKZfXG5qTOO0YmTP/GvTiTDT1MKsaB5azCH2H+/me4iJm4gUm9SLedKo=
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr14977935a91.0.1791967108770;
        Wed, 14 Oct 2026 01:38:28 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr14977874a91.0.1791967107132;
        Wed, 14 Oct 2026 01:38:27 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm1724804a91.2.2026.10.14.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:38:26 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap no-map
Date: Wed, 14 Oct 2026 16:38:20 +0800
Message-Id: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IaCzdBL3gM0uPby91Eax3nE9Uc-IPUeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX0ndrg3EQNklR
 skK0T77HB5QGlJPRqv/K9CUKy81zxGXiBmF7+c9Q5eBBVI44QP0/d6iPfRwYRc4438f8YWB5J7l
 hZKlxRnxnOq1V7BP3fBIKypLszIkMHgzTPDgBuRo/6OX4y3aUmuUNHmXDkkPge5Atu2oYe/jAck
 4nmFuw5XDFN+TYo6UQneJb9xVLWtdG0bPC7maaO859gpaqDWd41KceYYJcBKOGyw8mkvNt/NTpY
 XkoFl7kaYDvEr6Ffgg25pJx1l+FJLF5PX5LztqMOYNXdqxl3VHreLSjthLWIbx7FqYmyipzMA7j
 WG4I/aEFAjVnQ7Gg2V5Sp3uQSXgWD4FEbyf6BoRnxp9kwvH5NlnCb1n2Gs+ESfMhuaDbrdFbqTk
 b4fqNVVkiU+MJ8PYcXqhwd1aCcTc4rHdEc2JxE1PZXjdBzjtraGjBbbAkfUoCArMFpFJHeU/ces
 UElXTxQyGmOHBBHbeDQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf3f85 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lhXw38L0c4fPFhUHQqIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX9xGBoI117VLY
 kIHACNr/v6r4Ya9NyDT7ZDoKsY5e8tfJvDiA43vfDAzKqwyqRsOdNOE/+ZmhIvmp1WlBHyafeaf
 l2JP+HE/RTwVFLlcM/rbry1DvUTMDJE=
X-Proofpoint-GUID: IaCzdBL3gM0uPby91Eax3nE9Uc-IPUeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

The ADSP remote heap is declared as a reusable CMA pool. FastRPC
assigns the entire region to the DSP through qcom_scm_assign_mem()
during probe without allocating the pages from CMA. Consequently,
the pages remain available for movable HLOS allocations even after
HLOS access to the region has been revoked.

On Talos, GPU stress testing triggers a synchronous external abort
when zram accesses pages within the ADSP remote heap.

Replace reusable with no-map to prevent the region from being reused
for normal kernel allocations and exclude it from the kernel's
standard memory mapping.

Fixes: b0b51a5f1911f ("arm64: dts: qcom: talos: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..b14952b57d6a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -682,7 +682,7 @@ pil_gpu_mem: pil-gpu@97715000 {
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

