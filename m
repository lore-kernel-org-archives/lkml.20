Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC4281503
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789802511; cv=none; b=YvM2X8m+TIJfRPYWkQWVhBFo+yRsQow5VAi0yqZV34qLkIi301ZVXP6ik0F/xNiBSb/qSD0waSRKJwikR2URz7OICnTpT3b5NaSvArTMtF7bU+nwNw+m7DpzHj5AtCbm1J1iJkm+kD9L4Lrkg9UbJ4OtnGgOqg6EePFMj5GNpQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789802511; c=relaxed/simple;
	bh=ji22rS31Wtsj6DidSjKjGSzzURIi+KmCray6A2YY64U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB5AmkuaYMVJJn/1STYoGs0ghnaAu9vUi2TpzfNd2coTQK7Pj4PqgNbYFAMljF76f8BDwJzOZRCYHc2xiBB7CO2Lzr68MnSFeWRgiRZlJ6X5lJHizwMbDXvt8XxVhDSGcLSwkLfP9WYdFyWH86Kr+PAB4stU9WqPva15cJpcovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCiTW36p; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCiTW36p"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so520620b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789802509; x=1790407309; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ji22rS31Wtsj6DidSjKjGSzzURIi+KmCray6A2YY64U=;
        b=LCiTW36plUjchw0gpgphKVmgp7jbg9VS+gHTtqmHh/JtFTWoo7/Q6RPEmnAW3l+bkm
         /aUmS+Xuxdcthkj1s6o36LWsLFetX+xL/NdMr8+V5+6ft9eIgGMI6X2R0+bHiOVq3FxS
         JmFvISjto99fU8aK8ar6GSgtplh9VvTB0Pxus8wSZbjd6i8WDyLU1j1TpsaD8hciL0j9
         BYUUi1OXHUT6tZqVc8gbgtjM0NwtSM0jctaWVXMEebl7praNsqCi86PRe/ciiBJCrqc/
         6FKcfFEH4ShpFoBvIlvIbsGKJdVNV/3VhR7hUBrZD/O0We80F5Wn+uyibZbOnKMX1Ecr
         opyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789802509; x=1790407309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ji22rS31Wtsj6DidSjKjGSzzURIi+KmCray6A2YY64U=;
        b=V8EkuMQVWbLmE9U5EBAmAXxPkBlOxl/f7IztrQrxBmVvQ4rxPA8ZK5K9PjpE7DeJue
         ZeDICmhx8TKN7tTduHdgQWjh7pDTMFDxbgz/EmY+DovXth0X7CCILFek07Wk/3iBN3/l
         arp+nJPuUuDkOeNkSjmWi742jfjBJwy+M3nDty3NOVZIayuwTL96CT5BVQSe97CZwQPo
         IqkUNF5Lgo0dU3PmYIFiE2J6POft2gRp2t/K+JKIjIPMP1QWa4afbcdcLvKCSK4kniig
         GB74s3AGuhm/G+bFbi3WuMPlS4IGnn+z0YLv23WIC5K6s0XW21IqFNhADKKMf/LVubln
         kF/Q==
X-Forwarded-Encrypted: i=1; AKwUvByhnM49zmYsnYscQinN8TY03R3s1PkXQqnipI/yQ+RCSK6hDRkj35MeRbuq8NkkxJD0+EGh0VKhk/vHi+A=@vger.kernel.org
X-Gm-Message-State: AFuF++lOI9HEa1bHpkUh+9Qw9HhoDxQhAaXG2nGtUF01+W1UziP33jrV
	N94tS7m4lbFlfa438tXtGcztwPY/w3fRqra9LWZFC5p4JnmNoqt2QPWH
X-Gm-Gg: AYBFou3/P3Y87Y121EqfUzhXuKaJnr5WyyquRNc+L4enTWp15CbclX5F7wMYgx+I0V1
	wdqFwXo1HxUMNCA6qpg7G03lI3TIVNMSoP2AKmV8oPBycZv2XDaLM02NKpVxhZ9bI8ttj1m+50E
	hpIxOcP7TEGiAfbrhk0u36/jb8viDMN7YxqnTRq44QLswjveAMRb/I9QOLzEcIRRrtqwJ19ZQcn
	/O5eLvgalYfDMhu94RpO4fC4VYAFjg134IWSarcg6GA9Fh/YZvtGYFheu9aU1tXGzsUIcCVbFUm
	Fk0pgNsgI46Lu/HO4sGHQ0viyve89o4Lbxaav/Nuw+7DS0OVOC8ZFVAeDDaBQ0/dDcOYrCDcWcW
	3dXf+qm+U7hZHYPok0CbTnA9qVRInDOx0YUUirknuYu7VWjFThyQDDEbiS+WhwAihpgzvAUSxeN
	IW7sNiiPQCTjsx9vg4kRbHERNx5Bq/hzxPeaiGpCnpsNCGFqYoT5Yco6FM19XumowCjxrhGMrnl
	W3HG3lRY9IhUr8=
X-Received: by 2002:a05:6a00:b94:b0:874:705d:f636 with SMTP id d2e1a72fcca58-874d5e29565mr5203732b3a.16.1789802508998;
        Sat, 19 Sep 2026 00:21:48 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6ae905fsm742901b3a.3.2026.09.19.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:21:48 -0700 (PDT)
Date: Sat, 19 Sep 2026 15:21:41 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Ritesh Harjani <riteshh@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Liam.Howlett@oracle.com
Subject: Re: [linux-next20260917] BUG: Bad page map in process
Message-ID: <b9d78e0b-c301-4910-9b3c-3cace29cced8@gmail.com>
References: <d0d04df2-8d69-4155-81b1-3d3ea2fca14e@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0d04df2-8d69-4155-81b1-3d3ea2fca14e@linux.ibm.com>

On Fri, Sep 18, 2026 at 12:38:29PM +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!
>
> IBM CI has reported following boot warning on Power11 pseries machine
> running linux-next 7.3.0-rc3-next-20260917.
>
>
> Traces:
>
> [    4.944846] BUG: Bad page map in process rtas_errd pte:c00000001fff0786
> [    4.944850] pgd:8000000064e76009 p4d:8000000064e76009
> pud:8000000064013009 pmd:8000000064011009
> [    4.944858] addr:00003fffa9382000 vm_flags:080000fb
> anon_vma:0000000000000000 mapping:c0000000054443a0 index:1fff0
> [    4.944865] file:mem fault:0x0 mmap:0x0 mmap_prepare: mmap_mem_prepare
> read_folio:0x0
> [    4.944875] CPU: 17 UID: 0 PID: 773 Comm: rtas_errd Not tainted
> 7.3.0-rc3-next-20260917 #1 PREEMPT(lazy)
> [    4.944877] Hardware name: IBM,9080-HEX Power11 (architected) 0x820200
> 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [    4.944879] Call Trace:
> [    4.944879] [c00000001791b4e0] [c00000000135a92c]
> dump_stack_lvl+0x8c/0xf0 (unreliable)
> [    4.944885] [c00000001791b510] [c0000000006708c0]
> print_bad_page_map.part.0.constprop.0+0x18c/0x260
> [    4.944887] [c00000001791b5f0] [c000000000674fa4]
> vm_normal_page+0x140/0x17c
> [    4.944890] [c00000001791b630] [c00000000067648c]
> zap_present_ptes.constprop.0+0x9c/0x9ac
> [    4.944893] [c00000001791b700] [c000000000677038]
> zap_pte_range+0x29c/0x5f4
> [    4.944895] [c00000001791b840] [c000000000677500]
> zap_pmd_range.isra.0+0x170/0x310
> [    4.944898] [c00000001791b8d0] [c000000000677a00]
> __zap_vma_range+0x360/0x4cc
> [    4.944900] [c00000001791b980] [c0000000006780e0] unmap_vmas+0x98/0x1a0
> [    4.944903] [c00000001791ba10] [c0000000006b0f68] unmap_region+0x94/0x108
> [    4.944905] [c00000001791bad0] [c0000000006b1c7c]
> vms_complete_munmap_vmas+0x11c/0x2c8
> [    4.944907] [c00000001791bb60] [c0000000006b273c]
> do_vmi_align_munmap+0x1ac/0x1f8
> [    4.944909] [c00000001791bca0] [c0000000006b52c0] __vm_munmap+0xdc/0x1fc
> [    4.944911] [c00000001791bd60] [c00000000068b154] sys_munmap+0x28/0x3c
> [    4.944913] [c00000001791bd80] [c000000000032150]
> system_call_exception+0x190/0x4b0
> [    4.944916] [c00000001791be50] [c00000000000d05c]
> system_call_vectored_common+0x15c/0x2ec
> [    4.944919] ---- interrupt: 3000 at 0x3fffa9143754
> [    4.944920] NIP:  00003fffa9143754 LR: 00003fffa9143754 CTR:
> 0000000000000000
> [    4.944922] REGS: c00000001791be80 TRAP: 3000   Not tainted
> (7.3.0-rc3-next-20260917)
> [    4.944923] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> 
> CR: 44002408  XER: 00000000
> [    4.944928] IRQMASK: 0
> [    4.944928] GPR00: 000000000000005b 00003fffc0a69a20 00003fffa9237d00
> 00003fffa9382000
> [    4.944928] GPR04: 0000000000001000 0000000000000002 0000000000000000
> 0000000000000001
> [    4.944928] GPR08: 000000000000001b 0000000000000000 0000000000000000
> 0000000000000000
> [    4.944928] GPR12: 0000000000000000 00003fffa937f860 0000000000000000
> 00003fffa9383550
> [    4.944928] GPR16: 0000000000000000 00003fffc0a69cd8 00003fffc0a69ca0
> 68746150706d7544
> [    4.944928] GPR20: 00003fffc0a69c10 0068746150706d75 636170614364656c
> 747365526f747541
> [    4.944928] GPR24: 000000013ad9e130 00003fffc0a6a0d8 6d726f6674616c50
> 00003fffa92f5ee0
> [    4.944928] GPR28: 00003fffa9382000 000000001fff0000 0000000000000009
> 0000000000100000
> [    4.944945] NIP [00003fffa9143754] 0x3fffa9143754
> [    4.944946] LR [00003fffa9143754] 0x3fffa9143754
> [    4.944947] ---- interrupt: 3000

Hi Venkat,

Thanks for reporting this bug. I also reproduced this phenomenon on my
local machine and found that Lorenzo[1] has already fixed the bug, and
Mike[2] also provided a detailed analysis.

[1] https://lore.kernel.org/linux-mm/aq06hcheI4OGi_3A@gremlin/
[2] https://lore.kernel.org/linux-mm/aquz9Z9JrK_H_E0g@kernel.org/

--
Cheers,
Vernon
