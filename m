Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C757F390CB7;
	Tue,  1 Sep 2026 22:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788300480; cv=none; b=o3Gvu8tPJXO4VKLT5PTRaKpwxcJp1XaPGEscZZ2/0UpsBfFhz/y1r3fljhE6xVRGhndG6R5bdanRpv0EwFcpUjhKxRXZpuY9uL6mnoPfg6aZx/KClVDn7jpGeSOi5NhB6EK/ItFzCAjGZFgbgVf6HT+FwqFdV2WCdZ7nG6axpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788300480; c=relaxed/simple;
	bh=iS230YxR60m0KZnARzwoJEmq3M442kqYfn0rmrEblnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf6ScYwNO4YY72rlbvLgRexkmC5ZF276W+oS47tvkQyg/Ht5H3UUV64C2dCrN5h6UsG9gMcyaWbN8w2bXiAncjjEn7UZa6UeG4bnAN3TkqGYA5ZfOoGOH4EjpK+PF+1LSyq/f07GDshJbZVxgjLzwCfPDvea+xG7fpoVl5kffQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lR511LSQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lR511LSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847DF1F000E9;
	Tue,  1 Sep 2026 22:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788300477;
	bh=GxJ1J5o192Yi57FIwYJ2EOUQdRT6ypUFpputH/0IOeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lR511LSQVSe9EdXltrtmNkOFE/TMh95ryDURboDTyyanhfibv5hS+A1di+rF3X1HG
	 JfrrIa785v6+L5e1P4wKk/fmTkKXInKZVKRw/h0vjer88zu/anais1Y07FJ0S0GM/P
	 rpHWWumV/MtRG/vnK1eBWypCMFw1ophLkq7JoQ5gSrcloW8zuV7Ct/4jPbfS8Oe8mV
	 BLchSuVccGGoyOITjb6E0x0s1n9aPzj+q1LQKaxxu/8dIjG+AybLS+xTxIlY+ZYClZ
	 zDy3wktDaB9+AZBUH6CG1hXHaSnOakwod/5moyfam5y8da0P4JGw3Lo+0P8khW0eEg
	 IXj8HUadNw/bQ==
Date: Tue, 1 Sep 2026 15:07:56 -0700
From: Drew Fustini <fustini@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, d@gen8
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <apdMvKYegtdEWntp@gen8>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
 <20260831100216.reply.cp0613@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831100216.reply.cp0613@linux.alibaba.com>

On Mon, Aug 31, 2026 at 10:16:16AM +0800, Chen Pei wrote:
> Hi Drew,
> 
> Thanks for keeping this series alive. While testing v6 on a RISC-V
> platform with a CBQRI capacity controller (8 capacity blocks backing
> one L3, Ssqosid + CBQRI exposed via DT), I hit a problem that traces
> back to this patch; findings and a suggested fix below.

Thanks for testing the siers.

> Symptom
> -------
> With the series applied, the resctrl interface reports an empty
> capacity mask everywhere:
> 
>   # cat /sys/fs/resctrl/info/L3/cbm_mask
>   0
>   # cat /sys/fs/resctrl/schemata
>   L3:0=0
>   # cat /sys/fs/resctrl/size
>   L3:0=0
> 
> while the hardware reports NCBLKS=8 in the CC capabilities register
> (bits[23:8] of cc_capabilities, per CBQRI v1.0 §3.5), i.e. the
> expected values are cbm_mask=ff / L3:0=ff.
> 
> Root cause
> ----------
> cbqri_resctrl_control_init() fills cbm_len/shareable_bits/min_cbm_bits
> but never initializes res->default_ctrl, which therefore stays 0
> (static storage):
> 
> > +static int cbqri_resctrl_control_init(struct cbqri_cache *ctrl,
> > +				      struct rdt_resource *res)
> > +{
> > +	res->name = kasprintf(...);
> > +	res->cache.cbm_len = ctrl->cc.ncblks;
> > +	res->cache.shareable_bits = 0;
> > +	...

I think you may be looking at an older version. The function in this
patch is:

static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)

struct rdt_resource no longer has a default_ctrl member. Commit
dbc58f7eec40 ("x86/resctrl: Generate default_ctrl instead of sharing
it") removed it and derives the value instead.

The default seems to work okay in my testing. For example, with Qemu [1]:

 qemu-system-riscv64 \
      -M virt,aia=aplic-imsic \
      -nographic \
      -m 1G \
      -smp 8 \
      -kernel arch/riscv/boot/Image \
      -append "root=/dev/vda ro console=ttyS0 rootwait earlycon" \
      -drive if=none,file=rootfs.ext2,format=raw,id=hd0 \
      -device virtio-blk-device,drive=hd0 \
      -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=16,mmio_base=0x04820000

# cat /sys/fs/resctrl/info/L2/cbm_mask
ffff
# cat /sys/fs/resctrl/schemata
L2:0=ffff

I will send v7 today as I have now rebased on v7.3-rc1. It is already
available as a branch [2]. Please give that a try and let me know of any
problems.

Thanks,
Drew

[1] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-cache
[2] https://github.com/tt-fustini/linux/tree/cbqri-cache-alloc-dt
