Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834833;
	b=qbKLFl/QYgnHUsxc+A4YgSigmQOASd3sMwWBgv8HiT5N+H3cx92N16Fr3JNXEruDIwU8
	 jlt/MvJkaa0z/avDvRUi5ZH+tuFixMlnQY2L93qFMtUGuHZMw5rgVhQRScHc1Xdo/us3I
	 AdUxt6Rl6gCxFe+A1YI9pkDI11BT12oUdGj3Rcp6gyMMvDImXBq6yPosq+1Q8L5tez8r8
	 bwgMZMBeGnZSrlGrzUIQYX7qboMGg9enmYrtVkgdDUNmYW1Jd5ebPEWfqbw4BXYk4NCca
	 WbkpwkKyytS3nrK6T+PxQuIwVNnf8HBBLXW9JIiTe/LLWdEu8VXSbfVhjSNuzex7+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
	b=VR+oYdSFkBlgCw5FeKpXYDgxf2RdSFU1PSKv8Dw1YGodvgiVve/6x8LLWTPtmeOyjtur
	 C65wfOzjv5S/mLECQky2aTuw9enwJH9JVpwYFEQvCMJIs6WtDR3rjlpQcP6TOzIYvOrh7
	 M3Tesx8AGrZUh89NWXOs0ZMmVPCaWP8JiT02VgkRAW+5FVCkc2LOrC2PQHGHOWZbkqkzk
	 28kZmalAR4+vYDUZ7oGyaf0hE9l0ZF42ZFhlEnzEeYncm4TEx4ctfBPDvEjQmFBfjt7bz
	 MIJ+TD3TGwKcqPgFiXXwh9LbWfBtJO/1/PbxOKh9ZgnsizfvyRJ5Opj3E5mHv0D9eHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvUqOVOu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Kmasu0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E4606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvUqOVOu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Kmasu0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o47u253574
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij
	1aKFIvPc=; b=JvUqOVOu/49jZEeWR1P07NNxL71LuO9fN3xAUlAdO4W2RL42UkL
	o8wQ1XSlTR6xs3K0KJk5NahJHJ6AzgyYulK99Ga8GTt0TQagQtoFGjZUAYtdDPHh
	C0by9lvDKN+j/7nB/1Ep7Yud78Uw7Jf8q6pLmgeRb4WZAL3hSx7qgnpxMw/VK35U
	UuRKBuiXGwNjhybLhmv3Jk80Imxc9g9ff8dNpTNbKAYIt2s9dvLqtgl57kLtdU2K
	Djtwq294uhMCmjqh9bLnYjTYJtw/e6pa353KEE+EEoZUJuZ0oh49qwa4OtlRu3y8
	AvDmUPgKdaLTjnPSOnurg7i2AfJhBwYeLgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9rg8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536778a8137so34359651cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834830; x=1793439630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
        b=d1Kmasu0XvWAaC0vPtyBnUMIKMfdBwQIzRMdj/dk58X4ZJVZjgvepjF14Io+do2+LQ
         SGsPlKtZ4JtdgTSsNnb9fqbqu9sDoZz6G+MP1RO5GnR+hUCDUGEnGGy0JRVCwBZz/CxZ
         JMq65Tm1CJdZFCsQ0rhsUtT/vtrgELT742vj+ZgbTo7bO/9zCTzy/8Le/0GWev8nKYMJ
         0TFsxoTrt1sBtNgUwkxbZlKdbGKbZUhc32XwNWNkfn9bWEArocp42DTtniMblgZ73sVL
         q7HU5pmtldugGHw2Q5zafhf/+9I14JvPShRTdbpKjXfts3cfNgS0s2yDSO+8Emurf8iV
         2kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834830; x=1793439630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
        b=f8eJss6ilLEURpodZtlLuRZm0djqp/Pss0mWGB09PJrlQt193XlWek1X4JjJE+xgBI
         72Lzp2pRU9YVBhBOS0LrpXjA932P8fXY/gJjYX4g8ktFXOy9r8zST8fhWxC7AB/uqy7T
         ol2inDLkBdNYhzZUj44a9u77Sp0rd6+sl14nzpvilFlIHnHEfAchIUnQB8aq2zh5+2YE
         48LlcxuZL+v7H/CJoblqKO6KZdHBjqK1Xnt4CD2UI1DJ8wCfrLfDW2UR9SPRddKikB1r
         3X8C0AxJqnifaXyz5pWvxrq3/1CR5RBDVmL+uyLYC6nKeOzUwduy89LboOceenM9Ukxq
         ff3w==
X-Forwarded-Encrypted: i=1; AKwUvBx+NMTBR+qh/QMQNLwNF2tsS3eo6Q4EjhMBKCz5VpRISf4bn6VHmHSoWk+FpPGbJOMGnVWTlQLMw0VZxiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ8fyRe5FejqnfBQyy95GMzPOgz9zKb2Ww9J5eovmxkRpJSyfm
	bafL/cfCffRdp+BKWGlJvZ0+2mTdwCC9hmfgI7tsWUItMFbI9p2nujDw181aWsMj+milOLcwdCg
	LeIGNFMOzhcz1UbI/++8IikAFU7igqVRHnQTvqBhClkOoyoj5ZudnBjJ/ojmHHg83Spk=
X-Gm-Gg: AYBFou3M2pTjsymZS3RG78h1QD852OgSA+PSk7ZD8Y/40tONfm1MBko+kMcEVYhYFyJ
	D0qw3QbBspNk4W4p76QeGnAPRU1yX3p7r3tnntSn/F63Q3jL0H2efh93DC3SjipPNeLaF0HLfhO
	mFhf1GfbsCpJhzQZKFVXk3Sq6FgxpQwE6fNo8J7hYgNOeg+QHCTkbtgWPjwNg82/bhEL3fr4Uht
	j2GP3UxF4+qaDhf87zzp9fnlrP1Sfh9l/4vBINnJxcOHi6YEeWsqf9Oj+rfNljxzo4TZn57lJtD
	kbMdZTgqv1GNTNWH4M82/Qb4C6Nh/0FmTyr2W9ulZT2NhYczinhSWyRZYZQ2AZTKJig5Fu7EGT3
	uH7PvBsDSuh8/pN0eQEhmM52u
X-Received: by 2002:a05:622a:4e88:b0:535:a5fb:645d with SMTP id d75a77b69052e-5383b6b7b1cmr15587361cf.72.1792834830350;
        Sat, 24 Oct 2026 02:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4e88:b0:535:a5fb:645d with SMTP id d75a77b69052e-5383b6b7b1cmr15587221cf.72.1792834829901;
        Sat, 24 Oct 2026 02:40:29 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:28 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] media: qcom: camss: share VFE clock sources on SM8250
Date: Sat, 24 Oct 2026 12:40:21 +0300
Message-Id: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HjRlhSlOVg1pVSalGJRLriZHZ1atjGRG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX1/+dO3emJJI6
 xgyPu4yP16F5BgCkqlUkuNayb9z+ayOdyipK+Eo3Rv86mYT/20JYRPe0fE/76oRsRivyH6yht63
 UzA1ckA47zs6uiFWQTgZCIa3Aav1a1Tp18v5qfHu0tTWIUArzcOsuzGXrjAM6B7ttScNUBCAiNG
 ArqO7Nx0lDIay6IY5D8R2YQk+anatvxo6Iz+7kfxOAK9EYHPQ5l9ACFw/5mKJLdkAQbpHqw3hgU
 e3823gb4/xpyp+RAFF9w7Pda8rc7yjrmZd5d2eGp+JbmhDruz1zqdW+v3O8JHyEoyGRl7qoN+YF
 XslrhtfNOAdxdeSGkcTW1T4lxBQ63ri0OVQnMExerTFTawyYXXCnchagyA9ShyvZJsDedxFHn7P
 HFSS2Ra7riiA9xo4IBmwxsYOQeT28f77UvFLOmCj1abGveZmVVEanUxq0QGyr5rCn/AebhCYfbn
 qwKOrZo4UqxhaFt1DzA==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adc7d0f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=dmj4VTlxVhTCmNQHaQYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HjRlhSlOVg1pVSalGJRLriZHZ1atjGRG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfXyddEXKdGGpQZ
 YvGuv3SIx6cswe5yuL8VHHDB5zg4/W5TZ0daEqm238WBkaafjJHEDk5DSigUKSfnsjdCpfo/4k2
 H3nrU1mWJpY0DA84Qy3N0vNaTbc2fyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock source, and all four VFEs share the camera NoC AXI
source. Each VFE sets such a source to its own rate, so the last VFE to
power on wins and can lower the rate under a VFE that is still running.
The CSID also sets the VFE core clocks to their lowest level when it
powers on after the VFE, and nothing sets the camera NoC AXI rate, so
the camera NoC runs from XO and two concurrent streams stall.

Two examples on RB5 (QRB5165):

- VFE0 streams the CSID test pattern and VFE1 then starts an imx577
  stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
  at XO (19.2 MHz) and one of the two streams stalls. With the series
  the VFEs set it to 300 or 400 MHz and both streams complete.

- VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
  then starts an imx577 stream that needs 400 MHz. The two share one
  core clock source, so VFE Lite 1 lowers it to 400 MHz under the
  running VFE Lite 0. With the series the source stays at 480 MHz until
  VFE Lite 0 stops.

This series lets the VFE own its clock rates and aggregates the shared
sources within CAMSS:

- Patch 1 moves the minimum rate computation out of the VFE clock
  loops, with no functional change.
- Patch 2 clamps each VFE clock to its highest listed rate instead of
  failing, as the VFE clock rate tables need not have the same number
  of levels.
- Patch 3 stops the CSID from setting the VFE core clock rates.
- Patch 4 groups the VFE clocks by clock source, so that a shared
  source runs at the highest rate requested by the running VFEs. It is
  enabled per SoC, so far only on SM8250.
- Patch 5 lets the VFE set the AREG clock rate.
- Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The camera NoC AXI clock is also used by drivers outside CAMSS, and how
to aggregate their requests with the CAMSS one is still being discussed
on the CAMNOC interconnect series. Patch 6 does not depend on that
choice: it only aggregates the CAMSS VFEs, which share one source, and
fixes the concurrent stall today. Once the shared camera NoC clock is
represented, the VFE will request its rate through that interface
instead of setting the clock directly.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, the shared sources stay at the highest requested rate while
another VFE runs, dedicated clocks drop to XO on power off, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming, without
the concurrent capture stalls seen before the series.

Changes in v2:
- Split the minimum rate computation out of the clock loops into its
  own patch (Loic Poulain)
- Add the Fixes tag to the CSID patch (Bryan O'Donoghue)
- Split the clock grouping from the AREG clock change and add an
  example to the grouping commit message (Bryan O'Donoghue)
- Rename the per-clock entries of a clock domain from user to vote
  (Bryan O'Donoghue)

Atanas Filipov (6):
  media: qcom: camss: factor out the VFE minimum clock rate
  media: qcom: camss: clamp VFE clock rates to the highest level
  media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
  media: qcom: camss: share VFE clock sources by the highest rate
  media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
  media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE

 drivers/media/platform/qcom/camss/camss-vfe.c | 138 ++++++-----
 drivers/media/platform/qcom/camss/camss.c     | 215 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 272 insertions(+), 94 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

