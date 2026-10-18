Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA341443F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351455; cv=none; b=FptSWp2tcfY173zSBSej8gdBIN/sRgEP+baItX8rcUl/3+EJrGWiawnr9jMfqwAiJjftAXqg4+mi0/bCkFvMAk9VvpQCyBJYLcCAAwVw6sKW9LCJkpCJAG3T7MUw26qCgOOo/sRALSBcrK2Vetf9QCMTrEAfD3jKuA1GmEu4gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351455; c=relaxed/simple;
	bh=YoqBaynnkRTpbHb388bGw0HFMwNyf6BP8DpEms8qk58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9D8T2hkvqWh39q0yssV/RORFhmE+6Jp6oYjl4TMUpsce9AV05EgVn+gJsz5EEPhdj63kSo2S1AhMeGglPCH34IlwGwn7cXQ42dRqXVNBmKOEkPAZ7MXFIlgLWSthh1ZIwaUNWwRV+qugQIT1mIse+5jvR6qNbm0hK1lREszVw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2YJYzpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5C2P9YC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2YJYzpU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5C2P9YC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IITrh21510735
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MBcFHoWt7kw6+kIJkdbihaQS653l5TPxIc5
	Bc3LSNlE=; b=Z2YJYzpU1gn6jcIItdIgYuuAQ3+pqF+YUCcf8FtUlGF6WhSpg5O
	1w/NkMuF6nNtRaI+Qd8L/05xzpN7wpLamicZuSt0jUXaUAkjCJlxnRqrh4nErL0T
	65zuYOy4eeDZvik4DSiDA4KnJ0ER5DuL0IgJH8n3irrh079WhuDA4zrAVZSdZ+NX
	eUW2CUg/tmwN6qAMpzgiuff5R9RaxLeYAemjE7b3a6DOjlpSbSd02YYOFUwMVj20
	C9IYUadmkhc1ICFALSXXUB5ND4cNhhp2eU4C9SYqZirIPtX3TsJP46QTUeE8CRn+
	ax/kuVWMb40okBdmQfy7gWi/9dzNKHH9YdQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys3wep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9197553d398so34568346d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351451; x=1792956251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBcFHoWt7kw6+kIJkdbihaQS653l5TPxIc5Bc3LSNlE=;
        b=f5C2P9YC8yTmOJv3jQ5jXsgFmUg1vdoNTZv0jh5pr4GQH0znwhrcc+jKchNTJsW/4c
         Cl2r1vewr845+BaaPxjlJFQtXj/fmZMFfaEKQKo8Erfs7BzdSi7s9se63owcCUXDUtJg
         hyAOhiszKLoSdjZIqURE/hGlT6LBHmfzMmotW7DWPQE7DGXfaw3IBTMc/M9915BL1bsP
         s8boVa8ViAPujY0T/rOUkwyNfdWe/nc4ME0QHcTkj5lUMN0OXRKqQmo4IHDuARNvmWkU
         Y5SkYfJcWxUJJMTUHVDtx+MirAR7O1/A62Iv/CqCLirVPLEj3UqYfU5IedcH8axz/qR9
         5/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351451; x=1792956251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBcFHoWt7kw6+kIJkdbihaQS653l5TPxIc5Bc3LSNlE=;
        b=lK8qIljMxCu3vQNFUwF39fERnsu5iHUKKROVP2z4cjZNZ6JbfjT8lB8zrbJrJ5nFNs
         d46F1piGl2RPaZgWpSoj6h/0PV3kiwe2Nxq4n7eD4tIkk6etZQSlXPywsJk6OKZ39iZU
         cJavYrv9AerFfMr8NyoxQtKdzBn/3HPFUJgcx+8bogAFbmNfoND9floUbAQpWYwS4wGx
         +8UaMegE9hWu0GQSmTOsviPCLLJ2Kw02eD1bUMFHLMhq+aBgkxheFkAx0Or9CyLXSFHq
         dTCF62VgdboVjxa78wKW6+ft1tdjaqCEicU9oS1//PPXvUeTtt7TEsgZKX7sns+XNuvd
         FMyA==
X-Forwarded-Encrypted: i=1; AKwUvBw1Aqmy5OKJNh1tDRWKvmlhdzmZnCPVf/T+A3DuJbW9iU7hzom8vvSUDnNjqVQrUKHAlwKoRVEcCTHPiJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBgKwNrWxQYVzC/GxbSDMYNUqackl2TpNeBTd/WHaSDssoMBdY
	CQ+aO5BRj82l8udw2y9NZQ2Hl0CEU61rCTj0HEnTJ4lwiMs2+vxWbq/BGO0BWlD/uN/kR0NQsqX
	buCM0yXbdumTTPlpxrUIVgIlW2d25GTcxV37auYDOiRMsSFx27zk+y89LKJEj1CqEdpI=
X-Gm-Gg: AYBFou2vYyET4tmLyCELJE15ATKr1BGE3V/8uK4sWmFJmETXFlHBTwWrllC0ZokdJf9
	kFCWS7r4YjaX2h85jRzFpvVB9jpRbP9/CPHk0RfPgyGUypEJ3tbCNsGMJuWHNnFto0XYO4XMa8t
	JfYZeLVg+5HG28gxh1yPJwWWzLp2nG5Hefzh+1VVvy1KKzqufyEbABYQWqcxUFBV+5WRdxRKqww
	NWWslx6HmPcoTo8IWKbmHbn6Svb91GUWe8/3IkQ0E8YDHf8uCYB2zawhomZypqLY7B9ruixkN9a
	6tvneUJhatB692liiTdZFfwiraug3Sjj9lrG9dmehC2x1djGXstp0S6sXDmqUp0tRGzb0u1dD44
	oB6tWPKW5stj/
X-Received: by 2002:a05:620a:648b:b0:93f:2643:bd3b with SMTP id af79cd13be357-93f29d7b08bmr948026985a.54.1792351451324;
        Sun, 18 Oct 2026 12:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:648b:b0:93f:2643:bd3b with SMTP id af79cd13be357-93f29d7b08bmr948024985a.54.1792351450838;
        Sun, 18 Oct 2026 12:24:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: SDCA: class-driver fixes and PDM data-port support
Date: Sun, 18 Oct 2026 20:23:55 +0100
Message-ID: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX8+wb4uIsUP8d
 FkcfKp71nFUVN5hw+o0eiihr7SYJSz64BRyhxe2xwfoo7CZHj4DkhTLFAqKzVHp0oxLnbVD4RPd
 4GVdDAd3GIJCgYydQ+mI05KBWKthmQOUCZIXfy0L6yLX3THkmrqyP+KJTyds9srtQbLz9eRdw+J
 Ogkxp1bvB9gRxxnbzzl5bE3aaFfz9Dg9KeS0a/CNaGfkGPD8TrC5f+4SYE1t4UQ53nLtBsgRjrY
 eK2JmnEW1biw/oGIyCObtZuyBp5HziXn6r+/nY4LRI/DXGAmtHAo3K/kOXBHXCFtyw3KQKaWVT8
 8M4luYdfBcmO7qVnob9rR2XfxgVPjU47ycSyuj7d/Lig0Zu0FpaHocfdgqD7LB+xL4NhF8+b2XH
 2/GaKnweVX5LsJeDqHsbyyvVi4LMWpkpEo1f/fWEVgGTWV5jEL3EI/SEIAGBpvzDaWoAB7jroNi
 k+46AjaYy2fw3Epsccw==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad51cdc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=sHKVT8uASMeexBIr0KgA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: A_mVFmA6ZSAEiJZ9GYmkiJjLncXEUGIj
X-Proofpoint-GUID: A_mVFmA6ZSAEiJZ9GYmkiJjLncXEUGIj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX2suBnCzsVARf
 3TPuxy4Uykb4CiPAlv3lFwtH/9N7h3mVB8oVFRSMU34fA80E1K120bh9gATGNnrJaga4ZB2xTUH
 dg+GC/+f32IsS2Sl8602rNLazGDB0c4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180077

Three small fixes in the SDCA class driver (propagating a read_prop
failure, correcting a pm_runtime ordering, and re-enabling the IRQ on
a failed system suspend) plus one SDCA class_function change that
clears sconfig.bps on PDM data-port terminals so the master's
compute_params() can drive the per-port wire word length.

The three fixes carry Fixes: tags and are Cc'd to stable; the PDM
clear is deliberately left without a Fixes: tag as it is a semantic
adjustment for PDM-terminal SDCA codecs rather than a regression.

The three issues were flagged during a sashiko review during WCD9378
SDCA codec driver patch review.

Srinivas Kandagatla (4):
  ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
  ASoC: SDCA: enable pm_runtime before taking the initial reference
  ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure
  ASoC: SDCA: class_function: clear sconfig.bps on PDM data-port
    terminals

 sound/soc/sdca/sdca_class.c          |  9 +++++++--
 sound/soc/sdca/sdca_class_function.c | 15 +++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.53.0

