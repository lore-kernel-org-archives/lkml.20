Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC66387364
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372532; cv=none; b=kjZCNKjsfZxZxoNJ4ncU8kPbNfaTtxz7gBXZLbSHN+KPwC04MJ3d1Vw5AFdVe2x0qTigftOYijsUa5HJ/Jzva90u9azA/9yLqYq1HZHxqWY8v+JZcpB8Me4Eub2rbUlWMKiXFroVp8RGGWVdhvaIRBvoAkiSayGqXjsQL8M9Q4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372532; c=relaxed/simple;
	bh=Q27e9ZJW17DSgPzhl7UcJohnr3d5EAc9sLa9fX5nUPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KU0RZsHGAbeUp6nJNefIDxNHSdFLv5UHyyU5tnyRwFzBfUnFD8s5rvFAT0+/U1BQFc2sa7yGDJHgdxTnU9f+6Tb9U6X+A8SZzpdQnrzhVOcxhjhF2LT5PIyZ4++vDk3NIiiHKyjiiq7G4ftHLLZ26qydPJjVQ3TlziM4gQ1DajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhjIT6il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biqAVU3F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhjIT6il";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biqAVU3F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr10d2372729
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 18:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B9n/qeKhLq11qnI+Qeisghld9kpOGURg5g7
	gMr/FqQQ=; b=NhjIT6ilug7PAN+x1NJim3RDlbnSlvCBXrs9XvdZH+JILFvyZh7
	Dqf0M7nqqY6owTCJit2HAbi2lNU1p1MMYau06YR8U7fm1720vJjINQzO6M+ypKsP
	dl6g5/IsD6gMzXW1JiGCb07QKMybv2Yu0fF1pu27Pjj1IcNN1i8oBDip8xNVZ6N2
	mHortr639bvuqg8BT5CJe4OgGhz5s1vo+stcEUbsxZ+JjqCBalclnceD86AzmMey
	eV/qPvZK6sP+ggJeqqV/hBcmkZloqeM4RchtSxnwCp2dincowUgkpUBr0dvW2aH5
	XFSNPZvoBVCsdPCE0G2iS0+cHLxxLt7ExJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv89srh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:08:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso262422085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372529; x=1788977329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9n/qeKhLq11qnI+Qeisghld9kpOGURg5g7gMr/FqQQ=;
        b=biqAVU3FjIA8hrMGNBthZ4+pEOy7UaLQtprRFuRpdWd/mzrgH3R6QNgYx/Q6/LlVAO
         PYNmxHHoSHDH2YNE0ZBTtdq5CC6HW2Iv9Qr8/Q8c8dK0iuVgv8YBpJbYv6vPKksZ4LTe
         IQRYmlHK/BVJrz5WEypribHNInWxShiocYP234O/YOdKDmoQSyy+jPwXH2TG5uH+uS9x
         qGDEOUt1U4LqmvBAoPawJAV99X3WnxKOLO0wIOUBJatQKVCu/ZHcWvWN+zq5sNbCAqz4
         mnmUtfzuxfsBNYMLEqbhKUjl4OMVRMTDzSuDNFVFgj5xTwP87GuUL7w7mSrztvLwSj3/
         pggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372529; x=1788977329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9n/qeKhLq11qnI+Qeisghld9kpOGURg5g7gMr/FqQQ=;
        b=F4u4hlCcoJJC/XSJZWyi59aLbcysHQz4ag0Elex3hbzshplltMXekjj88zgIhlyO48
         C5Vk+F2K6mkWX52h0z27kXIYi3CnHDWlRuxRvPeYGzn7nPe8dYbdRm3VqfZ7vBAmtTyi
         3m18BO8FzPP7ZZJjvPKg2YpKKtlXQ5Yz8H1y/5KMRzRbcrvphTbrMZeFGTyM7JJtQbAT
         EL4fbMiqEsSq2pKgXtr9BYfuEi3ITKmcZThyoWo/0VqeYLk15W/ME2Npc5SWqlpksXAP
         dsXJj1cyekuDCdMM4Rj7Kn7KstqLZ/rKIMK+N/Hf6CpNZ6Zti5KYwl4aiDL6oCf/+jeM
         Rbjg==
X-Forwarded-Encrypted: i=1; AKwUvBwQQH4B1GQ57/fP5AYLaxq/bWHDAkgyiB9hwALKzYikGsOv/5Fjb0XPl0YDQFwhkTy5XSRrP6QogelUBSc=@vger.kernel.org
X-Gm-Message-State: AFuF++l7Ig2/Pf/ipuxdkZg4vultTKGMZO9xNm9CmGA4nOo+G9IVlWft
	f36UQJbxFsgYJiTCDnGi0y9lsFTtdhgWirxnixHEuquFJ3W62w+FAcNCEggrtdfmduQaZMHwcvu
	ikRAt0hQDcrH398OaazRojKMEfRUQ4BbfGjbybq9HtePQ0lSgsFuhBRuNyp7ciMu0DDA=
X-Gm-Gg: AYBFou0JKaX1tImGgOg14xU00zyOoZRLgfmcOBwHov2XIwytfPat8+x7yt8ikCLzSI6
	RcLUMGMBHOKLFI3tTq9OF14sOwoZ7AiU6FzaQvuaI0Xr4g/ValEQPbwJvN/EfUbPLTCZG83hR5V
	5KDlU3/E5ekisBPkmg5JtVMPVM1SOK9naCKI0QDMClabv+7XFFlx2K+S5J4my9KI7GDrMZ5s/NS
	IYVyj7JDRqMq6jJv0d/mYTzXTo3pakIJSYcfhsFH5043f4MKZ6lsQcwVb7yuQLO3qzDIZZMaMCr
	e61SpFE+MTgKtzFHrBI1hkmzlicDl3Mpj7b7D+3jT+pZx+/7Fn/ehSWPZRjE9nSFC93bXTaqv0W
	ENeDXcj7Hvz0D+d4Rh1nd7y6jRzdatIm3FHykJ3HvL2wdU2kqM9qA16/ExRnfYfgrmoV6cZGrt/
	/3VQydfXG6XAaPk38=
X-Received: by 2002:a05:620a:494f:b0:927:25f5:ee08 with SMTP id af79cd13be357-9396100e110mr654415285a.43.1788372528722;
        Wed, 02 Sep 2026 11:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:494f:b0:927:25f5:ee08 with SMTP id af79cd13be357-9396100e110mr654406585a.43.1788372527919;
        Wed, 02 Sep 2026 11:08:47 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:46 -0700 (PDT)
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
Subject: [PATCH v5 0/3] firmware: arm_scmi: fix module auto-loading
Date: Wed,  2 Sep 2026 20:08:41 +0200
Message-ID: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T501hWbVcNoqgjkdpeeu5dK3UI2iV57b
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a986631 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uKFJyDnsAr_ZGfoBym4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXyTaoJImBbbRt
 mc86InnFabtLMLdOXu9vWy2bM307l8/uQuBopYSQEvCOVOtS5TOFwEUUJmKzSBd+AbXKBCMgLPU
 IjOdqtjfjwUAICwShbsaJHROkkYMKCiC7B3wELUA/K7jXPiaPrYDKj6SUpzkATK4oGsERosPjUg
 VpypgSw5CRbHdiCKUe4YqF90Zu5XLGZIlir12TulQDCv99QLIkmqprRspywbLDn+ddPDSLPSt8T
 pqtvtm5UGWtODBAjpffPi+1sh7nZp/siJ4X7wzs2cI2UqKEwV9F3Sw05hF+Bro8weqVm87eUzG3
 W0iMmVn5++4Q2gq7WSzVNQnSdC4yopsBBwvd+03bAAmytZFDO/92x+NQgiN1mgKcCw2Ch6WrwwY
 /aggohTqs8oVuHXVPr5otIcShgnjNJnK5VNEb/K483v3VRLkdQeMvuGOEaWi1AO7w2UBFJ2dX5m
 UuFjG1nn6TCWxD0BrPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX/NdW32Ih/2dH
 He8z1Jqwq8yKzr22oewv51Knp4IaCaWzJnL+G91/RElNy3vyT9cQfuiClrifpyDuXuwEj4L2hgI
 vmpzrzQcavG0fwfSa4A1QOMi+/pg1D4=
X-Proofpoint-ORIG-GUID: T501hWbVcNoqgjkdpeeu5dK3UI2iV57b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020160

Hi All,

Here is v5 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. A new patch to always create devices for standard protocols, replacing
Cristian's patch to pre-register the standard protocol device-ids from v4.

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

Hans de Goede (2):
  firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 97 +++++++++++++++++++++++--------
 include/linux/device-id/scmi.h    | 17 ++++++
 include/linux/scmi_protocol.h     |  6 +-
 scripts/mod/devicetable-offsets.c |  5 ++
 scripts/mod/file2alias.c          | 12 ++++
 6 files changed, 110 insertions(+), 28 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

