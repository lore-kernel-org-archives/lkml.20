Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F014A99B3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048548; cv=none; b=icH9QcDKPEV4apaIzwTgXCNsV1UjAQdKX6whGjSLSfiyt6M3VKoOVEKtlpEerPE2JEfMvY45e7SpIOuFO2HGpOPHgoVzshsdCebNxNO5atd4eNn7EG3DXDbVzLoefA/9sibGm7GYNf4KqfcGSvBHmjg4tEWWHgnuHjcBMhYc5KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048548; c=relaxed/simple;
	bh=kfvOy1EUNv1svdDA/lC9fwPWtAQEZIOXQqACVTUcNk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qd1kfhTYCB2du7F8UF/cM1aHYMtDD6JAKHLaiDiHt3wNwzf0vb08pEr3YfwYkr8M/GbeddV+tMCvVemoWXmW+kGxmz2lQfZdK33LwbhWLfr4YatR3D3kjXEPV++aW1nRWam02raUv4a2Oere9QsJjJy1hFCx/YtiyRBXB5xq09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhIFBWJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmtMYHpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhIFBWJi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmtMYHpH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1OnXO1707504
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EB2R0b0xpxH
	CFsthVxRDB8IrajwR8tFNaUyoHo0IRjE=; b=JhIFBWJi9YmSlfP0p49Hgnu9x3v
	GZ0NP6tBchLCxdNOTE+QnIPjQlwkDX8bLS9vLX59HsPS1Juu63y4K9T8UiAOwvJl
	Z/ucIsgt/KOFKsY7xmUpIp8iCCW0AWN2fkq8KEgmsKhmk8eXgFgHPokuHZf259hD
	DGNYlkdtQCefKTojNF1K8HVJ5fG+keyK65JPmirfJ85Fxn5UsvjzZv+FoFyIyeRi
	QDgfvv4o1/AUKLAYkyADMREzoCjheEPP4kI25LGKoMSMnp98S0fA+17WoKBp+Vpb
	vHKtj3ufrGKrbhsNObc0IxWZ9yjgeXsqXkreB6EYuuFND0HvWwWEWg1Etrg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54s6n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2000369a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048535; x=1792653335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EB2R0b0xpxHCFsthVxRDB8IrajwR8tFNaUyoHo0IRjE=;
        b=bmtMYHpHxGZ34oXlyghBLMe/diEt8i0BLbWUXtr3O41/7QdhSClzqOrabmQpSoA6TV
         oTfTYb1hxOvU1+T2UIPKHUczd6n+XrUIrzW1766y1v2QXSxWNA0Y4hV6oDZG9pR3q/Co
         FDs0+NSR+hXqO655ZsbzB9BewCi834/tDwxWl2Fu/yT27DKYWUkAyh58M+3IJSKV4igM
         zSJFn7cndMk2ImrZyrH/BodHQSFZEcu2qSCMnVO6e9RvIoQ9aZNjr7z/s2VfgYvvf81u
         JYJ/ArMAUgxj/tdtZJA3XsrqhYJxs0A5dQdKRuphP0rxSHvjy24AyTDYckotB1wVJQ3Q
         l12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048535; x=1792653335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EB2R0b0xpxHCFsthVxRDB8IrajwR8tFNaUyoHo0IRjE=;
        b=OmBA8va0aowU9hVAMFErYl12hrdUY1jQA67b+w+pW14JKvCB0QpIeC0FHJCPtA25n1
         BZAGPQsft1yUq+COtttV5xEqkAY28jPghRVNSTPTkuuMpzi/LprjdRqM8BnX+fbMtw7y
         iebJzq0MPssp+KZwDuqUbe304QxVPccB/+3V6hXU/s6HzfjuMoxsykkmW6W5F2lAyGTT
         gO6T70C64/HXs+LnuD/M3Be1D7cRvsB427dIdXFsfTqTGj3u0is0XqDfpN6nINaOqU9U
         DBOs8c+ffH3Z588qQ3ArTACzYfEK1rurMu2BSF4nN+kC4brtyVHe/iz1mVmrarxPyVTl
         AQoA==
X-Forwarded-Encrypted: i=1; AKwUvByB5GCoE1SChKGcB9Ewu1liS/Z6irJBiaQqFhrxFbFQXtXUPP1AyKvp2J0r1o/lPbCa5duTn7gTsqQYAYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYDrQCK1IP256nmw/B4XJoKWULsg0sTxA899AKHK5T9b2PpoY+
	Zyek7HGdraIZjIGHOg21DlGg190jK/yYt+HlAHSV6Sr8h9eLmMa5My3/ASHpxkyPOipQQtTixQK
	oKle+3lrSHO5UIzBEY2tw+AAGxbceTSYkY6DfHCAeDqzCLzaT3eh2B5Nevv6pRyFY6Zg=
X-Gm-Gg: AYBFou3yEN6fFg9nlxhHyNSEJ2jOBEnbKJajonSjQpNBIPyhFFbuVsdK7qiChZSDg/Y
	OSqJuW373hgqCY+CmBGRa4MBt0sAiVQWfy6MHILJS5PE8rZ34hJXEkSng/ePcLpuJIt3nlBvLTn
	CnhsQCnYN2UObDmYsq3iotGVVhf3+DgUAJpdo63xzA9vyxdiDWeQyVjKX8CAxmUNiCzWYBVU6+G
	s1qx9ravtn6u3yjExZZ7WqW99+Sy68Vf9XRmbaWSF4b4zic9lCzKPzTMvXCdbQaHfVU6M9PXKZ6
	zA18CB3yo9OQmxdXgWdAwYIpq/O6ZYQ3EZcC7KVBf8MGWNMZfrZ/CmEwKHSKQ2VLbUQQDrkOlj1
	305bhYv6AD743LeQWfckCRg/mXuBHBTrb95oifEaIlCNmrQw2y6A6cfYhvczWmFCsYhgez3jw
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr15715120a91.10.1792048535384;
        Thu, 15 Oct 2026 00:15:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr15715108a91.10.1792048534847;
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
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
Subject: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:10 +0800
Message-Id: <20261015071511.977-4-jianping.li@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad07d98 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lhXw38L0c4fPFhUHQqIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX6KNtnbp9sFr4
 YZHwsUyeWYMFWlDgehD2I56aEDU7WEXrl5gfUwOFoCNL8+yFtm9L8xsSm1Sg8LnV4Z8DgDV81Xl
 OhrZwutSQYx1FZP0op9pXATZmbu5R+Ymd4taLG3A3m23dK8Y3TWNzzxkkJfXirzFwrKtb1oPleb
 lhXbarC8UbKukhOaPdwGsxia2fw7L75a393Th7xybEfgM+AJQMyjfsA1FuMFFK5XytL8wdhnrIG
 k7r3izrx+cE0i1LfLEe6PDhcLaXNQxMswLqUKHZCei5rQZnO8SQkBUPiNRb1dYIFEeqYSZnX71t
 G+hyTASFDHt3QkIBijwm905JMLKlOvPG+WZjjyVzipj6rug5BJt9FkRG2cBxFxHU7maG2Bq38oV
 J744iHjJ+/SxKOeL5cO2HM0+bnJKU5x1yzJ2VvVKBijpmGm0G9Xuhsm+F3sffyKk7W/iQ8/CrKq
 6s/B9UzjvJwlmvN45Kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXyaFuc3/rHyZG
 uwXJQMQBFuuSyBbxddnYZ6fznmXXmCBSSdBNf13zkbE0SSBSlFVJ9H4BPzv/KOe9bURxDeN3c8w
 1PavNC9AJri6hNqomYMi0SxHMX5FRcE=
X-Proofpoint-GUID: bWsWjCEGVjwbQWeUMSfCXW1dcdK3wb-E
X-Proofpoint-ORIG-GUID: bWsWjCEGVjwbQWeUMSfCXW1dcdK3wb-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable CMA pool. FastRPC
assigns the entire region to the DSP during probe without allocating
the pages from CMA. This allows movable HLOS allocations to use pages
within the region after HLOS access permissions have been revoked,
potentially causing synchronous external aborts.

Replace reusable with no-map to prevent the region from being reused
for normal kernel allocations and exclude it from the kernel's
standard memory mapping.

Fixes: 531ce288b6dd4 ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269..f415da478c99 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -867,7 +867,7 @@ cdsp_secure_heap: memory@8bf00000 {
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

