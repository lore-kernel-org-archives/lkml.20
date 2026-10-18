Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ECB36CE19
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305064; cv=none; b=SAXQmORMpJgxcZi3etExxaaHXzAM9fhLKoAnma2c0mLyyyVYfUt39cvZOHZnFJQt+K8MMVCFKf1ggx7882Nj6Tb9G/Ax9ARJj5W1WaBE0o101uCbUZ/z7rh+6BYXLbMjAT+5Hicqga0QOaQ8OeapaUOQtdVjVTdkoQJ5S/rIcEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305064; c=relaxed/simple;
	bh=kB+gODtOY/FWcl4t427sDcTg4I5/oA9slAINC82GVkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMZk+jY6uLamClcXHwP+mMD471PXDsYY48DRP8mjJR3EK6dHA//e2VoTAYE+R66K0hHiDP7XL5OjL9FQ58+nNEeVSoS1CS8yDVFoEM7WB1rOPo4Q3i0ZsxzTuTV/FEc0PMFRB+nZxFP74+eV5czaFkSihO/gIZey7O+JofJaxVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=PDfHl/tW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rUBSCj+H; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="PDfHl/tW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rUBSCj+H"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 4BD3D1D000E6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:31:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 18 Oct 2026 02:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792305061; x=
	1792391461; bh=oguL4GxyvaICIOgV7ah1EClde9EHH5vizJHvhtM8sss=; b=P
	DfHl/tW19DyKeRcycqxNXWRKjaPkrkfIIAM9ZnOKga2kEkMMv0LDVzOehKj4uBul
	ZjGsqSeaOYbz3sgceKC0rAKB0v75wgLbMjgWtL2nkdJwtmXhv0YmPeTKCXfhIO9B
	WuDqyMBJCsGlFVJDW0/jlSQkJId3XVg81fTHcWl8ckb3kpN6F7ifWwyFhTOBweE7
	JYJ02PdV96yTHRlVG1d9yYZfWJsB+KfCZ7uX5Hoc3hDYW2q0qfAht2zCEyvs2ccf
	LFhbuXAek/1H+05hJ/jogTU5KHXh/PYcrGSFsovI2cEAnjAp8/Hv7kEMlQH7XIvN
	15WbUpbs4QNPsZIvn92Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792305061; x=1792391461; bh=o
	guL4GxyvaICIOgV7ah1EClde9EHH5vizJHvhtM8sss=; b=rUBSCj+HRtInUAgd5
	5J4zxf/7LSAV7oxlH0iRyd68gwdmfKJELNGzPwy3bZcA11RANIdnChBgwxsA58yX
	Z7IUyP81YnYNdpakPTEiraHNcmaqB89vibgWGlfkE/LsGVIyO+GUfkhK1jeES/tP
	I+nBVCqGyRydUKykFVzlBteE1ErVrKYk5wEb9CksABIcirg4Tv6zUaZS+QVxRY9L
	+04VGCntvfzDbC62MfJFg3SqUrAHlD9eeiwETHqnlXN7+Z1nArM4xHnV3A98Nzwk
	+0UwbZbkyCV1FRSkoajFU7/snTkYv7BQjqSdzeGHREXwvxzggevybmG5O3XdxGmk
	l/VuA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792305061; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:vsptwWxscY9M0UJ1LnF/06/+iKEB2toXmXLu/HgIuwqVRel
	zrTiXzZPyoOluQgrbAT0AdcslgFZ3/U2ZNpFuFPoQFkrnHDM+ZAEPtBRowQSBcAs
	DEY/4fanFi6eTS62OK+1bdGj7IS42ak75l5ten7VHxTuUAucIwAWjuK/fm9TSSab
	yuOpYG+095yGzZcRGuXtDuYB4QqKABzSE5KgZlYjHVVs8zhXzxrCGJx63XotOSsq
	e/IZdRs1siAhPJb/wljghdtDej26T6ZOlGyuAKNTrTCL8pof3DlzRh9W92TrW5RT
	lW6J4ncWPKzZQx+KXxhhdmRI377qLPFEbVyvb2A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:S1RczzRa/M4Z4b2bi+OSrLuJ/hUVtuU+2+AKmPRakVo=:kB+gODtOY/FWcl4t427sDcTg4I5/oA9slAINC82GVkQ=;
X-ME-Sender: <xms:pWfUanarNdAT4B9BPl8bQm7jckClZCDjJ7teO-jNfAq9mDTxBJd0Ng>
    <xme:pWfUakVOiGv-5BLY6mQXpD-crpYz4o2reFX1ofVBsQsZaHX9yy-iGbqHazNYq-6h_
    3XecmTGSYbeH7eS5sFwf3s0JgSZtv7bUy6weKbV4lRIPZZSPX2Q__KS>
X-ME-Received: <xmr:pWfUahjPvSZ3NE0h-C_NkisQK1NUIYmMWfLy2AqzNzKiuBg6gjYihedGM8FhpU-QLHs10327soVYn98qipHsQgtm3Yofvn55tPv0FbfcXeKc>
X-ME-Proxy-Cause: dmFkZTGtx91XyfsD+m/0kuClog5SfD4cYmMeAEQUA8jlo8CHfckL1LoLTMaKN+T3qgmzJa
    tiZQ9fIF8bzzQqOPNxMsNQYGDc0jOgHmL25s8fTkrIYQfJ/toZ0AQSAo7HoNVmC2jRpfg8
    /bXQpzQa1z1L3pVIcHAI9VqV0yDAQ4wHrqtjdQnqQrWz7gcAJyFx4pKGWxGSaZRa1T97VQ
    JTdzn87nd/llK6OSm7jpGPg/jlm/ZEU+KColtSkSfvMLBd0r3HrJnCfotOjocJA2kt8Brn
    DLdQMEwVSF05T0dezdalqitZ7H0Nk9EPV/l32CR12qtDbhRIX7Jc0ygfTG2U+cTyNqaFZ+
    gPEobAGUTpg/ae9pWn4XfMMXSJF8pjuRI1CCSnJVR9j2y5Lri4XaI3b+iDDEEr02zsPMRJ
    mTug6sZ+jAE/gARu2Ui3iyJi5kFauyxX5OepAn3NxwFsws0J9sOTRI1kXMSiBQKSed6EE+
    hrFzVY2MGDKQAbWbDWsjZgL4mBKnf3sZbAdZL5mePfq4hXY0aJ9E06McjdozZ3VxtIgXos
    BbVJVDHdNO14C0iGoA8kmrEYvv3puCcIfTXpfFugXopqi2aG/SSI0Y1JzDRqrC+xaLg8lK
    NPN+6B6fOCDWxIvhnqRXk/taxTOlFojEDWL5j53ywUcLo4Ca8A8JTZEiLjAg
X-ME-Proxy: <xmx:pWfUaqWomF5bqjpZ30tlPLDcyJ8MWyt1jgDUrdXPDZcUD9adEk_ITw>
    <xmx:pWfUagO_NNgdeUcxfc4GwzY2nlMh6ACTkeeKEfpAatLdX5vGs1Ar3w>
    <xmx:pWfUaub9p9QTgPPUvLULsBXZlbKEsI78_NHde-Nfn21yK42nlAg7Bg>
    <xmx:pWfUakrHKTL0c58jSsbZ8iDk-MVn0sRlohLpSdxpHu009nlIzFfLPw>
    <xmx:pWfUakMEhhOaZeaWVJyMLGNhmgeP6SbII-0TEjRi6MNoCaKJqc39Nivn>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 02:31:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] firewire: core: use workqueue to cancel all pending transactions on card removal
Date: Sun, 18 Oct 2026 15:30:54 +0900
Message-ID: <20261018063056.329226-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
References: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a card is being removed, all pending transactions are canceled by
calling fw_cancel_pending_transactions(). This function moves the entries
for unfinished transactions to a local list so that their callbacks can
be invoked without holding the transaction lock. However, this complicates
the management of pending transactions.

Use workqueue to invoke error callbacks for all pending transactions.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c        |  4 ++-
 drivers/firewire/core-transaction.c | 38 ++++++++++++-----------------
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 83c29a487d86..a43fc3a278f2 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -811,7 +811,9 @@ void fw_core_remove_card(struct fw_card *card)
 	drain_workqueue(card->isoc_wq);
 	drain_workqueue(card->async_wq);
 	card->driver->disable(card);
-	fw_cancel_pending_transactions(card);
+
+	scoped_guard(spinlock_irqsave, &card->transactions.lock)
+		fw_cancel_pending_transactions(card);
 
 	scoped_guard(spinlock_irqsave, &card->lock)
 		fw_destroy_nodes(card);
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 96c86a5b81f9..31cc440d4218 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -69,28 +69,6 @@ static void invoke_callback(struct fw_transaction *t, int rcode, u32 response_ts
 	}
 }
 
-// Must be called without holding card->transactions.lock.
-void fw_cancel_pending_transactions(struct fw_card *card)
-__must_not_hold(&card->transactions.lock)
-{
-	struct fw_transaction *t, *tmp;
-	LIST_HEAD(pending_list);
-
-	lockdep_assert_not_held(&card->transactions.lock);
-
-	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
-		list_for_each_entry_safe(t, tmp, &card->transactions.list, link) {
-			if (try_cancel_split_timeout(t))
-				list_move(&t->link, &pending_list);
-		}
-	}
-
-	list_for_each_entry_safe(t, tmp, &pending_list, link) {
-		list_del(&t->link);
-		invoke_callback(t, RCODE_CANCELLED, 0, NULL, 0);
-	}
-}
-
 // card->transactions.lock must be acquired in advance.
 #define find_and_pop_transaction_entry(card, condition)			\
 ({									\
@@ -114,6 +92,22 @@ static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 res
 	queue_work(t->card->async_wq, &t->error_work);
 }
 
+// Must be called without holding card->transactions.lock.
+void fw_cancel_pending_transactions(struct fw_card *card)
+__must_hold(&card->transactions.lock)
+{
+	struct fw_transaction *t, *tmp;
+
+	lockdep_assert_held(&card->transactions.lock);
+
+	list_for_each_entry_safe(t, tmp, &card->transactions.list, link) {
+		if (try_cancel_split_timeout(t)) {
+			remove_transaction_entry(card, t);
+			schedule_error_callback(t, RCODE_CANCELLED, 0);
+		}
+	}
+}
+
 /**
  * fw_cancel_transaction: cancel transaction.
  * @card:		interface where the transaction has been requested
-- 
2.53.0

