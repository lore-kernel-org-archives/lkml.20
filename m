Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FC26FD97
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598182; cv=none; b=KRYhiybjb/bG3aAqp59v0yK3cRGeUKpww7o01KQYmQmlxsU/CX3BUqLHNAahRBmkLzx15kWGnv9YD1lPu9KCk4pTXsjA+XBLbsv4+hubcUy2ygJ3iHL1TW/EVhCQec2dLahgkBAFnLhZTJgE/ziRt+RYUVxIzbs46a3lU4ZsQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598182; c=relaxed/simple;
	bh=qAoyVKmozYbnipeQ7gMMeMMuDIzRloalTulxU8vQOLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJ6EM2cnbB5wlriRNXqFEtdY7W1F+ZtjFKMesNeKcMiE9z2z5kdy66S1PY6l3oB6bXEYBuLzUiAsUWBIPErjbw6t1UNeTLWmVB7Krdi2fIbKr3qFgbn4z/oKpnt56yrVWaflRh70QADsHVP3aIMOaQXoEryIRGaMT06K1iL8y0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=P/VXBOdn; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="P/VXBOdn"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8253bc5a613so286709a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791598179; x=1792202979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uD8coseHJ8cbO2psrmuf1ZffJ2GQja8vTBxGB69y3bI=;
        b=P/VXBOdnt5vLk0UIp111asvAatZ2kJ7Y5E9xow4P4YnN4EvnzldxzhJoGWYK+IIO+L
         7MoaOoV4rjBVxhCsARuLVtP6YLTJ0CG+dskwKmHU5vkb2t/Jsx/KVXxYHLVlmKlw16+F
         XotDdezamgdRB9Y1tXQ/Gb32PH2TywPT7w4D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598179; x=1792202979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uD8coseHJ8cbO2psrmuf1ZffJ2GQja8vTBxGB69y3bI=;
        b=1kMKmdztZ7+JoY2AGrIaWKCrwK/pl727KJj0Fb5Bl5aO+lC6cENJd5QaFq1CG/2b7c
         SkAVzbUvea3d7rFdWgv6/EIQDb33S2HaQC/Ir4LO653j/y1TE9a+dSARg/KrR4togO6W
         49054Bx8vdBjQQXfBixXDk9cXTEB054UL2YMNqSnmmuW61ps5TQ7SMX8BvoXyBi/UpgC
         hJZ6u7nsue4bocSHFHYRBg0xJrD07hlePrOStItGExvTYjNMKpcE/7GPctZ5UCTNOqjB
         YZnnN6U84C5L//zLdIDF4XWFyhUiW2auZsEg95XZoiAxAqOdOVxI+KxvYBzl5/tpjvMq
         fXbg==
X-Forwarded-Encrypted: i=1; AKwUvBzWrewJkDBxYenfuUnNmHjytlOpGABhpnmY1ZepSpnEP1blT9ITAc6C7inSZT1oHbahKp4YrEOIgPserRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4QNAJpMaqr0W9iNyKoZOcgwvU0xvDFxs4Oa8asmXGfP0Mqbj7
	8C/kHBY8v+4fijXgzr2J4S+B4FbqXFzpoOK0asMfONrUGl8Nq4aGcbo7cWKbUiwiYSk=
X-Gm-Gg: AYBFou1uZTJ83xK6zGx/YfUltM/K41F8F46qHfhpcyqUJxb9fTb167wa/RMKCqFySPI
	Y/nPVRs7LnWMJH15dh5oXs2PekAeePTbFxREGB+UPD2QTrqIJxN/jf0Qo6GfPu62eG9dFLyDGg5
	fEeXMj/TDxYyEpMnv+rxh70dSWua4RtHhk80sZfOEJEkiSiS3F/57vttpCuQ/SFohDCZ8nb6HaX
	Jh1HdzXyCXyR0yI+53+HfLmiQR00liZB/l8X86GnW1VJM+fErGhl0432lYJx/Uk5STnmxG/DG/e
	2mvCHpPtfgiTR/Sf7A9hgXPdcp+Mq2K3ezS6NzviEcP41gNoX8aACeSX5w4vzouCgh2CEhhs0pa
	5h7vv0Qm+C/vl2rzXwyBh82j1Owt4nK0prqi/KKC6/Z5W/DWpPe2hvvp4vrxPao+McofS4QJVHk
	CVX8bQrMGjWmDEToFGYyFf3bSZk+N00hdxQK8ZApuc/V+oW1YW7TxgEGJ7093Y/MaGwmZGPQNaj
	1tpxNy1SPupO5C040WlHv36yk8rB/PxwDidLdSLbaRTF2ckIj0bW0GpPXK4z6Ptudi1RffnDc0=
X-Received: by 2002:a05:6830:6816:b0:806:1e7:4167 with SMTP id 46e09a7af769-83095843911mr3366701a34.13.1791598179659;
        Fri, 09 Oct 2026 19:09:39 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303a515aa9sm3580257a34.25.2026.10.09.19.09.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 19:09:39 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] xarray: initialize the offset of new root nodes
Date: Fri,  9 Oct 2026 19:09:34 -0700
Message-ID: <20261010020933.83051-2-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xas_alloc() only initializes node->offset when the node has a parent.
The shared radix-tree node cache clears slots and marks on reuse, but
leaves the old offset intact.  A new root can therefore retain the
nonzero offset of a former child.

Lockless iterators read a node's offset before loading its parent.
If xas_expand() grows the tree between those reads, the iterator can
combine the stale offset with the newly published parent and descend
into the wrong subtree while retaining the original xa_index.  Even
xas_reload() can accept the resulting entry when the offsets within
the two subtrees coincide.  Page-cache callers rely on that check to
validate the folio they found.

Initialize every new root's offset to zero before publishing it.  The
offset sampled by a reader will then still be correct if the root is
made a child by expansion.  Non-root nodes retain their existing
initialization, and shrinking only promotes a child from slot zero.
This fixes the forward, reverse and marked walkers at their common
source, without changing the iterator or page-cache APIs.

Fixes: 58d6ea3085f2 ("xarray: Add XArray unconditional store operations")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 lib/xarray.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xarray.c b/lib/xarray.c
index bfe7bef80f34..509d7e4157bd 100644
--- a/lib/xarray.c
+++ b/lib/xarray.c
@@ -382,8 +382,8 @@ static void *xas_alloc(struct xa_state *xas, unsigned int shift)
 		}
 	}
 
+	node->offset = parent ? xas->xa_offset : 0;
 	if (parent) {
-		node->offset = xas->xa_offset;
 		parent->count++;
 		XA_NODE_BUG_ON(node, parent->count > XA_CHUNK_SIZE);
 		xas_update(xas, parent);
