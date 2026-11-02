Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627974;
	b=1KqqCXv1R1qJX9tWs2LnVFiakoZ+b0xS5b8hteSWaS/ADEF/Y3hIeC2XOl86vmnocdVL
	 VZa6ijtcDrlNiKxmxoai+3Qs3U+U76uUDpSsx+CEnK+xdTTToIoPRxWaxPPUy4Td0k6FR
	 nGEh/6rKIfJqYorw2IQGDwpQMSlLqAP6ET/eHg1NLhqIxdP5lvfEEyGTJJZW5iLl33GEN
	 V+qfC3VIcRNuPdt2/ct4tpjX1JpYPZLHHVQKoLegF2Cbjyg8m8ucyeTXs8R5+JblBQN2I
	 d/RsDZkORV2Db2n1uiYhIJvuedSWYyKpayzYg5LUfuOTCcBxsJ8CefuFsN67BB76+NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S2d7OdEO5Uy3arxUL89OA5ZZcKM4fqZIMbcJ+h02Lps=;
	b=0rMh0ZTA88/eLdNLEBjLA+82VbyETrp0EkrQQQ2rQTD5s7tvyVp6jijByZdZAAxkb2Yx
	 CcWU9pidD+n53LW3PgZYdHUdluAtYSVhYzPcqF9M4C+SYTwTXvCB50dlMdXpoI0ewlgPW
	 nNvbrUyRAto0mW5AslONg2626Ba3efJjmWoH+Hsin17CkaKY+0N8SNCEdgTOs22vDwZYS
	 tIbCJLsdrdCrXz3ivK9PDzKciELbOB23uofipxbQQ5+XSEj95Q8jomvoMCPHs/svHaEri
	 8/5p7iH0vR1KsfWwYAr0jVM0A8O/dYEVJ+DhCNnkPBwRgAwiJPmLh2ODNwSh3WFD6xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBUnxIfJ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8B606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E8B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBUnxIfJ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso25242705e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627972; x=1794232772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2d7OdEO5Uy3arxUL89OA5ZZcKM4fqZIMbcJ+h02Lps=;
        b=oBUnxIfJDoTZEByopHtEIdJUz07MmRKUaOQlkZrSFrJ6mML3CxCbB18dGoaYnGq9Vs
         pTOhEao7IAJrPqBvsd8MQDNNWlYs/e5e6z71xIxUoB1IGN3Y5JdagVUXIPbx24AGPbFv
         YFJbTrgXPE5Ed3Se2V7RQfOWd5ZOxah21CKOVc+IBQrcAJVVD5xA0q3n18X9wP0n6nEb
         cZ/9SgaF99UQAK7Lb1rUDImy7wEdptuQWjdGz4718wSaLxnpX0zJTaZFVWf9zz+qkKwh
         EI12EzgwYLDcf10HIn78HuD+UKeOJh86v+6tcH2yfyo9UvEhbHBNRxVNLTaW6/mvlaJL
         QivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627972; x=1794232772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2d7OdEO5Uy3arxUL89OA5ZZcKM4fqZIMbcJ+h02Lps=;
        b=tlWO5M5tRZbX0mP9ITgRKlsBIM47m57b0bG0aVn+wvuP4DNeA2V6v8BsgmpX7zcoHr
         /Kw11ASjj6s5IykUmnANH8FU76DYQod/eOnz5hh5ogOZr5RQ5RNfVKmeEouKCpDJF4je
         PLTJ9K4Z6LTbyLmE3Q6sLbBg21AY146jCAwDuD6BUVERYiUvivSKhhU/RFFCdWPxlCSD
         fY+Pmq3AoJwmqNlm3P6A5GJuJfudEvzkQ3azYxZHJ7ZC1PL3FXJO5b/PBA/TCHN9rJdi
         MbYwkgwfoUhvjcMJLWu9tSRRrhYMwUtF8OdXIEL8+U1+ad0s0diGwzKwGbWlcWkkLk6P
         m7bw==
X-Forwarded-Encrypted: i=1; AKwUvBxFDakuNXOe3+Uk65TFZ9bQ9OUjrnD3nAYTKmGimagvcVQ0u3KvC//5hinIMZNcDdFutPSfyO0mcHQAfDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+Ec2dlcc4ZVMA0OPq9/eUb5HkXelDhZYIbecWZfA0qaS0tQXH
	MMxBtw6yDq9JgksyogkfPivyTAW0ZyydQBdp5wFGghXqYlBgiGOrKt8=
X-Gm-Gg: AYBFou0Ow2SZnjkjun53PBSJakp89PmK+0whzEL8Bw2bno7iz6QPb6gbl0QzqRYk2+A
	X3qrMnwDp3BusbtAC+JxyK73ezujc88dJ1hEHbXKnW3Bc3fNRqAptLCYoVJfcxFCkBVqj+UEDNg
	WOv84OaGyE/vnHY45O8ZQJlga+TWyCq/yP4B5r8d+UmL5eTNGbBbl5fA6daAChMnx3tURmAOkbZ
	5osYlLsxyJ6a1dvQN9qIR7hfle09pBTQL2dMqX3AJjqDH/B11+nTbanNJXyk98B3ToTO83MuB6Q
	8LdDPW9b8HVjhMMBQrWr9fougeJtPbF2t9nfi+UZAa/fIBo9zdrfA44y6cowavbL7vOaO1Oyk8J
	m6NGQzvw2dPWhHTuoZob3oWTPRjf9jcZu5toSgln0lcI0J/FU7sq8uCUc9dI9vAfz9s7Oi4bmjO
	CiNIdkGtiCkvqLGFIRCEC9V5eIhmohWqaz1Xp4QgspD1Z+lFCcScrkLJlFkUKUBcLqINZmgby/y
	KYQDEje26IgyMHcpdE0FzSBwyblNLComRXEQROvMP+vdvjJrvL54XehrvAn17ypi0gXmNH0vSaT
	gu6ueVseqY0=
X-Received: by 2002:a05:600c:848c:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ac17471091mr246374955e9.6.1793627972424;
        Mon, 02 Nov 2026 05:59:32 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm352680265e9.12.2026.11.02.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:59:31 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: briannorris@chromium.org,
	francesco@dolcini.it
Cc: bzhao@marvell.com,
	akarwar@marvell.com,
	linville@tuxdriver.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 0/2] wifi: mwifiex: validate firmware response sizes
Date: Mon,  2 Nov 2026 13:59:28 +0000
Message-ID: <20261102135930.701845-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

Two missing bounds checks on firmware-provided size fields in mwifiex:

  1. ext_scan event: buf_size is used to determine scan response
     parsing length but never checked against the event buffer.

  2. command response: resp->size is passed to individual handlers
     but never validated against the response skb length.

Both patches add early validation that the declared size fits within
the actual buffer before proceeding with parsing.

Tristan Madani (2):
  wifi: mwifiex: validate ext_scan buf_size against event buffer length
  wifi: mwifiex: validate command response size against buffer length

 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 14 ++++++++++++++
 drivers/net/wireless/marvell/mwifiex/scan.c   |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.47.3
