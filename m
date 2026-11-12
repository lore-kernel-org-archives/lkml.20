Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499447;
	b=chBXZ6xSPQ89wqjVawWxt4rlbP5tBe0ejVrp/sCkhzvBFq03LVFLw+dr8HaY4Oj4tx1i
	 R0JhXMgW59izgGqh62d0iefyRuLiLYXCYEAsSqwJGDb7ve1bbV4ny4y7kriLgGqArzLZa
	 kd9cKDz8OqFtn0BRJT8obSyXD1ihu0k/glCFHid9MetvuhkiFQjN0KAdmd6h79Bb4md1n
	 0zkquM5xRrCKJ1CKcCSTArL5R4Ypv/DK7Tj9xLpv1/SbRNzORZ/NsqzUtKJMU0rk2uU+D
	 d9WSYruLV3h1PwReEZiEHTu/yiz0aELzaJsXWy3SM6PEicht4/UheSo3e/7qC4k9nSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499447;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33S+qNYSGyc9SP1Rjy7h+vlSjkGvft8MHkiYlXGDjZI=;
	b=GxuhKCSC4w3p4/hx94OZ2qAQjPm6lsZl8CfR+1AFMX6eSecp5BFremrXY05qQZWs9Uch
	 EyxACMA9DmT3cUaRgRijzOsVdoULqx1OgVsaSMDDimfFHgX64S1uVYK79aCQRFrw3k7FV
	 Hzy/uoh+jFwqfiAVcavE6zsf6oSzKEvQ6y8D3j7l6YAngunSt+mctvUUPaUYo1dulwyvY
	 2sbUvAUmV+ly8YXUTNx8c5MN8VMy74pAHPK4CslBtK3sI+5whq36gN2lJM4maGXEDLxxa
	 EzOcdv2m91vAWPv4LbFyJ5YhGTy407OUdrmJVBR1SeCaE9XaqVkWw9yIIxvcCoP7OPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ma1yFGXx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F8KaPbg9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0094606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0094606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ma1yFGXx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F8KaPbg9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZV4v1159601
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=33S+qNYSGyc9SP1Rjy7h+vlSjkGvft8MHki
	YlXGDjZI=; b=Ma1yFGXx4I1PsAb5TX5656beIdHuj971dDQg8PRUlbgqGprvn7b
	FpJzjtSjVPBcW2KCEopp6BwquOVFu7w/XqZrgCdqZ2WvKSn0Xyhp9E3jV687n1GV
	qoN6LBs6HoIi9nTc9DmGqCNuOz03aaTthSFN7OpUlLwlI3QXsvfH3ekRjIOUIgMA
	V0rgPCxScwWj9EDKtknpFDNB6uvmnWhqvwE1/bX9Pz/dtLPKRAU+Ufn12kM8s4Sh
	46mnIJx0pywelYkHFZMBMx/g+cQRhR95r+FGOfK8ke8zeDnuyxW74z3UC5hy6EFm
	zqySUPQoGqFwm0t3BzYgeRbEE+TLXe6Iy9Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09t64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:04:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so4481e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794499444; x=1795104244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33S+qNYSGyc9SP1Rjy7h+vlSjkGvft8MHkiYlXGDjZI=;
        b=F8KaPbg9dtyHNC88gk0UPLPHL31rIJL2DoxcUINpDfSc4gh+hRDErBVXZucxs8jRrT
         Sc16gqn9c+iNe/SNBPL/sFUgU530mPUBiPrN++rZwbJ8BwWN4EPRw6x1w3/LhGnaoohP
         nd5tSeaPiRq6/gvaRkWP/ErL9igIxEl+ElZ7AkrSto9kUd087ySqanAog69c8U6DSRxG
         9heHHvb8c/FN5F93stkyKfIyJFXTZ8Pzxse//DHIGKPpdMepgHAz1WLPRQmyD81Xzg62
         lUaEkpMn/cIgRWdPgHUg2hR35U1QZ7duAkhj+HD+BduAzb6c2H6H0g19x2gTh/uYPahN
         cL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499444; x=1795104244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33S+qNYSGyc9SP1Rjy7h+vlSjkGvft8MHkiYlXGDjZI=;
        b=PpEfQjokvTP8cCM3sYbO2PB0IujoW5VGFcAWh6q4XSIhRHTMWqzE36NcJZnzr5gd9V
         g5YRnR4qbr1NdHGRhR4HBISqTg0Mf/wKPscGZCfO6PiYnrWTav6lLylLMrkmGPR+NTEQ
         c2r5lrz1VF85Klsbb5NNuB4kO1wqtXqUKr0BgFGPR2nn5A4Za1/sXRc32jgSEdhxkFdT
         LZ+EtYSwKeLlmuN8XIC7MNTIN3+3F+b/EBnOase+ZSvfzur771U+f0pwgONaocqmzHrk
         K5ba++Yujf4MilyLZx/8iiIM8y6bMH8IQkhIDXa4h41iTnvZ9QkuAwsTgb4B8mEKVZLW
         3IhA==
X-Forwarded-Encrypted: i=1; AL+hErGVBwzeDegqyuO5mB0k2rNhIjmXBBA26UXTL0rdkdVAe1mySVy4BtwEUmh3H40XAFmd1Bdnm8o9UJuAEyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NlY+8gBdb7X6LrJzbmJezBTEILbtQprNb42TgsPcIxJ/7P4Ge
	9X0/BSwK/hjftSfuOlkySdE+xXswaTG0wB5UXgJcr0eqsTQZ98M4z/BeLVzEXqIaMqW2dRFQspy
	2b1mFnJC1xYKoRzyw0fOcU9//vILMcFpn7ukctWHQ5rDc8n76tr5kDVMpccvDblMe4aE=
X-Gm-Gg: AYBFou3MLcv4IxcqTo6OdYJw0Uk4QrxckeXHUHlbMfe4cctEPCGzx4SQaY71sL23z2U
	+rjW/FHwHwo0xarRtmMhdLDBI6Njd500nT2ZMibvY/ptjTL1CzXSkV1hY5nKmNUp5KV6nA+6AEV
	ztiURxrMudV6em9t+oRWqNNtkULyUa2c7VGO+hVFx9jDRNCp7SbFRLoHDftBzELNeKa8dnCq0tg
	oiybAm9VzjXp8cUGEqCa6VaaleNUFQGyO/DL4Utd81WxJoOcA5XmTygWajR1GEUdhGX6xleeMlj
	eMF3DSOgvrBhgjJh4b8SItLhxs3s8Wuxm60yR3XCE70hJ/2d6AsY2n5MFlzBN1uFh4ExXzlSHPQ
	SfasmTMeWlnSvpYYv0oRviSG+ODEDNN2hWN0TC7lb1HerKJ/OmQb6uYrjH9obdS5OR+YfHBqzMB
	tYLaFiLe/Weoolmd8UutyJLvJwNnzxQkbXAmN5k8bDy02qtzRMQriPksocrucE4g==
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr2745025e0c.8.1794499443720;
        Thu, 12 Nov 2026 08:04:03 -0800 (PST)
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr2744998e0c.8.1794499443328;
        Thu, 12 Nov 2026 08:04:03 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm78040185e9.4.2026.11.12.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:04:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] power sequencing fixes for v7.4-rc3
Date: Thu, 12 Nov 2026 17:03:59 +0100
Message-ID: <20261112160359.52742-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-GUID: 2R4q-BXX7Ak2cx4z9aaby5J5Vb2Gg8vr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfXzpmjh6O1V6i/
 hJBmnVctDauwQpV73N+0W50wN1CCuDXSO4n3Zu9m9vYQOx6DafFpkSa6Qmgdw9oqf2wQ/nC1i0P
 ks5OoyLGr0YthWYHz40OOT8//AOjYcNCfNR/sRONaY5J15L+CgO9aFt3qDb+YAjzSGvYB6lSQ/v
 sT1lAaIjxRtWKFheEWl1zDsEWc7o/PA/EOYWew6i2tYHk4oMacURJM09La3Y+ENzxhVlSEMJdwl
 zcGaQ1pkrAdoERLOJ4zyD8qJVe92t/MA9JfsltTP9dlHjD4SZj8RR/NF/eiPQUZoDC2ft8wwsKp
 FvT/40Jp440Xi3pDcfaibk8swVH8UK1L/H2h0y5KfzqwBriM7xXNcdDLj0lGo2y777W92asg+D2
 DqlOIIq4YjgIuQIhJdhQSZ7gRry2TiKw3UKzKXVB9MQZOj8jk1+nyM3nxHZ0rGOcNoHQ0kFz2/G
 BLVhMAi86iXdwFZyd0Q==
X-Proofpoint-ORIG-GUID: 2R4q-BXX7Ak2cx4z9aaby5J5Vb2Gg8vr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfX41ZD9GL+lcIs
 k2hBD1gaBPBjhbrGpln75x7MI3H2XUN16ULlineYUOupBmuRcjpMFg90JNjlZdA8aRfM3YTLOpF
 krBqD7MW6jMFNDVEV94OM6YWr8TmirU=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5e374 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=Cb2_Q8YfTQsDjjc_npEA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120063

Linus,

Please pull the following set of power sequencing fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-fixes-for-v7.4-rc3

for you to fetch changes up to b149b12f6a52997eded725ae5deae24620dbbbff:

  power: sequencing: pcie-m2: fix serdev controller reference leak (2026-11-12 16:59:21 +0100)

----------------------------------------------------------------
power sequencing fixes for v7.4-rc3

- fix a use-after-free bug and a serdev reference leak in pwrseq-pcie-m2
- increase WCN7850 power-up delay in pwrseq-qcom-wcn
- make the API contract for pwrseq descriptor serialization clearer

----------------------------------------------------------------
Bartosz Golaszewski (4):
      power: sequencing: core: add a note on descriptor serialization
      power: sequencing: pcie-m2: fix use-after-free in pwrseq_pcie_m2_vregs_enable()
      power: sequencing: pcie-m2: use devm_mutex_init()
      power: sequencing: pcie-m2: fix serdev controller reference leak

Shuai Zhang (1):
      power: sequencing: qcom-wcn: increase WCN7850 power-up delay

 drivers/power/sequencing/core.c            |  5 +++
 drivers/power/sequencing/pwrseq-pcie-m2.c  | 63 +++++++++++++-----------------
 drivers/power/sequencing/pwrseq-qcom-wcn.c |  2 +-
 3 files changed, 34 insertions(+), 36 deletions(-)
