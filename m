Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923316;
	b=ixQundkeRpO0pm7ImB6NE+tC9UGgKemTOUh+vXFu6TZ31YMxxoA9tBt2NmjkEZkIqvbf
	 NYq+EpO9O9wVxM0990GZ3RembRFW/TKvRe7VMgCpY2vWdK/JjVkkDev4kvY4QCNLTIMws
	 VGduot+xdfu18Acqw9WZLiQY+bEH2ZVDJVoqU1tDYAUnnOIJQSn160HFLGcPkqXxXARjB
	 FMwSww0uXe49kNn5UX/+mF0mQbGWvEZCDGlYDWOIH6jmSK9QEIwKs1jePC9njJhYmUmWF
	 uVe82Nbltwz7cJPkzF9r3yZk41DNpWg3YHLhn8nyg0dgaIHomUVs0SL10+cVS3cNsPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
	b=pJL4S4I2J8uKAtRMDW1yCCPUkYvhJKfv8YCJ2k9CKM7PUwIewKkXL9GgKh5t5t396HdG
	 8tokgHmhFQZ44OlMIoK0XF+I/zXitYsMjuiIK8UuQQcQXXNEQB+dzNP/6XFGrexmICVnE
	 IwP+tcQ8kU2IvWASz0/7FilDudWY0JSJLbiwOIMm8pa+Eqo0gPGZ5whqjRt+HyxEolmKI
	 /uXjW1jIVTJvCmuBo/4jfzHJZ9oU7oLLGq+gClb6hw5d/FYbRzfO1FAVVEFVnxyeSZ8EA
	 ihs/DJaArF7EH/I+ijv9Htd8lhbRNr1CWPp5ATXh6+3+PUpjeMSZj3CNs4CQglxfzEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZgUrSWq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayLlW6BJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC2D606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC2D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZgUrSWq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayLlW6BJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1K5x541629
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=; b=YZgUrSWqkCLAZaPg
	4+FjV+Kr8XEnzH+fVgqWR94jFN7oMxPtrlpyJr9012PiDh01BIYpK7mJBBZtE+z3
	yXAO1px7B5HRXTQvw64Hh+uaNyrYe7w97pIVIo6vpp1+5t/V4UVBGnK5ZdHQO2oY
	PCZRNthiOkk+uTnWVbsNgkWwTGrzLR++fYvXRukuVkvTas9zW+pvNGSuLevhJWk1
	TRGZRk1uKbMpCBpKsvZIfvbmhATNU7pJeztiXhExM04/w2W3zy8S2lj502cJ/nwk
	KwJIXMHVPKbWUecxtPRxEl5pryOmzRQwHoglkWbXlYLP9CBfXAHaB4Qafpl30cgS
	NxysnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1pjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6658310eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923314; x=1795528114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
        b=ayLlW6BJYShf6Yu9f745Li09PskP+rVLqr51O7LjNSTSamGHjdDI3gwH4h0pLvmUQL
         IaOwDoir7vCgCVFWr6pjPTt/ERe1ZO2OgYvn2Jdg3OEwgbSOUjMGk+SyF0L6HW+rXeJS
         FiMKyhNMak0+u1WsMQq76K7VtGfYUBfAAh+vqKoNrpJD93n8SFMokY213CESe2e/Ck+a
         UqXk4/QeMqNVUk3yqY5mvXHJSMN6aJqIYQAtAgFyf3AKurAp4ctbEW2eHV3CYgbt6loZ
         9uI5vPtbwlvkGQQLFV8QvVHlbi1QMRwSsDjwW1sZzr+7fJ1P96a16VBgyTSVgGdXAT4N
         Er4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923314; x=1795528114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
        b=Fs2CvN9ctkppk8YfX1+0fFxA4eqqDnuM2wdM3B549fy0zeCNkAjxzTe/aTWhNNLltD
         BdFhl8PKfUBlYH71h/D/6zJeC9ejhD8f+hYr3F2TYjqENW8/YfViFLg4tlEYpnlq5rSC
         gVHTrYZOdsLliI9azVSmxNvUe8kuXc+XPcMvm5An5DSv4bMijJ8qtyyjcV7yeKVV7oa6
         poZp77lx1+bKkKDNpPcll3TWb46sPAhBAluw6zRy4N14e5CMUNy0MwVB6n7dxPYkMmWY
         zNZHxrr1XNhLtyRvbFMn5M6zWkdsecfJjXU1Uq5KoyzifiF6lXJgjeG9DY7YLnSgcwpe
         wLnA==
X-Forwarded-Encrypted: i=1; AL+hErGHUNhOPP1rC5hpOGlm9oiMWCkfRQTofNGgO+P6bvTvD4wzUWb6TCBXAYG/EpHxuOlKLutZgX+tPktb3PU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fr/UOsVZZW6xTVsFn5PWLAGn2nww48VW7JdZton8wn+qFUXHw
	AdpLecvtNzShBBShe769PwmvLpLn2I3hijaLqNg7lQ9DRj70AFQVgzURp3duLRTWL7Ido85JTLm
	IECZInJScsMCSJ0GJWLQN23Ck0JWLAuhfG/6VEgC7md2PQZglp5grLcmWyTFCtzUuX6E=
X-Gm-Gg: AYBFou2zFimvUFa2rIuyK6yOSmI5QBq1+mY/FGJPVnt+hppn1CVMfwqvtoJ4DY5Fuav
	NV84SYQknQASJz3OZOJzl+EhlPUGt6BxeDAjpvokTySYgwiJDm4GUlZW/uXxae9IzwtUiq27oKm
	Q2n7MaCWbRR/z6/ySvIGjGSGnw8/74Na29Gu7TP1jLAOepn2ZWOPc5VPAG2koRWSfknDcEi9qxe
	GSiMdpvAtnfgpAXz3nT6s6Zkss22oCNDZRDvLyFC8q0211WwXxYrKDNRVLIbBhD13omMfQVqnB2
	kVxgxIipVil/oFG3KBYg6BvhphM+P+0kYIng/i2+/mP8t4Ofw5WvDYwVbkxw2iEvzQIevA05rbh
	uulqLbyoHqk9tmVNDhLzm4NfRvO9E4R0hG8zo0aWkTozNwx3xNjrjbaGYL4+W0mw6QCY/DoZ26p
	VFDQ==
X-Received: by 2002:a05:701a:cc81:10b0:1b5:3417:9bc9 with SMTP id a92af1059eb24-1b534179cf4mr4282449c88.26.1794923313581;
        Tue, 17 Nov 2026 05:48:33 -0800 (PST)
X-Received: by 2002:a05:701a:cc81:10b0:1b5:3417:9bc9 with SMTP id a92af1059eb24-1b534179cf4mr4282417c88.26.1794923312883;
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:18:06 +0530
Subject: [PATCH 2/2] usb: typec: ucsi_ccg: Add CC orientation sensing via
 GPIO
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
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-2-a0fb052c7fcd@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc5b32 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MKUcqzDF7wo3NqxITeYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXyGXAiTpyBsnE
 6S77oLaqRhgmdVR44h7agshR5mJMBpHI9+NyP2WFzPeBaWPrdFDYOaO9trffWfUVBPt8hOO2SHk
 4R+RVBA6wfgY7zP34eTm912E5Ht0cOA=
X-Proofpoint-GUID: pcjDbtLy6Bx5IL0EZJuZcPJNY675FJGW
X-Proofpoint-ORIG-GUID: pcjDbtLy6Bx5IL0EZJuZcPJNY675FJGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX9znpX7Ntjo2G
 hga9sn/waYEXzsRA30Q/UZeOnACJwq4vtIvuUjxGYKC3Hi5L9rmtGG87Nw4zZXsvgLnFDuNv2Nz
 4c4HipQwyW9l9AUQWvZi8zc3Z/Jvi12AYCv/QXYnE9YgCJ5Lu9ES6tnUEraKxKy5LNlodOM4ZrJ
 qDtJeM/1qUyrtp4I7WqlzJ+j3X6QLET3fvlEIPM22zVvGmnL82ZZc5xVtjTa1xwQ6Klx2VnVk9f
 8vQjR2jzD3eAAO8bBWoxhOWSotCzum5urNXzVk0C0uQWrIiLGizhlKNXtd047UgJxwltJmn2Cp7
 M1mFidnN7r0M4NRSAL7ZphMRJHy4ljf6QtY5/LgSXuOBsI4awCBirP7pP85QWF52QqayMP1f06O
 AZ6IDgXXeiuY3Y0Mpi63H8AT42N+INxiABKuPtB2Ema4YmZFdurafZEfTE0BePowXMRCg4zUjMP
 jLjeBj6t2sp7tEM8KSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

From: Akash Kumar <akakum@qti.qualcomm.com>

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

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
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

