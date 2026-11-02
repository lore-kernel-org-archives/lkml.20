Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633826;
	b=S5K0IvBpdamQy9Licf6o7ykd52B4+AvffXUsJhOm2nn94iCmebEy5y3ascSum+INKvlt
	 bs1ByyA4i/mBlhb5Uje1eceKoKsyzh48zEUnzxVp6q6VVMoFMBubH+5967/alAS9LMUIH
	 AV54AVUUmW1c0LqkuUMmFYLE/v2xq0xhWATvk3ubZdn6V6RcHZTaz2p/xVh0EYuBw425T
	 FzzYq9eRsUpbz+TbiysWap6OEEjlOCFDgqGVSCmyAZC/t4y0lS3GFlJbV8sKo6YWKATVz
	 zaaelpJZ6ZUaVKIIz/Gw4ZKCNkadw0iPoVsnw1wLnBD0bqmst0fOup5n/xmM2iTvSXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YmR/P9susfgWpN3rWVzDSZpJhyqX0qvQbvTnkpaf48E=;
	b=Ogu9wmp6wbVb3wxi5N0st5FukoRy64Q7m97r0xaXUV9hUKHwa1WjZ3DPVoGM8z7CDKFd
	 AsYNade4uwTSTwlxtSIK7y8Y2pTP2rKJL1NQZNrzc1zgLvdRvdqFTfdKoFXE22fsdt8gb
	 i5C1ZBhZtAjwdDAwNnQtmLY5ROq/tL17GtZa+9VOiBgGTxKtLDtR/KMNTVbUC76dPm2T8
	 y0K2OF7hLY29RRcOiu+Msf0VwxMoK0cKZVPkNLLLjhHvfjvSkqOVHbUN4j/RLqU1BP5Am
	 fetSf236f/gU783uYhhYcomKwh4XHJO/6I7W1sphIAQ1M/pUqgkZor9/GMpHplQuXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MGfRWuh0;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C660E4080
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6C660E4080
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MGfRWuh0
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso51010225ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633825; x=1794238625; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmR/P9susfgWpN3rWVzDSZpJhyqX0qvQbvTnkpaf48E=;
        b=MGfRWuh0nAimPxPxxuPTWsBxmMpPf9c8Jkj5XumT7cI2yKlZzZGCb9BhKJE1H4nXwl
         x4o+33wIlKpWRlQgnz4mBvmf3A9mUF//SGkPlgVTSawUTsTT2hXyXCu12xbtwD2yN9SS
         itzLhHX4BbdxLi9iiUR3ll24JJvCb3dEBkSwsWNDvGS2l1IRwbiAtlPXQhlvQEuc+m8a
         yTrNihdaHs7yx++aCuqpDmmMR0hTUhX0yNJDnwxN7C6LRbyRMgYuVSy7qZWigIpv3J3D
         /IPdQV6isWwEx8A2uzeJD5t1mtlwKRHwOcNUPg+tMhx6AIQhTtf2hK2g4ifwe4d2yGkA
         adug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633825; x=1794238625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmR/P9susfgWpN3rWVzDSZpJhyqX0qvQbvTnkpaf48E=;
        b=ln5Bq1zsI/9+ycoYe1vP8a6T57fC94qYa8Tw2nOqWGNRAk11KV2XOOQ+iWlhied5pn
         S8SiuQair2ItH0OO7eq3YmIlKeYBqORUA8Uv89DKqgysS7B5wSMKghy6OKPxTBlWmzlq
         jtjcAdtXU4HFeE3+AZMQqZLn/YWPDlKT7OEYF0APTyC2nlCe/695SegTBk0CHQFvlkIT
         6LvbCz5m+iPd4eRbhIGBTghDiRjKNwlo9LwBaEyGpsQktKWMirkN0yavCHt8hwZI7j4K
         dk9AoZ150WnYfP4fx5eCv7sW/J25e+e2CnJ33eS1NY7N/MP2OLW2s2UwEQmJAkVT1R+7
         bGUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh8qKRDD+QTqzlUbmL36OSnJj5hrnl5QfM70Ui+9Ug13sVZFyaSpUWA0zSP1B5TIG/jGwV7jiVNzRdj0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z92edInLRvmVKVHnLmh9U3IC7H+sLPmb0fLQBMNDbBRlvvxa4K2
	jXxDtdixHRJtCwC/CJZEjqyt8MFYBjsi5hrhiuz/Yd6ZnUxUWb19GN4IZJ96RKIwULQm+51njNk
	N5Fo4gWvWmA==
X-Received: from pldq13.prod.google.com ([2002:a17:902:c9cd:b0:2e8:2364:2533])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fd8d:b0:2e8:7686:4d46
 with SMTP id d9443c01a7336-2eb364552bemr101310195ad.34.1793633825121; Mon, 02
 Nov 2026 07:37:05 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:34 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-6-vipinsh@google.com>
Subject: [PATCH v6 05/27] PCI: liveupdate: Add helpers to preserve struct pci_saved_state
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Drivers that keep a device running across Live Update need to hand the
state they captured with pci_store_saved_state() to the next kernel,
since the next kernel never sees the device in that state. VFIO, for
example, captures it at first open and uses it to restore the device
when the last user closes it.

struct pci_saved_state is private to the PCI core and its in-memory
layout is not a stable ABI. Add helpers to serialize it into a
caller-provided buffer and rebuild it in the next kernel with a stable
struct pci_saved_state_ser ABI. Using caller-provided buffers allows
drivers to embed the serialized saved state directly in their own
KHO-preserved data with a single allocation and lifetime.

Validate the serialized buffer and verify that the saved standard
configuration header matches the live device before rebuilding the
state: the vendor and device IDs must match, only Type 0 (Normal)
headers are accepted, and BAR0-5 and the expansion ROM BAR address must
equal the current hardware values. This ensures that restoring the
saved state cannot write stale BAR addresses if resources were
reassigned in the new kernel. Only the address bits of the ROM BAR are
compared, since its enable and validation status bits may legitimately
differ.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 Documentation/PCI/liveupdate.rst |   3 +
 drivers/pci/liveupdate.c         | 223 +++++++++++++++++++++++++++++++
 drivers/pci/pci.c                |   5 -
 drivers/pci/pci.h                |   6 +
 include/linux/kho/abi/pci.h      |  47 +++++++
 include/linux/pci_liveupdate.h   |   7 +
 6 files changed, 286 insertions(+), 5 deletions(-)

diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
index 96b1d7f5df3a..b6cd9621b3b3 100644
--- a/Documentation/PCI/liveupdate.rst
+++ b/Documentation/PCI/liveupdate.rst
@@ -25,6 +25,9 @@ Live Update ABI
 .. kernel-doc:: include/linux/kho/abi/pci.h
    :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
 
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :doc: PCI Saved State Live Update ABI
+
 .. kernel-doc:: include/linux/kho/abi/pci.h
    :internal:
 
diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 6f92d4ddca2b..363453b06243 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -1036,3 +1036,226 @@ void pci_liveupdate_unregister_flb(struct liveupdate_file_handler *fh)
 	liveupdate_unregister_flb(fh, &pci_liveupdate_flb);
 }
 EXPORT_SYMBOL_GPL(pci_liveupdate_unregister_flb);
+
+static const struct pci_cap_saved_data *pci_saved_cap_next(const struct pci_cap_saved_data *cap)
+{
+	return (const void *)cap + sizeof(*cap) + cap->size;
+}
+
+/**
+ * pci_liveupdate_saved_state_ser_size() - Size needed to serialize a saved state
+ * @state: Saved state returned by pci_store_saved_state(), or NULL.
+ *
+ * Return: Number of bytes needed by pci_liveupdate_serialize_saved_state(), or
+ * 0 if @state is NULL.
+ */
+size_t pci_liveupdate_saved_state_ser_size(const struct pci_saved_state *state)
+{
+	const struct pci_cap_saved_data *cap;
+	size_t size;
+
+	if (!state)
+		return 0;
+
+	size = sizeof(struct pci_saved_state_ser);
+	for (cap = state->cap; cap->size; cap = pci_saved_cap_next(cap))
+		size += sizeof(struct pci_cap_saved_data_ser) + cap->size;
+
+	return size;
+}
+EXPORT_SYMBOL_GPL(pci_liveupdate_saved_state_ser_size);
+
+/**
+ * pci_liveupdate_serialize_saved_state() - Serialize a struct pci_saved_state
+ * @state: Saved state returned by pci_store_saved_state().
+ * @buf: Destination buffer.
+ * @size: Size of @buf, must equal pci_liveupdate_saved_state_ser_size(@state).
+ *
+ * Drivers that keep a device running across Live Update can use this to hand
+ * the state captured by pci_store_saved_state() (e.g. before the device was
+ * handed to userspace) to the next kernel, which never sees the device in that
+ * state.
+ *
+ * Return: 0 on success, -EINVAL if the arguments are invalid.
+ */
+int pci_liveupdate_serialize_saved_state(const struct pci_saved_state *state,
+					 void *buf, size_t size)
+{
+	const struct pci_cap_saved_data *cap;
+	struct pci_saved_state_ser *ser = buf;
+	size_t off;
+	u32 nr = 0;
+
+	if (!state || !buf || size != pci_liveupdate_saved_state_ser_size(state))
+		return -EINVAL;
+
+	memset(buf, 0, size);
+	ser->size = size;
+	memcpy(ser->config_space, state->config_space, sizeof(ser->config_space));
+
+	off = sizeof(*ser);
+	for (cap = state->cap; cap->size; cap = pci_saved_cap_next(cap)) {
+		struct pci_cap_saved_data_ser *cap_ser = buf + off;
+
+		cap_ser->cap_nr = cap->cap_nr;
+		cap_ser->extended = cap->cap_extended ? 1 : 0;
+		cap_ser->size = cap->size;
+		memcpy(cap_ser->data, cap->data, cap->size);
+
+		off += sizeof(*cap_ser) + cap->size;
+		nr++;
+	}
+
+	ser->nr_caps = nr;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_liveupdate_serialize_saved_state);
+
+/* Read the byte at config space offset @where from a saved config header. */
+static u8 pci_saved_config_byte(const u32 *config_space, int where)
+{
+	return config_space[where / 4] >> ((where % 4) * 8);
+}
+
+/*
+ * Compare the bits in @mask of the config space dword at offset @where with
+ * the saved config header.
+ */
+static int pci_validate_saved_config_dword(struct pci_dev *dev,
+					   const u32 *config_space, int where,
+					   u32 mask)
+{
+	u32 val;
+
+	if (pci_read_config_dword(dev, where, &val) ||
+	    (val & mask) != (config_space[where / 4] & mask))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int pci_validate_saved_config_header(struct pci_dev *dev,
+					    const u32 *config_space)
+{
+	u8 hdr_type;
+	int bar;
+
+	if (config_space[PCI_VENDOR_ID / 4] !=
+	    ((u32)dev->device << 16 | dev->vendor))
+		return -EINVAL;
+
+	/* Only Type 0 (Normal) configuration headers are supported. */
+	hdr_type = pci_saved_config_byte(config_space, PCI_HEADER_TYPE) &
+		   PCI_HEADER_TYPE_MASK;
+	if (hdr_type != PCI_HEADER_TYPE_NORMAL ||
+	    dev->hdr_type != PCI_HEADER_TYPE_NORMAL)
+		return -EINVAL;
+
+	/*
+	 * Verify that BAR0-5 and the expansion ROM BAR address match the
+	 * current hardware values so that restoring the saved state cannot
+	 * write stale BAR addresses if resources were reassigned in the new
+	 * kernel.
+	 */
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (pci_validate_saved_config_dword(dev, config_space,
+						    PCI_BASE_ADDRESS_0 + bar * 4,
+						    ~0U))
+			return -EINVAL;
+	}
+
+	/*
+	 * Only the address bits of the ROM BAR are compared, since its enable
+	 * and validation status bits may legitimately differ.
+	 */
+	return pci_validate_saved_config_dword(dev, config_space,
+					       PCI_ROM_ADDRESS,
+					       PCI_ROM_ADDRESS_MASK);
+}
+
+/**
+ * pci_liveupdate_deserialize_saved_state() - Rebuild a struct pci_saved_state
+ * @dev: The PCI device the saved state belongs to.
+ * @buf: Buffer written by pci_liveupdate_serialize_saved_state().
+ * @size: Size of @buf in bytes.
+ *
+ * Validates @buf against the PCI Saved State Live Update ABI and @dev's
+ * standard configuration header, and allocates a struct pci_saved_state that
+ * can be passed to pci_load_saved_state() and freed with kfree(). @buf is not
+ * modified or freed.
+ *
+ * Return: Newly allocated struct pci_saved_state on success, or an ERR_PTR() on
+ * failure (-EINVAL if @buf is malformed or incompatible with @dev, -EOPNOTSUPP
+ * if @buf uses an unsupported flag, -ENOMEM on allocation failure).
+ */
+struct pci_saved_state *pci_liveupdate_deserialize_saved_state(struct pci_dev *dev,
+							       const void *buf,
+							       size_t size)
+{
+	const struct pci_saved_state_ser *ser = buf;
+	struct pci_cap_saved_data *cap;
+	struct pci_saved_state *state;
+	size_t off, state_size;
+	u32 i;
+
+	if (!dev || !buf || size < sizeof(*ser))
+		return ERR_PTR(-EINVAL);
+
+	if (ser->size != size)
+		return ERR_PTR(-EINVAL);
+
+	if (ser->flags)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (pci_validate_saved_config_header(dev, ser->config_space))
+		return ERR_PTR(-EINVAL);
+
+	off = sizeof(*ser);
+	state_size = sizeof(*state) + sizeof(*cap);
+
+	for (i = 0; i < ser->nr_caps; i++) {
+		const struct pci_cap_saved_data_ser *cap_ser;
+		size_t entry_size;
+
+		if (size - off < sizeof(*cap_ser))
+			return ERR_PTR(-EINVAL);
+
+		cap_ser = buf + off;
+		if (!cap_ser->size || cap_ser->size > PCI_CFG_SPACE_EXP_SIZE ||
+		    cap_ser->extended > 1)
+			return ERR_PTR(-EINVAL);
+
+		entry_size = sizeof(*cap_ser) + cap_ser->size;
+		if (size - off < entry_size)
+			return ERR_PTR(-EINVAL);
+
+		off += entry_size;
+		state_size += sizeof(*cap) + cap_ser->size;
+	}
+
+	if (off != size)
+		return ERR_PTR(-EINVAL);
+
+	state = kzalloc(state_size, GFP_KERNEL);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	memcpy(state->config_space, ser->config_space, sizeof(state->config_space));
+
+	off = sizeof(*ser);
+	cap = state->cap;
+	for (i = 0; i < ser->nr_caps; i++) {
+		const struct pci_cap_saved_data_ser *cap_ser = buf + off;
+
+		cap->cap_nr = cap_ser->cap_nr;
+		cap->cap_extended = cap_ser->extended;
+		cap->size = cap_ser->size;
+		memcpy(cap->data, cap_ser->data, cap_ser->size);
+
+		off += sizeof(*cap_ser) + cap_ser->size;
+		cap = (void *)cap + sizeof(*cap) + cap->size;
+	}
+
+	return state;
+}
+EXPORT_SYMBOL_GPL(pci_liveupdate_deserialize_saved_state);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e5b960ca26e6..192f6766cc31 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2032,11 +2032,6 @@ void pci_restore_state(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pci_restore_state);
 
-struct pci_saved_state {
-	u32 config_space[16];
-	struct pci_cap_saved_data cap[];
-};
-
 /**
  * pci_store_saved_state - Allocate and return an opaque struct containing
  *			   the device saved state.
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 037c1674f164..d10df3203725 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -244,6 +244,12 @@ struct pci_cap_saved_data {
 	u32		data[];
 };
 
+/* Opaque to drivers, see pci_store_saved_state() */
+struct pci_saved_state {
+	u32 config_space[16];
+	struct pci_cap_saved_data cap[];
+};
+
 struct pci_cap_saved_state {
 	struct hlist_node		next;
 	struct pci_cap_saved_data	cap;
diff --git a/include/linux/kho/abi/pci.h b/include/linux/kho/abi/pci.h
index c2e3a5949f73..3d0822f2067d 100644
--- a/include/linux/kho/abi/pci.h
+++ b/include/linux/kho/abi/pci.h
@@ -93,4 +93,51 @@ struct pci_ser {
 	u64 devices;
 } __packed;
 
+/**
+ * DOC: PCI Saved State Live Update ABI
+ *
+ * Drivers that keep a PCI device running across a Live Update can hand the
+ * state returned by pci_store_saved_state() to the next kernel by embedding a
+ * struct pci_saved_state_ser in their own preserved data, produced and parsed
+ * by the PCI core via pci_liveupdate_serialize_saved_state() and
+ * pci_liveupdate_deserialize_saved_state().
+ *
+ * Like the FLB data above, this layout is a contract between kernels and is
+ * extended by appending fields and defining bits in ``flags`` for features the
+ * next kernel must understand, while recording the size of each entry. Unlike
+ * the FLB data, it is embedded in a driver's preserved state rather than
+ * referenced from struct pci_ser, and validation failures are reported to the
+ * calling driver rather than panicking.
+ */
+
+/**
+ * struct pci_cap_saved_data_ser - A saved capability in a struct pci_saved_state_ser
+ * @cap_nr: Capability ID (PCI_CAP_ID_* or PCI_EXT_CAP_ID_*).
+ * @extended: 1 if @cap_nr is an extended capability ID, 0 otherwise.
+ * @size: Size of @data in bytes, never 0.
+ * @data: The saved registers.
+ */
+struct pci_cap_saved_data_ser {
+	u16 cap_nr;
+	u16 extended;
+	u32 size;
+	u8 data[];
+} __packed;
+
+/**
+ * struct pci_saved_state_ser - Serialized struct pci_saved_state
+ * @size: Size in bytes of this struct, including all entries in @caps.
+ * @flags: Features a kernel must support to restore the state. None defined.
+ * @nr_caps: Number of entries in @caps.
+ * @config_space: The saved standard configuration header.
+ * @caps: @nr_caps struct pci_cap_saved_data_ser entries.
+ */
+struct pci_saved_state_ser {
+	u32 size;
+	u32 flags;
+	u32 nr_caps;
+	u32 config_space[16];
+	u8 caps[];
+} __packed;
+
 #endif /* _LINUX_KHO_ABI_PCI_H */
diff --git a/include/linux/pci_liveupdate.h b/include/linux/pci_liveupdate.h
index bb79348769b7..cfff200bce36 100644
--- a/include/linux/pci_liveupdate.h
+++ b/include/linux/pci_liveupdate.h
@@ -32,6 +32,7 @@ struct pci_liveupdate {
 };
 
 struct pci_dev;
+struct pci_saved_state;
 
 #ifdef CONFIG_PCI_LIVEUPDATE
 int pci_liveupdate_register_flb(struct liveupdate_file_handler *fh);
@@ -40,6 +41,12 @@ int pci_liveupdate_preserve(struct pci_dev *dev);
 void pci_liveupdate_unpreserve(struct pci_dev *dev);
 void pci_liveupdate_finish(struct pci_dev *dev);
 bool pci_liveupdate_is_incoming(struct pci_dev *dev);
+size_t pci_liveupdate_saved_state_ser_size(const struct pci_saved_state *state);
+int pci_liveupdate_serialize_saved_state(const struct pci_saved_state *state,
+					 void *buf, size_t size);
+struct pci_saved_state *pci_liveupdate_deserialize_saved_state(struct pci_dev *dev,
+							       const void *buf,
+							       size_t size);
 #else
 static inline int pci_liveupdate_register_flb(struct liveupdate_file_handler *fh)
 {
-- 
2.56.0.317.g454f8302e1-goog

