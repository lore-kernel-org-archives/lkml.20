Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800950;
	b=K1MTwl6FXEHjFrVWTvO1/t7+uYYmHMmf7cfZJ5P3l4HQCz24q49f/5m084qSu1wsMqNE
	 L/z8DMROsGVpyEkkGQ/dip5KssF01JwKZnYM81YrfujGLmyp9UN5xxElvesR9oBBJt0oD
	 xg7yAPpZJ6Zsorlg0hgyN2G7gJG9EyROacguDb2NhzO4EGDyhBvi4S5zF1vTYEZsbLfVf
	 yoHKS4CyzKaMrOeV6dMrs6scrI/FjLSmQ/Kak+dX3CDoTDPOHn/OoEw5hfjNq38Pi/4xI
	 hiOL4MjtMgaU0UkqJXtqbM8sCzqCVtW7XeCWoWL1I+0EEZANhhoLdqeUBYiKfBU347A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
	b=Aa65a8wv6/b/dRlpmqlcD/scB6fc9arJzUpOj5qCAlf5aPIPtI9TkVKGKh53vvKGY5pF
	 gsOJGw5WA8032IBgJdiKg8OPbJEBA2ZmnHTBHovGOq+IJHdLapr6mWxSjtTwVFa+c0kNP
	 Azrzw4hE4FnrK7g0O0Yx9UBxXhR9Z1NMuNGziEqhNOOIMdEAjIQUpjZSCV71lDzwnHhQP
	 l9bPst+iBkaeWCbca3yRslLesyNuVolQIzr7evYnMYhoGFUlJiBSvLf/v3smsCeUQz3Ne
	 zDLN2gvI1h76JQ9mrg/VdVCvGqFwFHMMVz4ZrfeAg+Ql8+zNlg6T0TOueJ7UuxONYFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QaT3JhQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVajG97L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8394D606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8394D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QaT3JhQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVajG97L
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1Kwv03997087
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AwSioBO3+sOu364AlPsy6b
	DKqo4iTTY21pTGV5k37u8=; b=QaT3JhQyXTHrlABiDF12wNxcb9ddBRRrWNi4fZ
	fHRXBjnXblW+VBf699jZWh2NJxGrw0MmBi+B8wNi7c0ws8bsHjOJEiajnPZLbwWQ
	IDOxA3y2qV2mn4KnDj2bnNrmhq5tCkMfPrVMv+0lqHBlvrFf/lug0Ws9eW0129BY
	sD0TE4gN5jd2m6FDD45tAFXza/9Iz7j4yqDi5bUDb8EmWlXVMMEiCZXal4vnS2Yt
	6AKCSutVmFh69aZOSaDHX2SDhn/wbtV6KpuuDV0zbY5F00CaXnsfgq3zrPBMT0d7
	wx+g46YyR+CzDn5lNleKQ9Z/LEobXOqYdfdgN5K/TULrUoxg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx4psq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:08 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8615687aa4eso3682841a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800947; x=1795405747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
        b=cVajG97LtNTW0prUYIMn/ys255K1pJm3rLqM12H9yKzQqt02C0YOE65HAvPQSWc+Fl
         2wuK8zLhuTjr226XRoRzfYrenl8vGn1lqfo3SGXKumazZNq2cTJ2H5/alsDbE1AgBISL
         zGL0fQ5S2zMxLCh2H2k21YqWSMF/dSipXAScovdBZnlVHDObnRNsVYlNLO/rO0//jpvj
         TyUZxYwa7fLEjNrqj7trwlF/AitXvPNGskxgYo15TWjb8bKu3aEojT88gtQbVbbpXFAp
         4Q8ERxvwlfX0JXUvjZTHyg7WJPlNVWeusb6ceB1dTjIUUJTPq2FoHYwDI5qgusqQtEst
         HgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800947; x=1795405747;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
        b=vO3CrwJmSJGeXCIivRfYJ8kmhsEq/r1ogjdeIi8nVssiGQx5x+IgeVN6etiFsO6y2R
         +E7fri44O/Kkg/bg4JiDxLe5vkTiKVQHSZqewB56UDbxT1bXMcGGLepCQ8QI6OUPRHzm
         xS1AW5kjj6heM5EFEvDvxDePQ1h+1XaFiiqFqQepdLQixaP3t/3Lf48+934Ogkhhj415
         jKZV7+Tgx2+yUBZze2sr5u9wqNnL2nTeFMql9nxQ/LZTO5evQdvcaxL8I5nNpTsvgeEi
         VXnfQ0Ru17qvwHVThf/iKdhtZzaSpg0XuL+Yu8TizxzY9wQbZpI25GBjZQ+eDFIa/URj
         RsKA==
X-Forwarded-Encrypted: i=1; AL+hErE7P3c6xlk2U8hokMnWlzHwyvZskQ2xIyvevV8XaGYk2SlOhyE3QV07SWiBHw9ZBTiSwC1QHOto1I+bntQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9++DFK9HbQ0CUI5OdVKZqdrwiaBvQp/ynbWg2BUOP7JXJqaciz
	Qh0X//GPD+E5PwY8U8GFCzDym6dqYa+/pRKAM6LteJh4mOQoavbhYoWg5KA5dA2KfOTD7nrYpBU
	C589OrwMv1u0ojFaYAT2ypelBl6tcbSOwkU82wMD9kD2m6esEGCO9eVdEB0foFb5uUU0=
X-Gm-Gg: AYBFou0gFlAUbooJs0+QLffHkXFx4eDtjNw3pu8ufry1WVIGeWUwErlr16q+IsELs38
	ovm7b9MwBiD82OdFKT4zB7Mzj5evO5fqauwHvO0gN5pzWCLDlzcktxj3qh1GXj9xhvI68z8PGHr
	2XBKFx4AApGdxxLiD2+pKLK8mtkGzh3epC4JLkYvxSrzpzeCCy4nxhmSm4YL34pHKZ16hpMM7SC
	ljA7Bo9eRceLHWoff+36bAU/ajH7NK3s8Cq98FM5Dh8cmyzyXSzR9ymetDZePWENQKDL6aykQdB
	qu2T1pBjgu55WvDojnj0wtASN1nE32R8INkVI04MN/DQ3NuogvsL7N02F5odfeAWHbogiLdzFg6
	Uw5WPvxCki8iRGMeK9JT0P9A2F6NHy1ak5coBwdAzwjwfGuQT8wgVyYOYgkU64oAJ3SI=
X-Received: by 2002:a05:6808:1304:b0:568:195a:3bb0 with SMTP id 5614622812f47-56cd81025f7mr8424124b6e.23.1794800947481;
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
X-Received: by 2002:a05:6808:1304:b0:568:195a:3bb0 with SMTP id 5614622812f47-56cd81025f7mr8424108b6e.23.1794800947038;
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:06 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Date: Sun, 15 Nov 2026 21:48:58 -0600
Message-Id: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBBEf4Xs2ZJuNQqe/A/Doa2r1AiFLjQa0
 n+34M3LJC95M7MAU3DEcC4WCBQdO99nULsCbKv7Bwl3ywxKqiMi7sXYoxSqxgq1RTxUCFkdAt3
 de5u5Nj/m2TzJTmt3NVrHkw+f7Sfi6v1NRhRSkKyN0vpkraGLZy7HWb+s77oyBzQppS+U1KGzs
 QAAAA==
X-Change-ID: 20261113-qn10-29181ac11481
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=O21hWmF3JdxBvxYQdqKe0pInn2b0anFSnwH0bvKSzcs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xpa+l4miB9Ynnm+C0u7F5g+uCEFiffNX4T
 tU9TEWqvsGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV99BAAp92sYWEGlxRLgGrMAGyEfrGMLjrC4w+PZtXvHMU
 s7o0tM8L3YE4czCgSObNQHXRnRBjxE7/hZ3gkToACaA0hPwtOzz7b1+JCnHkkS+ewcE9gUcMpYj
 LPo5PE41oNKcj1HQt8khDylArZeiUqgw8NFQPZA9pJZcNHnabls2KjoK7CCcZBk+a156JH7POe0
 oqSqn0GHikA78joC97xTMxeqoErYVUcbwian7shJDXLjsPLYv+vuPQ9bwolyi45uss4yrpKa2Ll
 Wasp25PmnOaRiT7CyJld2+nND0jMW2aqPcwyygLMq92bJttppAyUENxmJzI2a7d9Mj51X0YRTZS
 HMdzyC1vDydlJ4oq+KzTJtrGAuDA+DOLBiBp+mKOxCIeOb09hyxTXhZWQBOdp3/eX4a3Im+9qRg
 W5gx4u5eN/1qP+ykDkkXBUhFKY17eH/hWgfFgL5uTw+X3ONU+uVXr9KJrJp+2ZYcxP8njXm5FOL
 meHpH6pA+tbVrYR6pvcRGTeSF9JVauhXfwIPvtdomcbK7nST8ztCL8XpFYX+qXUGbTvTfgfrpcg
 3z7ABssEYmXnREOnvlNnfuw6RdTCzHL6Ue7xW+9JOxzL71iw+t2Z4pmqC/V74E/nMSvw4dUgOr3
 Z6TEer5b2L5+3e7juyFLhuKDIH64j2JP8t07fk2XbL/E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX13lyhWpvGHvk
 ComzaUo4UdC8dpoHOSBerloCi99R5Wxu8GAnCDFSf04m5qQLKezDOHULaod4SrtK6iOaeBQrneM
 fM7ijd461VILXnDVJ79l60gtuAwsy6t1KhW2Ve8G9rv0ECyci+4G8ixUK38sD3K/RV+Ij0ZlSsp
 aanpZLVMAOY9+coHO4poavPDJEwS6uHlkA4obdHCfaa5NhuRxekNCNshpdPiEE9YQZKdH+2OXM4
 8IxexPv2BVVDxLz+yDBlfQQDZQSPL65vEjnkbgPhjgzg8VYLQixnoL4eUCm+avRenGEy0U8aDNX
 +GZXIcpzVNjOkvUsvS9KwmAREB9d/HTasUxTc/oyNxyVOmStmz3HHmp21gAXw8c/iQq3sBAW4qp
 UndFQZ/9JjdC7z/8ZaBKPZCrBdVkplNmKD+7zR3EWaxFK514bLQAWGU1zuMicUNDhCYmJPhzn8m
 yAUeTY8fqo4KsSeUuNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX2HxUtQ3b42In
 nACbEkBprlB2sJtpdRMaxQ0uC4XgrNaE3v4HII3VeUUgVvIT6agiZsoBrzkOTow7GkAwNUi8C8l
 BAZaTL37VDcm2uzntzj2KdnmkTVzJp0=
X-Proofpoint-ORIG-GUID: HPn7fVzT6ZYbQ0ihreP09IC-cpmzBzlN
X-Proofpoint-GUID: HPn7fVzT6ZYbQ0ihreP09IC-cpmzBzlN
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa7d34 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ocDxE02YPJZ25pTkHFQA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014

Introduce the ASUS Ascent QN10 compact desktop computer.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Move the RPMH regulator override below the SOCCP remoteproc node.
- Sort the GMU and GPU node overrides by label.
- Drop the unused EC interrupt pinctrl state.
- Link to v1: https://patch.msgid.link/20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com

---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add ASUS Ascent QN10
      arm64: dts: qcom: glymur: Add ASUS Ascent QN10
      firmware: qcom: Allow QSEECOM on ASUS Ascent QN10

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 664 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 667 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261113-qn10-29181ac11481

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

