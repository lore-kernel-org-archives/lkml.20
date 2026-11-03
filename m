Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702057;
	b=i2WACFGuET+IohEWpqcxRvNjCYj5Xu2CPDseNsYSs45/SRTpVEIZNwGy+KyNa+ektI4u
	 6Z8NNWOiD6GUiJ5ZDKdtPeVb7k9/UA3rxWXGIiFFoTUp/+4omo/NGt6bbDQje+zx8xImp
	 d53H8NNtpmR83Im9votWSlCNcNu4q+cRaxNmVVOAw65G4bnaaWCDdxSyoqGiyVEPc7J8t
	 zqioHrQLsX7fpsTW1P3y6sInvYm+ysx92MuMcejf9LIJvibGU1IcFkgbL6V3/2jVuBj/A
	 t8IUhLXSLteGKGxmlHnTYQMJsgq3bkdFzBlUNyIhr4c3IR1tB1kZRfdtEu79mqriPuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pH9/sCYOcncqpCcoeB54AhMetbhpo6QSkADAh3kN1rE=;
	b=mnJXRYXKIpt4Qi9W+krK1nrO5n4DwweRUCqEnleHkvU2XZNhmeuzPlml0UlaQmS5TUce
	 PkIUpdH2lVWJf9a/mFfBPnOqB6SOILLfCXM/E1KWp+y9DIYqb3a6RFzfTenEQb7USe9Ea
	 23a2kJjqSvSxiZugw+6VWRKQpz25hVbTP4fgkSCWWimim4dBDB4yisbA3AKs59lnxg/Uu
	 4iEY7VIqfBFG+786SX0LLnWADiNEM0POQw+bXNbqZPyq8Yjcr8Qqly3CilyZVyNGQ3BYG
	 9jTJHAEpKBNdzbdZUhJmZXVaWxGHV0F0bvR7KhubkDvMaTfnqJN7AaHunAnsaGhYVzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVjJkjmf;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B016072BD1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B016072BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVjJkjmf
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso3414015e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702055; x=1794306855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pH9/sCYOcncqpCcoeB54AhMetbhpo6QSkADAh3kN1rE=;
        b=dVjJkjmfckn0xkYGr9D08aPnZHTdUkDJJlNwNbv2DGseYMYkUSZBk1LO6CtdWrO0s/
         csi4SHazGVyUD5wO0D05jSCqqOmaIdw2ih1q9GLjr5i3qt7fVAxlUi+LK/B54zsJgXON
         ee1gGBQDZZqSwot1JxLe/BhCO143mR4F7B0O/4JdJDnR3pUpAfAyrFrzUqXiiZp08V55
         qrNqtgz/yLLxXE5lkDQo0LCoYNYqFCHbk/VAxN8AWkI+9hDZrhXNkn4rqpqRcCkHYL9P
         g0BlW3eODpQp96QNgVAevJAfvIi8TVUBIKAE/d4rhWoOYCAv55aQMEz4Cx8jEXyb/4eX
         W+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702055; x=1794306855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH9/sCYOcncqpCcoeB54AhMetbhpo6QSkADAh3kN1rE=;
        b=odn0QFwsK4c49AbNTsU/P2nEpDI0Qsgz0umelULusjtMOynJsf+coC5tQzSEyQzVK6
         IYeiZb7G11D7c/+af81Kx256uNDCTS2bkXuoTyN3ltiZTkF8W4BCCbBHhLQEVNLNkpNK
         20Cw48xIqAn1d+p9+IyPsEiYYoVAy1BYJmkfQ9WAUJQfWmZt0QMt3r9G0KXM9wmygSqv
         q0u0i4wdBylaU1EWKY6EBfVffSHXiapAhIKAZTOzHGJUeTufjGmSaetTpjo1Go/rj/Ao
         rkQlgjmtulHvckWC45qfO8f6Daboxv684buBiDQKCBqvJYsmZkDiTD53sYxY9YNhZ/R9
         DKCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC1lxKCNAkcIayjHWNWt7Vd+AFi2zk0CCq88jGwVyaVE/Ge+7udFCzcWIw6qsHLAjCO4yaJzCJJRUr7x8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TyY0zXwVH3b2Sk/eTqa5b789SBYRbSRHYAY0mcoOKJkJgz/in
	45uDH3F704509rS/v0jcyWA5k4SESqsSIZrZvqm5Y96HNvN09rO0yA5bxfqAMxQZ
X-Gm-Gg: AYBFou2uVnrXW7aA5aACRzma1jga3q3wrzVDSB/yl8PwycnBk/8I+dzK7rEV59I9OPu
	C91YYad7y05GrSC1riYeEuK+t4GUpdjaY7qMQstk8yRlRlRRlPGs+/2zwjy8mWSmpryiVJeDu+z
	9vvQCbzrlHDfp3ZRBKYOi2cER1AwbwckAt1d0eNd7i1sF/80UUNx1N6JXdq/68btdyE+E/WN789
	px/uy6YCv7/UFMYcLZWfcEZsOf+tjRcRJCjleFemrr1gqdGtLN6jSQBbQwQL9+pmpJg/FMd22EB
	myoU0yI1A3WGt7uJapEQA1VKS6Vd/WL2i2r38xGNtEjlKO4DtIwwxbdU0xOMCaU9eS4YQHe2aOK
	2ALCryPKQxx32ggm4eZUMgZqhoSqq1F8wgPVUz1uQtqezY8Rvfa0eSm23w9q3HYIZLTnzEpbGoe
	jCx5XxqQirVhR5iZ3WzyZVQyANTS4ooyc0vW+WsWm6kn/epjkNSHugepOph2MGOUS3Wzx6hRJAS
	3CPA61hataIbXe8S+tGaPDjbYXg4q5ogSNDXWOFQ2KaPnxMlmT6DKWrUiSctN39kDzbt2Jq9kDe
	zJlI5vJzsYSWiekinY89iBPZgriDeFFrzlrdsd1XuN4xgOld+uovSQ9rUkKewuwm+Kmje7bDlb/
	+Wg==
X-Received: by 2002:a05:6512:15a0:b0:5bf:b93d:a75a with SMTP id 2adb3069b0e04-5bfd957985dmr4108363e87.12.1793702055494;
        Tue, 03 Nov 2026 02:34:15 -0800 (PST)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm2074917e87.1.2026.11.03.02.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:34:14 -0800 (PST)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: qca: Disable SoC debug logging for WCN3950
Date: Tue,  3 Nov 2026 12:34:14 +0200
Message-ID: <20261103103414.803861-1-valorcool@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Added WCN3950 module to the switch-case to disable SoC debug packets.

Fixes: 590deccf4c06 ("Bluetooth: hci_qca: Disable SoC debug logging for WCN3991")
Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
---
 drivers/bluetooth/btqca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 002307000d3c..60735b70d89a 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -943,6 +943,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	switch (soc_type) {
 	case QCA_QCA2066:
 	case QCA_QCA6390:
+	case QCA_WCN3950:
 	case QCA_WCN3991:
 	case QCA_WCN6750:
 	case QCA_WCN6855:
-- 
2.53.0

