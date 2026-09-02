Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F7D385D61
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379647; cv=none; b=uw9HtMVwx9BVZkwo1pP7hmGIgpGSkG4067A/WXS8nnMedfIi/vmWwIWCrNBCgYOQsl/8U4HEt03DcqYQtDHc2pWeSwPFVdC7+LeEV/zD0rYNdqAtzb1pF4HwtOnVyuzy0GIOPfvlrvZh6dHnJiMAgOGdisBf9ilbOGDuAicdTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379647; c=relaxed/simple;
	bh=+JRsAXUkPd/zCxfFhAsZWhnWtV5dxWny5nzrwbSSkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZSDb9DLyB9ZFwBEbVI3cBaR1PFVuWBwW6dQ5opelKfqsFaVksJjSk0JbqThGsICImNjDoWBXN6x4Goync/eNP83SNpFZ+IOm6smsT1p+uT9pB5gPVut/WYGmL1HpzYNHwAb+UmvnCaA1SPzfhvnK3GoDg1TA8ZY/0iCcmGrnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8qTZHJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ku3Oze8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8qTZHJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ku3Oze8n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrRW32483421
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOgl
	gLUq3iAA=; b=o8qTZHJ9wPF3L6nko83fbw4RSA3+laqGNZFT6uDbpl+YVhbI4Bh
	AiRHxzRb6pGr6xp1CtxCYePGu78jL9tipjO+GqINkNKz9aKmqQETyzIoUWGhomIb
	iHj2NQn7DXHMQGBwbiTG3w8x6S+gXIGWDSIGmvst6TY1qfC9HSx2tamypr9XuoZ4
	uxtI+2HSG/JmVkElTyVouC3zK8UcSsL79XGYNVGgsHptK9GY2nADRzhKHoajUrxa
	+OkIh/NIGe1kQa57LP0JOI/jkm6d3OdjCGYpl6KGAT0xozaNsl2RXZKAkvZlr6Op
	jeOzEpXx21MYBqscJHxbUbwqhNyliYP0sag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9p68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:07:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2904493a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379643; x=1788984443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=Ku3Oze8n70oKifLbL0+vYZkKiwTSx4ePYlrUMPFF0Vwq9VTWJv8Ip57LyFFZVb/3YO
         MuqC5MBTXCWoo803hXZFyMkJzgMWONskcROeUp/ykuQ24FMX+M5HtVz9P1BTjIkE+oen
         uSgwQ4QeI8VS+ihr+kvAF8Dr787spC2388+DoUXGx4ILfriPaqdmSIUYRDO7e6wX51M5
         X6alXk58dDOj4Vp2kbGQdOKluZkirVH78S9zjD7X5JVhf8D1Fn+ANmqOllfs5qAW0SDt
         u3My96UGHb3eEz7R/BbB0/5uWtMU0pePXIF/TGiqe3SsD0os3cwDbAqmHT/N0e1ABSBl
         X3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379643; x=1788984443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=fsknaLIMw9mVTSsEbnqioQpgCIcvSiEAoncI7udmzwa8RXNZBCcc/Khjpxk14MWWNf
         yF0fku+yw4reBuMF6VK7K4Cg3W2tACGvE05YWT/t3V9T2AlQpxTXQwUAz0DD5dlX/Oew
         6wOaLTs15t+Z/w3s4UT/TORUhHR9+5TcirSKb2jiX5aeyV3qMFY1mi8i02WdQKf4Qr9H
         6KVZlQbMYQx5X5BecldsHO14FW3mjRrSpdxxkR7CMHSD+JXRQISYNAJjlwHqfTQ4Cyrd
         WJ9ZOaVCdSnYyJvs50TZ45t174w8lSsRp7bQXkxzhAE3+odLG44Svz3tsHmqtPZuyGuY
         KUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkgjwA/93L1zw5qfjjuqgAVlZnbGYXyVCInSorUFaXcZYNB9ARXf6lHYratMkDW/jrQT+NHJowbbxUQnw=@vger.kernel.org
X-Gm-Message-State: AFuF++mjZfHphRCegf4+GHZrBG0WAn5RKe7w03U2j0ReBovgqVzfnwMf
	EPdcxbZ+a86qbxR7zDRtP+GUQwJG25RfzG+NJCA/ugdQFHr1iLnYBi2EPM4foFoXf9TcjOwNDgm
	elBu/EmFDampDGF6J+keL4mjdGm9UWGDp/dIUpi51W/HU3yfEuOGulLUFWxWfm4TMzIY=
X-Gm-Gg: AYBFou1Jvm7v4M+eQoEP/GdxX5IMjvKQ514qunlCNWBNNvtflpwtcn3swu1SJdUuqGv
	nayxUQAY/3tfr8XysuKbE1vOaCosu8epPFxfWPADDE1RrK2TUV+5Mxi9KNrfSLSi5SmfiIWyOmm
	MoMrrMGIHfgqNWrhLNmN73ORm82NQgIVcc0Z3PbIdq1jCxQDx47tSyTMQer5ECq7dczZOQfb0z7
	aH6/4/6Za2BLwOatH/u2BQljIf9jFCfUUv17jgH7SOtoM1xCNACuw67hKojSHIn8S+G/eZgYOJ1
	4d8lq3QS8lC2extmdmwlYYuyrzBdsG7CaYSOvW7kmaxLqwd1nQE0fphmz/siKmcok9izcZeWVbY
	ovoecouaYSh5J+bGW11We4lFMmUw=
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604339a91.4.1788379643383;
        Wed, 02 Sep 2026 13:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604229a91.4.1788379642783;
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:57 +0530
Message-ID: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0mq0PRTsJDDv56z96GG0iHJ64sE3qJfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX7bJsSAB5yFla
 G00XE4GEzPn6yMxDPlTldCFhxsiC9DYO0aZ4Nq75CqTwPr+SgrSCB4O7Hgmi36ULWba7SYb4AjN
 De/JO5tXSIpPBDUtv7WO4LcH+lih+zMks8Okdtbb58uxwdTzFuJimkF1oKlSwipJyEhD9Zin0SJ
 zGU8Teps4Imuk3SIvfBMWKImU025XP9Y/Lc9QUydaEC/T0HApbjX+9BQdW1+FjnhMoYTNx9Ai03
 vsODCDX4lOnJE04nTFFgnIqTO4zkFgrbTr7gkoOxof2E5lpU/9CvHvnPPq0EsuPLzGJwzMFFD43
 QZOI9QXPCdD5xB4eOcAqkI8ZFFew7br42rxvWTYJ9haYzjGyYJgXts03UTGjM5PDkNfGfWdcT0o
 or70UzlHp5cA8dt1QsiJPfJZAFM3+KL028QnVfFgaPQ8Q6iSKuBY55ZNdWtpISq070/WTzLj0SV
 6qF/5+atD/9e2nqtYQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX/KJgRoaP52JN
 RfZfGDLsSy8a8crCW9FSgvyEwfstK4SCAm7A5A3gjrwrnCHg0PDjug2TudcuMg5vX/F1Z8fNc2H
 4dm7QjmnfG+H0t0a0XmXQH2j4jSMCkc=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9881fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5ojLyFQZJBwMi_iZTBgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0mq0PRTsJDDv56z96GG0iHJ64sE3qJfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Several media drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. Drivers that fail to release on every error path between the two
calls leak the reserved memory region until the driver is unloaded.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
media drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (6):
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()

 .../media/platform/arm/mali-c55/mali-c55-core.c  | 12 +++---------
 drivers/media/platform/aspeed/aspeed-video.c     | 12 ++++--------
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  3 +--
 drivers/media/platform/nuvoton/npcm-video.c      |  9 ++-------
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   |  9 ++-------
 6 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.55.0

