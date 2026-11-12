Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495737;
	b=HIq4LK8Aq7pJeIUKRxmnC6lhN+tnWPZSiJJiKWvHcKRMk6ZShMuxvmpu1G9KozTJZ/EF
	 sK6g/eYY8bDVxPzWMCFhzQnieGoTxydpi2Q0aavuMvx5LqL+9+/gSVrb8F3+EtVdrl3Lg
	 71SC2qgQmsUO6Xo3PHlPphASFovN1tFc7k3JKvgt7RcEKmy6jRb6oJ7Ggr66QjXMiVu72
	 aALAIRUmecpTfc02z+m5oZHMVUgGCmySls79sRfcLtj3EnZ1vefa2j5juB+r+bHIYSgxH
	 zY+reQfT8N8SOnK65B9SlkQYmHQD+2wXxE1mUpbAu0o9Wc0T+g9M9OB7LK2rGLDcEzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
	b=axoNBg0Ze3t8U/dWUND0q2B30zbAGV3HsPpBznrTfetVp5iy4HalQQCGJHWZMRh1igWm
	 mWFiOgPVuscy8KaTvDTlmZTnni7O4ZmXU1yr4Z4L87HHuSaBZyjuQVlqa1VQBba6kerQn
	 t4QkshZ+xgOH/5P7eJoxgmPX6PC5cO79kirJ1ueWSk0h+v8JhV8XPBAgqz3eXRBVhBanc
	 lX/T4KO2hVY+TUM5JHtre/JWmqoGKmLxPHVldljmetfgLoQFM4R+A5PKiHbEbRXh/9iW3
	 O1lszTBXksUBlUeg0ffnxQjpnGn1yyzOPgna2wEsEmtkwLs5BqDuIiQHKADbZlEUFdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VSBgfG3B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXx3m1q+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F8F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VSBgfG3B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXx3m1q+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBEV9R3893540
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xWn5f0LXvPfccgqP5IckP9
	cPc4GfBcu0p1HOXp4x4hQ=; b=VSBgfG3ByO/PT0jOgTQ73/OZt1HMy9/MF91MqT
	NAjQJBrr3b0qa5YC7EvcIPtLs5JJbFiRZ6yxPvUUqXZst9APtwQgpICTwcmv0NXy
	iRJSFW+P83x+XPz0h8szh8r4/2iG1U7K8fzvUU4skuxFt89H6fW0S/LKm+XIZvvr
	cvSzOJ25/0yPaRTrD9DrPWkGlglPSoQvmnwuCM6Brrk0OVmh2bMJqFwBi5ksFi+H
	WKtq8xq4AyB1fX9d8dBXWqgHM+aZK8yPaXaifMSoi3oUiK3mWil57viylPPGYShL
	mPYhNXOPHtVfCYw78FtMAccN3iPzs9TAYfGaXTY8GnrqfTjA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re2474-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:02:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e93fab204bso4216966e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495735; x=1795100535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
        b=XXx3m1q+NWsNUqDluY1zDk9Sl4qDqViNMn2kr0DQu2CVA1EoZMkcNMl3c4LjrFI/Hf
         YXCMWL5Xfkta65ygE6AKHWbVZDKB4NeeytIo3pA2H9ZLT+SewBDUS5Ho9aLO48JQhfo0
         Zg+Gh6FfDNglQk7oPkPVBosnwLZKDDs6uLmPBB/+qQm/+0JCctXuAGoLSlBNa4nKsU6L
         1hws8bMC2Gjdd3buuulUCMlx3OJqkv8tDveflRAd7wQ0+H8qXKAFaYjqVzS8D2Nde9fJ
         oiEdnTtmtitdgSu/M9skvn8G6f+GYMQcIwY8eKGFNGmw0bBcYsIY5eN5nc+BbB39kHnl
         KGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495735; x=1795100535;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
        b=VT0wbIrfsL/FUZlnyNEiRjPB7yzOXx09wEtfLtPqopwvU/z5I+k0PxFsyurDO9RRio
         DzDLL3suiAlgwsBBnE0v2JY2PXJkMm69GbBvDnmIgNBzdyf+/0UeiDkkhtPWjZOTezcT
         uj/qq/4DwbyRCLJKg30QrDKHYdjn57m70ABVBdyILJTAiipbn68lJj3vaKrJlXvZYDDu
         LflPLoYFXixtc+gAMiqcQJCc96jJqRU8dvxo5Pf0kmNHzC/YSMCpictdAwgNGA7OM7TE
         r8iBgOoyxYu0fDxhx3IMGW8N/x1EXJw/KPvvGhFUIWj6RfbdeVqorVyNDFksA7bHz4Si
         KDEg==
X-Forwarded-Encrypted: i=1; AL+hErGziAAIX2/45EoMzEhiKlRKeyvikE6ORDDdn2y1KLho8HxO1W4w4NlcTkN4eK0zgm0u+HxRa/1PMwe5ZKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8itTnfYEEuWvn58oypA0SdK27aTE6I3BjbrYpr6A+tXTMDekXa
	M/DJxNHYmHMZkpWAOc2KRBzZCoccr3ePH0UmggNRK4cfJgRgC1hC7rLXpxuQKuQEoizk2HD5Llw
	RmStXFkuQlS4krn82UX2Re7liZEgZaGTsyB5/4/trNSMjpfbrp7+d6JUikeoUc1MawE8=
X-Gm-Gg: AYBFou1BQUl/j+KvGTKcHt8QRmw1PbVS6ufKVCE+7OS5AEYlOImEwZvw3h9BtOHf4wB
	TMkiGwKquxdtgO9B9/pDQMK7AorD3wtOqDuL0GvmQ1YH+hQeK1+/MCiWyueV35BZBCE0PyxuP/Z
	4x7R1qNgGJIlBphN5GjfEhW1M1BQMFFTPEWlM5imBpPAv37aepDcKfbRPaVut0rwb5Gz5kUp+L0
	9kxaP5uu6IUDmLjPtKItGv70SRzn5HsXrAbPCBR7EzGP5W/gx7h5OWLbF4AyB7PekUaRpkQk8Vf
	KxiYcFRDH5zkd416VCfa560ZnlhVBl5eZMtAeZdbHJlv8mIZpUCW4vCWzZhjIK2DMc2UWaMxbF9
	gALyQdOIWpPQUCxY5iAdDlIwkkL+gUjn3KwGxvGPaqmo3JZqf6yNvNkCH4s9s3lZb/d8pMw==
X-Received: by 2002:a05:6122:a5c7:20b0:5ee:3276:58d5 with SMTP id 71dfb90a1353d-5ee3276714emr21015e0c.5.1794495734436;
        Thu, 12 Nov 2026 07:02:14 -0800 (PST)
X-Received: by 2002:a05:6122:a5c7:20b0:5ee:3276:58d5 with SMTP id 71dfb90a1353d-5ee3276714emr20921e0c.5.1794495733786;
        Thu, 12 Nov 2026 07:02:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm: qcom: display/msm: Require DSI graph endpoint
Date: Thu, 12 Nov 2026 16:02:01 +0100
Message-Id: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNzQ6CMBAGX8X0bEm3VH48+R7GQ6Et1ADFLhAJ4
 d0tePGg8bLJJN/OLAS1txrJ+bAQryeL1nUB4uOBlLXsKk2tCkw44wkAMKos9o2caYstdYZWXvY
 1lSwDeSoTEIUg4bX32tjnrr3e3oxjcdflsLm2RW1xcH7euxNsuz+JCSijzMTAEpNBWoiLQ4weo
 2xK17ZROGQrTfzTBT9cPLiMMplReWpErr641nV9AT0FVxgdAQAA
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a5k21sPjS0DUr/NbolvO9G7hioG0EUTtUwzEZTG6XNo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTs5tNTAu964+ctTeD9UFyfijhDnNW+6OLsA
 OAGmozIQkaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU7AAKCRDBN2bmhouD
 16xvD/9Yv0mSIUagFwLapTjq3aTkxOjE6xtjL2EMVjynsMVBf9ar5yIAEdRzEaSpHUkgDHVLcGv
 nUYzLhgZYbQqytvV9chGw0i0//kvdB6KwABtuRLWMKQ8pLu42Zt43BMWMZxiNXFhxpPV0g/Ap6n
 r/HG7H7F2/vRT7oHap10fIGXGK7TXHZY8Dlm3jwh+PWVpVkGJlt4nnqTHYFugb1N5JKU/D8vrW5
 vU+QCR0pmqhKaYaBN0ZZP8ICx8EWWHLNhMYoA6ypLH5ZPFGaLf4c4D+ulyyd2HSS/HyvTmfwBjG
 SCzXjbksFGnLH5W+58s9IN9T+4eYfqQSYUeOYhfBqXd0G4BgypO/PhKK4lvUETpRzWRUf3Cp34b
 PoanxrLmyfzQUCANNbvnlfPWpeAO3ws2YhdK7bUjb7UaKuNnDggH/jZZFAkmnAvXJlpuHEOjhX8
 kl/jxHckV2/M+ggJrF9cNCHGQjRXJoWEEEs0dNTVbP5+K9fUBNLNL+hltT2TUnJPrSGF+jS7C6M
 z3wu7xSh50f4DGxKew1cMSc3L4IuEGYOq8jqNMDJNlz3RzbbU1zHfbzCCVUSRmU5KGW5Ft3WSJ7
 Hgg6CRoBB5bXAtPV/NU8WIisEmz7IovjU3sdDoULK/0ihJVhM78ztO5wFt1P7ICt8onrUJrK6vR
 Ntp43P+bMY5EPAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: hOEJiXNxRDp1QlEIeJyZk8PUTGxFw4Qb
X-Proofpoint-GUID: hOEJiXNxRDp1QlEIeJyZk8PUTGxFw4Qb
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5d4f7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_iFXmH2w7s5zJ4zlvgEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX4AwqeTh4Tn77
 0TCNy3s+dxmFZlJV9gJf8kvqFE10ViRWe0HLcaZe6odDSPKpp8d8Uy4J7KcOI61NLPnpTckQLeN
 LH13yfubGvZSAibFAQes+0xvOrOhC8s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX+6Ef4uht0n0Y
 ouwwc/TgEfMYVZxgWgdNM8d2oSgj4tVj53nTYTGJHCcUFqzXFNZzkAYIDbfAPAvH1+auRO5QrjP
 c5DqJ2Z8shYa+zo88liXO0TVl7iM3VMXL5iyZOndnTd7I4RFDBUJXkpSmVogIUZ5XYvgzsR6Qqv
 XjiZn7jAia0IrebQz6orRpWpNnfk8LHTrpmWN8AeaGuS3IFi1K4UphTM2tycWPG18w4oCEJk2hI
 Z1AS6PGUHe6OpDxsdaep8gDxqwVenO2A1DFXVV5ldGqlzyNizJPGpaB8Wm5wAehPQ/lGj+MuA08
 hZimHwhvxsuiCw863ja7cDwmyY2DNLIywq1KeN0NG7kvUxsgIulMozcVr22O30PSg3bhu/KliOc
 0mi0j4BeuXUMFZR9O0YodbcPzj1aykWfSHhnhbThaSnIi4BB4zAZEMQH+JCjbj0FkoJA13xp/XR
 5KiIrX5y7ORqi7shsEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120059

The DTS can be applied as is. Then the bindings can go independently.

Changes in v3:
- Add missing mdss_dsi0 to apq8016 (patch #1)
- Adjust commit msg (no probe failure) of patch #2
- Link to v2: https://patch.msgid.link/20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com

Changes in v2:
- Patch #1: Update also apq8016
- Link to v1: https://patch.msgid.link/20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                          | 8 ++++++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts             | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 33 files changed, 92 insertions(+), 5 deletions(-)
---
base-commit: 27b8d2cd13f68ac75f737a6f471a7247d2beea6b
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

