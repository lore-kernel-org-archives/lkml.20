Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013832;
	b=s6LYgWj5UNjdaVrwFlYUO2/aXeAdCumJ+GlNaMqvRxjnyhnroYomCrdn1ZPF5GP7mbx5
	 ZD4G1h93C38K0tbwUgy9YqQmVb9ENus9yB6kKLnZ553Z2fu5zvA4yy+6GjCl39W3VoNIP
	 NovRUF7TfLlkbHMYZtoWQ7uy6UjBt3ARJygIX+X8IaD8fgLaoM+1q4cIQeU7TRmojTzSr
	 uT5nD7hi7BjlLRFyQT2sTL8n7b0XIQNeA3fC9t7n7TjyQsvmAzJR1jYGc510IIIJSDyAp
	 jymGh5gPtuP7DEZEBlkoXn8Qiq03jQFLgfqLLI2yuxZm5xaKodTIiRZGcherqRRFJNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2QtIsSCf782Lvc7phrGj3N6StJAQ3I3P0y6Y7lrPkzg=;
	b=wdZT43fpLsbSGC4Nbn1JC6mobuCrvem6gJ+HIbGhLB3CHMHqbVRgvoRwkEgJR1OM+kqf
	 BnqABmLDNiExvy82crpp+q1huI8jlpDaTZPtajJsj9+u4FmPdiliMN7rS4Lp13u1t17ek
	 VZwNb4NK9dMnRcuG415QKWmscsKIjBWUR7U0iijk3IZP7LzFnMKAqDO1pUSpAiXCKob62
	 qRDkk1n3npM00QWTxnjc/tw2nC+V6Mclp+mlIAYrK0cA/zKF4S9orEfyCh0AAAaptADcV
	 3Bj+QLFw0auUBQlVvOW2zBK/M1NcuyuUtxGsju8usFgxIAVnIMfkrbIszMt0kiz2LaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EmSNslHs;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768AB606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768AB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EmSNslHs
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so4296319eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013831; x=1793618631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QtIsSCf782Lvc7phrGj3N6StJAQ3I3P0y6Y7lrPkzg=;
        b=EmSNslHsiF89TKm3ZUimzGbm7e4ZBnJwRCq+2N73iSm40DtyMbjWIrMnLLQdU+Qeg7
         o4sBgsEo2eyozMrsJ9DJHpyzgULXriiGqF940XRqSzWT6VpNkp2dK4oAB2P5uAHMuWeS
         95X5boKn+NbxQ4w3qz3WJW9AD+fBIohChAUi4HLU0enhNNwO9KU9RduZeiC6YQB4bbfB
         nBtKIgqHXs/zKrURyBJsz8m+mfvKWSwxnvtejFpuL2XAOuSzVK20ZE6Zgu5nVk0X8jFi
         0fAcHzjx4Q+U03rkj0UcngJ2bBwacTbCCmGVyZoD78v7tCiSfOY+vKwSsAca6cj6NNlF
         /m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013831; x=1793618631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QtIsSCf782Lvc7phrGj3N6StJAQ3I3P0y6Y7lrPkzg=;
        b=tuqRtPNf07pKUq+9AHpZhiDl1jDs6EoPMtENPN9VW1CIxlqQW6SRHiSR8PdNp4PQSQ
         9pYxpplXYqI011+xztxXQvGrLUoqX97orl2nEk10LCuyeTLCi8M+/mKlivsmrpimnOGp
         MSIfEUpt4gUAeprIWh5lhds2TRPvKCWAX+jV8xlLxEWmJYVdIxpxyth4XoPcd6Wb4TG3
         KW/QjJ65yK0wzdR53ZljVxx7dYZSYSpNj7bBIYMhtvB6kon2a2ayzWc7DhkY69tOl1Om
         U1zFVyOyl0xewFAgDPFLlNLSRk1WXVWsN1WwIqnMn5v2EPse64zDs3Zol6yPs6juApU/
         /wFA==
X-Forwarded-Encrypted: i=1; AKwUvBxtiG6sOhh2crZl6jkKg+HQEYVtgxyO1989WR1ZtZRCebaKXVBN0/CxAcVy8Iige1ar5J3FmLHulLjck/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmI0s4/F7hI17mE5TJcurt+hm6/CHKhlzzU7Ih6CnhbXIA7naP
	frx3E6Xsq+J50YWwz74nS91NOHt2nktZHoWA0k+DZGpKH/hALQswBLZ2
X-Gm-Gg: AYBFou2KdiO5jPHPxx6Reg44+E3hJgK9BRSsSdB+WHxlgEyVPEz3dc1MEzHfCLblj2F
	pNDWhtm2WyGzxc22fG8dHv5wTey/4tnwfstN9xWlrLj3tUfyKGUvAElIjurNs3Nf1BGKpwzI/Nu
	/83ohxN9upkuB+NtZ+pVg57GlN52T38KjQjYKIE5xlQJJfrlhpIAog7q/b08wFeDGOm3hZY2+0M
	QvtjJEuRLKdqv1Cy9l7Na8hmdelXTdYkeCOaAgqx4hT56LSwhyWrYE6sMct9frkHdZ1gITmjz4X
	4czy2JrLk+KLcn77oheapoy4X0kaQFYU6NjIm3FXXIVOFb/woJugSGMmFHfpuB2/mjqiai72JBr
	vD8XKRD+bwl25FUOVCOG/1Sjkg5XWQWJBO4+Y/1LWqQ+7Y949ymKPSQPb9obMfOOC6MUz2wMn71
	fXkmxuv7SRdhL9Ntv4uTX5sr8nTCgpkrlWd6RfRLA9QlR/jbGQ2IJkUPA4hsYtoFZ88Rcfn/Gi9
	ijSh8zdVt9Rjzg3S9rAlxeECPLtigOILijeeYWYLymQUmdy6oHw9rz7nAynsq8P0e56b5CoGSLh
	av+DJ/x9qB/7MI/5LrWGWHpQzyKs+u+fBoQ2tDDK8S8Z43jEZJg7EWDBf8jADjACVg+iW4gX7FE
	IwZ5rJpAM5UI=
X-Received: by 2002:a05:7301:1623:b0:369:efcf:262c with SMTP id 5a478bee46e88-369efcf2ab1mr7178727eec.32.1793013831112;
        Mon, 26 Oct 2026 04:23:51 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm6599989eec.2.2026.10.26.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:50 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 0/3] iio: proximity: sx93xx: keep the IRQ balanced across suspend and resume
Date: Mon, 26 Oct 2026 16:53:03 +0530
Message-ID: <20261026112342.65917-1-kapoorarnav43@gmail.com>
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

sx9310, sx9324 and sx9360 disable the interrupt in suspend before
anything that can fail, and don't enable it again when suspend or resume
fails. Without an interrupt line they also act on IRQ 0. One patch per
driver, as the Fixes tags differ.

Changes in v2:
- Send as a series with a cover letter (Joshua)
- sx9310: move the wake-up register writes into a helper that uses
  guard(), so resume can use the usual early returns (Andy)
- sx9324, sx9360: no changes

v1:
https://lore.kernel.org/all/20261026100322.16720-1-kapoorarnav43@gmail.com/
https://lore.kernel.org/all/20261026100408.16874-1-kapoorarnav43@gmail.com/
https://lore.kernel.org/all/20261026100450.17023-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have the hardware and haven't
reproduced a failing suspend.

Arnav Kapoor (3):
  iio: proximity: sx9310: keep the IRQ balanced across suspend and
    resume
  iio: proximity: sx9324: keep the IRQ balanced across suspend and
    resume
  iio: proximity: sx9360: keep the IRQ balanced across suspend and
    resume

 drivers/iio/proximity/sx9310.c | 41 ++++++++++++++++++++++------------
 drivers/iio/proximity/sx9324.c | 31 +++++++++++++++----------
 drivers/iio/proximity/sx9360.c | 33 ++++++++++++++++-----------
 3 files changed, 66 insertions(+), 39 deletions(-)


base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

