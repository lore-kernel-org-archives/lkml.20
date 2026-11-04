Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811596;
	b=z+kTua0Wr9FuOIUdxhtj8hHqurzt7eS5o3wYcldmM3ctiM4mgAD7sq5/7IKyu9iA3WBn
	 PAOhEbXlDqujVUi49fvz3L2u+DYrSMuSPBdd3qzUNq8CUUKEiRAXx6eHKLNPR4+HRbmXw
	 U3BOOMIGM3QBGZGHKVieDunk9AwnzQH7CSF7Ya5UfAbHpEyAQ4vmiMLcumlwz1WoqyaQl
	 F7HrdhiYXbJ6O2Zk5WQeB011Duuv3fRkMfDcYtvsvSTYT/Kro9bgmvxxrXFjlLL+8ghP0
	 fBBe6SFY/netPafrUWtg8IfxJwE6CdGQpEmRpF+LlhULlhKsLbTQN/xTQDfxmMIGB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3nBmuFFvpK9ZuJMVGhj4Fxmt/qwgnA7lrzzghhGHOis=;
	b=bntGhtczBhINskDy45imo+KY8KWumZtekGpU4wtb5tB1VJZsDc1TXEe3bSCcjn3qry0w
	 Sw5O0SVBtdMlEwPluVQlnp5rm9dp8XtszWZ5ljYVn9WHax5V4oOEFzadRySFXYDB6vk5V
	 1BJ4u5Nr/C55R+ZR8AqwjkRE9cpQ+OHSj3RSCvDtsMY7+Co+v0tMnlZUAoLrdbrYa9K2Z
	 ij3Nk2Q7mUVrUQwarcj0tNE7Hgs3dDWJef533AJnkPo4iqJh/6bE3uCjg1VHdj3JhgDjj
	 tZZcVkFu1bx27qIfIaUZbu/FXp1Jjww3L1mE/gYOId0L3OugGae5Y5+mc22eTZUa/6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCMplPqy;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8A606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA8A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCMplPqy
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4910b863b84so44859f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811594; x=1794416394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3nBmuFFvpK9ZuJMVGhj4Fxmt/qwgnA7lrzzghhGHOis=;
        b=aCMplPqypvZ02Qbsm7VMD3bTNFEpqoSx1cyTAXBIt7KNVO+q2nAmW/IKy2PuDVXETR
         WHBjMbNP+1l3BOQE+u2M8lp5zAPtu7PPTazCS0uyJ+nO1RPAr+XWi9bxVx5lKiMH4ywd
         +Cl4vFbEHFnZywwCIRYqrtTYmdU3bnh3mCcDhDlo/sMJ/pzojDkG8mZuyBddOCPbEs1/
         B3cj95SagdKjtw5Jj59Uvg7guAwnSBRBknmG6MIYCZSgKK+HbdEsEBaxlK9kZqFlOIq4
         kY8I5lmO6Lasd2+R8YN3f6/WKzvP6Z2+bgKt+5y4k8aAkZZRNWr6BtFkMTL64VVzFi+q
         GOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811594; x=1794416394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nBmuFFvpK9ZuJMVGhj4Fxmt/qwgnA7lrzzghhGHOis=;
        b=Ak59OXoEwbwQL8rQFI6vP1AWPFtYDW+sgKJy6ALT6oKzyhKEKuR5dtrOuXRquqUZJY
         ycBssFbnMHy7dFJsM5hpCtvlkyEYl2ghZbJGed/Ji80eTHccNViC1ifeSyFuZJ23Xdtq
         lIkVq3a/6Zvohala3YdkfxuxzcOan6NbnmjFZSZqyfstsX2dhn4s5yc/TU0xyWtFWeAA
         mGOI8+vnzBQivwa/rns6nIOPqu3CC/8yG8V4nv/x66toef3BpxdjJaZz5M29nU3y5kDP
         PDVI52bH148Zupz1SGWqijnrdMyaRpMePSayf+aq1LYBfaYqEyF8gUB8b9FwQacp37Z7
         iVKA==
X-Forwarded-Encrypted: i=1; AKwUvBxmpSE5YF2qQu2gH3WpsCW97P4AsNnvo+crVD4ZC7ALp5yieqH3FuVrh1gXQkjj81F6U5NJZO4RSAQz4HI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fbnqApOML+/R6FwmrtScrmNRY0uZAxmFdQcMDL64JIZBrlYCC
	/vbuMe87v6nrMN8oL36dDcUYbbAZBnPBPBSckLtFxtdeoMS+UHAOEZanTWH+GcUz
X-Gm-Gg: AYBFou27NfCDkCAU/94a09Pnovf6dmtVqxywlTeeObfrr+4fPbQZp6xNIDpBTuNHiOi
	9eSsnoLHe0np8UAnfsBauXxhmX41FVCdg+wY9qq3lyIaVO90B97dga+nFtK5xuBZsj6Y+uPneav
	CMnAvaHa3u4JoQZrYXcZDnzqvYC8n36RTq/jh0afxNiY1XVbn3yXUM1C6K01krWh+H8ldY6k53Z
	oI/VMuH4cg/txZkwZQaGDb3sBEGVHZUyNG0DxJe6nxAREPGudaHUgTLnF7yB50siF8ZVyZ98zU7
	pii93fOmifJ0fE5uSRxQx6e5dw1VwnimTNSKc2CJoqaX06kJqkdnV4fi90bVH1gxJw0pcCXKhzz
	sMi4YCIlst0nDtd4fgKw6W+5yOwbQGGYub6f0PmFNTLeVabGcp79HA6J1ylt+P3kc8eCaOKkiBz
	bulvok8eyVUOVgPxtmTbsprrc9psUnjiNCBhzehrhDiczMYQBufKTID5UYM24BofBWIoG7/xFVr
	nPjXXneMekvo5U8YlVsEFNE3Et9fNyVmjuADzfK5uzKIvY1YViTKAjTBR+PdX0QbH78wKjbejl4
	MZPXyDc3Exc8+br4KwB+BnSInfgg4yXLZasQnoFIwFkmMDeG4CYLc8ne8ZD/ow==
X-Received: by 2002:a05:6000:4804:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-4911aa56dc1mr33104f8f.28.1793811593929;
        Wed, 04 Nov 2026 08:59:53 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm4769440f8f.49.2026.11.04.08.59.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 08:59:53 -0800 (PST)
Date: Wed, 4 Nov 2026 17:59:49 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>, Cheng Wen
 <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <20261104175949.71804650.michal.pecio@gmail.com>
In-Reply-To: <b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
	<20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
	<b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 10:02:48 -0500, Alan Stern wrote:
> On Wed, Nov 04, 2026 at 11:56:37AM +0800, YuanZhe Liu wrote:
> > The port suspend is a hub class SET_FEATURE(PORT_SUSPEND) sent from
> > userspace through usbfs, and the teardown is userspace releasing the
> > hub driver interface, which quiesces the hub and disconnects every
> > child under it.  Neither side takes a per-device reference, and the
> > usbfs control request is not serialized against the hub driver being
> > unbound.  That is also why xhci_bus_suspend() 100 ms after a disconnect
> > looks fine: this is a different entry into xhci_stop_device().
> > 
> > CLEAR_FEATURE(PORT_SUSPEND) is the resume direction: in
> > xhci_hub_control() it ends in xhci_ring_device(), so it cannot produce
> > this trace.  
> 
> > The patch makes xhci_stop_device() re-read xhci->devs[] and the "device
> > is going away" marker under xhci->lock, and give up with -ENODEV
> > instead of touching a device that xhci_free_dev() has already detached.
> > For that check to mean anything, xhci_free_dev() has to clear
> > virt_dev->udev under the same lock, which is the second hunk.
> > 
> > If you think the mutual exclusion belongs higher up instead - do not
> > let usbfs suspend a port while the hub is being unbound - I am happy to
> > work on that; from your message it sounds like you would prefer the fix
> > there.  
> 
> Don't know about Michal, but _I_ think the problem should be solved 
> higher up in the stack.

Perhaps in userspace? Or is it expected that root hubs (or other hubs)
receive random and conflicting requests through USBFS?

Do we know that the device whose port is being suspended has been
quiesced? Is its driver even aware of anything?

What I find more disturbing is the existing protection from this race
added by 88716a93766b - it looks like core was triggering this too.
I found this usb_disconnect() code suspicious:

        if (port_dev && test_and_clear_bit(port1, hub->child_usage_bits))
                pm_runtime_put(&port_dev->dev);

        msleep(150);		// my addition

        hub_free_dev(udev);	// this drops xHCI device state

        put_device(&udev->dev);

but it seems that even with the sleep, the bus only gets suspended
after put_device(). So IDK how that panic was possible in 2016.

> It sounds like the sort of race that could  affect any HCD, not just
> xhci-hcd.

xhci-hcd is affected because it tracks association between devices
and ports and accesses devices on port suspend. IDK if others do.

xhci-hcd shouldn't even need to do this, becaues it's pointless if
devices behind the port have already had their URBs unlinked. Case in
point, nobody noticed it's only done to the immediate child :)

I would have sent a patch to nuke xhci_stop_device() altogether, if
there weren't known cases where core leaves URBs on suspended ports.
That stuff should probably be fixed, it caused problems before.

I recall the main blocker being that core wants to setup wakeups in
the same call which puts ports to suspend, so it cannot reject ep0
URBs before doing this call.

Regards,
Michal
