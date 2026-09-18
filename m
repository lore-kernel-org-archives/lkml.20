Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE83A3A3822
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723798; cv=none; b=o9kljujBXBCE9tqnb0JWB1k8/8Jk9XQcgU497EBb5es0qg5p1rePwf5OIMZgHYzlYRqGeKx8LDhwdGwWEwR5lLDR5gYeQsdgo66BqSsXL+iRfKn45wbu18bD4p4hBPFkGDCiJmzKvP8edOZTm/X37p9Sn2M234yeFYTZuRoecfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723798; c=relaxed/simple;
	bh=X4o6heKdgqyedmdhEI5qR6NAH2RMCo1d01E+qxeNtvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nspItqp0Gxs17CTBr8zJiQcQzl1aazUH5Lgh2+bbbb6cpfNZ86LItuNCEVgHhHOOQe4IDfn1ts9K+gRy+/Sm4b2p3e/jNscYGhYre6hTh69xU2jbQ6cg5aLDgod4xVK7m3AB1iEZTHaSsviUu/BX5fFIBlsehCRdFz2LiDhKJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fffPpa5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIzbFPyG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fffPpa5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIzbFPyG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60Ws7021443
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2P
	F/wFYxfI=; b=fffPpa5/8Y+LmheYil3ZBLqczHXazeQzdAFtQsjrGDuA6HpUQg+
	Mz2FbRvF3hISFFd2465/0CRYGiQk/j/iFLbhH4qXOWbtVIpNfBwU5ufS2XPWkBID
	ObYTcOooT+DHaW80RpfwaoxbLZZqoxb3E0+4VqZfJomBBCjrrzKs52yHE/HVoffl
	80FHd4gX1Fyt3SyKqXXVeZy0fRVJW1z5kHhAw5PD6yXnrfKCGdDJAgMQpe7xGvu7
	mhunvHqv3jGo0sik2vkDKXPtmSZxFoeerQ7UHCTXIs5ta9QPNnFDiJd4xbOAfuhD
	Qtky/WnN9FPpPjSDD+uDbcf4GBEwJds04JQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqeb7x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:29:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so133398085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723794; x=1790328594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=PIzbFPyG6nQiAoQRlIsU2vS2HQnBhqkKt9WyW7OnHDdiEuq1riJPQS0zwi8SseQnhN
         ChUc4gBKb87NsB/QBCvGh5qsZQ5J1X9jWgdApAZMx1TAsA/4dw724Y+8D0iV3mFRNNIF
         t0dzGiVh32eyRSC5SUuF6TzmJHsOwKOfKy/fkh+Aj4m86kNAoLRhU7Qhmrcl+4Z1/njb
         JnCRGc0YmUKjc/afCKtEexH4D4sRpE9xg1QOjXIcPHFikEKxqUWY2dOBXDTP9vw7t6zr
         reKSoALWNrgFWvzIl7qNk4tD0q3ZQIKbdt7PZdzebVEuSe301jl2Hn/5yKErkasXxGVy
         RoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723794; x=1790328594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=IOVieY6ZFWFEVh8f+/ddrQJBXyoJFcUX6LSks4FwJnjSDzSxDsKXVulAC++4W1L4OL
         f4U4l3EuihDPOBrw8JsvR3omtp/krjFlnoVdUK/z/M+xHQi4UeasyQqN5KpJVnEeY0TO
         t0883I7JpfdiPAX7iOZnzknuOLr7u0Z/950Bnu0qq3WID6SxXJbvAKDUp8ozapo/l45E
         m7uvr5p501NzNaUr2u6xn5yKzUle+3BJiAQy0BKkV5jVhpjS0ZbKYvr3cgtYVyod723c
         rFacfEXH4FytNNhPpsN5Rc+VtbczB6l7PwdBSHT/tvPAq/l2GCkHnemKXG3xToHtW6E1
         wiIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpgZ8J0rz5OLN63CEZwZqLjNVShwSm5b/6a6LYKTrqBJI7kQWxFqvyAHEkUOfJaoNxgLIdjErzA7w4G2U=@vger.kernel.org
X-Gm-Message-State: AFuF++llqObu2DILIouRgrtryyfeZtgAP/gee7yVtpFkx28dWuNJm76e
	BEJCtcTj6J5NnOmRZteBHMdK0M6iRwTqBfKF3+hz6O9goIxHXSRFdVtuTYStcKAExRs29nKk0at
	4Xo+DdFbpiLI/yy/iTui/bfX0R5W5lhtrYRoppxGJeiExB6qBXHkH4ZYEc2zbRstXmKQ=
X-Gm-Gg: AYBFou218yTRxsjhXkwHlp8iNeaKRB4pkZ5Srhn3FvkKCJIvwOCX5QnWTcMS6+vTpHL
	zCEi5CCzb9OrMJn7rpyQK/cu5j1cLA8D5G2jKjRT2vvWHjH5ATTL5t9UV9yvP8r6/npGCCtGlIu
	mpmIKSFBhyPi/j40pM+cc22vwxwZ5bmF+O1kP4RSImj7WZbSj1h1tyWsRzSk2DhZceegYGH+qyt
	pMTdijz8iCocJt8BgShl8a2tn2F/XseoMzgkVqxMu6PZl3+0X/rhTn+MKEDD6s+fdeQyUVUemSv
	/Fk0xuYwsDYXSlwSEX+Lpug4Guy0/YiWYJB6Y5FFY5n+R+qCflWacH57W+EUa6/EC+ni+/FWcWQ
	rQxY9rMdf9vV8lU80llAwRS/z0HETgRQkefbLrBiVj+WZBqFIfg/2vUw/5HsIJKoYKlKaFDVj1m
	8pw2rR4dV3nAc=
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245526385a.33.1789723793843;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245524085a.33.1789723793406;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6bc0sm36796166b.60.2026.09.18.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:29:52 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] firmware: arm_scmi: fix module auto-loading
Date: Fri, 18 Sep 2026 11:29:49 +0200
Message-ID: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pbUjnXKkYgYudecTCzu16C-5uXghiWUR
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad0492 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X-UiWFXO2YgWyHAQv0wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pbUjnXKkYgYudecTCzu16C-5uXghiWUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX4l3AVcH4mNpO
 vdXoJbMnr9RQ27dS7Xvafa+6QIY9bIjmGjXFITcSMet6tnD+Oo5FqFGxrfmnUgGc4ccSXs57ivI
 2oBkIbZgZvLph3daIFFEBTSlv0jewd4NjyaozdYBD1Qgfod8m+Yj13EuySVzMG6c6FSJcgPTvKG
 8+Ora17zTAxPBHKmvoVZ2RLSifPncJQpYBBi8B3+TGRyS3d5jFU2uh65xQSBcjK6tN1wAv+ALqX
 tlGPB8MPTVcvZkobGKT/OKeVJEE4jvYhayEGjnaJwMMXaPQhNa6I4TqjpwPq2RdOy34OlVjanwV
 Xsi/xvOq2htoGLa69NOjsdoNzjRy0UB2c+VJZnu5lkjfMi78vLp9ZnQOMzmnSo272X1UzRUsEPC
 Yp04DPWsjyTitJLXxUi3kg2HDZ+RXRzGz5S6Dq/33YJKreNIVd2hGEKv0JEEy8nBhgtTR9QqwDc
 M4o89sISHI2SIXfZtiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX5suQJp5F7o9G
 yRg2yZgBLdq5IHz/tBmaJ1WphklZMR2BATUwD/acLPnNUCUlL6pTUkVHCSTGvUO900hT+I7DMse
 LYIhf+PtxpGw1gLu4RDZl1r591iBOwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

Hi All,

Here is v7 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. A new patch 2/2 to always create devices for standard protocols,
replacing Cristian's patch to pre-register the standard protocol device-ids
from v4.

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } device-id
has been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by always creating devices for standard
protocols without relying on the requested-devices list. This creates
devices before the module with the driver is loaded, after which module
auto loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

Changes in v7:
- Rebase on top of v7.3-rc3
- Drop:
  "firmware: arm_scmi: Fix scmi_protocol_table_register() error handling"
  "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
  these issues are already fixed through other patches in v7.3-rc3

Changes in v6:
- New: "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
- Add Fixes tags to the bug-fix patches
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point
  (from local Shashiko run)

Changes in v5:
- New patch: "firmware: arm_scmi: Fix scmi_protocol_table_register()
  error handling"
- Replace "Pre-register protocol, name tupples for standard protocol" with
  "Always create devices for standard protocols" pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
- Drop "Pre-register protocol, name tupples for IMX protocols" patch.
  Shashiko rightfully turns out this will cause problems if other vendors
  also use the same vendor protocol-id space values, e.g. 0x80, 0x81 are
  likely to also be used by other vendors.

Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- v3 is the first series combining Bjorn and Christian's work see above.

Regards,

Hans


Bjorn Andersson (1):
  module: add SCMI device table alias support

Hans de Goede (1):
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 71 +++++++++++++++++++++++++------
 include/linux/device-id/scmi.h    | 17 ++++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 ++++++
 6 files changed, 93 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

