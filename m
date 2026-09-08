Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311C24FB9D9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859651; cv=none; b=ERr5Phmfdsnlmw/b47IsHV9ex9U39X0hIcKSYRTzt8iO1Ptd5ySGHy8wtNY0feulA6f68ysKDiTtAK11/4S7iOmBKdC2Wxa/Ty+DvAq9WWNYbT98R0fdiuKzeEKQV1DhNEbwP3r7jGRiHaBmwlRdKVaI5RnKoTG728r4yvmmTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859651; c=relaxed/simple;
	bh=U3FdTMXVmnEmiGFkU9EfmQq9YQof4OL0Cc17UaTvGbc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/SoDRcjLe6cueJeI7HjK2156gu/sEu0dSm7toOlstpa059ip3eGdx8dPEBMqrC4HxUe2A9GL5L7W0xAX1uN/AQgADGEcwCR29LT1Fc1ENWRZ/nIQO2lrUNuSI+ORIbwQcIxEOZnvp/gSo6PZc74sDs1w7AWxgumasf7+DBinFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbPVAjdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+AKR7Hd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbPVAjdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+AKR7Hd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9Zw1521629
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 09:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6KSA1oq4+lIdejgiqxFJ40
	e4uWXXl4sbh2GfyQhC4Ks=; b=TbPVAjdmPvjUsQhftr8bN2S4Km0HJbfsDFG3H7
	854u+wEloPTDtt4FonjCXOWXTDYclekPM013pdO0b65CNrag0G7XEElT0tDX4dIq
	ACctwWiBMTIkBzzEW9Max6pPPVKwI7Yj1/GzcrGrtr2HjCjNqOzibNi/QW+u4u1T
	7cSbHtpz6MThtxtCQ2RmGSAyQqMD2TNhHg+X1jd3VXNcYJUptsGC8/3aKGHfoCkv
	3D3UeIYMzkY7FH+c4Cd2gAKtBIjeWYVUxjeuQTS0yhNeDB6W/R+QbAWEKA1FV78e
	xd31n4pVXZb64agPZmEL4uU2rvwuV9Mw3Ck8b4w4NTm8XbHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077k16k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:27:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso52987855ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788859648; x=1789464448; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6KSA1oq4+lIdejgiqxFJ40e4uWXXl4sbh2GfyQhC4Ks=;
        b=U+AKR7HdFcQUVixiAKc/nFfTbJLjp9AwYOzD/GjrvsesEWGGSUljX87IlLRU4NMBgr
         kwzFYopj5HPMChRueW9hNhsVA7kyTZeaKEQoJTUvGZpoWSl7QTrxn2lFYLY8gEFXQieN
         YMKu/GwXUj0Y2Qo1p4SkadLS3EYoFaFp3opvDF1imjoQNzEzK8d25EfK2ph2henzMvYb
         ffjit+l+6glDNOnlt1VIThO0CF6fVDCwHM+EBjdZgx1dbOwx9gn5PgsCe3LT3JWNUOg4
         9NibZeN9Nf4Fc3tmZpuUC6ZewpYsOVnRtB44YK1cILoloEpy9P24A4H0ZNMJY3rH1JJz
         h1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859648; x=1789464448;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6KSA1oq4+lIdejgiqxFJ40e4uWXXl4sbh2GfyQhC4Ks=;
        b=HlS9APR8DG2Oqg/3wo32o+vRU3r7RB1lazsrKeh30rvaUe4A5dlb8h46OWA4H4dadC
         qqIudQqfhTNyEHCqxIku4rPsC4+oQO7TTfegw7ibtuk2CjsXF5SJp0p47X2GEyOt5+Yd
         i8jSETmXvyB5YXOhq2bsBbHftbBjImb/0iE2uZVAXQY7ZkI81IX9vwVRdmcRbMuj1U4c
         0Qdr4lJL5VDVGr9+9t39ntOK7/+p9Xp2hyKV6b13TDGuwdkt93RsX8b/uG/EucLMz1HB
         WHxAoyx7jdUFfzsK+ZMy2tHdhBSeY3Gik51MFML7JlIrA86c02DbaGldGW98mvcHGRJ3
         kRaw==
X-Forwarded-Encrypted: i=1; AKwUvBypNXOha6ABYqNrNxr2N8j0zrkLHck1nGPn6w9V6nZGk5tsvQais/CTLou0FTbIeCHSjzPf8mLy9acascI=@vger.kernel.org
X-Gm-Message-State: AFuF++nvbtsuPhewEyxHaBCZtEx7UHh6qyxgrTgNrY5LHEfOMDZ7Qqaj
	7mtZnhh/bFypHVB+Rhw+Nvm/YiHnGVBZp+nTtKOq5iB/TVse1M5RgDt2JmnATFGVOB722P3qTBh
	bDpyPdVwVycU34pcG0X6pR0846wYM7rskOrIUynC/khADOZP09FXm1rSdP5epcqTilcg=
X-Gm-Gg: AYBFou1mEiQmMDwf4RDjzJkvjV9+0fqeV844qgEvTM28ToP6xH6LpwLVs6E9Tf1LGaS
	gOrPl1XJQTGr/NdUmSGL3tHcqNcxYV3T5OyDh4WT2dBoK1jgD5vAdOGQ7/KmXcVcUJ/nNM7JiTQ
	jzUpKwXSyW8jRVArY4eBPZ0RVONye6CkUeupkP5lC5ae2pO/7d17C22viLOuFy300apn6ExMi/n
	KeK+LDdjCazp3JDRRWlu6LLhWWZGpPm4bZ6JNntIaVGxapj4QqPHJu/lGMyETaN3/oKdSKWCGZ8
	AnBjLbrjwvrYRnh0ZewZ3YERDMfBqtp0O4XU0Y/KylgWBFISo8pfQl9DlaPDPdW7AnvUlUno0aA
	RhBbmAqXQG8e51Gue3lvxQVpTHA==
X-Received: by 2002:a17:902:f546:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2db1212aa5bmr409914325ad.0.1788859647806;
        Tue, 08 Sep 2026 02:27:27 -0700 (PDT)
X-Received: by 2002:a17:902:f546:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2db1212aa5bmr409913825ad.0.1788859647259;
        Tue, 08 Sep 2026 02:27:27 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm38281492eec.30.2026.09.08.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:27:26 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v6 0/3] bus: mhi: Add loopback driver
Date: Tue, 08 Sep 2026 14:57:21 +0530
Message-Id: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPnUn2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMD3Zwk3TTDpFRji2RLi2QLYyWgwoKi1LTMCrAh0bG1tQAigfRbVAA
 AAA==
X-Change-ID: 20260820-lb-f1be38c98c83
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859644; l=7779;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=U3FdTMXVmnEmiGFkU9EfmQq9YQof4OL0Cc17UaTvGbc=;
 b=KoLsG6+Ub7BdKsHHQhBUGrQ2l4VyVfbWyE0nMEMb+rWiyZpCQKCPWFUxRNayv2brx6BsYcVhv
 9RQ6/R55M+VDptvSQaAYxsDi5H4QBmaQHVul7lHK2c/zIJ9JEnNk1dN
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX/l1CeGMggSFD
 +FWxY65lOrnOGG8I52KvgaiHFWmUZeE+NMVRQjf7T+IZclK8KxEumuuMecDBNr/hI49zsi3mJM/
 eaBvIUK4vOm1nN1DSRQi6/aJmT2TjmEnvpvn44Ao4I/pO+sjHwj+Vg06cxqzAkAErv/3DSA0zbP
 tNXKTuPhczcAaPbWLksBt5XPNh3AmxuS+tmE/M84pf+HE/3vIlwtocqo2OPhbDqQSVSCi/oCSAh
 KxhaBsN9bPPgDRnfgjQPXw3DEg3OafLc07oqRPJw+t3/yir3navkPTIVkw/GZ7yJ8WRqqCDhYRJ
 bRoL3s7KxYCtmC9srQec+dhIDqgeKhrFQka0z3YwtzhTl0PAXyscFMbsFBl3cWWPzN03OvH25m7
 Ux9LeZfrPhh26pahLEfWY9KWk/Ezrx/L/n9l+ZRIXpCOa7QyesIgr4zLengNqj0EYUJp5Up3fZf
 Jhz1c1S7EwRXn08Bf8w==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fd500 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p0VyzIjDfMcZ-XdLZ8QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 4-797XGmpxz6oBjAFzK44gVk7sM_rFJv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX5ZL4TAQAAggJ
 JQcBdV/mWr8Fo64QzLI6qAAQIjHSCfK8L6Hzwu85bFUW8RUbtf9IqYMRsAbsTFYPjzcFvG41wvH
 hZLCHZsNCJzgMqsiLIIpe0SBJfUh9aw=
X-Proofpoint-GUID: 4-797XGmpxz6oBjAFzK44gVk7sM_rFJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080099

The MHI specification defines a LOOPBACK channel that is already
implemented by MHI-based devices (modems, WLAN) deployed in the field.
The endpoint firmware echoes back whatever the host sends on this channel.
Without a host-side driver, there is no way to exercise this channel to
validate MHI data path integrity between host and endpoint.

This series adds drivers to exercise the LOOPBACK channel from both the
host and endpoint sides. The host driver (patch 1) binds to the LOOPBACK
channel and provides a sysfs interface for configuring transfer parameters,
triggering a test, and reading the result. The sysfs interface is stable
ABI because the wire protocol is fixed by the endpoint firmware already
deployed in the field and cannot be changed.

The endpoint driver (patch 3) echoes received data back to the host using
a workqueue for asynchronous processing. Patch 2 introduces the
mhi_ep_queue_buf() API needed by the endpoint driver for raw buffer
queuing without an skb dependency.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v6:
- Add comment explaining the purpose of atomic_t tre_pending (Jeff)
- Drop <linux/mod_devicetable.h>; already covered by <linux/mhi.h> after
  recent tree cleanups (Jeff, Uwe)
- Drop the trailing comma after the NULL sentinel in
  mhi_loopback_attrs[] (Uwe)
- Use dev_err_probe() in the probe() error path (Uwe)
- Fix spacing in the mhi_device_id table entries (Uwe)
- Reword Kconfig help text so modems/WLAN read as examples of LOOPBACK
  channel implementers, not an exhaustive list (Jeff)
- Spell out Transfer Ring Element (TRE) in the max_tre_size ABI
  description, matching the neighbouring entries (Jeff)
- Clarify in the commit message that the new ABI is added under
  Documentation/ABI/testing/, not stable/, and is unrelated to the
  existing stable MHI ABI entry sharing the same MAINTAINERS line (Jeff)
- Bump KernelVersion from 7.2 to 7.4 in the ABI documentation, since
  this series missed both 7.2 and 7.3 (Jeff)
- Link to v5: https://lore.kernel.org/all/20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com/

Changes in v5:
- Rebase onto mhi-next to pick up the EP flush_async() support, which
  disables the channels and flushes the in-flight transfers before calling
  the client driver's remove()
- Drop the file header comment block duplicating the Kconfig help text (Mani)
- Rename tres_pending to tre_pending (Mani)
- Replace devm_device_add_group() with sysfs_create_group() and remove it
  explicitly in remove(); this drops the !loopback guards from all sysfs
  show/store callbacks (Mani)
- Reset the channel in the start_store() timeout path so the device releases
  the queued TREs before the buffers are freed (Mani)
- Drop the status sysfs attribute; start already blocks and returns the
  errno (Mani)
- Capitalize the error strings and print the errno (Mani)
- Drop the mutex_lock()/mutex_unlock() pair and dev_set_drvdata(NULL) from
  mhi_loopback_remove() (Mani)
- Use ret instead of rc and return 0 on the probe() success path (Mani)
- Validate num_tre against both the UL and DL rings, and check both for free
  space in start_store() before queuing any TRE
- Log the transaction status in the host ul_xfer_cb() callback
- ep: rename loopback_wq to wq, log the kmemdup()/kmalloc() failures, and
  reword the error strings (Mani)
- Link to v4: https://lore.kernel.org/r/20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com

Changes in v4:
- Fix MHI_LOOPBACK_MAX_TRE_SIZE: change SZ_64K to (SZ_64K - 1) since the TRE
  length field is 16 bits and cannot encode 65536 (sashiko)
- Move mhi_prepare_for_transfer() to probe() so ring->el_size is initialized
  before num_tre_store() calls mhi_get_free_desc_count() (sashiko)
- Add mhi_unprepare_from_transfer() in mhi_loopback_remove() (sashiko)
- Add NULL guard in all sysfs show/store callbacks against post-remove drvdata
  race with devres teardown (sashiko)
- Add KMALLOC_MAX_SIZE check before kzalloc() to prevent page allocator WARN
  on large tre_count * tre_size values (sashiko)
- Fix start_store() to use __free(kfree) locals instead of goto-based cleanup
  to comply with cleanup.h guard+goto mixing rule (sashiko)
- Change buf_left and read_offset from u32 to size_t in mhi_ep_queue() to
  avoid truncation of size_t len parameter (sashiko)
- Add zero-length guard in mhi_ep_loopback_ul_callback() before kmemdup() to
  handle 0-byte transfers returning ZERO_SIZE_PTR (sashiko)
- Add NULL guard in mhi_ep_loopback_ul_callback() against post-remove drvdata
  race (sashiko)
- Link to v3: https://lore.kernel.org/r/20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com

Changes in v3:
- Move ep driver to drivers/bus/mhi/ep/clients/loopback.c (Mani)
- Move host driver to drivers/bus/mhi/host/clients/loopback.c; keep
  module name mhi_loopback (Bjorn, Mani)
- Add ABI documentation in Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  (Bjorn, Mani)
- Rename sysfs attribute 'size' to 'tre_size'; add 'max_tre_size' attribute
- Update Kconfig title to 'MHI LOOPBACK client driver' and describe that
  the driver binds to the MHI LOOPBACK channel defined in the MHI spec
  (Mani).
- Fix memory leak in ep loopback DL transfer error path.
- Rename mhi_ep_skb_completion() to mhi_ep_buf_completion().
- Document buffer ownership semantics in mhi_ep_queue_buf() kernel-doc
- Fix use-after-free in host loopback
- Fix completion race: arm completion before queuing recv TREs
- Fix teardown race: synchronize mhi_loopback_remove() with start_store()
  via lb_mutex
- Fix u32 multiplication overflow in total_size: use size_mul()
- Replace kmalloc+memcpy with kmemdup in ep loopback UL callback
- Update mhi_ep_queue_buf() kernel-doc: note per-TRE callback behavior
  when buffer length spans multiple host DL TREs
- Move mhi_prepare_for_transfer()/mhi_unprepare_from_transfer() into
  start_store() to avoid holding the channel open when idle
- Link to v2: https://lore.kernel.org/r/20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com

Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  40 +++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 ++
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 129 +++++++++
 drivers/bus/mhi/ep/main.c                          |  29 ++-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 287 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  16 ++
 14 files changed, 535 insertions(+), 9 deletions(-)
---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260820-lb-f1be38c98c83

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

