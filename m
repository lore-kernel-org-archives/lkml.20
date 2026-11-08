Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794170193;
	b=dGES1QVI/77UXmvW9E1Pmk9OaNyFj4navYzTN1Hcmvb2T2rNtjUgdxgDuMSmqEbEE1L7
	 ZvwGSoC5QOv2yfpS9AaKkwWLB+0rPby+MOKJXpF2tLnwuEugcUm5RWz4/ItMr0ckI8mX/
	 gIPR3dfI5/Gn58RnY0zVyY5cBf3SX8P03tNpkD9QKKi4x8Y1ZpXU4FdxSuOdC5CeJIkMk
	 O+gY4sVAECDJsmQ88Lx+7NGSdOl4WTISz2RcHqnSE6L2iPVbfn2t01DBdhqywzbXPLPXM
	 04m3SwJk/NeYv5rB+j+7XcywEWOISS7IAXh5/PHDXHEDxNcTly2YboHBFW9CjK6xheA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bGHlSVXJvFtsr7C8iFEwh7HKPCCDzw5AHasDBh0mXPk=;
	b=Kj9HT39cJVTPTJWkOlGSi+AUdNfGGwT0k5BBXVSbQaMY+ofxwtzaLPzWfaE8czZGCbxV
	 pf0HNEVcEC3c4erJOVpyogpAKLM59RdAZI9ocF1zcprpIyVN3mMZFrOt6Lvstc4AX2peV
	 NCKvMziPdSYT1eAVVdu7ly7FXE/quPyWfdvjS/OeR4kpdwE0G66NTGoPlXumXh1ikTzn7
	 hu8GrBUjfeZKExxRMAaTiSoLgCvLlWeSQaOuy+5a5A3jjw5AVRR+AKNnr01rvlqRLMOf5
	 wH42YF4bQNhb76GuYTbAtsxIQYlqJTG14P+1UKxxy8Ge9LzAPiEF32J8NvjNomOuMWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=QHIx44vT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2301606A33C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2301606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=QHIx44vT
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b30cbfa628so2948067b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:36:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794170191; cv=none;
        d=google.com; s=arc-20260327;
        b=nX+OUhQrZQwU8CVml0A6G05oFLBKnC7L4VOuWcWg0WmY+USWFvnF4Ht6ta+uWoaLr+
         /AYjlPIWLJNCqGlYkIhwaYnOp5c9MWiXRJwAXvunuBoC3p1Uyht7sqIfRFyiketWncOr
         BAzhaGZbTXibEiHx6fKBpLjb1nvhozWKr1BeGVLQ8A7T42nv0ru1oZPE9ArSeKEILRrH
         lV3RpSi2+kHn5SGruXRgy4aLsF294fzHedyjBWrv4E0k5cRDtHqaeoc56iWGbynpOJF+
         5BMxFfg1neTGddFM7pH5g3OA1i0dh5baSBYV+cCrmqVx79VIpBumGAwKmm4jr+lvQTnD
         ZfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=bGHlSVXJvFtsr7C8iFEwh7HKPCCDzw5AHasDBh0mXPk=;
        fh=F6PpVW9VJDzGM/WdpnhTxXrzAwm6Dq72Vmy2dH94W4s=;
        b=nZBn9Y9yl1uFmCI+dBAMu+spBbj53pN7xWmG8cxA6SQlTlllD4JqjX6J3Bw0XxGwBX
         89MKUZX7lV3quc+wHgWzKxLM8OrbL6eDGzcLnD4V245LILhLtcc/oYeACOXVO7Nb86U6
         rtJ9cmMFjGf/mpBukxg+QnMz90JlOTUrUlZBMw0JfUQxXogl+nxgbdf3phX83uaUOpvx
         fYHmO75sTQh00cJS2U5tAw0upfy46GZVlFilBCH3fkWTVWX9gNVehgrBr5fDz8xBtzpc
         gNqkbRynLZA+LHrlzon3TSOF6YkL2vy8A/q5iAflAZbil6rhobv19bkz/mLpLrZMc4r6
         jqrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1794170191; x=1794774991; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGHlSVXJvFtsr7C8iFEwh7HKPCCDzw5AHasDBh0mXPk=;
        b=QHIx44vTTGZ+uBHe3DWJXMtzahv9gH7cvijmSp/FK9uI5t3FJ7zelq43/Zs8/BhD+p
         fFDbxk163KqwhgYKNwacR7muhidQEjAnMiOZy2ExzQWJY3KIjRYB26OvMotdPFlu5Rgj
         gzOzBpvkVbY+UOYNAfXN/pD+NClCqk2vTLFnFIHucQoDTlkBN8jrN5zy9w0U4S0RcbTl
         x28p6x34ij/cIlk/XQ5zJbYP3Zc1Rls1bO3vRnDUsp8vicHogN/DcakBYEjoDkB7rMVk
         OWwxTPCUsSOcNQUYr2gKmBipb+eXorQZBbFisTw3zVSEPCyOnL9X3zvpJ98RgaQg4WCc
         2maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170191; x=1794774991;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGHlSVXJvFtsr7C8iFEwh7HKPCCDzw5AHasDBh0mXPk=;
        b=CpKujUgw9jPkZ2SvmQ4XnahHzieIy40F+lHzAK83/P56hnW74cjAqoQNkkLI94NPeg
         o5zpUH6rJbgh4bEAoBP7o7fprUpwfLWLnAP/APqkhX55JvE7mNPpxDWkx7mvWcMncKo3
         AovepPhJm/2Rzc0R8QsVXBblpVkROo7mADkwnk/Ov+WM4xKNEZrs9bRkmqOK+NMzlpqC
         I+v3A6MxsFK7lB/o1IV98dt6huiTWi6ACw0xVrQruvrwXWj8MJdmM0z4t03vO4BK8MbK
         39SAbPb3sAJTwecq6BjWteH55lRZMmPF3s/ebgBF1XhoSvNJaxRfvn7/RKPUddgt6iQ0
         Hmxw==
X-Forwarded-Encrypted: i=1; AL+hErHJdjreUzeQvtccooTdBWlT8RSkO/5ad83AWX6bFE6/tD/oOr9MJZ+eUgsvOcjiV3PMWfcP5DD7FKZ/hW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f/0POLQQAdJ06jUtWIZl73jEKA2hlp2lcxLjh/jJrV5yrm6Am
	ANZOerjutNLp/bCA6eLKTl2xUHDADGwY8D/GaaBnQK4EApOqhEHQ2uQ5ZUQ2tu+XaT9LFsIixio
	DXvy37Cm5gbLGR8qhlIknXH5LkLzzvuOzpopizAYYug==
X-Gm-Gg: AYBFou1NQfkA1tiQviLYLzJHmEOIrNOrD6k3lAcQhEuUT5ay/tPmQMSND3ijBFX4x4/
	4spybP/e6+wiDzmNwdPCwrtDWl6VOeVgPhbH+MiUZKgu1WzczkcnSM0ndMMpaxD2pY/pM6XTuks
	k7Y/d1ZcpXpwYc8bLR+OwHUOO0mADu6acHh/61bbEVPJW+R+iugsVCSuYD3mwH/q2/yyq7CZXR5
	0Mfjm147hsBSiJmQuEmDpsjHN5pEnWwn4iWA7zdybwWSuGrr6vXKK51OguQH3on8YCp3ipBLkAd
	k/XbKMcwYr7mOrgsIU22YpGKkUdA4fF8bmb8Hvk+UxEBER1cDndItdMvLcmTWHsuKsQ/kutpniB
	FT6ABT9HboBEDt0FnOtxwEIosVpL0HJt89YU=
X-Received: by 2002:a05:690c:e3ed:b0:8a0:76e8:c738 with SMTP id
 00721157ae682-8b36c664b7dmr14481487b3.0.1794170191478; Sun, 08 Nov 2026
 12:36:31 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 8 Nov 2026 12:36:31 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
In-Reply-To: <20261105234628.GA1576767@bhelgaas>
References: <20261105234628.GA1576767@bhelgaas>
Date: Sun, 8 Nov 2026 12:36:30 -0800
X-Gm-Features: AclHuK8VpHQtQ_YEdNlD7LjRwRZk_EL9REn9QvIJRvz7bm5Twy4pr8DO17ZO5J8
Message-ID: <CAGQButvJXLyiK2eRvuRmx=rGxN1M334=7vsp1Whq3w0mpeV1yg@mail.gmail.com>
Subject: Re: [PATCH] PCI/ASPM: Add missing NULL check for link in sysfs
 show/store callbacks
To: helgaas@kernel.org
Cc: linux-pci@vger.kernel.org, zhaojinming@uniontech.com, lukas@wunner.de, 
	linux-kernel@vger.kernel.org, manivannan.sadhasivam@oss.qualcomm.com, 
	dsimic@manjaro.org, shawn.lin@rock-chips.com, kees@kernel.org, 
	krishna.chundru@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

> Your next message suggests that the device and upstream bridge are
> valid, so possibly bridge->link_state was NULL. I would instrument
> pcie_aspm_get_link() to verify that and add a dump_stack() in
> free_link_state().

Yes. The instrumentation shows bridge->link_state becoming NULL after
function-0 removal. Later lookups for surviving functions 0000:75:00.4
and 0000:75:00.6 still find upstream bridge 0000:00:08.1, but its
link_state is NULL.

This was on the ASUS TUF GAMING X870-PLUS WIFI, BIOS 1805, running
7.2.15-ogc1.1.fc45.aspm453.x86_64 (#453). It was built from Linux
7.2.15 plus the OpenGamingCollective downstream patch set and local
diagnostics. This is not a reproduction on unmodified upstream.

The diagnostic patch logs initialization, publication, visibility,
lookup and teardown, with dump_stack() in free_link_state(). It also
adds NULL checks returning -ENODEV to the ASPM and clock power-management
sysfs show/store callbacks so collection can continue. These checks
are diagnostic containment, not a proposed fix.

The trigger is a local systemd oneshot,
helix-gaming-disable-igpu.service. Its stated purpose is to keep the
iGPU display function out of Gamescope DRM enumeration. Its command is:

  /bin/sh -c 'if [ -e /sys/bus/pci/devices/0000:75:00.0/remove ]; then
echo 1 > /sys/bus/pci/devices/0000:75:00.0/remove; fi'

It targets function .0, not the bridge or siblings. In the same boot,
systemd retains ExecMainPID=2486, matching the shell PID in the stack.
Its recorded execution interval is 10.303980-10.348137 s monotonic;
the journal records exit-free at 10.308186 s, within that interval.
The dmesg timestamps in the separate excerpt below are left unchanged.

Stack excerpt from the dump_stack() in free_link_state():

  CPU: 1 UID: 0 PID: 2486 Comm: sh Not tainted
7.2.15-ogc1.1.fc45.aspm453.x86_64 #453 PREEMPT(lazy)
  dump_stack_lvl+0x5d/0x80
  pcie_aspm_exit_link_state.cold+0x5/0x14
  pci_remove_bus_device+0x10b/0x170
  pci_stop_and_remove_bus_device_locked+0x22/0x30
  remove_store+0x83/0xa0
  kernfs_fop_write_iter+0x178/0x200
  vfs_write+0x281/0x560
  ksys_write+0x7b/0x110

The matching vmlinux resolves the cold frame to free_link_state(),
inlined into pcie_aspm_exit_link_state().

Selected dmesg fields (abridged; attr= names the downstream device in
publish-link, free-link and clear-link records):

  [0.367481] seq=98 event=publish-link dev=0000:00:08.1
link_state=present attr=0000:75:00.0
  [0.367583] seq=159 event=visible dev=0000:75:00.4
bridge=0000:00:08.1 link_state=present attr=l0s_aspm arg=420
  [0.367609] seq=177 event=visible dev=0000:75:00.6
bridge=0000:00:08.1 link_state=present attr=l0s_aspm arg=420
  [10.307508] seq=191 event=exit-free dev=0000:75:00.0
bridge=0000:00:08.1 link_state=present
  [10.308089] seq=192 event=free-link dev=0000:00:08.1
link_state=present attr=0000:75:00.0
  [10.308728] seq=193 event=clear-link dev=0000:00:08.1
link_state=NULL attr=0000:75:00.0
  [10.896953] seq=194 event=get-bridge-link-null dev=0000:75:00.6
bridge=0000:00:08.1 link_state=NULL
  [10.896958] seq=195 event=show dev=0000:75:00.6 bridge=0000:00:08.1
link_state=NULL attr=l0s_aspm
  [10.896960] seq=196 event=show-result dev=0000:75:00.6
bridge=0000:00:08.1 link_state=NULL attr=l0s_aspm arg=-19
  [297.729199] seq=242 event=get-bridge-link-null dev=0000:75:00.4
bridge=0000:00:08.1 link_state=NULL
  [297.729204] seq=244 event=show-result dev=0000:75:00.4
bridge=0000:00:08.1 link_state=NULL attr=l0s_aspm arg=-19

arg=420 is mode 0644. l1_aspm was also exposed on .4 and .6 (seq 161
and 179); subsequent l1_aspm reads also reached the NULL lookup. The
-19 results above are produced by the added diagnostic guards. In
this source, the unguarded show path dereferences link without a check.

The trace shows publication for downstream .0, visibility with link
state present, then teardown and pointer clearing when .0 is removed.
Both siblings remain with reachable attributes. The first recorded
post-teardown NULL lookup on .6 is about 0.59 s after clear-link in
dmesg; .4 also reaches the NULL lookup at 297.729199 s.

This establishes teardown followed by NULL lookups. It does not
demonstrate a concurrent use-after-free or rule out other lifetime
issues. I have preserved the full logs, diagnostic patch, source
inputs, configuration and matching-vmlinux symbolization.

Thanks,
Louis


On Thu, 05 Nov 2026 17:46:28 -0600, Bjorn Helgaas <helgaas@kernel.org> wrote:
> [+cc other members of conversation at
> https://lore.kernel.org/all/20260727072915.3954329-1-zhaojinming@uniontech.com]
>
> On Wed, Nov 04, 2026 at 03:22:51PM -0800, Poulin, Louis wrote:
> > Hi,
> >
> > We observed a cold-boot crash in l0s_aspm_show() that appears to
> > contradict the assumption in this thread that the visibility check
> > always keeps readers out when the ASPM link is unavailable.
> >
> > This was on an ASUS TUF GAMING X870-PLUS WIFI, BIOS 1805, running
> > Bazzite's 7.2.15-ogc1.1.fc45.x86_64 kernel with InputPlumber 0.83.1.
> > The fault occurred about 10 seconds into a cold boot. An earlier boot
> > on the same system had the same fault address and symbol offset on
> > 7.2.9-ogc3.1.fc44.x86_64 with InputPlumber 0.83.0. Both observations
> > were on downstream kernels. The captured 7.2.15 kernel was tainted
> > O/E (out-of-tree and unsigned module).
> >
> > Relevant excerpt from 7.2.15:
> >
> >   BUG: kernel NULL pointer dereference, address: 0000000000000030
> >   Comm: inputplumber
> >   RIP: 0010:l0s_aspm_show+0x47/0x80
> >   RAX: 0000000000000000
> >   CR2: 0000000000000030
> >   Call Trace:
> >     dev_attr_show+0x1f/0x50
> >     sysfs_kf_seq_show+0xa8/0x110
> >     seq_read_iter+0x132/0x4c0
> >     vfs_read+0x34d/0x490
> >
> > The faulting instruction accesses offset 0x30 from the NULL register.
> > In the corresponding source, aspm_attr_show_common() dereferences the
> > result of pcie_aspm_get_link(). The read reached the callback even
> > though that lookup had no link to return. The kernel killed the
> > InputPlumber main thread and the service stopped answering
> > ObjectManager.GetManagedObjects. This blocked the boot-time controller
> > setup.
> >
> > We are building a diagnostic kernel that returns -ENODEV in that
> > specific read callback when the link is absent and logs the PCI device
> > and upstream bridge. The device and the reason its link state was
> > missing are still unknown. We have not reproduced the fault on an
> > unmodified upstream kernel.
> >
> > Would this trace justify a guard in the read callback, or is there a
> > preferred way to instrument link-state teardown and sysfs visibility
> > on this hardware? We can follow up with the device and bridge once
> > captured.
>
> I don't think we should add a guard in addition to
> aspm_ctrl_attrs_are_visible().
>
> pcie_aspm_get_link() must have returned non-NULL in
> aspm_ctrl_attrs_are_visible() for the sysfs file to be visible.
>
> If it later returned NULL in aspm_attr_show_common(), we must have a
> bug, like a lifetime issue or some kind of corruption.  Adding a guard
> would just hide the bug.
>
> Your next message suggests that the device and upstream bridge are
> valid, so possibly bridge->link_state was NULL.  I would instrument
> pcie_aspm_get_link() to verify that and add a dump_stack() in
> free_link_state().
>
> > Kernel source for the captured build
> > https://github.com/OpenGamingCollective/linux/blob/f6857d4bfd614b90302903490796ef376be0a67d/drivers/pci/pcie/aspm.c
> >
> > Thanks,
> > Louis
