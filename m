Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609466;
	b=FFg+uIg/z00/yPEKC1R6DPb9ljLmo+HyQrMhCKmX0DvMqZ+7hmuUmfggNDUD5hVgzXtv
	 sUiZwGUNWaHr0gzmOrvihWzbALCR20P7RJB/WMPSJqnIfyI2/cD04qS6XgotPQSVJyDIj
	 Azgg1jVOFb6sTd9VP9RMEnJbFIB5BFKRRndAwhGs5S+rNYIFKy841YxaDatw0NdojeYiw
	 xDnJqDWDUhj+hrSDOX+lcvT0zELPGi9POC33HBT6kU5l4zCLoGN6Nz8btLhdZ5ZoKkbwB
	 xHLCQH5qoTms7LwuvJRBVksQ+MIh15jhpr5FbgobaehbMcKquW8m8qNNZk/balQkJEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
	b=iP4o/LI9KOxjcCzBfw93yLZ91yDgmqdGwOO0DCfgxLTU6GTRAJ5RZqMkNFPhy4rJNIhu
	 8lXQBVvFeHRCadqyD8xbxFt7jn2kTajntT3lxYm0PTM62cG1haydwQtyJeJYP4ujM1Iig
	 O649Tox4yhZ/6tsWXZOwoD94qg+vT/97HHK6zEs3EWc5sxvFZjK2HBkpk5TIlzn+Z8U4l
	 4XWyz9JwUa0j4xzlv06RNo0U5d0TAI6t8YMSlby0HlFcaS8VMM8URB4Dud/5BXnzMP7ZQ
	 MAcuLJ5u1++j50T/Qr3UMW3rFm9spsxpc1uQJ8MFHir5feSxe6iMm0m+dgh2yJoBpag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HErbqs6n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GhH8AmI9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3D8606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B3D8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HErbqs6n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GhH8AmI9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vUCX2192517
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fK+MfzAdps/6x1wKXxC8U0
	J9pUwDKyZlecelLkcuWlc=; b=HErbqs6nU0hxqI0mA5JoSmE2p2PdO5+fJE6mrk
	hUM1PKN7wtYBKCvAXR9jD3ug4TKzTnvej8g+ywslTskCnDNZoV4o3kjOGBOZQj+y
	hp5rJMRmagM0hJluEanpWp8pE3meW/vXDJLgz9DtCIPrMLd7Rxl/4kocgru3SKp/
	o9ygQfhsye47QbzfVxHRG/Wq+zSRbrweBqzyFbmLOdBInR64vZI5H0ksJ9bca1Tj
	xQXU3hanAnzlllOCMAe6pZGzBp5kcTklyupX4FJHWy7VRKbYoT7/BWWQRwd/pUlu
	InyFqk5x5KALJfcitd6HovTRBkkFyIP/u1S0c4PNmRTSGdHA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93enveh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:51:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a08903566dso2733129b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609464; x=1794214264; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
        b=GhH8AmI9AjePY7U/JEzX9AlIjIjCh3/NPJwgTopPwA2XmWVtTQ28zUBwY4nJ5Xjcg6
         8x91bmDErfd9Qfry5M7beHecfwwfPWs2hdjlDdhHlFz2eWl2Y1eBsFtP/GtQrPFwqjdG
         9U/rJz/Gk1BUhE1/tbNW3be3Wqg+tTtrg7DrABAkgJl0L0RpchX7L37/hpTAPS2pS12Z
         XbnSTZ/9EUCqHrlrm7wHiDIbaRvWiVi2ujmeLNZ5JDxnSdP/YoqHp5co15q90NELZjRH
         HEMtZgUlvrRmE0vvYAjm+0Q7S8JYCkIHUSHQdanPInrlLcZk0PJU1U24/A7sN6cEEUWe
         yPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609464; x=1794214264;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
        b=H5CSF4+W28cmTLCJE24URzPCtAfRQTwFFMUEHCfvh5kBzuw6vtJfyH3kJ6oIoBRJgK
         ZFnU85NSXeg+EbV7CQ1saBF8MNnDQjOUHD4vfjel8724iu8Fovkm2OraPrERwMxb8zTk
         0jWKiU5jPXMqcYqNstpZ/tPlTKBKVbhQp+UCmp4mHIsWrUMB97GZeohRt9TnoiJ7QtQT
         Ib6cO68BoyVpa1xttOckQ//C0p2LjCOhLxrTI1hSIzV+RfebYk7AFxIAG+wqSjescU2P
         4ZDH8D7ras5ZS+8B9hmFg9E0Klcte1Z0bcpUgd+ykDWcY5y0hRTqb/6mYFEqLyzXBRZh
         irkw==
X-Forwarded-Encrypted: i=1; AKwUvBy+tAP6d3/NVyiskZ9jvTVnQyZ7N/Wfwvvhz/uQGZ6i1/rKe4oBvsK+6qS98ZARxMqm7uoolFjE6tUjL6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/onIVW1Tpmz3tx3A63ONmPf9Uj3tyIkxfMIjshWpslGbvgAKke
	oR0JVsvHgDZ8tDfMvJLT4xt/kLDezbYtfbIl3PfSNtB/jmisey6iG5rQYnLVkqdqPokQ4chrnr0
	0/Hhqp0sTFieZUo4CgxCRS0VL981R1ijNNUj97OV80kyIqFN/QLSkqca7XscRIFH25M8=
X-Gm-Gg: AYBFou0T1UBkCwKj2ysuiD5n5eWrbGmZzpOo9Hmta8uCgu7JwHFslAL/wkRqo/xuDQ+
	n8pBbQAlPmPyXlCB2WruHDLzXdVDZXtTxKr4GRZ/mmkdQSjmoydVKjah8LhBP9MVuPbVwe6gmXz
	uEzev8+LO89Mo+CJiqDNKSDEQNX4qgbngD2XmJolnm2bXA066wfTUoUHo5SxlmkNN1pJi4hobz8
	mwIjCG2xJG8UTjzVtVwjZ1u71feUNqvbleoi2KVsLvnjVQrztx5VXaC32kSlrrBSEAiIdX/jZzJ
	9109vu+rnh+b+dxK0j+KJov7DBbzD4SzpKjRUzhcowp52bV0ZrKvKUbKiUDXURspCA5Fuq0QiHe
	PursfIgKe68lBS1BjEeDm5jm8IzYCcW8VGYauH4bRCmG9KDi5EiE4i74cVXV3xMw8o8bG0t3T/f
	4YVPE=
X-Received: by 2002:a05:6a00:2407:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a83366b9f4mr7480394b3a.51.1793609464017;
        Mon, 02 Nov 2026 00:51:04 -0800 (PST)
X-Received: by 2002:a05:6a00:2407:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a83366b9f4mr7480379b3a.51.1793609463545;
        Mon, 02 Nov 2026 00:51:03 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm1748329b3a.9.2026.11.02.00.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:51:03 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: camss: Use Glymur graph ports as CSIPHY
 IDs
Date: Mon, 02 Nov 2026 14:20:56 +0530
Message-Id: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPBO6GoC/yXMUQqDMBBF0a2E+W7AxGCqWylSYjqxA422M1pax
 L031M/z4N0NBJlQoFMbML5JaJ4KzElBvIdpRE23YrCVbYyprB4f37zyNYYsok1M5zq54JxPUC5
 PxkSff+7SH2Z8raW6HCMMQVDHOWdaOuUb1w7B16lFD/2+/wCjGpphjgAAAA==
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793609458; l=1407;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=NKMs1snAVmrZ2J6U8AwvfHr/ySDqtJanq5jMU2OoPeo=;
 b=G1+y9A9bMG/HwEd6iMnE8y27+Bl8LpKfJQZgoV7mHRUdnPhGSe+ywah3seqSXTrHNp+pISGAi
 oVKCgIbPphsAHXKlE7wtXedzDB79T2QtqoNEfQD1E9NJPI349Mw7p2Z
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX/3SDD0uB0sKh
 mfUTaWJgrL4Y2xIK07udid9F1YU3LklnCdK6oVMGBSSzlTWFMHXviCokcbwZPamkIMIwJBlpmlR
 kwNVnH5L5hT/xRSj5/fVDA67IS2UAWNmPohVUGryPQClYVYAuWyEbr17KZzMhhFU9/6P29RxWtr
 k/ChApStjSRdPyrf/TWS2gt2tch6Mg7OmXLjxEjVZzX9c9tQMaI4IQ6geH/47MDoGpmrFARKr1d
 +azaVtOuMj6uuoT+KHYPZNyxlj8EkWaC4fihMQuRVsyWFH4EFNMHo0YmHu5+ZiG4bIfGP8K+cfZ
 URXRrgwleDaNXr/TaH6U/NXjZr/ojZs3uDpmO1g3Iv+r6OeSCdD0Nejd4WCEhb8k+TTQtrw0bED
 ylxNE1MVH/XljPW8vR/Q0V4wYRx1G0ia7AySxESauQGhWSpS+kcVsylZS49sjGlYVM1dZ798ZaH
 oLxOpWAdRvw0OAqKEAg==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae84ef8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IAV7YMJS40DXAaybdl4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: N-dnf_yWbEdzU_FQPyLGe8IVwZbVqIAD
X-Proofpoint-GUID: N-dnf_yWbEdzU_FQPyLGe8IVwZbVqIAD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXxqhSb2SBRF9b
 mQpXW2p0xrkdaX5sOR8GTjp1PK2XCHlr95+2Gd+zIoFzuVBK7/eAi/gso/OEPeC1A5BqG1YyqzQ
 hnVBy+JWl1FMqm+IfniqZxIO/RU8KFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

This follows up on the discussion around Glymur using standalone CSI2 PHY
nodes instead of the CAMSS CSIPHY resource table.

Glymur currently reuses the X1E80100 CAMSS resources. That works for
CSIPHY4 only because the X1E80100 resource table maps resource entry 3 to
CSIPHY id 4. After dropping the X1E80100 CSIPHY resource table, the
standalone PHY path uses the graph port number as the CSIPHY id, so
CSIPHY4 must be described as port@4.

Update the Glymur binding to allow ports 0, 1 and 4, then add
Glymur-specific CAMSS resources without reusing the X1E80100 CSIPHY
resource table.

Discussion:
https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/

Depends-on: https://lore.kernel.org/all/20261026224957.1115370-1-vz@kernel.org/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use CSIPHY indices for ports
      media: qcom: camss: Add Glymur specific resources

 .../devicetree/bindings/media/qcom,glymur-camss.yaml    |  6 +++---
 drivers/media/platform/qcom/camss/camss.c               | 17 ++++++++++++++++-
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

