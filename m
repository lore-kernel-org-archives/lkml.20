Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519969;
	b=FbfDeNWvawTMscmZJe/hZnyG1uzYMPPzAlAxS5XhhJT5aHDu2iu01rFFMNjIbTLMXqJd
	 /mzS9tYX73IXq8DEGaiLfznW5EM5ukzo+Ti8Nj3jLCt7RRH2dzTBezaantgMVa9QVINJy
	 NRfhvJ8L5HbbwNe/kgeIcL3u1g/0OPHyZU/677yyk1V/H7enPx0/2GaTcA7kVj1RPueSj
	 NXfg5IqVReHmnOB0ceARKH94rv2duXSOEeQlnarfZgOA2gTLzIXr17bjHkADJHLpt9RSO
	 16k19KRQ3k7cW5xevOn6020lOa5LDKzEyRyemUvjivKhjuRZi6QUOayu+0bXFmUG86w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qenYjG5mt9fPFRbcX7YRK2j702l/rOsKUT6kX7XAM80=;
	b=UEZmlSXUKoN7CSL6gkB+MR6x4bGDjYXc/s//0xvwUwukeqtya5L1owZT3mOY5O+kh7uD
	 im+AUPXCmA38Zx7FMRJQ/UBCtSjKqxLlZBr9NQIh6ZDbwVVZbGSZ6bjUzm7U9+cybZZ4+
	 bm/lyVC6q1oGWWJ0qiBEL7jOcqh+DLb5yx0Tm3Di2vb4bWqd6NqD0saAbB7+FWnLuoZuf
	 QYjWqn0K17gV5p5njXqJmVyevnd8FCC/blxpW8vM9cF1OcrcGsE7ZdEkeht5eoi3viAAB
	 LnMp7Z34rp2vCecXMwvMUr/rIJYFbmSq7X2mMiHb/fTYxuoqYMbT++z7f7Ju1PgLpPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouD1Uc4l;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF6606A337
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCF6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouD1Uc4l
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3467375e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519967; x=1795124767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qenYjG5mt9fPFRbcX7YRK2j702l/rOsKUT6kX7XAM80=;
        b=ouD1Uc4lIFlUSEMo4s7xC2AE9MJjzxmHVfocawYK/LuWFStVsVLxWqc5wbgAQwYQBe
         Z4N8CRonp6v0+5thQNdBjX9ecChPilxr2ccicaeyRvNR2TQKNIE6kB54AcQ8fDjdJ3QT
         w/U3Qf7fmbXGda6uCUaD3+UQwTUeLEPD9ph8yySaB0VnTyrY0U9dLVpBGdelY5E6+yyk
         lMbAQiC1QRh9s5OhckMkJXV3erCwz/5pivtMQWoDy6j/mvY8tr6Puvtotkx0ucgUbKoA
         cDwGBoWwUzlwtzLNeukD92DtenGFCdV48osAzoUkPle6ZskzEQbMF6dnk4n9zzWkzp88
         dgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519967; x=1795124767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qenYjG5mt9fPFRbcX7YRK2j702l/rOsKUT6kX7XAM80=;
        b=bBuuoSagMpU1lsuqidXtjApZTXSMnV7GKRCFWykFeuU1Kqs4Sea7tICQodNMVszuEB
         Yw91yN0MLBDXPuFhtj67SFXN+GR3bR3piz5tvSNVKaBVSkPi4FUXBPGnJZ82WQLkL4Gb
         3dSHbgUaw0SF2jxtrNlyamv5ozYVPZtXy1NK9gWswv0s4j9SkC4mAPSfjrnYIXpR9g71
         fK77CKbFgYwmSv61pSHQynjGJ2W2AmcS7Z6ZQP2zLBlNELjIw6OeZWybtnPahIJhkxUO
         GvxySZ5dTfxOaXuZrAALoax1Pt6w2he20z4vWUNT1tncOyVMZZ0p8OcnOaV9kqwF+tkE
         Q2Tw==
X-Forwarded-Encrypted: i=1; AL+hErE59o4cfvHynLrUiqfr99ffU+NkE9WZyIbr+vi0wyGkWn5mRHDLDmzySFqwGGkZq4B1XJjDbo6M5/RkbXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vfojnVz2ZGinm/Zi9XxuD5YvMdR7nZOWpobwPeveC+KyBg/uP
	JYG3SxmI+eskw1tLwtYBbG4Zvs9ylDjdprt7pjoDGAJ1A+Oma8teLg7paP89oeCF
X-Gm-Gg: AYBFou3SW49ggf/XcvzoMxZr3wfdDhuULTEPt8ADuxsPkikNsrXFSNSIKnA77V8A9Yr
	AGeLH9A+YOcKmTQRJlPe3pst1mgzoHPrkaHfJjU9KvpdxPZaBXcPakx8l8DqBSdtI7vZxXQFgUs
	G4Lo/qlU+yM006YbU3SIb/UCObTBliBKqlzB2Rno4qAKGwAavTlGg+8LQiqDD5Vl4dxTKQgLH0k
	DTalT72uxfcNPw7S1TmI2WtEF364YLFRKII6Kfb5PmyKjLX7ixwxNdUv7ewx5XIHM/tUG2Lo0AJ
	BCzQIxz46Zje62V4zB7Kprx4b8ejYk+0ged/f3Ycj7VpzK96bsXsIjoV0N46aBiFLlFOBBVL4C+
	wtFnK2CNjw/Zt6hTw7g1aItadOkyr7IYbcG1Rv2DB5iZqaXH31+5TeXej22pmFHj4o7CWE8/PDS
	jvyMW34oLV3a7m6saIgpsjtjqOqDmRH8R4HY6GXf7AA+qAfJblk44vcwdq7r7io5+JHn8TT/tH7
	ejG+Jkt5Od1RTk57i6Ehp8cnouLuEgSD5TU6OfWGtsDSzfAwp0tUXn/cSIziHF13m5BskWpB2F+
	pds05w/O4RAJpLNnJAKgBlhW9aI3sAO4iRFDzj6VJ8ampNEv/nStNMZR+cDE/iOU
X-Received: by 2002:a05:6000:1862:b0:493:c7aa:7cef with SMTP id ffacd0b85a97d-49c71e3db08mr1444327f8f.52.1794519967152;
        Thu, 12 Nov 2026 13:46:07 -0800 (PST)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm1334667f8f.35.2026.11.12.13.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:46:05 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id C657BDC012C; Thu, 12 Nov 2026 22:46:03 +0100 (CET)
Date: Thu, 12 Nov 2026 22:46:03 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] x86/mm/pat: don't warn about W^X violations before
 mark_rodata_ro()
Message-ID: <avYzmyX5eR814o5L@eldamar.lan>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-5-791adb8d6670@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-fixes-x86-v1-5-791adb8d6670@kernel.org>

Hi Mike,

On Thu, Nov 12, 2026 at 06:31:10PM +0200, Mike Rapoport (Microsoft) wrote:
> The kernel text is mapped RWX until mark_rodata_ro(), so W^X violations
> that verify_rwx() detects before that can be false positives.
> 
> CHECK_WX is enabled by default with STRICT_KERNEL_RWX and it reports
> mappings that remain W+X after mark_rodata_ro().
> 
> Drop the warning about W^X violations before mark_rodata_ro().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/mm/pat/set_memory.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index a1bea16a3c3bb..a674433850dc9 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -718,21 +718,15 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
>  	if (!rw || nx)
>  		return new;
>  
> -	end = start + npg * PAGE_SIZE - 1;
> -
>  	/*
> -	 * If the kernel text is still RWX, gently complain, this could be a
> -	 * false positive.
> -	 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
> -	 * the warning can be removed completely.
> +	 * The kernel text is RWX until mark_rodata_ro() and the entire kernel
> +	 * page table is verified after the text is protected, so there is no
> +	 * need to warn.
>  	 */
> -	if (!kernel_set_to_readonly) {
> -		pr_warn_once("CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> -		  (unsigned long long)pgprot_val(old),
> -		  (unsigned long long)pgprot_val(new),
> -		  start, end, pfn);
> +	if (!kernel_set_to_readonly)
>  		return new;
> -	}
> +
> +	end = start + npg * PAGE_SIZE - 1;
>  
>  	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
>  		  (unsigned long long)pgprot_val(old),
> 
> -- 
> 2.53.0

Does this need to carry a 

Fixes: ea6fd393cb9e ("x86/mm/pat: Use pr_warn() for early W^X warnings")

? 

On a system booted into 6.12.117 (from 6.12.116) I see:

[    1.091378] ------------[ cut here ]------------
[    1.092538] CPA detected W^X violation: 0000000000000121 -> 0000000000000123 range: 0xffffffffc0477000 - 0xffffffffc0477fff PFN 109c1f
[    1.093994] WARNING: CPU: 5 PID: 222 at arch/x86/mm/pat/set_memory.c:665 __change_page_attr_set_clr+0xf62/0xfb0
[    1.095730] Modules linked in:
[    1.097101] CPU: 5 UID: 0 PID: 222 Comm: (udev-worker) Not tainted 6.12.117+deb13-amd64 #1  Debian 6.12.117-1
[    1.098671] Hardware name: LENOVO 20XXS1FU00/20XXS1FU00, BIOS N32ETA2W (1.78 ) 07/23/2026
[    1.100096] RIP: 0010:__change_page_attr_set_clr+0xf62/0xfb0
[    1.101357] Code: 09 ea e9 19 fa ff ff 48 8b 4c 24 10 49 89 d9 4c 89 d6 48 89 54 24 08 48 c7 c7 38 43 95 a6 c6 05 d1 fd d7 01 01 e8 9e 76 01 00 <0f> 0b 48 8b 54 24 08 e9 22 fc ff ff 80 3d ba fd d7 01 00 0f 85 15
[    1.102928] RSP: 0018:ffffd02d40557648 EFLAGS: 00010286
[    1.104241] RAX: 0000000000000000 RBX: 0000000000109c1f RCX: 0000000000000003
[    1.105561] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
[    1.107204] RBP: 0000000109c1f121 R08: 0000000000000000 R09: ffffd02d405574c8
[    1.108503] R10: ffffffffa70b43a8 R11: 0000000000000003 R12: 0000000000000001
[    1.109816] R13: 0000000109c1f121 R14: 0000000000000001 R15: ffffffffc0477000
[    1.111556] FS:  00007fcf08a6b980(0000) GS:ffff88c4bf680000(0000) knlGS:0000000000000000
[    1.112888] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.114279] CR2: 000055cf7979a138 CR3: 000000014061e006 CR4: 0000000000f70ef0
[    1.115600] PKRU: 55555554
[    1.116935] Call Trace:
[    1.118345]  <TASK>
[    1.119677]  ? __purge_vmap_area_lazy+0x13c/0x320
[    1.120979]  ? _vm_unmap_aliases+0x217/0x260
[    1.122392]  change_page_attr_set_clr+0x104/0x1a0
[    1.123702]  set_memory_rw+0x28/0x40
[    1.125019]  apply_retpolines+0x19c/0x4c0
[    1.126404]  module_finalize+0x209/0x3e0
[    1.127690]  ? add_kallsyms+0x293/0x310
[    1.128985]  load_module+0x17f1/0x1e90
[    1.130318]  ? init_module_from_file+0x89/0xe0
[    1.131586]  init_module_from_file+0x89/0xe0
[    1.132873]  idempotent_init_module+0x11e/0x310
[    1.134175]  __x64_sys_finit_module+0x5e/0xb0
[    1.135433]  do_syscall_64+0x87/0x1b0
[    1.136706]  ? vfs_read+0x24d/0x370
[    1.137967]  ? __x64_sys_pread64+0x98/0xd0
[    1.139652]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
[    1.140905]  ? syscall_exit_to_user_mode+0x37/0x1b0
[    1.142172]  ? do_syscall_64+0x93/0x1b0
[    1.143402]  ? __count_memcg_events+0x53/0xf0
[    1.144644]  ? count_memcg_events.constprop.0+0x1a/0x30
[    1.145859]  ? handle_mm_fault+0x1bb/0x2c0
[    1.147452]  ? do_user_addr_fault+0x367/0x650
[    1.148626]  ? clear_bhb_loop+0x70/0xc0
[    1.149809]  ? clear_bhb_loop+0x70/0xc0
[    1.151303]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    1.152445] RIP: 0033:0x7fcf095cf4f9
[    1.153586] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e7 68 0d 00 f7 d8 64 89 01 48
[    1.155067] RSP: 002b:00007fffd10634a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    1.156238] RAX: ffffffffffffffda RBX: 000055cf79783110 RCX: 00007fcf095cf4f9
[    1.157419] RDX: 0000000000000004 RSI: 00007fcf07cf944d RDI: 0000000000000010
[    1.158766] RBP: 0000000000000004 R08: 0000000000000000 R09: 000055cf79763ba0
[    1.159927] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fcf07cf944d
[    1.161090] R13: 0000000000020000 R14: 000055cf79784bc0 R15: 0000000000000000
[    1.162318]  </TASK>
[    1.163460] ---[ end trace 0000000000000000 ]---

ea6fd393cb9e ("x86/mm/pat: Use pr_warn() for early W^X warnings") from
7.4-rc1 was backported to 7.3.4, 6.18.63 and 6.12.117.

And Nathan reported it here, which is marked in the Closes field:
https://lore.kernel.org/all/20260905044253.GA3816371@ax162 . The fixes
tags would allow to make it pick us as well for the respective stable
series were needed?

Regards,
Salvatore
