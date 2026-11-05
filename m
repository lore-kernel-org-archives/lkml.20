Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860937;
	b=cvtRLg0IMK89Z5JlL4ln76+INpStjwKWKCH1HFf6rFyh048brtV1yDsuXqp4Oh1/zQmc
	 GdB3jYmk/SUkrYvYWD98v16dccp7D5E8jm0lKZ9S525nXpcgmbHJmNW/YoblHypnaA9o8
	 DebJTFro8ZDRTl/48BhrEetZ1jb9KnPsBrlT8FgsriHQkaRgfJm0Ez4srEms/9DDT18gI
	 zKkcyOAbwz6LwSSt9PglY6C4Msx8n1DU8sfezaJXz7zjLVXzZR0csCiPRs1cHWthN3nEM
	 it26JFumHpXxr+doLoQe+hBgreQ24sYgtY723y+7I6jzghK6m5AsDG+YovWyBxj2jhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NF/a/6Zlb6tJSOx28wRj5eIz+JGBGlSlzrB0EoHWe2o=;
	b=EBTGGkoQJzHLAjuusIPL2vCz3vCu4lyXRWJ+z3H1f/egdmnpbFojvIsgWsIG/hWLTHHS
	 kwP4Nl9c3LXPVysFJzblO3Rsxf6OHYJQNungorCy8ZYbsiRgUEegf8j3PKM6cSFKwNS/m
	 eDtqa4F2cdZURvYOpQMDofQowjS9zBTgS4mH6KxnN5wAYREuqdko1fRRFzk4APvMXio9u
	 MsYUxoT/c2MapEyo0CO+Xe7NJ6Du7/EhX9uDPvMb9UeUjWcqynz7EHEMpiqTsr3q11YQh
	 +sDRsA3bUB+j0vjG2StwHEppY1dT9svOtM9yTrI60EWx3M81aM/VrX+OoGx3JTTXL7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRNClCox;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11101606EE84
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11101606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRNClCox
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed2bfe3252so730885ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793860936; x=1794465736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NF/a/6Zlb6tJSOx28wRj5eIz+JGBGlSlzrB0EoHWe2o=;
        b=jRNClCoxaImNCjoLeYoOnoyUASdLr5EcLf+Y//aoJQcFBteCQ/i2qh1kTF5XI9u+ay
         2pM+UmEiLZQ2bFe2a2lN9NF++sCdNdfqhsKJmjOCAyxy94dH2WuW9+IahfUJlhrIjzR1
         q37CxLluU2yMfpADDXbxcyckP64EUKEBRXfpDRAvJGyiPj0dP4M2UNS+Z8s2L7B4LpL6
         eyjQFm8GWuNB+XqH+OD2UHSHqjuLTCq1ni7lLfdLmYopOKplk+jXpZquMCeAijKqpcHR
         KwpKAPrAsjp9/toymVQ5Buh7PuqxzMHjiZ66wQVrpOxE+xemmnOfZV/G1SIMxRxaIjq+
         gbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793860936; x=1794465736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NF/a/6Zlb6tJSOx28wRj5eIz+JGBGlSlzrB0EoHWe2o=;
        b=cJaxuVWI4obSNgQUDxkvO+55f6D2cWXXW5r+P9/OXbiOoGXqXgnnkKv2pKdvfWGwZm
         VI24FJLtrZYhBe7CN0/PAYMpZFCz/WDMoZnxCR97W1DadB51ijaFHNBCczSYY6pv/6/l
         N8HkkdwFkdlwjNZK5nWy3YB1DnhmBUDquHAYNP2BJ+Lj3yre/0yYpzc5E3HeO0p0X1Vg
         uYU736IGf2mdmwYDcZ0tE/mstOn5Q4+cnQRMZcH7rDx2gF7NwXaozrDV6HcJmFq5ATm/
         yWqUi7E0kqqeGzjrVSQEla3krOtS7Sm/ZA1WKwDCHFJOBsXxdJbE3ZyohdKSls2LGTLO
         mqdA==
X-Forwarded-Encrypted: i=1; AKwUvBz5auxClABK3OsJroslHKlSOz1dDLS3H2ianIy6Ibu7r4oZ7/t2ujA6YV+iKFA66V4RYUhbTS89AbKcY8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hl8mOZ1PrUKaHLodXWU0aiMotqPpAa96LAuWuEXCdx/OMvPKk
	db0POsO4CWQmEInQbjJvIB0Hg176K026K1mRacORDtbzm4/WZDD8sQgl8cmgijku
X-Gm-Gg: AYBFou2V1ud/AEhwURBh+YYRY48GRNZCUyjDDPoMDutTRUQa9SFQRJJj6SExrkCKXda
	TcFV6YLbb2Vq+g4lpsU63ZOsRCiewQMd7qFogPQ4bciCBlUu3pQAjDfrk78g+qzOrhA0/kfRVmi
	9biLxXjzX3sqtbNxT3fm3Vrdz5qh73Sw2nUxTE4fk4iH2i4f3qXBG1WtQ3YSxUj8LW4sCH6zsTx
	5FQlHZE9wWZAYm/koOW/7/fsmmOpxteK5JCmCrpMR7HTHIjfsB36m7Um9cJ4PBAt32N6buEQ4xa
	+CcWkoQedRJxcJjPEbC5ahDh/w5l4NZFZYn9VsNR90x3wGQo17EDXj7/3Bxgv4ToLtECLh48nsw
	wR/21EAEGD3UVGMwHwYtzfff9bbqbqpsR/cUPjEIfszQdQMumQXHxA/mtG0ZtPUI9R4gnWY4EzV
	AQt56RyzQ8ZQLoNar8vOjxarwCFrsVx/zVTUJBHjao6jAJW4e2hFlPqNZs3R+P7ramvSdULNiXS
	rKVh3uNfWPV0BhXSnEZ28gNRr0/0uHobp3UXhyg0B5DgMegoAh6aSRExdMB7yOdSwoQciRbe6uq
	dQQlU4GWnA4oj+/+NtZMkRET1UudBOGfEJCc4yaxI1YGrkD0
X-Received: by 2002:a17:902:db0f:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2eb364ec8d2mr180212465ad.45.1793860936395;
        Wed, 04 Nov 2026 22:42:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm13702925ad.21.2026.11.04.22.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:42:16 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: coda: fix out-of-bounds read when parsing H.264 SPS profile
Date: Thu,  5 Nov 2026 15:41:55 +0900
Message-ID: <20261105064155.1342011-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

coda_sps_parse_profile() scans the compressed OUTPUT-plane buffer
supplied by userspace via VIDIOC_QBUF for an SPS NAL unit and then reads
the profile_idc (buf[0]) and level_idc (buf[2]) that follow the NAL unit
header byte. Neither the NAL scanning helper nor the final dereferences
are bounded against the end of the payload:

  - coda_find_nal_header() dereferences *buf++ before checking buf
    against end, so it reads one byte past the payload when it is
    entered with buf == end (e.g. a zero-length or start-code-terminated
    buffer).

  - after the SPS NAL unit header byte is consumed, buf may point at or
    near the end of the payload, yet buf[0] and buf[2] are read with no
    check that three bytes are actually available, reading up to three
    bytes past the end of the payload (and past the allocation when
    bytesused == plane size).

A local user with access to /dev/videoN can trigger this by queueing a
crafted H.264 bitstream buffer ending right after an SPS start code and
NAL header byte, resulting in an out-of-bounds read (KASAN splat /
possible crash).

Rewrite coda_find_nal_header() to bound-check before each read, reject a
header found with no following byte, and verify that profile_idc and
level_idc are inside the payload before dereferencing them.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-h264.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-h264.c b/drivers/media/platform/chips-media/coda/coda-h264.c
--- a/drivers/media/platform/chips-media/coda/coda-h264.c
+++ b/drivers/media/platform/chips-media/coda/coda-h264.c
@@ -19,13 +19,13 @@
 {
 	u32 val = 0xffffffff;

-	do {
+	while (buf < end) {
 		val = val << 8 | *buf++;
-		if (buf >= end)
-			return NULL;
-	} while (val != 0x00000001);
+		if (val == 0x00000001)
+			return buf;
+	}

-	return buf;
+	return NULL;
 }

 int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb)
@@ -36,10 +36,17 @@
 	/* Find SPS header */
 	do {
 		buf = coda_find_nal_header(buf, end);
-		if (!buf)
+		if (!buf || buf >= end)
 			return -EINVAL;
 	} while ((*buf++ & 0x1f) != 0x7);

+	/*
+	 * profile_idc (buf[0]) and level_idc (buf[2]) must lie within the
+	 * payload before they can be dereferenced.
+	 */
+	if (end - buf < 3)
+		return -EINVAL;
+
 	ctx->params.h264_profile_idc = buf[0];
 	ctx->params.h264_level_idc = buf[2];

--
2.43.0
