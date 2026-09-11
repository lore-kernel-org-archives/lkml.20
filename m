Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674644F566
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114895; cv=none; b=tH7/Uy8Sj0QWVGxSKTTUFC8lBMa2J2Ty++5rW9LuW8CqbPsMBovFM5GgqKxrU0UBC+Yvj0dQTT8WNYq9yJfECdY0VyD0mbZvxteukD/8qxAk5vS1K1xA8W50Hkh8fQPmQqFKM2SCSkK3I1mOyaqziJ75U5gtu6RUJ4bU1E4yM5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114895; c=relaxed/simple;
	bh=/uI/IonCsG0gCA+TuNsimYDR40/idqbcuTaTESIrhQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ukk1FWNcmlVqg+pzOK3H5PlY0ARzouov/Egv/UyZrhw/YisTczxIa7syN0YrjZWlrakem4B8dr9q37OXRO1jX+XEII8l5VRz0gEvoRIFruQTmdzmpKDUqxOVX6ruFB21/QNl04uD0e3wzJnK5sNRqAwDNDhAvGeyMyEt06c9GH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtQuau69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmjxr9qr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtQuau69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmjxr9qr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l1023017528
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA
	3vnSIH8c=; b=DtQuau69yqAaTJOLGxdFF/nFB9/w+p6GFDhZz97tD7j3eq/IZgy
	OdEKQK2X0y8/eu6AJB91O40cXxLbud5+nhbJfagMzRbrdqK8gOJqY/RnJKxtkjvW
	9+UFI9xjvSiOYuv7FEwy1muLVHJ0XTbvgEJ5sjf4/5bFMVQrYUCXBcxWsEqOgt1p
	Exq3/zKZzfl7z0QvRktEjDcVM26bs5IZQpFpBon0sGhQ9Wfm8XK+/ueb9fryf+iA
	IYj3c7urwV0pVCG0NmTevH1Q1S9y8ZKxiJ+LMwutlcEx75vi8fjQJQMe/xrDOr73
	Cu4X6rRHiRdcCW95AtdK878K0Ywq5rUBOgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx474s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so92670585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114892; x=1789719692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=gmjxr9qr0T49W3uBMDuaHpwSQUz/7Rhn1icsbhtZAjy1FQ8JJxs8EvBeCClMWoXQ2A
         6fR7IViRmDRmjBmZWQflgpMxZ/73milZYkUwwSE/XtbHApuzjDX503M7xUbniG2skrD7
         nmAPL/Pvu5rQmtLnAom8rMJ7lvw6Stw6kbBZNbLoRfLB37Q2+CwFGgYuTZ+vxS8TRNSs
         uGGBkN1obX2z5LCjLFTcfa+e4ICZDGmEK44eHdOO9UflcLYbU8OTRDsuiukU/qkNisgc
         u56uSqphj/lgMR93AL0nYfsBg3VMDlwnC8x7k/JxEpERS8GQI+P902qLz18S3FC6bU0v
         Goow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114892; x=1789719692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=U1duJd8xa0tHHqovpcXbdHbqulXiVGtRxgryXrzaKaYOXxu2sJtKF9uKXgjKATURrG
         Q7DSm9G2JcqWIe4Qmeq9ZnDOgTs+6rDNenxpt23vfdcO3GG7CjUjXO45Pm6oIrK8yVB4
         GoIHCUsqoHG+zQ7Mkbfk0A4db5YHHxd1FS/SSLDn4wNVDrgt4GJy6RH0ry0WrKjGvQxm
         Ev/spNHAg9jECuNPU+cHL6Km/sg4KAvvcDy1aEycMk2flb6KrC8V/hahtAvHpLjmPuf1
         uJoDGtZE8lL9jQODR15zGhFTijO3yH1w1ekJprsNR80OD47bV1YuNoMLG6HZvxcWLakh
         psQw==
X-Forwarded-Encrypted: i=1; AKwUvBwInVFX1L08d32awN+x+czwxdZCyKXU0Wxz38YXgqXQKBuq914uQAPK2P9RIZsZ9RjD/QzOPtSqJja3PXY=@vger.kernel.org
X-Gm-Message-State: AFuF++n1Di9F1YKJhrQKrYng/DH7wwcU42hzYtW+YD7idJfsc3wjD1X7
	WJoog0yygQS0ApTzV0ZuBwuL2Qgy99r9m6lfYtFqbuG8sk43prgDApHzJh1UfXxZwvmeRP1bIiC
	6pSADqBRPKC02Us2UnaQrvPGVSqkSbPAd+PNSHxVGe3gGz/THrNNTfVhgZ0sfklkJi/E=
X-Gm-Gg: AYBFou3gqbyLWAHwNLNW0nw4z+QTcwrQeyfu1n7R6dMmGmm7NBSYf8QDiqndXRO57Dd
	LILcIRWIgB8BTegRx+bnS92NwFxlZveeVt+tBFhvtX1XNQD12wSHVLiaBCHCh2Nqft3h/a1PUqV
	8dE74IkX3LTXUnBqWefgGZOsRKGIerqdeHWIM3joPb9yPwDqMB7Cj0JXHEqOLsK4bDfVicZKNLm
	93N7sZ9IbV5cbXuCwEfv/X93wgpUTzx7X6BKUawQzFR/Nop6kvOAwxEQ8NnCVe2g2rkMXfGEvUp
	dG1L1nPGM/ICI4wyd+iVdX9M3iOsxzVApnIpA4qtWl8VaGbEK4q2Rx8WADu+1OZySduyGhikf24
	DaOVNPUVHqCcGfg==
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387706985a.11.1789114891881;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387705185a.11.1789114891489;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] soundwire: qcom: add multi-master support
Date: Fri, 11 Sep 2026 09:21:08 +0100
Message-ID: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX1xZFBPJuxFtC
 dB+YoLpSvaY7DyMAjjUqFpIHpDKN0gjjQpbsfbXWpK8rPdemv+Ej+vG2UEBqnBRRTMwfYR29RM5
 BQqo/m6xe05SKuw5WAefFZyDzws4mHuHU2hu7pP9X0U36oyU7W9mUa1tl6p5tJCbWo7GQngY3g5
 bbzHdKvagOnzqjlXccDu64rzCzdsnIJgFcAc8f1Bi7ZEL6xZ8JmVNglpagVYUU+SbItX0jGTkjv
 0Ni64k2lLVZybYYrH4fFlI3aPLMzHBTiS57BmVulx1W1wZH4E3cUSHq2OjIx3g36W0UjMJ3WN7b
 0bR/ydxewCKyGwFEbvgfeh96werNuU2gbugRPRB+aAlXtw78RRXqkWEbuFqN3QhzWk3QG+ugd+3
 EOJu/+CZRfZ8FN4wUm0BCEii8L/PMYegX7OqqzR8oOKvFNdT51P/R3oRvx06PwQ9CuOrGjHuIyR
 l/7mQyaf9xLCQEO7xJA==
X-Proofpoint-ORIG-GUID: EXD5ijFiJemPhxQoTIhrHVlwIAGNECyV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX3d1RxSBiKoyz
 HyaZe04+mCF0xSpssOMSgZab57wLOl/JPp4wHZm6XwSTKfstMsPgr+gUIzn18b2vttguJ56zkD/
 fTvfBKiS/WoMjz0d225vGSKGV+OYGs4=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3ba0c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ra76rZe8w0pY-zNsRq0A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: EXD5ijFiJemPhxQoTIhrHVlwIAGNECyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110116

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

This series adds multi-master support.

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 ++++++++-
 drivers/soundwire/qcom.c                      | 218 ++++++++++++++++--
 2 files changed, 303 insertions(+), 24 deletions(-)

-- 
2.53.0

