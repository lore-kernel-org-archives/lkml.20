Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478571;
	b=PgWZxZ2t7bU5p4WIOWKZT0raxRigSR7kSuS1nfY1WbYEyMbAo/uKXbkeAIIyAa3u8fix
	 DGtbLwyEi9bTiTxlgjSk9BCi6QcWtiWAtcMUinWib8UThuej6Uyk40OaDA60C8QWuCp30
	 nb4ahOqhh1aL9Jwo1J9syeg2CBzBarWgVOEt6YxbRsrWb9T9ivqRCrE+Z9FgC/1nu2sdj
	 Md8Dtd48UjQPeRrzLljJ7f0QtBZqV5eNbLqzz1KXGtHm/ZNcDFz4wrawACVnEhI4Y5uTW
	 OzTOgUmOidgFhhXiZqrBTkIZo67SOOGOFgrDqWKVRNmNrlGJFIxlm+gL47PeAVZzZuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
	b=WZ0FZ8z/D/azcJJf+fdBxwSGLGNqwUURbkr9NmOhTQEvG/D7rKuZprFRNk3Ame+BUQa+
	 anrPw2EOtp8DGzlfYQsX14XKotNAx8qtCrr6CJMN870VqFjiMgY3melAnZ6N19rW666mJ
	 iPkpOwAPrbciAK5Hq4K6U/LMaD928V4IsA7rc11czPfkEPsY5EgFEf7x5qeaYY0cd55EY
	 U7EUHUNn3dfDdZQuoxfBBZ1AndoYidi9xNzJcnibr9n/SSuRa/F6XgWiqf0SnyRLNGPGr
	 vigVUrrKe+UXwvqQh2HXAxiURE3DPRGOKV6xMoDzRAxaZr3xst6OczonDfvhkiO8VEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpVQj+cU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmm5dtuj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E2606A89D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1E2606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpVQj+cU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmm5dtuj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8w4MJ4149412
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=; b=MpVQj+cUWHnQLRRB
	M7ODXwD5/iVwvCTq+2+cdi+Wmk7DMSDlL3m9t38XikfXP7kUWvkvmRW9Du56HaJU
	ThyPlxdQ2/Zz7tdzJLVKOAFy9sQzUrHp0ogk9v8gRUGTMw1676lIqAxyHHiPUouh
	qKKNu0W4c9MmiGuu/10RSvaH1EAsH+DYOGBCJ4pQqRVHf36CgO1MghQ9HwQHa/o3
	vZ/cMHJHNeo+TX2rkt0kOv4tWVF0SihjHUYC5aPDdqULA1mBqQV7aBUqxK62Aq9Z
	o8yKX4s0H5IrhrRQiLqCtvGaL0Tqo3npZuuaZWWZE4vHrLGCOA9DUXLwEdF9+bfr
	xUkcSg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62xnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so3486294b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478568; x=1795083368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
        b=Mmm5dtujVq1k/Moh/Ow7AvNjbYwzh+OuEbopoYgXsCoBaAUzDlRergg4eg4//lYQz3
         N7/MNvoA8FenqJrZodVxbjZbJ9dmaaWtEaYOTCTpJonu38Ua7XfKbxCY8k3CP6afejFC
         9x4Vfq/u7ulHNQvrJ6N0Dci/XlYaPtbOO4v5t+MpO6suod0j7xVXwkd+kPoVoufDtv9k
         UC1IP8DapPd8wcj22GtyEAhSDphDh+M+aDwsue5yk0Gb/ptHfqX7EG8BkJK+TRzGFvO7
         AfxGPv2CJjPScAOvQJb20UEpD+qTOV6ce0lCJoiMZajxx9NVd8VUHg0aJN6YIc/WCe3P
         TW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478568; x=1795083368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
        b=gvg7szp7xIrITh/kXL3M44jmQxIRDgtYjpiUoL7kRyebvS47A98hjSdP/yGcIsZGRy
         SUdHxN4q15xXrmBBdmh+JHbXg6ws8zGwDJ6rE/HK9qWxFFJv4LA8+KJ9cyRlok0opKQT
         yEqAGtQHmUF+FL371nBbuoKQpJwV5uyXMahS6qqI3vvrQ6FSiSrZet+eJjyvQgrbWRta
         aM9bR9gl7wg7doh8X15w6oadx3tQt4T+tBRsa2k/RjDrkr0GF+wAxreK9DWJANFRrDyC
         An7/mHavNZ/hUt4Hr1N4q8+JRzt1aqjgjKAg0Wyp+9dYLpMHjwl6dFv6N3feTlkRI18X
         kxgw==
X-Forwarded-Encrypted: i=1; AL+hErGdlfDYRr8aKq1BYz7bUp1Qy6dOSfIYxfN7KVsA9MOc+bd4wIlU6sMqzEQkhKTFONpEuV4LSRk9c4GH9Oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hwjdS0FhG463nx9AW1r47wzY9N3h+gJWNtHTeoeu0DU2rlpcu
	npjlPY0Pi8Dcwl0WQmSyEa2aXWXmAYXbSybbIRx56WLiGmp9ucRz+0FICWs026m3+LhHUa8y9sV
	uH24HxnJEyvNaBdVk+v1pYSqg2IGIKb9lX0ARbLJxz/fAVNe+pjlYVL2AiwKnG4Or3g0=
X-Gm-Gg: AYBFou23iQv06ap0TfIzL46ak4FPhvcy1xCwl7cTWFujV+ghrrOH6M8Aa09DzrduIv+
	8MO9We5drNlY8nbFlZGtbueMz1vSk7GmHbMNoxby34RsehiD3u05Y+CwHz/c7EgA1V/bnAvjnUs
	nNNgxGXRnqPUjw58f1/pCzwqDr+UmePxRyVtgXvMaB6E2SFgR/T+s1KnC+Kr+9q4DauSUlHfBVf
	WMzz9jHnY9Jnk/Z59zB/EpeFrKTMruwrO8Y+IwDv9NM4SYZWAfbClKdqiN92K157WVPHh42T5J5
	xe0FPsRe9+sh/Q7SSvlnOe0CPQUVUV9yfdTVbE37i4nYYkVcfXYdJttoJ47cVV5mnos/KP3DzZx
	VBo7i1wxeWPrwbEpTbV+xVXdGm7ZjagacHvTfSulPOPrN83wdcnwljiS9P0mAcLfO8exlhIOPl0
	YP
X-Received: by 2002:a05:6a00:18a1:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-8bc1ec7bd3dmr5363818b3a.59.1794478568177;
        Thu, 12 Nov 2026 02:16:08 -0800 (PST)
X-Received: by 2002:a05:6a00:18a1:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-8bc1ec7bd3dmr5363785b3a.59.1794478567683;
        Thu, 12 Nov 2026 02:16:07 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:16:07 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:36 +0530
Subject: [PATCH 3/4] arm64: defconfig: Enable the Parade PS195 bridge
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
Message-Id: <20261112-mahua-hdmi-v1-3-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=743;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Op3gUFINVffD/rIMQugm4ViW6Z9HUJGr5mZ8N4cmk/0=;
 b=VFt2bDLQa1znRWwkyQjTJ6Itr1GLQr2wmVOMbafYoqo5llfO2tZtAICGK0DZFNw8vH2heK6Pt
 R1UPFH4ofI9C02vubBJ+HpSSnAxHk2NN/535QlUjIeWOuq0iWQ6SRXw
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: -oOWa5u4SyHuxpx33cVWHuquimbNLjVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX5bmuap12qzQK
 wSlBbsiTazlSjAO+nES5KKbw1jlxvvfOl97BkmIaO82HitYTz9MZgkpE/N58Yzw+MUS+smKZKlf
 07Fs3fIYSy17iZERT7Vv0fzYiqGCilVoPEs2m9k7GY0dqByeYAZDMEHgNosnhxuF4CGPoLOSdi/
 C68st4udHKiuFJrTW5b13Ot+rOJbbgb2N3L1qyiLkYDoO18VUry/+nOm0ZxyOxqRWFdSxAKxonv
 j7lqrIIR59NP2sq0GF6TRjyZ5Kf7ffuuOsdhGPqsSJ4v7seTADm+5jIdVih78/nYJnfe91KmDCh
 x7s2gocLDolSgKckgorjAOFqlU4wjzFbWSfAEzY8xB8YmmZOhD4UhcIS/NrOKpSDKgHucew9Zve
 7+2h8woaC83fHhB/fXIQ6ouByjar3je7cehrcD+NTfwnB3BGR4QiT+L9y4YHdSHk4EEmJQlqgem
 IcycgrmygYpoHXIXrMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXycGOBJ3PCEDi
 fMaL4Bs3L34mJJEhyyGE3yvnmRb++6dY4hHjF0LDwiU9bHVzgm+RGw1ywxroqpHJNRgROE+OnrC
 nOmdcINR8RGVlBude5xV9SOByhdbCKg=
X-Proofpoint-GUID: -oOWa5u4SyHuxpx33cVWHuquimbNLjVV
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af591e9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9THlnupo0N1hDek0eNUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 bridge driver as a module for HDMI output on Glymur,
Mahua and Kalambo CRDs.

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

