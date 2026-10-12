Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91994BB5CC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838687; cv=none; b=jVCrb8BLfI3jJRfNZKLMOwU9WnugCmQKJ/UL0J4VoGVgBWbDYDeNB2Ac0gFdcjZHI5/qFlcR0oBwz3oZJ3Jcbnh+OgofOHH20V5xyQya+PRWZ6LYJFxi3eH1vUjOT4J2YpCHCbleXf1v3e8YkijE4hMEbySP+0TKdbIUvrjRmNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838687; c=relaxed/simple;
	bh=MMFMgWCczZHhmVE2F+jgXamjYo8yzRhDSVfG8+eQahI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=luL1+uxjfMuFG+fzCca5TaJo+j+IawNpDr3Xc2Ma8iKhWrMy6nvoZiKCo0pARmtmOUidfRXoOSZKtt+/2/MeQssU0ZEjaDLtW4z1Qy44RX1YAdDx80w1heBuxlS6+PtkkmD/ytTwbOCykqQC1na+iNvJS7bPPwoXqFWNuR6JfXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7EqXgnI; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7EqXgnI"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso3639977eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791838684; x=1792443484; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13W6q7i4O/eZzoQLPHcgv9LUkm1ZdongNNGyBgoboDE=;
        b=I7EqXgnInFQJyvAw4Z0EWw+CNgD1AI1qE8Yf3NUjyH0URORRGlqpwgUnq89FnpVcd1
         7uNAPenVk+2iRTQzVRv12v5rVcUYicYH04l+HeZx45s66ow3orTtiuaibfvRkxnMHGW8
         RfOLj+66fyiavdGkVxAJ26Saap3l4lzhviirBp9HOTJ7X26BtLRsRDq607f9qjoNiOF8
         LAVLr02aBGz1AJCd9TXlcEJCPOk/IVEUsKLyWy5dsGnkUypl5cF99Vt4LSAyHAcl5S0t
         kuMlsXMdou2z99kUPuiw1yfLqcshsMZO1Idt4ldicX825oCpSTuMkpQokk+RJ/2RfNug
         Sv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838684; x=1792443484;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13W6q7i4O/eZzoQLPHcgv9LUkm1ZdongNNGyBgoboDE=;
        b=PicX6V6AkS4yP6ggBqbY2b2NtOxXe2kdMXOiVgEMbHGGwPrdefFBhWIUNFBDBkY90C
         /zYZV5iqFpuZiOOR7catCSiaam0TMRIfgaK19MAgUDKDvv6HblXwxl8nj75LIuUIimv9
         x7HYbybvmNa8eENMkjl5MFoL4VgolfjqGFCoKmWbjhob/5AHWfc9WPP89yTiniv0Xxt5
         BtqXdXZJhU93/kgRsaeal9Hi49zI7CNMMC2AmhFRsX7BNGgQKDsoMmnuH2Hn+Pr8OC50
         jwyEJxbt5/ESIpdM05bXnDByZYLnbHzMVy67a8LMtzGEPBq1T/Ri05gSN0Okc5MWXnbb
         SK3w==
X-Forwarded-Encrypted: i=1; AKwUvBwZDuOYnJURz2LsKNLmKl3O0WHzKtOq/+AvWp5lJ30wDx55PXSmEl2eXGpMox/VvBNnW8RkC5nDB/OmB50=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoUmwAgT05EMsBxdVrj5kM021N6/zagHUJMTQShlPNunu6e/kz
	lKuHn0nzHUTo04OgH+iTVciCmt03cL84QNqawAESnmfbvvQ76NEkWUQlrJ0zWpQKQyFaYh/zBrO
	RaejlObsgFzB2jPGHPW78ZvBf1ooa4FGyZg==
X-Received: from dycam26.prod.google.com ([2002:a05:7300:fc1a:b0:351:7ff8:2656])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:c7c4:b0:353:7b29:54ec with SMTP id 5a478bee46e88-3537e2d8ec8mr15070766eec.40.1791838682637;
 Mon, 12 Oct 2026 13:58:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:53:37 -0700
In-Reply-To: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com>
Subject: [PATCH 2/2] Documentation: PCI: Document aer_inject's
 aer_mask_override parameter
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Prarit Bhargava <prarit@redhat.com>, Huang Ying <ying.huang@linux.alibaba.com>, 
	Terry Bowman <terry.bowman@amd.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Priyank Rathod <rathodpriyank@google.com>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"

aer_inject has had the aer_mask_override module parameter since commit
457d9d088b02 ("PCI: aer-inject: Override PCIe AER Mask Registers"), but
the AER HOWTO never mentioned it.  Describe what it is for (injecting
errors that the device masks, in particular those masked by default)
and how it behaves now that it works: the device's Mask registers are
left alone, the injected bits are only reported as unmasked while they
are pending, and the hidden Mask bits stay set in writes until the
module is unloaded.

Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
 Documentation/PCI/pcieaer-howto.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index 90fdfddd3ae5..71a9c2377b3b 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -265,3 +265,26 @@ from:
 
 More information about aer-inject can be found in the document in
 its source code.
+
+Injecting masked errors
+-----------------------
+
+By default aer_inject refuses, with -EINVAL, to inject an error that the
+device masks in its Correctable or Uncorrectable Error Mask register,
+because the AER driver would ignore it just like a real masked error.
+To exercise the handling of such errors anyway, e.g., of those that are
+masked by default like Header Log Overflow or Poisoned TLP Egress
+Blocked, load the module with::
+
+    modprobe aer_inject aer_mask_override=1
+
+or boot with aer_inject.aer_mask_override=1 if it is built in.
+
+The device's Mask registers are not modified.  Instead, as long as the
+injected error bits are pending in the emulated Status registers, reads
+of the Mask registers through the PCI core report them as unmasked, so
+the AER driver handles the injected error as if the device had it
+unmasked.  The Mask register bits hidden this way are kept set in
+writes to the Mask registers until aer_inject is unloaded, so that a
+value saved through the emulation (e.g., by pci_save_state()) cannot
+unmask them in the device.

-- 
2.56.0.385.gd3acb90ef8-goog

