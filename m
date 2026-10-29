Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298852;
	b=aFgZOFyBuV11NkjD3SPe/zISfbtDKnJUOroMMqSTQxshvQeSTwaoD6NZA5hBiYF3h57W
	 TdeE36nBtwoTiGZbsrPxnNDQ4XI3t6Dxf0Or2keiVEfd83dN4UTttzdHO2gS5Oqg4/Vpk
	 qKi6w3cAjLy0P4aDEqX1nvH6sicnf4qLyC10xFHIQzPRBEzNP31cuiZVux5Jr2meKt0aO
	 qBOOsH/yipsOVoFz8zbmIdHe4uzjQk0npmuwpqdrcI72FK0/pmaqizTDeLzqDivCzsfXr
	 +hSuS5s+Lq9kAdNhgshMXpZQBt8ndyxeT+0ROfk5K8IfiE8yumxUNghg+1nDbIqnH1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
	b=Y+WgiNwFPiVe3ju6WPjpe1vnRRkflNYqBI4VuZxA+c4f/kkg4wN4md6HV0zIWnKlLPnh
	 R5ND6NkLDwjSwGJ1vD5pzlmniz8ZQ+8SkL6A0Novoi6kvlKYVY9JR5ETX/pU2YSgUmI4b
	 DuLo6SS3B8JxfItw5JFpNeoWXVMjVtXROvVR4raM8oKFGap0Y4QqnHZgSseQvelKCoO6x
	 ex9r9/jvWf+PmkUaRl28DNfusdOfdCzFMXjM1wFUw1maOizB1DSS5XNiiYpeS6MjvapjT
	 dEppfl0dS945arPum/H+Y4pOgljLcpa/lBIA6RMSoAhV8Pv1fIu7bmZq2JY4oB5YodQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nqg8Z6Ih;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a/mYngni";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD2606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02FD2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nqg8Z6Ih;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a/mYngni
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxm53872942
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=; b=Nqg8Z6Ihagzw7ANe
	h1hJK8haxcQLYIloiO75FemzIjJ6LlpqCBPmRYA44X/VI4LQJyiXTe8vk8zc0vek
	gUuntMQlapsbgUmjP9WWYIbh8wBSzSlmkMJ1e79GgGvk43XvKGImicb56EPxvZO5
	IfMYRQIlFOU8CsK3P3RVnN1aSwR3U5kPTdcRKP1J7j73sfUJ0OFEEdqKBZG9XQO2
	2ADDufJn+drr/YLahPjKcNdzuiKOWdrN49j/K4nxvIQOnDhb4nMIdSwjCgwqyOZt
	zK0uS6qNHErGJ8/ne6LGZLxYIp/M7wPdipglPqw+4r1uZ/WoS6YirVxxh7FW19wI
	ItFgHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7621hdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so9411683eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298849; x=1793903649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
        b=a/mYngniduI0SRahPDySYT50eQmm8bA+63i9fGFRNxskbihix5MXKvsD+vfxgtDB90
         oBDqiDiS2HJqw3B7poiev4fcNT0GuS3NX1wIQks+njgf13PZKgim6a6JrSkzpTXgeWxM
         rCB6va5R/Ojz8RxW1652E2pY64/XIoHa7ZU1yALeMfeyo3I/x6kjxWBYK/Wts1Js62t6
         I+Y2T2IzVqDhYapEscGRrQjsoqYDt6/L9tNs3CwvtYFDZ6ErgoqywFRccKYSvGLOgga8
         EWGkZ9Zm49yt5xvzha8fP/qpihL4PmUFtXTa+T2RGrd68q/ocqfGsmZXN86+T9M9ooZv
         IMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298849; x=1793903649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
        b=SFLPT1WzPJaWCngiizIFoKeek3QjBUI71x9sGsKOLmqnsX0jMQ1afP6jP++JKhei+K
         YGzumt0ULmChHpfsxN6JxFYfvfV90Z1MUnx7U4yFDxexjiDF0N//N3W5B++/D5f7jm4b
         j2jFGIoruR/3lMz4sNDA7T6nELYCcxNDHqUV8jXE8awqX2ZXtu4g9S+z6FVeeT1mNyp4
         fk6ehnMEBwgMO09HpwGhEqQE7m9MMyyEd0W1182pPOMOj9qUqfyNHE8shCmBtEROpzDt
         MeR17dl1Ewym0WNVQoeyuWL5rQUnnOzVDNFejUg8U32y8bMFznZcy1DXN1UHNs4I3iiN
         UTmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdryQw9bJ4TK8HrAz0WnSwvfgs6i+o9CsZk/W8eTwF0N/qVuyhZGSZ9evoyUkNPlPeNwQl2AqdPpauZcA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+bWucNs+y4gUu2G0FRjoA+yko89BSWagcFPzsSpIovyPfM/DL
	CnmxiM5MAtSJwcTYnz+pDzrR/DlDseMHXt8hSxnRdXg5YcQQ3S7zfltcCwXhiAxvy08fJH+hwMr
	/trt0ww7SGJHH4fhXONZ2HRihJFYIUbXBRDKPdesylvVLgclKMcl0hJVrvvFwN0PIFmEv90Vox1
	o=
X-Gm-Gg: AYBFou3edN0INwJ0i6fAxVLCGr7JGggSF0sdCs4B4BBZMcnphmT8vSb588LFOp014vI
	FXf5OICblVrH735gmvNhKy9R+75vUKr3tvcyu1RBsB953thx+ucHtflofeZymCxzqAhUWGZj20q
	Rxh1Mcn6SgH+By9mqa+nKLxefO5sO276gvMJgNUfQ3Dk8yN5KaVwsOMRglQu9EXYg+R6ILEeNqY
	hKYeNQjcsgbK1H5s7pQ+hABp6j9XuaKEOhcZFy3ivAW4sv8Q4aQvOlTqBwQQyPpr8qAyKB5uCNJ
	TU+cHuLb5kRjd8z4DPYkT2AMekiRsV4MFmgdgxjbUSR3Nq0AdN9Z2WjsNj4UYfWOfGhOx+U8vb9
	JndVvpnbYqoNpldRjrYS/dMvR/Oh2xJzEI2mMqzaPLcHct067nRVsBitm+hRtYXLtEcsDnDHuUy
	nXWtkpMiKhlZwoyZ1lnUrEtReg8Ul2xnYe74L9hZgULA==
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr355946eec.39.1793298849566;
        Thu, 29 Oct 2026 11:34:09 -0700 (PDT)
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr355901eec.39.1793298848927;
        Thu, 29 Oct 2026 11:34:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:08 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:41 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: qdu1000: Mark USB controller as DMA
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
Message-Id: <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=676;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Ot/jhWbkfz9JIUnzdEZeTq9RWVEtwTHZa8yLAe2UUkI=;
 b=3XQ5wSuwVnrZ/rUs9X+O57AKxO889Ku/apnruYrrtbOeYgswuDo2FRjUcX5yGE5RNe5Z4unL7
 VpqUNfwuiwTBTPG79DDjoEQvGjTQqQBLacWLZA6MVyz9QFynOhv28rF
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: Ef_UH-vpttk_IzZ5ueoNW-cYoBmW2Ps5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX59efJahYPqDv
 oX8UaiBpcF00zycdeNKO1UxQ+9iaAzkYcDJuS01yFMNdK+QiD06UvgjCAO+1/VOBARwK6yJ/sZ6
 O+IaIHa6Oo85Pco91Z7WNuK3rfDddxK5dKaQNmQDGKMBDOMW1H3zZeiW9epNbmB0/G9IIvfeXzG
 E9xZjjMLSSpDIBjJ5VSU8E1nI3gbfdvnH9F4zq/3NabZ6O9ALFEdgkGkGWcbfExuPPb8iMQyVxX
 0dni+ZVq1ZEj3Fi+bWxKFtM/9hKDYq7v+H7VUXzlXProGGIG34wDxkwyQaEuZOlYgthjadkh8In
 mESpa7MJmuvQprX/7qQOk6s3dt2mbM+ZzVA91tqJy/C2MYwApOxPq3thRhkDzKVKy4VEn7f/nZ6
 /fAgBrl1nHKiuM3G3FnwMxCo2tqgRxPsg8ZuJEdLERlUhdSp7UZHFqeAMVIxyvtB7W3XIplRw6D
 AOcxKphiSioiIazkMVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX8+uRr2mqH+Dy
 fOP/V4UMDWy91LJBmm7NbNnc28SWkya8bJwtMsDWz7KeJaWg4gh6ZQ4n6XvjcIt5S7vTXZKLEl9
 57fHZ3wNg1x52C4TcIEFghln+WfQo9A=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae391a2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YCH3veeWGSw_5qN_8KAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Ef_UH-vpttk_IzZ5ueoNW-cYoBmW2Ps5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on QDU1000 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 3a25b5100836..30a18360ef2a 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1031,6 +1031,7 @@ usb_1_dwc3: usb@a600000 {
 				       <&usb_1_qmpphy>;
 				phy-names = "usb2-phy",
 					    "usb3-phy";
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;

-- 
2.34.1

