Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F56A4848BC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591561; cv=none; b=Pn0W2gmJ+oh8WVhJY16kYLC1AbbKnY1OyCEhI93aup2yW0G7o3v2Z5gkrEk5xdxU93C5rZWHiS20z01S/Ck94odqxYIBc1uNRcwiYi6CUgXq1oe+/C0YnYQjQh9aO7YyxKemzfi5j0OPqrRjr6xlFvF72UCN5qwyVC6IRxLOc00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591561; c=relaxed/simple;
	bh=armPerPDEuCiYMBFxS8ifFGR3dsE4GIeKySBG01cE2Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GMqgPept0QdF/H0Gqyzsnn+Cqu2xJPgopVdnwZzToA+T0m2gMkxEs9AZpq1qfqFG7lYef73xzHUqVx/BFWQOf4urPtPuLFio5U3I2qtW523U3Lx5ta9JdG3lie99bae9BXGWk+dULNolR9AT+LZ0N6tNtIrdbfaW8w2p/Koh+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9RfLYUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1sBf4IL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9RfLYUv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1sBf4IL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M5Cu245906
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PVGGMV8fJ58jlO8Q9RDWAm
	kLzOI+S9ojRygO484xoKw=; b=n9RfLYUvDeM9kgaa5elRVCfZNAb+jQhAuOyXHT
	RiTtJNbf+wV8vgwRWx7TLocPODqtNI05GKsp/gPjHbBSrQ2i9d5OuAdqMakRcbFj
	iGrQjJKO2h4jA63ob9zQwQVFRQSdmKA1Bd9gCgYrEe3VYWRgRCanqpmxG+Uvs5A+
	Ftib/uyM2njihzwrq/CldpsolTBfxtIQRPEiOIjSI5b56rJZWVNR4VaVx16eVpBQ
	HC+qPGYDjCFQej9z0grB+fv1WlAYiS02oeuSIGzWAbnPtS/LRjzIMBgmkqndiHFk
	qCJ1RtPkBaBDNLWBCBPmLxNTxVYqriyFzy8UBfAb0McvIM5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10xy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4482181a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591558; x=1791196358; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PVGGMV8fJ58jlO8Q9RDWAmkLzOI+S9ojRygO484xoKw=;
        b=K1sBf4ILoVcgzFAcXodTl+8RP6StU9/3iVqvMbVpGzZFvzyyCDONtjv8/Wx/jaCEUW
         5U6noMffMW25MtofrqmTHbiyaUGbgXRKJc6qh4F1vyV29oUGwmJb8QmpfgZNDdlhMDlv
         q3bWoY6udkVm0vluZG0dWtKbYXdF8zI7OOVbURzjgJhmuC9Jt8q29fQmx/tmJZIteDSN
         UT3HnY9SZR3LC38ABHN2Q/XkVh5Dn0dNXXUvNB24PR1R0XqmcVlNAddMis8/ksZGiDqn
         IyP6beiBoGw1Q7bfaOSnhPnOY2aOu4etmsxEJFXCl9kUB8sG2Gw/ZdQl2ut+89ORv9Td
         /yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591558; x=1791196358;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PVGGMV8fJ58jlO8Q9RDWAmkLzOI+S9ojRygO484xoKw=;
        b=n33JaP56wdVlNnfdYGKs2ZLnGvSAuoUoCyja5Ut/h57kquxec/dE94SV1kTvsU1Q5N
         UMN18A6WFnM10bih2Op4tZmWMbvQMn8JU5vfTGKkEQ4gvpgXDkjZaa658sgAxzbfkAtd
         2WW3PBtqMknED/SeGvil6voU12rzFeOPPcRf65SP2FHbZPqHxYogh8B+3WqcjpCdvetW
         AP6ddrWdtkF0OVm7bjgpuG45Rdbu/pZavnhVklyTEFbzRnvsIZ7PJllEflEFiPDB/tWA
         t/OJdygl1pNs0S0Nepfs6ftKhqXC7T6j2rizLy4eNO5X0t+ukkHhsuTEFlipAov3T6Ia
         sDGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpDGf6Ej4M+oMqbOTysEAI19zUQoM4Gjp3X55WmBc/uoCfDk6crejxmyK/hAxWN7i/DMs+6jD6BtbEhqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUfniOKWy1O2Yqt7pTprkyNjnWnu8YGglH0Ma4JnRT/eYOefS+
	qHXJ+epHRO3Qy2/8vL88RvjaOPSHBljo+rkjh1srzUzgmMYzY5e197gSM4HpFwI7jMP2SP82UYW
	YO09zN2zZiOLwFNBSFcjdoxldYu+U58AiVlc3ctJSGgEIxe447AonJoVZgCcjpbrSOgY=
X-Gm-Gg: AYBFou1aSeopmHqTLjX/RDpSIhACsunVsT7A09BLrdmMfVjbuWDFMf0Km+ihODtE5Ej
	QEeVlu16X9S16YSoFB44k23GRVR0/kLt/GYzcmIlmG+HouGkujYnYSK512L3uKMyKIVUx0PPAJy
	XV4C8AMSWYtmr5+L7dQnDQdDAwjWRNg/l4vBPvihn2uyhB1ChmVIgjhN+PuJLouFpDCl+mcoL5r
	kuDfJsRRo4ZsVKfJlBXVeUvK5FEi80GtKmU3/u7Q9cdLdTHr+Vuy20Him3019SMDhRYsxDNSXYO
	iryq3llQecBRaKV3P2i54QpM6iXJtspcdUOmUIy/Dly5y24ZHlrc6j0mhi9Ce5ueKyqnNXwquYu
	9w4v6TNr/9G5tH3x2shJNJIlott0=
X-Received: by 2002:a17:90b:3d92:b0:3a0:f2bb:53b8 with SMTP id 98e67ed59e1d1-3a0f2bb5716mr3854123a91.62.1790591557839;
        Mon, 28 Sep 2026 03:32:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:3a0:f2bb:53b8 with SMTP id 98e67ed59e1d1-3a0f2bb5716mr3854110a91.62.1790591557320;
        Mon, 28 Sep 2026 03:32:37 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:37 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH 0/5] ASoC: codecs: lpass-macro: manage clocks in runtime PM
Date: Mon, 28 Sep 2026 16:02:18 +0530
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJCumoC/yXMQQ6CMBBG4auQWTtJqaLRqxgXbfmrY6SQDhASw
 t2tuPwW762kyAKlW7VSxiwqfSqoDxWFl0tPsLTFZI09m6tteOlZW85TGqXD0PFcc5TkPny8wId
 4Mg7BU8mHjCjLvr4//tbJvxHG34+27QtY7clyfAAAAA==
X-Change-ID: 20260925-xo-sd-runtimepm-v1-final-37ebcf40aecb
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX4sokTRIFWrsw
 G9Z0FKpu7A9urYXwreWXwsAZdMh2gkV/0t5a18msgoxdYuv/nEUDQ+2TW/iP1DdupcnmleY3/fs
 ADAhpFJDfQtAvBDuIHY10WGfjIW1QGtxz9I8rPH9c02RjMFIDxMRnPrgSuIITDokzwcOv6CjkN3
 dZvLfnHxOtK8YbhCsztfUQSbhi98q5qRJxlYZKX9/5cqcoJJdBh5ITmk2ezxi/0VW2LXLVhwZEY
 IwLOxCvOaHtIQ4ENgbwBsEt+QBUq6Uboh+/iWtLNyAxyPknPKJZFy+XfUKnliRApEr9KnVo6+zB
 VE6TnNJIRZE+63QIIAE/mCT9klGmD9UvHDpUsKOJw5b2pJxApyXyr3Nhde4XZUpUPClNLpR5mgy
 kBOL/jP1cwoWUxhs583vz3UPEtBUEmInxIAJ6og6ChEkgqC2Qv3DPnNuYT7IT936Xet5aWo/T3u
 2ASLJW5AIiaQ1pOzNnA==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba4247 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RY2o0Md-0pArxuxOjsoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iYrKoBypbLkn3uyJ6MT4o3b2SKkhebZF
X-Proofpoint-GUID: iYrKoBypbLkn3uyJ6MT4o3b2SKkhebZF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXwIOX8di+S017
 nm9s0RiCvHxA4pKr6oUGTDI1rPU2OvefSyqDuxm6kfk88PYKMjUN9Vk0qzyHC8a7q+3fshyMfqA
 0p+Ep0viYI4fTR44azqkB+vHL7j4I6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

The LPASS macro codec drivers currently rely on the PM clock framework
to manage their clocks. The PM clock framework is useful for the common
case where drivers only need clocks enabled while the device is active,
but its lifecycle is not a good fit for these codec clocks.

The PM clock framework separates the prepare and enable lifetimes:

 - of_pm_clk_add_clks() adds the DT clocks to the device PM clock list.
 - pm_clk_acquire() is called while adding each clock.
 - for normal clocks, pm_clk_acquire() calls clk_prepare() immediately
   and marks the clock as PCE_STATUS_PREPARED.
 - runtime resume calls pm_clk_resume(), which calls clk_enable() for
   clocks already in PCE_STATUS_PREPARED.
 - runtime suspend calls pm_clk_suspend(), which calls clk_disable() and
   returns the clock to PCE_STATUS_PREPARED.
 - clk_unprepare() is not called on normal runtime suspend; it happens
   when the PM clock entry is removed/destroyed. For a codec device this
   usually means driver remove or reboot, not the end of an audio use
   case.

PM-clk does have a different runtime suspend path for clocks that report
clk_is_enabled_when_prepared(), where suspend uses
clk_disable_unprepare(). The issue described here is for normal clocks
with separate enable/disable operations, which remain prepared across
runtime suspend.

That prepare/enable split is problematic for platforms where the audio
macro clocks are sourced from an XO-backed clock tree. Preparing a child
clock walks the parent tree. If the parent path reaches an RPM/RPMh
managed XO clock, the provider may vote for the XO resource during
prepare. Therefore a non-zero prepare count can be sufficient to keep
the XO resource voted at the provider level, even when the corresponding
enable count is zero.

In other words, after the codec runtime suspends, PM-clk has disabled the
LPASS macro clocks, but it has intentionally kept them prepared. On
XO-backed clock trees that remaining prepared state can still hold the
parent XO vote and prevent XO shutdown. This is expected behaviour from
the PM clock framework, but it does not match the power requirement for
these audio macro clocks.

For the LPASS macro drivers the required clock lifetime is simpler: the
macro register block needs these clocks only while the device is runtime
active. Move RX, TX, VA and WSA macro clock handling into the existing
runtime PM callbacks using clk_prepare_enable() on runtime resume and
clk_disable_unprepare() on runtime suspend. This makes both prepare and
enable counts follow the device runtime PM active state and releases
parent XO votes when the macro runtime suspends.

Each macro driver is converted independently so the series remains
bisectable. The final patch drops the now-unused PM_CLK dependency from
the LPASS macro Kconfig symbols.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (5):
      ASoC: codecs: lpass-rx-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-tx-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-va-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-wsa-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-macro: drop PM_CLK dependency

 sound/soc/codecs/Kconfig           |  4 --
 sound/soc/codecs/lpass-rx-macro.c  | 74 ++++++++++++++++++++++++-----------
 sound/soc/codecs/lpass-tx-macro.c  | 75 ++++++++++++++++++++++++-----------
 sound/soc/codecs/lpass-va-macro.c  | 74 ++++++++++++++++++++++-------------
 sound/soc/codecs/lpass-wsa-macro.c | 80 +++++++++++++++++++++++++-------------
 5 files changed, 203 insertions(+), 104 deletions(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260925-xo-sd-runtimepm-v1-final-37ebcf40aecb

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

