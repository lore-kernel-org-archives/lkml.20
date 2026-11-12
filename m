Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493884;
	b=5gRm+n58DMeM3kZmoGrNNFeY0muUGIP6ce6flzmTy/HpHXMN9+RR+j/ydiWfgzEU61l6
	 hK/3YQ8SukmLbWI8jIxHEj1GPBf+5ejd4WoA5v7DYMtCblOQvI74ZUUf0hO0PATCM1zZw
	 qMZnDoLDgY5nCq3Wc1nwcF6CjA68ZLFdanm8lMZSQ7ledbuozRDRVjjRg7BsFKJIz9JqK
	 MGeeCErZj0ocuWCWN9BRQotqUrEzOhWA+KSPZGJKM5SZeEWwjJ2TeoHwDpZBVyDUJCb+Q
	 HS/F72Gzf+aoT9QFT4sNdj9KkQjiOW0Hywl90HAEFnXxpQYGKdpekY3fjV65+i50Xgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493884;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=dFWyJvTngXPqfaUWjYk5M8MUVWdXx4H8kWQX1Ycvc9I=;
	b=bPNgkCkWOS1DlE0u6RuflFeZUreyo7mS9VEt1OVgtrq47duhY6sIN4RLf8JR2aSFpkU2
	 84trDKASHIWMJmlWy62DSS11m8FisIgvMcghD6xqB3oksF3MqmU385MB+QIzp60D/gDd8
	 cbHH4YHRJF/BTfiR1W+BuoEci+kqk5sWdoKmJXeiL3v3LjTSY2uyrBMw7PbKDtJAi+28l
	 2lunv2YAaOD5zz9iG9FP9x6vPGzgyyOoFCkJOez3BqaErBpE/1jcI5i8GevQIhXnE+XVp
	 hhe8GTbqJyQLIh3pbtWvI43FqJA0cjhvzIOG7WEvC8evM+1l6katDYI43n8Q13OqV5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FnJTtJ6T;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09E606D547
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D09E606D547
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FnJTtJ6T
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D78C1A1629;
	Thu, 12 Nov 2026 14:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 341C75FF85;
	Thu, 12 Nov 2026 14:31:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 990A711BC0326;
	Thu, 12 Nov 2026 15:31:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794493877; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dFWyJvTngXPqfaUWjYk5M8MUVWdXx4H8kWQX1Ycvc9I=;
	b=FnJTtJ6TdHIBj4O+llsgVqouJGgXWjL4TJ0kAnKKmWHGPZT+zyON6x8TsYscgmH4Qc6Jiw
	z5o0cUkCDYL26sKahjta6PPUykqwsRid5M8S4OssV1v9Y6bsiZXBKiPP4f060tpAIwUT60
	+cnSplnSCgGZ5btgy1twHwUOlyQtrdXWMZ7bqlcHeQhcvlQU41dm6REQGoQv8o+Wk69rK2
	0vfBQGVO5HmTrCFH8hIOfj6cHvgkq2Faji6twzzlBWvIhrTVSehuhZl1unP3X3Uf9rUC29
	qB7CsxZ0c4NL5/3ORdsbsOmpKrn45edu9mwKBDgMKmcIlT76J+yldv1MOSiK0w==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	George Cherian <gcherian@marvell.com>,
	stable@vger.kernel.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 3/6] spi: cadence-xspi: Inform SPI core about size transferred
Date: Thu, 12 Nov 2026 15:30:47 +0100
Message-ID: <20261112143050.53347-4-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112143050.53347-1-paul.cercueil@bootlin.com>
References: <20261112143050.53347-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Tanmay Jagdale <tanmay@marvell.com>

The SPI core expects the 'actual_length' field of the spi_message to be
updated with the number of bytes transferred.

Fixes: 931e389ded0f ("spi: cadence: Add Marvell xfer operation support")
Cc: stable@vger.kernel.org
Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

---

v2-v3: No change
---
 drivers/spi/spi-cadence-xspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 87b986a318f3..189f87321777 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -1207,6 +1207,7 @@ static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 			}
 			cs_change = t->cs_change;
 			t->len -= current_transfer_len;
+			m->actual_length += current_transfer_len;
 		}
 		spi_transfer_delay_exec(t);
 	}
-- 
2.47.3

