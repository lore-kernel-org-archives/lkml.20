Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794950;
	b=FcsHcebrhp4nf2J1kpMSA9j4yoDY2ZvTBqqSfyQI9qGevTK+u7ahxav44bdHcS96upEt
	 +KYMX9WHWzhR/krCp8RCiO+fyzFqgvcHrlOh4ZWnXbRyGrV4XjH73Fg/+LDSc7ELH1HnK
	 ZsHmgnpRhJOjiBSAXyL3SnU4eo/7dOsxY609yaq1rrIk4kiPcs2cT1HQb28nC5a/j37Zn
	 uCC3SJkZGxDF+pdT6a1vmsVzbS5Zyx2mcSpaUASqnUoyzQhtCJQPCP5T4tGXiu66lkMPq
	 d9aSeeulRHkPPmK/Zw9ycgTUpLQwpyZFyLWeelsTrLVK2FTrlhgt+LiHVncT9kVMdSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=myJojEHzcI6oGYnmcM7yXZgXm5DyuhKS84AxhHDpRYs=;
	b=WyZKHuhc+0FvzFYYCX+NkQqLQeFpsilq7KZpXP0jIU9pQ9MDTjbL/RjbE1mKMhoTSMGX
	 vCqnK9D3OUYxHuwYo3VKmO5aYdAIcOLDDeVuzQt8+hZIIQ9apgVxdAES3WpfMBD/5+fVj
	 6fMsojOHbREQBSRrLEP4KjrFSiB98eDV7aqVwOKhoDuOILoDtAzQtHY8eEmrNcRI0CYBu
	 JhRd5aE2RqXW5hIlelN8NZGd3BUYSKOksiYF7Y4fXTcNU3ztwOgv9lJerQt/SjtTLajzn
	 JDmwjDfQhLlZfBg9XvWDYiuDUrChDWhxuYfz4n8+0phzLhhLYtRgiRKEjPYNBaiAoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWuZy0WG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4A606A32F;
	Wed,  4 Nov 2026 12:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWuZy0WG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtwQ2667770;
	Wed, 4 Nov 2026 12:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=myJojEHzcI6oGYnmcM7yXZgXm5DyuhKS84A
	xhHDpRYs=; b=BWuZy0WGk/akQ+X/CfjvrX8vDFJ/DwcogIJ+BFq6Zohrx83GKcu
	KuRdvMVKa+J7rWHw8Fy7Muh27bOSvmhv4Mli/Wc6g34eFSiy1Jj9QXaPctTJ41KL
	cIcsyS5RofE1AQP3I7ISsU0YUgUn0YK30wwSkSXTJDrh18AwxSeb2Vsn5c5GCvVF
	AQ88Utkz+iVv4eLGCL+hgTz6Q9HU7mHHxWsI7CwXxg0eZ0om94NlAbdWyKFq28zh
	8kNfg09hcMCMval3dI/YQrHTmFaNakxcXWXGBLcYOkuhgNrckq9gxeHJTR1tjoZr
	ZPDjedoLL15iiu/YWGK4y5/EZynKbGBoPcg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pm2kr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:07 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4CM37G2768475;
	Wed, 4 Nov 2026 12:22:03 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4CM2xa2768464
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:02 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 7E8E221577; Wed,  4 Nov 2026 17:52:01 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: [PATCH v7 0/3] Add Qualcomm i3c controller driver support
Date: Wed,  4 Nov 2026 17:51:52 +0530
Message-ID: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX+M1NLBeeOyT/
 WbKwF4pRFUBNrMagU52hT833dKKe7gF60a6aM8xayt9RmzAPpaRv55sQLw3zY3mawuRsPqJVttq
 jL1TFdcyLbAiagfTS1xXyIAYeteGrGZ+wjMO+/7V6YzBlhH52APJ51lUmY3dfvyIpmY7j0ntwlJ
 yOhzwGDpdEqldXdhFJOlKqCai/V1YmzsmfyW0TgqYSCfz+hvzeW0Hf/WuO0zJDzybPyjTZP7bbC
 RwFibePBGCO7brGoMkUkZk4RSgsCBiHZme5YHV4isdL7ByCwMQ4/1Gs6KRpD+As3lM8dxGOYseq
 vCStTpCj0VORKlCfTq4wFFeNTljhQdCES/B8PKr/6A4GGq/+xwMkHTVGuqTHQQqmCf3Yts4cEsF
 eFr7mlgDPGWy5hJjrTOVetZxF1SnyNtLXeffQIBLyYoMZ4+vDbbe+7tiarMzUVOcxnhm9Jfw2aY
 NBF0vtMyJES60eVQtdw==
X-Proofpoint-GUID: QGVOMdY-QkjIpNcQ0VJcC4FbNMqO_YHV
X-Proofpoint-ORIG-GUID: QGVOMdY-QkjIpNcQ0VJcC4FbNMqO_YHV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX7t6ULVE/iOtY
 sKKKou5Es+LrufJMZ6o/e7IsumQ7bdncUK10Co3OzmFZt9tfAUSMi3UZUhqOxBm+BOjkH9t2xmV
 P7F6Q2HqOz11aAqYA0W13wJAxjGeHAI=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb236f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=l8e4rqENZrx62V_qUgAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040049

This patchset adds i3c controller support for the qualcomm's QUPV3 based 
Serial engine (SE) hardware controller. 

The I3C SE(Serial Engine) controller implements I3C master functionality
as defined in the MIPI Specifications for I3C, Version 1.0. 

This patchset was tested on kaanapali MTP device and data transfer has been
tested in I3C SDR mode.

Features tested and supported :
  Standard CCC commands.
  I3C SDR mode private transfers in PIO mode.
  I2C transfers in PIO mode.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
----
Link to V6: https://lore.kernel.org/lkml/20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com/

v6->v7 :
 - Removed inline functions from i3c-qcom-geni.c where unnecessary and changed relevant
   helpers to return error values instead of void so failures can be propagated to callers.
 - Changed priv_xfers() to i3c_xfers() as part of i3c_master_controller_ops latest update.
 - Replaced set_new_addr_slot() and clear_new_addr_slot() with direct set_bit()/clear_bit().
 - Removed unused io.h, of.h, and of_platform.h header files as suggested by Krzysztof.
 - Moved invalid address validation to the caller and made invalid addresses a hard error.
 - Used the tx_depth structure member instead of hard-coding half the FIFO size as 32 bytes.
 - Removed explicit 0 and 1 assignments from enum i3c_bus_phase since they are the default
   enum values.
 - geni_i3c_irq(): Replaced manual FIFO accesses with i3c_readl_fifo() and i3c_writel_fifo().
 - geni_i3c_irq(): Replaced spin_lock() with scoped_guard() and removed the runtime-PM
   mutex lock/unlock helpers in favor of scoped_guard(mutex) at callers.
 - geni_i3c_irq(): Removed goto usage so register clearing and completion handling remain
   outside the scoped lock.
 - geni_i3c_irq(): Kept IRQ clearance after the required interrupt handling instead of
   moving it immediately after reading IRQ status.
 - geni_i3c_perform_daa(): Changed USE_7E handling so it is sent only for the first device.
 - Replaced pm_runtime_enable() with devm_pm_runtime_enable() for device-managed runtime PM.
 - geni_i3c_master_i2c_xfers(): Corrected I2C transfers to use OPEN_DRAIN_MODE instead of
   PUSH_PULL_MODE.
 - Removed attach()/detach() framework callbacks and the unused geni_i3c_i2c_dev_data structure.
 - Kept I3C_ADDR_MASK within the I3C address range instead of the I2C address range definitions.
 - Declared loop variables directly in the for statements.
 - Combined separate bit test and clear operations using __test_and_clear_bit().
 - Removed explicit pm_runtime_mark_last_busy() calls before pm_runtime_put_autosuspend().
 - Removed unnecessary fallthrough statements from the CCC switch in senc_ccc_cmd().
 - Removed explicit NULL initializers and retained only implemented callbacks.
 - Replaced mutex_init() with devm_mutex_init() and propagated its return value.
 - Simplified the probe resource-on/resource-off flow around geni_i3c_hw_init().
 - Used devm_add_action_or_reset() with a helper to unregister the I3C master during probe
   cleanup, allowing geni_i3c_remove() to be removed.
 - Replaced SET_RUNTIME_PM_OPS() with the newer DEFINE_RUNTIME_DEV_PM_OPS() runtime-PM macro.
 - Updated [PATCH v6 2/3] commit log to clarify that the driver does not currently support IBI.
 - dt-bindings: Fixed the unevaluated-properties validation error caused by the unexpected
   clock-names property.
 - dt-bindings: Simplified the commit message and clarified the Qualcomm I3C controller
   description.
 - dt-bindings: Updated qcom,geni-se.yaml to document the Qualcomm I3C controller as a
   valid GENI SE child node.
 - dt-bindings: Added IBI controller/hardware details to complete the hardware description.
 - dt-bindings: Removed Rob's Reviewed-by tag due to above binding changes.

Link to V5: https://lore.kernel.org/all/20250420081530.2708238-1-quic_msavaliy@quicinc.com/
v5->v6 :
 - Cleaned up with the alignment and Addressed comments from Alok.
 - Kconfig change - Do not Depends on I3C. Follow same as other i3c controller drivers.
 - Probe : Do not set PM to active state as controller is not initialized yet.
 - Updated email domain from quicinc.com to oss.qualcomm.com.

Link to V4: https://lore.kernel.org/all/20250411113516.87958-1-quic_msavaliy@quicinc.com/
v4->v5:
 - Define macros value in lower case hex.
 - Removed unused macro SLV_ADDR_SHFT.
 - Used FIELD_PREP to write command into M_PARAM and removed CCC_HDR_CMD_SHFT macro.
 - Include units.h headerfile and use xHZ macros instead of local defined macro.
 - Changed PACKING_BYTES_PW to PACKING_BYTES_PER_WORD.
 - I3C_ADDR_MASK : Use I2C_ADDR_MASK instead of local define and maintain i3c purpose.
 - geni_i3c_clk_map: converted array initializations for frequency mapping as per C99 standard.
 - Removed bus NULL pointer check from geni_i3c_clk_map_idx() as it's not possible to NULL there.
 - inline functions set_new_addr_slot(), clear_new_addr_slot() and is_new_addr_slot_set().
 - geni_i3c_handle_err() : Added line space after each condition and removed %s from string print.
 - geni_i3c_irq() : Used hardcoded value 4 for sizeof(u32 val).
 - geni_i3c_irq() : simplified condition check and alignment with new variable fifo_read_status.
 - _i3c_geni_execute_command() : Reversed if and else block for natural positive look.
 - geni_i3c_perform_daa() : DCR, BCR, PID - used GENMASK and FIELD_PREP instead of manual shift.
 - geni_i3c_perform_daa() : Used parity8() function to simplify and add a comment for readability.

Link to V3: https://lore.kernel.org/lkml/20250403134644.3935983-1-quic_msavaliy@quicinc.com/T/
v3->v4:
 - Dropped "clock-names" property from dt-bindings as suggested by krzysztof.
 - Makefile: Correct order sequence for i3c-qcom-geni.c.
 - Indentation corrected around print statement.
 - geni_i3c_probe() : Exit with return 0 instead of ret for success.
 - Added sparse annotations around i3c_geni_runtime_get_mutex_lock()/_unlock().

Link to V2: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250326141641.3471906-1-quic_msavaliy@quicinc.com/
v2 -> v3:
 - Removed "master" word from compatible and dt-bindings filename.
 - Changed compatible qcom,i3c-master to qcom,geni-i3c.
 - Renamed qcom,i3c-master.yaml to qcom,geni-i3c.yaml matchin to compatible name.
 - Removed const from compatible property from yaml.
 - Changed driver file name from qcom-i3c-master.c to i3c-qcom-geni.c.
 - Changed Kconfig and Makefile accordingly as per driver filename changes.
 - Changed se-clk to se inside devm_clk_get(&pdev->dev, "se-clk").
 - Removed "se-clock-frequency" read from DTSI and fixed frequency within driver.

Link to V1: https://lore.kernel.org/lkml/20250205143109.2955321-1-quic_msavaliy@quicinc.com/
v1-> v2 :
 - Removed bindings word from subject title of dt-bindings patch.
 - Use Controller name instead of Master as per MIPI alliance guidance and updated title.
 - Added description field for the i3c master into dt-bindings.
 - Changed title to "Qualcomm Geni based QUP I3C Controller".
 - Changed compatible to "qcom,i3c-master" matching dt-binding file and driver.
 - Changed "interrupts-extended" property to "interrupts" as suggested by krzysztof.
 - Dropped reg, clock minItems and added maxItems similar to other dt-bindings.
 - Removed clock-names property from dt-bindings suggested by Krzysztof, Bjorn.
 - Set "se-clock-frequency"  set it within drivers as suggested by Rob.
 - Removed "dfs-index" property and manage it within driver as suggested by Rob.
 - Removed "interrupts" maxItems as we need only 1 interrupt in this change.
 - Added comment for mutex lock mentioning purpose in sruct geni_i3c_dev .
 - Return with dev_err_probe() instead of error log and then return -ENXIO from probe().
 - Removed dev_dbg(&pdev->dev, "Geni I3C probed\n") print log as suggested by krzysztof.
 - Removed CONFIG_PM and else part around runtime PM operations following other drivers.
 - Removed Module alias MODULE_ALIAS("platform:geni_i3c_master").
 - Replaced MASTER with GENI in the Title of MAINTAINER file.
 - Removed duplications from the commit log and removed unwanted statement.
 - Formatted license and copyright similar to other files.
 - Removed SLV_ADDR_MSK and used FIELD_PREP/FIELD_GET instead of local bit shifting operations.
 - Used direct bit positions for each internal Error bit of DM_I3C_CB_ERR.
 - Removed Unused SLV_ADDR_MSK and added SLAVE_ADDR_MASK as GENMASK(15,9).
 - Renamed spinlock as irq_lock.
 - Removed dfs_idx from geni_i3c_dev and made it local inside qcom_geni_i3c_conf().
 - Use boolean cur_is_write instead of enum i3c_trans_dir/gi3c->cur_rnw.
 - Used DECLARE_BITMAP and related set/clear_bit APIs instead of manual operation.
 - Inline the error messages from geni_i3c_err_log directly to improve readability
   and avoid unnecessary jumps caused by the geni_i3c_err_code enum.
 - Converted clk_src_freq of struct geni_i3c_clk_settings to HZ.
 - Removed unwanted debug logs from geni_i3c_clk_map_idx().
 - clk_od_fld and itr renamed to clk_od_idx and clk_idx respectively to map actual usage.
 - Added se-clock-frequency to be read from DTSI, if none, then default to 100MHz source.
 - Changed Error log during bus_init() if OD and PP mode frequencies avaiable or not.
 - Used FIELD_PREP and standard BIT operations inside qcom_geni_i3c_conf() instead manual shifting.
 - Removed unnecessary parentheses from geni_i3c_irq().
 - Moved geni_se_abort_m_cmd() implementation to a new helper function geni_i3c_abort_xfer().
 - Removed unwanted reinitialization of cur_len, cur_idx, cur_rnw from _i3c_geni_execute_command().
 - Removed dev_dbg logs which were meant for developmental debug purpose.
 - Removed unnecessary check nxfers <= 0 from geni_i3c_master_priv_xfers().
 - Replaced devm_kzalloc() by kzalloc() inside geni_i3c_master_attach_i2c_dev() to use
   kfree() from counter function geni_i3c_master_detach_i2c_dev().
 - Replaced devm_kzalloc() by kzalloc() inside geni_i3c_master_attach_i3c_dev() to use
   kfree() from counter function geni_i3c_master_detach_i3c_dev().   
 - Removed geni_i3c_master_reattach_i3c_dev() function as default returns 0.
 - Removed goto label from geni_i3c_master_bus_init() by reorganizing internal code.
   Also used i3c_geni_runtime_get_mutex_lock()/unlock() instead of get_sync() similar to other places.
 - Added indent to fallthrough for switch cases inside geni_i3c_master_supports_ccc_cmd().
 - Renamed i3c_geni_rsrcs_init() to i3c_geni_resources_init().
 - Changed devm_ioremap_resource() to devm_platform_ioremap_resource(), removed platform_get_resource().
 - Replaced dev_err() with dev_err_probe() for core clock named se-clk.
 - Removed development debug prints for votings from gi3c->se.icc_paths.
 - Probe(): Changed all dev_err() to dev_error_probe() with proper log messages.
 - Probe(): Moved static resource allocation immediately after gi3c object allocation.
 - Probe(): Disabled PM if i3c master registration fails during probe().
 - Remove(): Unregister master first and then added Disable of PM as opposite to probe().
 - Removed I3C_CCC_ENTHDR support as it's not supported.

---

Mukesh Kumar Savaliya (3):
  dt-bindings: i3c: Add support for Qualcomm I3C controller
  i3c: master: Add Qualcomm I3C controller driver
  MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver

 .../bindings/i3c/qcom,geni-i3c.yaml           |  115 ++
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |   12 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/i3c-qcom-geni.c            | 1133 +++++++++++++++++
 5 files changed, 1269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
 create mode 100644 drivers/i3c/master/i3c-qcom-geni.c

-- 
2.43.0

