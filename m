Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44FB4DAFB2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166850; cv=none; b=K0JI5ZUlpr4M6GAdmhTR3LCbcgz3IPoNSxN6UEGbB52xru0mFwz/Khrg/D0kbxuLSwnbixLEh13LlmlA0ENq0b3JZUkbq2gtGbp6vQygI6M09SXPPKfBs0zWynAAascdEm2L5Pv0G/Co/QPr5smMXDUQFtd6CKxWOgF6Ot8yqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166850; c=relaxed/simple;
	bh=qOx4VPiE2Aa6FkdmjctOyjkNaye8rTr81qvDw40+nBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJGr3k3BQhwI2XKQ8KsPP+4Ex01ORgVKXhk8GvC+x7owUu5j3UyQdch5GPOKmcq22co0jSDBame/RWtDOki4+zc4tWRo+brMhs8rxMgznpGb+eclpS7mEFiEu5JBUQXMFHmYbRF9A62vo84rhwWcD2G4Djuh1o3VeveSsct+nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADV5wSmT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADV5wSmT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so1133725ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166848; x=1792771648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfoHK1ZIKQ1TgR5QFK+lCQM9pR1G/aWYu6gXDDq4ISc=;
        b=ADV5wSmTZEOWKQbnj1nDMmsSCizSIRQFPQiTUh/VpypPqJIx01ELSL1U5Fakaw/7J/
         RlB6NVPKEscuR7BnH4nn/2HcX1o3X8wsvaGkx1hL9dvQoRays2xiNE4aomrrXboh2ccY
         AXCs6deNryl2fJ+MhpXitHvGJuBw3qJ/dkmliVOxg5UuzLx9pKAA0/fnA1Hu7xaEUI9W
         Ls1ww3jGkKOPG1l3ViTHg3xMyrW/N3fkyGNpCUWjWBeEMz3oGQQC+5X9VN+B5GNNI7/4
         rDi136hiQhPnFmHbhKXuuHzXv/PDr4e9GmpAt41r9XHzOYz40hUPEl4Q7v1sqvmTcdcP
         kKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166848; x=1792771648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfoHK1ZIKQ1TgR5QFK+lCQM9pR1G/aWYu6gXDDq4ISc=;
        b=rK2bZMQTGMq/Vm1h2yfSortXu+jWpzt9jjiOUu+ZztuFVD50XGsHZ9WW9JkGn3y7fM
         cwREVsyTCiYITndebuAUiqoxEs695/qfivQmORHYgyKSVrjcBLvqDseDcENfN4Gw7lN8
         YvQnrXy8IMTfTFG3MC6Xn8tLMhReTAi6ynqg703445oc9GWSCd6YONCsMKegqBqTMSEg
         Gqf8w7kelA4s7RqnqSRXaGsIHyzxCcnWcM1Q3M+/qGeqViM8vyLKATXH6qpzy5dVd3Rv
         C86U/YsHjwI7ejoBwYDijsdcWGvPNnoRxNenJRRH8bnysOXhWV2+KOd8H1X4XzxHv/ti
         blxw==
X-Forwarded-Encrypted: i=1; AKwUvBz9iIjIwhJRk0hMxbBB+EX8/u7e1sDTcSFh52vgk8/9i8XaRxKomLZpIFS4PAs9Ci9nO0VJ2GWBUDUGVGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXlMqgLPabQcSv+ifAoPX28jD1wFrJe4xhVpjO6OgLlxoevE67
	8McaRlTqHsJ0j1CYvYmMVc2bEGb9sN13Gl2OqHCJEkYOLHRJf1JEXqQQ
X-Gm-Gg: AYBFou3W82wPOg84UjYOotwvuzP6wGJLAgGs9Z1dGXLla1vBoG5o9qHnxJOtbEOwxjy
	rVuNtIUa6fS/F1dHHnJOfRqHIuEBNAm8Q9edcrrHAieSt5b0HfEfb1FROt/L1J1Z6Z37CimNwSe
	KD8ehpxASLcPghpFXeiMzVwhpwgYc8NL88IACoGF6XzL+RaB6ZKnhAtjxqk2j/Ig7AWcPAph8X8
	zyB16CbfgQm5x0j+iwDtvxAEjbZuatQbwJa3ajYkCE6jq38lfP9ERMWZExNFllINX8JkCVivtHD
	p0s61Bjkg2Y7US5u8x1IGmvH4cuxnQGNBg5uYtKlkOfQJpinepyf1SY35s8HUuFvdvOuEquLB5B
	SBqgSg5fQNfRLtG/Fx1p71B0eEw4kPV8AZ4XY0IPq2DF+OS9oRXaMqpCx5Hxi5s53ib3jErYvRW
	++Cms7XpiraRq+cXI4R2KnAJ0+5+THre+RFxgulnf+LKYQ0Fb8qzn1HBZFVBPXlWP2QrEY0oNMZ
	LHlkEVywZu/qB0AX4m9L/cyq6vU7iOHMIGouYh2PkYLdd9bszI=
X-Received: by 2002:a17:903:2b04:b0:2e9:7770:cc35 with SMTP id d9443c01a7336-2e9a6a07297mr2933355ad.17.1792166847953;
        Fri, 16 Oct 2026 09:07:27 -0700 (PDT)
Received: from casta ([2401:d800:20b:1196:6a2:5930:14e3:f74b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1f0asm12294325ad.68.2026.10.16.09.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:07:26 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: paul.ely@broadcom.com
Cc: nareshgottumukkala83@gmail.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Subject: [PATCH v3] nvmet-fc: skip port entry rebinding if already bound to a target port
Date: Fri, 16 Oct 2026 23:07:00 +0700
Message-ID: <20261016160700.12021-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvmet_fc_portentry_rebind_tgt(), nvmet_fc_tgtlock serializes access to
nvmet_fc_portentry_list, but does not prevent multiple concurrent or
duplicate target port registrations from attempting to rebind to an
already-assigned port entry.

When pe->tgtport is non-NULL, WARN_ON() is triggered and pe->tgtport is
overwritten, leading to kernel warnings and leaking the reference count
acquired by nvmet_fc_tgtport_get().

Fix this by checking if pe->tgtport is already set before acquiring a
reference count and rebinding. If it is bound, skip the entry to prevent
clobbering existing bindings.

Reported-by: syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=be62d4b375542ecebd17
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>

---
v2 -> v3:
- Correctly place pe->tgtport check before nvmet_fc_tgtport_get() to avoid refcount leak.
v1 -> v2:
- Move pe->tgtport check before nvmet_fc_tgtport_get() to avoid refcount leak.
---
---
 drivers/nvme/target/fc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..43c5202a82b6 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1321,10 +1321,13 @@ nvmet_fc_portentry_rebind_tgt(struct nvmet_fc_tgtport *tgtport)
 	list_for_each_entry(pe, &nvmet_fc_portentry_list, pe_list) {
 		if (tgtport->fc_target_port.node_name == pe->node_name &&
 		    tgtport->fc_target_port.port_name == pe->port_name) {
+
+			if (pe->tgtport)
+				continue;
+
 			if (!nvmet_fc_tgtport_get(tgtport))
 				continue;
 
-			WARN_ON(pe->tgtport);
 			tgtport->pe = pe;
 			pe->tgtport = tgtport;
 			break;
-- 
2.55.0

