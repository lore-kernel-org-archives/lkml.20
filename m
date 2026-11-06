Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925789;
	b=nfsjxCiyN54oG3AixGtp5YdT6wD6D8PaN8/82LmzYOOo7NiKzVwUQQiRJ1F0ULuWifwa
	 2Ea0eKK+rIeqYfC2w7eZRbnHdqfBtEDvvc2FhjUzoNzPzheEvSfx4TCxhZPcRJD8ItYe2
	 IgokkntL+XQv6RIfLckpxUwobwFYw5+WvvQwTSFYLU5j4VIUk2Lg5RTtMpKga8mjn6MDs
	 wq7kdWNfwk0ZTEcoTPjlg/J70Yat2Fvmek5qGlsg5Gy1V2Z3RE2igI3LxPga+0y65hzJ2
	 Q/ct2joHrx0OqY6R5+xwSfN+l0icST+fi6lN5l8Q+8PDe2mer92ygmIPKD/FQBief6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iHjhOa1kArquGp6NzqJKIMKukUgu91Ev2XX32EWf/dM=;
	b=zRgOkpNyIl+49U+KTH/BvbNx/VpPuNAZe+5e5uV4ZjMvfU5sTeiJTFYc2BuLWOTIbw/G
	 7sIAdoWTPJ4JQjj1jMKI2HgVO2MAjnSp9aNVPPBPPeZKE6H92HZM6hQZfphdk6kUSy28b
	 Wez67mpIRD0TslGVfAsdJHxijYyvSnLBHeEAugeZcQSJcLv13z0xw4zJ0N9EpbUAdF/Fm
	 +3m/nfE+uIOfwvmM7yYSdWBE+oZexhHyor/s5Rv9kgy5WsvKr8X30a5ChVwyD3W4yuDhF
	 YMizpVy9ULTDYKE8wfi9FcKQU/P8J55qZbDwmxsSsh+vzrfqQQi7VdOsvQjEA8hYiFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEzLTg5L;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A6606EE8B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21A6606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEzLTg5L
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso102419b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925788; x=1794530588; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHjhOa1kArquGp6NzqJKIMKukUgu91Ev2XX32EWf/dM=;
        b=XEzLTg5LO+6fZIlCzp7Ttw4D0M1RQeoXWDGHhSssqYAuqqjYS+cfVidU04GIqomibB
         wabtjdC8BVjVhCmmK516sQqRf6ODgThpJCMx8T5JSXv+17u6KOw/0+t3f+ikkALuzW3C
         2X/w3T6QV/fc/h47bpBSUn6DVJsZxHY2df15Y7HZy8lO0VLuDF7Zk53WNRADLCmnCBdv
         yYSZWnw2v0PRQnktGmZUjkTp78gZ/Gn7YL32SfML0rPaWzkTqz3yrAdI0H3Xoqx1TJqQ
         fzniFPjSu9USmkbFkogfNYqoZKdgNK83EUOOc2BhtvYi5jTlosvtH6ayj3mRCqVZ2mAw
         ZWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925788; x=1794530588;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHjhOa1kArquGp6NzqJKIMKukUgu91Ev2XX32EWf/dM=;
        b=UGDufgEV9J7vPcMTsZlsCyoQUktTXu6tY5E8OEc16T8oTPssQDM6ErKidvuD84zqn6
         uT8oVj2mAo+Kd5OucZA5YrkvDh+cMhO1UvLk/sB2gP2UGomLxllRvVbDAsMprF/gGcmS
         tC9p2/iS2FytdaJ6dFEWa1l4oxele8y4TAEy4U2V+rW+YN22HhpqqqNIsVEak8E+QlGy
         rDx+O5A8bLHnJ71NfPxS7bjHgbUvpuMV5VLSNq2m2OwGB2C32A4Y5Jj7zPBvMG0dArxe
         /gCTo5fTNsTMaHsg37hqY2D65jlaQodXrmJxsNJznJmi+DcgDVUeui6SOjfgfoUKhDhC
         iq4g==
X-Forwarded-Encrypted: i=1; AKwUvBye0aETgEydH5CxM6YnEzbPPq7Kghu0VLraxYyU+/bwz6xdIxT62rqJNM2iDCY5xKSKu816UOjJXP19v3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BcXW6LYKEbQsaOF2GvJ9ocssoVjhyG6zj4K0nLZoFct924Kp5
	ZmbaVdw4TUY5Bya0uSdKxK+Wvtwo80pwe80rCpMxwMkqkGblrcWDYYv+GlQekjtxy8syiu1Kk/i
	mtSTX0KAUL9TPRQ==
X-Received: from jabfi10.prod.google.com ([2002:a05:6638:630a:b0:61a:c6d0:4104])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f66:b0:4b2:8d7b:41b8 with SMTP id 5614622812f47-567e1440ea0mr750093b6e.18.1793925787537;
 Thu, 05 Nov 2026 16:43:07 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:10 +0000
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
Message-ID: <20261106004218.604799-10-dmatlack@google.com>
Subject: [PATCH v2 09/17] PCI/PTM: Save PTM state in the saved capability store
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

Save and restore the PTM Control register through the per-device saved
capability store instead of a private pci_cap_saved_state buffer.

Reserve the register in pci_reserve_ptm_state(), called from
pci_ptm_init(), and report a refused reservation. pci_ptm_init() ignored
the return value of pci_add_ext_cap_save_buffer(), so a failed
allocation left PTM state unsaved without any message. An allocation
failure is now reported once by pci_saved_caps_finalize().

No other functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/ptm.c | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/pcie/ptm.c b/drivers/pci/pcie/ptm.c
index bd3bd39f6372..fc653d2d1ec5 100644
--- a/drivers/pci/pcie/ptm.c
+++ b/drivers/pci/pcie/ptm.c
@@ -34,6 +34,16 @@ static struct pci_dev *pci_upstream_ptm(struct pci_dev *dev)
 	return NULL;
 }
 
+static void pci_reserve_ptm_state(struct pci_dev *dev)
+{
+	int rc;
+
+	rc = pci_reserve_saved_cap(dev, dev->ptm_cap + PCI_PTM_CTRL, sizeof(u32));
+	if (rc)
+		pci_err(dev, "unable to reserve PTM save state (%pe)\n",
+			ERR_PTR(rc));
+}
+
 /*
  * Find the PTM Capability (if present) and extract the information we need
  * to use it.
@@ -53,7 +63,7 @@ void pci_ptm_init(struct pci_dev *dev)
 
 	dev->ptm_cap = ptm;
 	atomic_set(&dev->ptm_enable_cnt, 0);
-	pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_PTM, sizeof(u32));
+	pci_reserve_ptm_state(dev);
 
 	pci_read_config_dword(dev, ptm + PCI_PTM_CAP, &cap);
 	dev->ptm_granularity = FIELD_GET(PCI_PTM_GRANULARITY_MASK, cap);
@@ -90,36 +100,18 @@ void pci_ptm_init(struct pci_dev *dev)
 
 void pci_save_ptm_state(struct pci_dev *dev)
 {
-	u16 ptm = dev->ptm_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
-
-	if (!ptm)
+	if (!dev->ptm_cap)
 		return;
 
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_PTM);
-	if (!save_state)
-		return;
-
-	cap = (u32 *)&save_state->cap.data[0];
-	pci_read_config_dword(dev, ptm + PCI_PTM_CTRL, cap);
+	pci_save_cap_dword(dev, dev->ptm_cap + PCI_PTM_CTRL);
 }
 
 void pci_restore_ptm_state(struct pci_dev *dev)
 {
-	u16 ptm = dev->ptm_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
-
-	if (!ptm)
-		return;
-
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_PTM);
-	if (!save_state)
+	if (!dev->ptm_cap)
 		return;
 
-	cap = (u32 *)&save_state->cap.data[0];
-	pci_write_config_dword(dev, ptm + PCI_PTM_CTRL, *cap);
+	pci_restore_cap_dword(dev, dev->ptm_cap + PCI_PTM_CTRL);
 }
 
 /* Enable PTM in the Control register if possible */
-- 
2.56.0.455.g6c5a503b38-goog

