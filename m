Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE6E33D503
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050901; cv=none; b=dgj1yw+B2BZDdbsou+lkawP+sS+hD8A5RnTP9wAgi37VNGq689pVPT5xF1fPj2ag4b5S/laLrQ1IXxvt9UpMl+tdjvorSc6hC2GXsk9TSHLs9h8Tf258GMmiw/sn3YT1dUCpu8ypSPpU/8OZuLbMOAxRdaKnVcsTdFsgtFhwwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050901; c=relaxed/simple;
	bh=ha/G3dQOHNOkYRKWPJia3wRwrtSelDlCsigpRGS/33A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rT7jnvOKjj57bd3yZ82JTRyuM3HoFYkIdPbINSmZc/p9s4MkQ/MOY7/TffDueYkgs+hK7fJgivtp1QktzYJRBOWIj9SN+K2fJ68muS2FNUcHP6E0pyv68YxEkQ/E/VVPo42AooJvOezP0oxXfV8FwuSP1rnfwsse1U+TT/2B0Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+/SInvH; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+/SInvH"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49545071724so64662295e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789050898; x=1789655698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vLdGOSaZKVRiQ2yqyODIPDHphzpEsgnt6OvmN+p7ZKI=;
        b=l+/SInvHlpM8SQ3WZf+NFDSYvChYdilqkq6ZZD7O4TaX2NQs9zmTg6te3gb1vkvIuF
         4SWGWitDRfviYg03mEZca4vpq3SNLK0LtMX5URss/eYrMdijOmq3/2QQkuArzF4Avi7B
         27TU/9YRr5jCSVkQwLYDTVC7259oSxBZR5Y5VQ/xrSKFA6LUGyFM4aGSi7+/6tO0AAfQ
         vFtt1y//3syVDUIYj4iwF16XNNVgJgFAWT8nrdrg+sMZoJuS0t9/1fdOOSaMZevTTEuW
         ugmCbQ365gBnsrN4hWxONO843uOESSjTBy9BErOrxGEECwjamP1k7JFpLbqQzU3zCf2h
         n+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050898; x=1789655698;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLdGOSaZKVRiQ2yqyODIPDHphzpEsgnt6OvmN+p7ZKI=;
        b=XwvL7N+9TnclkxNbcjy48FyF1Ttkm/y6mkL1FuBqHhb28pfRCefVAGcR70+Z+1iH1K
         8/XQJOhFFNAFBNNI7VJz/hcI+6uv0IzJSHRihfpvK+UsSEg6jW8i4oAakfznWsx3F++O
         x76DOBjDvMRoD8YyIMHoyGoPi5MD+FA8jrPqt1P0trdaGojU3J1UwjA+5HK3yhrrQXrW
         yqr25xXar+mWKHohrogAHtmR0nz9eXLlJiUyn4qCju8dbvBRNaeOnzjImyFnghZ3RW+h
         FkY440g5f0E9qhehKQWqdSMyt26eRRM55u/G8VVprlafKHKFURO7zinuopBRkEvbvbKi
         Mv+g==
X-Gm-Message-State: AFuF++k9h3j2TwKqOvR+xNIkJGRTLGRYFvEms1+vLNLppB6KzDf5uNBT
	QMp0RcAEF/dyn6P9SeQQOOqqMqcHm3Ut9Ztz6lWH0A5ssCXEdnE706AI074hft+0EHs3bPTRlw=
	=
X-Received: from wrck19.prod.google.com ([2002:a5d:5253:0:b0:481:42c1:a3f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4804:b0:482:e451:6810
 with SMTP id ffacd0b85a97d-4858703f65cmr46225743f8f.1.1789050897441; Thu, 10
 Sep 2026 07:34:57 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:34:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113; i=ardb@kernel.org;
 h=from:subject; bh=d0ouAXSJJKlPEcoAofimBWCt5MeyJAw1y1ceFAVT0fQ=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGqiwAGg7JiMNdgBxG/csgtc6YaVRLSrODPmBtIV+lbgDCIQG
 4h1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmqiwAEACgkQMG4JVi59LVxY3gD/RAOg
 XhLaWgkX74KmgFPKBOAtUuXpKmxVQAfcGk2+3NUA/0LzFhVedW97oukbC3wii5l9fXuBCkUWCX9 mERYBPBMG
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910143440.3865663-2-ardb+git@google.com>
Subject: [RFC PATCH] PCI: Tolerate non-prefetchable 64-bit BARs in
 prefetchable windows
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Ard Biesheuvel <ardb@kernel.org>

The prefetchable vs. non-prefetchable distinction is a relic of
conventional PCI, to denote from which regions PCI-PCI bridges were
permitted to perform speculative readahead.

For software compatibility reasons, PCI Express inherited the Type 1
header and models PCIe root ports as PCI-PCI bridges. However, this
readahead behavior does not exist in PCIe, and so this distinction has
mostly become meaningless on the bridge level.

As per the PCIe r6.3 ECN "Removing Prefetchable Terminology", the
'prefetchable' designation has been removed from the specification
entirely, on the basis that it is obsolete, and is being abused to
inform memory mapping attributes and other device/BAR level properties
that it was never intended for.

Given the limited range for non-prefetchable windows in the Type 1
header, and the fact that the distinction no longer exists for PCIe,
resource allocation performed by firmware may result in non-prefetchable
64-bit BARs being allocated inside prefetchable bridge windows.

Linux rejects such allocations ("can't claim; no compatible bridge
window") when it encounters them, but will usually fail to produce an
alternative allocation, given that firmware wouldn't have placed them
there in the first place if there was sufficient space in the
non-prefetchable window.

So at the very least, let's not reject such allocations when they were
made by the firmware.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Link: https://github.com/tianocore/edk2/issues/13104

 drivers/pci/pci.c   | 3 ++-
 include/linux/pci.h | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be5f8..e33eb9f3a139 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -761,7 +761,8 @@ struct resource *pci_find_parent_resource(const struct =
pci_dev *dev,
 			 * not, the allocator made a mistake.
 			 */
 			if (r->flags & IORESOURCE_PREFETCH &&
-			    !(res->flags & IORESOURCE_PREFETCH))
+			    !(res->flags & IORESOURCE_PREFETCH) &&
+			    !pci_is_pcie(dev))
 				return NULL;
=20
 			/*
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d31a8d107b1e..1cbb4b6c02c3 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2684,7 +2684,7 @@ static inline void pci_vf_drivers_autoprobe(struct pc=
i_dev *dev, bool probe) { }
  * need to calculate PCIe capability offset from raw device for some
  * reasons, please use pci_find_capability() instead.
  */
-static inline int pci_pcie_cap(struct pci_dev *dev)
+static inline int pci_pcie_cap(const struct pci_dev *dev)
 {
 	return dev->pcie_cap;
 }
@@ -2695,7 +2695,7 @@ static inline int pci_pcie_cap(struct pci_dev *dev)
  *
  * Returns: true if the PCI device is PCI Express capable, false otherwise=
.
  */
-static inline bool pci_is_pcie(struct pci_dev *dev)
+static inline bool pci_is_pcie(const struct pci_dev *dev)
 {
 	return pci_pcie_cap(dev);
 }
--=20
2.55.0.1003.g10538fe699-goog

