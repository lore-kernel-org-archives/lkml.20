Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634047DD76
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219413; cv=none; b=lYMerb3X9bP2feDmlh9n05/BXEUqT8EAp87bwmlo9og00OfD/nBIswq9W7RDgNXynZD/YFMUEdu208VsDG8r/azJAW90lpvQVNmbSDA8iuxSGDrUmYxKF0OCkFRnKPeAywjv+oGJIbxVshxYiB3ty4eTVp1EUMhpLSDrDChXUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219413; c=relaxed/simple;
	bh=eK0efl7gVPnlNTQgkT91yDXwUSJa2bFpZVKfGBPksIc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GPPDMNJCfajtZD4VU8rjGBBvVq6Q2LK6b0fxsrZPdwdV2mEPJciy6ThrPo66LjoVle2SfQWvp9t/NVOOlIboeCeNSMvM6SYIXQx8yKGLGFgIL5HI6RpGDHSbEGSH5aqJ0Ei0gIIkTxUkbEoAq16SKFhbUR7I1Pgor8QzbAfsXbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEKGslQ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEKGslQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF681F000FF;
	Mon,  5 Oct 2026 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219411;
	bh=VntT4RkPFOQ0dJ5Ht0LsaK5Uv30Dq1nWSggbDQYoUaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=iEKGslQ95+amOYKHJGOgxAgYFmHfRthoQ0afvbazzErDzUFLzICGr5Rx4IgRfonmI
	 Ag3lw5lvThEh+HdoqJdfQ9gbLLYC38dVxsw8MnisgsrYQlDjj7UkFscHsDkPAOsvhE
	 huxXPXd77Jp+kGS+OYybVP6KwbA1+kv+91euw3ElwAGpBc88xPwtijxD4TzXMoTyX1
	 J/QAFJfvXgZwjLUWA7RX2Usad1X6+UMVogfEfjccq2zYYcl4z1e0az97v4bldfRerT
	 NrKhkG9WXoF5cj8VMnLo7aAQNY+Wct2K2ks0LLjyncYmO1CM2I4OpkYRcrZvAVUr+A
	 lyYbVPbpHXBww==
Date: Mon, 5 Oct 2026 10:56:45 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: sun.wenhan@zte.com.cn
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    jianjun.wang@linux.alibaba.com, liu.qingtao2@zte.com.cn, 
    lv.yating@zte.com.cn, guo.chang2@zte.com.cn, deng.weixian@zte.com.cn, 
    hu.yuye@zte.com.cn
Subject: Re: [PATCH] riscv: align pcie bus assign logic with ARM64
In-Reply-To: <20260929173053186td0a5D4tn7cNBN-R8JyEp@zte.com.cn>
Message-ID: <fd6c0052-5592-45b0-809c-83ea2cf8af64@kernel.org>
References: 202609220934.68M9Y2eC015972@mse-db.zte.com.cn,c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org <20260929173053186td0a5D4tn7cNBN-R8JyEp@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

Thanks for updating the patch.  A few comments:

On Tue, 29 Sep 2026, sun.wenhan@zte.com.cn wrote:

> RISC-V currently relies on the asm-generic default of
> pcibios_assign_all_busses() returning 1, so the kernel always
> re-assigns all PCI bus numbers and ignores the bus numbers already
> set up by the firmware. This has two downsides.
> 
> As UEFI 2.8 has brought mature firmware support to RISC-V servers,
> the OS can trust and inherit the PCI bus enumeration done by the
> BIOS, skipping a redundant re-enumeration at boot and improving the
> boot time.
> 
> The unconditional re-assignment also causes bus numbering conflicts
> during PCI rescan. When a root port that is not the last one in the
> hierarchy is removed and the bus is rescanned, the kernel fails
> with:
> 
>     pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
>     [bus 00-ff] (conflicts with (null) [bus 02])
> 
> Define pcibios_assign_all_busses() the same way as ARM64, so that
> RISC-V also preserves the bus numbers assigned by the firmware by
> default instead of always re-assigning them. This keeps RISC-V
> consistent with the other major architectures.
> 
> Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>

- Please start your subject line with "[PATCH v2]" etc. when sending 
  updated versions of patches.  Please see
  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#subject-line

- Some tools break when the name in your E-mail is an E-mail address.  I 
  fixed this up to match the same in your Signed-off-by:, but please fix 
  this for future patches.

Queued for v7.4, thanks.


- Paul
