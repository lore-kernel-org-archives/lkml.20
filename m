Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788695;
	b=MQ50gZyfrQ/+cYjyogOHNix4vvZbwvKNcOJXumdP3OVAG0h3YGDdbbA3xJ8YPYYYI5Kb
	 xj0dCQlhlPuUMzOIfGuX+Me6Q/kYOJR+cHFKATgDVz/QFsG0cBf8miEolpFgoXCfkWqDl
	 GWbyPaTAwDKeslGVmnc2zt+XoXEEQBYZeLGjllGe6/J0NppYaT1Fa7gnTCRkFi30gTf7K
	 SpnG99GkLTwvanVtM09v2EvUeAJ4xvWdzy95lgwMyjG5HeCQD4+Qpg85OcpS7RNZcQgoK
	 mnlscxUxPqFFInG/mJmx9mBSuuiFefG55oss916jNYGV5mz6r6ZA+ojYGaIyyYVF8Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8RQMXD3uok7RqSLOBzpmCSJKZzbI5riSzjHLcDsnYpY=;
	b=L4rOGjwRYjtGldDvLZlXtlfRqQizHvaWvFy97ZDDTDJinpaVVEpUsXCErPFJwLrQy1S5
	 jg6J+3gv78g58Ftbz0YkwV5POsZzbZr9rLuC24ZUxwb5jogQscJvKrcJR4VFg+j1xmq+L
	 ZuPGMLycqeV5ycQR6azikBSbKiP7pBCcL8vOrv8AUKEhVDSSnqM16rZqyM/LcbFOUE7Ou
	 GoEj5lDHz5iqIS1iFplU2vGbtx3MkzBsVhGQys9LMnQmV8S8iry4W5DrmR++XzszJ9UzN
	 YAxKhlar/MI0F1vvGQpG0T8qCrhYt+ssYl6qUNcE8EM+XjwZEOVwOwLDmoN2eaqivhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahkx0I1R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGEZJAoE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3C606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B3C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahkx0I1R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGEZJAoE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KYaG1874538
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 10:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8RQMXD3uok7RqSLOBzpmCS
	JKZzbI5riSzjHLcDsnYpY=; b=ahkx0I1RGLyBDTwG6aWUexCYm7yEV9XgT7qiOp
	l11AhxfPWqO0COiUwK7hENcmaygldoItO7MJyjhVxgYq/p0BF5Z/nEazEjZYMFje
	9CGP/KxzPZq/AMBCDxkF1mUCl9kFCW+crALzVCzDFQxX9SMpArxCUC8Sw/93Ko7z
	BnxKGgg37QjkCS11KpezV+DuygIpzzRPUx18DmzP8qjP36gL2NPF7aMZU8pHaQCd
	ksD19SqNuzdkxsqEtmFi6BmejoEzzT0ck6/5/bk8WOx9TsZ0pJJ8DlO7eDVMTong
	Y7Mh1OF77R50x2AJQWtkz2kBazMC5FSoMl363UYgFocj0j6A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mudmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:13 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so426944137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788693; x=1794393493; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8RQMXD3uok7RqSLOBzpmCSJKZzbI5riSzjHLcDsnYpY=;
        b=kGEZJAoEHATaqCS0aDZHLPAs1ZTHvEThpZGvDe07JcKrqUsDQFaWLOAvCBGdEJhFRG
         1Ce6Gne+LISWAVBi0G2saOzAcPUJ1TmAOxXLpugzE71YEwagFDMI8yHXIdMurx2PMCy2
         aLn2xS6lQVprdqtPs2zftUxxoDPa1r6d1lXNpZVOAYVKwBFnc8+soSEjqbOFyA3EqSLn
         qbe5jwv6r4iazsCyTPr7XWs6pEBlGCSPdKurU2bcHVjhCNsX7bSf3D7eegY6TwVgT3k2
         5bWEdd90B9f1P188zwD0Bn4KVBm/CHsEej/3XwAv5M1Kux+mmTm3LW2T8W5cSVhLHzZf
         33xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788693; x=1794393493;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8RQMXD3uok7RqSLOBzpmCSJKZzbI5riSzjHLcDsnYpY=;
        b=gYjy4YsXGLH1b03Q33wp20jf/A49x5qCVlQCmzTv9b39r4hwL9gOLbq8mE+HyeHivk
         7m1NcNPZOoiCQ3I/DRbRxAIr57lA4wYKZeYS6XgvdV5O1dmPYyPlOUuojWTvn11qgvCL
         BfmsRSx4ZO3uHNXpFGnQYj6xocSUamcTqPTfLF81ng93aLC7OacGW8Hr78Annr/wASuc
         /SkbjyJhVqsJ/Rt3xRMKq2p1oC3fcm/orAe4sc65Gws7eQeXdAF28a9eyRQMnZaC25Ax
         8yOeDyKfnIB/atBQxKf3+ct4u4qe/+pcOecwrYrDvAqbXpssTFDjE+nnCqbZE1F9097U
         gdiw==
X-Forwarded-Encrypted: i=1; AKwUvBzq96nBQrUAm8YO22B3HqcZs4mKYjIHs13ZQN2Fjbsm56NKyrnH3KUdFfwbYlwcVZuFUcmUYe/bp1XjmzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bdmuC4OIopX7PCp7WZ0SvSxe6OARECbqS8lmD1VoGFnBFFQOV
	RQ3kccYN1rO/5MmuqNGpCFfDIdLJLZHFUWxdGxF7gUOU0GQ1qovIVM9KuEjOonYw11IXSsCm/Eq
	zm8O2N1d/+E3bILFVBcbs6oqr081YwjFjFTKytDAlZP5v5y7HYqK6dM9mxxNsyhebwyY=
X-Gm-Gg: AYBFou0lmd8uLO50BS4qYcXWnDJXma2wpuTbvr/JlfQ3kKHisg5B20lVewPilHiIzWr
	c4L0CWUzYczqc6wZb43BgVS8KG3FwQr34geEXhCbyFJ8iRGkx9malFHGtTq+4OfUr7la01K2FLL
	bETcLC0fusa5fmL6k1PBkL7WsIWOhxBKuqZllc8ULHjZF2iYcNh1Ads6Z6JRxZ0WCgJIbHBj4Np
	5hlJ3h/7XVo2zq8+dsqX8GEzhv//DZE8dddveMIYNLWNyRkBaGrG6JSQsUCoVwb5CfnOlZkb6K7
	TgimUdPqIE6ctiMU57P7kPPfxMAlv2B7Drdd+YAWxMEjwsqpjQA+TmoHZcm1lttqWLSRAN5m4GA
	w7aYMKdsqT5B0pQmueuOZMJMCm3ZdxdHCabL947/w03Q5gHXFpBr7Ch8r5LMpQ4gudQDFJodN61
	amZw==
X-Received: by 2002:a05:6102:148c:b0:7a7:ad9f:53b4 with SMTP id ada2fe7eead31-7d072bb37aemr6497850137.7.1793788692988;
        Wed, 04 Nov 2026 02:38:12 -0800 (PST)
X-Received: by 2002:a05:6102:148c:b0:7a7:ad9f:53b4 with SMTP id ada2fe7eead31-7d072bb37aemr6497845137.7.1793788692480;
        Wed, 04 Nov 2026 02:38:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Wed, 04 Nov 2026 11:38:07 +0100
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAA8L62oC/43SwW7DIAwG4Fepch6VTTCBnfYe0w4EQxutDV2yZ
 puqvvtoD1sOA+2CZEt8YPgvzRymIczN4+bSTGEZ5iGNuUB82DR+78ZdEAPnRiNBarDSit1pSGL
 euymwiB9j4iAOKb2eTyIYraMLPfUcmrz/NIU4fN7x55dc74f5PU1f97MWvHX/oy4oQFDHpAwiB
 3RPaZ63b2d38Ol43OalueGL/AERAGugzKB1CrTBDlvvC2C7ArGtgW0GFVHr0XVsIBZAtQZVDVQ
 ZlJJax1pRZF0AaQVKqIGUwaic5OiBLHcFUK/B6hvqDGoX87ghRJZUALs1aGpgl0Hne0Vtr2PPJ
 dCswWpsTAYZiTvyTLr4KfYXzGINtLcbImvvCRCsKYAIa7GaG4RMevBkpTeuh7+ifb1evwFfnSQ
 BpQMAAA==
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mbJTpr4LaUnIMYGJgvZkbjKdEXqi+FaT06goIMkDOZo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsRQlrbIaUicigkaTCtoA+4S/2h9PZzTCbm8
 SfsrsCTx7WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEQAKCRAFnS7L/zaE
 wwV5EACx6G2PqdWeyeuvX7Kbv5oRJnk5cOQp3FiYoxKuo78sw4IBlz/jfZT2f5rI3/t/jzDgRPT
 JGYAnmpNN74JKV3CtTyELtXNkn0UyZFtEqZyhupc9CPQYkq03Sa5xge6tcVlM0o6+AmKPlqq0/b
 gka0z/xpLt7CvZCXY+uTsv1vik74Y5WKYH0pahDITbdoDqLA5sLVQq2ADGLcABtoDd6TtoHDdu7
 4L+QdpBVfMl4AxZ25K+3dODXqWw1GtWqi6GsRLF0wSVmhvs1+6IPu6GZOktCJMNQTp6LIpJ2GGN
 gEFOzUzToRoSN2/aT3bcf9KwXrv1/46sGVmpOLnCw3jBPsAunGx0q8mG80VuQ+EPynKW+iBCECE
 xeix5IdsLcBFBpn4a3/CKf7LKiXhKk75C3zYFtKWGatg8YWCVVZjXzkuk7t65YIe60jiW5IO1hq
 44I7zkoAEzr6bJUIhrNccXU2OT7scLauQutWR1Ak0tWyEdKIBA61Y2X2e0/lilOuN+s24e1TzCM
 AYwovu4F/h2l8d4ho4z3wKeCFfPSjCufwgGBSC+27ubdjLCBwPW736y5SNsMyaJrvKszgFbpl60
 pVaiX3yCzntsvNyYeyFnrBPhHMJGYOubW8YNigvJVmffhwDk7BpdofNyGPWigqZ7slBcDOawy0C
 UK0IUYK3zaiTHMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: DsMAR0CZSJltm1Roo7zpn45IVcBnN9SS
X-Proofpoint-ORIG-GUID: DsMAR0CZSJltm1Roo7zpn45IVcBnN9SS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX9eqGvQx9set0
 tqPuUepadGgt/lIx2GtrtKnAADL2fzMpWxWdddJvJCt8BgJz7TIbV01INDlS/O2b5VtJJXvLWk5
 oycKEp6Yug9tlR4EtUAeUxResRmS7BQJCHOHGOjBwV+oy51Yk6QEQRf1smR0zlqNhdFL5JzGgIY
 Ts/yb5ME19rIc1G7u0GybCD1D/r869ptHNrzW7jjhNTI8B7cvxp6/r/Pu9jol+HrLbOOJ6ax7b+
 nMqY0ew0nk94N45k62Yoo3PZG0iXlUPEQkzEWuyxywR5piHg8NzjzEmGL6n9USxSOYUlInth+kr
 be132OB056YGKBiInYIysv+/y1Aq5nyH0Z4DA1lfe1zWSwvWPy0sBuPhmHTmYyITJS8Cc83C/39
 8cNT14DZcpb0xmsg5v8co9nA4JGWrqUKGA8T6RoDm/48iVQbmij0Mus/YDd13rkzkvVwVjH/AM4
 /mdtDkYAdNB/qBmyoNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX73SumX4sjWhK
 48n+Q3Er220rvRU3ilmQ+KgfwEsqz/41VT+y0SI94wWXNcr0eeMglJeXr4+hB2NbH+f1/IkrFTr
 d+PxPUnyHHrduyCOPqJuKGioQ+lXOnU=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb0b15 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=bJSJJ6j-Smuu6UNFEc4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v11:
- Take the reference lock in gpiochip_setup_shared() before reading the
  address of the proxy device
- Link to v10: https://patch.msgid.link/20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com

Changes in v10:
- Use unmanaged software node until the release path of managed swnodes
  is fixed for shared nodes
- Link to v9: https://patch.msgid.link/20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com

Changes in v9:
- Fix software node life-time issues by using a managed software nodes
  for shared proxy devices
- Avoid mixing gotos and lock guards in the same function
- Fix a typo in comment
- Link to v8: https://patch.msgid.link/20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com

Changes in v8:
- Move the auxiliary device infrastructure (including swnode struct)
  into a separate structure staying alive until the release of the
  device
- Link to v7: https://patch.msgid.link/20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com

Changes in v7:
- Fix race conditions in teardown path (sashiko)
- Don't allow passing a NULL fwnode to gpio_device_find_by_fwnode()
- Link to v6: https://patch.msgid.link/20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com

Changes in v6:
- Add patches fixing the error path in shared proxy setup (sashiko)
- Link to v5: https://patch.msgid.link/20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com

Changes in v5:
- Drop fixes already applied upstream
- Check ref->proxy_dev for NULL before dereferencing it
- Assign ref->proxy_fwnode with the shared reference lock taken
- Don't return uninitialized ret from gpio_shared_make_proxy_dev()
- Simplify error handling in gpio_shared_make_proxy_dev()
- Link to v4: https://patch.msgid.link/20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com

Changes in v4:
- Fix arguments passed to ida_free() in error path
- Fix memory leak in error path
- Link to v3: https://patch.msgid.link/20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com

Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpio: shared: factor out per-entry teardown helper
      gpio: shared: factor out per-entry setup helper
      gpio: shared: unwind partial failures in gpiochip_setup_shared()
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 316 +++++++++++++++++++++++++-----------------
 drivers/gpio/gpiolib-shared.h |  15 +-
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 194 insertions(+), 157 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

