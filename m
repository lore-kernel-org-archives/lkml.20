Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15163E92A9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304110; cv=none; b=GNy2E3gCQ0MLgF+8HQgq1vOmGLy843xs4MBn0+8SnPF/c9RbiITeRj3fWcc/1h8vbRkiOxb1lEo9jQBAVE7IfsV2Y0ju1Pb2Npx9UpyMIyChmHnUalpXBcyjmGRyEUea21BxcLO5KJy0kMpUFVmnO94qKNMjhx7MTSFWs7Hbcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304110; c=relaxed/simple;
	bh=Awtww+xGbDL+nxVnQEG1cxUG7fthGy19mjWzqfVG5cg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+AyYfqEkQ5RACMajARZysewdfjGFHtcqZ/y6+7M+7HutET0F7nU1i3TyZDtM6MfR6qNEH6IFskaGal8oubqQR5faEpNjBfFRqKeJNkluhlQv9+dBE0lZWjAMU+Epx0LRT9fHZzyDAH7f5uv93Tb3oCR6MUm6YWrLaaaExBwLvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJ/he6kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RN5FWVLq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJ/he6kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RN5FWVLq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DATiNa2609459
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=; b=QJ/he6kSePzEqURb
	PlkZhDq/Mw0Rq7mc32YYsGs0JLMlsLwdG7QuZ4bC0uTkKL7PHqTZYznKc22q+L1j
	BJ2fPD1zD5kGv+kTBO9PUJvNmq33wjjDYgR14XeTwPxPkI0MyZdnJ1h1Ov1tWdgI
	LXsLyu5pIa8Xykclb0v1pliPuhUEBsxKyuJypcWGqukEq7pz1gKimHtqVIyn+d9w
	CL+KLAq48CokQrE8qMHVeAAzFYETjg/dd3fpmdJ2D/y/a93x7zRLOhNhcAEtejVS
	lXgTxJ8bxWTG+h1FZ8Qm6B5M08HMzNmJNs4E8UTx/gPoRN1eJ3J7j+7Ev0rjpiJ9
	TkOf8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ck89e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:55:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so4412330a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789304107; x=1789908907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=;
        b=RN5FWVLqxIubuj9n53DHYO7ChRFUPGftLDwLeA4oagWYW+yjqg6GfpxZOZ7BbVmWp9
         hv+hACBohgo/lui7AbecjjlwcEAUyDAce3UA4r8UoE1+hnpmWrVF0Kd1iL00QIpiQIM+
         w33a0V5/qSdGTRCr5J/IQsoXcSZwJnkb32eZvTMC41xCkpB87hXxep+sFJYEsuI4pdk1
         FzBV3+X6Y3ZTMGEFUoZs+uNG9Zpt57O8rSIbGBy9f8pWWIH+vyTsQIDANOqVONwlsdMR
         oR4WR9OydQ8zT79apTUVfvMYWmEzbmafqjHHDAWr0zXOf2C01qbmgZjn0cEqLMGwcIdx
         +2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789304107; x=1789908907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=;
        b=gEv/e8yHbgjWjvRB4biR9KFdcLAWsUjq15d3/g/44sm4oRSCTPL8un5aqPZQcHtZ5L
         iiZXK5uVuv5ki+xPyrlszW/mHcXB85Zwi+gMznXXuOMz9nPFADKMDFgkJc6mmr83pJNv
         zujikvED8blI+TVPzGFWDK6V8yd9xkTPq5WFgX9V44v0LL3WLXFqSKsUjZjJCYopelog
         qa2fb7EIbwLiubPZ/PxHrXC96FBsmAhvNiJPaUFniYdhQOMS6y8F6cm9dG8u1If+EGcA
         AFZQKq3RMerGq5F7WFwPNsbUTGDrSOlU7liPIekoMI+waV3TIX3Teskk7fpTXXOgY4X/
         5/iA==
X-Forwarded-Encrypted: i=1; AKwUvByJcF6whOCwsmCY9xVzkQdUEY1//kMZFwCeIWK0komRWg3oQQCQ14J6V1X+Dlq8HJfSLYsOo2nGMxkYLqU=@vger.kernel.org
X-Gm-Message-State: AFuF++nTSSnBpHbdTgSAq+yvUO5oVoz2KYc4qsQadQp6Ct+vRPLHC29n
	713EMpVcYJpb3Urpo2mo79j4zZa+X3g4HzG08R8NapEzTWEtC5b0qUnfD8ShBEc43csdDw9RRyM
	rXRvWbP7VDSbGZqsCzB08R/Mz1U1yUMd5UZZjC/Fcawyv2G7vokqK6MLcTMfOB4qNSZc13+Ht9J
	4=
X-Gm-Gg: AYBFou3cl9PqcDBib0aUJ7AgN2CyXioNnT8b1mYW0sU6N2H322U5x3Qw/+6OcJ8xJw3
	cdEGJdv9L4WhFJiDY3S/txA2BMz1Jwa7ffpMhWAThJQIzHPOZo0dIpbrSuYfvWchcwAMfTRod5N
	1ticy1Ew7CjmVRrJ14Va83jx+w4/ZDqIPs3fpjgcAtOiNO4qz5fkEshT5nw4zmeZwSoygwHwNhO
	lZ9NR2HgXUYO74eBiTyVD1BsYN1dYFfwaCpFSyNEhAlsH3+K7y4v2uH0sipNhPt6Yr8zWiOo09t
	Sexn4aN1ViKFI09me+qg8UpoP/Zi7qHAY/muEF9boMeqSrHUyMOrbRejqt6jQ97AnTRXwwxqVqn
	TRZ7/JTVShtA0zuv6x+GigQLb7gmT
X-Received: by 2002:a05:6a20:1604:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3daecac7fc7mr24845478637.0.1789304107330;
        Sun, 13 Sep 2026 05:55:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:1604:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3daecac7fc7mr24845405637.0.1789304106887;
        Sun, 13 Sep 2026 05:55:06 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm18027211c88.1.2026.09.13.05.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:55:06 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 18:24:23 +0530
Subject: [PATCH v4 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-rpmh-timeout-debug-v1-v4-1-e94d3e416ea1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789304099; l=2695;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Awtww+xGbDL+nxVnQEG1cxUG7fthGy19mjWzqfVG5cg=;
 b=OVr+rQ/in0HOwWQo/kZom+aLV8VkNZu+Df1BTO6ImCVLM/MwGUe2C78n15CAcYijW0gnTzVVs
 n0XaYyQcZ6eBgDs8huSIBTCaHUtEwXahVm5RBBYyq0/4xRGl202C3bW
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX5ko6Y7d84n/Z
 EElIAtKhfh9B4IenAh2v6P08cZJmizlFCgsgNupBAKe8Jyi+ZspkxBOkHTQV8g2Uac8sShwWzJx
 p0fyASzl15bwVZnGt7STB7Rn637Ha6nOEMOfXSC6eqmf0i4p9mSZOKiD7GQu45qqBfAphWPhrso
 ZYs2gzKEelaUS7qPyn1eCdlIdtnrPcASYQSMRPJ4C+8TIqbVioWP6TqXzjZbSsIGdBpMMrfO9NX
 GAJcvDoMHoRsX1XA8vp9yZ6KXfufkvLvsJpYACL0uN0GA36CpYecC0KfxFPvm2fd9Vf0Y1EG+nN
 VRaAtZVHDKu+SlJPhJ9qqfPJWb8Wxelgnaimtu+5+6ZywnvwW4tb6iI2xq6S7DC5KXea5VLl4e/
 Ps6n2zA13KmS2iBmTYeg4iWquMEEXdj85BJS993AJM+V4NCmJ0X9kzwFgvDDYkwqW7DTiDoRJNB
 SvbGsoNMyR92x6AJNZg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa69d2b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OEZb8WWwy_IDIPDo1iAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX5ZUfczGjtLVE
 jRmjc4sKe6T7lWDgBhqaJVXFZ7D//astlY3NzcNCJz48dmsAlFP8W2oCZwor0wHlR1rXXFQvn12
 pk20MBkjU/Xs98GdUClqTs005VAzr5Y=
X-Proofpoint-GUID: eGqeurtkaz2V9ADexuu3mpXdRhWCr7UR
X-Proofpoint-ORIG-GUID: eGqeurtkaz2V9ADexuu3mpXdRhWCr7UR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130184

RPMh resource addresses encode the accelerator type (ARC, VRM, BCM)
in bits [19:16], matching the cmd_db_hw_type enum values. Add
cmd_db_hw_type_str() to map an RPMh address to its accelerator type
name string using the existing SLAVE_ID() macro, and export it so
drivers that handle raw RPMh addresses can produce human-readable
diagnostic output without duplicating the address encoding knowledge.

Assisted-by: Claude:claude-sonnet-4-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/cmd-db.c | 20 ++++++++++++++++++++
 include/soc/qcom/cmd-db.h |  5 +++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..117f810d5ca4 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -267,6 +267,26 @@ enum cmd_db_hw_type cmd_db_read_slave_id(const char *id)
 }
 EXPORT_SYMBOL_GPL(cmd_db_read_slave_id);
 
+/**
+ * cmd_db_hw_type_str() - Return the name string for an RPMh accelerator address.
+ * @addr: RPMh resource address whose slave ID encodes the accelerator type.
+ *
+ * Extracts the slave ID from bits [19:16] of @addr and maps it to the
+ * corresponding cmd_db_hw_type name.
+ *
+ * Return: A constant string: "ARC", "VRM", "BCM", or "unknown".
+ */
+const char *cmd_db_hw_type_str(u32 addr)
+{
+	switch (SLAVE_ID(addr)) {
+	case CMD_DB_HW_ARC: return "ARC";
+	case CMD_DB_HW_VRM: return "VRM";
+	case CMD_DB_HW_BCM: return "BCM";
+	default:            return "unknown";
+	}
+}
+EXPORT_SYMBOL_GPL(cmd_db_hw_type_str);
+
 #ifdef CONFIG_DEBUG_FS
 static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 {
diff --git a/include/soc/qcom/cmd-db.h b/include/soc/qcom/cmd-db.h
index 47a6cab75e63..34adc04eac94 100644
--- a/include/soc/qcom/cmd-db.h
+++ b/include/soc/qcom/cmd-db.h
@@ -29,6 +29,8 @@ bool cmd_db_match_resource_addr(u32 addr1, u32 addr2);
 enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id);
 
 int cmd_db_ready(void);
+
+const char *cmd_db_hw_type_str(u32 addr);
 #else
 static inline u32 cmd_db_read_addr(const char *resource_id)
 { return 0; }
@@ -44,5 +46,8 @@ static inline enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id)
 
 static inline int cmd_db_ready(void)
 { return -ENODEV; }
+
+static inline const char *cmd_db_hw_type_str(u32 addr)
+{ return "unknown"; }
 #endif /* CONFIG_QCOM_COMMAND_DB */
 #endif /* __QCOM_COMMAND_DB_H__ */

-- 
2.43.0

