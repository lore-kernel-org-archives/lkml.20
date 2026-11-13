Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568168;
	b=UILduUQr6bdLvqu0gBz0Z9uCQc1STaOyZDbIX49XYNBZyPSgmM1XH2nMkaxTuHXEN6Nf
	 tgPAk7PfAu12RtyeExNpULh75IjvqYdCGKOqls1Chi9fF5FQu+LHYsr5QpPgNPChJFO+T
	 VVjDbH1evf9UUT5UlPDlxRj6lLSuxUYGvmVjv2UgeSWa1hvm7HqK5SYmSXcbc3MBD3Y/J
	 qgLpq1ASjJfju2/EN98CuSp8+MEzAAhLcEG5mr6zAg8prDlLR7l/5E5UcyLEa/Ywstih3
	 QvCZGSiuWcDK4j6ta6M4s67MFdr6C3Z2tnDqE23DzlMTPAdf5g/ZEvoZxFkkDp+uiFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568168;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m8HWtytzLVi5PL3pkolpGz2L94QyN43vZ3eUYHbSeu4=;
	b=dwZ5fRmQJgOIDYzVKmWnTCk3X/7A5xkthwqSdzuhBqQBTuJ+O4hhBgAAokMFeutTz+4J
	 R/XWVTatTDl9FlEQq/qsBkTG2Py2KTSH2P2fkGBziZDvCTfNUApJEw+pe6bRbe7VBWwlY
	 obOfOBg6qYeLbZzZaLZ1HHZUrDEfjw1s8EWGPzmgssBZigIgkjXTxa/tjt4xUZ/dfezMv
	 u95GBOD5wW/6CRqnD6YNWNIcQzk/djijhony2r89dt2y0WdceHts3QPeQ9Xin58oX8u9N
	 Q5zsexVE5j0inCnxGRjttd6SJCyrW7lYIXU4EbiRdRlYhDUHegeFeUlWYxY4T2I5ClA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=nCgSoPJi;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96335606A335;
	Fri, 13 Nov 2026 11:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96335606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=nCgSoPJi
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id DC7F826BC6;
	Fri, 13 Nov 2026 16:09:25 +0500 (+05)
Received: from fedora (5cfcd9fa.dynamic.mv.ru [92.252.217.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 4CB3626BC0;
	Fri, 13 Nov 2026 16:09:24 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru 4CB3626BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1794568165; bh=m8HWtytzLVi5PL3pkolpGz2L94QyN43vZ3eUYHbSeu4=;
	h=From:To:Cc:Subject:Date;
	b=nCgSoPJiQzPF6RjVmEEM/qqvYxB78QHWG+a5JNRoKZOpkveP8kIlGLtF1zi93fwUu
	 NaeFpnU8oOpCkmjiIae1Dw3uyQmeqQ3PlUnSqIAOc1QM1cD/3PxoGeJEYgq2CmsahP
	 Pd7r5PoWzz5LNkGE99D3m2/2CQ4kKx+UVef3K89v/SHkEnVr4O4yynUjlleq3WrS/0
	 J7h63WBIMIorc3ZRZ/ZIrS/vVySe+uNUVgDWjZ8/5I4KJ5jpYaqN7zMeP2nFIwOwmg
	 kLOwRtnAxYAahwmzsnBzwbfwetElEXzQI3I6O+gyYXpyzSWVD+XqozK8yywKjP06I+
	 HR+ZfUWD144qg==
From: Alex Kazinsky <a.kazinsky@ideco.ru>
To: David Rhodes <david.rhodes@cirrus.com>
Cc: Alex Kazinsky <a.kazinsky@ideco.ru>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Vlad . Karpovich" <vkarpovi@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] ASoC: cs35l45: Check spi_setup() return value
Date: Fri, 13 Nov 2026 15:09:05 +0400
Message-ID: <20261113110907.4189173-1-a.kazinsky@ideco.ru>
X-Mailer: git-send-email 2.56.0
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

The SPI probe ignores errors from spi_setup() after updating the maximum
bus frequency. If setup fails, initialization continues and accesses the
device without ensuring that the SPI configuration succeeded.

Check the return value and abort probe on failure, propagating the
original error.

Found by Linux Verification Center (linuxtesting.org) with SVACE static
analysis tool.

Fixes: 74b14e2850a3 ("ASoC: cs35l45: DSP Support")
Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
---
 sound/soc/codecs/cs35l45-spi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index 76f46dc5ab2c..dcef36d31c45 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -24,7 +24,9 @@ static int cs35l45_spi_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	spi->max_speed_hz = CS35L45_SPI_MAX_FREQ;
-	spi_setup(spi);
+	ret = spi_setup(spi);
+	if (ret)
+		return ret;
 
 	spi_set_drvdata(spi, cs35l45);
 	cs35l45->regmap = devm_regmap_init_spi(spi, &cs35l45_spi_regmap);
-- 
2.56.0


