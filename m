Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441513;
	b=anQPJgTE2PGQMl+JqwsV8rsZXLoAN2QGWE6vE2KCIHOuDIiga6E/B0t/YQbC8/Xkk72k
	 Ao1yokg6Knf8NdvmIKglGqiJaY32Fxw4ZoZqPOQzCyncGgDEQYaqflxhxzRAqjwfxZwbb
	 z7+B75jNKqpNokpadvOzNvA2L1uMdFOLZfzNJ3+cJqf9lBQh5y2yGQiGphYphKkEj3ePC
	 4IRaULzSsBnp6tSm/f+eEnriALbJ1v4jckZrvrxMmya3diLRHfbkm0CqMtKJxUynDhqtB
	 /pBTLieiKeFS9tTeNA3YTjmxaIfdOqGZ7WkWy90kWa0ranFbnh0SV7LbDKuQf1S50VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hsppLSOUeeqjvZdBbTpnZu3hGwb8gc1TK9datAxS4XA=;
	b=AMGa494/GkGjZe9m06oCmU0DrgC3CrwKIrg8q1FI1UK1KszXjxxEzVYOLEdHYd5n1wYn
	 2We8U3BpaA0DFqievxl0p6SClpS66lZbsSqfBQ78vo7j9E2QaW40XtQ6H60ZaCRLRn4tB
	 jp6kWhki9rRl+Msx8ZLBZoQPrAm5zKc32ztzdg7SfHiaeES0MMjsh7xgaHArFFvzZ6KG8
	 DzjYLeQu7kxeNA6deTaG6s3HHpZkVJNfxPARYPEDymx27DVm3I3Gm3wunogbmMUMBNFnW
	 n+WHa9Pn2bZJPrmB2Lya0MhJM0DPzY15C1l0M7bCILW179G7VyrSLmy7XTQsqo3orTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CFJ2KsqM;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DCB606A326
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DCB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CFJ2KsqM
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eab93a9862so499929e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441512; x=1793046312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsppLSOUeeqjvZdBbTpnZu3hGwb8gc1TK9datAxS4XA=;
        b=CFJ2KsqMmbIo7UtPZXx3j6AVvvP52FpxGnddjpg6xbAzCUXLKiIJcOifoHesx8Bztg
         ntGbkEhUd6+tyWb+/AmUQCLf1HL4ckojiqN0yyRAxycixL/VDhxxIG0N4X87oqXNLJhc
         JQx3iquQI4ibyfTQCKbHsWtpXGX8ZbitARovpekluSkUQcCdbgFEDVgKF9TzSLOk+1vu
         op0fYEhQp5/3iN3JC+bS9MmALBN1xOy18zzGqRcjqOprKBsSzuY6JciGVqFLxRyuLT32
         AnbCIUtWVPHBl4FABVQsAahSDj6smgGEuqmcjhpnNHsNpNnOnM0ZZgZo18maR85HilCu
         9BTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441512; x=1793046312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsppLSOUeeqjvZdBbTpnZu3hGwb8gc1TK9datAxS4XA=;
        b=G2Xf47Hbc0Ql0Q7Fk/z9ya4ef9g+BRxMZEPy8jd862S8es70VvMWTmJMKb/7dE2AFU
         aQyUE9V8U3h+9BE8PLmFnXwRf8Z134OETz/dziqLg6b+chZjo0VP6hseqnoDwxVd4Y+y
         yc5EI95UvVoCmL8PtDcdxOrhpAB3xhah0H6ab+RoUzwC0MkA25C+On/0wMLyzm1QPeEh
         hgAPleF4aCYLB5gF0lfS4kb9z2c0/crxwzgLyKjn9Alzv23NFb7Gv98mNMYYIvPDzgNk
         Uvley0hR5v1CTyMQE44+w0vg3D1+DftU2cGFRNB/nqIg3g1x8FxmNZOliC9Ko1VP6y0k
         Nlrg==
X-Forwarded-Encrypted: i=1; AKwUvByN7npqZPJRduLhB8HQUUN4yREjSY5ZQaGH7+Yaidqw9vBVwKd7gOl6ftPxI2/e9jILwdWY88vWtjGsv40=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL8ssvXGc5nY9HcwDCF6IdkwL8AUGA6oIx9Y92I3WDgsMGyFni
	owlvHld8gzCWzLgRvA+tm3C1NDmbpRbiVFS9Fsn1pFtoxZHbHNSj2Zv4
X-Gm-Gg: AYBFou3k+Fpik1LNpkuakV3QyxJpaPGIFhDjVvgX++5snNGcnN8K0MOWmPWg7Vtq+zK
	AYEBW+lILKNWq2nNNZVqQYPEntUCmpIKfFpcaTHOB/qgcEOvnXHnPd6TRZZ2uns7EQqpNc+mR5Y
	Fi60lQUpkcAi3fBbd/qWRL4FHiwqaf6kKePJHIJAKqLRsE5tSXC/L5zuGdZfUJ2Fi/PMRcm6/7i
	NJ2l5g11IRmdT/4IXpCD5xSiweILJ2deaCklT/rsIk//pCOZXc8JfwBjO/23bGHUs1of4EPHuIk
	vRuocGuKF0CrsrdX3NxSa0MUVlIT8OC37Q7cpUOvlxI9jMKkrt/i/ZSLGu8ZxpGACID0lOnOum8
	dLq+Me6+CESXGBKT8YPAbhmZ9u/luk/E6z/SoPBQSIeYgI8EjjUnkCZnAKJ4blviFsyLoI+3A2l
	an6FJ9f0AfJIaVNRBP4N0SA2rQPqf5kbdioerE3Tiokd/NmqllFquPt5B0BCpuPONUBhz3RV70u
	po6IZNNiG8rct8dvl4=
X-Received: by 2002:a05:6122:490d:b0:5ea:c727:11fa with SMTP id 71dfb90a1353d-5eac7271e8bmr1173834e0c.0.1792441511588;
        Mon, 19 Oct 2026 13:25:11 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b128725sm11194050e0c.0.2026.10.19.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:25:11 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	Farhan Ali <alifm@linux.ibm.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Darrell Gum <d@rrell.co>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] PCI/PM: Keep the saved config space of an inaccessible device
Date: Mon, 19 Oct 2026 17:24:44 -0300
Message-ID: <20261019202445.38259-2-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019202445.38259-1-fbeltranmillalen@gmail.com>
References: <20261019202445.38259-1-fbeltranmillalen@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_save_state() saves the standard header without checking whether the
device responded.  For an inaccessible device, each read returns all
ones, overwriting the previous snapshot, which pci_restore_state()
writes back after resume.  On a bridge, that sets every writable bit of
the Bridge Control register, Secondary Bus Reset included, and sets the
primary, secondary and subordinate bus numbers to 0xff, which cuts off
everything below it.  This was seen on a MacBookPro14,3, where a bridge
that stopped responding during system suspend came back after resume
with bus numbers ff/ff/ff.

Commit e18d1abc3bff ("PCI: Avoid saving config space state if
inaccessible") added pci_dev_config_accessible() and checks it before a
reset.  Check it in pci_save_state() itself, so that system suspend is
covered as well.

If it is not accessible, keep the previous snapshot, mark the state as
saved and return 0.  This avoids changing callers or making the PM core
warn about a low-power device without saved state.  pci_bus_add_device()
saves the state when the device is added, so normally a snapshot exists.
That snapshot can be older than the last values the device had, for
example if its driver changed the Command register after the last
successful save.

Assisted-by: LLM
Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
v3:
- Keep the previous snapshot and return 0 instead of returning -EIO, so
  that callers see no change.  Returning -EIO changed what some drivers
  do, as described on v2:
  https://lore.kernel.org/all/20261011210451.12129-1-fbeltranmillalen@gmail.com/
- Check accessibility only once, at the start of pci_save_state(), and
  drop the temporary copy of the header and the second check, as Bjorn
  suggested.
- pci_dev_save_and_disable() is left as it is.  Bjorn suggested using
  the return value of pci_save_state() there, and on v2 I said I would.
  This version returns 0 for an inaccessible device, so the existing
  check stays.  It also keeps that function from clearing the Command
  register of a device that does not respond.
- The commit message no longer presents this as a fix for the
  Thunderbolt controller dropping off during suspend.
- Darrell's Tested-by from v2 is not carried over, as the code changed.
- Farhan pointed out [1] that in 2025 Lukas was concerned about checking
  in pci_save_state() itself, as callers that don't need the check pay
  for it [2].  The check is one config read on top of the 16 for the
  header and those for the capabilities.  System suspend saves the state
  both from the PCI core and from the suspend callbacks of many drivers,
  so checking in every caller isn't practical.

About the snapshot that is kept, which I have not tested beyond the
case in the cover letter:
- For a bridge, bus numbers and windows changed after the last
  successful save, for example by hotplug, would be written back with
  their older values.
- The snapshot from pci_bus_add_device() is taken before the driver
  probes, so a device that was never saved again since then gets the
  pre-probe values.
- A device that became inaccessible before it was added has no real
  snapshot: the saved header is all zeros, which is what would be
  written back.

[1] https://lore.kernel.org/all/7ed02ff5-d7f8-42e4-bca9-b3d3ce7b6795@linux.ibm.com/
[2] https://lore.kernel.org/all/aOQX6ZTMvekd6gWy@wunner.de/

v2:
- Use pci_dev_config_accessible() instead of reading the Vendor ID,
  which always reads as all ones on SR-IOV VFs: v1 refused to save the
  state of every VF.
- Do the second check after saving the capabilities, and set
  state_saved only if both checks pass.

 drivers/pci/pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index a62af7320539..eacaa1e71a83 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1794,10 +1794,23 @@ static void pci_restore_pcix_state(struct pci_dev *dev)
  * pci_save_state - save the PCI configuration space of a device before
  *		    suspending
  * @dev: PCI device that we're dealing with
+ *
+ * If the config space of @dev is not accessible, the previous snapshot is
+ * kept and reported as saved, as writing back the all-ones values read from
+ * such a device would corrupt it once it is accessible again.
+ *
+ * Return: 0 on success, or a negative errno if a capability could not be
+ * saved.
  */
 int pci_save_state(struct pci_dev *dev)
 {
 	int i;
+
+	if (!pci_dev_config_accessible(dev, "save state")) {
+		dev->state_saved = true;
+		return 0;
+	}
+
 	/* XXX: 100% dword access ok here? */
 	for (i = 0; i < 16; i++) {
 		pci_read_config_dword(dev, i * 4, &dev->saved_config_space[i]);
