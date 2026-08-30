Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE2264612;
	Sun, 30 Aug 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095044; cv=none; b=RC1+KBy2M2DayNSdm8FZh+xVIe6wPhXLJ4mTtuT5G+84gcKV2UoaeIF7bDyo0NKh8nlDNu5TulHt3wu4kngF5W275EQzX3ehgxaBh7oWGSsWf+tNP2sKjVhl6WYgpXMxfsVIomdAbdpyMfcinFZogU7qfGK+4nZP9x5fJ0lfATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095044; c=relaxed/simple;
	bh=VfZeMGTd91Jrl8qon+ZcjLDYDnwd3nWyP2bGBd0z6nA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvk/SHFKQGnGer7NgMaoO0XtveuedzBRD4XxeOwu9JMM09QOPEPFOvQvD3cxcbbUkzdc0/fstCiV7CpMY8xwuEZCDf3eaOxBgBY2ozQPx6384f1kZU9UTydA7eaXFJbWb5hx9PTStI8nL58c7Jc09Laq5p8Hkci5gcDD/uWD7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowABncD4_KpRqGsuaBg--.48136S2;
	Sun, 30 Aug 2026 21:03:59 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cec: extron: validate response prefixes
Date: Sun, 30 Aug 2026 21:03:56 +0800
Message-ID: <20260830130356.159-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABncD4_KpRqGsuaBg--.48136S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr47tFyUtrykWw4DXr1xAFb_yoWrZFy3pF
	yDG34Du3y8Kw1DKFWvyrs8Gr15AF4xtFyvqr17Ka4kJr17t34rZw10yFy0gF1jkFykZrZI
	v3W8tryY9rs8KFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

extron_interrupt() dispatches completed serial lines by comparing fixed
prefixes and reading fixed offsets without first checking the current line
length. Short lines can therefore consume stale bytes beyond the
NUL-terminated message item.

Require each response type to contain the complete dispatch prefix before
reading its fixed fields.

Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 .../usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 3c6ce6f3d93e7..66780b3cf9188 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -851,13 +851,13 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
 		if (debug)
 			dev_info(extron->dev, "received %s\n", extron->data);
 		extron->idx = 0;
-		if (!memcmp(extron->data, "Sig", 3) &&
+		if (extron->len >= 5 && !memcmp(extron->data, "Sig", 3) &&
 		    extron->data[4] == '*') {
 			extron_process_signal_change(extron, extron->data + 3);
-		} else if (!memcmp(extron->data, "Hdcp", 4) &&
+		} else if (extron->len >= 6 && !memcmp(extron->data, "Hdcp", 4) &&
 			   extron->data[5] == '*') {
 			extron_process_edid_change(extron, extron->data + 4);
-		} else if (!memcmp(extron->data, "DcecI", 5) &&
+		} else if (extron->len >= 6 && !memcmp(extron->data, "DcecI", 5) &&
 			   extron->data[5] >= '1' &&
 			   extron->data[5] < '1' + extron->num_in_ports) {
 			unsigned int p = extron->data[5] - '1';
@@ -865,7 +865,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
 			p += extron->num_out_ports;
 			extron_process_tx_done(extron->ports[p],
 					       extron->data[extron->len - 1]);
-		} else if (!memcmp(extron->data, "Ceci", 4) &&
+		} else if (extron->len >= 6 && !memcmp(extron->data, "Ceci", 4) &&
 			   extron->data[4] >= '1' &&
 			   extron->data[4] < '1' + extron->num_in_ports &&
 			   extron->data[5] == '*') {
@@ -874,14 +874,14 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
 			p += extron->num_out_ports;
 			extron_process_received(extron->ports[p],
 						extron->data + 6);
-		} else if (!memcmp(extron->data, "DcecO", 5) &&
+		} else if (extron->len >= 6 && !memcmp(extron->data, "DcecO", 5) &&
 			   extron->data[5] >= '1' &&
 			   extron->data[5] < '1' + extron->num_out_ports) {
 			unsigned int p = extron->data[5] - '1';
 
 			extron_process_tx_done(extron->ports[p],
 					       extron->data[extron->len - 1]);
-		} else if (!memcmp(extron->data, "Ceco", 4) &&
+		} else if (extron->len >= 6 && !memcmp(extron->data, "Ceco", 4) &&
 			   extron->data[4] >= '1' &&
 			   extron->data[4] < '1' + extron->num_out_ports &&
 			   extron->data[5] == '*') {
@@ -889,7 +889,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
 
 			extron_process_received(extron->ports[p],
 						extron->data + 6);
-		} else if (!memcmp(extron->data, "Pceco", 5) &&
+		} else if (extron->len >= 7 && !memcmp(extron->data, "Pceco", 5) &&
 			   extron->data[5] >= '1' &&
 			   extron->data[5] < '1' + extron->num_out_ports) {
 			unsigned int p = extron->data[5] - '1';
@@ -899,7 +899,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
 				   &tmp_pa[0], &tmp_pa[1]) == 2)
 				extron_phys_addr_change(extron->ports[p],
 							tmp_pa[0] << 8 | tmp_pa[1]);
-		} else if (!memcmp(extron->data, "Pceci", 5) &&
+		} else if (extron->len >= 7 && !memcmp(extron->data, "Pceci", 5) &&
 			   extron->data[5] >= '1' &&
 			   extron->data[5] < '1' + extron->num_in_ports) {
 			unsigned int p = extron->data[5] - '1';
@@ -910,7 +910,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
 				   &tmp_pa[0], &tmp_pa[1]) == 2)
 				extron_phys_addr_change(extron->ports[p],
 							tmp_pa[0] << 8 | tmp_pa[1]);
-		} else if (!memcmp(extron->data, "EdidR", 5) &&
+		} else if (extron->len >= 7 && !memcmp(extron->data, "EdidR", 5) &&
 			   extron->data[5] >= '1' &&
 			   extron->data[5] < '1' + extron->num_ports &&
 			   extron->data[6] == '*') {

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

