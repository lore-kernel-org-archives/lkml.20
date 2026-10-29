Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298855;
	b=uzgyuIlvkZn/FL76o+wyJNtZ8hcu2tXM5oKq0aTwq10VwJG9voQUBeXvXQKSDsxd8alY
	 KgYm0HgwfTUV/aWDdfZQgigGB2JFUt48fsfdlWqKwEPgKVGcwS8efHdJHdJ4N1zVS9Vo4
	 qADGLcOfUFkgViyqZI+jGUQHZBVNardCQ2SxXl6xEvN44sh9yIQHG8SICgT3k/pwyNO4U
	 KuANI7FrX1vYed+9U0ofmHJMQjlXS7i5zPZ/DYzv95imaEHqROyRmfghzdUEuINq3pBv6
	 yujIAscIB+cJhBvuIx5r0DyKyd5a3ZNnVQoMGnuq0AnKFBf490h3sOMXNPNYlqP9dZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
	b=DGzYJaQW4KSPDdat+9vZ7YQDIuQemKAl9o9hdQU9xBf7L1OahQPJ1tTi5A/Kr7ElgmGq
	 JZ6mlIJupM3mPq126I43T7If756ugCBFPczXkEt3qFxkdH0MA8dyNVQKnkqn0y0w0MeLF
	 RcKrg3m4gDfxfZq8/v6flCaGaKjveYjJfXj8alZ8HHLPUwP3wEmqHgOHXjKp3B0LRH2Kh
	 wpXwPZorEwYS2P76W6dTxdDFU8K7or7uAcSfzzx+ewhxR0uRPzHWiFfW8waCRtBF1/sxX
	 M1sQDjrB4XwPbFxs7WBvaQKeKvnaOLN+ktjDNl187ldaY1OgVXE3JD5VpmfaYajzhig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHwkIn4B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgnQg1xT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A66606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A66606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHwkIn4B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgnQg1xT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TIHwpC879711
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=; b=aHwkIn4BUiWww/ES
	rRb0w8vGah3Kr3xjIPpp9gCYDMJ4JXolfA1BemYnClwWwglgqTVIDiUNXyUOIWyE
	d7/S/Sfu54v3SQzH4sXDg2/8A061xIe1oA8+sJB+/dzjHDLvzf0x3OfeG8Ykpzz7
	LAOuqOgx6JkqV8yaYagY/W4GO7QwwI/9aNSJ9l9KW9+28ZQqfLV/YTSxM1Q1PoOB
	g+DlzNnEyoqiIDuLfrQljMygFnMnAJZDsRKZScLNqeoy/UkUIebf9YXTAnfLVuaV
	SyI2b1vrzLjMV7It+AewtuQ1qJ3ROAoYKkVZae0OTZqNk/PR+ET/MratsfUhYRef
	P9TwDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmba4r3k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a1e2485fdso4976120eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298853; x=1793903653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
        b=ZgnQg1xT3p3rrqn7JgctH3yaPvLiPEzEnlOf33Yq5CqDLvfltSghAUlJf4X6X0aFJp
         qAp74icA98aHeWeGNzdJRIkrFVAYhmYerNySSzenuHzXE5iTkpfOKycnS5opWsIrN+rg
         b3LXmypuLlw60IZReS0g1oB6zw3pSbPMB2gSujYjFJIMNiUJLNYpajymCJpPWUiQ3qpN
         2sKyLjmlVXIG4QkQLKjtg95T/7ldaWPN/XiG6xUg8EiNGoCm44AyHSRi0Jggk0dIvIQk
         qRHRoe9KSnARAubxLXAXhjxqnARxzWMxpQ/1IzaTqe8dUX69dIektRJzXuVQTUkCraiF
         31DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298853; x=1793903653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
        b=1eAP2laCx1u36mRkn2MlxPjiDOrzinNlVAwFvezyhZFgRVCKm1cZ006xc37eHmHBfD
         eIeLbQQLEjGfAJanivmbwjFZGlzTOyjjlsBBp4pvrH7w859EbUXIF9uiV72+QcUnVEU/
         Sv0PqmyzZLvLWkopWTHqtD3gta9r5KO1VXJLrsvD3ANeJpWED0qOz1Iih5o0QjYsZc1a
         s+14BaubZXzSn2PH7VN5Sa0Oej+vNlNU8sCAxTo2srAnEV6bIxCzSusrp62tUyFlreQC
         b87mKfnIDtZwqOZuU4nDM6Ubw3Pv/UOS3H8QIWKok+FTBJqlCkaL9squeiP0Hl1DmLnb
         1fqg==
X-Forwarded-Encrypted: i=1; AKwUvBySgfVTMCqO/2q4iAo0hDkNI5Mw1R7yFGGq3uAVhzMB0TUo/scci9V0KTc2/sVQIRx02V0lRvUvg2XZP/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5StS0TsJC4C7YaEHz9kzszB1P1l5T1YBkovf5e3cUeaKx+GQe
	2gd23tbT1i3QBEvAB2Vb0MwkL0bjiDf6a2Hu5eq9yWwCRUuXximmj7SYGtaRmcOlVwGJVmszw2c
	wIuMnARKAIH3JXasXHKMD0PwWYlHOFwyvcPGTt0ZzTUB33W8GrEfRwST1eLSzxWcr9a6Dak20AN
	4=
X-Gm-Gg: AYBFou0kjnP0gqBuZcpkTK5DBtdW5+uii25LzVhdjlO7NO+F7iol6u+NblP/0LkiNpM
	t8BcKehTsGKlmeFroA/7D0eqtspVFAXLoN7/p3MDvWDlyQcDeb79YJlyBmoHotKxlzsUmPoTErt
	SgabgwH58djETGH/F8eyr0DdUKvaiHueuui6Wl5mORZoaLvkluXU10u1P8TLHNdWZgjenZNjKHR
	oQed75kJ8VwslyljvKkBJQCN69fapk8OJNVBr9wlfFsusd9hoj8kpfqimCvYLgVQ0XZrlmSn5fd
	RtGqkbdtQg7WecDC9ov04z0WzPa0dudyNuPkSB6BYDh+fAyCReOAb/zkps5MeyCrWryEps73mHc
	MV5MWj/J934IOXPA9WeulYHN0iyuDIFSVNf2gnazmWMUsBrJZUZQEf5IEpFE+sdk4iCuNoOh0pP
	3JM0qDod1GpsXiiPEMtUfOEjHsCV9ZeZ52fnVzFAYjMQ==
X-Received: by 2002:a05:7300:22dd:b0:36a:1c46:275f with SMTP id 5a478bee46e88-36a4244c248mr298724eec.21.1793298853398;
        Thu, 29 Oct 2026 11:34:13 -0700 (PDT)
X-Received: by 2002:a05:7300:22dd:b0:36a:1c46:275f with SMTP id 5a478bee46e88-36a4244c248mr298682eec.21.1793298852836;
        Thu, 29 Oct 2026 11:34:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:42 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: kodiak: Mark USB controllers as DMA
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
Message-Id: <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=882;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=LDViqDps+gY5QGZh6wRwg12ChAW39TTNsdfn/yvqIEo=;
 b=bdO16iJMaKFPsmggJlsJXyAJfM+tP/adZF4InmvAazAB0QpJWs1nsfuIq8QOhXQNC25J9Ez/O
 t/4uG3/qLZsDtR8DUByyRTO53O2K2UOYjEpjmWYXse2XjTE9uSjp3m1
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: gf4wsvzhzgnQyUih1L_h5v8ps4TzgUVu
X-Authority-Analysis: v=2.4 cv=X8PHu2Te c=1 sm=1 tr=0 ts=6ae391a6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_R9ktDxRehPmGBbURfwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX0YX8woNbm7ip
 hMFRMNKAlm18dOlK90VDDmO5UAEfexNCcCbtt4eaigfxVjmJ9EgZW1CB/+R5jdlDxlzUC0qoxpK
 oPad0b3DRmsQZc90DE3FFjtANXfwHhLiEtc1JuxFM1MUU0y0BB8GgaKrdITsjJBUXdynmNK+T0w
 wZ4P9mN1ovwotp7X2RzosmbbXcmn9udRmGChHIZ1mlkZw0J0JbayfvSjaIx8ZkNKXEmk9h5+koh
 f1S/Qpas9IWilUKvyyRkdZubZLtNWQSBPtS2jagTNIOray64azN9FyXJMJYR/3tr/Kl8c7OozvV
 PjDoJ7uAWOVCWK7PM8r82E23qMsAUXbKyxDvaQ6CZqPJtHc3xpjFp64P+t4dRSeHG8o1qyLXQSa
 VmlPSZxGPo8PWCCd9rRcI2CcNaNCH64SPBbsUv4+IDyTvJzJHmUOgXrMIJT0naQkrbnZpsRBZP+
 Ea0YTiXn7y5EpEz/N0g==
X-Proofpoint-ORIG-GUID: gf4wsvzhzgnQyUih1L_h5v8ps4TzgUVu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX5bK3Vl0jF1MI
 XAZ9PGNka98LdQjsxCjxOI3oRyb9ZkzcFhIuF/gje+JMJDPlWVFeSvaU1H2Eed6yi4O8HQCaTBJ
 OQQex3oeXMlBMfjS8JKYMaQBJinsY40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

Both USB controllers on Kodiak are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..f8008ae3680f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4434,6 +4434,7 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
+			dma-coherent;
 
 			port {
 				usb2_role_switch: endpoint {
@@ -4993,6 +4994,7 @@ usb_1: usb@a600000 {
 			phy-names = "usb2-phy", "usb3-phy";
 			maximum-speed = "super-speed";
 			usb-role-switch;
+			dma-coherent;
 
 			ports {
 				#address-cells = <1>;

-- 
2.34.1

