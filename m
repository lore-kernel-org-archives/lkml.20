Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB6A4ED1BD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717723; cv=none; b=F1AVxy4LcJiiKfpdPV8Ob5Hu0MnYv5Djiedbv37S3o+uQyJnHOmw0qo0ywuEc98SastEHtrzOdnO/VtpCynX1mBNeiFrm6HIl8iA5RbwRWRPdfh0ulQB85zjp0+mxAFfRe4NtvfiYo3eH+lrEDFTbL9RqWH0qTz0gYfRjt7GQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717723; c=relaxed/simple;
	bh=RgpScOi/jTx0NmjvnxrAqWvzEjBwpYvY7JrWqQ+DP7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IzkqtdmSThPfNjf8wRXjOnjnrmwXhCJNFXLIaRcf8IDpDWl+a49+d41NVOTQW/31QhgRiEEy7hwUQLr3/4P0YnnPD9d/cMzynso7o75WTq59kxlpWHnMXAknEielfrKVxB3lcF42xzpQfMRTrDYNRhuvfFR3uBoZamXRmIfbe/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tr0V8xdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLUPJMH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tr0V8xdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLUPJMH0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THiSCc1275904
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HnypzRX9jY9
	YKeCtZsbOHSIQENZPHY0b36j/Ve8BaVM=; b=Tr0V8xdmtftva82Ku4YcQA70YF/
	viSju3XE6Us2hF3qrm8mWeVR5ytd9tEB5oWY3AeBBSTb2zwu/PSt8Ex/4fihdSTH
	wnqLzMhiW1v6a9lszQN1T57CXidFXJ6a1EHbxSSTZHvSpFJ7XLroPENyEPSWPs0K
	I7rhBB2kbs46zQZTByJdLY83USgDOVItt6zJ9V7ZRBLBWAJrSGcOIS89RqkFctul
	ECmTPNk7qiMa6YD1F8fffPUuBLZRYwk0ggGMP0HLMNalYliqD9ZURXvajf+4uCpU
	Hq1PBPwc24E8JOnKxy2KBnMvXvBXkgEUqz5nWIFz9/57SNYC8cehHagkjKQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j0egwsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34318e88ba2so3599324eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717719; x=1791322519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnypzRX9jY9YKeCtZsbOHSIQENZPHY0b36j/Ve8BaVM=;
        b=VLUPJMH0LzW8FD/rGkms++yok41/xxbDQZbr5qIiHhiHHc5Qj2ksVacxN3OH51GKuB
         8XSlscvlf0SY6RgI9Z6k5ZZkKtf93TiyqGs7AXhbf4t2/pceZbkm+z3PwNz8WApDnSYX
         wvVCirRb7mCuD8qrBPHxuqEUl7Ydm1DogHVGHuT8wyUSy7+cBCZZuYBI+XOo54M48B+l
         9egs70Z9V3xgKhJs8MCS74uy7d03brPfYDZ1Usa2krJGJchz3VKTjX73GkHgir48NvWn
         yPrtNOk17Xem7y0/oIfMedXEP/3g027MwTF4SLn7IW7l5aGQ+x15q7DxuzW1QH/qp0yu
         8nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717719; x=1791322519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnypzRX9jY9YKeCtZsbOHSIQENZPHY0b36j/Ve8BaVM=;
        b=Zn2uDf+Pug1aELgnjXEJxU7ZwzyPmokhnHklbKvJpK9F+RJpYppLp5XwopobFre+0m
         Ml/cYznZ5xWovV1WoDQTYNxAw9ME5ncIyIequ/MECfQ1IlGFy2YhMPfGjmiodjI9cp7G
         W3mrqEHd/MqyWFCjc8fgV4bktOaVGFAmbQ7jSUhMGIczaGZZVvoh1BiuCEo8Xzl4BAH5
         W3un2HJxs7lMdpOQew+ei4+oZR2pNClx9H7KO8E1HXXR2QH/qSpSuFY7VU6OkWm3D4WH
         JmQ79IXo/lAocWPNsAHsw0XcQ01d+0elcQtiz5IDw4QDecCv/PaejfxH0lvTnUu4NMIb
         DDhw==
X-Forwarded-Encrypted: i=1; AKwUvBzAAzPnoj1GWBQoN6MNtftQKteM/xpxxBipTy5ttpV/wbQEyP0Du0+5KqjGCE76xC9M/v9PcgpI/ZnsMac=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUUb5tl4AlQsq9vvg5UCuGviFwdXhbHWuw9x7oQLO+HrTKVqwJ
	uiDgrhgPv8VZFAuRicgsaA7AOX0e3heTZpLzfscemkMll23SZ8wtruYJBffeMTW2r4TcgkSGcrm
	rOXJ+93KeGoVqf5aouBAl6lFhI4BGzzcC8goa2MnM3pK+qFzwg+ZPPGRly3KMpLYM+j0YaY+tqs
	k=
X-Gm-Gg: AYBFou0j3HEORw5URRO+MQPLSw22X7ymP+pBBUNu+cTH8ElQ2+25lN86g19UccnJ/7q
	jxH5gmrK85Wbuiyirtg25PUaZL45z+SgFPGshFZ215U1UUMP9zJAWnK56ANWgBW9IYZm980NhTo
	IjKd97ewDf+nJ5mGpN+OdlWOXItUUiGlC/mIQ2HwYrVcLy2Iu3oHgvRoTQG/llpRGZpIdou/bZq
	2Ymk5IKrdd2BIJDnYIa4jpCXX4nSLp2rLTylO2SuLXQ67wbbdiOB8qdsX2jX5019ZyHjaKaie9k
	pXSWtpovDP0XMad26pNyvTSg2xyt79y7EsRgV1DqRg4T+BsALLuPgZDx1Z1FdJbzEbuPY45wunb
	MwxoKhz3kkqFUVmjRCaSLo5OclBK+5/IYaasxEhTgONH9JK/tiai8
X-Received: by 2002:a05:7301:2105:b0:343:8d77:1d97 with SMTP id 5a478bee46e88-34c676d038emr622141eec.39.1790717718677;
        Tue, 29 Sep 2026 14:35:18 -0700 (PDT)
X-Received: by 2002:a05:7301:2105:b0:343:8d77:1d97 with SMTP id 5a478bee46e88-34c676d038emr622093eec.39.1790717717924;
        Tue, 29 Sep 2026 14:35:17 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:16 -0700 (PDT)
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
Subject: [PATCH v9 2/8] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Tue, 29 Sep 2026 14:35:07 -0700
Message-Id: <20260929213513.2401005-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cqgOAF4i c=1 sm=1 tr=0 ts=6abc2f18 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: PdFkaWlCNozC4P1G9ghOQqreNZelqVp6
X-Proofpoint-ORIG-GUID: PdFkaWlCNozC4P1G9ghOQqreNZelqVp6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX/Efoy7NAmnyv
 o/ANSVmPOjzIzUxSYR9gn77WlC7kfn8WEea/6HYZ6R0Zl5qVsgvck0kyoPpqtF+nbXXqunC3RTc
 QOYFS3YfEZohrDpuUrkZ6lZq58Nf72I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX+uwqECBvt7zi
 PeZCun8NJCYhG5l8BBg9K88iTQDUxKbnpCOoAg3yWMiH3VeuC7FMF0NTd78tsKeoDxEjTxpNak9
 WWFNUzYT42z20yqyXjsIcGMV487sNM208GngKBsdsB4lvw85jG9uPISenN57B1/MeeZeiq1L7+Z
 +opGCEVjXwEU42tWv84WySI2efkxDz0MN5JhiHtwCUnjGK6wK5DhVMHrsTFlUx2dbNDIRrHmylT
 MpAAka1SMJNutbSjb/ke8z2KD8scmXr+emLknvfsgIYxupoUF5n8SXiTxQG3b9qAtBpTlXdxTqt
 3wVds1jUTfCM1b8qYXnR96BZBXq3TQ+U6Wp8mh6oYibcgBsdPhuQ9vGSu9novF+hU2wRHuixhlm
 xVaYuUzAEpG+g9WiGJ9Gw5QKc4TXXw4W4XYQO4iN/1AqHmzwqBSbt2lQTFD0lBCjO5nVpUFTDpP
 XpKO2DCoFjN7PnHT2hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290086

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
 drivers/usb/misc/qcom_eud.c                | 42 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

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
index a7b9ed4ac071..fa640e88c88b 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,13 +23,22 @@
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
+#define EUD_PORT_SEL_MASK	BIT(0)
+
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
 
 struct eud_chip {
 	struct device			*dev;
@@ -40,6 +49,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +114,38 @@ static ssize_t enable_store(struct device *dev,
 
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
@@ -218,6 +258,8 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.34.1

