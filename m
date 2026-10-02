Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F363298CAF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951091; cv=none; b=rb3ZLyoQRv42+cKi8LqDZGWiPPUD1fz1miIvvUg9tAHn4rsOgoa4K4c6GVYjA+grP+KXpZ7+o5rJOEa428t9N30AoEsMR/Ylh+rVUOsVCxU3uBXmHi+iIqzWwSMk2w7VU5vyTp5xCiviPkk0ET5qYsZTcz1VDd/op184GUZJOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951091; c=relaxed/simple;
	bh=g7FcE7gRQ5DvcafTEcDaKR+a2nLAMCLq+x2SfKEYHTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EWJ9b1eA1UlkH9ewv3ivT8ykzlMpobeNUowpqAbyV6SXdli1YvCHOpMjP852t8XtA69CRWOZLWCCxr+z9l1BmoTrABdDWFlg+z+ywhxgz4/jur6HIMnjC4sSsdBypmgw1gxovTt/p3GlJulsC92jkEEwKi25Z+fUnIKgu8nTNf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6XSXM45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFCz8efZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6XSXM45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFCz8efZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692D9ZiC2478299
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 14:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=j92JAvCjEE7IzGby2lySO9Ys3n40MTdxIMDeI4JZkMo=; b=e6
	XSXM45GKfzstKyQHZvb4ezVUfM6Jp8RUFRQoj5e3FFZro6bZl2vrN5OWY0mp2cze
	CBRQqWf9wWRm2IjguKrZHtOsmPocE0LxMmZUTLMeQ4XB2PK7F7mqHlXyieifDfFt
	PxrwmyTLmBwNe76YioL5ClLSU603mbOhMMeu2qPV6oRPfOnRxA/9ALnNkInNkywg
	F3enl/54ZYpEiOAd/OqM7mlu/6YmV1seqgzGwRBEcIGfes97VIC30h6SGUd2sKPB
	ZLLJt01XvR8fu1Kr5ttjJTSQe0tzvaNO4/R9oE0ZaaOA71FGf7vEe3iQ3ttZ5bgV
	tZcmufXBSKR2XVNQs3sw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256msw7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:24:49 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980b637ed69so688573241.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790951088; x=1791555888; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j92JAvCjEE7IzGby2lySO9Ys3n40MTdxIMDeI4JZkMo=;
        b=XFCz8efZpiK7vhfRc/thBxeFYBe3UZZvxuK0wjvAlDOLwYwJzjp4AE/2LvKAPSrhTV
         DZoFcNtnr6UO/yKdoch4zxzQs3ezXK9taRDJml2sjTo58vQZBcnrU+ufIWey9K4+oN40
         EOn511INmrHo7JPYeEacVmYTMWYltirRS0WYPm5+l2MYNLZa/wXuTKRZsH0hL7yNDep5
         iOWP92Wtbg6t/c50Wrl+WZlZG4urrFl1rmt3zYcYSKU7H30LJhqsUy0IEdaRxqpL9dFq
         xlmb+oytzo+wncvBrRfYdtYiEjUnyvaWRVpl40OtVdZ0zPJ0AdpExUExdb4FsyR4V8ru
         zyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951088; x=1791555888;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j92JAvCjEE7IzGby2lySO9Ys3n40MTdxIMDeI4JZkMo=;
        b=aq696NzGZKcXpjqLRMd1qJVqIi55nbtTK1KNW0rW3P6BxoQ+TxeesRdo9+UO+xK4x3
         QTj6/eo/zxBUF+E2YS9vnQ61NDpTUvnOMmouTbeRLsKgpQnR/TsyFPhLLQ4A9LXTEBFY
         1p/ryClZYGAEuRwAHeLlUmt55mW9/kMmQuWfGvXo4Udav1EUtBR0aCHplpFOLbrpcbC4
         zbo6tEDlCTFGnG6c5Dm+BsvZHZCZfn/xY77R4pu8iP/OtV/+iUi7utxuvRHTz6ajHyYq
         pqPLo7taiPChIR3eev8v4auecbyTsWhl4uvfqpBa5JxEIzYoyiK8Gg+Cm/9K6E9UwSKW
         kpOQ==
X-Gm-Message-State: AFq9FYLqhtmCeUUFTSraty8WD0Nu2qpOhlMHptTXxWMf2rC4HAwhMOae
	HDcAE7u7N8XC7f4MJnMeAovHZPbyNLsDz/2+3ieUs6Yz4MyzcZ/WpSijauvT3L4q8odOzrdHmoy
	RXyZcFhRlqjPzE7TdUhKYDbEqJgcRzxIzCgrjT8w5lZ4grrbzd11DmsK75P4uDci4QHyLBgzr6U
	+LZg==
X-Gm-Gg: AYBFou2PU08lsAO6+1L+8rCMmwg0EELfb0QIouU/AAP2xmJx/+sQlokrKWjqZf4011J
	6E73fJ6F751nyDUrqBk2W+TcGKRlAgIW2qHhSD0TC6feyqdBWDU2tHCUaGkOInsGqb1WbFwxuXF
	Rzy9Wm2hVd3No7rmtbpaQnoYnCwwN+y/MqPScbLN6+9wh26KUAPTbD9fjS3IYcYTNxnta06w54q
	u++S0TkW8K7uBiPtSdV1NgpoRh16K4HxO4ykIz2XaLExB+vR5MnFgU3Tq/3mF4EH242L6W0R6LQ
	nhH4O+x50MObTyjyyC8QXoFTuQJJu223uw3lybYkS2DTr+a9oHIFfWh3BLJWT0u2fxtJceCs7bf
	Jy4C3pddfi9U3wnbYWSB/y5Y2xVZHaNeIOdzY9BPfOans0A==
X-Received: by 2002:a05:6102:508a:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7c0f4061990mr582686137.6.1790951088444;
        Fri, 02 Oct 2026 07:24:48 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7c0f4061990mr582673137.6.1790951087574;
        Fri, 02 Oct 2026 07:24:47 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9d873682sm919852a12.10.2026.10.02.07.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:24:46 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:24:43 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fixes for v7.3
Message-ID: <20261002142443.GA778834@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1NyBTYWx0ZWRfX4HzoEZfLT2E2
 Py9CHpz1OTPwsZzg2/En+Cox3RttAWhs9GNg9FSr7w+er1BPKeL6pD11GEHMTjMVPmcV8RQinVs
 B4FTKonDIwSawB6sy5Iru1hcdfLXLP0=
X-Proofpoint-ORIG-GUID: B1PUydyiBuvj9o8jZg9mSKzn8MQs3-0m
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abfbeb1 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pat6Al7auJUlNe7RvHoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: B1PUydyiBuvj9o8jZg9mSKzn8MQs3-0m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1NyBTYWx0ZWRfX041+7TRHY+mW
 ZWU/IsTiukc1eJqoT9VtpFuLNO2cZe/aeisZLItSryPI23wUGEYCorqK2zqyzTaUYvhFK049E1a
 Yj6c/Ja771Uuj3AAhW2Ssyz3ACtbnuxKhWAt8nDuRLv6c8cqgX+4Gfsd7AiTp8rOB8cmjosjW5o
 QKwZJJQ/MlrjjYTjRGvv/pQAwPFh0M1Nw/jTld9PYE+ret9S8WL6luL7n3akeJ3wzqBuHclLCXm
 f6fVPJsJ19Z9Gom8Wc3dYhPa+Lqxl8Rlf7RenWa35KArGY4D0HzYPbRtdYp7pOyhskp9Y9KI04A
 pBa9N4qa1Cj0qNbartusbwFCGypyavhvgNIFoBLJvlMNENHQBDSf2ggKi1mYkS2kvlPweXrpQdJ
 dS5hwWVGy2fOqEbMJi9sjEaSBK0Z0sfinDsumTXMW3fhYnAY5UHMxFqf3dkJmX36fnuaGKg/1vd
 u7S3smGCZt3HM/pdXdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020057

Hello soc maintainers,

Please pull these fixes for the OP-TEE driver in the TEE subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-fixes-for-v7.3

for you to fetch changes up to 3c0d2f1f431c51a11253f28763be723ac782fd7a:

  tee: optee: ffa: support shared memory offsets on large-page kernels (2026-10-02 16:08:05 +0200)

----------------------------------------------------------------
OP-TEE fixes for v7.3

- Register the TEE devices only once fully initialized
- Support FF-A shared memory offsets on large-page kernels

----------------------------------------------------------------
Mahantesh Salimath (1):
      tee: optee: ffa: support shared memory offsets on large-page kernels

Shao-Fu Chen (1):
      optee: register TEE devices only once fully initialized

 drivers/tee/optee/ffa_abi.c   | 38 ++++++++++++++++++++++++++------------
 drivers/tee/optee/optee_msg.h |  4 ++--
 drivers/tee/optee/smc_abi.c   | 17 ++++++++---------
 3 files changed, 36 insertions(+), 23 deletions(-)
