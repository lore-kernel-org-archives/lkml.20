Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792947720;
	b=AxFCcDJje0sVaRyAmG3t78nToWOr0o/bFqIdXZtfs2Ok50bV1CKEC8LA2USg5wA0cPHo
	 k3eauqp3pgRdhZAkgvw8UnpwW61pMBJOX0ReCZKmngJRpi/8yoYW8D3/yzIy8qMUSAJZt
	 HaxhQlxmcruwmRCN8JtfQQ0p2Gkeu4TDY3onDJEBj4rC7jfkwM6RzBuQJHsmQ+sb+r69o
	 zfbWNqXcpPAoU96eMa5oHSAnzPqrbqt043AhTHxN5nXqgvW1XbBisyNoBStLb4XHRNXok
	 RVlZH3kAKrHldWL79OYDIYpWOTc190vEDUsJ35GIgeUhGuWlFrGzrWQIf6pOhi/xL3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792947720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yC4Ixl0yXMVt9ps7yzBx2x4QC7PQ27qXmobL+RWzIck=;
	b=sFShKCrCIv6HVZHWTobIPsqcrqnFPNYu0/seHLylQfLp7aNUJCIUNNi2u+QEKJIMiYKB
	 0bWq1FJhKNdlbT7EMawNDZcKC6Cbc9ywuNIEfPM5jIWoa9sXyxlUFBmqWG4VNpCN6YkER
	 e6s40PjzP9GZVgP3jBL55M/spi72sRM2wptQWi1ln5zxvimSDGiS8FouP+wKCKZ5hE/JN
	 m36tSjMZThbr7SGu2tBwGAAHn1k9K+wif8Dqnp804/0atsMNqM2e6+ej8Ns3JZgjUgBD9
	 PzDbycWcetgrmU/EjBmVm8RAJ2FsLANeeWiRT7m61wO65tyxiT4zTB7mcQu0603joeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owac0YFS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmdILhxn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C9606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 852C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owac0YFS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmdILhxn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PFj7571735044
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yC4Ixl0yXMVt9ps7yzBx2x
	4QC7PQ27qXmobL+RWzIck=; b=owac0YFS4DUXO5Y1TyTE1MxsunU49C97lX/k4N
	HIhbbMP2Clx8mwx51sSR4YtrOG4TtoI29MZgU43J/tZLp1jKz51cs0NdpGMhPhHn
	cPP1ZbX+8p6XWHjZeNo3W2CNrGrc6mRa33AtQ40t4+laQtQE4eht1fHNIqYKZOM7
	f1mNR95/H/oFUnhZdgajy+k3zSk6wcEiMdXHAz6wFPnQVKud+sfOKttuQBNm8tgI
	3lD9sQBi0guYgBgb8BWH6J9f9wIl2N1b7LY2jXRj5Ah5hBWRpq20AkgrZOwWNMhl
	4i9dIcdCKmFZIvm4ZVeOIsfpar93ooko2baqMQo+ArebZYow==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgut4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:01:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18b5ee75447so10041485c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792947718; x=1793552518; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yC4Ixl0yXMVt9ps7yzBx2x4QC7PQ27qXmobL+RWzIck=;
        b=TmdILhxnW032sQxpPg06VZKZraK+WCg1PCCuxnKviSMq11Hq8T9AsX/Mf5LcoEz5jJ
         7GgJh9vSuT6aItpMTsTKMZslYypOjLGTVoUkcrK1v0ypgU0q+iWVPCiFVeqN9PA0Yaax
         Qm62fB6AvZlXzfiQ7KI+10kPdPnbjMSlSH3tPL5BLLIUDRNOSwx4pj8Ei8vaadQbbmRu
         BtTEQ9cXZg+y4mX4On6fYDJ5+j/8frUUIBNr1WYPkw7YIwCE26+mFC2GjRrUMMvfadcY
         VsMM0VRHwMXYDoOt/73ZpcQA4h5NfKe373UhW3YTkkwpVUwCgiUVaLd67o8JSuZWHvVv
         HX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792947718; x=1793552518;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yC4Ixl0yXMVt9ps7yzBx2x4QC7PQ27qXmobL+RWzIck=;
        b=cObvOatWa2zT6jj8Z4UnymQmghqksrEvY8siUDxELqfI3+aNMbnqufT6OFfPBIFcWn
         fmfXKNvp6gtvY7EGfAAf1n05h7k54weiFOYzkjHXlolkgkngCpmxiSMeUrJ0LLr3chZH
         Azapzf9tH+iy+KpjaorKiOcycexP1ZA4kKEQ3KESEfvxQxH8NdJC4ow9AqxO5ddHBiuI
         k9BbZCxvCPpSvM/dEsepinXlTrArlPTRzvBhxC2JdTy0aAdMWm3fLSbLN13dqIeyCV7g
         lUgC8T1wWFJh152Nz4An0LijdZJIO7tDELxCew/wJUbxlGjFIK0eQkojKyBio+Y1WfnO
         OACQ==
X-Forwarded-Encrypted: i=1; AKwUvByIaOh34kgRqdkmxYcTtmX+JNCfzLlnhEZDPRHnMAwApupMTdCxVlNLkgcMl4xA3ONGjeP90FxELVuk0TI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ25KuxIdQJRKQ1/GflqHasSSI8asgDN3Ayxqjl8uZgA7vJXYUh
	Bg4XlTT/pkQB13+pSm3qonWpCi++2F48tMZQ/zXKlGnaiUHpkrSlBek0aKDVoNdoVePN9SJC7kM
	rwkG721OCIVMWT11sCEXOOr9pE5+GFDgHygMr6smwxfH9oClRZ5fQR5W5CWZjaJAXu/g=
X-Gm-Gg: AYBFou1LIxXIyY7pZAUtHhrpz6ztsN8Qvh+2D7qCrox1e8uv9NWgPQWJ1Bqeurvt9Rt
	U00Q0mdxmUwtPhY3Eg3C69mscVD21Orwg+/D2GXt0rgYWedBgbafT1KEildwdHep8PgNfenzVTy
	k4DCjFgIrZ/AN56HNIoorO7RXpx45fLiM/s7V7C2fMN1uw9DlMSX7kSwV5q+xuZgw88oBAtIYO9
	EYfT7o9wUnBGwdWV6WbqWpdD1o7dbckxW2sxLZGNwzYmJNefdrOdm8ogWN7eqsLliDI+ZkLDKDx
	avyZV+YBYX8ZXFAkPHcC3Z2BF7d5xKvASevSYcGu6NXqEaCmhxd0mFTsYyIQJ4Xh3tcezFXTPFR
	uO7ZxqBn1EBSoj4PAGiWs2PHSb/aWyOlfvlA=
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id a92af1059eb24-1992a250624mr6956621c88.1.1792947717896;
        Sun, 25 Oct 2026 10:01:57 -0700 (PDT)
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id a92af1059eb24-1992a250624mr6956585c88.1.1792947717240;
        Sun, 25 Oct 2026 10:01:57 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm15783683c88.19.2026.10.25.10.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:01:56 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 22:31:49 +0530
Subject: [PATCH] soc: qcom: geni-se: Leave resource management to protocol
 drivers
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
Message-Id: <20261025-gen-se-remove-resources-handling-v1-1-e81da6707b5f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPw13moC/yWN0QrCMBAEf6XcswdNoBH9FfFBk2080UTubBFK/
 91Un5aBZWYhgwqMjt1CillMamngdh3F26VksKTG5HsfXO8HzihsYMWzzttYnTTCuJ3TQ0rm5N0
 hjPvohxSoaV6KUT6/xOn8Z5uud8T35qV1/QKQIG0RhAAAAA==
X-Change-ID: 20261025-gen-se-remove-resources-handling-d2196f7c25d6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792947713; l=2930;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=6JW/djw6dTCF/7ZGylf7GTqpGywoSaSaOyRPyUnMUss=;
 b=R2XETQTkjObqFm78AwDWWeGYBSLyBccXIteyfAExZ86jjiIPTIeHWEgAILpyivFab6TSW3wCM
 1yeY9NmjZwKBBPQRVuwLn7VQSg9bpObGykg7vUPZ9vUWPF/xACsHGnY
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA2NyBTYWx0ZWRfX1Ako3Ci6o4ul
 mXc2aANFjwH0Bsvy8tCh1da5YEYElZfEUawUf766p1JpP1wGUeNvOFer4/sxVTBiU0jfzrDA93M
 oM1b8dxpzQYhu9Dub5kL5NrJqvUC+eQ=
X-Proofpoint-GUID: hSbSsv7HTQXT-rlAmoynD0Ca5t0-j99-
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6ade3606 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DVgANZ3ww1WCvfZeIL8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA2NyBTYWx0ZWRfXyEInm9w6r05L
 i/TRy2t/CBdhhNCxQrD01CNbt0HJwGRuMedwTD7/IuO4FlfJS5F7/5x1UrVLSn8iAYxKeds7Cy8
 6hdBKUeul3wAuTPh1Jk/pvLKewyNsgyX5+qBtIJymjYptjoRQY6n8U4b5dXLrqYMiXAkbzpwAzX
 Mg/f5RIwtNl7LkekaRJI3C6HRt2CrVaf1lFsuFPeUEITXss4b4wO/qEkAYH9B51LMd2yv8iBAen
 BeAoCt132eFmI6f/wFKLSg07G0B3wiOZkk9CxCEkigQTMmsKaMIEviOZc4+tVy7REO0ONaoH4Yl
 YFNtQwVHYbv0AURUzDFMw66xnWVbImUr9VUtoBiYjnRODvJ/0xOtORInsBN3wImL0oD85S5Gb+o
 +Zdv1HGlokDQd9c417Vnkt3VjVhgP7bTKdmcFegOP9qjfbCwzrGCX1L3b8hSaHHt8lAOafm+2Ex
 /TP5wNBshH+kLnrq0yg==
X-Proofpoint-ORIG-GUID: hSbSsv7HTQXT-rlAmoynD0Ca5t0-j99-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250067

Protocol drivers power the Serial Engine (SE) up and down from their
runtime PM callbacks. Firmware loading runs with a runtime PM reference
held, so the resources and interconnect paths are already enabled.

geni_load_se_fw() redundantly enables these resources and unconditionally
disables them after programming the firmware. This drops the protocol
driver's ICC vote while the device remains active.

Leave resource management to the protocol drivers and keep the common
firmware loader limited to programming the SE.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 074087c592cc..ebca60c8496a 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1453,18 +1453,6 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 	cfg_idx_arr = (const u8 *)hdr + le16_to_cpu(hdr->cfg_idx_offset);
 	cfg_val_arr = (const u32 *)((const u8 *)hdr + le16_to_cpu(hdr->cfg_val_offset));
 
-	ret = geni_icc_set_bw(se);
-	if (ret)
-		return ret;
-
-	ret = geni_icc_enable(se);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(se);
-	if (ret)
-		goto out_icc_disable;
-
 	/*
 	 * Disable high-priority interrupts until all currently executing
 	 * low-priority interrupts have been fully handled.
@@ -1514,7 +1502,7 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 
 	ret = geni_configure_xfer_mode(se, mode);
 	if (ret)
-		goto out_resources_off;
+		return ret;
 
 	geni_enable_interrupts(se);
 
@@ -1541,11 +1529,6 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 	else
 		geni_setbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
 
-out_resources_off:
-	geni_se_resources_off(se);
-
-out_icc_disable:
-	geni_icc_disable(se);
 	return ret;
 }
 
@@ -1559,6 +1542,10 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
  * UART protocol due to lack of GSI DMA support. Requests the firmware and loads
  * it into the SE.
  *
+ * The caller must keep the SE resources and interconnect paths enabled for the
+ * duration of this call, including holding a runtime PM reference when runtime
+ * PM manages these resources.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol)

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261025-gen-se-remove-resources-handling-d2196f7c25d6

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

