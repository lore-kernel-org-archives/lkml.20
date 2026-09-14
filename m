Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F2346E54
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404367; cv=none; b=avbd7gTY8dlgxadMZZWnd11w3Xk88qqrCE9uTgU3fzPS3Upy+EmAjIDAbk2jD4POmtdgWl9fjxegAsHVNuJvhChICqPgFl1ZdM+jzmwljGoMWbeHrClJtrXvYT71MfMb679QZR7oK+1HbMOCF7e4zAZ6USX3s4f2Ng514E/hTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404367; c=relaxed/simple;
	bh=AbWZZSRMSxWU4lPtaJRbw3aXLmhhfKL9PttGs9UHNEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muJcC5F6zgZjwQH6/g/nM8Jt4On8KcTkxa3jnL4fS/YWaN0w5KDYXZaV8fPzRnSzl+LUtYNHdBPiTBNE1sLxKZONQoNJ4O1tmwdPGdeIbcbeFn746QZc2Rl9zDQiRM5+s8Hrf6jNYdxSkVpspbL00uTx6+LEkTkHmu+M+cHkpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HZtBxv6A; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HZtBxv6A"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a3490bso2111460b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789404364; x=1790009164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaEn4gJaLG6//UlaQV046R50HUoC/N5LfAqjMif4QV0=;
        b=HZtBxv6AQhpZhM2bzd3LC6nI0HmDWWrfo94WoN+4IiWrbFLRUj6mcGvyGM2zWsEs/p
         UcAaN0gwGQlnOUuIwrLgriIVtXN1oK3X0x5OfR9/g54iJnAv2lsXUzRSsFnMktLx+Dfm
         PtA6hvFdFQkhAnNXTa52P/V+mVSAIxJpz3GUWcbBuNHTzbmecyxJtilSbJJ5FiPweyiC
         res3g+8cFm5a+w8OdrY8VcBAH/16QBLPSoW/4DSzfgMrORabVB8zfa21N5Xi8HS50Rd+
         R94hFys6pXsnm+FWAUyUE7Gro/1hfUck0VWa+Scelz8DVA025pcvjjXoNLeBDjP/KbM8
         bR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404364; x=1790009164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaEn4gJaLG6//UlaQV046R50HUoC/N5LfAqjMif4QV0=;
        b=ZqoT/qW6ZdCUp2T65QKFjhsHlT5IaM3OROaseeNbQ+9E1cHAWCQqOVxAMSu5XpjVs+
         j2bkqsnbYpBfVNZeS4hlopAerSgeEUaz/p33W45OlXnDG3zhmqF0w7uqHnu6SjOfkBW+
         efKvZKPx8DA2N/lCiqguDHl17A2nej6cj15rT9AXi4BHDm+5Mtwnb3HY3zNm9ItrU5Cu
         I7KRYpI4QPXynDUGLYMn8O/Y6/GHQXnqni6kATci2Zw+QvaxgaXBF4kIOL8cY7MBxrxS
         0Nl9MaBemHrJk/tfqiKDLXzWjRDzrGbxOr5WKraAV2Q89L5qxHYRr6tdQSIyfocUU2Zv
         nXLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBUb51slWz5VZNZu/oxRXYXP8PX7Q1bEO+mfEZ8XhPdhrCJO0CAtEVc84szHuCyabi2CKsBlZrObpIYXo=@vger.kernel.org
X-Gm-Message-State: AFuF++mQMBGUEHVztkghu05k+7RClUJwHKVksy79IIyL+dyONjgoJQL6
	myjyCVM8JoJ4VNrgkDX5gRFllxUKiubKYyI6dZNZJQ+MwM+OhWU2QqHepDus9ihWdw==
X-Gm-Gg: AYBFou1gOjKdwSr1BBlQLqA46yt9TXuZRLEvlTHd+Ppy8mv5n+YHZ/RtpB6AZxW654i
	spVxVgNI+VwMiZFhaGdQYRCFsaW2vFHXfdESMAFCm4l7wDPknd+nef6oDvEJ9LMjlSoYzyRDAl2
	ySa4aaTikF6lGdomDzFb0MK8LmN/FTYiwipn+Sgg+mceSG9clvjK8XUT0GkYIgmRrR+HeV0TzXD
	2NQQZ2I5ZWlp/L4l9IkVEu5ISerZ/B/priA75yyKUqU7W9pHTdxRJrnu6mkrPduu7Kwt9w2hRDu
	PfZ5/9PzJIn5d+3NgJvrjSHrCkHDHB57E0lX2gudVh0uRLomxJj/1d4yVOnf63gv9t3iIhlR9ht
	xaitC8FWh1GelXrPRRUVdIpRfJ+3t3OXMyltA1afBsCYjfwqafp/iAFq+tAg1odcrKDG9pFosQ4
	zskccMpRZvaBKT0BgSadLvI41kwFfGDrDFpw1Jr4X2WrfpV4q+0NQZ6+3kFYA8YElnzR+VShdUf
	zuLn8N68MeGiUa50m1Vb0J+F0lMdRzNOEzvPET3
X-Received: by 2002:a05:6a00:2992:b0:857:7337:5db9 with SMTP id d2e1a72fcca58-86f860d2bdfmr7633241b3a.23.1789404363216;
        Mon, 14 Sep 2026 09:46:03 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b21f0597dsm4930607b3a.0.2026.09.14.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:46:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:45:58 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 08/12] PCI: liveupdate: Adopt ACS controls in incoming
 preserved devices
Message-ID: <aqgkxmXlhfqsdfAa@google.com>
References: <20260728221007.2098560-9-dmatlack@google.com>
 <20260910235149.GA364189@bhelgaas>
 <aqRJF8OME7hn7CJr@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqRJF8OME7hn7CJr@google.com>

On 2026-09-11 06:31 PM, David Matlack wrote:
> On 2026-09-10 06:51 PM, Bjorn Helgaas wrote:
> 
> > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > index 77b17b13ee61..22001bdf4c97 100644
> > > --- a/drivers/pci/pci.c
> > > +++ b/drivers/pci/pci.c
> > > @@ -34,6 +34,8 @@
> > >  #include <linux/aer.h>
> > >  #include <linux/bitfield.h>
> > >  #include <linux/suspend.h>
> > > +
> > > +#include "liveupdate.h"
> > >  #include "pci.h"
> > >  
> > >  DEFINE_MUTEX(pci_slot_mutex);
> > > @@ -1008,6 +1010,9 @@ void pci_enable_acs(struct pci_dev *dev)
> > >  	bool enable_acs = false;
> > >  	int pos;
> > >  
> > > +	if (!pci_liveupdate_enable_adopted_acs_controls(dev))
> > > +		return;
> > 
> > Ugh.  The asymmetry between pci_save_state(), which does nothing
> > ACS-related, and pci_restore_state(), which enables it, is sort of
> > sketchy to begin with.
> > 
> > The command-line parsing in this path feels like kind of a wart (not
> > that you're touching it).
> > 
> > It just seems like this path is already hard to analyze, and
> > liveupdate is making it harder.
> > 
> > If we could save/restore the ACS state around the reset, wouldn't that
> > solve this without any liveupdate specials here?
> 
> Yeah that would simplify the liveupdate support greatly. Let me work on
> that for v9.

Here's the patch I have prepped for v9 to save/restore ACS controls
around reset:

From 0c69424454de0c569aca67bc69f496db915a9bcf Mon Sep 17 00:00:00 2001
From: David Matlack <dmatlack@google.com>
Date: Fri, 11 Sep 2026 20:05:04 +0000
Subject: [PATCH] PCI: Save and restore the ACS Control register

Save the ACS Control register in pci_save_state() and write it back
in pci_restore_state(), instead of recomputing the ACS controls from
scratch with pci_enable_acs().

This makes ACS symmetric with the rest of a device's saved state. Today
pci_save_state() ignores ACS entirely and pci_restore_state() re-enables
the ACS controls from the kernel's current ACS policy. As a result, a
device can come out of a reset with different ACS controls than it went
in with, e.g. any controls programmed outside of pci_enable_acs() are
silently dropped.

pci_enable_acs() runs when a driver binds to a device
(pci_dma_configure()), i.e. after pci_bus_add_device() has already saved
the device's state. Refresh the saved ACS Control register there as
well, otherwise a subsequent reset would revert ACS back to the
configuration left behind by firmware.

Devices that rely on device-specific quirks to enable an ACS equivalent
keep that configuration outside of the ACS Control register, so keep
configuring ACS from scratch for them. Do the same for devices that have
no saved ACS state at all.

Assisted-by: Claude:claude-opus-5
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pci.c    | 66 +++++++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci.h    |  5 ++++
 drivers/pci/quirks.c |  7 +++++
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be5f8..dd25c01736b4 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1021,6 +1021,55 @@ static void pci_std_enable_acs(struct pci_dev *dev, struct pci_acs *caps)
 		caps->ctrl |= (dev->acs_capabilities & PCI_ACS_TB);
 }
 
+/**
+ * pci_save_acs_state - save the ACS Control register
+ * @dev: the PCI device
+ *
+ * Record the ACS controls currently programmed in hardware so that
+ * pci_restore_acs_state() can reapply them after a reset.
+ */
+static void pci_save_acs_state(struct pci_dev *dev)
+{
+	struct pci_cap_saved_state *save_state;
+
+	if (!dev->acs_cap)
+		return;
+
+	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS);
+	if (!save_state)
+		return;
+
+	pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL,
+			     (u16 *)&save_state->cap.data[0]);
+}
+
+/**
+ * pci_restore_acs_state - restore the ACS Control register
+ * @dev: the PCI device
+ */
+static void pci_restore_acs_state(struct pci_dev *dev)
+{
+	struct pci_cap_saved_state *save_state = NULL;
+
+	if (dev->acs_cap && !pci_need_dev_specific_enable_acs(dev))
+		save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS);
+
+	/*
+	 * Devices that rely on device-specific quirks to enable an ACS
+	 * equivalent keep that configuration outside of the ACS Control
+	 * register, so there is nothing useful to restore for them. Configure
+	 * ACS from scratch instead, which also covers devices that have no
+	 * saved ACS state at all.
+	 */
+	if (!save_state) {
+		pci_enable_acs(dev);
+		return;
+	}
+
+	pci_write_config_word(dev, dev->acs_cap + PCI_ACS_CTRL,
+			      *(u16 *)&save_state->cap.data[0]);
+}
+
 /**
  * pci_enable_acs - enable ACS if hardware support it
  * @dev: the PCI device
@@ -1057,6 +1106,15 @@ void pci_enable_acs(struct pci_dev *dev)
 	__pci_config_acs(dev, &caps, config_acs_param, 0, 0);
 
 	pci_write_config_word(dev, pos + PCI_ACS_CTRL, caps.ctrl);
+
+	/*
+	 * pci_enable_acs() runs when a driver binds to the device, i.e. after
+	 * pci_bus_add_device() has already saved the device's state. Refresh
+	 * the saved ACS Control register so that a subsequent reset restores
+	 * the controls programmed here rather than the ones left behind by
+	 * firmware.
+	 */
+	pci_save_acs_state(dev);
 }
 
 /**
@@ -1800,6 +1858,7 @@ int pci_save_state(struct pci_dev *dev)
 	pci_save_aer_state(dev);
 	pci_save_ptm_state(dev);
 	pci_save_tph_state(dev);
+	pci_save_acs_state(dev);
 	return pci_save_vc_state(dev);
 }
 EXPORT_SYMBOL(pci_save_state);
@@ -1877,7 +1936,7 @@ void pci_restore_state(struct pci_dev *dev)
 	pci_restore_msi_state(dev);
 
 	/* Restore ACS and IOV configuration state */
-	pci_enable_acs(dev);
+	pci_restore_acs_state(dev);
 	pci_restore_iov_state(dev);
 
 	dev->state_saved = false;
@@ -3532,6 +3591,11 @@ void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 	if (error)
 		pci_err(dev, "unable to allocate suspend buffer for LTR\n");
 
+	error = pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_ACS,
+					    sizeof(u16));
+	if (error)
+		pci_err(dev, "unable to allocate suspend buffer for ACS\n");
+
 	pci_allocate_vc_save_buffers(dev);
 }
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc2..037c1674f164 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1095,6 +1095,7 @@ void pci_acs_init(struct pci_dev *dev);
 void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
+bool pci_need_dev_specific_enable_acs(struct pci_dev *dev);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);
 int pci_dev_specific_disable_acs_redir(struct pci_dev *dev);
 void pci_disable_broken_acs_cap(struct pci_dev *pdev);
@@ -1105,6 +1106,10 @@ static inline int pci_dev_specific_acs_enabled(struct pci_dev *dev,
 {
 	return -ENOTTY;
 }
+static inline bool pci_need_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	return false;
+}
 static inline int pci_dev_specific_enable_acs(struct pci_dev *dev)
 {
 	return -ENOTTY;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7aee30734303..e500c202d2ec 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5476,6 +5476,13 @@ static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
 	return NULL;
 }
 
+bool pci_need_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
+
+	return p && p->enable_acs;
+}
+
 int pci_dev_specific_enable_acs(struct pci_dev *dev)
 {
 	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
