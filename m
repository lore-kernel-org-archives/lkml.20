Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4AB3E95A4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304114; cv=none; b=R3zuorKJLA+g4LYWCU/xcEyi/vpvg+oV+XEAOBMCHmmy8nqGPA/mzil0NhrBBq3zqBJvEYhXTTXNbmMtpn9Fog9LI9fE1jGu/33VYQGXhiVplWZAbiXKToYm/aNFHN0ZRaLSRONJUJLW/Rhq1Mr2xiE3MknYf1Y4zvdWMPScW9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304114; c=relaxed/simple;
	bh=b4WvXQ0COzU5NuxznFesN5SzpLiS/QR0/NbsHm44HGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cj/0p/CJTlxGm+ENjD1KbkQvxJkVNvHLNV1EM1ByIjvkQ3K8Db+WE0+b2LHIiBLF4Gx44yN8qXhbWQGGoFjnF/AyauU5GD8PTny0U3embsdgY/fpF4t+Fr3zaPMQi6M9GS3/7Z/R5M17YQdqKM0zEWzm9Zyvg/n4090F+UGWR5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SC2PsqHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPSLC6sl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SC2PsqHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPSLC6sl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DATv7j2052422
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0hFYEAWjOWGQHPFsazn/kZWAVEinVYrYfd3wwodbro=; b=SC2PsqHHnLaMuvwf
	PLmaSh6zSDYpZWaf9obxxFU+qkQlMCbWy37qkvj8pfgZ8sUNC76bCx84R//pAemE
	bkqh7BafYiQCk7ApDaw1U1bQ0bnF3WmnlSjyOoRHF5aWHtEr8MX7sbfK7EnSJ8HL
	Wk7IFDdSctVginJEPy35LcyuXjnzJAGzQFgGTb0WMm8Me2HLdTHUzBcAHlY5Xbwi
	H33k5ruhDsGZjMPFQjc3cdDRvrU67nwEPKMWZt+lahMR5Wfxodr8CpQfjZn79tgl
	8qjOtkD8prwBnPG1qJ4xq3/w7df4q+pvlR5/5ayOg+kyaiX62syUzuN9QsrJB/dE
	OK/ivg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dk8np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b10so2974258a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789304111; x=1789908911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0hFYEAWjOWGQHPFsazn/kZWAVEinVYrYfd3wwodbro=;
        b=YPSLC6slC/hk2avEjT+f5avIuDW/iPKymxxev+C5HAKcRQFzWJZUkYvxJP/efp0k73
         /h0sdFEgsi3ZdbkJr+D4D4JW+qUKRg0eRHy7DBp6BUeaVLOpT+DNbM1jnZuajtOdsnEK
         fwx2gB4LR11rcIrazLsF7kH7NsD6MwWgyKy1FR+1pF8NbZHWjXmpuytQF1SzUQi5EEa9
         2rXqvbTWSsz9Seu89oMyICbiEZ3g4avLjhoI9dCJvnZOSFm20TF9NL56hEqknVBUJcOE
         +BDWqXR97ehCISTIm2zBKboaIQhfSvivhxg3XOV3mIJUCucNQJTGkzBzh5KPvvy6K7H/
         Nf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789304111; x=1789908911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0hFYEAWjOWGQHPFsazn/kZWAVEinVYrYfd3wwodbro=;
        b=STmkskRwoVO3jwm8bUDnkvs8mivGkae5Ycfq0bANyf+v0AIJuVyE12eqT54p+5Nx/z
         wErpOrTMKPoOoC5IhV5WwLv/uh44Mho10aHaDINvwwJtgu5LtlQpcRFDQQzzZU4maVy9
         P1yZTPDrR3KnQkbRbVaGi2CqmkPcqTseL5TNr6XlnqAKayH9SlqbjDUvLUWPVxTDBo/8
         x4N135e15OZMBM7MxfoqVDx7d3qJJiPV1uhBqihpbNWffmJUdOOPPoSNX1EagSYwo3jJ
         pXf0g2IOqcPYF2SJn20I6Zd+OVej7CruMoO528926Gc0a49FE4BvQqTDGqTsijku3ItV
         UpMA==
X-Forwarded-Encrypted: i=1; AKwUvByh/RTYj+lvMFyQYKah8RSAKgtUrD3QYrlHzc5Ei8RJYST5yyT8cannkg+Cp0m719phZfxTdhM38xkEMsw=@vger.kernel.org
X-Gm-Message-State: AFuF++kO9Ug/JIr/EfV23mKG+HETVNdjbepipWhGWWdV4kiG0ZWB5saf
	bsMuVGb9hX2DxwTCQQYcmvCmEkSjZPfuLMzB1FB0o+YOMEVOThhgiKJfuGrZ8mXDupNIJg+FznS
	w250wK5cxb/+5DmT2bE/mySbZLQ7gSPvVxYDkazQW8sL+GqFYkqOjS1FxtIhduE4niPHNF37y3P
	I=
X-Gm-Gg: AYBFou2Bchc/va/qGINpcYDd9TdF8VoZrcPf5dyRYKDEl9kC5kkyNXIrcnklx3taQlp
	rZ4wyN9U+HX71qWvX31nDqsSoDQBa386k33uj/UVDi+8Dr+xeG82GWuxHxtvGmnmT47J8llDvQI
	6S+VZH1+aBmndRQQguOFlrnPUacIyLH9CusU+7zeQCt2ADc4ijRI8qOujA/FZFj0G3tp40Y1XKS
	SLaZ/aeJtxU0VZqY/D2AxYb4PkN0Lgn23U5U/4dVbMuS6pRoiSMpIjtAUKdHMyNgtFcdGv883uj
	xZwiWN41/lqmSIdX3+9Z6nxq4s+ZbzvE6YQYuHI7yfeTIr55MPAVkqalzb/A41abfBisospoT+n
	yRA8PDjoecRUOE97RxLPHqc1wU98v
X-Received: by 2002:a17:90b:4b0e:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dbc725258mr12039424a91.24.1789304111046;
        Sun, 13 Sep 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dbc725258mr12039378a91.24.1789304110584;
        Sun, 13 Sep 2026 05:55:10 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm18027211c88.1.2026.09.13.05.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:55:10 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 18:24:24 +0530
Subject: [PATCH v4 2/3] soc: qcom: cmd-db: add reverse address-to-name
 lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-rpmh-timeout-debug-v1-v4-2-e94d3e416ea1@oss.qualcomm.com>
References: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
In-Reply-To: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789304099; l=4138;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=b4WvXQ0COzU5NuxznFesN5SzpLiS/QR0/NbsHm44HGs=;
 b=Cc5Sja+aTPwWi65l/aZyiEwZjmyztQcVSGwtmcgkx9mRbWt6IXaagbCcjjCvjgIV94TfXpL9H
 mGFMMVmIgO3BTD/wrsrSop+MJHQzvvoOLhpwezfFvl4JettIP6Sirf+
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: fY2wkepukoGQ_Heayok5jw9DbQfQgvmK
X-Proofpoint-ORIG-GUID: fY2wkepukoGQ_Heayok5jw9DbQfQgvmK
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa69d30 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7Q9v_upN9S1qH8PsicYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX3JCZzPoQDMyc
 yrtgE7+ko25IK3TFBfbaGVBSBALlwY6GLrWbmOLXaRh+8F7iBrMxfgxzR4iHNnOPnM3ACKj46DK
 nCPOMm3GkV71ZnClS677uaOaWCtcZ/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX3gIDv/v5gtik
 7p7tDKBxepYUQR0ooxoAh1AXA9CoEA32mPaf7E1VVKGo/WBQAki81bjC7nRgFtRwmNZ5uO5Xt43
 jkDE3JfgUDWdwv3es9eSEtoBF/H9fTXUnE3jSkike4D2XxfvgYRNcbIjMOy/MepRtIp32z7h2SN
 PlBuCQdHM21D/wjp8m4P1zP5Gf9UsrXWP50BGKdmZkFtX+3LcMPP6aaR8ihUIgUOuxejruPJcmi
 aePyVF6s0VQ5R0lDYAJ+PKjixzgqDd2Qev+C+06sJ88PC1HP6GMEgj3w99BYvpa3MuKPutkqSjF
 3pUquWJ8SEE/gYR9OviEwkNReLh320zsCYmNoaNJh6j1YC3DDMI5/uF03G5x6C0CKGvKfZM/E5+
 27ZVX0RlEAAHIU0DYlr0sv/XEmuBTKXYkcTS1huEHEA79sOh+FRK6zYlqcC2O6BVR/CwYfAvAsw
 0cCl2o0qw4hJ+Yx3k0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130184

RPMh resource addresses are opaque 32-bit values. While the slave ID
in bits [19:16] identifies the accelerator type (ARC/VRM/BCM), the
lower bits encode a resource index that is only meaningful when mapped
back to the human-readable resource name stored in the command DB
(e.g. 0x30000 -> cx.lvl).

Add cmd_db_read_name() to perform this reverse lookup by iterating
the command DB entries and matching on address. Unlike other exported
cmd-db APIs which go through cmd_db_get_header() (which calls
cmd_db_ready() internally), this function iterates cmd_db_header
directly for address matching, so it calls cmd_db_ready() itself.

For VRM resources,
which have up to 4 contiguous 4-byte-aligned addresses per resource,
the match uses VRM_ADDR() on bits [19:4] so that any sub-address
(enable, voltage, mode, headroom) resolves to the same resource name.

Also export CMD_DB_ID_SIZE so callers can size their name buffers
correctly without open-coding the magic constant 8.

Assisted-by: Claude:claude-sonnet-4-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/cmd-db.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/cmd-db.h |  5 +++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 117f810d5ca4..e1453b194aa3 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -287,6 +287,51 @@ const char *cmd_db_hw_type_str(u32 addr)
 }
 EXPORT_SYMBOL_GPL(cmd_db_hw_type_str);
 
+/**
+ * cmd_db_read_name() - Look up the resource name for a given RPMh address.
+ * @addr:  RPMh resource address to reverse-look up.
+ * @buf:   Output buffer to write the resource name into.
+ * @len:   Size of @buf; must be at least CMD_DB_ID_SIZE + 1.
+ *
+ * Iterates the command DB to find the entry whose address matches @addr.
+ * For VRM resources, which have up to 4 contiguous 4-byte-aligned addresses
+ * per resource, the match is performed on bits [19:4] so that any of the
+ * sub-addresses resolve to the same resource name.
+ *
+ * Return: 0 on success, -ENODEV if not found or DB not ready.
+ */
+int cmd_db_read_name(u32 addr, char *buf, size_t len)
+{
+	const struct rsc_hdr *rsc_hdr;
+	const struct entry_header *ent;
+	int ret, i, j;
+
+	ret = cmd_db_ready();
+	if (ret)
+		return ret;
+
+	for (i = 0; i < MAX_SLV_ID; i++) {
+		rsc_hdr = &cmd_db_header->header[i];
+		if (!rsc_hdr->slv_id)
+			break;
+
+		ent = rsc_to_entry_header(rsc_hdr);
+		for (j = 0; j < le16_to_cpu(rsc_hdr->cnt); j++, ent++) {
+			u32 ent_addr = le32_to_cpu(ent->addr);
+
+			if (cmd_db_match_resource_addr(ent_addr, addr)) {
+				snprintf(buf, len, "%.*s",
+					 (int)strnlen(ent->id, sizeof(ent->id)),
+					 ent->id);
+				return 0;
+			}
+		}
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(cmd_db_read_name);
+
 #ifdef CONFIG_DEBUG_FS
 static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 {
diff --git a/include/soc/qcom/cmd-db.h b/include/soc/qcom/cmd-db.h
index 34adc04eac94..d03d64f3407d 100644
--- a/include/soc/qcom/cmd-db.h
+++ b/include/soc/qcom/cmd-db.h
@@ -9,6 +9,8 @@
 
 #include <linux/err.h>
 
+#define CMD_DB_ID_SIZE		8
+
 enum cmd_db_hw_type {
 	CMD_DB_HW_INVALID = 0,
 	CMD_DB_HW_MIN     = 3,
@@ -31,6 +33,7 @@ enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id);
 int cmd_db_ready(void);
 
 const char *cmd_db_hw_type_str(u32 addr);
+int cmd_db_read_name(u32 addr, char *buf, size_t len);
 #else
 static inline u32 cmd_db_read_addr(const char *resource_id)
 { return 0; }
@@ -49,5 +52,7 @@ static inline int cmd_db_ready(void)
 
 static inline const char *cmd_db_hw_type_str(u32 addr)
 { return "unknown"; }
+static inline int cmd_db_read_name(u32 addr, char *buf, size_t len)
+{ return -ENODEV; }
 #endif /* CONFIG_QCOM_COMMAND_DB */
 #endif /* __QCOM_COMMAND_DB_H__ */

-- 
2.43.0

