Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663693839B4;
	Sun, 30 Aug 2026 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788097218; cv=none; b=nqM0iSn4+CIXc4xd6eRS70m6TRB1+PQR6G/AfmGh/E3gYTJ7qaZNLtlhhxoV63jvU22EdKLQwieTBDUVTnBcLXLpjO4iiSJTqe5ViecybbON1tZ5C7C5fJhJYdP8fO9QtepHfCXaOZbr7atc/+7uvoy1Jsw4UMxypXBFHirH03w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788097218; c=relaxed/simple;
	bh=cEUwxVCOYpXxpkRlfqbC9yaUbDkslxClBLMYkLDWM/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2SXIsYt8u6kU28lwFyBVgTFvtfBb+eqzfP3Qz+RYdguGN/+7OyFDVTjuBerZ+ZolJVYhjQLGYjxtiC8zwiTwZrJKfWlNijXuy3CWB4KZtKv++EHxgfeqgfkYD19AU8Ed5RHZ0xMqLo474fGcdc6ahqY33S25ZnkjqAjhRZPAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAAXIkC9MpRqQzubBg--.20188S2;
	Sun, 30 Aug 2026 21:40:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: siano: validate family2 firmware extents
Date: Sun, 30 Aug 2026 21:40:11 +0800
Message-ID: <20260830134011.8582-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXIkC9MpRqQzubBg--.20188S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4xWw17Kr1fGF17tFWUArb_yoW8uw18pa
	yrGF4UJrWUGw4SqrW3XFW5u345Zan5JFW3WF17CFZY9r15AF97AryUG3yDWa45Gr1kt343
	GFZIqrWrGF4DJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj9a97UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

smscore_load_firmware_family2() reads the firmware header and a fixed
reload address before proving that those bytes are present. It also uses
the complete blob size as the payload remainder even though payload starts
after the header.

Validate the header, bind the declared payload length to the firmware blob,
require the reload-address field when needed, and download only the
declared payload.

Fixes: 018b0c6f8acb ("[media] siano: make load firmware logic to work with newer firmwares")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/common/siano/smscoreapi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 017629e3cf84b..54e9617513eed 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -909,12 +909,23 @@ static int smscore_load_firmware_family2(struct smscore_device_t *coredev,
 {
 	struct sms_firmware *firmware = (struct sms_firmware *) buffer;
 	struct sms_msg_data5 *msg;
+	size_t payload_size;
 	u32 mem_address,  calc_checksum = 0;
 	u32 i, *ptr;
-	u8 *payload = firmware->payload;
+	u8 *payload;
 	int rc = 0;
+
+	if (size < sizeof(*firmware))
+		return -EINVAL;
+
 	firmware->start_address = le32_to_cpup((__le32 *)&firmware->start_address);
 	firmware->length = le32_to_cpup((__le32 *)&firmware->length);
+	payload_size = size - sizeof(*firmware);
+	if (firmware->length > payload_size)
+		return -EINVAL;
+
+	payload = firmware->payload;
+	size = firmware->length;
 
 	mem_address = firmware->start_address;
 
@@ -932,6 +943,11 @@ static int smscore_load_firmware_family2(struct smscore_device_t *coredev,
 		return -ENOMEM;
 
 	if (coredev->mode != DEVICE_MODE_NONE) {
+		if (size < 24) {
+			rc = -EINVAL;
+			goto exit_fw_download;
+		}
+
 		pr_debug("sending reload command.\n");
 		SMS_INIT_MSG(&msg->x_msg_header, MSG_SW_RELOAD_START_REQ,
 			     sizeof(struct sms_msg_hdr));

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

