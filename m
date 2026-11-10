Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328773;
	b=f0BK/quA+uDe5YkXANsVebQmzhSIxC/SdKKkdtKa864+NCjJk3rgl/yqfMHsy19ALg8e
	 7VxtmOfx4aW9cAHETSmhbx4Okd4XeGpxnl38pk0Bz6HT9X/27V3VDSp36K9qTxfnHyKrG
	 O/pDdOSMmeUH0rDkUdJtp0zjm0ZQLKDTzQ7nLGiGbfb2hIus45VHTxPlhX2GKFd2iCfj8
	 2hLhfWrawv7jkgT2421Q73+gmOkeqyuFCS1vGxZkz/LxDwDKPhkFyQ916MKjSs9ClN0je
	 xaI2EOb1NCm9PmLmI36/Mg3pnonZKELnBYRFnEdy5lDbPhLZv55MhdbPD03QrymylYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=LXhqhJh07X+9/QSa5d7Bzmb5nBq762ZrlzEAUWwN9TSo1Kx6uGPc5IBlR7ERWXUueyfA
	 MzvFX1CWbD3qoRF8Lqto2txViR8nUs3Rj7cBV3K7ioMjgTTrUHWrtc+MA7QnurMF2cTbB
	 OSCJB+Ok3GB6fyx3d8UvmBp75jDhAG/KUzORNd572sf205vcisCDvxuNhBcI/IBvkOaYd
	 DWk98+guv6F28V6tC2at2eTb2Y2KWkQdOdLAJfU+MrrFIbiw6fAcwazoUyEqlG+2A5aoF
	 z28ko3mvMY6jggp9euUna54c7I5WmiZkae82SyWVHyVrNnuz7I96nwhvAArODldbJpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpcjeeuQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4015460A2627
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4015460A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpcjeeuQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0MB13713747
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=fQj36kj5uBANLLz2D8jINo9Px7d
	yfEOpLpDeUnwbeNVsidfvZzn1oRsjnS0/X9Q6hvWo8OrgJtej1IAPSqycWRFgR13
	jekJ+2k55F+kDw4l/hGsTZKdnq0fUmnWlUrYwu2dyLqqDjV9X6uJfsHUF3QoLMeD
	fD69THgU+ODrrvmBSn/wGQBFNBpSVJjESQIq5GoyHuKUaybg84dNOSkBefDGKuJu
	3f9YU+LVKQYlteFsYuESaAi6ULvIwsYx3Z3cp0jgJWe3kvZkT4QhcQSimh8jOo3Q
	DZ5Y05lEbmN+3WcJ3BFfBMtoVGoo7ItNhdatrIWM3+NNGxJtbp8kuQCUNIQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdan05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d27e34c97dso236727137.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328772; x=1794933572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=QpcjeeuQnfJ45UCatkue2Y5cg+GU6NATeYOtSmfoF9KBX1qeM+tWA4yI5j3kQVC01z
         yKss88bqEH/dfh2P1xNM4lA1jbU6652wzhfjne1e47Wp9MMqqrq5elCkt72UgT9JL39z
         3pXoVyYU2sQ40LXhIPaN4WW+lkj4GhuoSa2blOfx/MwM14wd1RUagjbDmm59Ghs721Xg
         fNXEotR2K8A/rcAMYIUBDpn/dg55x8hmhy7X8B29VfCMwXxiRYGsk09a8oNz5HHdHd9z
         2tEQuCXDorLJSRtT4pZ3xP6YaDKzviGlK+wzcS+b5H1RuFK/+Il3W+dSluh/1+ijOTRG
         B2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328772; x=1794933572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=B0ZXEo36QxgALkWFXy4feU7yo9X0KAxBKBqqG1Fk6POkLI+xIyUZQ4X/Vpc5Wwdxiy
         5EfTukg8NFOJyNz/QiYtajvme1Uh1pRJNK8icMvQBHkD6qrse24rs6QraomN15FMETTB
         exRZS+4qAWxSh2nV7PFwF47GZLNC66V5q5Zvxc58QTh0oGeKjSWumw5DHvCOAqJLjrIZ
         6u44XqD1LxywC/jImfF1AWBiEHspazymoQEioZ1TK9TcYzFCRcIq/Rcrki4oFQJsOn+B
         FM3FqAZQcmkbysb4kHMuue210Qv5e87IH5nSiY7WCcp9o2SH0h2I+bH8mAaBqLf9iyBL
         c6hQ==
X-Forwarded-Encrypted: i=1; AL+hErGTpymjjUq1WV9Afp8977PrtsIMVQpTfwqv9CA3nCMAXba93fGwbSjBsliHydp1NBmgBPh0lqPm8l1KKQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/GnhXsTGre2eztXyVGUZ7GOxhDMr4vCOm1eO/OgP7Mi9qk2TN
	KXnuVxm0Uu65WbKzY1PqW4GlfMUzsnDuLj+nQYcQTDw99dAQKT2sjH+5nUhXxwswjxHoJ7WlPuH
	tq8RT3uwN3tXudq7+ySclHp68NWz41bSebKb6qlFNChVXdrTP8gCZ/d8frqTJ9x+/+lE=
X-Gm-Gg: AYBFou0+QJLKS4FdaRVriwk56aGhXWd++klWqeRfQ0L7kKjNIJMwDyv+t+u3wKDnLzc
	mCSvtxAgB/Ywp2dZU1OTEuaHcEBnurtb/ZWtyFDvUoBC6r5tIBLJT8vDvcilhi+gOGuUWLEy2ev
	YJJikd3SV9S+l+8nIPnGt0gXXGjeNr07j+5BIvhYk6iqLU4qEdUuqyrX/p+o5M63HQESn3Tlzs7
	dDHby3ymQPZ0exnR1flJDFUtdPe1jQaWJiQXU0pF2bkb0oqbxaioV/DjCdE+PpfE821iiLqpzzd
	Yi3kj6TLEyAZGAScoAqtb52y/z9mI3TDG3LfdWfS+0e3a/wpIOfXzog1TMRy5Oo+1M6Njq5Gu83
	87Tjr3FnCNb5e9UPUrakNx0xT7WUlvmLecuUVfrd5oseW43eDh0108cQAwhtNmC05laZhkIZTQw
	==
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919134137.20.1794328771299;
        Tue, 10 Nov 2026 08:39:31 -0800 (PST)
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919118137.20.1794328770825;
        Tue, 10 Nov 2026 08:39:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:09 +0200
Message-Id: <20261110163909.78085-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1DZQjS77PDXijcGArLcg2C5shEIjqyy-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX2G2NY24uH71m
 OLfLgXfNSnKDhYmYnCiARi1+nw/Wrtcgc6Zcp0UKl38WlL3RNWd+GTMcnTE7QQ6WUaV+rgOtqoz
 DGUtQb1D4DsHatsDUxQ3MLTVIcKgBNY=
X-Proofpoint-ORIG-GUID: 1DZQjS77PDXijcGArLcg2C5shEIjqyy-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX8pF9oziyjlB4
 6ZFA6g/S5lbQRnFm4+9lTXQPLF7IZxKT0T2tsd5nneRXe0c43VavyP968Z2EZKXWwnY9h++CPIp
 ubkVWr2yNp6bKPTKndmoWreJJwEsOEjqIkbrcBzVKG6zltB0YHPA5s+395a/HNb6uTyI+y796JY
 /tjVvRoofQBqYRyidETIzEbopajwkzQUROA+ox5FC115pg5G3I57yFavbmqN1W/A+R4wuUafgOl
 +3RCHmsHNrTeLMmGYOzpDfvHB0PGtCe7pQ4M45I1wy9bgd71g1lXvNbbFFHHpkP5N19vmTAB1DI
 /ztideoPzCBTDWs1XTP89cpdqdWl3XsIjl74DzbMlx6eQSyvEZmlXhG3LKRgo9QxHGwNg2kNrRG
 3occsxoBe/GCaw8mDielbwDgqImVgiC6qesm7fxnypomuXmzC5MfrTR1A3zLViRHm71gpQzFoA1
 dHkTN1dtbSuZac9RNjA==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af348c4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1

