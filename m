Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925798;
	b=vCl9qJe4/LitrDLdYLB52mHCttiu/sYyoX5/1GnEsxkAYUVisJVZ6C4+kmiAzoel7g6e
	 NR2LV1nk3PdM2EkPwGlPWgpAf31ortcDe/2dV6hQgCp7Zo4s+TNN1xjtSSGKIIY9o3cfd
	 J3zGT8sG19aVZ7Qkfq1BTz+K0Wi0GIfiZcWkTsvZ2xoQN+Ka7T9LHLVKR1Ip9mQW8gVlZ
	 t49dqKiP30oWdlY978qTv7C6jaP74Kt4p+U0vk4UcdePsxOzKXBXp2JIKxzzDNaJ52uxU
	 O9pgyM13ARcnW1z5dTh8Y7MBokTpgrsVnyWOoBaduYT0SX+1gvcLnq6A6R2FQcGeqVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jjSXIgXOyhHFXs7xglb6RCi5mzea7rcfoR/tpBA6uG4=;
	b=eHEn7TByFjNCOazDhDQ8djjE0E8KMOIofKK1x07jSfhZE9TfdyjKihheG97Ve9yZkBOZ
	 oaiYDzfXqwPFu4QgYdpLSW/rzP3JiV+jCyFoGS6YZo2M131qZ17SQaS4BlD0qFWvohMuc
	 1k7H1IlrXl3SsTAde/FN3BP4tJDFhUFpvtsjYdyeW5VM1u0sQRAZb17w9LzcrURrC7nbb
	 Vcv7WFrXWN/VPmt5b+QSEqOJJ3pOMqxAtsJiKJjhE41WJTVWiK/Dg437gVIZmQeaPbObL
	 0P1X+CLt0MuTcatqeawtZDFQUjHBFw9hc/rAE4JGxc2WmOtxm0f9kOeuwO3sdsSJ3mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TCHTaSLD;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B2606EE9B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB4B2606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TCHTaSLD
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e4dso86929b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925797; x=1794530597; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjSXIgXOyhHFXs7xglb6RCi5mzea7rcfoR/tpBA6uG4=;
        b=TCHTaSLDTMhg1F7OkjS+TS2DSNVLTYo0hDZFR8GavFaZ1LJNZ0B7t7eRxMNaydfNgL
         uKJGOfn2lhOgbo5sK8b7AnPRaDIOx9FooA2ll8Ce9FI3EXiZI3ks28IqmPZ8U/LxxsFF
         NxOoLayovGPEi9W+EPCrxlJMJ+WJ9sOMnLihG1IFpUgdiWXwYHNTrbBhnZQx9u9B71Ee
         v6cKVE/ZORVLlT81wrXr+wCOKEPrFCq33z4s0oJ5qhf17cPejQY9S6L8UEHtuHJ2STTu
         C+b2U0uAhDG/uTp0Z3R28V5Vj4qc9gBSuwbMlo9b4dWayrPl0KyLndQ3inyVPB2F4yZZ
         zLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925797; x=1794530597;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjSXIgXOyhHFXs7xglb6RCi5mzea7rcfoR/tpBA6uG4=;
        b=A/hrbs6SKo0KAVbvg56BbRYd+2oIunZcjFddu35YUmbR7sRoIuXKEdt8jil1q1ro6c
         mBP1BgSp+6shDN5tCYTHtTHEXFK3bkfj4I2eGPGuBJ64nDuRtZHIXIDiHTWaq8KtBJ/t
         hiwbcz9YeI0IinlRldydCofkXH7K5BihYkewKwLzL55hcpkBrcMqPHGAjG8UkOXrFRB3
         RoGdWrPloyqmBt5BWbeqQS+fX8OAuUGqa05GwezNkQaUVVXVGuf8TKF3o5Pt88sgdR9n
         2hSJLSsoU9qPD5gGN+NRrlLA9JRycCxUYfJib0AGaSU4DX0Vt9kBcDPhTsfYSWBVw+qy
         Ivew==
X-Forwarded-Encrypted: i=1; AKwUvBxzuPl2TetoMZes/QNMKSnwwYV4vsE43Z+ESLRGgpJk8IeoCMac2zOuS9LKZLaxL4Ven3AJqEYwp0IrAxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hafVxVNYA8eWu3KOPe+0OSsOISyvc0q1twLKh96rsgAOw5PQU
	/fyhWdLqpaTjRIx/Yg6jTS63KO7caGyVrhj6BH1YKOjqsimzNYlI0ejpxVY8oE8mQdgfG6CUoCe
	nuzVgv3l00/79jA==
X-Received: from ioy12.prod.google.com ([2002:a05:6602:a10c:b0:9e0:f441:f5dd])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6f89:b0:4f6:5279:5c89 with SMTP id 5614622812f47-567e15b703bmr658717b6e.47.1793925796333;
 Thu, 05 Nov 2026 16:43:16 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:17 +0000
In-Reply-To: <20261106004218.604799-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106004218.604799-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106004218.604799-17-dmatlack@google.com>
Subject: [PATCH v2 16/17] PCI: Remove the per-capability save buffers
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Delete struct pci_cap_saved_state, struct pci_cap_saved_data,
pci_dev.saved_cap_space and the helpers that managed them. Every capability
now saves its registers in the offset-indexed capability store, so nothing
is left to find, allocate or free.

Drop pci_free_cap_save_buffers() from pci_release_capabilities();
pci_saved_caps_release() already frees the one remaining allocation.

pci_store_saved_state() and pci_load_saved_state() no longer have to append
and consume the records of the capabilities that still had a buffer, so the
blob they exchange is now just the saved DWORDs.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pci.c   | 136 +-------------------------------------------
 drivers/pci/pci.h   |  19 -------
 drivers/pci/probe.c |   1 -
 include/linux/pci.h |   1 -
 4 files changed, 1 insertion(+), 156 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ab1e1d6847fc..d2a9718b6a65 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1802,28 +1802,6 @@ static const u16 pcie_saved_regs[] = {
 	PCI_EXP_SLTCTL2,
 };
 
-static struct pci_cap_saved_state *_pci_find_saved_cap(struct pci_dev *pci_dev,
-						       u16 cap, bool extended)
-{
-	struct pci_cap_saved_state *tmp;
-
-	hlist_for_each_entry(tmp, &pci_dev->saved_cap_space, next) {
-		if (tmp->cap.cap_extended == extended && tmp->cap.cap_nr == cap)
-			return tmp;
-	}
-	return NULL;
-}
-
-struct pci_cap_saved_state *pci_find_saved_cap(struct pci_dev *dev, char cap)
-{
-	return _pci_find_saved_cap(dev, cap, false);
-}
-
-struct pci_cap_saved_state *pci_find_saved_ext_cap(struct pci_dev *dev, u16 cap)
-{
-	return _pci_find_saved_cap(dev, cap, true);
-}
-
 static void pci_reserve_pcie_state(struct pci_dev *dev)
 {
 	unsigned int i;
@@ -2017,32 +1995,12 @@ EXPORT_SYMBOL(pci_restore_state);
  *
  * Laid out so that the position of every value is described by the device's
  * configuration space rather than by the kernel.
- *
- * Capabilities that have not moved to the saved capability store yet keep
- * their own buffer, and their records trail @dword_val until the last of
- * those buffers goes away. Both areas vary in length and only one of them
- * can be a flexible array member, so the records are reached with
- * pci_saved_state_records() rather than declared here.
  */
 struct pci_saved_state {
 	unsigned long	dword_map[BITS_TO_LONGS(PCI_CFG_SPACE_EXP_DWORDS)];
 	u32		dword_val[];
-	/* struct pci_cap_saved_data cap[] follows dword_val */
 };
 
-/*
- * The records that follow the saved DWORDs, one per capability that still has
- * its own save buffer, terminated by an empty record.
- */
-static struct pci_cap_saved_data *
-pci_saved_state_records(struct pci_saved_state *state)
-{
-	unsigned int nr_dwords = bitmap_weight(state->dword_map,
-					       PCI_CFG_SPACE_EXP_DWORDS);
-
-	return (struct pci_cap_saved_data *)&state->dword_val[nr_dwords];
-}
-
 /**
  * pci_store_saved_state - Allocate and return an opaque struct containing
  *			   the device saved state.
@@ -2054,11 +2012,8 @@ struct pci_saved_state *pci_store_saved_state(struct pci_dev *dev)
 {
 	DECLARE_BITMAP(map, PCI_CFG_SPACE_EXP_DWORDS);
 	struct pci_saved_caps *caps = &dev->saved_caps;
-	struct pci_cap_saved_state *tmp;
-	struct pci_cap_saved_data *cap;
 	struct pci_saved_state *state;
 	unsigned int dword, nr_dwords, i = 0;
-	size_t size;
 
 	if (!dev->state_saved)
 		return NULL;
@@ -2070,14 +2025,7 @@ struct pci_saved_state *pci_store_saved_state(struct pci_dev *dev)
 
 	nr_dwords = bitmap_weight(map, PCI_CFG_SPACE_EXP_DWORDS);
 
-	size = struct_size(state, dword_val, nr_dwords);
-
-	/* Room for the buffers that are left, and for the terminator */
-	size += sizeof(struct pci_cap_saved_data);
-	hlist_for_each_entry(tmp, &dev->saved_cap_space, next)
-		size += sizeof(struct pci_cap_saved_data) + tmp->cap.size;
-
-	state = kzalloc(size, GFP_KERNEL);
+	state = kzalloc(struct_size(state, dword_val, nr_dwords), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
@@ -2092,15 +2040,6 @@ struct pci_saved_state *pci_store_saved_state(struct pci_dev *dev)
 			pci_read_saved_cap_dword(dev, dword * sizeof(u32), val);
 	}
 
-	cap = pci_saved_state_records(state);
-	hlist_for_each_entry(tmp, &dev->saved_cap_space, next) {
-		size_t len = sizeof(struct pci_cap_saved_data) + tmp->cap.size;
-
-		memcpy(cap, &tmp->cap, len);
-		cap = (struct pci_cap_saved_data *)((u8 *)cap + len);
-	}
-	/* Empty record terminates the list */
-
 	return state;
 }
 EXPORT_SYMBOL_GPL(pci_store_saved_state);
@@ -2113,7 +2052,6 @@ EXPORT_SYMBOL_GPL(pci_store_saved_state);
 int pci_load_saved_state(struct pci_dev *dev,
 			 struct pci_saved_state *state)
 {
-	struct pci_cap_saved_data *cap;
 	unsigned int dword, i = 0;
 
 	dev->state_saved = false;
@@ -2140,19 +2078,6 @@ int pci_load_saved_state(struct pci_dev *dev,
 		pci_write_saved_cap_dword(dev, off, val);
 	}
 
-	cap = pci_saved_state_records(state);
-	while (cap->size) {
-		struct pci_cap_saved_state *tmp;
-
-		tmp = _pci_find_saved_cap(dev, cap->cap_nr, cap->cap_extended);
-		if (!tmp || tmp->cap.size != cap->size)
-			return -EINVAL;
-
-		memcpy(tmp->cap.data, cap->data, tmp->cap.size);
-		cap = (struct pci_cap_saved_data *)((u8 *)cap +
-		       sizeof(struct pci_cap_saved_data) + cap->size);
-	}
-
 	dev->state_saved = true;
 	return 0;
 }
@@ -3652,56 +3577,6 @@ void pci_ea_init(struct pci_dev *dev)
 		offset = pci_ea_read(dev, offset);
 }
 
-static void pci_add_saved_cap(struct pci_dev *pci_dev,
-	struct pci_cap_saved_state *new_cap)
-{
-	hlist_add_head(&new_cap->next, &pci_dev->saved_cap_space);
-}
-
-/**
- * _pci_add_cap_save_buffer - allocate buffer for saving given
- *			      capability registers
- * @dev: the PCI device
- * @cap: the capability to allocate the buffer for
- * @extended: Standard or Extended capability ID
- * @size: requested size of the buffer
- */
-static int _pci_add_cap_save_buffer(struct pci_dev *dev, u16 cap,
-				    bool extended, unsigned int size)
-{
-	int pos;
-	struct pci_cap_saved_state *save_state;
-
-	if (extended)
-		pos = pci_find_ext_capability(dev, cap);
-	else
-		pos = pci_find_capability(dev, cap);
-
-	if (!pos)
-		return 0;
-
-	save_state = kzalloc(sizeof(*save_state) + size, GFP_KERNEL);
-	if (!save_state)
-		return -ENOMEM;
-
-	save_state->cap.cap_nr = cap;
-	save_state->cap.cap_extended = extended;
-	save_state->cap.size = size;
-	pci_add_saved_cap(dev, save_state);
-
-	return 0;
-}
-
-int pci_add_cap_save_buffer(struct pci_dev *dev, char cap, unsigned int size)
-{
-	return _pci_add_cap_save_buffer(dev, cap, false, size);
-}
-
-int pci_add_ext_cap_save_buffer(struct pci_dev *dev, u16 cap, unsigned int size)
-{
-	return _pci_add_cap_save_buffer(dev, cap, true, size);
-}
-
 /**
  * pci_reserve_saved_caps - reserve room to save capability registers
  * @dev: the PCI device
@@ -3715,15 +3590,6 @@ void pci_reserve_saved_caps(struct pci_dev *dev)
 	pci_reserve_vc_state(dev);
 }
 
-void pci_free_cap_save_buffers(struct pci_dev *dev)
-{
-	struct pci_cap_saved_state *tmp;
-	struct hlist_node *n;
-
-	hlist_for_each_entry_safe(tmp, n, &dev->saved_cap_space, next)
-		kfree(tmp);
-}
-
 /**
  * pci_configure_ari - enable or disable ARI forwarding
  * @dev: the PCI device
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 5a03561515ee..bc92b037b9d1 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -237,26 +237,7 @@ int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 int pci_bus_error_reset(struct pci_dev *dev);
 int pci_try_reset_bridge(struct pci_dev *bridge);
 
-struct pci_cap_saved_data {
-	u16		cap_nr;
-	bool		cap_extended;
-	unsigned int	size;
-	u32		data[];
-};
-
-struct pci_cap_saved_state {
-	struct hlist_node		next;
-	struct pci_cap_saved_data	cap;
-};
-
 void pci_reserve_saved_caps(struct pci_dev *dev);
-void pci_free_cap_save_buffers(struct pci_dev *dev);
-int pci_add_cap_save_buffer(struct pci_dev *dev, char cap, unsigned int size);
-int pci_add_ext_cap_save_buffer(struct pci_dev *dev,
-				u16 cap, unsigned int size);
-struct pci_cap_saved_state *pci_find_saved_cap(struct pci_dev *dev, char cap);
-struct pci_cap_saved_state *pci_find_saved_ext_cap(struct pci_dev *dev,
-						   u16 cap);
 
 /* DWORDs of the configuration space header, i.e. pci_dev.saved_config_space */
 #define PCI_STD_HEADER_DWORDS	(PCI_STD_HEADER_SIZEOF / sizeof(u32))
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index c04adf606ab9..0a86de920225 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2475,7 +2475,6 @@ static void pci_release_capabilities(struct pci_dev *dev)
 	pci_aer_exit(dev);
 	pci_rcec_exit(dev);
 	pci_iov_release(dev);
-	pci_free_cap_save_buffers(dev);
 	pci_saved_caps_release(dev);
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c27124c81e5..6ba724e1f04e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -549,7 +549,6 @@ struct pci_dev {
 
 	spinlock_t	pcie_cap_lock;		/* Protects RMW ops in capability accessors */
 	u32		saved_config_space[16]; /* Config space saved at suspend time */
-	struct hlist_head saved_cap_space;
 	struct pci_saved_caps saved_caps; /* Saved capability registers */
 
 #ifdef CONFIG_HOTPLUG_PCI_PCIE
-- 
2.56.0.455.g6c5a503b38-goog

