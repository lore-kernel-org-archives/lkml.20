Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828908;
	b=t82+lFLIauLHKZmZgQEgUB2Ee8Z9dLYACF1ozvRJxp7tCv44Oqr6/DCM1YrKzxCuNYnD
	 gN/bs/J8ae8sRxnuxCfZ91bs29ec5AP0SyJseLAhOs0qycUiqitJ8Dge4tifxjTz2EYQN
	 9vYKDFf5bRhNJ9AqSca5z1rYx/ZtW4QmoI/3YHHBfHVUzugSyALkj6aq+xDZ2Z8vrbKen
	 1att4ZV4MEXbGATl2rxaB40UCpG7+01ebKW+4+Xdw04FgF6rFM9gKXE0zv2/Rr94jlxb/
	 m01UQH6LlPbjlYs7qdEhglGQqtVy+GX2QtMGyHKKRC6ptLGZCoFz7oPRJZNp4t79b/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
	b=eSwKVqsfPBI6ITCkg71CWa4dEmUzMhliD6q0+U3khJwT1Ye4Ppe3tLsRH3HsYEdiYkMh
	 SMYPcSe/V1mntOdHJ/BOENXb10Och9lovPy1v+BREv4FCZBD0FRZdQvaWlMJGbh9TS/2d
	 muRPtEoiT2DKMnQzri0GEoMB9FU2oNVHLDgR08TcNYXl5+EZVpUnxh9TSybzSjCO1Pau3
	 kiD/1JWDk+Sas6+qwtJ17d74HLf0vrBk3n3qq7dY8Fu7ouncKjtea/6Gpt/ExOdl7rC6S
	 1VOiWiHmz6xDCsv5YhxZFx5JJH+kFjVU2eeQU0ZKf6WgEv/RvL9tZVIvf6Z19aMgLKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyEHU2yf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fu0AKe+c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC9E606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC9E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyEHU2yf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fu0AKe+c
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLOXl1603183
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=; b=eyEHU2yf3na2RhgC
	zBGWYyi1hbO5ftFunLalAMAcb9qmCmqj7nBaYUt7RVVVVa/iytA8A5NEznMYqXJn
	2tV70Qbny2L15v0IXqF2CrwDpJnR3DMBvY+CG7x9vbK+BSKLsfOUMqTW3CpWdjUV
	JK10awuN6MznRdIjoplOYie7mwXG9JbIkMVg0QAq4PCxwFynQjizLEtJUuuw63m6
	CQrysqwfx57/zictEzYYK0tyUk+AKA0DSpggjoN7KnvIlVcoRFf7vLT2jOuC9ZNH
	YSJNkqLhMgk0aW712RFr/NuO9TFzhmXzWrjtIjHWsdbnOw34tPxEQ6LJV0mxWtdS
	1AEnrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc1xda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:35:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eced5a4cb9so27241385ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828905; x=1795433705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
        b=Fu0AKe+c5u8CJ+3c99zXlGJA34dbdrQEqy7QHYkAT85ADRyfnkk5iy0Oedo3FW7Wlg
         zhDg2kp4aZCet4bMfocf63+GuvAC3kWudLkfbkntd7AkiCfRCi7+sMiybnTIL6jK8iAd
         GgdwtskKeXTVq+ATE+2/FPmpyx6QkD6wbn1cH3rHjMz3q/gCOUKeNF33T77y5ySgaNzX
         jfKa2VK/eq6GyIBk045g9oydmXTdY+88q96eaxMXu23sjN4uDx+bLJq1fOEC5/7Hl/xs
         hn+F/It1uBnm1Kh64BHWR28LS7WBFHPplbuqa1Vt9ERUeKcwyea4DBMxKsLunI77oin0
         kUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828905; x=1795433705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
        b=W8P+Ajogdpe8/+B7uUS9AGtixdopws9w7rAx+yFSLpAMqO8IrBkPXTkykPeR9X9ASa
         hyardck2Dfb/mAXNev+NpfYYjGF2tSI/4eNI4EypmGPAO9nyT2tEpdrCH79YH3cU9eox
         Yznr1SSmQXqat8ufvV83n/3H09CzX1No7O0fSREdBhAch/X8sEaXBOZe2Upj8l1a/638
         f0OjJmi19AIYBiKKmS9GM2F9WKFheHsTBLj/hqTz2IOBJPBHWhGo2jjh2qMcmh4esBr3
         o90HSBEmyFNWnzgfmT+98fZ3kwXQ9DUNmT0Jg8sZ0UuJyCfKBrWBdRQz+8FOWhWACnLH
         NDTA==
X-Forwarded-Encrypted: i=1; AL+hErE2CwicDJmrQGCdXeORZQI1VWnV5qhPsOoCv9+9wXIr2EZllRvoH5BT0AhIrfdxPw3Hy1++HbOW6hJx80U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YUXAWH23UmBgCqHJz/OtSjBy44sHYPv8FEkTTcYXiaP0kPmdP
	jMNBQQstFl5FgAKBa7nNhk/eet0MaZwIS9nS9wpfu2PhHMJD8UN9p9C3AEea8Blq1aQA0IKedeH
	bZrVLdL7MPiD/JH7jvlbz07+Wng9HUIAk3bDWSoJoPGl8ak2OGaf36JQoyXTUG+FBhSQ=
X-Gm-Gg: AZFdTZfWp8pRzzrfRMm18nttzU+QldzzBELAYE43pfpdM+kNOOigp5HqQELDizM0m3w
	9tEniYRe7DEdpDRiQU1haTiAk0Ho9XwBeaajAqTO2suYk+ktEZfkQIqMvXyoGoA+Caer6Crhit2
	/1lMJPMscFdX1IN5VRZyesTIVxPuD5Tpe+u9UR0PNXAadujUE20M4VuE1/9YAItUq3GBU+Tk/BU
	IlXTs7CGPl61NxOwwAIbPgj7vZiuvNDWWZWRBiB+01VZ7+ZHsKQDWi+vYX+ER5dviM70EVB3xOY
	vlF4RpjSmEgQ1DNdnAVtQuWeMLASyQnjar0xmgaauPENGqZcIEEWp3XMDVp28bjP56jDVloUoHY
	iRM6kp6WYr8oZbVsCSHP/Y5hkPs+4aUn1W69Iwslph/yf31sJQ0528r3kzDhDpc+f0nBEZ4DwH9
	5U
X-Received: by 2002:a17:90a:fe15:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b37759ddeemr3746689a91.5.1794828904521;
        Mon, 16 Nov 2026 03:35:04 -0800 (PST)
X-Received: by 2002:a17:90a:fe15:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b37759ddeemr3746664a91.5.1794828904067;
        Mon, 16 Nov 2026 03:35:04 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:35:03 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:06 +0530
Subject: [PATCH v2 3/4] arm64: defconfig: Enable the Parade PS195 bridge
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
Message-Id: <20261116-mahua-hdmi-v2-3-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=763;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=fqWr8Q//GUQkrbwoURGIWeM2InxPizQ4dIjubj7qBVY=;
 b=8QPxyxQOJYULHOVcD2ARScmoOhA2lkvadsuW5o6InSmPFE/Ak0Us1rCaI3dQCZ5MRY3f47FNF
 wQnwbBYgAJ4D84Fin48a13qJzMly0DIUOekaXQdAKrSeTsWDdmesn/i
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX3LMMYT8L/O7c
 YZ9OX+qqkwUEaoxOnCfInBltmLL6qtoz5j0WV41HvDD2dj0bBpBa/zWxG6DE92Dz6Ki8QNezVlI
 sRTA7SD9DEIgYHWfrG0crCcCyBiMND8=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afaea69 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9THlnupo0N1hDek0eNUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Sa1NusNu-ruTob_LfZJ9TnIQ4qF-2Rkg
X-Proofpoint-GUID: Sa1NusNu-ruTob_LfZJ9TnIQ4qF-2Rkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfXzO7Nku5Bzduk
 386fgrzWM7tGjUblhbvhbMqDVnZcxbK6NdFdObTiWJKfbsCywztaJE8Td0/yNk5Uu9N/58JXdzQ
 yk5Qyl/q3RmiuH5dsma74MrI0vh7/cA/2FWrbNQxEhGgIAjd4sKYA3RLttU/vgRVNAmfMeS35JJ
 9PtxYIeiwTRI+bu4Ka7AmWyQHpUFh5i7ZpHzCia97KGUPzDlTGbANV1DwOXKLhq9dbgyiXlUp9r
 0/Te5wFntyuCN/AYv2NikNb8f2roIJsWFYzIYASnjz17W3Fxne0AD8ba63M0PrHAFN6/2w7r17F
 g4kRr3A3ZVt+ucKN0pgKqsz8xRRrglCKUaTQ5nkpcRTugXO8ljnK53vIg3rzf8KbP0i1S3N3lms
 Yk9kcn23NBzGBKZStcykq/YCnmy6Yh9yqUP48dBfDuB6jgNf7QzSmikq/l9QP5AThG0YftKWCYH
 QNwjV5pqfRaH0aF87EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 bridge driver as a module for HDMI output on
Qualcomm Glymur CRDs family (Glymur/Mahua/Kalambo).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..69db247447c4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -984,6 +984,7 @@ CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_NWL_MIPI_DSI=m
+CONFIG_DRM_PARADE_PS195=m
 CONFIG_DRM_PARADE_PS8640=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_SIMPLE_BRIDGE=m

-- 
2.34.1

