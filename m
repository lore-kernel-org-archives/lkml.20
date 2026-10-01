Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E94EFFCD;
	Thu,  1 Oct 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852732; cv=none; b=ZHXjPpVHKB54+XRXKOmmc3jJcwQoRRA0RdaWosx9CVaOGE2mtxkqnK9Z8PQfDaUrh4Ok45w63dfoPzf8CrPK07OS6aFh5/x95HOjqexeUu0fl6VdUWOiEicncNWYEMLQ18VazG9/ggpl26+6ApnoZdrgkyj4x8T4yFgQnYL0MFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852732; c=relaxed/simple;
	bh=9xX8OrxsMncOUW53xRQ8qm5yLJxc7ganrXIbdDn5Z7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBgmEg4COhJ8vKLKt5nxGCfZRltzM7IBCrjWpM/yOeuu6PCgzLpoW5IzM5ZuTXBf+P2EArDBFvfF6Y7tcHeAx+24kqCtoVoXrB+vI1b27noMhKhEkFgndqXnQYPATBJt0RgBJGf8+ztE0bkcasFMnRKROgaoovCDU+8pvv4Jny4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sRsOE+DC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WN9me0CN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G8Pcq0DN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SlNBfvPj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sRsOE+DC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WN9me0CN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G8Pcq0DN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SlNBfvPj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7368F21E8F;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUL7v5xqP5D3T64ZpniHpqOf3wpG928+prNhbQ3Mas4=;
	b=sRsOE+DCO8DkxnjXsAy98QkDZwUuIO6L2DNwMq2tk1H3lkgPlLGXn3opOw0OUzxGJM57Av
	5Jk9GfIVH8szR5Y2ixbTHan7oqZK7QkI74PCTf4Jb2T19b+B3wKu6fvo1xxkKsj8mGTILH
	ukkFp2AYnLSIBRFFx1Ln9SRGhGgq+gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUL7v5xqP5D3T64ZpniHpqOf3wpG928+prNhbQ3Mas4=;
	b=WN9me0CN3yqxeQJBWjt3uE6bltgHH5BiDd9ob8Z9rX3bwcMyioRWZSJ1hQnfbRL1qDg6jj
	8sXLCTkhvnE+j0DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUL7v5xqP5D3T64ZpniHpqOf3wpG928+prNhbQ3Mas4=;
	b=G8Pcq0DNr4PXuIl9+rfXvN/IkD1LYNTXTNdo55pSdul4OgF3r7m45wGpbQJ/ADIIY4iJEI
	pZfFnXK42s872nQwZncbk0WrQoHZk0lyIc9jRwtgNtJW0Tkqe7fblpMBdwefIA/02gwZfE
	YiNvPJcwzsge02CaQtPfRLkyDHn5Y1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUL7v5xqP5D3T64ZpniHpqOf3wpG928+prNhbQ3Mas4=;
	b=SlNBfvPjoVhuyH+UsshABzgubC8NsepWcFY1t948ustC4hYIOj9e68bnTBcUi+RSoUj2Fx
	APQMXuaUcxz3pyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0F9A13B7B;
	Thu,  1 Oct 2026 11:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T33
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 32/32] ALSA: Drop unused snd_card_free_on_error()
Date: Thu,  1 Oct 2026 13:04:12 +0200
Message-ID: <20261001110447.486782-33-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001110447.486782-1-tiwai@suse.de>
References: <20261001110447.486782-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Now that all users of snd_card_free_on_error() are gone by refactoring
with auto-cleanup, let's drop the superfluous function.

Also, update the documentation for reflecting the recommended error
handling procedure, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  1 -
 sound/core/init.c    | 36 +++++++-----------------------------
 2 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 2ca24ac7e37f..dc356e1ff47a 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -314,7 +314,6 @@ void snd_card_disconnect(struct snd_card *card);
 void snd_card_disconnect_sync(struct snd_card *card);
 void snd_card_free(struct snd_card *card);
 void snd_card_free_when_closed(struct snd_card *card);
-int snd_card_free_on_error(struct device *dev, int ret);
 void snd_card_set_id(struct snd_card *card, const char *id);
 int snd_card_register(struct snd_card *card);
 int snd_card_info_init(void);
diff --git a/sound/core/init.c b/sound/core/init.c
index a51b71812fd9..0897b3a11617 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -216,11 +216,13 @@ static void __snd_card_release(struct device *dev, void *data)
  * is added automatically.  In that way, the resource disconnection is assured
  * at first, then released in the expected order.
  *
- * If an error happens at the probe before snd_card_register() is called and
- * there have been other devres resources, you'd need to free the card manually
- * via snd_card_free() call in the error; otherwise it may lead to UAF due to
- * devres call orders.  You can use snd_card_free_on_error() helper for
- * handling it more easily.
+ * Caveat: if an error happens at the probe before snd_card_register() is
+ * called and there have been other devres resources that are referred at the
+ * card-level destructor call, you'd still need to free the card manually;
+ * otherwise it may lead to UAF due to devres call orders.  Instead of a manual
+ * snd_card_free() call, you can use the automatic clean-up for the card
+ * pointer via __free(snd_card_unref), and clear it upon the successful return,
+ * too; the snd_card_unref() would work just like snd_card_free() in this case.
  *
  * Return: zero if successful, or a negative error code
  */
@@ -250,30 +252,6 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 }
 EXPORT_SYMBOL_GPL(snd_devm_card_new);
 
-/**
- * snd_card_free_on_error - a small helper for handling devm probe errors
- * @dev: the managed device object
- * @ret: the return code from the probe callback
- *
- * This function handles the explicit snd_card_free() call at the error from
- * the probe callback.  It's just a small helper for simplifying the error
- * handling with the managed devices.
- *
- * Return: zero if successful, or a negative error code
- */
-int snd_card_free_on_error(struct device *dev, int ret)
-{
-	struct snd_card *card;
-
-	if (!ret)
-		return 0;
-	card = devres_find(dev, __snd_card_release, NULL, NULL);
-	if (card)
-		snd_card_free(card);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_card_free_on_error);
-
 static int snd_card_init(struct snd_card *card, struct device *parent,
 			 int idx, const char *xid, struct module *module,
 			 size_t extra_size)
-- 
2.55.0

