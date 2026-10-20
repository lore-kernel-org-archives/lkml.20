Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506144;
	b=Uuo6ywhzIdeH52VcESoLU/a+ARSyBefyma+9DX2TAsB0UedZI5CoNjdKU2oV4c7Sa3Oc
	 UnuDbtx12B03u8wS+AgxxU4Tj92BJ6YfyuoRman2xk7lvot3QxF09C6OO42KEtToWrhCh
	 CTEcwGsLME/aDgvZxbpG/mDpaBDIEK2Lm8QSD4yC2s0tFcvQnSq/gQCiq1+5zuaJnZR44
	 KvLsDMH+SxcgoeLI3m9AoJKBpHjc4+8hJfBb/lbF0lPBXeG9Rowgsr80UGZfcqaUFYMJn
	 tDemVLSWbx7WFNsAA2Q+ObyV5y7cAMndSNHJeljeFuGkHDffP9mGTuZ1FQq2vYiFZ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OhKbLmH/U5h+DRXoocMXRS3RpkfDcegtUNpnfl07C+c=;
	b=O4PIAelO2LdN5695QoXCdmxjWhLHmFsEhvuKx7t07SXLZenCZ/FQLmRBZM4h//ehGMfH
	 +fK0tefExHBecQNtPCB+igDFR/93ibPhqcpWgkXUWoi83F8yeu15HT+kwNslwxlIsyN5y
	 CjLyx+AD3aL0kmTcNhoZIJstZB7PVGWrqmtx1JPo6Dym3c/evuLXgfhOlaXGg85GsWlT8
	 LJxTvnO6elRfWXrx0dT0RQI446YbWKA/EC0aRlyAZgd/y6jTnhyMJM+yxG+VrFIXHNT4+
	 mzmpWPqx5ZCJ29wGeXqH2YKJy5soxZmgKqO/p6+xbkfOKRqsZHotl3cXQv2/cEAUVNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k9/ujuDA";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBsXZHFn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E7606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92E7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9/ujuDA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBsXZHFn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KEFw7o1876365
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OhKbLmH/U5h+DRXoocMXRS
	3RpkfDcegtUNpnfl07C+c=; b=k9/ujuDAy9xB7YYT8IPwOZDExcU2OVYrbR850V
	0uC0mFvZvwJsaEU8IkhYV6jjqt16CCXbf2+k+qbLaTZde1RQMlreaK2AxBnYkTrW
	LkAV+KpMqssR6SIb/9dBWuhc1FG1Wy3IkGIEaAQCQgikvyn2+jxNahA+1kS3f/TO
	ByFrnK/yKHBcUesKBJrzYO/3Xer1ljAmlC7ABJUMEjSMYH2PFsQxvveCa6b8PkzQ
	33YA+VSOEVmMjvVnFIZIn8JrRa6ozfSp8/dASkVgWNi/Szgzo1PyDtlRQiEvWRju
	6BlwKwz1yrTriVLGGfjBhGRB0yQgvz0arQgEBxtZftDN5e+Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2vp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:22:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c02e1df088so641650137.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506142; x=1793110942; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OhKbLmH/U5h+DRXoocMXRS3RpkfDcegtUNpnfl07C+c=;
        b=XBsXZHFnmCC2s6Hmm/35Ms54ewpocZW/2zBSCYnYDyArXf/GkU522+UCzjF9U6YEdL
         ZVlnnGj6epP0EM1jKkii3MhXabq03c0gGHL2SoeOK4HTJzGSmLSJWNoBM3jK63jK+iJV
         OgrtudWEauFPzsV3gD2uhMljj5wkljhZHI0OLwUE4mNqedDmAom6U4SiEqmYi2LffkcC
         GC+7cFKwyeNxGXtv88DqmmdXyLMj9q7ExJi4xJodd7SzW7HloGWGrxi1oH+7rBLcQt2N
         H+azHaiZ8ZJnz4OrZb0MroytCnwhRKnkgkT1ostfAiW65tzgG1Eik4YVW5I24JPiY0Me
         D1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506142; x=1793110942;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OhKbLmH/U5h+DRXoocMXRS3RpkfDcegtUNpnfl07C+c=;
        b=SLkXxRYD6uVoQS0zxKmHbP2CY+X4deLdPh2cafVu+Ovnn5f5Og32niqRlKKNQ/uhzo
         gL4I7xQioDpbHLQnkaxk3c8eHSlZ9iFVEIh0yyHoJFMMYJL57jjKDmme9eEtk2tq5fxX
         MPqRUlGsekt+C3ZHS7GI/5NYMsuRARUU7Sqj4YLCevil0pd2fLAfac5XhSmm/QfCrr6x
         B7AZZnuj0x2LFP4yFdWvraUtLB27FN3AXFJ+Ee8YJUHzSoMma2Mpbu14LuejZVVNU7qy
         hrJeQjyOPb4qyfCHLPffhAJpdtUxLE1RblEWTECOb9KQUSWF42nAMUj+ZmVicwBEm8xw
         yEpw==
X-Forwarded-Encrypted: i=1; AKwUvBwbWKH8IxvYRd7ovXRCAxoQdnHmju3VDg753s/V/mO1bbea3nNf+0RroxU2XhlMQIZrOyX1RqnhUK2y37Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLV30tlYQlB1Wt7h2OT7F+YzS2NUu3AQKYAv7vmd98HE6VKNAZ
	eSn5idwp+KDV2dmaPnXRdHdlzCZUCyp1Plhy5EW5Z8qKDLnLEf+8RlJy1eSGI0n2MsVRpssBQww
	2XlMSUx4Psd9nXK6LRxgVWXmhNcRnPSNbbpcRlZdH0R5raqRvW3pGIv6nNUSZmRIzC/o=
X-Gm-Gg: AYBFou0eRr1qe4UaTclWCbAy9bzRGgY/az+2eCXohM0DQlAjcFAVPjZG9rSlZESIcbh
	fEjRk6Ly0LHBMPq6vxPiij+dLfel1lCnYQm32CYUs0JhEiJsa5BiuKTQnZLv8anxjC0c2PGKSNj
	CdpfVldoZG63Y4fSHERKpHeVmN2rpQ+hZIAflVgu7XXinOv8g1sAoQ3QGB3PuQP1F7hPxiXHcxo
	m/oPewMQhkvzhovfvToqXyiRl5qn82pRmg0zh2/ueAR2wzYoCOUrZeM3kCttsAEyVPvjSALtnJA
	G9SKPvCnuw+n5/znPn77otTK/ZWBT3cEQ+ZRuPMx8NlhhSqEJ5LtiRSUf3ao/gMLVO4IxDamf9s
	e/8bLZPs/27ZavaswuGzYeaEMcdUBlFovpEgi49jR2qITFmGLHH6vXb/ysLBQRWidRX2Ro8i9iB
	tNRa+4R0kqE1xz7MwcQGSHegWsNwSIUizJTWhXvdgpqriYV7w4fkc=
X-Received: by 2002:a05:6102:161e:b0:7c8:18a2:f769 with SMTP id ada2fe7eead31-7cc364a10eamr2449275137.0.1792506141808;
        Tue, 20 Oct 2026 07:22:21 -0700 (PDT)
X-Received: by 2002:a05:6102:161e:b0:7c8:18a2:f769 with SMTP id ada2fe7eead31-7cc364a10eamr2449251137.0.1792506141142;
        Tue, 20 Oct 2026 07:22:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c9e9c3sm69275725e9.3.2026.10.20.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:22:18 +0200
Subject: [PATCH] cpuidle: Fix UAF of removed CPU PM domains
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-cpuidl-psci-fix-v1-1-d8ab9ac3b56d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABl512oC/x2MQQqAIBAAvyJ7bkE9CPaV6BDuWgthohSB+Pek4
 wzMNKhchCvMqkHhR6pcaYCZFIRjSzuj0GCw2jqjrcaQb6ETcw2CUV70JpINnowjB6PKhYf+j8v
 a+wfaV39UYQAAAA==
X-Change-ID: 20261020-cpuidl-psci-fix-91fd2c9d16d6
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ORx33Q-hSapVYkgbcGah-iGpG5TKV2ai
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXzfz1PMj73ero
 PRR7D9rGMRkYoZQFGhZ1cNnVq5/oxWKnMUANrf4brXfhj3UNQbTE0PBpl6ePbK2Xzp725aLl6MZ
 kjEYLNQ+cTlCPzSScgxerOcNpwlcFKg=
X-Proofpoint-ORIG-GUID: ORx33Q-hSapVYkgbcGah-iGpG5TKV2ai
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7791e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=D_0iQ9w6F8GnD4LBNHQA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXyTwzlCTuyy/p
 G+GYKclYUHzSSFQLJ5WT73n5AdrHfcEDQvKkwYeszjqJD+7ZbOyCSPA5pWO52KscwgD3THpW4xt
 LYoX1ztj5r5GuCaGUSRUqXi3YKYNhvaNrMoqIj48qPv5X172FCRv3TYN390f11LIyaf8hvek5CJ
 xdN5hiGq19+806RYkKALUUhEOfUwa4sRndOyV66LborOEA+9xtmpGrra8UGicncWsCs2pq5zNaY
 GWg/4mFwthDncegS8Lm9arblDdCqzh7OAxZm/gJFFHpWLNP2EJgELCQ3xAVt1gPCvnmzB9eyKwi
 OGuKFQl+jkFbKyYbrUpeM8EQoMC+1l8EvRv955l1and1jEcfBF9bZv2jKBNsDNlVXLTYCOhIFiX
 8DjxnelZP6ebRknpT+o+6/Hk1RJ0f8m3SsX8RkYyH9xvNiSsK26HiTYE4K00xBkEr8ZdRIRXNNJ
 /J+KpJUlChY3fAb+ffw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

psci_pd_remove() and sbi_pd_remove() release the generic_pm_domain as
soon as of_genpd_remove_last() hands it back. That object embeds a
struct device, and other code may still hold a reference to it at
that point.

of_genpd_add_provider_simple() publishes &genpd->dev as the owner of
the provider DT node, so fw_devlink turns every "power-domains"
phandle pointing at that node into a device link and takes a
reference on the supplier. of_genpd_del_provider() drops those links,
but devlink_dev_release() only queues the final put_device() on
device_link_wq, because tearing a link down needs an SRCU grace
period. The genpd kfree() therefore runs while that reference is
still outstanding, and the queued kobject_put() later reads the
kobject out of freed memory.

On a Arduino Uno-Q board the PSCI domain probe defers once, which runs
the cleanup path on every boot:

  CPUidle PSCI: failed to create CPU PM domains ret=-517

  BUG: KASAN: slab-use-after-free in kobject_put+0x3ec/0x484
  Read of size 1 at addr ffff0000c152603c by task kworker/0:1/11
  Workqueue: device_link_wq device_link_release_fn
  Call trace:
   kobject_put+0x3ec/0x484
   device_link_release_fn+0xa4/0x1bc
   process_one_work+0x7d8/0x1be4
  Allocated by task 1:
   dt_idle_pd_alloc+0xbc/0x4d8
   psci_cpuidle_domain_probe+0xb0/0x574
  Freed by task 1:
   kfree+0x250/0x5cc
   psci_cpuidle_domain_probe+0x2a8/0x574

Flush device_link_wq with device_link_wait_removal() before the
kfree(), so that the outstanding references are dropped while the
domain is still alive.

Fixes: 3b7b8acacf37 ("pmdomain: core: Add common ->sync_state() support for genpd providers")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 13 ++++++++++++-
 drivers/cpuidle/cpuidle-riscv-sbi.c   | 13 ++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..f68f5f0afe67e51b0b777fde30eeeead301be140 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -113,8 +113,19 @@ static void psci_pd_remove(void)
 		of_genpd_del_provider(pd_provider->node);
 
 		genpd = of_genpd_remove_last(pd_provider->node);
-		if (!IS_ERR(genpd))
+		if (!IS_ERR(genpd)) {
+			/*
+			 * The lifetime of @genpd is under our control.
+			 * However, it embeds a refcounted struct device that
+			 * may still be referenced by consumers. fw_devlink
+			 * consumers release their references asynchronously
+			 * via device_link_wq, so flush that work before
+			 * freeing the domain. Otherwise, a pending
+			 * kobject_put() may access freed memory.
+			 */
+			device_link_wait_removal();
 			kfree(genpd);
+		}
 
 		of_node_put(pd_provider->node);
 		list_del(&pd_provider->link);
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index a13e90bb43bd3f130732079e14017953e5811849..56b6515cbbed0b6f9023242d51bcd3e8b4f2ac24 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -429,8 +429,19 @@ static void sbi_pd_remove(void)
 		of_genpd_del_provider(pd_provider->node);
 
 		genpd = of_genpd_remove_last(pd_provider->node);
-		if (!IS_ERR(genpd))
+		if (!IS_ERR(genpd)) {
+			/*
+			 * The lifetime of @genpd is under our control.
+			 * However, it embeds a refcounted struct device that
+			 * may still be referenced by consumers. fw_devlink
+			 * consumers release their references asynchronously
+			 * via device_link_wq, so flush that work before
+			 * freeing the domain. Otherwise, a pending
+			 * kobject_put() may access freed memory.
+			 */
+			device_link_wait_removal();
 			kfree(genpd);
+		}
 
 		of_node_put(pd_provider->node);
 		list_del(&pd_provider->link);

---
base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
change-id: 20261020-cpuidl-psci-fix-91fd2c9d16d6

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

