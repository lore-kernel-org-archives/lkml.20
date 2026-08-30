Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D3346ADC;
	Sun, 30 Aug 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094928; cv=none; b=t33waiiBhLsSWa1mftnj/p3srZ1x4xZ3BMkxzqAwSb9ADS7EiMMpiM8VG6sxZ4LDqyYJOSo6bStTUHv9wREocs9xvVN16Xui0IfnAW/uPEKXIDyx5DCRH47m/LqEYhuOvLZDpQHBCq6W6Dt13DxvettQPVmK3imYA67XOnfh1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094928; c=relaxed/simple;
	bh=dPj2icU1muKFMct/JWK2HK3xsv8/lcX/a7d4BWikfZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClFR/md2ibYO9iRvqB8eckqq56UODZGut6unPHgeBLeam36gq7VL7K7hXvAOapSUVapxXuwCWpYYwO6axhW7h8hd2/Z2kYQFg2XaeR/tCp6el+55BJQtcCOvXbUCD4IB+396vY+MeJotUih5fRgk6x5Qu2Y/QtqXL1J68TltFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAC3wT_LKZRqXsWaBg--.22732S2;
	Sun, 30 Aug 2026 21:02:03 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: or51132: validate firmware extents
Date: Sun, 30 Aug 2026 21:02:01 +0800
Message-ID: <20260830130201.99744-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3wT_LKZRqXsWaBg--.22732S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1xuFWrtFWrJFW5Xr1kKrg_yoW8Kr1kpF
	s8JF4YvFWUGr4fGryUCr47C3Z8Wrn5JFW5KrW3Z3Z3XFy5Aw1kJ340g392grW3CrZ3J34a
	gFnrJa4rXFs8Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUna9aUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

or51132_load_firmware() reads two internal image lengths and passes both
payload ranges to the I2C writer without proving that they fit in the
firmware blob.

Require the size header and both image extents to fit before uploading
firmware.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/dvb-frontends/or51132.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-frontends/or51132.c b/drivers/media/dvb-frontends/or51132.c
index e908d33d7e72c..325abaff66a52 100644
--- a/drivers/media/dvb-frontends/or51132.c
+++ b/drivers/media/dvb-frontends/or51132.c
@@ -119,24 +119,30 @@ static int or51132_load_firmware (struct dvb_frontend* fe, const struct firmware
 	struct or51132_state* state = fe->demodulator_priv;
 	static const u8 run_buf[] = {0x7F,0x01};
 	u8 rec_buf[8];
-	u32 firmwareAsize, firmwareBsize;
+	u32 firmware_a_size, firmware_b_size;
 	int i,ret;
 
 	dprintk("Firmware is %zd bytes\n",fw->size);
+	if (fw->size < 8)
+		return -EINVAL;
 
 	/* Get size of firmware A and B */
-	firmwareAsize = le32_to_cpu(*((__le32*)fw->data));
-	dprintk("FirmwareA is %i bytes\n",firmwareAsize);
-	firmwareBsize = le32_to_cpu(*((__le32*)(fw->data+4)));
-	dprintk("FirmwareB is %i bytes\n",firmwareBsize);
+	firmware_a_size = le32_to_cpu(*((__le32 *)fw->data));
+	dprintk("FirmwareA is %i bytes\n", firmware_a_size);
+	firmware_b_size = le32_to_cpu(*((__le32 *)(fw->data + 4)));
+	dprintk("FirmwareB is %i bytes\n", firmware_b_size);
+	if (firmware_a_size > fw->size - 8 ||
+	    firmware_b_size > fw->size - 8 - firmware_a_size)
+		return -EINVAL;
 
 	/* Upload firmware */
-	if ((ret = or51132_writebuf(state, &fw->data[8], firmwareAsize))) {
+	ret = or51132_writebuf(state, &fw->data[8], firmware_a_size);
+	if (ret) {
 		printk(KERN_WARNING "or51132: load_firmware error 1\n");
 		return ret;
 	}
-	if ((ret = or51132_writebuf(state, &fw->data[8+firmwareAsize],
-				    firmwareBsize))) {
+	ret = or51132_writebuf(state, &fw->data[8 + firmware_a_size], firmware_b_size);
+	if (ret) {
 		printk(KERN_WARNING "or51132: load_firmware error 2\n");
 		return ret;
 	}

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

