Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.69.30.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794619966;
	b=R6FYfEnZUwHJRZiswCWYu/rk0t4FMWQY8rQcafkwX0z2202J3Tfkf6TLGlA7J5octSsm
	 lGUcYqRXcjVDwAXcZ/G+vDA7HG0icrIUU5igwTAxX32XgHN1iCYY3sK9T0ns0HzF2OFDc
	 vdE8dUWoWWlwkv6EHqQXI0u7Yw7qb9qZsbn/mp1xPsoGWp9Fev1MsLw2STnvWhmW+lb56
	 gl6QuEAEDkHcL5M9d4tCLrqcoMVPsdgxZExH2Q5EMnGg2jr7NcshQNHqOQaL7SnavSwje
	 Z4aGoTVPqWb96xGWA7+4SWB4Tjuz7bNyxyRDviOAVVZPwssW+hp9pAcjEnhd2gQ702Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794619966;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kJXEsRmuYsfc1BrLIU63ZSUPAsYVE57httmwDK1F3WU=;
	b=GgmPbFQGTFZ8L/uMC50ITW+Fy93i7uMN/O3ggvL3g2e5myy5h+FX7Kg+fy4J8oAhwxkT
	 D7CLWs7bjgEQ9b4VYl1ixzQG1EafBRhby0jmCx7Gelr/mIHvg9D0mUMjuxt1EUp0wInbx
	 j6SFAGVkJFBwI/ybHRb2dEIZ2kpTja4Dixck4J6izbKsurK4bQssxA2TvM9yLoZN3XOZP
	 rM5o1Bwf+JTIY3GMSR1dOMlEntlVmQvh96N9onThGXqYH1LCIN/Ws1G51qvr/n8ILgYhV
	 pRRRyfWmeENuxO/T+q0d1tOaxjnelh2qV/GEXYB30nVyXj+zx1R6i/CjpJl2RTrNeSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freenixos.com;
	spf=pass smtp.mailfrom=freenixos.com;
	dkim=pass header.d=freenixos.com header.i=@freenixos.com header.a=rsa-sha256 header.s=mail header.b=L1hvWL11;
	arc=none smtp.remote-ip=54.69.30.187
Received: from mail.freenixos.com (mail.freenixos.com [54.69.30.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18360606A336;
	Sat, 14 Nov 2026 01:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18360606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenixos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenixos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenixos.com header.i=@freenixos.com header.a=rsa-sha256 header.s=mail header.b=L1hvWL11
From: Hex Lindqvist <hex@freenixos.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freenixos.com;
	s=mail; t=1794619965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kJXEsRmuYsfc1BrLIU63ZSUPAsYVE57httmwDK1F3WU=;
	b=L1hvWL11Q0rXxZsGIPzCfnIfhZNeWz5t7UaVJ1rvlFhN54B+5vKmPceALa4kN8wG1HXOYw
	8PRJPQxj5msufSdHIhd9BZJoMou1On2IZEX7DyXB2SN7VFPeEsiiaB7I8xEYiL/D++ry57
	Caq9+/7RUHKYHKzi7L9Hm4kbeHYT9r8cmMQPnJ+o0g3bidNRBdAbFvdHydJllLtq2ibyAE
	cReSlbJnyeie8gdULkw19e88FMkUTDqF9uiu8sIpghsQzVQUL824My0tJYyyWHiQBLkdJs
	JkxC2fJ38inEpeZMmUnOXzSlPuLcWGV0lMAZwqx0EuPFzES0pV3DWbF8uZAzsw==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ajay Gupta <ajayg@nvidia.com>,
	Wayne Chang <waynec@nvidia.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi_ccg: Don't probe GPUs without a CCGx controller
Date: Fri, 13 Nov 2026 17:32:43 -0800
Message-ID: <20261114013243.1240146-1-hex@freenixos.com>
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

The NVIDIA GPU I2C driver adds a ccgx-ucsi client on every GPU, but
GPUs without a USB Type-C port, such as the GTX 1660 Ti, have no CCGx
controller, and every probe fails with:

  ucsi_ccg 4-0008: i2c_transfer failed -110
  ucsi_ccg 4-0008: ucsi_ccg_init failed - -110
  ucsi_ccg 4-0008: probe with driver ucsi_ccg failed with error -110

Fix this by reading DEVICE_MODE first for clients created by the GPU
driver, and returning -ENODEV if the read times out. Controllers
described by firmware are not affected.

Tested on an ASUS TUF Gaming A17 (FA706IU, GTX 1660 Ti): the three
errors are gone, probe takes the same time (one timed-out transfer, as
before), and the platform's own UCSI port and suspend/resume are not
affected.

Assisted by LLM.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206653
Link: https://lore.kernel.org/all/20200922054338.GA588161@kroah.com/
Signed-off-by: Hex Lindqvist <hex@freenixos.com>
---
The nvidia-gpu timeout line is fixed by a separate patch to linux-i2c.

Not tested on a GPU with a CCGx controller; there this adds one
DEVICE_MODE read before ucsi_ccg_init().

 drivers/usb/typec/ucsi/ucsi_ccg.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 3f12db95c7f4..0f082952272e 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -357,6 +357,31 @@ static int ccg_op_region_update(struct ucsi_ccg *uc, u32 cci)
 	return 0;
 }
 
+/* GPUs without a USB Type-C port have no CCGx; transfers to it time out. */
+static bool ccg_is_present(struct ucsi_ccg *uc)
+{
+	struct i2c_client *client = uc->client;
+	unsigned char buf[2];
+	u8 data;
+	struct i2c_msg msgs[] = {
+		{
+			.addr	= client->addr,
+			.len	= sizeof(buf),
+			.buf	= buf,
+		},
+		{
+			.addr	= client->addr,
+			.flags	= I2C_M_RD,
+			.len	= sizeof(data),
+			.buf	= &data,
+		},
+	};
+
+	put_unaligned_le16(CCGX_RAB_DEVICE_MODE, buf);
+
+	return i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs)) != -ETIMEDOUT;
+}
+
 static int ucsi_ccg_init(struct ucsi_ccg *uc)
 {
 	unsigned int count = 10;
@@ -1488,6 +1513,11 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 			dev_err(uc->dev, "failed to get FW build information\n");
 	}
 
+	if (uc->fw_build == CCG_FW_BUILD_NVIDIA && !ccg_is_present(uc)) {
+		dev_dbg(dev, "no CCGx controller on this GPU\n");
+		return -ENODEV;
+	}
+
 	/* reset ccg device and initialize ucsi */
 	status = ucsi_ccg_init(uc);
 	if (status < 0) {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

