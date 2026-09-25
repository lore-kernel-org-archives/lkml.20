Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6336E5013BC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790380005; cv=none; b=WvX9JX3+XLE69DVA4PMHrqLJQ3ah7b9sbzr8ObgSmYjuX7L3kpaoXbxv5side6nJLu9vyM7uc2B/NlIP3Bgtu4cPvr0EsI4QIqvhDne9ioSzWJ+V6VlCY9LAe6NPmgqrvKr+FWHkuqvWscvPZd1jdqFGE4BrrSoa5L5tMB5y7ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790380005; c=relaxed/simple;
	bh=dXl/3a6rBVStBY7+bDBUUtgHqcBVvKmK0ThtNNs69zk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qnZYdA2Ic60J1Nn2JnTUeboQfwWorT1D3qpz0Ws2I1qTyLUSoqHUvJkXuEZB7DCi8kGXGUoWNFoy7Kjx7CkATe1elSx1JBGc49adDyeyVKDUoSDoQbnIIZ3WlflZbWEC4eD2uCpl8uz9p5QSZC5+1ELZzaSbg98ogG3l6zaBBtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+Nvr7Xf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+Nvr7Xf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428AB1F000FF;
	Fri, 25 Sep 2026 23:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790380002;
	bh=vxMcCs7n6HTqPEhkYEmyi+rSro0fFNKi9/FAkeoxwwE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=a+Nvr7Xfh88c3BgaGQ8/YQVhpV4/pJK73Nw5qE0yy1TQTw9cbGb0LQaHgZ2TWL3oq
	 MSzPcT4cTel//AJ/OT4cTTUyR/Zobf9vTwmj41ge3JxVwlTlB+A6HeqhlLscwsTu03
	 LRyTzf1B64cNlrekNoYGEmVx2tPp6EwkpFpCvHt3y5VoT5cKUa+H2p8u5UyMgNXTP3
	 RNfp8mQLTRLs+ItsowUdFfG1ouPr2H/0++icaduDL+5+QvlfInOljEV8+mMIYcSUzA
	 WoTBnXigHZZ5I5Xs29sqzamF/Tuuzq/6i+zZx//hkWEOEKru4qehmru/hNQYEseftX
	 Ku7MXBCc0DcGQ==
Date: Fri, 25 Sep 2026 17:46:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: sun.wenhan@zte.com.cn
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    liu.qingtao2@zte.com.cn, lv.yating@zte.com.cn, guo.chang2@zte.com.cn, 
    deng.weixian@zte.com.cn, hu.yuye@zte.com.cn
Subject: =?ISO-8859-15?Q?Re=3A_=A0=5BPATCH=5D_riscv=3A_align_pcie_bus_?=
 =?ISO-8859-15?Q?assign_logic_with_ARM64?=
In-Reply-To: <202609220934.68M9Y2eC015972@mse-db.zte.com.cn>
Message-ID: <c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org>
References: <202609220934.68M9Y2eC015972@mse-db.zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi

On Tue, 22 Sep 2026, sun.wenhan@zte.com.cn wrote:

> RISC-V currently relies on the asm-generic default of
> pcibios_assign_all_busses() returning 1, so the kernel always
> re-assigns all PCI bus numbers and ignores the bus numbers already
> set up by the firmware. This has two downsides:
> 
> 1. As UEFI 2.8 has brought mature firmware support to RISC-V servers,
> the OS can trust and inherit the PCI bus enumeration done by the
> BIOS, skipping a redundant re-enumeration at boot and improving
> the boot time.
> 
> 2. The unconditional re-assignment causes bus numbering conflicts
> during PCI rescan. When a root port that is not the last one in
> the hierarchy is removed and the bus is rescanned, the kernel
> fails with:
> 
> pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
> [bus 00-ff] (conflicts with (null) [bus 02])
> 
> as reported for the same generic code in commit bd8cbe66c01d
> ("PCI: Make PCI bus renumbering configurable to avoid rescan
> conflicts").
> 
> Define pcibios_assign_all_busses() the same way as ARM64,
> so that RISC-V also preserves the bus numbers assigned by the
> firmware by default instead of always re-assigning them. This keeps
> RISC-V consistent with the other major architectures.
> 
> Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>

This patch doesn't apply -- see 
https://gist.github.com/linux-riscv-bot/4f238956cd137e576af24c32c44d3437
-- and the commit ID mentioned in the patch description doesn't appear to 
exist in mainline.  Can you please fix these issues and resend?

thanks,


- Paul
