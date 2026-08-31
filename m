Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635337646E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145314; cv=none; b=sKgba+in8W4r0/Wd/4p1Q5twByDt1G+w9EUxu9VQAnDNzOHX8xW6hQxWkA5ZWXgeC895ltdYJjJbR8L7mNWeuFChGtmIhWOBsjYvHsU4A+Op7CvGaTKpBpT99f4F6JlvwWWwsR2u7J6p33u66a5ewJLDMLuTiakFXrVMLhBrRVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145314; c=relaxed/simple;
	bh=ldhObfEr4z0Xrekc9qI5UQO3v16oHY3sXmgjk69PNKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JVUpZpDV5DlzU0FTa4p4IovWzOhUtH6ftWeksDBp80e88nGcf0WhOR3G+lsR8jbX9htS0bHoQAlXuOGS9xZVwf0PZgqdzW55GczNbdKhkuvC1qGddDOozOwU9ZJ6eZJhF3+/2x2mcO0UXXa8757kemCMOjeuhpXdBMyDCDweh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dN2WzrZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRg3lup+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dN2WzrZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRg3lup+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bNfS1496273
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nvOjwEmlXGk
	kLlIdjY1MOSExUXg8PKOSC1XZVD1rwvw=; b=dN2WzrZJp3M1uhzQzoTNtKHu0x2
	Iy6JEv8AQoyB0mf5+q3Q7T9qGPEjSXeiL3Bp9EDa8V4t1Zj7FF8t4N2bb+A3QuNE
	qOAN4rNYpFi97HSiRhMnbWN1+B7ITZYX2LddaykF13xOTrvsFBtKwoKugziqfF2A
	YwY7pGLT9Y1LmpwTAAM6VD6P7P+V5BwpvajM/jSrwHviza/ac+F1PcLYdSRacLpM
	p8surQx9+uDCEQWj0ffiyBEWCG8zOP6aWXkivmoNeMhdzBX6hOdteeq16xiZKFrU
	JbVLtj+mTWJHTM6PY2WTroZAmdwNBIjPsEdyGibQxEXkrWSbsbsgk87SS9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq844m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso35950715ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145311; x=1788750111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvOjwEmlXGkkLlIdjY1MOSExUXg8PKOSC1XZVD1rwvw=;
        b=fRg3lup+oCEjKSusD8QB1bFkFCzBgr5w4Jlxumhs3A89CutduiOvQ+xldd2b0GnmJz
         vswHAKiqxLaSmcrUJ8WzezCd+ZBOj1CBwK8FAPKdiwL2KWLGvD3+nD5heDHhBClLNlP2
         5dnjdKQs6ez9+9rO9fBGC/7GpYMwU/PDfSkz0Puln2grXhrMxwPUVr8zoix8J3IGuUl7
         s32I8bjgs29flIFksx44CQak2l4uF8fs9w/FgfbmQxSHwp1AXFJew4BCzuQo89B6UFoZ
         mSMZBlyx7v1YB8RnOqKbAn2p2sykH+GG/TOzkbq6wl9CtOEputmeWTyqWAC45dC6fToj
         rtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145311; x=1788750111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvOjwEmlXGkkLlIdjY1MOSExUXg8PKOSC1XZVD1rwvw=;
        b=WHcfNtFV6/1nN3l/SaUv2aml2EYyDcy6bKYAL8UnYF5HMdE6JOn3GheCXbgNxQAx74
         PCRZ+lagTpYx5k0xutj2HHHQM7eGdN0005hT+cVscFgZ7ALHZSidcK/+KT92BS+fhF94
         pb83M/VOF3aqJiz0wmm7zSDvwdiifSnbmCFNK4Y/l4JGiSczVD0UJ+885toO1TSibOZb
         okVuLIL3qFmLeivtJ+aDt8hyNsXIWU6yJf9B8IWRbXPR6kczRjbfPuLFogttqVWaSKXC
         ak9pGEbCq7xJiwKLzuI0fVg2lciIypiW4gra4BR06aeBriJc0A/BZChPBlAR/7C3qPr6
         Pc3w==
X-Forwarded-Encrypted: i=1; AKwUvBwoHYRU0mG8GV2RcxeeS92flmsYUHvb0YMMONDyn8GnIuIihfohcCP7X73gTBhoWO0REm3A8mt/xC2vteM=@vger.kernel.org
X-Gm-Message-State: AFuF++lEb8ZJ9CGUPs/ar9HFymGP/8WMgkE/NtxaUXUYOu9zdkoaOmKB
	8anH/hxriPc+J9ggphWhur6sWFqcnQf1Mh8Ie4LzopLUQzr9CpwOJ6E+VjRxRpjGahrYi36tmvQ
	fVCa9Sps91WdDRDuRiBLK0bn/dxOfF1gBnf2EOIeMSAQIvoUtmAGvPJiV2JtI0VbI7E8=
X-Gm-Gg: AYBFou3Uy2KngPUoZxBaMEvRnHKGYTS30jE54xyr65GYUd/+HGUFWpArRJgrnla8sy3
	E1F9E1yhuhEpvPd3i6f16N6GIIWrq5nkr6q6TNUx309C7b+30H8FVWFxvf4WhwbY9BknY5D1Hox
	VXTGi2TZcYQ40Yt0SKlzrYQKLV9ho1BSQApEw0WMntVyTgY9Uf/zz004oFBdRH1AENpGOsb0G0q
	2+aisjlRE4s+Wlp/ahliGN2ACScePaEsDamFRjLAvVOJJV2f5phWTghvwBn3w5mpZyZLMKBEPOu
	MSpq0xXp9TaJMN+dWl7W9km77svjlhzC6839XzFzCIeSpWwtgyuYme3C7tCrZR9YWIzGi+4Nkb3
	HDkfjl/fSfmMvu8mr3s5vM0X04GYiWkhYUqvY6L+PwXIHsh9jwynM0g==
X-Received: by 2002:a17:902:d4c7:b0:2d8:d4d3:da51 with SMTP id d9443c01a7336-2d93fa47634mr5176155ad.21.1788145311311;
        Sun, 30 Aug 2026 20:01:51 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2d8:d4d3:da51 with SMTP id d9443c01a7336-2d93fa47634mr5175235ad.21.1788145310807;
        Sun, 30 Aug 2026 20:01:50 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:50 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 2/8] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Sun, 30 Aug 2026 20:01:41 -0700
Message-Id: <20260831030147.1500616-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: snKXQLAwAeEDGSHI_b39rifFd7DNZFvM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX962mcMx6On8u
 ROQP6LQG94kpN/GaA3CRU1qkflunAWmg6KATONfbmYFo+B76SWINi13HGF3Ay8AFIyo0yzxKsqJ
 JLNeO9GdgTDwmCJrTv/PRM3eYDR8YZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX/vbUeSh9V5f6
 0ciYhPjry8bO0iUUo5mfUWlYnkYvh0sZ5yAS+1K35d4706mjmX8h6mq96tfZYAS2ClUYqIjeIF4
 Yeyt1OsatZm1LgL02J7DDrEyiojcgOqzEghpvDZQ7ca/IVNR+ulxkMV9320Hn6dWILqDa0dbo+X
 p2KKIsRc/m5Tep8kcefG7VKfSOp49JeRZn+mOTNUPhqvsvETe5Ob8LuWN+gYr2V0cWYaALp1ZHc
 JYguqsGqn9Mz9z4vkrJSwj5Gx2wMZ9nm05rRWdKfOlYZcF/fv/3vIWLNg9d75ey2I1Q3nuwZgVB
 SJOtL1QdjPtCd+6hGN7p7T02YytG4AXUup+wm165m4O/WTLEwVUmC3mGWJDxVHvveRN6PifjtnP
 aAcDK6rqLWfn4JyakFrTgtFdIwDPLnLw5tpN+KT5hspwZ8wXhEMh6BJxwqyptPLH1S3yltvygt7
 +9pLjVGoa1yITLvr7cQ==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a94eea0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: snKXQLAwAeEDGSHI_b39rifFd7DNZFvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

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
index 926419ca560f..25a6a8f110ec 100644
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

