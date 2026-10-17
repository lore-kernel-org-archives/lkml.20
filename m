Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE03C414F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792207017; cv=none; b=C09wdpsVk9HyNX2JoMfPSepL6AZqF1llipogO+qVKTHPrrgpe27C3IQRajr1aB9mVSZJ6jLJRkZE+XfTY6mYA5Qm+MjPZvPgoFMYPJvr23fDk+BrgS+n5SY1y/8icdb9jc253HJhKX+9ov7KWpEJPkTAUZSLzDKlTRB/UjbEIm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792207017; c=relaxed/simple;
	bh=PJj8J9KRV41mT/Zo9ZKQPf84EZKvgNSf5a6l4m5+x8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RClooLuEAY28KJoUZeQm73TgnJBL7H/RZLN0EAsZqJ+iCxg7NoIWPjMYO7KXyjmeQK18yRXiLDTkVqdZMK6Zw3qPqdReeLCCLKPPMg7BVFHdAUPVJ8RPhraVwMcS0sT6oT3KgCYFCWr93+1svs8D/Le9AGKSn0f0Gpl//bxdQRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZR7kqzO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAoOXj7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZR7kqzO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAoOXj7M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30Sdl3938359
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pOvt+GYoXg0d5rCWq6bN0D
	pUTER1DOC5PPhMFgzJ/IA=; b=RZR7kqzO4XCiJwfS1WKtKlNcfuEreM2iPBJOu6
	1wgeEkQSByLaMw8l9E0LyfgeWIiMpd1dDEVldVMU2EvfTJvQ3cejxd68vCdTD9a+
	G9MV8cei72D6KtGa0cuRVm+Sde6vYv2Y4yyD0/jhDSvek+fCos+WRFscxTlFN0mm
	TYYTQdNvYKyuLlibttqJlyZyRY7NMI5ZL45/WUNqZ9u9JZkwASTrmrPqHvQ99lr4
	IDW/h3D9Wh2pEhGWXDElXrlgnkGhHDNMhPYkNWVn2HCTn2V2eIFAGqYSBdlHSlN/
	JJ4DwUYyWaIhRlR2/8pF5WQzBi6T9bx+VoBgoG4m5XLHmmYQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnra8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:16:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso601383eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792207013; x=1792811813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pOvt+GYoXg0d5rCWq6bN0DpUTER1DOC5PPhMFgzJ/IA=;
        b=AAoOXj7MAZczCw6GtkDBvxb7vTfpRzLsHGepRjdOPTlmpzdmNIOe4g5aUfXqzdwqFQ
         JSlvy3Q4Wg40zkxRe/38HpZ4c8/YY29AxHoFWGYqmEJqIL0j+6edxSps6x6yCVxdCpBJ
         EvrGx+VsdD9VWlazvCW3Hsk0SlBKygv1laxubvqmbPOCGoGdqSA8jGXGs5X99mff1WCy
         9aUCM1WTGHZNxfMkCgDDGbgkk0w2sJcCC9KsNNcjj+EAHctc+JvOSGaF1qsom2UOMjRD
         I6fK6IBDUn3zcuzLAZajzSkUf/24bXOI7TbUX/je+dtjKzDaTiJTvVM0nVYyVZ6eLfHk
         0Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792207013; x=1792811813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOvt+GYoXg0d5rCWq6bN0DpUTER1DOC5PPhMFgzJ/IA=;
        b=PODLzz0COLn53wQ5NhJUf1mQ2/cn+8VTOE55p4RhljhXo+wgdEXvjOOCBcj6mlAIci
         3cCTZrvfVVxz5J2M84yAEnkzkAqhUq/UHNP/PJVjWtCDJNcuYJlVUlnD3jr4HYsIbIhv
         9TOHUFU5PEh02kuAnc2yILMl2MtorYEmX8k6JBJPt6qo199kbxnlx5m44SLGkOTdrN+e
         yjXX6ifLgEWtP9R0B7YJYOWpXetNPnIg1pCcPjsqbe4r6iwl7VgHkyLV+OYIYIJPAD4W
         eZowJe0mZE68eaQ9ey+KVlFKAdfT16Cwss17n5ADUFWY/2hGWYXy0rR/Zm2vopyk9EPh
         aP0A==
X-Forwarded-Encrypted: i=1; AKwUvBzDXV/oH36zTzyqJyW3OUwsqhcw7wjdDRY9yz9+rW3r4Fl4nsbjRjDQmxzgiMpw8mRH7XUZrvy4IbdAyUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPhX0TUuwRETE5K8vx+c2xL9t+dZU9uTbepnT9ckQATtFL0oAj
	sCD0hWlFeI17XwehNCsBjKFF4rhzR7ZH1HXCIXsnVTEq++dDr+KNVJKgRdgB9cW9b7GFTA9P3Sy
	ufCduyQUKA+0HTHxTxmA4O/5jD7ujtcynL2TqqtpOeWVJGcR456XWFEbJagxwigbH2cM=
X-Gm-Gg: AYBFou1/tLJBnhh73KppW+OVLokR/wOxa2ghV8dfk6wbABoL04YspiaXyXY/GwcDHb1
	sGbS4y4s3giMJ9VvSSJdhCK5uIw8OOzS8IfQEcqQJBkh1cB9P2XLIvFMAhkrZtKeWPDIoc10VA/
	7nLuNku1GI2Q+z8x9NWHL+PKhExXl0jxog4v50zAi12PQOx6+Q6GiVyj7Bq9H/wdYr17dovV47S
	wJSCUrHxPVsvRps3KMec5o2t0dPeDHF3PDf/WGduFcXjA8pwLyPSy2GEN3hBSwePn5ffvZxCqYV
	k1dW5jXgiTts5EKtnp7Bi5cmqMusmDBXX6ZjCDhG5bDwWACYraS70yJXVPVvK6s/BUTpzcnjihe
	KAvSJI+1sUQ4t46CdyRKOb5otUDhjeJZcxA==
X-Received: by 2002:a05:7301:2727:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3619f1fd67emr2511978eec.3.1792207012917;
        Fri, 16 Oct 2026 20:16:52 -0700 (PDT)
X-Received: by 2002:a05:7301:2727:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3619f1fd67emr2511936eec.3.1792207012322;
        Fri, 16 Oct 2026 20:16:52 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm10969995eec.4.2026.10.16.20.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:16:51 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/3] media: iris: Fix issues in the driver unbind path
Date: Sat, 17 Oct 2026 08:46:16 +0530
Message-Id: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDo0moC/yXMUQqDMBCE4avIPnchsbA0XkX6UM3YbpFYsiqCe
 Pem9vFjmH8nQ1YYNdVOGauaTqnAXyrqX4/0BGssptrV4p2/smY1LkscwUvqNEUe4ILcAkSCUDl
 +Mgbdzmh7/9uW7o1+/pXoOL7kLswDdgAAAA==
X-Change-ID: 20261013-iris-handle-unbind-fe09689e6696
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792207006; l=1489;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PJj8J9KRV41mT/Zo9ZKQPf84EZKvgNSf5a6l4m5+x8Q=;
 b=YcsMivIQ3/0rvCbuqxnOnol9ISj4hCVNuJITRCqsmxQfBoD7MfIFmRR/OwkcqDyCVXeQTQGDx
 aVdtx+MrY9PAsmvVMQHYI/Fg8fRYX5aPSdXf/9f/KpQXjlVv7RRlCiF
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad2e8a6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-unpW79DR_kPSW8KOtoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NjncVFxs1M17C3v1KAFWn-Dr8w7H2OVd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfXyXfiwU1TApXU
 wdmCFc81lUk4MrNW4UNkwMHx2RuNKcEXhhfLQ5zrj9ynDnU8QObquQNA9tNoTXc6mPHnr3V0K91
 CZWSxLJdAJXeH4eaJGcALEPojbdVgCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfXwPWy7a80Umv5
 Mppaht0KAhGGAkC6RO99jrx51Oj6doLaYxeICtajM7FKbRU1w0XB0MUq0O0TMAIWK7cwEtNCxoE
 ZZcFUAsimPslD50ChWi9FM1xQ+M6qm+eTyVsa6PSM53PddkViniJ/SSaEcOT4/IFXKfOyFs/trk
 L8v32oKgqDeAQ8JxBYjp5uo0+jBOoK1MXSEdFaHW9CckLK+n36nEOsCx1mi9p0Jo1NrxiyPsEXC
 e5uR+/Hy9eFIJHDr8//mNtcDVj9rw7G+eskVt7St2Vg0OgbW1xfly73pOaxugRF2za4daYJIprH
 LYrFF14fVY4fiEzfy8U4hN8DuCQUH5uviTmjauR3Mxcf6YMWePNl3N0FCh5E67/rXaaGgso+al/
 3eGr3jxbw1Z13VUS5tBkaDDmD8fUewWqY8khAoeOk68z8Zw7rZvV4AvFWksFflaipJlP5A/0bla
 vcxBkdqJDrNbsaLFOmQ==
X-Proofpoint-ORIG-GUID: NjncVFxs1M17C3v1KAFWn-Dr8w7H2OVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170012

The driver unbind can be triggered through sysfs while a client has a
video session running. The devm resources are freed when the unbind
completes. That leads to use after free for the running sessions.

The core and its device are now kept allocated until the last file
descriptor is closed. New sessions are stopped as soon as the removal
starts. The interrupt is freed before the core, so the interrupt thread
cannot run on freed memory.

The system error work was only cancelled during the removal. An
interrupt could still arrive afterwards and queue the work again. The
work is now disabled.

The runtime PM usage count was dropped twice when a resume failed. This
happens for a command written after runtime PM is disabled. The count
underflowed. The reference is no longer dropped a second time.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (3):
      media: iris: Fix runtime PM reference imbalance on failed resume
      media: iris: Disable the system error work on removal
      media: iris: Fix use-after-free on unbind with open sessions

 drivers/media/platform/qcom/iris/iris_hfi_queue.c |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c     | 58 ++++++++++++++++-------
 2 files changed, 42 insertions(+), 18 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-iris-handle-unbind-fe09689e6696

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

