Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251F448DB54
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351457; cv=none; b=H5k3rtEPCXV09BHxrQgEosLjYioDuTGHYta4ZuRDpzEO2FHCB2q7OvMlEsT+1irqBtp84SxDJ8njVKlo8/XOCGNGFkgYfvUdWAp/va30eB+gaHVFcf9jy6uR1hoEkKrUVOvAHsH3iU3ps57o78nvbVDwmLnhw3mBMbZ8UIDKaEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351457; c=relaxed/simple;
	bh=w4a6F0ekSRD35OQzV65/UQtuzosMYFzap1cwoBwsUgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeL0KUbt/A6U76bJHc0TOYJlbiD9orLEquxlYSy5O7e5mYLCdWBguREG8cJQimg8FYruYOggI4J31VJlJjak3vEvEruYmkvPAdj0sSn8d6ZTBzNYVcjnaxLVOK8ln3230Pf2e5PDuwUnia4CFHQuSSYtI82151DVEGusc1c5Puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h20kwg5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHgQsGYJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h20kwg5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHgQsGYJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IITl241510722
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3R4EKzix3+S
	TlhmbCV2t0LnWUys9Ube2NoVdrXT4KpA=; b=h20kwg5AEC/aVPNmXs3wQ7/A8Bb
	5AfEMExGljx4NIGtzSD59nJPcG0uKQjGkIl6qX+1kzt0oRbEZslV8l6tu749rphN
	uao77S3vjzdny6A+PX66MajZYfteNpmKqsPQezgPvRRKKNyTNqiWgsuvHSoMFd1E
	bg97kP8U1I+Kr61T7HPW26egEL4XjasDOf3ZorXt7mvp92Rg4LjF2/J1rICV+TNA
	lYffcONfS6ZVTxTYyOqZBYWkRPrF+Y2xji+ycIXlUdD6LP2LSJYW013rM2SE4qJh
	qF9bw4DVbc88CmZlp8bIVEyntQxVN9yzbI6QzSwoF9lX6PhCcrQDsTwl66w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys3weu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso473224785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351454; x=1792956254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R4EKzix3+STlhmbCV2t0LnWUys9Ube2NoVdrXT4KpA=;
        b=DHgQsGYJkocTP/Xtz5lKDo2XTcpAM4Vnm6qUWcwu5MhmPcoMdAplioDu7tAtFY+rSa
         41YEsUkCOwDhe77Lc0KazIH0w1xtydeu+H4gunnZe8FHL2QpcnbgsT8Fr46GOTI5LI92
         qfzZLMbdc7ZRv59nBUFC0PssUIiiYFgDPtyc3nt4P8wGUdaCCn4sUmWlL1mwm20qQHWy
         VFv8aR+hus8i8TBQjxeSLId2yqlQS/4ftwQG0913kNJosmgBNNeeh4DI7IySz8278FAA
         SDLdPLgZAqsQloBpWYmPv/GC+S7H/sD6cDTXucMHM0ypbmz3EiEZo/uHl1EuY+JlrtGd
         qmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351454; x=1792956254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3R4EKzix3+STlhmbCV2t0LnWUys9Ube2NoVdrXT4KpA=;
        b=EQ1PuWbnYnAFteKJWIxh0oOttGvxbm3b2FLAN1KuBkYrtP5nJzhMFh8aAhcsFSDoU6
         CfHXOuVR85NgiLmmyWnuDP5c8GkbshSXX1T/AND6sP/TQFOKk6MS1+FCuaC9UxIdv+OH
         WMOS8JibWZZcPVlBGD5ht9e3DpgtYbXcv+gHvvUT43Satrgw9FSF3c2VwHTjE5ynJEat
         Eo0N2zQ2qJb5l/EtrwD01ebviL2B/bLMvdKN8Za8ZTnjCwLZWQ8cyYNwQRqAm8XLo0iP
         UxVy1qLdY4cQG2Z3QLFp3/ZrbZYlb0Osp6WJBd7nqWIgqrTxXeBliNd8qrYx9sa/T6MJ
         VvkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcv9ergeodZbN7LXaualVRW9eh0P/IDYS2vHY3/xdqGDBkcaK4j9tVUSkiOoFJ7bFErcrKMhgvNKx0ul0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGvQm5DsCM+HvQPuJmp5k/CsTUNv5QxI6L1GuWndFkJWkgGqSf
	PFDSF6IYmpUms3ZqSf9ZhKg1HxmglopNlJiNm2CdCOBmGVzEKprRL+5399r/R+C6ENXBVp8Sm7W
	64eNwAGtGl4TYrQEconcA42u+FJWMSqiK2sqAwXGTarbUT+BwISUfch3p4mlseIXLQzA=
X-Gm-Gg: AYBFou2wycd3enIWa+3IbQoVGkFG9oDH07a/YoDoUN5AzkQxoEllxXgsdk6EmM0D0A5
	WX8Nqx5Up7HJE4Ntd0fxAorepeUNTMttAjQbabDMCT0GOMTliS1W4i0ykzF/v8DBT0AqIq6IhnB
	0MjZ8cTXjg8X/t7odeJWj4AZkpJnmQLR2KgaJeidwJxWFvxIDlIxqzvMa8USIALeYnXn32QbYHo
	PS1E1RKegJljlADdI8Ty6fFXtrqxOTu2lU0GtNxeegI/Rt9cltiX3j54lvlEIfh2QmyRPl/pmEZ
	MoIAR999s8lM2SXTX3tuPGpP0OMSKGsMBdE3WJgBgDsCTBNVf8YJ5+f7fEwOmMXqFrEfwoKp7OS
	ArwGOOWtjU3z8
X-Received: by 2002:a05:620a:7084:b0:93e:c12d:4eca with SMTP id af79cd13be357-93f17fc35d9mr1448070685a.42.1792351454236;
        Sun, 18 Oct 2026 12:24:14 -0700 (PDT)
X-Received: by 2002:a05:620a:7084:b0:93e:c12d:4eca with SMTP id af79cd13be357-93f17fc35d9mr1448067885a.42.1792351453748;
        Sun, 18 Oct 2026 12:24:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 2/4] ASoC: SDCA: enable pm_runtime before taking the initial reference
Date: Sun, 18 Oct 2026 20:23:57 +0100
Message-ID: <20261018192359.287987-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX0WJkltVwCQcM
 OAba0xKiaAzV5hiznTYYwWRkbEH0tbjNWltN5HLEirMQLKpM4N/0fygu998JWIyCFIY+er1lMtV
 r28KNz0aOU7y5OEmsZ7wq/1c+isSKQHFrrI4zTq2kUjbp4sChrxhiKl0uSqWb6oxOvQ0G9KL6PA
 MHOhWjQBT9aEUFKDpzdOR06m0pqzM7trYzMaUpa4gfbIwdEhVktGQzU9qkAreSTm8+rTYBYFQbj
 vvFdH/OZlLtKj5dezO4sFRCEaUzx5RG+R/91oivrowLjrNpWnzNkJOsc21gnt82SIwkD4U37ehW
 ThpmW9Yk9aWMumLxkYZ8Z+6lkTV9lu71cM2dQ7oVzb2aOOZryi/UlGId5bJuXWtJzRlBDT08Fhw
 ViQeLwxSC4b9/nxHRe0P5sGTbpXisVzOgXGKcO4k/ZOQa8+MWCSIbiWsPLLQEShdCt6lQLLsZnw
 zqsu/A/ftQ54p+bmCZQ==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad51cdf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=shiE3HVkELJXXdC6UlEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Cz24Qe147AzgbIDdIM9IryaRyeauk-FF
X-Proofpoint-GUID: Cz24Qe147AzgbIDdIM9IryaRyeauk-FF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX9AqhExpwr6jC
 PQRAIRzV/3DRTLybbSJIpL+tGjmKs267W0s7EEIvr+/YjqWFLYQJmmjYIgjiDUSnfRYR0tUrE5Z
 C5/uik8dgWJ+LnmYm8V7aCifQl2z2WY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180077

If devm_pm_runtime_enable() failed, the usage count taken earlier by
pm_runtime_get_noresume() was never dropped. Reorder so the get only
happens once enable has succeeded.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index bcc660aeb739..3361db188046 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -194,12 +194,13 @@ int sdca_class_probe(struct sdw_slave *sdw,
 	pm_runtime_set_autosuspend_delay(dev, 250);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_get_noresume(dev);
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
+	pm_runtime_get_noresume(dev);
+
 	queue_work(system_long_wq, &drv->boot_work);
 
 	return 0;
-- 
2.53.0

