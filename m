Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C200943F4D4
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191500; cv=none; b=XxzwSRTaNMf6maVrfGnLmVqta8uolUd1RXm/mG/pay2kfVs0ZT2SuGJy1N9QU4XLN8PImGp3ewfQ5GhF2CcLPJGZInf9KPUtbqIywyRLKfxHSpNmt8X4yZERYqk762KGTp94XQw1tWKmSraz0RAgbxA1hq5IDuPOBK+DnjGb4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191500; c=relaxed/simple;
	bh=Hlf7VSK/qWazQfOke3i7tTTozkSWme1ASg3v22MytQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ExqQ9vLmksfnoULB0bwN4cLT44lKUbrGzS5W2yGbOORkWzXDxM8ZfUZAFljAnbFzyj/gHKRAKuHh6UTN1AG5JI63xgvKhi0MCCLUvtKnhfpy8kYJyt1aenfn2ksi95xBOSzt+nLpGFBSn7KTAPCemzy8FDGfsg/gAsKHLz91WwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFjZZ1Le; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5wgKlXm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFjZZ1Le";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5wgKlXm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xV5r1502661
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6mFgRoJnrSwP4kpPibBGvb
	GsOL3a0TxVGyvh+x5PVnQ=; b=BFjZZ1LeJhM8KkYekV1HRBUW7VHB30HEdzjl9p
	YiI4njOzKiKKRLc6hdQMineH/AjzK+6i5go/oslziYj5tP907lAl/blqQs+Xkgc9
	OFkN0nSZAQsycaC3AXh28ZQbo0AK3NkzG10KOkxDaKpV5S1zmjzZNKY+mzdgwihQ
	Qx7m6wiq2bl/GuD3hT6ExmfzhqdaI/u4k09/yuu9N8wQ74Gbr1vU1OUsSblD0M8R
	FxuA21WrD6SQNGMsAildblzeg9CCZ7hUWf123PZf7omPY6qPOWAv3rKSbEB9ssHS
	WGaW3bVRVGToPiE5/Qc00wwYPLRE87xZ+9TKHr1iN66q5bXw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgysf0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:11:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso1047748a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191497; x=1791796297; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6mFgRoJnrSwP4kpPibBGvbGsOL3a0TxVGyvh+x5PVnQ=;
        b=h5wgKlXm4SkENxMT1/o6yYArQ1r/Etw7s6vZ835U5hP+yHOu8MKUX38AU1wHqxaFrT
         DbOz6CYCOsjvNkIIeEGKc8IvyMsLl4WRHBAioDw87Y0YxQG7IR+9SyX+r6yWrwoiWqSY
         6YZBWS4UUTMWT9KX3zaM+gXfLNJx6aQG7wkTKTsvC1rdaegiwN5b0v/93QJdlQWvIaz2
         jF4MJKIfAcX+gx8p0Wdb3JrRfnZALc2kTtiZ7ikdOzhbV9eSl162Z2G2jap/UWjVtb6G
         raXbj+g/3qfP/mTML6753Y9CCCcRHu033lpsZIMStE4RW8evgfj4B9ilg9VuV47ZClI1
         uOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191497; x=1791796297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6mFgRoJnrSwP4kpPibBGvbGsOL3a0TxVGyvh+x5PVnQ=;
        b=OY7mJ+fHF/XCsyFSjkV/qyhqYgtp7xect/VkJFiRRf04i78dMCfyPjT2EDu28xBptZ
         MtHQA5C9uG/2Y4qD82vkrbmK0SjjJQgyAebW2M2SyPN7s/VzScNo/PUiAMIHvn1S/ZFY
         1vEm8qtE/6nzNHeso7DY4mxX/sggpBYsuU7b0aqztjP843NNMJrpHElXZxxW9q9DQXc2
         IVInFrsg0WhJNX/4fbRJt2UDWzBv8lW89EY9vfmbE6sPFjIUkquSuN1mBE+2CAOr6TnU
         6OtT8d409vQC8wsg6/QzVPcryt67+M1gjcLoRpH644LU5iFkD5X1VMlVoq94T6co70SY
         GBag==
X-Forwarded-Encrypted: i=1; AKwUvBxjx1kjZLl55ZtY9+lM45z2EMnBn14r+v4Q4zxd1tLQAM4PZbkfU7VnG26cGy7WSa0OiJKpNgR8mrwgsWw=@vger.kernel.org
X-Gm-Message-State: AFuF++mLGpbnbdlKw2d8bHEO1+3rQzkXYrDaVWmMTYABjhmNbWySa53Z
	yT54P4v6PJM6R6QHInfusEhBDyq1BtWs2ks18qfmMPympH3ftuKy31LO4OQJcrL5Gr2+G08wBc7
	0A3kFeU6xOSF06TzVEpUw5lGu9Ki4k8wv8Y2GMaBj+tV3eLOmgP/Ht4DkIuf8xC4qPgKQv2uRWj
	A=
X-Gm-Gg: AYBFou2fL8UWdkrAhlzD0xfPvy6zeGcydE6vf/uIjctExrFCR7SW6pnPW7pj6stLyEi
	Pv9gg8lutH1pBCYgLc6rozIVnLhH6fUGglUYCXUMQCwL0bvJ8gnLu3LT54anWZ/K0U4b2yewzH4
	JWPKcA19SsZcloLMjyx3S0oss/K1sH6ojHQ/vuZxS4Yht9AWEBqfX7UIgmNYioW6meOi1ilLuSi
	0yZlF4z1r/zKI1Rae0cwoAJY6xmZ1d74sM5Kez5/UoICjM8A9gP1UgUBCN4x5Iot4iEBPrqje0N
	T1HUkt+fFVUmh//LJkvF8ILfh4sfoowiPoM4SjnOKnkF52GyGH5guzMNdvdKhrDj50NCTXntnRt
	YMTrOxpjTK+Dvjp4Py/l7LitJg3vq
X-Received: by 2002:a05:6a20:748d:b0:3dd:a00a:c5b3 with SMTP id adf61e73a8af0-3e0d6ceb5d0mr6259344637.38.1791191497064;
        Mon, 05 Oct 2026 02:11:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3dd:a00a:c5b3 with SMTP id adf61e73a8af0-3e0d6ceb5d0mr6259316637.38.1791191496588;
        Mon, 05 Oct 2026 02:11:36 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d8ffc38sm497262a12.15.2026.10.05.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:11:36 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Output debug information from RSC
Date: Mon, 05 Oct 2026 14:41:25 +0530
Message-Id: <20261005-rpmh-timeout-debug-v1-v5-0-7b9c457a191c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL1pw2oC/3XNTQ7CIBAF4KsY1tIwQP9ceQ/jgsLUYmxRaInG9
 O5SjXFjN5O85M33niSgtxjIbvMkHqMN1g0p5NsN0Z0aTkitSZlwxgtWgqT+2nd0tD26aaQGm+l
 EI9CyylsGoLFEQdLv1WNr72/3cPzkMDVn1OOCLY3OhtH5x3s48qX33ShXNiKnjFagDMpWm0bWe
 xdCdpvURbu+z9Ihy1QUP6wCvoaJhBWVZkoyo5GLFUz+sBrEGiYThrU0AiUUqOAPNs/zCxrXLrh
 tAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791191492; l=6029;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Hlf7VSK/qWazQfOke3i7tTTozkSWme1ASg3v22MytQY=;
 b=XLQxVmEa/AaDJvl1S5kil0yfEQZtNHO34bV4zcZJzvt6b5xNeQFhXVA/J1PI8eBk/PSz8c9dh
 66ik7fwoZRoAFVmbdu9ZE3wlt8mQ2jXEUScpJJ9nJXx4/EoeQYIniQk
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: dEHYJzumaFUXc50wrm63OlQCT2k_QjTx
X-Proofpoint-ORIG-GUID: dEHYJzumaFUXc50wrm63OlQCT2k_QjTx
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac369c9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=Yhf029J9D-hL87zQiO0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=pioyyrs4ZptJ924tMmac:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXxd6kCt+daLVz
 wr1yBdPQChTTGaaLDahfife0V+FX3y5X7yWDjppDQ6x35Ei/hRarIsf3aleVrl0fnTQ5hnBY3qv
 91JaROBI9bs8Ppot9BSjIiHJ5tKPCCsnz2ZgRqdoE3NqD9958oSTDIaTtevwpG3YVT1H6i50W9O
 M1g46Yk++NZghxyBwwpMTa92E/EftvTArRJznJXA/bBt8aIMwbaaVhcbjb8S3SsVix4rhWBe3q5
 X1xa2qsdR4idNmTJjFTKMhlC18x0BYMAI7mJHiIB0HMPOnegwWOeSTN49LDfq1uWfKGEkkcoX11
 StUq5VEBiTe6XWgVxZ2GDN5fSkThvM3VV3S5J2qfNT8yWbAV7a/aisBHHDu5Slng1slyClOSZL+
 Lrdb4Zm+7CQJMUAUb1LszgsX48IACXZacjblu834YGJ6+uYnR7oH0YGS9XhnETb3KyqWRKhD+bI
 tJwO+KJUc7pd+RXtsQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX8DWWOoNLlux4
 9fomWA0JLkl1rfIU1tL58X4+hPOhF3S4O70vXTOhQoitISy/ZivG21lT92nYhmtiHwYhLg91tCZ
 1KSo7Pc1agYC6DwQ0YNUm/0oHCyBvHY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036

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
  [    0.132108] qcom_rpmh Accelerator(s) at AOSS did not respond

Tested on x1e80100-crd (Snapdragon X Elite CRD) with linux-next
next-20260811.

The v1 of the series is at [1].

[1] https://lore.kernel.org/linux-arm-msm/1581504972-22632-1-git-send-email-mkshah@codeaurora.org/

---
Changes in v5:
- Accumulate AOSS IRQ status across all dumped TCSes instead of
  overwriting it with the status of the last TCS in patch 3.
- Print "unknown" when cmd_db_read_name() fails, avoiding uninitialized
  or stale resource names in patch 3.
- Handle irq_get_irqchip_state() failures in patch 3: print UNKNOWN for
  the GIC pending state, retain the completion status output, and report
  the error code instead of drawing a timeout diagnosis from an invalid
  IRQ status.
- Remove redundant ERROR: prefixes from dev_err() messages in patch 3
  and update the example output accordingly.
- Link to v4: https://patch.msgid.link/20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com

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

 drivers/soc/qcom/cmd-db.c        |  65 +++++++++++++++++++++++++
 drivers/soc/qcom/rpmh-internal.h |   5 ++
 drivers/soc/qcom/rpmh-rsc.c      | 100 +++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          |  14 +++++-
 include/soc/qcom/cmd-db.h        |  10 ++++
 5 files changed, 192 insertions(+), 2 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260714-rpmh-timeout-debug-v1-785f011ce7e3

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

