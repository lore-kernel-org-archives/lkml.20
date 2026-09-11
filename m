Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174C36194E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140217; cv=none; b=oshtTIRa3jTgttc6Rke1/tHR2Uc3CYGcNL+6YLIBYQ6ow4MgzMUDi2TG+OvFPTHUU6uVbZL7QG9K3VD1QT9xC4/yfc4WlXH8pZQVSYMmum3d1sSF0wTP99DHpZ5YEXwQieEwrzPLtMU0QrRa3HYed58qRO4nWrZRjblgCS9C8gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140217; c=relaxed/simple;
	bh=szpOo+mPYKm0LXPJUJFcdhCvXOCrq2ifJ7UtblEKc/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Viz0e0F+mM6xvCHhMXEhuSxZl+LX4l7rR372GkQg82DFZyBBJJq5Z9A+W4do2Z7UJM+YbgqzkOVrn9Mwb2Kx9Th8q6AX1mHtWOoDRPuA1uo1NxazlhmMCpGBpbE3HXfA81+80PT9Hq303lRc/QF+AR4L0c7zeWVZrTyrPESS7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSBk6OLS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAnN6ErM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSBk6OLS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAnN6ErM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmE7T3780629
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH
	+AlWop+Y=; b=JSBk6OLSYPVo74ybSiJ5pOAIuWOhMqYRVF3bJjJ4te8EWZHEVsB
	6P48U0FsSQD38omr1YfnWtUqMlE2RtE1EZN+KvDOAKBvrLeAsIPFTWtanj6GYNRb
	INFOi4U/juywHFVEtgR1IeuwVhvrMWgdRJ6mm/lmrOC7Bnkp4v+31HD8wiWYeN7U
	mW8pF0ib+ZH2kzcLYzTy+RPNG/ZCUyqkBxwQ3av9AMDlBspiFNRECHJHhng/3+t2
	5q/Mmf1oUchSMnKKZsW2cHV12StDlTTpPc8LHlo6cY5G597CXH7urVcKTJ4ys+2C
	QYRepI0tumv0DA+srB5dj/PK/vnjvuEnbmg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj5qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78a6d5cc851so221375137.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140214; x=1789745014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH+AlWop+Y=;
        b=NAnN6ErMtzy6mlQXWAl8wpzomAZGrlKjuv+PRjbyeODX8Yr8VrPBBQqwkmOsed2VK/
         iWVeXCsX/uCrU+NqnHRFq/KKfI7mNGDwzaBLsidiEmBCrH9mW6/W9q806aS3oMPqveRf
         PgaziexMSaOFUAdnVQQy3gJg2fj0eoxj2lvH9+Z7WQY8Ro9uoe8+7M6CP2QIxf0SltpD
         4rjZUaMp7un1NdRteJt2ggAQKWHuANpwOvWdn+35cz0rlMbL10n6iJMlCNPPdnCp/qeZ
         xeoaBdUpTfT2Z0rrhZiOShLdtnu4Qz0L9UDcd7ClSffzIyctFhu2zLm5NluNYoCP4mgS
         lQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140214; x=1789745014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH+AlWop+Y=;
        b=aGamu21MTBoD2vrfYjVTf2bgQC0SKD2jItQ0v92FhDDongOgS+4F6wD/ACIScYzaCL
         IpBLRo5sChp3nssvXENtp4/Ag7fituS/JgDiE+9cyie/4CZRC6VsqQh4+1L+QwqtJGk7
         IMdwxgYlduVcQnpcOo7ZTP6DnkyCau3BCxJkfWQ041mw8ZXeoQQc4AOicT7OPLr7+ZuC
         cDka53sJhvDjsZRCfNUivYedRZVl5EduJVxRKSzW9x4c+BTpLJ8bJbX1UxUhMojHRKD2
         Hx3RZRcGMcebTyjDinJFAhj1nmVJExqed/C8Vad8szaO0ScEYDCNYXWikTIH7IqL2wc0
         EPJg==
X-Forwarded-Encrypted: i=1; AKwUvBxgDX5A2Ad1JuUAf28F/1wUeYj7OvLluktnLcOWvFfLtiCK5A/Cs8LoBQVeE2kllMUZSoeqJGqWGShx7Mk=@vger.kernel.org
X-Gm-Message-State: AFuF++kEGic2ycZLX9qEZmKNFzRdXeVGj0HpckntKN1HuS2KArx+zwso
	ZRkv779ERxiO/bZtpYJj5zUvegtRSXO6a93DKo1BARruyCwp26R4119HvNMoLvgcTTAPkEk/OOA
	KsbUbhhrhjBo2+8ZkooOs4ZVm4x91C9j+qkxmN1RzVSRzqzgNspp5B7TOH8WXFb50oKw=
X-Gm-Gg: AYBFou0Y+bcikoP+CJ1bo+IBIwIiUUJVPRz3DkyV4IRe9q1eexT1KQmGj2HOuQURGET
	y5IK3pOwPCDOfPSIdSc5coOUpCWCzW5QOu/N4yAb37wjjsBThgG1RrODizZcVrf644x2Xsnm5mn
	mxMiL0w4N5DJGQP6WYwsxi+4yO8i2UnDfRRPnZDScwAv5IV1PD8TU3yz084MRcS4gGXU7DnA9jl
	SY5uQLU1pcMyE+BoCJ3lAkR1Qlc6vjoZJAb93/dHMwyfWDb1a396XKYE4M/WpjOIlRRR4/f3fDT
	ETYPLsPq02cw+XeEjyE0xRa2KoaVtYDsRNsWluTWgxwm3kS0Eux7UE9oZHSCpPht5JsnNv/U2hZ
	7gDrabf3DKuFnePZcnCru+mvd4N1E3U7CkF91dLFgH+FAC98NLMKLO4rXhbSDZAtklzLMpERBat
	VxGtZWfgqixU5Ns8JnFSRdQg==
X-Received: by 2002:a05:6102:3a13:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-792ab142031mr5533612137.9.1789140213601;
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
X-Received: by 2002:a05:6102:3a13:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-792ab142031mr5533490137.9.1789140213093;
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:31 -0700 (PDT)
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
Subject: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
Date: Fri, 11 Sep 2026 17:23:25 +0200
Message-ID: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX/u5CizpIuzSr
 dRHSHjUvI3RSwwM0/4Jif6laGcyJltQ43l2wfwtpsKfovjHaSKMnV1gj52veX3A46AiH4ZrsN5x
 KLEpx/XUI6xbxjjrR1fG8hZDP+tJVv3CkdIC1fl9sSKcT9RD4rwy2ak6ZsYTy4elwKACbvSB9Gp
 pfT5PokikHyESl8S2dd3qMnSTztFCD/7T36p1Atr2HJJXiq85XIxix0sdxKhSpA/eNClPtL+TIZ
 WVLyek3rZSVM4lvg7t+xRQGilF4bHNw7FadEEUDVLesL0PpevCa97zyZ/4iGFYzENBJOgxAwoJb
 DlYsDOOtn5Dj4ScJPkUwkDaRFwtRbUANYEQsRbQlEdLchzT6NQwtyj5V5y+/QfRpSFUGCXcUOX1
 5eplzHnLcqc04G4JpL45kWwJJUAy6lMyEhRA/8aQb9usn6ATeuLstcVtCifeIllUC/cZiAj4a8a
 g8cRzS6nnm14DM2xRag==
X-Proofpoint-GUID: DFJibZy8-idHJzJEkofGsiw8XY0Ft7qZ
X-Proofpoint-ORIG-GUID: DFJibZy8-idHJzJEkofGsiw8XY0Ft7qZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX5+NplQIb/Fj1
 yKCMWT1ij/wP/v1xRr3tnQ7nYGBWRcy/znsqvG3Pf6XxiE5T8R4OSX6c65iWKSfhXoMnZODEKmy
 cGVV5QhFzI2tdV1lxjh+r7JDeyl0sRw=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa41cf6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pQ3uMOGh0wyPnyaBa88A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

Hi All,

Here is v6 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. 2 SCMI bus code bug-fixes.
 
3. A new patch to always create devices for standard protocols, replacing
Cristian's patch to pre-register the standard protocol device-ids from v4.

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } device-id
has been registered which is done from scmi_driver_register(), creating
a circular dependency.

3. breaks the circular dependency by always creating devices for standard
protocols without relying on the requested-devices list. This creates
devices before the module with the driver is loaded, after which module
auto loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

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

Hans de Goede (3):
  firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
  firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |   1 +
 drivers/firmware/arm_scmi/bus.c   | 107 +++++++++++++++++++++++-------
 include/linux/device-id/scmi.h    |  17 +++++
 include/linux/scmi_protocol.h     |   6 +-
 scripts/mod/devicetable-offsets.c |   5 ++
 scripts/mod/file2alias.c          |  12 ++++
 6 files changed, 118 insertions(+), 30 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

