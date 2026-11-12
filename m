Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496021;
	b=uEyVehWtSB506GG0sjZnPY4hqpD8feP1TMby+QSR0eKC+wqY+FLaImHQuIoq+CweoSNv
	 TFTs6Zhong0GIam41ZaxeAB81bR4uB3y8MowF3YHoNQVSGB+c5Hhzhf3SG3NmApl4eGk/
	 H1I08gVN3J3+1ZHrheTPmyH6DBVqiJ7XWC8gu1i6rgbma8QutgwczmbsXcX8ZCuSA4Xg4
	 o6YV3WQbU+TB3OjV5Rm4LlDldnoFpqcbA/X7uTWcSjO6a/3BVWhspY5oOmndr+k1RxiYr
	 zEVvXOEQP6zZ/RcFVpETNZ7zlHI6lfkNpoxXS6nmA0CjdlXMKeceQfx/aiLtGskKpBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fnFzrMim3PDRjGWuhWaZm46ozSVNqIG/Ol5S91LrZcs=;
	b=W13fgGKFJXwqP2YhqSx06r60xKdAg/UrqyT7Gsjim/OPP78ypjhvjFa97lSEDhXvrQCP
	 NCKLWejsQDdJRxzDlXG4XEejCa4n6FxKN8efK6bBYOLPSdSMuGtY5olUDPniLXMs9hg0A
	 /H0smkbSHdFdd4s4NEFY9/BI7gzUiwIDvH0zz/pfl+8WLsFwd1Erh05Hjp2fri1TsC1We
	 ZVR6aGJnbx3WBiekhbdNQ41tV2NPHvoSxGacJ5oIneIdvJfHg5fer63E6h/CCAXYaaQmL
	 IANGkmMaqEojWYvcTtyNjme4SZf5mmxAr/KVkNjYNQ3x07/MgcGfN8/xWY3neOEFnTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PvIFPMvY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dPaG1LJr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAF8606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAF8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PvIFPMvY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dPaG1LJr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACEToaa127397
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fnFzrMim3PDRjGWuhWaZm46ozSVNqIG/Ol5
	S91LrZcs=; b=PvIFPMvYjd26rsXy+/7UbGlnQXhFmwDL4Am1KwYdbqrwASYC6YO
	FcPqngxlSTQ64y5dv7jXoe6GWecHUSvFKDX26HlG5QkXO2LCsTJwP4zjYyRzCrVT
	9zTivjlzjPP1kaf4EMSlxIWpcS5LT549OPapyF5RSMRoWbj8m3kicaRQD90UebD+
	lYqOXnsnrl3l+4+gn+PoLloZdF1XAz8TQ4xZnmC1G1emTQFksjE6nGKthQlz+vXH
	QyPISJK/wU0OJV3SAHj79kYjzQ+26oc92mjn6EiWbyppD3ImxrLx/laY2ryg4rQd
	Y0CxVoaNK7sCTX1Azc6ko99LzYKVZm55acg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09jp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:06:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so4105267e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794496018; x=1795100818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnFzrMim3PDRjGWuhWaZm46ozSVNqIG/Ol5S91LrZcs=;
        b=dPaG1LJruzrqsYldpZ3gm2mH6ZpBV7+v1Tn5rf5U8A67Av7MiYF2VvAKxKqWzdx8a5
         i3NWHECHaMG5F2SjZ68/9R+q1iYUrmzTOi3XVvfoBKNm4HJSEz7t7p6mnZ9nxR4N0aGF
         jK/IYup8B6cIeq2uppcgpkaSmazy2L4pumdgrCxcA43D3qEMWVwE2dI94UBtOBgadIKg
         TNOuKYTycfsZ0+M4O96HbuYq8H17ckWxDH0e8GuksEv9+SmsR7h1xM9RfWoxbgKj5ybM
         WX5PS7w3IVmGEDOangJAZibSyqsS9Um3q9+vS0XTuB7AYVenwc2AUKmgqtt9GqiSujhI
         1fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496018; x=1795100818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnFzrMim3PDRjGWuhWaZm46ozSVNqIG/Ol5S91LrZcs=;
        b=MmrNzQI+XKPJoHne5mdiAaMdNEySDm6lG8hSsvvn/1nYVlMrwrRdLmBNzVY+RXNeib
         WiJdPZi8w3jx1PpQN3YgqJIdp4fCHbDQpCaDF/RnxbzjHcOGMeBhcd1YL/FTP5w+52q0
         cPyeNvFIhrUJpx27TBrUfu3gEWY09q4+6E6p9zLB+yiL3HPeEfjrgcxh6Un3+6nhP1je
         iQ0fH6WMfLYJ5MObB+AURo9S4PwP0kY9Rqj+uHMtazJRI1jUOPyuUL+sKBU7Hyqi2pOL
         nZl2mPugUJU7HqRyKdOa/rajCBQFuU4TX8IkLKuLItoqZcKZlWqjq5lx2drYBCd48l4O
         /STQ==
X-Forwarded-Encrypted: i=1; AL+hErGrQdsSzn1uaob51W6g9bM9TDmNIU99/6c8FddnsczC43GmCxz7mBJdZZFzKmOBto0A76hmFYOxuyhnQfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gurtGh/w5KaqVNjVveJ3b394EZdAq3IgWFFXzjdbTO6XaWBsY
	+sZOMcu9llrpqDRdb+KeAFIKpZ5usIQgcZKbvZZazjB8eSwxrAaysoMIEYfOIBGXobzbVdf5fgj
	4jiZNuYPRBMLsjSrFXG3YYrR4JhM3EPc6IrjQgOEYOCEIrhOG2fofbClWCta8YnGOrfU=
X-Gm-Gg: AYBFou1XyLT8Tdr78LgBnQ/nWiGmPYkqe+isx1qJyGzC94CUYpyG4X/0oYL9DgtaRAP
	A3zAWAlqt8TBknYVshGkZQ1NwxEfThfAskoRdh/0jzAbh7uQPplExbSI2yv7hWXoZ2ldDKdI3qY
	7GyJ1S3sfbqLhI1zGOBc11f+fb6GtSSmhYanQXsxrlwaVdqkIYtjKd20F327pYSqemYOVGfmVRu
	Ku5iqTk8tcjP/qx3bhdDDJ5bms6JsU6dpnJDSh42yY4fhU+RTzlHPMKj2rgMCH4lmKK6+U4Zi5h
	XniuWvACH1toFBCqnNkO6gQWF0c6P1QaDy6X7HQM0fKDkA3OyhtN8e5Rf7w3Kf3S70AX1MRWwRM
	L/kiMyOr+2s2zENqLCumhhXXXbqkvTbTgGKdGcsbuFDEa0yyulf1VoIsUp0PPUA==
X-Received: by 2002:a05:6122:ca0:b0:5c9:a60b:e5a6 with SMTP id 71dfb90a1353d-5ee1c476f52mr2711069e0c.17.1794496017649;
        Thu, 12 Nov 2026 07:06:57 -0800 (PST)
X-Received: by 2002:a05:6122:ca0:b0:5c9:a60b:e5a6 with SMTP id 71dfb90a1353d-5ee1c476f52mr2711004e0c.17.1794496016979;
        Thu, 12 Nov 2026 07:06:56 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm17919272f8f.52.2026.11.12.07.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:06:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Romain TISSERAND <romain.tisserand@gmail.com>
Subject: [PATCH v2] dt-bindings: display: panel: Make DSI panels port optional
Date: Thu, 12 Nov 2026 16:06:51 +0100
Message-ID: <20261112150650.137216-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22776; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ZKLb5vyJxJkcc9MHPukILqFjzOnaQcQBF8fgwCbqjMs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dYKHx2XEjfhh/l23iQT8eE5/woxO54UbShX2
 0IM6sScSXiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXWCgAKCRDBN2bmhouD
 13PxD/9ge/spf3r1E9i1Rm8l7UWuc3lu8uXHpkkqtW7XVBfmjBClbIJZ7zKQmioXPq+eZKAf0uw
 L+0P9o7rA69s8jmwW8B6BEiMZIjAyFeyzpopL5gYY18Fvym63o6ehIMZLGBWbjH2G6AhFLUyx3v
 p+r/YPXCXaY1FoSmmmTjeD/KADZgB2q2X9z5wNbI985ltOJOZT5y8bcrSivz10NS8nhl5W/FABb
 4YT42vSveKniTg7Zgx6ipMB+TCg+51veG379nokYJnxf37yIxi9yMPp1OXpLBeaDb9jiFueYnnt
 cWaoxGUpVxdxmaVMYNI9S5CSVP/je/dWwwu4/UMHQqvKcfrulXSnt3nAzzJIqPj3xdzw2QgXkXK
 G6ldC4/XNvlsemv4QHl3sJqmaMjgFf+h6VAw0caEth6uF+Ugxofa8sBBVeC3DwCXM4JzoZ1m1v+
 cl5Mn6gvwtL1JqkMrLVGUeFZ06Jz1QPBjbjL5fPmRmrAPUVf0nfN4a5XTZh6tLLAXLUfCGfkvu+
 9LnBj77J7+BJwPP6i1stc6h0Kx9uit3h8IxlfLeG3sAtAH/9FjJiR+tKB7e42F/8I3wUkf+Sj0/
 jXQx0Nzqng83YFzVAbTEJNXlPOGyGzlI0maQ0xh+Blp3HQFGUb8WufFzg7OcVN0N45kfOK172O/ 42/NtXoEztupnkA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g1c4zhQz3TsxZuA2zgJsFSUmX7t3OOO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MCBTYWx0ZWRfX8z8WSMFjbPM/
 ROwZxULASy54si5vOLRqPkK8sll8z0R5NAPwgElhMDfZ6znxYCKP1qnNef75l+HKBpDnfKZgx2p
 rrFe1POJ2vIWT/lkK6UNDumLziGz3fP7ZhIAIZfZGLmbzZUfOBMkN7aka5li1P3j4RSWpi0QKE4
 PtIy+sxYwn+VdNejujP8o8aHFuXpVE8czJh7Oc+OKs416e7q0TN3fgGXT16gHgJVM0608JL5dKb
 OIr2JXt+dLha0bV7MdlrkQP7U/s65Kt6YrPYm0IG9wVdxumC3nfvJUIdqQc3Lefe3s+ZOzaDBvG
 PG8yAtLuOOcWfUEPI+duT719pUPbSWlETX9tsb51QP16Be0efBh15XYFDiL9LAPJ0bgC36KsmJT
 ftn8LVq7WmrLmV8NpLd7nRUxJmkj5JK0sRLhwGuFNB4yE3JSEo9eMP4A+wAdbJgVIR6XE+vDvP4
 lILhA4TB6qeYo/0k7Ig==
X-Proofpoint-ORIG-GUID: g1c4zhQz3TsxZuA2zgJsFSUmX7t3OOO7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MCBTYWx0ZWRfX4+9yCjzwiRoT
 v7iHMfGLW/8rIGvmQVLyG2F+gnqeuFgyJBvgElcOjRt0j/DOWi74W06ilW4TngubgaCvy227+pC
 YqK7trRsf7WwICBx1nVQcWuba7f0COU=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5d612 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r20e0feN5VoI4vvULvEA:9
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120060

DSI panels can be placed under DSI bus directly and some of the Linux DRM
drivers will work fine with it: mipi_dsi_host_register() adds device for
such panel and DRM driver does not use OF graph to configure lanes.
Examples are Samsung Exynos and Allwinner DRM drivers.

The Linux panel drivers affected here do not use OF graph, either.

Requiring graph port for such panels is tying the binding to one
specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
requires the port.  That's a mistake, because:
1. It prevents usage of such panel in DTS for other platforms,
2. Places the constraint (port requirement) in wrong domain - the DSI
   host needs the port, not the panel.

The port is not needed for the panel hardware to operate thus it should
be optional.

Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # renesas r61307 and r69328
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Change in v2:
1. Rephrase commit msg
2. Tag

Remaining one Ilitek is fixed in:
https://lore.kernel.org/all/20261109160706.2272332-2-romain.tisserand@gmail.com/
---
 .../devicetree/bindings/display/panel/anbernic,td4310.yaml       | 1 -
 Documentation/devicetree/bindings/display/panel/boe,td4320.yaml  | 1 -
 .../devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml      | 1 -
 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml | 1 -
 .../devicetree/bindings/display/panel/elida,kd35t133.yaml        | 1 -
 .../bindings/display/panel/feiyang,fy07024di26a30d.yaml          | 1 -
 .../devicetree/bindings/display/panel/himax,hx83112a.yaml        | 1 -
 .../devicetree/bindings/display/panel/himax,hx83112b.yaml        | 1 -
 .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili7807s.yaml       | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili9805.yaml        | 1 -
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml       | 1 -
 Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml  | 1 -
 .../devicetree/bindings/display/panel/novatek,nt35532.yaml       | 1 -
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml      | 1 -
 .../devicetree/bindings/display/panel/novatek,nt36672e.yaml      | 1 -
 .../devicetree/bindings/display/panel/novatek,nt37801.yaml       | 1 -
 .../devicetree/bindings/display/panel/novatek,nt51021.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm67191.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm69220.yaml       | 1 -
 .../devicetree/bindings/display/panel/raydium,rm692e5.yaml       | 1 -
 .../devicetree/bindings/display/panel/renesas,r61307.yaml        | 1 -
 .../devicetree/bindings/display/panel/renesas,r69328.yaml        | 1 -
 .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml        | 1 -
 .../devicetree/bindings/display/panel/samsung,ams581vf01.yaml    | 1 -
 .../devicetree/bindings/display/panel/samsung,ams639rq08.yaml    | 1 -
 .../bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml       | 1 -
 .../devicetree/bindings/display/panel/samsung,sofef01-m.yaml     | 1 -
 .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml       | 1 -
 .../bindings/display/panel/sony,tulip-truly-nt35521.yaml         | 1 -
 .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml | 1 -
 .../devicetree/bindings/display/panel/synaptics,r63353.yaml      | 1 -
 .../devicetree/bindings/display/panel/visionox,g2647fb105.yaml   | 1 -
 .../devicetree/bindings/display/panel/visionox,r66451.yaml       | 1 -
 .../devicetree/bindings/display/panel/visionox,rm69299.yaml      | 1 -
 .../devicetree/bindings/display/panel/visionox,rm692e5.yaml      | 1 -
 .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml     | 1 -
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml    | 1 -
 39 files changed, 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
index f820dc2f732b..1d6bf6da2ca8 100644
--- a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
@@ -31,7 +31,6 @@ properties:
 
 required:
   - compatible
-  - port
   - reg
   - reset-gpios
   - vdd-supply
diff --git a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
index c6bff0ece360..90f0d0bbe91e 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
@@ -36,7 +36,6 @@ required:
   - compatible
   - reg
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
index dced98e1c69a..45f3205ed952 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
@@ -33,7 +33,6 @@ required:
   - reset-gpios
   - vsp-supply
   - vsn-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
index 80deedc01c7c..9c6a4d5e9f5b 100644
--- a/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
@@ -41,7 +41,6 @@ required:
   - vddpos-supply
   - vddneg-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
index f4cb825d1e96..d04ffbba359a 100644
--- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
+++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
@@ -32,7 +32,6 @@ required:
   - compatible
   - reg
   - backlight
-  - port
   - iovcc-supply
   - vdd-supply
 
diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
index f288fa2390c9..f36e866a1325 100644
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -35,7 +35,6 @@ required:
   - reg
   - avdd-supply
   - dvdd-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
index 2c60d0cd704e..008a94608c42 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
@@ -40,7 +40,6 @@ required:
   - vdd1-supply
   - vsn-supply
   - vsp-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
index e58bb3d45331..bc1771efb6e9 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -40,7 +40,6 @@ required:
   - iovcc-supply
   - vsn-supply
   - vsp-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 83c343b02835..41dc3f39f42a 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -49,7 +49,6 @@ required:
   - compatible
   - reg
   - backlight
-  - port
   - vcc-supply
   - iovcc-supply
 
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
index ba8c5bbf8ffc..3bace821bc8e 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
@@ -41,7 +41,6 @@ required:
   - vddi-supply
   - avdd-supply
   - avee-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
index ff67129c9466..4bd76a411639 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
@@ -32,7 +32,6 @@ required:
   - dvdd-supply
   - reg
   - reset-gpios
-  - port
   - backlight
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..9a2602ddd906 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -33,7 +33,6 @@ required:
   - vdd-supply
   - reset-gpios
   - backlight
-  - port
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
index 226974a4077f..70243c087410 100644
--- a/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
@@ -35,7 +35,6 @@ required:
   - reset-gpios
   - power-supply
   - backlight
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
index ff6fdad7febf..a00aabc7f583 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
@@ -47,7 +47,6 @@ required:
   - reg
   - reset-gpios
   - vddi-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 5d16d8511725..3263e21bf72e 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -54,7 +54,6 @@ required:
   - vddpos-supply
   - vddneg-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
index dc4672f3d01d..bb10d62ac2e4 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
@@ -34,7 +34,6 @@ required:
   - avdd-supply
   - avee-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
index 1b38c1d0af68..ff7afe5467b6 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
@@ -36,7 +36,6 @@ required:
   - vci-supply
   - vdd-supply
   - vddio-supply
-  - port
   - reset-gpios
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
index 7754a8cb1e5c..a50f241e0186 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
@@ -54,7 +54,6 @@ required:
   - avdd-supply
   - havdd-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
index 4825792bf712..511cd2b64fe7 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
@@ -47,7 +47,6 @@ required:
   - compatible
   - reg
   - dsi-lanes
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
index 97b7fbe05c07..cefb5fdee826 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
@@ -40,7 +40,6 @@ properties:
 
 required:
   - compatible
-  - port
   - reg
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
index 3c94db88f797..44b416260f20 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
@@ -42,7 +42,6 @@ required:
   - vci-supply
   - vddio-supply
   - reset-gpios
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
index 616a5f3ec9fc..91336e17a059 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
@@ -41,7 +41,6 @@ required:
   - dvdd-supply
   - vci-supply
   - vddio-supply
-  - port
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
index 3d7761717b74..aff691fdb771 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -55,7 +55,6 @@ properties:
 
 required:
   - compatible
-  - port
   - backlight
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
index 740185f778a1..c28b671d8721 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -38,7 +38,6 @@ properties:
 
 required:
   - compatible
-  - port
   - backlight
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
index 694037301583..b17b7ce2b29e 100644
--- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
@@ -42,6 +42,5 @@ required:
   - shlr-gpios
   - updn-gpios
   - vcc-lcd-supply
-  - port
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
index 70dff9c0ef2b..5e1fb1edb3e0 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
@@ -45,7 +45,6 @@ required:
   - vsn-supply
   - vsp-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
index f5b6ecb96f99..3a68324a2b69 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
@@ -46,7 +46,6 @@ required:
   - vsn-supply
   - vsp-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
index 42634fc3b5b2..25eadff02816 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
@@ -29,7 +29,6 @@ properties:
 required:
   - compatible
   - reg
-  - port
   - vdd3-supply
   - vci-supply
   - reset-gpios
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
index bccc667aa072..c0a44e69b37e 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
@@ -47,7 +47,6 @@ properties:
 
 required:
   - compatible
-  - port
   - reg
   - reset-gpios
   - vddio-supply
diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
index 032a989184ff..ccfc0513eb4a 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
@@ -52,7 +52,6 @@ required:
   - vsn-supply
   - panel-reset-gpios
   - touch-reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
index 85c5dee65383..85977dfe8b72 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
@@ -41,7 +41,6 @@ required:
   - negative5-supply
   - reset-gpios
   - enable-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
index 7fd9364fa385..4c7677f6b154 100644
--- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -34,7 +34,6 @@ required:
   - iovcc-supply
   - reg
   - reset-gpios
-  - port
   - power-supply
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
index 2fd6e0ec3682..6a0c7518531a 100644
--- a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
@@ -31,7 +31,6 @@ required:
   - avdd-supply
   - dvdd-supply
   - reset-gpios
-  - port
   - backlight
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
index 49dcd9b8f670..ea79ea070adc 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
@@ -45,7 +45,6 @@ required:
   - vsn-supply
   - vsp-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
index 49ef45c03593..281333b781ba 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
@@ -31,7 +31,6 @@ required:
   - vddio-supply
   - vdd-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index f61a528c0413..bcde74217e1b 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -42,7 +42,6 @@ required:
   - vdda-supply
   - vdd3p3-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
index d4b4672815fe..ec393d15423f 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
@@ -44,7 +44,6 @@ required:
   - reset-gpios
   - vdd-supply
   - vddio-supply
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index 682f30dc9ee4..979c5b95fac9 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -37,7 +37,6 @@ required:
   - vddio-supply
   - vci-supply
   - reset-gpios
-  - port
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index 9c9743a23500..13ff075bd2a6 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -31,7 +31,6 @@ required:
   - compatible
   - reg
   - backlight
-  - port
   - iovcc-supply
   - vci-supply
 
-- 
2.53.0

