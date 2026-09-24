Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7847ACF6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246844; cv=none; b=pz3T6Zyqqd4a12L6YI5k/mAinECQxuwYcoabokyQmNP5OpW+wUdGqdKx7GIX/5GcnZN8wY+Ki/7Fhohz49IxJwNsRSvGunHiKSUUCWjbb1KFKey4iGfaPBRVZ8POAd5Q7tgb5iudlMA2FU/jvvW2aZQW2adGYkvoQH74oCRppkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246844; c=relaxed/simple;
	bh=zk3nUHSZNGZVwkyBHbCfiN3EPEUTym7A+bTcJzqXCs8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J0gY2sOv4aT7ye2Shs/9a2YBO6AQ6n7o/cwA//lX6/VpHW5K/HBbHWcaVGFKTsJuMnodrTXNuDSrkltNJ52vOq4blHegsexxV+oqfKNZ4RUjB/00uqtjUi+5zU589Lc7vX2yZJnLU3EPmC8mWHnwlpp62T2zRSMRXO9jN9eFYg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9lobaG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5n1kjyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9lobaG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5n1kjyR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3Y3i538623
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1BYBocMOfeShm/OCiT4Isi
	tabOYUNDg/Bfw1ZPW2rVI=; b=J9lobaG5pKZPRamj8ztjsx8UlOLqsV0sZngUrf
	VT+NJ1dLmSzvR4mAbyirSQecWAf9ia7L+MTYRfuUQi2iZWBkE4o/a6434Z0ULPMV
	vYAom/xqNdNrEOX/osrym0goCWkeRrcKUH+SuaYI53sxhSBIIdy9BrOFIjvlp9EI
	xOp/ZAnUMJ3nyJiSnDdWlofz+e/nmsVORS/uZa9cNEh11UWVQBBSpjTcUF3oHVDa
	D8pElrNw+KgkYQdHj4vXY/DMF5pMdKRzuyW6MDHoSzMfe9Hz1i/nC0H8dnwAWSFv
	tdGFI7qA/E12UFkvbvLtE57F4p98psH5W2/izExYkKCladew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc854t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:47:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso249310985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246842; x=1790851642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1BYBocMOfeShm/OCiT4IsitabOYUNDg/Bfw1ZPW2rVI=;
        b=C5n1kjyRpUmGr6qZmQNfyOht8Jmf7P4mmU0k5OjLQP5BGnQSVY5zR7MKgh1sCoa/yu
         cY0az0GwQdI/GzxebBCx5WzmDnuPPnA5H9XIiFRRTyjUVWjy2TCGVx+iqc7CEN43XgDf
         NXui6kUuLB1zitOHm4Iouvlxgl1Lsned/BnITI2G4qBKm7c5gQ9nMgJdQiS3zUhrv45z
         T8kvg1cWBEpwYIhe4Msa2WssLZAlhTfCIgEOC0tCZ5JQCsyDxmUHEWfLdZhZ+OuHidzE
         j/FzzpUEEywdPBBTc+peRdoZ768uNIziuXEVtG1iInJCXDah/Pir4bIX2qopuT4gabwS
         GqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246842; x=1790851642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1BYBocMOfeShm/OCiT4IsitabOYUNDg/Bfw1ZPW2rVI=;
        b=rVNVrFmaldNNcZ3Y1qdizpuuG08aCeu3lK4MCkwnnP7PLvLwxIgA+ob8fYXbRCNqUX
         7m9P76AHKN2/I8WGUy8GslcizKij2Fjuiuj1YoHBKmPvHJu2gK9Z6iCjjyDfyNh1xkJW
         stOQUwG4Ya8YYv2G62WTBS1YS/jJbU/aIFEmMGfFgBvbHvEAaUHKDMgs8hVwRTa+uaCK
         rbZ+rYu1spZzQF+s4p+sLHQeJcA6dAGB7YOiCJhj0K5XnYgbMHMfAk15oW1KRQhLR/NQ
         f2J0evzxYSSqs7+i7pBdnAJc6N8E9ClhRURe3bkBr1nLMdo4G2U7XZz6jm/M6KR2EN+q
         Q0jg==
X-Forwarded-Encrypted: i=1; AKwUvBxyXatGbfTP34REErRcu8pqPbQoccSRLZlVVu1UPp/IBd5BVF8EmkPp87TiuxizpZofedNyp9CiS9W/5No=@vger.kernel.org
X-Gm-Message-State: AFuF++mcl7EhhWV0pad66grj/xf28dfGI8CtFt7WjPush7qZ6YjzYKnX
	DMKyqTFCY8OVkG3g4OXzvXcSakqCmThh8ARekOU7Wx5cry8Fwq/3/O1SuDIBSVgFIPKgFQRmn2D
	sy/A3cmwnUnh49I6y5mJ/oroWj4MVbErHP1VvBfsv2onnz+yfXkhcbTOTKRtmk3emQvg=
X-Gm-Gg: AYBFou1mIlnheyQg1pnr1O8hwmmMVz8lx9LVVsNFM5KwnqO2tSfAxqCOcO0Zqx3PqCC
	+8Yh4hOqhXul7q6yjwU5eqMlPDpY2adhuWKXIJn5UKyFSGCHv/3kufB7M506K6oskxKMMOMNQ+m
	XRZgk9AQ/SuAybV0HGfRWmLtGW1CovrGg1XsucogSV0Sel2MFMI8CUP4qWyuESsqVujIhFpwCkz
	ZzCny1Nb1Njgj8SF1kadLT0W2Piig6LJgkcIlHIfhfwjfAk3Iog/C1pcX0kL2MTmc6M8cXzzr2e
	L5JXzaBovdjgG5NTUjXjUVrLU7NjUmBOdvI8Ya607GesqAbbxIandZzlv1J/62LZnpaZ4Yif/qc
	qotvPQXDJZMki8Q==
X-Received: by 2002:a05:620a:4483:b0:93b:deb5:637c with SMTP id af79cd13be357-93c362a6f6dmr222312485a.21.1790246841487;
        Thu, 24 Sep 2026 03:47:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:93b:deb5:637c with SMTP id af79cd13be357-93c362a6f6dmr222307385a.21.1790246840803;
        Thu, 24 Sep 2026 03:47:20 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm12472980f8f.9.2026.09.24.03.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:47:19 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: Introduce hw queue priority
 offload
Date: Thu, 24 Sep 2026 12:47:00 +0200
Message-Id: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSwqDMBRFtyJv3CcmYk07ch/FQcynBkyiSSoWc
 e8NWUEnFw4Hzj0hqmBUhGd1QlC7ica7DPRWgZi5eys0MjPQht6bB2EYk7VcoN3WYDyW8Vovnkt
 sJaOS9bqfBIMcWIPS5ijxFziV0KkjwZjNbGLy4Vted1L8Pwc7QYJdSxnpei2mjg0+xnr78EV4a
 +s8MF7X9QMRsxj+1QAAAA==
X-Change-ID: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Duubn4-bZIZIAsx7iD0QTLQqeYVQ42p5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3Df4o347Zb/i
 G4vG+PBrz/XZxOz0VsqNV1o0mFFyRfCKkdrgYPetibf3cbR9X9vaeMEfGwcJOudsy0g0FiywJv7
 YmoeiX1nrhRN7xapJ8qr2ECqSYsclkvpTFid06vqg2yCv8jc1M5chxWyia7MN18us4+14lzoVUR
 jnh+86TC77f9uG9V25Dg+taiMMn0y2rnWjfJA2j3Az9JLprjUmDPTUPy/oHqG7XVJUajVRzYKrP
 rexN3dxOjCQo/659/apKkWX31i4YG9Qyuyv0VaK0rtzLLPusAWr0tLkFNQdX3NZzzAY+yuj6Yke
 dreQxgLa/zUUQGbqoFZEF3CsIrETXn0+TclJmKwWdC5Zn7a0uR2f3UTwKtcilNSEsKZ6ft+1HJ5
 iGascT9jnf/koD9SZswsluc0S9/77kqOZKAnVytcweaZyXIGDAjGNByBOizG9/VE6efdpCvpTBe
 neoxbExGPSdYIXXKNqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7X/W7teG2UnA
 G1nrQ1LcMxrFSi2ZXv6QxSClOy/n0ko5mdLk0Uig6hqFEkGLHCMBCd4roXFoaiB8LWXJ4urgIOJ
 PyyMugXZwCFzvTT/Ef/Yd4mModk+l64=
X-Proofpoint-ORIG-GUID: Duubn4-bZIZIAsx7iD0QTLQqeYVQ42p5
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4ffba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qGTJnaR_OStqIhYHjaMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Implement the offload of the tc mqprio hw queue priority in the stmmac
driver. This feature requires the mqprio to be configured in channel
mode.
Do not overwrite real_num_tx_queues configured by the qdisc in
stmmac_hw_setup().

---
Changes in v2:
- Forbid cbs queue offload if mqprio is already enabled.
- SP requires 1:1 TC to TXQ map.
- Fix the real_num_tx_queue overwrite during device open.
- Require the qdisc to be configured in channel mode to enable hw queue
  priority offload in order to not introduce any regression in the
  previous driver behaviour.
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-mqprio-prio-offload-v1-1-5328157fcb58@oss.qualcomm.com

---
Lorenzo Bianconi (2):
      net: stmmac: add tc mqprio hw queue priority offload
      net: stmmac: align real_num_tx_queues to mqprio configuration

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   7 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  28 +++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 132 ++++++++++++++++++++--
 4 files changed, 146 insertions(+), 23 deletions(-)
---
base-commit: 6516ac5e6b164bf78fb34d36b4d84d495a07c844
change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

