Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B828505E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121720; cv=none; b=lb0BW4S+HKix+AiwO0Yd1hsG2Xb3gclK7EO8ebubwEkYljVF/dBmzRBoGqyajlpcxL3+pqRGl4QYhrVg+/xZurJJsPUCovwjF8DLJURsKObeBGu8q9R84q7t7WER7mB8UmNvenEuuDlkLGxhUbzViQ3zF1VtjCVUhmY1M/wVNWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121720; c=relaxed/simple;
	bh=sUBxit0FkZq4aET5SkaiziphCADySSDlTXWFFXegkj4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Rurx6c5LJgwDXR666Gi+lO5YZRbssSk47sW8x4PQceVl06E/nNlWwmtlYaEnzcZotyXwuvhsFCp04GPUK8KEYoAtOucKBFfci+830M2Y+LpZjzuaX+fVD/uBYUzzSliijupuW4kj3JXHdYHHqYqAfZWt3WkjmbMZHPF5DgyTjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ylfz9piY; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ylfz9piY"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso3068549a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788121718; x=1788726518; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=li9ks3fzgj1JF/ynP8/WlTAM/bKVb0+AaGC4hKm7+4g=;
        b=Ylfz9piYOgyfd8POLSWG64NOy44oAcplrw33qtqtqOoarJOGC9k6pmcEMabVmlTVFB
         4poP5UBgUsXCLw6jgc9Xl7OtYSee41FtONZLJl3tFkWvC1ivmBp7D8WXqNrcn8UlmMDY
         bv6X8z0IALkQkDs9mP6tLtCALQN1tPfiKnbe80/Qh6WdFwc5H54wt5OL+lyWK/NiTi7X
         UL6FLRabuS9I12SUhCzU9y5ciAzqiEQK/Bef6y/LdRnZvM7IhtxEhtPup4AHUx9S0OW1
         GSi/Eh0nvinYWhfZ2aG4coBES05Ig8VJCPzGkcEVlVDYidNn4zVUZqDJqKjRd0v2OQWd
         S2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788121718; x=1788726518;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li9ks3fzgj1JF/ynP8/WlTAM/bKVb0+AaGC4hKm7+4g=;
        b=VslBvbgPdQwBdsMTO2QX+JP3l9z8tOoUjwwJoKX5w7DMV/bZdmOAY/ZVB5zX6LN/6A
         VuyrCgxGMl0ir5KPfEbJfmuQ6HKUgdvIw2J6mvT24J8txY0noeEriwsXM/Y28vPmQFA2
         OK5L/pgiQyi+fbS2fuKBUqe27zLPvYjyLrksBoXmobu1/zxq8wFl1L7gqEAIls1o4JFl
         PBZm4Ja1aLGcrD+tn4fjyq9t5hFK8CF+yDKo6H+qYqVbGdLTejBZc30bo+Q1PUZh60r9
         9AvxKgVLcAni3eb39cwNrXrtkb12UKz19IcZqDRCQ+uACOqbXyIOwisi6nSeQomuNIdW
         fHJg==
X-Forwarded-Encrypted: i=1; AHgh+RpsleS6ZkRFXXnmIMuh48nBq7Z5I6gBAQA9y9pwTwO0hkdXzu85kN95shKf1ddyQkZF82uSYyGyTnGbfgA=@vger.kernel.org
X-Gm-Message-State: AFuF++m/9JbunGAujQps8vGuiYF7+cKJsZD1h5QQnptJ1yjB19oaj3T4
	ymMjSWgSXfW6TNf4bCPQxIIcFTqYGKxLMv6KukkrEcs6CwsRRW/Q69Idgpt+iOdrXsMozxjdnGa
	jLEK6IPHiBKVqW6B1Le2hO8eUFDBIuLOnRQ==
X-Received: from pgca19-n1.prod.google.com ([2002:a05:6a02:6393:10b0:c92:460e:4f73])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:218c:b0:857:7317:cff1 with SMTP id d2e1a72fcca58-8577317d1a1mr20165511b3a.18.1788121717681;
 Sun, 30 Aug 2026 13:28:37 -0700 (PDT)
Date: Sun, 30 Aug 2026 20:28:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGuSlGoC/x2MQQqAIBAAvxJ7bsEsTPpKdLBcaykstEKI/p50H
 IaZByIFpghd8UCgmyPvPkNVFjAtxs+EbDODFFIJXQt0nNBQwEBu2i9/4kZmRVW32unGKjkayO2 RNaf/2w/v+wEceHDWZwAAAA==
X-Change-Id: 20260830-fix-aer-refcount-leak-6378f84d62ba
X-Mailer: b4 0.14.3
Message-ID: <20260830-fix-aer-refcount-leak-v1-1-64e1013add12@google.com>
Subject: [PATCH] PCI/AER: Fix struct pci_dev reference leak in aer_process_err_devices()
From: Priyank Rathod <rathodpriyank@google.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Stefan Roese <stefan.roese@mailbox.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Priyank Rathod <rathodpriyank@google.com>
Content-Type: text/plain; charset="utf-8"

When an AER error occurs, candidate error-source devices are identified
and recorded into e_info->dev[] via add_error_device(), which increments
each device's reference count with pci_dev_get().

If is_error_source() matches a device purely by Requester/Completer ID
match (e_info->id == pci_dev_id(dev)), the device is added to e_info->dev[]
even if it lacks the AER extended capability (dev->aer_cap == 0).

Later, during aer_process_err_devices(), aer_get_device_error_info()
returns 0 when dev->aer_cap is 0 (or if no active error status is read),
causing aer_process_err_devices() to skip handle_error_source().
Previously, handle_error_source() was responsible for calling
pci_dev_put(dev). When handle_error_source() was skipped, pci_dev_put()
was never invoked, permanently leaking the struct pci_dev reference.

Decouple device reference release from error handling by removing
pci_dev_put() from handle_error_source() and calling pci_dev_put()
unconditionally for all recorded devices in aer_process_err_devices().

Fixes: 1ab4a3c80508 ("PCI/AER: Stop ruling out unbound devices as error source")
Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
When native PCIe Advanced Error Reporting (AER) handles an error signaled
by a Root Port or Root Complex Event Collector (RCEC) via
aer_isr_one_error_type(), candidate error-source devices are identified
by walking the downstream hierarchy in find_source_device().

During this walk, each matching device is enqueued into e_info->dev[] by
add_error_device(), which increments the device's reference count via
pci_dev_get(dev).

1. The Vulnerable Use Cases:
============================
is_error_source() matches devices through two distinct mechanisms:
  a) Explicit Requester/Completer ID match:
     if (e_info->id == pci_dev_id(dev))
         return true;
  b) Uncorrectable/Correctable status register inspection across the hierarchy.

On the ID-match fast path (a), is_error_source() returns true without
checking whether the device implements the AER extended capability
(dev->aer_cap != 0). This creates a real, non-exotic situation in several
common hardware topologies and operational states:

  - Non-AER Endpoints: Simple or legacy PCIe endpoints (e.g. basic serial,
    sensor, audio, or older controller ICs) that implement standard PCIe
    capabilities (0x10) but omit the AER Extended Capability (0x0001) in
    extended configuration space.
  - Multi-function PCIe Devices: Multi-function endpoints where AER is only
    implemented on Function 0, but an error is routed or attributed to
    Function 1..7 which have dev->aer_cap == 0.
  - Devices behind PCIe-to-PCI/PCI-X Bridges: Conventional PCI devices
    aliased under a bridge's Requester ID or lacking AER registers.
  - Unbound Devices: Following commit 1ab4a3c80508 ("PCI/AER: Stop ruling out
    unbound devices as error source"), devices with dev->enable_cnt == 0 are
    no longer filtered out. An unbound, un-configured device without AER
    registers that triggers link-level errors is matched purely by ID.
  - Transient Errors / Zero Status: Devices whose AER status registers read
    as 0 or return ~0 (link down / device in D3) during config read in
    aer_get_device_error_info().

2. The Refcount Leak Mechanics:
===============================
When any of the above conditions occur:
  1. add_error_device() takes a reference: e_info->dev[i] = pci_dev_get(dev).
  2. aer_process_err_devices() iterates over e_info->dev[i] and calls
     aer_get_device_error_info(e_info, i).
  3. aer_get_device_error_info() checks 'if (!aer) return 0;' and immediately
     returns 0 because dev->aer_cap == 0.
  4. aer_process_err_devices() evaluates:
       if (aer_get_device_error_info(e_info, i))
           handle_error_source(e_info->dev[i], e_info);
     Because aer_get_device_error_info() returned 0, handle_error_source()
     is completely bypassed.
  5. Previously, handle_error_source() was the sole owner of pci_dev_put(dev).
     Bypassing handle_error_source() leaves the reference taken in step (1)
     unreleased.

3. Impact:
==========
Because the struct pci_dev reference count never reaches zero:
  - The struct device release callback pci_release_dev() is never invoked.
  - Dynamic device resources, sysfs entries, DMA mappings, and aer_info
    remain allocated in memory, even after the device is hot-unplugged or
    removed via sysfs ('echo 1 > /sys/bus/pci/devices/.../remove').
  - Under link instability or an error storm where errors are repeatedly
    attributed to a non-AER device, each error event leaks one pci_dev
    reference, leading to unbounded refcount inflation and memory leaks.

4. Proposed Fix:
================
Decouple device reference lifetime management from error reporting:
  - Remove pci_dev_put() from handle_error_source().
  - Unconditionally invoke pci_dev_put(e_info->dev[i]) in
    aer_process_err_devices() for every candidate device recorded in
    e_info->dev[] across the loop.

This ensures every pci_dev_get() in add_error_device() has a strict,
guaranteed 1:1 lifecycle match in aer_process_err_devices(), irrespective of
device capability presence, status bit reads, or driver binding state.
---
 drivers/pci/pcie/aer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index c4fd9c0b2a54..2401b3a18f07 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1197,7 +1197,6 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 {
 	cxl_rch_handle_error(dev, info);
 	pci_aer_handle_error(dev, info);
-	pci_dev_put(dev);
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
@@ -1361,6 +1360,7 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
 		if (aer_get_device_error_info(e_info, i))
 			handle_error_source(e_info->dev[i], e_info);
+		pci_dev_put(e_info->dev[i]);
 	}
 }
 

---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260830-fix-aer-refcount-leak-6378f84d62ba

Best regards,
-- 
Priyank Rathod <rathodpriyank@google.com>

