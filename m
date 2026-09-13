Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCE33E765A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304108; cv=none; b=gVps9GLT+qNnWn79TqH4q2z8NTXKlh0/Cx0tI0MlWmyBcVRgAzWyVo7byfXKJWl5el4z6/KW+GsR42vJO4J/xQR5LpeTmCzAN3w/px3pUFkXquDVISu8aj06I3GFZGm2tJRiJQj3VRUDwSVByXKx8bo20x01fLdg2mtGy16NMok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304108; c=relaxed/simple;
	bh=JBoNhFBUHY3//huDZMyuoPCXOIRJ6OeWlwp++1rcfDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pXRFVh7snojNzzT58mM8MxVynbY/p7xh+yRojKhu55Hj66tkJ3ihkXECvq6hLmL+SfCFTdK55JoIPb5tOE7xxL2SGLEaeMsxK8Wbgi+zRUdU6JWDgNH8gxrobNy4nWv5SlK/tAvWSpOUkTn47Y7smYbR9wgouRAJjKJAuMa45JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsaTIIjd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQIvAYAa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsaTIIjd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQIvAYAa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU2Wi1468247
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TnWFH42ZVdYwIEiEQWip0w
	EiKjMNEkD89ILp2Beafqg=; b=XsaTIIjdwcfRxQnpgjG3HJEHanDGXOk89d4Olc
	t6B5SeSuTetIP0VPWFGDvZ/A2ywEv/Hd6e5HU/ZFTV+60pJQK6lTp8AV9u3ot4Mh
	NYiiSVA8R5UlfEKMu4qv0UdvMfn0Ttp0NGIy5t+L0qzriQmkHsDUD33HyH/Pr/F+
	rESETrz3LaffEIh8jHG+AKAVWWBtOaTPOk+DweGzN2K8QuvNC198hkttj55pWXoJ
	TppRAvBBR8c7rXgiFDWNRVtyAolyyOuxcLZ8SLDqopGIoYjK7spUMCmsz7z+cp1A
	XNSjMupsu0C7DhWe4gcEEMUqYsRp1gs5HRUFTHBMULpjOBJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c38aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso1997250a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789304104; x=1789908904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TnWFH42ZVdYwIEiEQWip0wEiKjMNEkD89ILp2Beafqg=;
        b=XQIvAYAaGATnVD4F8/eMwztNnXvDUK7wA055j2tliYC60yZ2cb3vQoUGN32wXzFq1Y
         Q19xy+WwvOQFM/xUGxAHqv6Uid1NyXFUAjm1h3/9e+5ME9ZwR6/Jh/MdrIWZ8xUSgfcx
         uzOEOJKQzMFxW8oyUh1jYE9sVIBN/yiDHFtPTDlKLGdg77sdHH9a7R+BztsgjIGElAEg
         6S0Rfs5VHk6WBCwaplw7uauWlS883k+Ftdn2eypylHTRzX6KMbFqc5fZUkePl715Ad2l
         EZPHXO+IGEEs0G8tUGdtbiB2W+QXNInVcv0te+Huc36DRDXHcpJR2cwRPS5xb/gXJL95
         2ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789304104; x=1789908904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TnWFH42ZVdYwIEiEQWip0wEiKjMNEkD89ILp2Beafqg=;
        b=T81ixvouNEmqs7yAeoawWZiIhlkxmy/bB/WH9MZKQJygkmqnhC5JZM4o67Kb0DnrH1
         JL9+Pt7jnFQmhI7dezyc+sR6RH/8h4CLjLgM68KJxw090y6NYjEpmpn9UsSNKJV8tMs4
         jGX18b027eReOO9kEpBUL2pFjumplaM5tw//xNx6oQunfZjWgH+u6HflmPjNo+Gb7GA4
         nw3zRxDJH7VXUits3XhQMSI04Lu+6si2cM7gDjTbYEOTBuno8QQPIwXztgIpqT3NZuOe
         9MLFoCwQK9vFAev7FjYV46gx2U/VYzQQf6ovxI+feERkUHPx87EY8zKyfI2lLUm2kLXy
         kpkA==
X-Forwarded-Encrypted: i=1; AKwUvBxDY9KusQKQX6irQUEJSVixTvMKr35aujWTPcRQjW2JxLdfk76Ba+nueKPHtd3kSTH3CU2Sn/ZoSrki5vw=@vger.kernel.org
X-Gm-Message-State: AFuF++nm7YRHN6IXcUJV/VKFyntZEoA0dAVOUpKjeiiODWfH1nPfOihE
	S1cfLQt10LkdTJad5TW2RVqLiHKjoLyuvIbWGsrfr83o4JO3kQPBCEaKzlnPLNADugz3LMdI2Xk
	LYOeZUEDrqTF+sB71xKoaNKeuO15wIwM4xRcyufWkLpLQB28r0OlbncF2dWhqmXR6iAw=
X-Gm-Gg: AYBFou3XB2Gz9NfZon1AWUu0niQyF7KID7ETxnhbpZWABX/GMDbt/2HwBnt9ntPWJN9
	DzaLrruJHp8JpanuG+wKJZ45ZBL2o7+Z3W5VGtCQFTQ2z6ART8HdJ9mCpJc4ipKz9NFV8kl87Xn
	c5fHmAnwQqCmIeuuM6trwKyYJM+9RMICffygpdNqVdTEW5BIkINCxE0iMafB4zMx3Z4DqCT5lWC
	ko6Ox/W/rGi8o+EFD51kdaGMOe1mQglC8bDIqASj8lI3J0xjPS4oxbGlvnhMGiP/gLtjmiHAyqQ
	xwkz4NzQot9BNqF6TzpDZxY7UvowfY85juxTUqSldv8zgtD/KtTP2zI+mLUMJOv0nsK0EbmNWTE
	dmFqnHxOtlf4cehCRFQ1X8n8FlL+X
X-Received: by 2002:a17:90b:4d0c:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39d9b97d29emr21925355a91.0.1789304104067;
        Sun, 13 Sep 2026 05:55:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0c:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39d9b97d29emr21925234a91.0.1789304103351;
        Sun, 13 Sep 2026 05:55:03 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm18027211c88.1.2026.09.13.05.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:55:02 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Output debug information from RSC
Date: Sun, 13 Sep 2026 18:24:22 +0530
Message-Id: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP6cpmoC/3WNUQ+CIBRG/0rjORwgqfXU/2g9IFyVlmKArOb87
 4Gt9ZIvdzvbd8+ZkQOrwaHTbkYWgnbaDBH4fodkJ4YWsFaRESOsICXl2I59h73uwUweK6inFge
 Ky+rQEEollJCj+DtaaPRz9V6uH3ZTfQPpkywtOu28sa81HFjafRvlRiMwTHBFhQLeSFXz49k4l
 z0mcZem77N4UEqF/CerKNuS5VFWVJIITpQElv+RLcvyBnFnsxwgAQAA
X-Change-ID: 20260714-rpmh-timeout-debug-v1-785f011ce7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789304099; l=5321;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=JBoNhFBUHY3//huDZMyuoPCXOIRJ6OeWlwp++1rcfDs=;
 b=oculPdqbxzF9XhVd4Gp/99rHT9CNEDL3eB1IpH4LAAxRCVhsfXdGGOcdQG76mn5p4HapQfORo
 MVFmWgdRQ/XBY5wVsF9yhc7vNCCf7Z7YPUKgU5VKXJqs89p2I+GusAF
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: nvHn6wBF2JjW2OmSOhQw7zYIbh-7Fdeh
X-Proofpoint-GUID: nvHn6wBF2JjW2OmSOhQw7zYIbh-7Fdeh
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa69d29 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=F8oQ8Qda0vr2_JhOYWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=pioyyrs4ZptJ924tMmac:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX4sVjOzCk0caf
 M1tKpiMozj9HuUEY8yQ34kjXg4o6SJiOvHak0YHmYtmAMgK5LTmvfMD2g7Riv4jO2W1vlYKbDSH
 6+HwWdX+hynoLrycaMh3cvCnIl9JRSlNYjyXk5kH2aAj08vsnO4ByY2O9xgYnMMKz+ZWK5os89K
 4ugj1x8V+cIFJbOqsnlVZSx3xPonzF69LcLEjI5eX+PDaH4kBEYwGLofpkPNF2M3R3mlcok0shI
 hecK+gVj/f+RFMZLTrqCkt7jdLvBeQGGT8YfCASR/Kdin4q6g42yRT24Od7OtL3/6zUpgQQ7JnL
 cWP12vtaoYWrne/LguxikbGjk48qzFZ3famJU66cAo/rDfYlkNpVtgr6eGt0GeYLm+MaJXUrWNc
 w/oIXzlracYbpoG/5G/tujHB5auTU53ijxMQpH5S36E5IEiA3EbGPdGtM/6AtTQKu6fPrPEJXsZ
 b5JrkzH9fsOjHSODHcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX8N6Qxz1wSrce
 KgB4QPAFtD80pA5y5eE0E4IoPfrFNc7Ivwerd9gX4ZQ6Fvned0GnDeANNfQrSoSjKzvxFNEja+u
 GJ4QhbpxIZkT69USD8onzW/Cn/cLy6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130184

RPMh transfer timeouts are hard to debug — the only indication today
is a WARN_ON() with no record of which TCS was stuck, what resource
it was voting for, or whether AOSS firmware or completion IRQ handling
delay caused the hang.

This series adds structured diagnostics that fire at timeout.

When a timeout occurs today, the only kernel output is a bare warning:

  WARNING: drivers/soc/qcom/rpmh.c:386 rpmh_write_batch+0x190/0x2b0
  Workqueue: events_unbound deferred_probe_work_func
  Call trace:
   rpmh_write_batch+0x190/0x2b0 (P)
   qcom_icc_bcm_voter_commit+0x33c/0x500
   qcom_icc_set+0x20/0x34
   icc_node_add+0xf8/0x118
   qcom_icc_rpmh_probe+0x194/0x540
   platform_probe+0x5c/0xa4

This gives no indication of which TCS was stuck, what resource it was
voting for, or whether AOSS firmware or Linux itself caused the hang.

Patch 1 adds cmd_db_hw_type_str() to cmd-db to decode the accelerator
type (ARC/VRM/BCM) from an RPMh resource address using the existing
SLAVE_ID() encoding. This lives in cmd-db because SLAVE_ID() is a
private macro there and the address encoding is cmd-db's domain.

Patch 2 adds cmd_db_read_name() to cmd-db to reverse-look up the
human-readable resource name (e.g. cx.lvl) from an RPMh address. For
VRM resources, which have up to 4 contiguous addresses per resource,
the match uses VRM_ADDR() on bits [19:4] so any sub-address resolves
to the same name.

Patch 3 adds rpmh_rsc_debug() to rpmh-rsc.c and wires it into the
rpmh_write(), rpmh_write_batch(), and rpmh_read() timeout paths.
Per-command output now shows the accelerator type, resource name,
whether the command requires a response, and the decoded TCS command
status bits sourced from the CMD_STATUS_{TRIGGERED,ISSUED,COMPL}
definitions:
addr=0x30000(ARC/cx.lvl) resp-required sts=triggered+sent-to-aoss+resp-received.

Example output on timeout:
  [    0.132051] qcom_rpmh Request: tcs-in-use:YES state=2 wait_for_compl=1
  [    0.132057] qcom_rpmh TCS=0 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
  [    0.132082] qcom_rpmh        CMD=0 [addr=0x30000(ARC/cx.lvl) data=0x8 resp-required sts=triggered+sent-to-aoss+resp-received]
  [    0.132098] qcom_rpmh HW IRQ 37 is NOT PENDING at GIC
  [    0.132104] qcom_rpmh Completion is done
  [    0.132108] qcom_rpmh ERROR: Accelerator(s) at AOSS did not respond

Tested on x1e80100-crd (Snapdragon X Elite CRD) with linux-next
next-20260811.

The v1 of the series is at [1].

[1] https://lore.kernel.org/linux-arm-msm/1581504972-22632-1-git-send-email-mkshah@codeaurora.org/

---
Changes in v4:
- Use dev_foo() instead of pr_foo() in patch-3
- Use str_yes_no() in patch-3
- Update Timeout print in patch-3
- Update rpmh_read(): kernel doc to use rpmh_read() - format in patch-3
- Link to v3: https://patch.msgid.link/20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com

Changes in v3:
- patch-3 wires rpmh_rsc_debug() to newly added rpmh_read() timeout
- patch-3 moves WARN_ON() within timeout condition
- Add the reviewed-by for patch-1 and patch-2
- Rebase onto linux-next next-20260811
- Link to v2: https://patch.msgid.link/20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com

Changes in v2:
- Drop patch2 change from v1
- Add cmd_db_hw_type_str() to cmd-db for accelerator type decoding
- Add cmd_db_read_name() for reverse address-to-name lookup so that
  per-cmd output shows the resource name instead of resource address
  (e.g. cx.lvl instead of 0x30000)
- Add callers in rpmh_write() and rpmh_write_batch() timeout paths
- Use pr_err() for the opening banner and error conclusion lines;
  pr_warn() for intermediate register dumps
- Read CMD_MSGID register per command and print resp-required or
  fire-n-forget instead of raw hdr= hex value
- Use CMD_STATUS_{TRIGGERED,ISSUED,COMPL} field descriptions for status
  bit strings: triggered, +sent-to-aoss, +resp-received
- Use DONE/WAITING for irq-sts instead of COMPLETED/PENDING
- Rephrase "Possible lockup in Linux" to
  "IRQ pending at GIC but not handled within timeout"
- Add more details in commit text
- Link to v1: https://lore.kernel.org/linux-arm-msm/1581504972-22632-1-git-send-email-mkshah@codeaurora.org/
---

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (2):
      soc: qcom: cmd-db: export RPMh accelerator type string helper
      soc: qcom: cmd-db: add reverse address-to-name lookup

Raju P.L.S.S.S.N (1):
      soc: qcom: rpmh-rsc: Output debug information from RSC

 drivers/soc/qcom/cmd-db.c        | 65 +++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh-internal.h |  5 +++
 drivers/soc/qcom/rpmh-rsc.c      | 94 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          | 14 +++++-
 include/soc/qcom/cmd-db.h        | 10 +++++
 5 files changed, 186 insertions(+), 2 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260714-rpmh-timeout-debug-v1-785f011ce7e3

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

