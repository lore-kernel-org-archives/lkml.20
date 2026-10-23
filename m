Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738940;
	b=VKRucvXfS2WcUpQAQ3TOcHlKl59p9C/0p3OierkGgRJmQxpwuCfWbcS8MZLydQgXgjgf
	 4sSvQ0Yet7eNEUPicnYkeTwY9cV+vp9l/KZ16bsVgwpVPYDNb9aQG+7AOd6QYPvuPa0HD
	 BDz0jjFNi7YbsPG4oksDzz62LFLVuGGnPoX2487uB6VhmNhacD0czTIRIxZRI+adVA6iu
	 A+OUCIJPWiJPMoaSGtv5c6ZUUudMw2NmTtCIBUJ13C3qta22u9AE/y0REsidQ1/R/YoWI
	 xEjAatKZ21l6s+RbqY2yjd6aO3oSPDXkEMiNlV1/XbHVzrQj9bUjdyJbF/nxf7lfc7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
	b=5Zsq3CunVrb7jpLhOW1D5sxYbV9UMi/V/1oTC59ruz18E1OPbmc6W061qklhhxO7E1jr
	 xncMD0qel81SLRCoaIhm9ATm7xeAqiar90l/URS/py1dj1wTw0BIcxY4Ix+u1A4Rm3p8t
	 NnCs4+N+o99MPP+MOO+BhaYffv7TfqtYXYheX9zZF4R6+VFede/SjPRlH4r5ajWFGBpdl
	 4ppis23Mei7c6in5BpnIsKUpv100L4A5VZn5Zu9+4S+O19ZYFosx61mW8/DOoWcq8w/df
	 d1JyKszwtQ6YNRbUHCysg/LNTCdGMUj4WoB3JC9UdTd8IcR0ynYqANUdF7fRADqibDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6SmZwL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoCnkv59;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7673E606AC96
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7673E606AC96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6SmZwL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoCnkv59
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EtG52389432
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=bI6SmZwLCFk7Z0ok
	Sn9qNsE4URzMOnntz1F/3GzPqys+FvgZKSAGJwNa1ILVlXQfEhArYnOwlOdzpLv2
	XKtvkoQD05IXAzIUrHEWk0sSxR5iiwDC13s0t5KrR2lmZTXltVJMrlMXv1j10H8x
	N+BhvbiaBgvyxFIG3o/G3v1DcUUlhfwWVfCAxN5z4XGu6/LLMCV6zUmfw66Ia4dl
	O6Kdf8VoanQdczSMZ2fCp09LmJHa/Q2PTQk5aIsdxHFzYzCIiFEnU9BQR2G+A/C1
	HD+rGp9Y/KWl/NzbihKqmyAofU7E4dcthGXOCvw2MTvyqbg025WAVbfJQ5TuAkwu
	A4wg2w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpac5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so434743a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738939; x=1793343739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=GoCnkv59qK2VdqnYNVSgqFYzLeBeiXJtyHg5N6bJqC0bNIRdBV4qJrSpmPglQEcwRR
         DPDrWSlwPtNZ3L4TsgaLW5RjzRQEaRvoe370BttoXeBvUGuxyicOvSrYoole9+tur1KU
         yz+FvKDD60y36uKyALcPGfEvFC1u+a/1hAjFMX27pv6e2Y3uzgAA4pcSD1P5I1Mxeswf
         VHOo4/FYjdXcwF1NSudloxu9oaqpJTFKzdinKe1cuFFMAeifvnIrhKDSa4ToclI1jz8O
         6nfBzziwCPjxQvkagqIXHB7r5YLr+90WoZg5gZq+n5/QQzrhM58tciYwUBFgq0Pc8Nhy
         fVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738939; x=1793343739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=QAWitFu4pLLcn5/yycNqDGG0qaUrm3hITA2YCBeGEQjvnwJ0M8ZBwYbTo1IllC/zhQ
         05UFzbVC7PB3B7kLiN+NqYDIZcCkXbT58IFHak4/BYqPia+PBGnoCo/TgUhDIECQEbh/
         if3suIy0jRMv4KALvzOr3SrScrz3fAFPjuVMVKZEpU0e+qGORZQvZJUFzQ/umvxEQ3tf
         sm4HdmFfUbAlO9gDFoKi7JDxAg5Yl3cBc3ZCQUMH3tnmFWCR7uO+y0jUgZo5Ewv12wyB
         jvVa2rU4nmWzSsG8Glku0YxwmwcEq6aLYMw6Bg0i02oE8m5nTnspKwS9RdifILuozVjh
         WCcA==
X-Forwarded-Encrypted: i=1; AKwUvBwOyse5/+g8sQKjWXCIyLPw78y2Y07LqgGZU+C2YQJ2kJXt9RdQ4c+6VMEgNzXbNWLUYtVTB0aRTHivvjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiPfjHQzhsUZNLaqwETb6kC7/3XysV8cteQnwwBnpfmw/lYhB8
	/IV0BGJU7Zd3QypVeqhdQhEywQql3S4U9Ip4gDEzRxGMlQa1kDvPt1I7qTP/VCHflfEK12cw1Zn
	IBA6vvxjOSEuaIAEmkgYsKADoehlzjFo6ynr5mdW+9HSPRVUD0nRWMswHDCVRH7vLSck=
X-Gm-Gg: AYBFou3ft1p5R4HS004/k9z9ZvAZvZju2aaaFyQurgf2KSiAY8Nw4ngEleVbJy67UKQ
	9PTbRCnBjuKjb2B/nFeZN4tWbNp/TtmBLAfMAkXcQj1lOezXHrMpt7Xph8GRg0+H8jXUX32l27U
	E6VaUaC1YepeO2hxGilDtXi7xApKhVLTLxsKy5cHmhjVbkJ1GLJJdfmE4wfcbYCcNtWLc/ct6PB
	G66qc+bsfIJ4ZOMKzN/tohaOMAbalsW3syGB2wspEGBll811z5K+b74AB3IAHwaEMj+icIxZ/1/
	Kljg1lzGr074KX89Nk9D1zqA39hnr+piUkZUlGMEBYEIVLULS2H2nqHz0Xw9NPQ0wWyTqqutraV
	ErAAzEcpMykzDVOG0DOSJqxIyCQKYwIhh29Ub7RVYoJz/NnecRY0iswkLoB5b/TstsZ/3WqbkUk
	KQeDwMfSChEruXnqIcugpGoQ==
X-Received: by 2002:a05:6a21:7e03:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3e359a4a06fmr983843637.10.1792738938940;
        Fri, 23 Oct 2026 00:02:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e03:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3e359a4a06fmr983816637.10.1792738938254;
        Fri, 23 Oct 2026 00:02:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:18 +0530
Subject: [PATCH ath-next v3 15/17] wifi: ath12k: Derive QMI service
 instance ID per protection domain
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
Message-Id: <20261023-mpp-bringup-v3-15-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXz5/rsWLFjA1Q
 JoSAlOaBpVhelQdDdDiYGc3s89Xo+KhYF6fwh6BgRrLjN+jOxXRmT6xIXm//hex/KoI9JKvIPGS
 vHfs/keBUg0mNq3r4kKCtZpZXx/TpfE=
X-Proofpoint-GUID: gkMbNLZB_CGleM4qsApbT36cp-H4rMtf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX6JL+SDbrqF0M
 5BAPNSskKU+2FWGAOqEFX/2tSMTcPv9hw4W3WQ3TUBq7HfIKrq9M0PUjwPcKf7WkraUoT/R//Ni
 w95eSNhrxS15GqyqvBDo4R9tbn3EcbwAi70tdigZoRE8tSU4N3e/tlp7MNjmt31wStIsuH+3CBo
 x3V11BGqfGlgsbXPraXWUJ4enqVZRefBvKjelrp5CFv+jf0Lnc9vEJpX0UAcZd6+b5Lx4OonNDo
 juvUJPcoUIyQsX/OiFP1zNi3V3CMVZEuL66QIv480cs4i4N8GlRh5JgVumjq/P0Qq3Tr7csvOcq
 d7KnNiJBNbbq3gYNJUJvlGYmouCKeekj71Xi0sfS8imoNDL0I38Sobl+CsYrmSqIGXxxj21+6m4
 W1bH/ZmQTGzX+XGEzfatN9C071L3WrSWCNJ7rRuZVFriBuWUHPkQgs1qnViHCI4GaxsZraGsuoc
 UGFjNeiC78759KVlyYg==
X-Proofpoint-ORIG-GUID: gkMbNLZB_CGleM4qsApbT36cp-H4rMtf
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb067b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1lU9L7Y0PnsvXye6yGIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

IPQ5332 platform variants are supporting multiple Protection Domains
(PDs), each PD exposes its own instance of QMI services. The current
implementation uses a fixed qmi_service_ins_id from hw_params, which
results in multiple PDs sharing the same service instance ID.

Update ath12k_ahb_init_qmi_ce_config() to derive the QMI service
instance ID based on the user PD identifier. Offset the base
qmi_service_ins_id with (userpd_id - 1) to ensure each PD gets a
unique service instance.

This avoids QMI service instance conflicts and enables correct
operation on multi-PD targets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index b9ec14e86def..cecafc12e8a8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -567,12 +567,14 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 {
 	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
 	cfg->tgt_ce_len = ab->hw_params->target_ce_count;
 	cfg->tgt_ce = ab->hw_params->target_ce_config;
 	cfg->svc_to_ce_map_len = ab->hw_params->svc_to_ce_map_len;
 	cfg->svc_to_ce_map = ab->hw_params->svc_to_ce_map;
-	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
+	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id +
+				 (ab_ahb->userpd_id - ATH12K_AHB_USERPD_ID_0);
 }
 
 static void ath12k_ahb_ce_workqueue(struct work_struct *work)

-- 
2.34.1

