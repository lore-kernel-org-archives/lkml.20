Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794160486;
	b=NCoK2VZ0hPo/ycVxGuY6LdsJuemCCZCkNzx+Amrj3F37qnzfUwccqUP0W6Se1qrKc9GX
	 /j264t5QcidjGC+Pgw5Ppyjxks7cPk4SG5gr5OyWhfQNlj1/0eicV+y15rIcz4qsCk1oB
	 8cmuRZYjhUyoGx2qF/q5R2bM9AOwSQgZvbwbi9B1DVA5WdeBtaJkGYMdHIjTnshHCrwEa
	 1G5VxLfue3VoY6o0PHI5TVw5kiRBLvCjJ/bmY9m7P36udjVshLPtUaSbtf/vSLnNZHMhb
	 9MUrDpp9Q+gGm5qqIfsnPl79wlgLXM3Z1q/LG5ZhfMM3krxXaOEKuFuvHRY85ch6Drw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794160486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XN+82m6XILmToReUZb14mcLlVGl4HvQRUT+BvYNhBMU=;
	b=c4YkfR0sX/f1uGUz1EKmjv7YxPpgq9a6c4FsbA6Gj7hl6CNbodu2vtyHXQYjDlhGOekZ
	 N9hwUoAIB8WP3/CeTHplYSwEQlwWJGc/SxnYUDIRCUFG1JGFaa1ycWEvlrErHOo9nHctn
	 pqUMElcBMj6vWhmxbxix/93OL4TYQ3p3Vd0/M1m18P1++z7FzKZNO5vO+Ouy+qfWcD9Ps
	 PmI1l3wc5AWkXfQ41ICWpIRXC9Cj74yhQnZ6Klvom0ktx5GHnpaW8unlspfWQ9xc+tq6U
	 s00FZN9G96oYuMnrVE89JI37Onnp6wHILtz+7uy13bSLO9EKXbLWPYLKGzgw8xeJ8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w9rbpO/f";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000C2606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 000C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9rbpO/f
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so390914eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794160485; x=1794765285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XN+82m6XILmToReUZb14mcLlVGl4HvQRUT+BvYNhBMU=;
        b=w9rbpO/fro2/aQIsj9ctujKJ+4OaThbesS0tp253vPawbzRxfHE1lc/B1jxzwhvncg
         UlMFZ8snjPx2Y93HabO9prT68I6Tzx5bgPVaeECgfXSIsy4SFdZGfkoBZs4y10K5SwKM
         To0utznSCySu6J5IH7rBy3DlsKv3HcOoKViax9PCzBCfHhaszeAsD0HM7mBKgJmA2gJt
         a5ipiA8v8qzidRHlEfElIVT4pTS8TmeW1JcV+rf4gwoMgwiB727a9HX2uo5OReWHFynd
         6/Neosestl1XtTIqkd9oEXH3z9ed18WFiNMIiUFkMuXFnCs58DV/n/7bl/X4hIlqOPH+
         t1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794160485; x=1794765285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XN+82m6XILmToReUZb14mcLlVGl4HvQRUT+BvYNhBMU=;
        b=GGBNFJKL2joINMT8+qw0ISJ2UbW6D1PoVTP+rutBrGMGZ57XysVceXkONT0P7edlW2
         5dAAs3/KLB6xTa/8SlEpL16v2Q6Ry9q9VBDgrjPgI7u+gZMJ94bt3KC1Dc+rICJGEozO
         Tc37cmU3OTZzCUTnvzmj9r5aroyVfvIYWSvcvkg7V+WCmaBa1zcl7p0KFTTqHuilp5Sc
         LYzKFn3uJK9sf7jmMoTnFefgjPoo5b8Essq6dtTw+rW7Vh6pU3bDn78j1j8aOtqiPx92
         VAFgc0iYBBEMFTiB7i3W/kt2M9DXHbAFEo86fb51ICLqBNIE16RA46xwlwAOlpfVKBuj
         9i2w==
X-Forwarded-Encrypted: i=1; AL+hErHC6zCy7KEPfKQlLtOm/PaV5Wqys+N0E3FfSzH8l84Ho+xsxHykxzbu4XdNz1oIbWedNGH4cRH8Bl8+gbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FQJ0yeg3LmQFsH7gFAynMX/B9/HB8o8owkEgbDi5kQ+C2HEhn
	BlRzpwSNDZBq5URIXwGy2DnPD8AZmkXuM01bHhltgGUF7velSraRcflB
X-Gm-Gg: AYBFou2IR1Wj1XNXWnerQ9aaUgZZ7JG06mGwkJTCaZ8LfSqSdzuhZ1yBfzGsfQaSbMQ
	8hFGJS9t7G3zKbuwchZOB18QBuqaEbQMdQu14PwS9ZVXgTQanEt4FJv1NWiaJvoE8etTGDZ5fbf
	idxTlH5HwvvL6wBTsRJijUFOrpLQieWhQQEku9cu4bu5YSyNnjFxT59H6DH45lAtm6gFeUDj0p+
	JQA+XT+cveAPIuU5fyRFK8zjNPz9gq7/fIEoezxDZWGlJI25LRtMcw4VC1BNPKo2rdPk7pvRs91
	KObZtvKxnjzEJ+Y4TGfMy6VvU0q1tecZ6areIQ4n/Gs2RXVnyT+uryCmyyMAx00yocyxbhJXWG2
	SmiFWTJEy3jpNAkjlCXxiRJLMvyiWs2Pqwke5fe+boglS//Df2hPXx4xhy2oVioEK67T+yiQtZs
	mjthUSbW24goLcPJgo7qvYqtDfHxV34eAbe/FeSN+AyP0s1yNpTZXCU5jj53qhE0N0C++njFHiN
	MvFfee85ShEu0Sr7Fh2a/dC2jhuvN5lgBXLMCmjE8om3ELmAqsI2exQPaTjKbJ6nfDdboobXxX1
	AiXNNMuXOrPTbghMj5lXxkfj3BKMvgAx2w/+Sur8lTpcrdqs
X-Received: by 2002:a05:701b:260d:b0:196:7742:3928 with SMTP id a92af1059eb24-1b39fdaf0c3mr2557319c88.0.1794160484955;
        Sun, 08 Nov 2026 09:54:44 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm7386310c88.18.2026.11.08.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:54:44 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ocxl: cancel xsl fault work before freeing the SPA to avoid use-after-free
Date: Mon,  9 Nov 2026 02:54:35 +0900
Message-ID: <20261108175435.725507-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

The XSL translation-fault interrupt handler schedules
spa->xsl_fault.fault_work (xsl_fault_handler_bh), which dereferences the
fault and the SPA (via container_of) and acks the interrupt. free_link()
calls release_xsl_irq() -- which frees the XSL interrupt so no new
fault_work can be scheduled -- and then free_spa(), which frees the SPA.
Neither cancels a fault_work that was already queued by the last
interrupt. As it runs on the system workqueue with no timing bound, it
can execute after the SPA has been freed, dereferencing freed memory --
a use-after-free.

Cancel the fault work in free_spa() before the SPA is freed. By that
point release_xsl_irq() has freed the interrupt, so the work cannot be
re-queued and cancel_work_sync() is sufficient. The interrupt top half
takes a reference on the faulting mm that the bottom half is expected to
release, so if cancel_work_sync() cancels a not-yet-run work, drop that
reference here to avoid leaking it.

Fixes: 5ef3166e8a32 ("ocxl: Driver code for 'generic' opencapi devices")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/misc/ocxl/link.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 7749dcd..1c2a89e 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -376,6 +376,15 @@ static void free_spa(struct ocxl_link *link)
 		link->dev);
 
 	if (spa && spa->spa_mem) {
+		/*
+		 * A pending xsl fault bottom half holds a reference on the
+		 * faulting mm (taken in the top half, released by the bottom
+		 * half). If we cancel it before it runs, drop that reference
+		 * here so it is not leaked. release_xsl_irq() has already
+		 * freed the xsl interrupt, so no new work can be scheduled.
+		 */
+		if (cancel_work_sync(&spa->xsl_fault.fault_work))
+			mmput(spa->xsl_fault.pe_data.mm);
 		free_pages((unsigned long) spa->spa_mem, spa->spa_order);
 		kfree(spa);
 		link->spa = NULL;
-- 
2.43.0

