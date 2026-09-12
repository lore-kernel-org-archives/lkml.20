Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743503EF0D7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253591; cv=none; b=RxbGC6zOIU7ORuXBzAG1A/Xl791e53rmRxpswo2rI1e8d3yGhRD4ezAQWGjozOUIixaa4KeEmQJUzVpXDI3SqXZrcHNAXG40KJmVeRQNLlNFs+cnNp9f4uvTFX1nmqTX2rqP48suaY2/2vraptTGs0DiAEh0HSsSbFl7VNDcCcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253591; c=relaxed/simple;
	bh=3WiTeifuqmMeArbH1dtfZ7piLUat0wFfmRGWAJmbbCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o2dN43pxtplK07k7mAWpjddtBqlTGxR7YIpM1+ZbUMXxVApA5mhtTDiUho6xJepHG1sOK7znwfknpW42Li4WBc7s9sxOiYr6UhcgAm7IvdcRDF0LcweJQZTglh9JlqE1W7hmlGr7xOW7V8L/iw3rdhF5+XpRk4e/xExnlZ1M9NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHnKbCvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFAPlxw5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHnKbCvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFAPlxw5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnUsD3672995
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U2yiW6/w/O3
	YW3IoJI1OCamD5OwPHelC5r8nyjpV8WA=; b=LHnKbCvbc4kV9j7uaKOmM+o0uGh
	63M9osBslA+A3JwrhnUFtBp/gU/KKY1/HpwB2WXSqqDb72F8kwAvTBHIDqS1oUqY
	gVGU/kX7zBwH1BPSq66pWUnhI7QFLNZyw+L2ChKGCgcj86qBF5MnCRE2bex4LydG
	/QAbKJFPpXtMl801AxOxKy1aAsAD3fMaUl1nB3HyVn3sgtkQAnacF4BcbTKhRu/Q
	b+EYaZ36gNPZY7fQZtruis554+KEZpCoRS+3siwJyGCdTl0jq12xfsIVQ8BpdpQM
	XD0yB50qEodtk/2MDCMS34kF/TITSSLmkzV+xrOQVCpKST97tIT+LyPTuPA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd2360-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39db5b5f98bso2124188a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253587; x=1789858387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2yiW6/w/O3YW3IoJI1OCamD5OwPHelC5r8nyjpV8WA=;
        b=jFAPlxw5cuN8oB1oTogTqwKwMK34/340R3n5UXsNufKY4zVPIdtt9wzyVf+eUOUMu0
         znIv9j2eSO//DGydBAeHf+enSTEjuoo5JHedWnnE9HONtK+zkqxmXJchQGkw6efWR1V8
         AgAKRp9plbgCJpBHq6Jym1mhN7xusZeOXj2Bskkj1z3Hj9bY3F9ePOX/KSUp5HqPA4I0
         4sX38ORwVqMf9OQYIzveFFHsGZ5crTDaVPvTgIfK4ZUO5T+ERIfaZ19adhP/dVlG0GKW
         ZU0Fe49/okDhVBbM48hosBDwCHYP3pvBoe163BZhxl11YldpMbemjH+QBbOstRqlAfoP
         J1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253587; x=1789858387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2yiW6/w/O3YW3IoJI1OCamD5OwPHelC5r8nyjpV8WA=;
        b=Bog3GVzpWWlKyLDVSmwdycrC6J+tEIn0lZ1eNTvHjHFS9sqdCPhZW7IOyzolbbb3Kz
         +0BgRlk8auvdnCS4T2nQGhqnVWPggwmLlQ6B043kGJXvNRaxKu6kgD/ljGDpqrT4t53r
         1/h48WGDyXCYedykuOZEgys0knQRCgvIHETQ6PfJJreTkJ9XmuC0fSpRp614cPMiWsrP
         p9KBnj3eXQDnY/73qigLDxlzTnsSpSWLw/YhGDBDY1GaUMS5g4SgUXqAuUMguT/yHhJj
         NchjZM1koTs5Bxl/d9oZ+2luVoTFg578seMpXg3rolYlFeel2FEVvdknonmhQeA4jKjI
         ExMg==
X-Forwarded-Encrypted: i=1; AKwUvBz4xS2XE4NKyNc+qbrxSMcsYFEXRS7RtfLi720dzaQUD+1OsLImfIZ7+ePH6/G1PyGCPzXP15nhoK3JQf4=@vger.kernel.org
X-Gm-Message-State: AFuF++nX98GVobR1iV1b2tOm3YgJm00zwWqMDE+0m2e+k4Vkg61vtJ61
	hOIQKET0hV6KglqeeU8d9GSsGvPTJ8eBvRJDNe6S4CVQJxoQI0MbBexx2CyFy6r0YYHhP+mSHjC
	5Wtiml/w2mx6EBSonofPwt9GN3Pcj8Y7dScu7I/EKtmAZPKgqPlvBkJZL5M0+nnhLlkY=
X-Gm-Gg: AYBFou3ZwuJOaTvPd8R946vQkAVjTGUY6gBV226E9puXEpeipHV5g8XDM/DGiWbKSJ3
	l/zobzW5HAi6W+2W4X/wIgC8jOIShrnNQmlN1LO893jfAoAoU5G5DQwD/tI5Cb11vQSgiJcQ1b0
	92mYzIgLtSLtEqFuJqgI0puLY+mDd+Em87BMA+MRIqNVo0hxFD11mOM0pZw/EGmOxvCEJy6xTbk
	Moz/d9OyMhHGcYdDY9ypEw/xBRU18jLVm/L1RR7zk27c6Q0HsRszaXw2jWGitgDbajB7uTJ/1uc
	C2x/FzPA5vCxJr2RuXRRlF4hoM2BjCZXbSWWUjEGYtvFDdZ44wd2aw6B2WpeqFiVL2HPcmxmKPJ
	9mWhl+i3o/JFLgs5odLZJlvIKl94STr/+CGrLv7VXa9eQpH6XBoydtQ==
X-Received: by 2002:a17:90a:10d6:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dcbb1cadbmr2556069a91.18.1789253587034;
        Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
X-Received: by 2002:a17:90a:10d6:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dcbb1cadbmr2556052a91.18.1789253586568;
        Sat, 12 Sep 2026 15:53:06 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 2/8] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Sat, 12 Sep 2026 15:52:55 -0700
Message-Id: <20260912225301.3396556-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5d7d3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX8gxu516FMimm
 D9VU+1zNDgADlIjan4gm2ykEr+YOAYEqDFk1jX7eUGp1uu+G1agfCqauLETfsqoM4QDAx9Z20B8
 Ewr9JuJv0yjthZ0Y1iOGw2Hq1JdWS0aM2N3S+si/IHSVWXx7pk5b1aXhVJ8bVkqYgw2AjvmaXA3
 wdz932qtmR9wbbrStssjEBP/IPpNX2CITPCRfvattTxm2Z1RHJ/xEI7GcEZ1t0b05P38x1Qnpcp
 muzc5SBx2OsO1G36DtJ2aiNpIKHYZ3k5TQ/opUoJc8gbHCrr+OxCIktgmtZITGzPTDdIB19Szqi
 l6RHqZfSyUq6UOFHG3tn5+OO0k8WNvr2Nvxo1czxW++8g0mgIlRfFvoB7WtO/Hv9NBJA3lG4aHj
 KwbiflHFUYFNTumQJRnEi/mpGdeN21SuC7VMyGcYM5ykgSUj9X3bufj6pMOraGiWlWol//gvIwc
 DfkPqw58swf+qkdnMnA==
X-Proofpoint-ORIG-GUID: p9XvmfM4d--iAvsu3gnQlhMcwPC4-dyy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX5NxE61z28QBL
 +o0F9GnNjUyRTQN5EqD4M4IG3qHNReaaigDpqTMoHtJxXulOJNLo2rpDtKC5oZ9DTustyX5VF9r
 TSWFce8nXeFAvh5xJ6Bqq1VHRBLs0Eo=
X-Proofpoint-GUID: p9XvmfM4d--iAvsu3gnQlhMcwPC4-dyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 39 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..fb927a003596 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,21 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  primary   - Primary USB port
+		  secondary - Secondary USB port
+
+		Writing any other value returns -EINVAL.
+
+		The attribute is writable only while EUD is disabled.
+		Writing it while EUD is enabled returns -EBUSY. Reading
+		the attribute returns the currently selected USB port.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index a7b9ed4ac071..d32d382a311e 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,14 +23,22 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
 
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
@@ -40,6 +48,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +113,38 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);
+}
+
+static ssize_t port_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	int port;
+
+	port = sysfs_match_string(eud_port_names, buf);
+	if (port < 0)
+		return port;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled)
+		return -EBUSY;
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
-- 
2.34.1

