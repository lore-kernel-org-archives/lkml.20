Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E1380FC5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329952; cv=none; b=muDfaz0anp9wq3Be9u8Pw8WKdPTGgx6ABZYB6DjaOUnXphE97vfVMvBixR+Kd1PmYfOMw07NNFqEDDPMWryZ7ZZ2+Zb0+JgnY16BD/Ml+AU463kRSLlmieKm1LbtEeOecgiudMa9mbLucrzTVx6EMw4WPcBFWiKsXqSft+RQNFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329952; c=relaxed/simple;
	bh=Bqgk2+z7ILMVa0nbqpRl5Dj1Ez63xX0fxXr0AyP2Ktc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GC+uEKuqQrktii3Kb/NRxpEwoiRqz59sSD8+zlxn2ZZCCCzBspjp8qfPbB3cTtNMrpWLAAyACIGEzKImcFxLCNcmz5dZ9xj7gDNy05XTBp8Obo8dOZlrQ5h4IpExUUo32Cpx1+4A+bcL0vHlR/5bwEN/Ze/gRrjCgQJX40hwNx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRElmh4N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPoncP8V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRElmh4N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPoncP8V"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YqWl1056150
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9gWsBbBf3GHelt7EBuBONq
	hingtOuM2ocSgy1e+E6Js=; b=fRElmh4NqKB+sF9Sm74BvmPGM+w3iqlNa0b5Hv
	HAxdL+Z0iz1ILpC/f3kiNbpRiOyXMowduRi3eR6BflT2OiAdq2VKS977eIqCAObO
	2j8fT0KQ/4fXkFabvqnls9Jx3/XsUUyELbqMv0z20JMiVUbs4KDZb58jqSU5Di8T
	Ci4iWQs8YiN9ugEGVNsk8hNzBVRv504AokFl9XpPlHpVbWpBHP2v+SPxsojPYy/b
	FPWAMW5J7O+MSkDst5mSwNgP+qRSyJRDrXOXE3clYKmUAY1m3syk+bSd4qgDMDRF
	Q6/OtxO5zfUyYvI0R1RNRFiVRJ8WBLVRjYhdQ32v1kMSW/sA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce79w8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso147273185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329949; x=1790934749; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9gWsBbBf3GHelt7EBuBONqhingtOuM2ocSgy1e+E6Js=;
        b=SPoncP8V+CKU8mt94HVX6KZ9tHKo8YF+RP6V2OgZfuNC7aznel14rG/23CKINVPIOD
         1u3q7awuehXnpXT4euIVEDA/+8AxmXJKWvX1OiShUSZoPjyUpJxa4RSh2CHG/sxtY6Ze
         T6a+8bNvjM4A6KkRuvvztewQpsLARutqzE+tRt/LNgqGyhvlY3EIq4S8BDfQwzvlcBlN
         pbMP8NrA3kGxuWoFzuYs14IlhS8lXmZbuTpkRNvYZm0ZJhoaS4/i0bArdmscc0TrRGBc
         QVz3L0kVPh8GX/giUkLXFoEopY4I5GsUjG66/on5MZLm7oQFKgsMYswIop+hxG5w2ZxJ
         3SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329949; x=1790934749;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9gWsBbBf3GHelt7EBuBONqhingtOuM2ocSgy1e+E6Js=;
        b=TcXrtt1oy5xelfye7VNVgvXQ1vDmEH/F00Seyd9ir/elPaZn+s+KtAlIW+LdbjQo2g
         OxKZqPJ0rETyknNhcFVCB/ANUf56Y/Tt8Y8XuTXl9KhyE1eRJin9rLJxEo3PP6Qmnxbq
         WrRuWF8yi5PgefwdvoSIhzqg0goNNhYra7rvSceY3hhEHGdw1zOw0EdR1lR7ppbAv8ow
         7b9yGvqtzyCZMKXK47quExdO+BKXSOExig0D83UlIlYyEoR1NKkDxDvQwesSKT9LgB0c
         vFThAg7f9YtCUDkPiw7DHLIL65gIKrVUI/zslMp3IH8bTUzxJixQCa50RB4IWfw2N0Ts
         WHrQ==
X-Gm-Message-State: AFuF++lr9m4G/k8KVMO4hxmAjoVEs8em3BBHuoKvoCglCaxoozoBwY2i
	f7qrVM9CrijI5T0GkogsNLh7kF1xEgXaW4WwnlLCD7uzVXj18bOjWL23vdsvMTA/OnoK4lq0e3H
	NEjZb0ETk9XooeKcvuhU4MGGQsNw2WX/OedJkujI0b53LAs8Bf9VQHBJCFWMhScMvnP0=
X-Gm-Gg: AYBFou2o3Wv7BwBqJ24I9hf0fGsb4M/pvaszzzvk3fCR3X1EfiBIN6PKHamtfj6FySM
	R5Ci/7eeHRi75VdHSrv9eEfk1tNWKPMl+KQtRAyY5Zi33FRmkrMhI05+ZjHHVWX0P03GQIuYBF4
	zt1X30Ote5MsJXIPHySRvs+Ba6dPfNZpQ34I9XQ1mMg/PSFIohNPIoL4Vd6iv8Lu5F07b4A2uba
	uRdctJYLrIPa1Tsh6NoqudD1EVJPT51NQdRyin07j6+8RwH4UnUAkdGYxFz/QqjimHpoNdJXST0
	hu+p6tizjKh4Zn7XzqwpSXV+kNSlCIuI8FKQo4SytnEHrlyEEqjvz1vn+lfpim9o945HejbMdT4
	vJMZ2MphRBlVTcPWkUU5BQ635Z+5n
X-Received: by 2002:a05:620a:40ce:b0:939:a9d4:7022 with SMTP id af79cd13be357-93c43b5acadmr321191585a.8.1790329948843;
        Fri, 25 Sep 2026 02:52:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40ce:b0:939:a9d4:7022 with SMTP id af79cd13be357-93c43b5acadmr321188785a.8.1790329948365;
        Fri, 25 Sep 2026 02:52:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm47282535e9.11.2026.09.25.02.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:52:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/2] nvmem: rework nvmem core and allow unbinding with
 active consumers
Date: Fri, 25 Sep 2026 11:52:15 +0200
Message-Id: <20260925-nvmem-unbind-v6-0-9e3d02cf8964@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9EtmoC/3XPwWrEIBAG4FdZPNfFmVGz9tT3KD2o0a7QmG3sS
 suSd69ZKKFpcxn4B+bjnxsrYUqhsMfDjU2hppLG3IJ+ODB/tvk18NS3zFCgFgCS5zqEgV+zS7n
 nuiOnMPqTtIK1k8sUYvq8c88vLZ9T+Rinr7teYdn+QPo3VIEL3jknBVgHxp6exlKO71f75sdhO
 LbBFq/iaiDSxsBmiD4SWUPUe7tj0GpINBuDmoFWGxmNIqPcjiFXQyFsDLn8Ei2Q7pSRBnYMtRr
 6Tw+19CBCwIgSvPzHmOf5Gxh0CCK/AQAA
X-Change-ID: 20260114-nvmem-unbind-673b52fc84a0
To: Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4213;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bqgk2+z7ILMVa0nbqpRl5Dj1Ez63xX0fxXr0AyP2Ktc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtkRTash02vcud/D8WefCzTody5/UmTpYLYO1T
 GrEQvPI0hSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarZEUwAKCRAFnS7L/zaE
 w1ioD/9X6vvIgLPECzHgoLkTRo66MBD3iaI0Um82hwzgiDe6VxocFnAxMyHElDuwXf1qZv9x1xE
 WtGlI1WxVj993E50vIemFVDj0yFMnmShBq9b1r1kNnU+3QwJ1VT6EsU9lq6/K3iR9ePaGO9eONO
 ED1TJHPfYypGKHfaeGKhT1A2uoj4LQKugTMyxovuepXz2kylxhDMzq+s9hmwgBURQ9KpOugUhYx
 ZWYOh1e6GD235QgBRLSzl7O3Gg5ei9ybEb1GnKcaB/5iBntte9C2S1R0TGon1f01JLEHtcVzejk
 GUFFi08ZL/c2Xi76y3AZvS1AXtYpnfMDIqgtTNGwYZ0Lpj2VwlR1B4kikLk7DZ7QP9Jq6V6Ri69
 h5cmEvnqJtgsInrfRMdZi1nuqlEx4cRYqQE7sfZwZU+yteEoKmeurLNn0Dv8W6PnCaKUcFhjVXt
 1xyqxJQnmESVwxCnjOLd9kpRU6PgIMtUiQcMY5bINvwxz70ehPPm2Nla7apLVBP8TnUjWHNZhH1
 gya71svFg7AtyQJYvsc3BiQEQ1vDV01vPtmHCooU+3yJbmW7n/1JDLc/OTcxAPK+bchd7XHqmrV
 v4lvR5LV43NRH5rzhB/BsTuAxUrUwZGPR+XpiJrvn5bfCGuW9N+QA3jmQD9I/5Rs5S5o72i8iew
 HoxczfjeJWqzXuA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: axPRuVZu5P7NAW3TbuUIqhEbxqm0H-Ke
X-Proofpoint-ORIG-GUID: axPRuVZu5P7NAW3TbuUIqhEbxqm0H-Ke
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab6445e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=hob7bFQ2uqCINLRLnyUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXwWsCn8Bc+9+/
 dNneloeG83xLccGWF0csR5BkeEMzOZUGzUhsFpwGHkjdTWQSTKMCt+i3pUMnMRe8ryR1w/5WVs6
 w7o8iQzz41Q4zU7uSn9v5g5UNP51ysrLC4Cg7RKWdeNpoLh+/mVzbaoWAYxdPMhDL5fUN7bkwLR
 mKBgGY1+Bj9UUJqZYk3oVsxzHZgtDG5SeEH4fqR2DfczCUr368jY5MC96jinz7bLNcZ4KqpDcWb
 +HPSYQGxilbKCKX/2bFpoPv3COcSV8idHgT/l7+gRl0nqjbIge/6X4IX99As97zAw3Ret4le3F5
 /hp2wtfkJRJnx8cSafkBtAfqDqtw2lyMUgmdsGUslu3SmdwQEY390uy23HbdnujIxClcJ/TIXaM
 ybF3ga5C24VAi/BKls12tKQyXijMlBT/7BRDJ7Mjj/L4E3l8EWtWu5mbtSxYZH9COZ9wjj/ZQ3m
 4CaJkHWG8gFtcY4qspA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX8id/vXLmOu0S
 p4U7XeONUGYtJ1PrRb3Qk06b1iHzFGTWQdb0D/MpTJNrp9EdNi3iyIHu6yrYir81moR1CcfBfxA
 wxyUuuEfTFqkZ9cZ4OGoqsXJWmYwWRo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

This series was queued by Srini for v7.3[1], sent out to Greg[2] but
last two patches didn't apply[3] and subsequently slipped through the
cracks and never got into mainline. This is just a resend of the two
patches missing from mainline rebased on top of current next.

--

Nvmem is one of the subsystems vulnerable to object life-time issues.
The memory nvmem core dereferences is owned by nvmem providers which can
be unbound at any time and even though nvmem devices themselves are
reference-counted, there's no synchronization with the provider modules.

This typically is not a problem because thanks to fw_devlink, consumers
get synchronously unbound before providers but it's enough to pass
fw_devlink=off over the command line, unbind the nvmem controller with
consumers still holding references to it and try to read/write in order
to see fireworks in the kernel log.

User-space can trigger it too if a device (for instance: i2c eeprom on a
cp2112 USB expander) is unplugged halfway through a long read.

This series proposes to use SRCU to protect nvmem against accessing
invalid memory after unbinding with active consumers and also reworks
several places in nvmem core.

[1] https://lore.kernel.org/all/178354240050.448408.12632228727228648876.b4-ty@kernel.org/
[2] https://lore.kernel.org/all/20260729094647.111468-1-srini@kernel.org/
[3] https://lore.kernel.org/all/2026073105-replace-depose-42d3@gregkh/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Drop patches applied upstream
- Rebase on top of current linux-next
- Link to v5: https://patch.msgid.link/20260629-nvmem-unbind-v5-0-233212f241c4@oss.qualcomm.com

Changes in v5:
- Rebase on top of v7.2-rc1
- Drop applied patch from the series
- Link to v4: https://patch.msgid.link/20260521-nvmem-unbind-v4-0-7fa136759491@oss.qualcomm.com

Changes in v4:
- Restore the removed checks for the existence of reg_write/reg_read
  ops in sysfs callbacks as the attributes may be created with only a
  single operation available
- Fix potential use-after-free when decrementing the references to nvmem
  device
- Rename some local variables to better indicate their function
- Initialize the cell list before calling device_initialize() as we
  iterate over it in release path unconditionally
- Restore the nvmem != NULL check in nvmem_unregister() as sashiko
  pointed out there are users who rely on this API contract
- Don't use rcu_dereference() with SRCU as it may trigger a
  false-positive lockdep alert
- Synchronize the removal of nvmem->ops in error path in
  nvmem_register() as it's possible for it to be made available to the
  system before a subsequent failure later in the function
- Link to v3: https://patch.msgid.link/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com

Changes in v3:
- Add Fixes tag to patch 1
- Don't check the presence of read/write callbacks in sysfs attributes
  as these are not visible without them
- Rework mutex guards and drop unneeded helper variables
- Fix mutex guard conversion: it accidentally converted nvmem_lookup_mutex
  locks to nvmem_mutex
- Extend patch 5 to also rename __nvmem_device_get() to
  nvmem_device_match()
- Call nvmem_sysfs_remove_compat() on unregister, not release
- Split patch 7 into two: one removing the redundant kref and second
  adding SRCU
- Link to v2: https://patch.msgid.link/20260223-nvmem-unbind-v2-0-0df33a933dca@oss.qualcomm.com

Changes in v2:
- add missing SRCU struct cleanup
- improve the teardown path on error in nvmem_register()
- Link to v1: https://lore.kernel.org/r/20260116-nvmem-unbind-v1-0-7bb401ab19a8@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      nvmem: remove duplicated reference counting
      nvmem: protect nvmem_device::ops with SRCU

 drivers/nvmem/core.c      | 120 +++++++++++++++++++++++++++-------------------
 drivers/nvmem/internals.h |   5 +-
 2 files changed, 73 insertions(+), 52 deletions(-)
---
base-commit: 9578843eb42e311b93e3ef35e732f237c8cc2592
change-id: 20260114-nvmem-unbind-673b52fc84a0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

