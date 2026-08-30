Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565EA3F1045;
	Sun, 30 Aug 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788097478; cv=none; b=mbapYSPLfbF1vqcRcAzqVtnrFHfx5Lc/gApy+KhsXWAMsrAxttLWPPPOme9iErT+ciDT+XsB2VqBohftz2ai3jIaE5FAIV7bNB09paloHi+FBCDizTE/av9/O9HFGAOXenoNOHCXvUENpPbRcY9Te4JQ+ypoI/6rPjrlizmXLXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788097478; c=relaxed/simple;
	bh=NavIMbvNyecazTbDSluBSlQC5QoSFv4xmsIX+R6SQ+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IthkIyaCEixhTWIwVj0WvQSWH3beWRALM+HIaJrZYgCKepESVsS4vzvIykzcD+G7y2r16meNR4SJSHjChi+Lk9/7NHQNoADzOp9uvv98EUJQzMxmOZ4FZNN6E5/mX1UKri1vgvJjWnbOkpgX8iNsOoMOrzIUwRRqnm96qC0dCs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowADH0D6+M5RqOkebBg--.17579S2;
	Sun, 30 Aug 2026 21:44:31 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: sma1307: validate setting firmware layout
Date: Sun, 30 Aug 2026 21:44:28 +0800
Message-ID: <20260830134428.9550-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADH0D6+M5RqOkebBg--.17579S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trW7GrWkJFWxJrW7Jr18Krg_yoW8KFWxpr
	45WFySyr1rKrWjq3Z5Jw15ua4Ykwn7trW2g34xtF18CFn8t3WDGayUtry29ryrA3Z5Ww1Y
	vFWDurs5ZFykGr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeT
	mhDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

sma1307_setting_loaded() checks a byte count against an element count, then
reads an eight-int header and a fixed default table from the firmware. It
also trusts the mode count while indexing a five-entry mode_set array.

Validate the byte-to-int conversion, fixed header/default extent, mode
count, and exact mode table layout before parsing the setting file.

Fixes: 576c57e6b4c1 ("ASoC: sma1307: Add driver for Iron Device SMA1307")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/sma1307.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index adb369a29b9d3..653cbafee23ec 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1701,7 +1701,9 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 			__func__, setting_file, ERR_PTR(ret));
 		sma1307->set.status = false;
 		return;
-	} else if ((fw->size) < SMA1307_SETTING_HEADER_SIZE) {
+	} else if (fw->size % sizeof(int) ||
+		   fw->size < (SMA1307_SETTING_HEADER_SIZE +
+				       SMA1307_SETTING_DEFAULT_SIZE) * sizeof(int)) {
 		dev_err(sma1307->dev, "%s: Invalid file\n", __func__);
 		sma1307->set.status = false;
 		return;
@@ -1720,6 +1722,10 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 	sma1307->set.checksum = data[sma1307->set.header_size - 2];
 	sma1307->set.num_mode = data[sma1307->set.header_size - 1];
 	num_mode = sma1307->set.num_mode;
+	if (num_mode < 0 || num_mode > ARRAY_SIZE(sma1307->set.mode_set)) {
+		sma1307->set.status = false;
+		return;
+	}
 	sma1307->set.header = devm_kmalloc_array(sma1307->dev,
 						 sma1307->set.header_size,
 						 sizeof(int),
@@ -1755,7 +1761,11 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 
 	/* MODE */
 	offset = sma1307->set.header_size + sma1307->set.def_size;
-	sma1307->set.mode_size = DIV_ROUND_CLOSEST(size - offset, num_mode + 1);
+	if ((size - offset) % (num_mode + 1)) {
+		sma1307->set.status = false;
+		return;
+	}
+	sma1307->set.mode_size = (size - offset) / (num_mode + 1);
 	for (int i = 0; i < num_mode; i++) {
 		sma1307->set.mode_set[i]
 		    = devm_kzalloc(sma1307->dev,

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

