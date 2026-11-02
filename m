Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634819;
	b=PnvL7VESMF1ALL2VLycCg0N4dPIQyauNBgRFIFM5PESC/+pmgADU4RW4+Fq5jAKEmz+8
	 9GTBCjGgFolWSs5ZMb7E8+LqZlGqbVq39jE495M5UqxZZDKMgHGLlUkCbTnG+L7PNQtoW
	 6tm2lnsZNzGD+I7znc4pSJ+XTSaR6x5QWWkddJGV/kKIuda/Cssbf9jVEG44aPdT/vOfo
	 YxNinefr/KLJBxzLSfXy9k1LBS1CR7ds04IHKQn7tc7AiafoWUG+hQV3vcfYW+9IYpHut
	 x5MxLOYWNlNnHOjbg0R0l37w3ro2ynH+uWaOQ3Qz5S5KR2p5WwZlQmwczqEM7cvvFtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
	b=VUJGPgcnmOyKT/VORhiitcQwR5K/DKytLmZGKexyNaQmrnRpIL8CyXLzvxABy6/La3zZ
	 nQy8loWl2AGiEAWLv5aWokLLxessb071v5x+MiHUZajIlEO0JWnzohEEL3FjF8XHcFIE4
	 F9ji3tsZojbwWfxvkf9J7QTB3VhTUfwLA63E7Y3RHAWEQELF1E0IK3ScszJ0kd20vnikS
	 CI28J3J4PRhRG5UTQL+C71dwTdHaXRqlEGhDoMSnZJVrHFPtu16p6bPE0TQOrPJ8+k67+
	 eo2f3xhyLnQj2o+UFtrKG1dUajixxzXN0Q98m57GoJyYlCbXxpdXlsUHLCBkzf4/Naw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFve2r0J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754960B4D0B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2754960B4D0B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFve2r0J
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpKIZ4034058
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=; b=XqNFgVM4u1/+7jEl
	dfjFJcnji1V5QNjBIpmSXmn0vPhkJV9TvA1kpSQvHMKPKetwC7dL3ojF8efMTG/o
	5Buj2qRIAnQPWkGGoI5vSww6/cISNBqsHC6RdPgBFikN/hchzMiQI5BBpfnG7/dd
	CToucGyxYUZW98YnNEAq0pBCs2+UkufhExCzOXc5/F+kSv39uYP7LqL7DlPHKMDa
	z+1rXyYatSYuoO1Sd5b0BKTndbf++kZXT8AIBVxo9vVmtjmCe759yVBNRHcwqXeF
	vHugSsMwmms246jE5+LFI/2FDaVy2nDDILKK1H4HCGuoF8dMy9V9MHM5Jb6oXPfj
	ydQvXg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9yc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:53:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso599174137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634815; x=1794239615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=NFve2r0JCSektwUeNYNT1FH1XRNh1FtoA1EfEF0/TRN+yONbo2v5zGxA+IMUNRXQEa
         SEq8EiI041FPYOJh31rEFslpdUsqjlaBi3FqNZ8EitN5Sd+pkuQJyrAWRDNynlbWcA1O
         yyFaa832cXn6qyCd36zH6eaFp7jEoSAUo95fIm/xiVJ7HaFGrTB5N8nSjZ9LyoRNS0Gu
         cQzFJVuelhcDN8MZ6RiAB8meOZavdl1twvMjrvX0geq3PVefmnY/3Cwo5Pui7Fw+kOty
         trT1zGin9j5u+nG3jzAlRQZZFcmI/YhgVt6qA87dsUQCtOBcry6CO/MeXFFR91QU4Iv0
         gUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634815; x=1794239615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=XcLVcwj4Xkl7Q9QcrM11Br1tmPCmjwXrMwx7QDRPjXAmRXrfM2VrYnAvsw6EyJLhe4
         cvDZND5pGYKa8SPZX0oQa0yiU1/tIARcbjAFOmE9gHJ7P4Hatc26MUsWwc8bs/Z0wNTI
         A6YbofmW9WEMWq9KNfgPmO1Rl00f1UiQooarIdDovKBzRr2h1xTRDWGYvhRJfH3jJUMS
         hewHdTFlX1EXPuoiWPNO9SmFtQlRiDRjgjhuiIDkwIH2HAz+lWFy6ivdyhnqkUPHQQXb
         9QIX61fC/QqYe5YbhyI6DMNiN/logP+lTE3/2ZUJHxgkJsNb/HomR0cHU0ALeNHmp2nN
         3fxw==
X-Forwarded-Encrypted: i=1; AKwUvBwWUiUwr47JPGQiUhkfmLuhhNxSp2x52L517fykjeHAoZPifvEv4sWLD3a1r9XeYpfz2T2YJQNB9B6mAv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fLXp65TW7iglSTYC5jes35Ty4lwMCRPBf+fHiILd2ZlnVII1F
	jxzZKwUZQivjyfJYrNb8+a/34W6ZI2UXRsn7mR7sadZ9puMRZt3q0dJIYDQyaON7Wc7WlpborCh
	IVEsg2Xg2mOHxgMCvVujDJ0SA3KUdB0wQBiZV0Mjq8xuo4iZ27a//NX6al0qcO49uUPg=
X-Gm-Gg: AYBFou2CWUXvvt6vL/0Lk3Fmd11tM7ItGjf5Jm28saggpprZoqQSrNwBH3LdknJ+6wj
	pqCezCWOcDCr3bDZijq9PuX/F6HmH14EJru5FsZlbyKLqrZyDTgQnEeQIeibY7NteY0lJ3wzftA
	zycwAcUZOtBK57F3e1mrDlcIXPyUDf+7WTn7tzFvm9+2gHzvy3etVX9EWys5Na9RUTKiUt0T6/5
	N065mEu2BANIBsF/b6UDeNE4a1dZOZA8D5S+7cKjkGpK6BduizXI4k4a8pLAR/nB9jDuB+2wQiy
	H2gpXW8+iAWq0F/Z1moE2wLr+/TibrcfoI6l5wtwU1N+VvkjDBwRSlapbccLGJnTT18wpEr82dh
	3aRIkzj8LS+AqpnxN1JDaMbXBN7uL+WVpBgtMojbxr8DTmxjf5d/gn5Rx+oH1PTdgb6Vd20/HH4
	vKGXXboX1DE7uH23abGu2kcY8rW20fsJVvYKwcZOvtN36wiZj9Ad9y0Hgl4cyQ50MXpLyOrh78o
	pjgaG1vZWZgvOl8TLQuAXCC1vpv
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862061137.31.1793634815461;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862056137.31.1793634815005;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:40 +0100
Subject: [PATCH v12 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261102-camss-isp-ope-v12-9-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8b200 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXziD8RbNh4nn2
 27+d8uA6+B0UbSAet1Szxutoln0U2HSuTA1ZatdY598GXsqv8UY+2nHMY2qc3J9yk2I/tdeqs6A
 sfNXFA9jKt/rvBA4PaastG27CRgWySsK9J+3yo8RK3MtkGM4esHJB2ytjtednTvT3CMfVdjYKbv
 CCJj9wa0+2HT+DBciHkaMaOW0n9tOR57UyK/TpjIu6HX5XcX6mwfcLl1nBdAj+JfyeKvCTVPn1k
 LDlGjaKfJsLyP5ffGlsXqtL7cLIYWPl341uLrwKo3NCL/VggGzy996t2ieG2CcY2y7+dOHt6OcM
 REqt2cqhYHmRl9b7aEo31dT6H/IEoKYgOD/hW8exEUq3LL8v4tsPg7JQ3zMYZh16X0pnyd9/zev
 JeB6oVMJxQBR2bqeu7+F3ZsIn0RudNczwAYM082PaRbNxfzd0Gkloc/RR9PB36EMVKB2mgvSjfm
 y3ZBoJX1Z9UXLn2gQng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX7zPTCk3Fzn6o
 RJywOaRNTXe7PDxtCbregspjABwBdY+7ycxOQKxJSobfUHY8Ssc7JLr2ce2szCtIPSmAHn/5Glb
 6bUWsKo4Zdc+7h4QBt0X0E3AMYKSi+w=
X-Proofpoint-ORIG-GUID: FoS6UmuhZ-7H4aw1BCnpyIRQkuLj9a2m
X-Proofpoint-GUID: FoS6UmuhZ-7H4aw1BCnpyIRQkuLj9a2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

