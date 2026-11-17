Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924608;
	b=rRjK72u5BtC11e8yWcRYGntmucod+NdCiQKjZ7Ohd54OWtQsCoKdi4BGMMm3R7g8c57J
	 iWCRzov2TOJ9hWt79cSn0e5PndRXXB+4qyUAU8LC3dZcSLxMMjP60RWsQ5X2pfbNw1WDD
	 i/NeLmChWCY7T1ONhHcKQaKt43WuZFfV9vP2I5gjf+CyeLu6NQsJQBwTKhMBbT4lt01Ue
	 NuQOMbgP4w1QsYJSOFRiZRqCFD3L5q+Ns8Ww97PDYWEZeY37XoyIqp0RR/NQ9XceQNxTh
	 0cEphzOd2RQgJ/it6sJS/GL7sgHW7+Now/WPSrh8t3yMiOnf2/CYZnY56LHJO7gm1oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BGizN/pJ8AZKN+jwzMpkdsBX4pfbEok2Bkyd/jWBZIQ=;
	b=c6bm2edzm6XZNKaXrwpVCClvEIiRxx+Y/bklzkfQIrkRZisx8eHchw1Be0ee6LKqZmvv
	 4Y9tLqCQSS4KXyhkHoW5Ua7byv1/a0v46Uag7J+PnsmTbMmZHWQ+2H6gi9Jp8LZy1TCyy
	 bUMecc5nE4sUyMpkWITQV3LnYfMPC67gZnJvYKsJQNvyHjsnf2bPnFz3wGKzzXuzRRKnZ
	 AxnGHWiL17woaSKuMFeOfyvRDZ3xsy9KF/nslZkR8SmTCLjh6AfDWwB7sm4vhZNS06lHl
	 3sGv92v1JB71MDCjfoA49+/BWNl3mJU6h1kEmmyM5HvqtCo4aTSY0iSq+ufY0HnjRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NEl5uX1y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWND4Tmh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92D606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF92D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NEl5uX1y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWND4Tmh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1HVu198638
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BGizN/pJ8AZKN+jwzMpkdsBX4pfbEok2Bkyd/jWBZIQ=; b=NEl5uX1y5YtmaWNI
	uIOBWwHYQSn55KIY0Bx0HC6jkfpytyi1tjgCP/BRWEQUujRx/4SKePZ6WKq0Umy6
	jv8Hxze4UVXNJYSCKoKHn4HBXK8PAF59TlwtxpAwrBdPSp9NkYouJ5NHxypvqL8a
	lNYDiydQlNVMADipgCUVar4btzJ6FRDL7aKY5e4ea/y7FrJe1OoBgq+Ge3Zp0q/Q
	h53Q12F72wNb+KHvyTYAA29g06k3YEa9X1N20NohON5zjZlJGOGwH3WP+Ee5/pNj
	3BYmp57wEaUG0xdW3TfAYGcN0ZQWDP+b5bIgcKejfYIS/jAfzF6cGcXaQq+Y/uwO
	ngrQDw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geha3v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:10:06 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71af90057faso1131823eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794924605; x=1795529405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGizN/pJ8AZKN+jwzMpkdsBX4pfbEok2Bkyd/jWBZIQ=;
        b=RWND4TmheNCDjtuvD+i3AiOVHb5Q/GNI6xJwGqd/s8Ej2C/bJoyOhbdrW8WNoHh4/G
         /Uhdc5SonkX5TCaRPX5HqR1wUNzyxUfghi3Br3H8zS8qOrd2z1FD299hrN+w2yqOE6TM
         Mr/AhaOLcp4k6UjV3xt6hz8LJVD2ZnNiN7AUQNdKR0bPJJPgR2eTRPrtk551RpfXBtgC
         A4oIPR7eHzLp75N3pbyJc4no6jgDdXBz5azsSkCjzP9uOsY+eUb8aPjpxeqfO9SX89sN
         oag5jqgiXgHAtcfVIWZkEp2jP7JO9EXleFa72YjnTraWk3PB/l06XIFnomxzkVaHPd9u
         0CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924605; x=1795529405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGizN/pJ8AZKN+jwzMpkdsBX4pfbEok2Bkyd/jWBZIQ=;
        b=JOk8h+Ct7lt+7s89t2QeqdmXvgjB/GvMYBro2+WsYIagGbN9HTxRRmevo26CzRoJKi
         fOI/JnRhyTJT2e5/Tp12neeGwRAYhs5IYCedlaMbYO0rcO1XSHsUAQV5RpHRKuLrVAjC
         SfDXsf1ywdnbinAAkvaRTAFdv9LX8zJgjvW9wQl8nSVHHe8lGQR3iW1EjYt2x0XH4niK
         /fOG6cDvWNtF5SL+eg2m1bwQjpVE/UV71RdaeyptsZKe854IB+9K1odMfwkpG8680W+P
         /cwM956lHcn3mgqRCc19rRGENoMeNOSP2j0pL9Bog5zptyfs2XffUIuolfiJggRy+sYv
         IwVA==
X-Forwarded-Encrypted: i=1; AL+hErFA+9WuqAeSErMhKUyUutACgtEj9Q38tCB8uEqEeSK/Wi3ghMonmZRv/f7dEJ/VrrHMOA7dAO60l1nAQZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vMK6NEUiA5KRsogJZyvy+B4KZ1VqTChShCaUmmKMeJm0mTx4o
	qq9dionBmGknQKrv3GdNX2JNezciuXW21xX60C+reem0hHEbap7etAR/qsJa8a1WZTLuow4jpCn
	S1ui5X4u3sDbKd8XtF428rmr6rGi5MZcaiTRRW4o0vJbMG3GcdrMqsGCSTMfHpSb0vM9kf41UY/
	E=
X-Gm-Gg: AYBFou3W5rw750+YL5gZ8xBDtFtsgMagboa/DljGwX6KPjmgxSS3URh42qrE5a32BZr
	Fk2kbVsfvCSt2kcenIjHTapEBt2hw3m/FYH4a+5HrXn+2WEBlqkFzWWzsVVQP6atJN2MbZ4RP9o
	7enKkx/f+O8FYyjUo+vYWLtn8/XkzuKTynlxyqFw9/zBK0RVkq2Rggvvc2BZTT7jo5aGOn7s50b
	rVTZ7ORwgXuKbrSG1mb/ZXvrj34O+AbpGuEOi+lWaZkc8jguC+MKEY2l2Egh/PP3SJAYgDD9Pqp
	5mxayQVJbIS9UE98laKE1n8TY1jzgOrM+98z9AFjfEDrcinNK3EUXcHiBnaZz3rGdEmjqNBybnV
	7scCa/Ewn2mZ9PyZn3kJvhXTCEJdYw7Ab4hSy8MKefSh3LnTVd6KB0ELXC5vwRCYzFhfIrz82Zx
	XidQ==
X-Received: by 2002:a05:6820:4dc4:b0:71a:eacb:d285 with SMTP id 006d021491bc7-71b02749ecdmr1728355eaf.11.1794924605479;
        Tue, 17 Nov 2026 06:10:05 -0800 (PST)
X-Received: by 2002:a05:6820:4dc4:b0:71a:eacb:d285 with SMTP id 006d021491bc7-71b02749ecdmr1728325eaf.11.1794924604812;
        Tue, 17 Nov 2026 06:10:04 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862d68aac75sm3233775a34.23.2026.11.17.06.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:10:04 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:39:48 +0530
Subject: [PATCH v2 2/2] usb: typec: ucsi_ccg: Add CC orientation sensing
 via GPIO
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-ucsi-ccg-cc-orientation-v2-2-2e3576a11eb7@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: Ndt2hzFuCWbmz8_NDFlvWWZl0pDnoiKP
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc603e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MKUcqzDF7wo3NqxITeYA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: Ndt2hzFuCWbmz8_NDFlvWWZl0pDnoiKP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfXxlnDsAUMrfc5
 CcwbzQQWFt8xbzLMPZ9CqWsiTDAxewU5FXqLskBJXWCDR6LC8QCF2MRQruYWxZITNTntpSZOtz1
 Y2re1BdsfBEWnf1gSPKsBzLNt60/WYg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfXzfbbQpN+xY4I
 w8SR3fp8nVQUJtlOAH9jgEso7g7KX8rHVGLvSON6rz7sGsYHuQYZ6etlqyeeFBNP0jSJcw0CSgA
 OkKmS5UjTO9CmGf+Tj4h0Jba34VBvvb92zqa3Iq5ORf7Ugp2Bvb0bVqogCHog0ZQKUr5nGEggjV
 vqdLH3x03cGClh8ICzKTnKIuOTB5xDeXnWpw6c9Q4Dm4e+6qdOw49OZPUCs8LEZZoPrtnd304nX
 tCNTwWtMZOrTC83Mz8liuGQvrKrQQZ9zJam1Wf2+45K58AFUP7qnbAtbk7L6H0ld2tXA6dZ3QTx
 +mJxGyndl/5ktgZXyHOs592YqEkq2zZuvkcOqayX60T13lQLzLkWqyteG4QCxOpgQv3Dt+SZT95
 xb5kv2tKk9ZzxMHjeqaiLDPLA1QIFFQyMA8fn0ABZ2jLz+hxAT0/8kh93nTBGKuXrLUTarlhZEq
 YMSHyEMK10rkzl070EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170056

The CCGx chip has no HPI register exposing CC polarity, so there is
no way for the driver to report typec_cap.orientation_aware or call
typec_set_orientation() from UCSI status alone. On boards that wire
a sense line to the connector, pick it up via the orientation-gpios
property and use it to report orientation.

Acquire an optional "orientation" GPIO for each connector child node
in ucsi_ccg_probe(), indexed by the connector's reg property. Add
update_connector and connector_status ops that mark the connector
orientation_aware when a GPIO is present, and drive
typec_set_orientation() from the GPIO value while connected.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 76 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 34fde72fe0a6..c6cae20d8602 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/hex.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/usb/typec_dp.h>
 
 #include <linux/unaligned.h>
@@ -201,6 +203,9 @@ struct op_region {
 	__le32 message_in[CCGX_MESSAGE_IN_MAX];
 };
 
+/* CCGx can expose at most 2 PD ports per chip */
+#define CCG_MAX_PORTS 2
+
 struct ucsi_ccg {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -235,6 +240,15 @@ struct ucsi_ccg {
 	 */
 	spinlock_t op_lock;
 	struct op_region op_data;
+
+	/*
+	 * Optional per-connector CC-orientation GPIO ("orientation-gpios"
+	 * on the controller node). Not part of the UCSI spec's connector
+	 * status - the CCGx chip has no HPI register exposing CC polarity,
+	 * so orientation must come from a board-level sense line if one
+	 * exists. Left NULL (orientation_aware stays false) when absent.
+	 */
+	struct gpio_desc *orientation_gpio[CCG_MAX_PORTS];
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -694,6 +708,36 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 	return ret;
 }
 
+static void ucsi_ccg_update_connector(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	con->typec_cap.orientation_aware = true;
+}
+
+static void ucsi_ccg_connector_status(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+	int orientation;
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	orientation = gpiod_get_value_cansleep(uc->orientation_gpio[con->num - 1]);
+	if (orientation >= 0)
+		typec_set_orientation(con->port,
+				       orientation ? TYPEC_ORIENTATION_REVERSE :
+						     TYPEC_ORIENTATION_NORMAL);
+}
+
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_version = ucsi_ccg_read_version,
 	.read_cci = ucsi_ccg_read_cci,
@@ -701,7 +745,9 @@ static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_message_in = ucsi_ccg_read_message_in,
 	.sync_control = ucsi_ccg_sync_control,
 	.async_control = ucsi_ccg_async_control,
-	.update_altmodes = ucsi_ccg_update_altmodes
+	.update_altmodes = ucsi_ccg_update_altmodes,
+	.update_connector = ucsi_ccg_update_connector,
+	.connector_status = ucsi_ccg_connector_status,
 };
 
 static irqreturn_t ccg_irq_handler(int irq, void *data)
@@ -1506,6 +1552,34 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
 		uc->port_num++;
 
+	device_for_each_child_node_scoped(dev, fwnode) {
+		struct gpio_desc *desc;
+		u32 port;
+
+		status = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (status < 0) {
+			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			return status;
+		}
+
+		if (port >= CCG_MAX_PORTS) {
+			dev_warn(dev, "invalid connector number, ignoring\n");
+			continue;
+		}
+
+		desc = devm_gpiod_get_index_optional(dev, "orientation", port, GPIOD_IN);
+
+		/* If GPIO isn't found, continue */
+		if (!desc)
+			continue;
+
+		if (IS_ERR(desc))
+			return dev_err_probe(dev, PTR_ERR(desc),
+					      "unable to acquire orientation gpio\n");
+
+		uc->orientation_gpio[port] = desc;
+	}
+
 	uc->ucsi = ucsi_create(dev, &ucsi_ccg_ops);
 	if (IS_ERR(uc->ucsi))
 		return PTR_ERR(uc->ucsi);

-- 
2.43.0

