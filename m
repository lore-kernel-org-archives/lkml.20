Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708484;
	b=eCy288xuw1aGqvuZD9aDS9w5hZkBDv5YKJimgWump+c0NIxIwfCLlbZecYHk8hkZp1Yc
	 5yFvvSP0R8RkbPzTw3iCi2+qP/kFIMNGs+dSLaZWEnP5lJBv+yNHUoj7YcBi+ktpdpnWz
	 9xzVy4WKsTLB1pK/FyOhSOMPBcmrPerxlyYR692NKRwmcK4a0euNtxPXY1nkpGKeUMJ6T
	 kBpFIb+OaX22zvKccW6/SvN5/i6+7gMJQz9mMrpbsK2hrabjl+w0shsX3//59LkzjYtbi
	 K5/gbuDGuv+yxQisDGhZ2ml9ltRbP8H2C1TxvuDHEdWg9o+rAzmu8Rv15Mat0P0M71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AndNmGo8lQbotsc74hcb6AbQ0tgDdYfS8IkK4yUiUDY=;
	b=gwcmyUm1S+sSp26Oph6nQC79aIQbP1e4+V6SzstuLzpcGkif0gm/ubCUkpur0JYIQl8R
	 FRoSIoLe2uQi45NcFTHPYq5dc8yOhc7VMIpap6M6G/IquPI+SUggFFOyoe9jWuVl5H0OY
	 +8RUKM+A47BIeRx9kt/tFhm3nSdgTUVawi0LgVdG5N8OldsOQ3mxugm25l5uwHRD/o7tm
	 pmqXdIm9oo1tCVNUMXhrcJjz9gUAbrL5zJ1wCELIBVVz8hSqefJ6MuFWKGeTjHgR/uxQj
	 flz1hzagRtCAT1JE3hzkvOQhQ/YdJIaP/ONCsG/Zl0srym3TJ0/034vvaROaB8KMB/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEnVdcHK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXb4EaMg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F305606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F305606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEnVdcHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXb4EaMg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ABXKH2002721
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AndNmGo8lQbotsc74hcb6A
	bQ0tgDdYfS8IkK4yUiUDY=; b=jEnVdcHKbnI34ZJFSYl0PtMo88QQEfjwbsw5H/
	FbB/QA/RYgemORPogZzbYDRvHhB3hFddgIFDkHmoRZwgBrjD9AeMCW5ChNomdT4T
	FaOteLSWJhdXBEup24ikrkNScpk5cHtriMXzWhAt3j37SYrwvm+zeSP8VG4RcXEa
	LIoVsdoAH2f/mj9J1aI9JSfXIsDJWr771+5AFPkj8oe8x3MmmWc5ht+rwq8xqjMB
	AZZ/NA87d72lgV7s9lmLPS+7Yr48cs5V+gLr0G/GKt9/+yLRT6Rs+IGEgtPvNqzO
	nYNEXl/DXVDaBtp761T7xQMVRDD+SQf3LfkrLXoRsYmEJrKg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycsxpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:21:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so1007190137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708481; x=1794313281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AndNmGo8lQbotsc74hcb6AbQ0tgDdYfS8IkK4yUiUDY=;
        b=UXb4EaMggB4XdPzOOXvcZ5F59wAt2lpp6i2lhbOa6nY02KSOjzlKcENZ6AVOr9ZkzD
         mz8Mmg685RCcu5Gn+VO9HhYCCLaevgKEg8jAvKac+WqAysFoZu1aoFDm8BTqHrYESKih
         EIxVz0xel1g/qdNiG0vJYE+3ft/GScCxA2rkrvtj7d9Dl6+yVDV3PmKX2mPFaTqlwLe8
         cqWyn65xIs8Ct3vk4MDZNiJ5P+sBZZO/k7aLGTv8e/zdC+P1lhneabsbVFrXocGlg9/T
         UacJcpFM1Dhjk0dgkI1yuzXRFefqcoWEJ40GnklwIcJY5rYqhyCATSpIXqMsIKJigB51
         j5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708481; x=1794313281;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AndNmGo8lQbotsc74hcb6AbQ0tgDdYfS8IkK4yUiUDY=;
        b=FH5QjO7Tq1LbCd0VPTGlcFrM3wDiUb3/Os+O9Vla1rdXqZsCQe/Oc5TXiS0VFMXe/a
         jOo5pDcxk2ItAna4ny86alUIUxxJMKUdvJRpYXwRGkj+izDmim6jvAK2JIt8l/tkbTLV
         4a5lwzpAt0ej08gvvsUIg7QhnjU1KOeG26zi2tfryJXylCUi9wcUFjN/pnI3KZr/1AaK
         KEept8dJjSOdTH7+hQfP43EXUcNumuVQb3AZIKsdmX3zJyh42wSEjG174J2VpcEJY5Is
         udZkRdjA+9O10BSFmS5M4oDqT3xb4u6bH9ixxw+r+V3SmHsxvDjT8esJRyDox4Uaw+Iy
         rgLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBgkEAR7j7092uBfPAK7y+jh/yQMQWhgm6lbUP0lX4y3UJtff2GQoyMMUZm/kMGkirpAqRZmtbB+y5U78=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fbu8iA/297juhpmGBmWTWWpvHvr1ivLmtHPLIFTtaZ1vcGPNY
	TC29hbcFpyCy+wYoHzRyPt3QjL7vcfGwBu2KYDYPCFrJreBjq+ZKW8qjQ4AVIMxIeSlRk2tVpsT
	FUfcD/C4Dc1Yf8kcrB5L+Q4rm9mHHWrX+1LclJGEQc+PrqPI/Ez/w4Ce3kH/db/3Ok24=
X-Gm-Gg: AYBFou27pouz0j6LwRmjKVSeQ/6kfS15Jyo8jH1f+U3/wdpoHYldnlwdwlGw5ZOj6h5
	zQjI2pUVE78VRih1HoKXi6Y2Optg2/GVkvT+WOh5qr1O1+6Bsmw0GOzCO3bhIPERNFuBFMEHr/5
	pmm8h9TjjfLi2KsAg4inQaXkX9iTE0NyLAPZEAXeQQL5VaLgA3MKw7WsgCIqlNcg3dh09jxl7X9
	tPOiOwH0jZXWgFie7qdGYr58kjvdiypW+YlUSsmv8hz4ZBXXBgMpYkRTv2tn1hWSqF0yky46tqw
	y0Zc2x7oWh+XH0EXCCRtga/qmkRleY8AoV9oSAgxVL/9elisZ8A5N2ej9wo11NpW6pN5mI9UrXs
	mcFxdR+pY9fl9hLn7TqrLjKPSKCIyrG28nsWu1HWOAaNUBqXPlTNohnWwrTPximSf+BLweTiASi
	Tfbg==
X-Received: by 2002:a05:6102:3590:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d072c1571dmr4466667137.16.1793708480983;
        Tue, 03 Nov 2026 04:21:20 -0800 (PST)
X-Received: by 2002:a05:6102:3590:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d072c1571dmr4466660137.16.1793708480497;
        Tue, 03 Nov 2026 04:21:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v10 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Tue, 03 Nov 2026 13:21:13 +0100
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALnR6WoC/43SwW7DIAwA0F+pch4VBkzITvuPaQeCoY3Whi6s2
 aaq/z63hy2HBe1iyZZ42IZLU+I0xNI8bi7NFOehDHnkBOTDpgl7P+6iGIgLjZLKyk51Yncasih
 7P0US6WPMFMUh59fzSURnbfKxx55iw+dPU0zD5x1/fuF8P5T3PH3d75rhVv2POoOQAltC4wAog
 n/KpWzfzv4Q8vG45dDc8Fn9gCAl1EDFYOeNtA5a0CGsgHoBgq6BmkGDqAP4lpxMK6BZgqYGGga
 VQu3JGkxkV0BcgErWQGQwGa8oBYkdtSugXYLVHVoGrU88boyJFK6A7RJ0NbBl0IfeoO5t6mkNd
 Euw+m0cgwRILQZCu/oo3S/IYg3sbh0C2RBQguzcH+D1ev0GyxG/eFIDAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7c+mTVq+054pKxMVUCbyHgpt+ZNyHRHGO85sefHp19Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+6q20YTBnkIfhWVtV43A2NWIZQKXMcRGlu
 PR1aDhnld6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w6w7EACt7dQ5Jn+hvODrd2fr3ydoCi6TUpDmfFqn8qFw9Mp1krAGrGj+0xQoCtKZzzUg1pjLlHO
 oYRS44DGluhaMGR6XA5qItzYVAP8jspRM61SQ0aaoAbt5L845mZjKPm278aA8IfXMmHbrqdY/NB
 BF/D9DYH2aRfj1HQK/fDBRFrNNkcqoTcyt66fb4nf82HfOJjRZGVeyMQh0U7Y/A9TYXbNHdP2Zt
 FOU21/35ZvCs9JwCHqgrfQqcBLOk7H9WQJT1GMWXOnRizmKLHt19KWOcGjlBzWkVwh4YXOOAMxx
 D4vfu9MXk9w/qWDIHTrlna0rNFWe0MmHnq7BLYD9kYmFcjSJIa6rHiB6AMoXQ5W5UKAV8tb/m0E
 NJuRr1jX4BjdpWUvzvzEab0lVCEsjrPyTD05OgYJJpHZ100yhQCu2KC03UQZNQl+sDEjc6v7vAA
 a6Cu36FObj7+WtPsQtuPAgE/ikbueiQ26ncIh+vhdowEth8WQ5pJHcZd2Dn9Odg8Pg2PtFpweYK
 3BoNAUExw6C5olgqGhtlCZomgEcUIFSU7uzvybt3ORPchEG7NIiSphnGoTTZWsZ6VJjC5Mflxwn
 ardc2eYIfwzTEUo8cUxSoZHfWRXD6VfLYGqsD3iWDmptvl/y2ymhM2nB1/sl3vgNa4OL/OPew34
 b2n3Ya04nGxIb4Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9d1c2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=I9N5W6qJP5icRhYYgJMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 6ZwKGzYnJc5eOaUX-cXAsArzLjhs0HkH
X-Proofpoint-GUID: 6ZwKGzYnJc5eOaUX-cXAsArzLjhs0HkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX7dLT3UUn1P/S
 SnHmXaQoeDlUnSxpaDFyBtSq1tK8cdS9FcNtdNBUmEcwCv3AJSv+QXAy9rFF1O43ANJofaLOKIf
 0nnWNK8iHBy9gi6aibIJtu1/KBHBC8vCCATA0sYhqulCLcZ3cgaM/mxPKTTHizgaHGMmILeoxs+
 5khdmwTIRXUWBR4xrn27OyFi5kNet1Zq/sl43HRGSlmOWoEAQHXC8QsGoSsWq1B8buVAV2AbUar
 QQiWSMud0NECUh30v0bZOdq57HdXdFyoLh/jK9IIsTtmqpDfqpzj0XtzBsX/YmZI08769Z2ZRg2
 M/i1+kMP4mP5d1uqSFK41wqY+hj1TN1gRB26YDt8g7ukatu8MMinMLf4nJkzxhlRATJhfujPbZi
 DEy0T0aYUxZzSppWorDVAIhiizQLsCxSvZZp//NmNttclOZNncBr08Ymgo+RCYivSn2XyAGWizn
 wDLjHLPczBozyWujgCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX8b88RcGI+m+o
 s+4ITkOHXxPzX0YV2fZbrSiuDVMz4q89SUEz4oCHrmqJaG1VkI8vyH4h9Ha2zE3LK5oZTEzdUUT
 s+mDp06wHEFmL0jzHFJLuvP+IpJKDWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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

 drivers/gpio/gpiolib-shared.c | 314 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib-shared.h |  15 +-
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 192 insertions(+), 157 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

