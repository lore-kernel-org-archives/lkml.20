Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15429470EB6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856274; cv=none; b=dk/U49n3LaVHOaRXKe34QOtbLBcmnWgfLYn9j7dr7Px4i1SFWkrKR7nLMqvwG2zdKVBm6DmO15DzfehufXFNu0Fan/xNJE+OcdTB3yoyYcsVGG0LnEsek5nqV1ouscUDpXq9SxQD9ISz4zuT4Ny45r9OPwfvfLTLs3ja4PPVywA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856274; c=relaxed/simple;
	bh=w3Tm7OSjd6BtYdmn4xqgUFu2yGZW5nk0fGhOdZ9Hfc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q4SGLRRuIn3CtzEKI4RZMEt8bBy91roMSItb4tU804Qwkal3pcD68AaMyMUEGGqxqFhIqgna2i9etbInIisqkqDLkXnE4KzpTvk4e3sHmscItfChGTfasXCmh8IcWKkcPOrdOee2VOGKqhb3QJow/dC4RXE/YTirti3W1upBDsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgOMcJBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAHMyhhq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgOMcJBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAHMyhhq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886MAEr1521756
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sd8Q+d07StmL66OYNUcWRl
	yrdGIgjLRVfqZtsm6rMMs=; b=hgOMcJByVLz7w9JLC94BM9yOam9yjfqwWZ4yo+
	CJ9DtqfA1XHUkvznEmxJXTXxVCr3bvEXvmV9cZfo8YsDsU+7iOWJo3tkT4k0ZpAd
	C3nCfLLA55cw9djNl18F22ziD65eJCvW7ZZ4gzmknM06EO2aHeCiJlh5jh09/sYU
	k6yJ9LTxKCUBgmcS0KHk0pP4EuSMkEg5qXDnJrcqgrEHCRzxKx4RYukYQK57d4im
	eZppcJvgnVwCoAizo5EqzIQRE1NuXDv/RLlSGExEvrhagrhMclzh7vdP7wqrX7fd
	PfQvv91RzWY6dhIPGoYVfXt6JAx0oRBDddurbkyu15llhUeg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jsn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:31:11 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1478e3546so3571807eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856271; x=1789461071; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sd8Q+d07StmL66OYNUcWRlyrdGIgjLRVfqZtsm6rMMs=;
        b=KAHMyhhqLpXkLTwYtclUN6+IZ2PuEOrKxMycrbyQV22lkSRCuGLijWFaDVOFt7BaBa
         1PYtj4pBBD9POVzLM2b39uN0gxwPEZQOnovf+fwiw9g3EK0Mwj9omzkuskdAsbFCXVbU
         BtHoofAMvkB3b8i9gBDB01ScQkv7GQQXay45c/wBYwnSqBPQ+8ldCbf6qgQtOYBG9lOo
         nbVbRedmwUr8het7fCjCe+KD4EVzslS6PQm0Ao9baVCsOUNz086XRca5Rba02gQJMyNk
         3Hs2a/fKPkmMBJfOExCdPfqBtYTVYQGB6OsyMr2rnuC9kDiGm6oSks0nSMF+cydDuGf1
         cpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856271; x=1789461071;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sd8Q+d07StmL66OYNUcWRlyrdGIgjLRVfqZtsm6rMMs=;
        b=HrtkbYpdAmVO/rEmrmS9SmblVVcesLsCOl3COCkNNXrCDwjP2jNYi6exGhvSa5qb2S
         wvBqUIybsnoHQAFXSyFU/mU9iI1CKlZsQblTpa6U5r3bOOw2C0OJyIiPk5hxW+hQ6YDq
         3HfOS0zjIlplvyJR9EleDfYg4iUobVMfXKvWCQI8fiD9uBqefC6pfU851uyDM4fzgoxn
         NTLlcSCDNUKA14qvNpeY2VXZq6IqVczcbIVHv8sP9iuIRxfBNLJZcjxDOY6yOVgARVfj
         HbX/tclmHmCSh8LeMM2a+AtWwi5LEzUF8euk826LrhxN0PiSwMxYBB6YjJ29QTe6G5pY
         v5/g==
X-Gm-Message-State: AFuF++nj0Xli2SkOJFvy9zlPs5nWWMQNe85sqVBzKw8mjlnGLI7ArlY6
	DWFCVfKq9Kv+VuPCkL0TIivjWtTyu9LzckVJFsUGecnX06G13AyXkSshgh4A6ZdBQqW6UtDhMmQ
	+cTplrqI7ZDktEBkC/BUBL8IyLX+OF2cF5mIgTq6VNhVKQPBLzIspNgzalfcKbDUOJbA=
X-Gm-Gg: AYBFou2XFHa2DaLq7JNwgbK4FnpOwNISGvIZ7PcaaOVvjo0a9QQDy+DEgGNojebdmhl
	7KcDzQcepSUMt/LUVuXlVko4aKEr82qGA3zsYWe6d1sdqHGef0/iyu5e37oZmamJ2EX7fy72mCj
	Yb0DpIfzkJGJNeUz3KsERTd2MWQAiKRfwTTHc1gj5VIAaHwoUwbpfFc5Z939xHIL/69jP0B6osW
	uNeK3XziI2kkJkniKbZLv4XKdpkZHGbPfiA8w3on0fUa5yh8CdfCcEEBqFzVdZFeRUh3fmSvtmZ
	MOoLaUamscnykjTs5cYXRwVs24LodW3oI7i92SQKzq90kz1BT0Z3/Z0oTcutXU2QLVVPqyQ3DNh
	DgddxVUbHp9LOGZMBZrI0Hb1lSxqS2g473LDkUHHRvIz7FmHIFfEAlkJH/uayJv2Rk3x/YNpivD
	+zMXyeJWh6TBmikrI=
X-Received: by 2002:a05:6820:1623:b0:6b6:2601:63df with SMTP id 006d021491bc7-6b6fa3dd918mr16293424eaf.11.1788856270650;
        Tue, 08 Sep 2026 01:31:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1623:b0:6b6:2601:63df with SMTP id 006d021491bc7-6b6fa3dd918mr16293402eaf.11.1788856270222;
        Tue, 08 Sep 2026 01:31:10 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm34458641eec.27.2026.09.08.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:31:09 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v2 0/2] sched/cpufreq: fix schedutil's boost frequency
 handling
Date: Tue, 08 Sep 2026 14:00:27 +0530
Message-Id: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPHn2oC/yXNywrCMBCF4Vcps3YgxFKDryIucpm0IyXRTCJK6
 bsbdfnB4T8bCBUmgfOwQaEnC+fUoQ8D+MWmmZBDN2ilJ2XUiOIXCq3yii5nqRgLPRol/8Y+Dyu
 nGQ1NLuqjOdnRQg/dC0V+/U4u17+luRv5+i3Dvn8ApIhJZ4YAAAA=
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788856266; l=2472;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=w3Tm7OSjd6BtYdmn4xqgUFu2yGZW5nk0fGhOdZ9Hfc8=;
 b=tGBCDRsP0wtfdqur9nI0GMrBbRReTMEqqzZWSEV8y3A5wEF0lqrSdsIqA07dSz1q8JJEsw6UN
 aOY+0FIGvGxC2beU6qunsJAFeonkty7SXl45FNPxD4SoBM6mdEQ05mk
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX9Ez9kOl1aQ8c
 Oe2u1YdW2En4c5vFBrkD+tck75t9ezt/QIiWEKFe2wN0o8YjbwaYLh2uh0pYnuk6XCqFZ3uvTxu
 J5id+2OoT9uA58t8fSTnRS4RyEZ2Q+nxa0AYSjtfoB5R2eQlevrLvHFlksAr1GBjZGHIcTQqpVS
 igYUX3kKXButcLrzkn2ZD3tGeb0TEe8jwT/hhuGmHsgLWM4jKW1bgI9kPwCgcGmCHQ30UC3i0RH
 5sVgxOlWY09Sc43DxCL/1NjjY//DYSjPR6ITJiIbEYtDAiOkmPfm1h6uyHIAPwZMDoZehevXe/1
 IharY0DipJ0fLH3+DbNljzUsaB6Da69vOVc3xsgFUN3LrgZLe41vp2sTOj0au8DThLMzYRelJrY
 d3zlYCgiP1BwxuSiZWjDwAXTD6k1uxjX74mCSvv1lE7/FA4vKOFTRa9R9qxr6uWTOhaqMPcfKrt
 jnPZ0LYzAYlhsuQ7CFQ==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fc7cf cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=d1n3edTyWCSArfnwSPcA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: 3isPjLQyxPNbR7O9Gqu8rXrBhn2bIaga
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX17dHrdjOQgqx
 TVkaU4agjlXQPkv3/RV9HIYrrXFCxgo17U3FSqqMoQ/hh5JoY+X4DWAVWe+BKh8b+df+kT1E6ZA
 wrBSSLEryq+ajIfkAzuB/HgfsKl+e3I=
X-Proofpoint-GUID: 3isPjLQyxPNbR7O9Gqu8rXrBhn2bIaga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

Schedutil's ability to reach boost frequencies depends on two values
being correct: policy max, which caps the resolved target frequency,
and the per-CPU capacity frequency reference, which anchors the
utilization-to-frequency mapping.

This series fixes a few gaps in how these values are maintained across
boost transitions:

The per-CPU capacity frequency reference is set once at policy
creation and never updated when boost is enabled afterwards, leaving
schedutil unable to target boost frequencies even at full utilization.
Track the max available (boost inclusive) frequency before policy
comes online and use it to seed the capacity_freq_ref value, allowing
schedutil to utilize the boost frequency values when boost is enabled
later.

The generic boost callback only raises cpuinfo max, never lowers it.
Once boost is enabled, disabling it leaves cpuinfo max pinned at the
boost ceiling, keeping policy max stuck there too. Also track the max
available non-boost frequency and use the newly tracked max values to
control boost frequencies when a frequency table is available, allowing
the frequency to drop back to non boost values on boost disable. In
the absense of a frequency table, the handling will fall back to using
cpuinfo->max_freq, preserving the current behaviour.

Logs below for clear context:
Intermediate values from the time_in_state output and logs from bench
runs are truncated for brevity.

Before fix
----------

boost  policy0  policy12  policy6

0

4454400

4723200

4723200

355200 36958
4454400 650
4588800 0
4723200 0

After fix
---------

boost  policy0  policy12  policy6

0

4454400

4723200

4454400

0

355200 40147
4454400 79
4588800 0
4723200 0

355200 44834
4454400 93
4588800 25
4723200 569

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Ananthu C V (2):
      arch_topology: seed capacity_freq_ref with boost-aware max freq
      cpufreq: fix schedutil not returning to non-boost freq when boost is disabled

 drivers/base/arch_topology.c |  3 ++-
 drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
 drivers/cpufreq/freq_table.c | 11 +++++++++++
 include/linux/cpufreq.h      |  2 ++
 4 files changed, 28 insertions(+), 2 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260804-schedutil-boost-frequency-handling-8e6bf2387a4a

Best regards,
-- 
Ananthu C V <ananthu.cv@oss.qualcomm.com>

