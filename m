Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298844;
	b=Th5mnFfJ365LmeAqdmxO18jyml5LQqU2XwL4bTDpizt6CmLq+8x6RwTq+DOAxjMsNCgh
	 VCLqurPtGDkyYvjRgfYp/wVU6Wkr+uFIIPBVatl/YFzWHpYIxdkmf8bV0d/mp746VrOTW
	 kmYPa/kD4H1ipoA323LPCIy5zDdsOal4km4B6EhAYRLERb2zeUPl8TorCNq8BO6yzrZgK
	 +RorFxvseqlPkzqWHvaf7ueb7/pwcfKJEJgsESxFWWMWsHWGQRoO/tVbU069ZbC3AlaDU
	 o8iIOP9drrZpJe09w5fCFGDPFR8fRaQFRng8qyozU7mJlAzRC8yjnb4HJYwFzOF4OxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
	b=h3KYj+fSFPi1fwUpetjXMooktxmpZgNl7xx/tLYWIkYe093KQbCUfcMA+qhy+hqSc09S
	 7pOcXe9lCrZotlruV734sqhKQr1s8uGUHbPyShN721HXj5iMx9Ft3UocTQCdUJ9B5ns8h
	 Ob1uXRfflEncUGTjpy3AWgIH5mgcu0sa/LLjUJIYjC9oFnbjzJGoKuYPWngtnTBvPHjQD
	 O9uFm3NKq7885DDjBtdZW0pdDpO8dhJvsNpBcvp01PMcVFeyY1QBwqSSrVCTjGA9aZH6N
	 xM/Bu1cfI6GQWLUyDhnY7030U63esYt1Dd8ks7tzBMr9jLLjRWPwvgXZv5np4xhi3gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LTAV/hBF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDfQuzty;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09452606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09452606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTAV/hBF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDfQuzty
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TIQw8m907915
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=; b=LTAV/hBFUOF3eU7Y
	P+88dahkfkq+RtwhPBCqcggiNMZj/6mdi2UzlIzsqLeysPHaeOFwKM+c1s9QilgM
	ZOfl894WdEJJubhhn/3Hb+2eHOCsVcmkg5bLtUSRB6OBSeECOqEQLS7BcneJ7H6R
	+pjcyieCg0b7+zCmZjxE64TPOW3NslyXB7ykRSsxEqOw2vLh/Q1ZOD/KBTcy+w3M
	ymdelOhrGAVTesh098FiAWjsbzwQDW7tfrPTKcla9G5Q7hbVDY2WFhrNFALcb5/u
	75Rnbde1JWl0wJmjvaa7tiNzPQeKgAbR6/WBDjyM/PhratWSu4ds7sl5a0aEn8JQ
	dkkPiw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmbear3vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2516077c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298841; x=1793903641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
        b=hDfQuztyaiYlxaBgiHMz6J7ZoeXdfMexWQ4myBh/Wm+1Z09pVYrakTSz2nde//p4+r
         zKoR1y0B/iYVyJ72IKiaK2CIF5rqhQ+co7COtjTtX2IG20BrJlT6u4n3JFA9CHRpniQI
         wp/XVnowW02ACYJ2SQzCmC9wer85cLTQv7aF3OkPn0wN3msSDhb2GfFdkPCuduNKLssw
         Hw+Kl65e2HEUYa9LCa2EpTijbyrVoNaZghNMQUixZeUkX92thlTR9fPtzFYURwelrgdw
         aJxridoM3U5YidH4aK/M/ckH3G+0a6rtRu02ltktdAoqCmjg/FQWvTe6ygPuVytF0VJ+
         TIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298841; x=1793903641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
        b=Q3huY48bQ+EnkZKK/VqUW3vgTINoSPiXWkR7euZ0hfws/i5KqrJe+49erhqZkI49dk
         3eKZTXMwv58NoaiKw9KElyYr826QcynmNKMYYHVJ9rDVEJAlLfM4JpP2Kx40O9wmZVAH
         C/nfsRvN7lV4l9IpxRVWj4M67jP0IlAt4ZbImOFiJ0RoPJhDVAKkENR9J1EkdSu4Kcuy
         d0NKgiSlvUhYR1QwXl32QyjNp8GM8lryHkvtZwXH15d2YPJANn2D0oSfcSwqpU3RXd/D
         xYGQoG3ptQSBXpZ4iy3bmJIHk20n1OMuKj2LQ6OQOReBLYSuzF42KPtMvuxZkeMQl7Gx
         B1sA==
X-Forwarded-Encrypted: i=1; AKwUvBzaEJoCa3rYLg1M3oQ5lbMxRykfMSZ54VC+UUYI3qVx/atSnQFlY+VVRqYrNbZ0M3IIToKKBFJkgL325AA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnUHIYMhVnP8E18Mx1W+qs/o/a0hwkk2V16Wwrm8dbelBBBqU9
	8GbCYUC5LhYQM7GRw1tbpIQuCHlYQ9Ph1oErsWkrJQafofaFjQg13eejjeLTHej1zCMZXQWgwHS
	IO6ByArxC4VFqrKrYnE36DfOCLhyTUmxRoEZ4uANYV7BdqH/6hBD9bEICWE1xhv8iZGJ9CtrLsA
	E=
X-Gm-Gg: AYBFou17ZgFFNPzjU89hMzWMY+XQGj8Y89JghaIvamer9Ku52eMI9G+EN8LJdZb7PfD
	NS3SQtjcilocZi3vwiffYzEoUEyMiDtgtBePPX0wUMALRjh/UnpG4xoNVcR0q08upKv26iZG9XE
	CKnxGA2VrCGf+KYmHSv6bMZseU7eR66cOmshunuhOgQFD49g8DHf5mkevwkGy4m9DjRJgF1lKpy
	ICnZGWxQ9CzN52PnCRW/lxzpcnPBO7TvKfTFsbEZSzibBWcXVkbg+eNScKAsLUjBVz1WJg2vKt7
	ZFKkUuMZU+voE6i/eQuj2dz8bndlHxaTyFM8OgE4pzVKXm43K++IULvlSlos/dzukYYpGW0UeQa
	ZW5/3bvXVO/C/kgpfgAE28isXu/8Ku56k3F5fWaopz3Cfq5s/Q6UZI0ljwU5Upmy5SZh+bAuxOq
	NRv6Hu9ByH45AWGkLhroWQtRObFXY0rJZ1RrMGykMEPw==
X-Received: by 2002:a05:7022:ed07:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1a6cca02dadmr8092436c88.21.1793298841233;
        Thu, 29 Oct 2026 11:34:01 -0700 (PDT)
X-Received: by 2002:a05:7022:ed07:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1a6cca02dadmr8092406c88.21.1793298840580;
        Thu, 29 Oct 2026 11:34:00 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:00 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:39 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: lemans: Mark USB controllers as DMA
 coherent
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=957;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=rEgskIUnrUGNrQ3rmaRBXMYPTob7wd3lSfRiOcGwpE0=;
 b=xzFtGNopMJEEx08uA3aSNHk0c67SVcSW57ix87iGRnKA9RHsVCeUTc9+PwlS18bkR9BG4xp/c
 SrV7SJQhiIOA7WNv3S2QZw4Nj1Fehl1VkpgrrWf59rWp1LzfngAGPh3
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=UejE26SN c=1 sm=1 tr=0 ts=6ae3919a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iPg9V0jjAPOzTywj0KsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX2KBV2Pl/D1MJ
 gDRy/NZtyIZc92YzWdVYATj3f4Aia3e/afY15h1ZL63st+0/Yb9VrlVYo7LS/TVoWo15qWQ1/dz
 8n8q0zTiEv6w3bFc4wGxODsu6+dP0rQGLbiDSoqjayQmpoT44Cvt4geJiCOY4N8irk/eBLVOuEE
 NUUuHQ+2k8+XGiM3fCIUpEzXl9vqaV44q7lmpRgPNMtZS0bSl5YUPUwibxp19Lhb7cN6DKUh+zk
 fuyE8uvTUTazIEsBpWc66k0rs/fUWojJF7XywcYjTOHj51OI9d6wjihsEHqPvFeJ9Z7rnhmFb61
 eHWmOWfLOAV+pfTX57Kkd+twhw04qDbCzIHnK/4viaM1O/+7/2G+7cYBDs3bTRFU0jzei+5T2LE
 IMYSVczmh+SfpTvd1KANOBxkvjNPJw==
X-Proofpoint-GUID: LdnilnQ7a7V_bl3-cUMcrn2qp7vPyTCL
X-Proofpoint-ORIG-GUID: LdnilnQ7a7V_bl3-cUMcrn2qp7vPyTCL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX2nHzRXhlmuzU
 HayvvsIwZ074oRtJ8c+HkRgyVVCBN34YzDjBLcolLChC/caUuo5ZN1VlYwK3GeClYcVTAvf+vMs
 Ry7qdIhHMbqZ1JtKSytDgH+PgURUnsg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290072

All USB controllers on Lemans are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..d7d3e784f093 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4501,6 +4501,8 @@ usb_0: usb@a600000 {
 			snps,dis-u2-entry-quirk;
 
 			usb-role-switch;
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4568,6 +4570,8 @@ usb_1: usb@a800000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			dma-coherent;
+
 			status = "disabled";
 		};
 
@@ -4616,6 +4620,7 @@ usb_2: usb@a400000 {
 			snps,dis-u2-entry-quirk;
 
 			usb-role-switch;
+			dma-coherent;
 
 			status = "disabled";
 

-- 
2.34.1

