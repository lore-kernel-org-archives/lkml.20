Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936810;
	b=z4hlLT/fV9TebhEsXVKTzZJWJTjaoj29SRp3NCTCa0/zmF17dqULJf5GhdM23uMCUQlp
	 FzrwCUTv0Ql7Xf4Aou6ChwCo60731NhUbOfZ4ZSAcY0QCAmSs4glhjdzgwqoGkNlHnlku
	 10xws1iaB8pWcZ0DjezMza+K9V1QQE7x58BZV8uMLkOI1PQS/Dp2h2g+4SUTftcvswyct
	 qFS8UC1U+1cF17KNxqDkRPqCkDFLdv19agNq6kj0/72q/EJo0MgjHPHYEinzoDjii8tTD
	 FdmL/GQqK6lbg+V1cZwFgHq42ryBUZ7T2S4qwtY3KkPCgMq71TFqhyJTKNBmTCHtPPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=cG/RevFyBwamCzEOUkqHEPh0sTKsf/ViK8cvhO4n35k=;
	b=tIJI1xoKgAtjd0hNumVz6m/dxxdKLOhPY0Ssf4Vektb62wjzMtNdvhqg+Te4HVf5HrQv
	 F2SPLjNJ+0xPDrmNnfV9XDqw3KqNOnC0PSs8m7cThMJoqKY+JUHldgsoojuUpMXfG3P95
	 eOvRpcC9WQKRr8PPA8mAiyL0IwK4Zl1PUT1/HlkAa9ypQJh+sZ6EyeZeN2wKw6deRAr7Q
	 PiM+Jbs9f4dsZOJRQZYXuWV7sSmkHYA1VxhI87k00X+PYuIeQoiCNsfM7ftanhWVS/gIg
	 +yEd01Cs0Zl2yvwxWDnqQr90CGYCGl4SlIiYk6/t/W6hYe8BU3ZyPNyKFQfzTraU1UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHha2wyV;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66876606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66876606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHha2wyV
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b24f4b15c4so364417c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936809; x=1795541609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cG/RevFyBwamCzEOUkqHEPh0sTKsf/ViK8cvhO4n35k=;
        b=YHha2wyV73dtE15bna9bxCHEoUbBcd/518uwN4YYpygD53J+F/ONaC2aL5BBG/OvMT
         XCj2IHM/aFG2s2N3HhXAX3orMtuVa6h+seF6SAJglJ4Or9dun76aYPF+XSrkCxN+bPf3
         Kp8VYF4JRLwZRpiKma2LVY/eBlVKISVAfoUOyHo1Yr2PYPWUU431jSyP+qu7PvvFFJ6j
         O7Tpg9wxKQhm+J6D9dzJcHcPZ19nHfsy5ALP4GhRAMCBKpfeGlAJL64sYOqhCVHp92Dk
         d8jndELlmvz3ooiZpWlOvPyFMVMNVphKB5CbYnrVLQJBFUirxse5LCePdcMDSeEEfq++
         xk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936809; x=1795541609;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG/RevFyBwamCzEOUkqHEPh0sTKsf/ViK8cvhO4n35k=;
        b=csgRuBxaUjOlH+2ipjXS3LCVQHIWCpXYKv5PMiAiiVkS9+FQmnfPZ71m8xw6nnUxOm
         YtOgWpbftnY67e6jIsERoO7NKpY8KOjAPKWSShoT39XEMBuct9SYn/Suaww2IZczGYM7
         +n0uOnHIirQplmjMLoYkhrS75QXwj+tBMVqdUCuButK3PsjhvMBKiBPd6qUSHsT5Zgmv
         aWzdx/LYB6DGEv9QUs95myXa48835U1u5b7Y4t8f812gTjFZtJUKrE3v2bCAN7XA3OoD
         h7o2O6BpFUKXSnNanWb7L8iNFjS6LRTE8WIW98bPSY/slQDco1hsRGV9WN899OGBT22z
         /34w==
X-Forwarded-Encrypted: i=1; AL+hErH7oSVLozwjZEy89D+6ZHwEIxihRD0cuxYBoP+QQye5W0aOad5J4DNJonKcfxWjqOKghP/3yh/V0kG1hMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vpt7bo8igHuC8b68UZZGIuwyY+qRVz1zHxg6qk3fZRzchUj7r
	5m60olHSiEmb0igSJD9vkCCIeMMN2xL32SUZMS9VpJrrW84oFiRb05mZ
X-Gm-Gg: AYBFou0hU53sWj7MLpBXbkKXx8DTHDwLwnrJZrYKZXR2jptkZMt89+PGlN1KTFC4suI
	SGTsGUGylL968hoVDMf14rblDnVuG0GJB/FNPyx3uZ/taFg5Bje0L9UQ8vHrT+YNKXhCnY6MONb
	0C+9u5HXtboOgOVbnQJiosTz/H2Hp1bLIO+5yI6RZ7Uk+mSkXD0k09VYt59lvXvWR/iclM5xuzQ
	OVC8UTCiFtR9MKd2cpbK6UhliIKQogRavrPBHFlxRs1cRiscfXeO60o7Haz7r1ZhFJlyX6tyGWS
	Lbglr5FRbNi3PagPEZzLBtxOb4Q4aOWyg1z89IGANEdsczc4UQorzLHmHOZSZYqQQMp2RmBbEAL
	C5p9aFJa1EI30Gpc/apt6WyNpuuZEfjQyj/2WWA6tDo7oiuqdGqGm+ZYH1PugVL2xk3ZU96CLKO
	4pQoYTN5//qCaEylQPULWPenaz4WGwqxt5FrSJP4Zib3nnYtq6y3P0uGFuIYLhBM1MyHtSUpuHN
	vYQz4LLZAUtX9WzVvMhBhJRA8W7ioWvtbVkecKCOMS79ODMfe5k6KK/gzJLbmEgB9Y3rsEIk9Wh
	Yo9PdJhHeJvompfnGmc+m7dE028=
X-Received: by 2002:a05:7022:408a:b0:19d:233:989d with SMTP id a92af1059eb24-1b543bdb320mr248657c88.14.1794936809265;
        Tue, 17 Nov 2026 09:33:29 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm46314627c88.14.2026.11.17.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:28 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCHv2 1/3] powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
In-Reply-To: <9a7963a6-0033-45ab-90d5-b1f580a4882c@kernel.org>
Date: Tue, 17 Nov 2026 22:45:05 +0530
Message-ID: <v75v752e.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com> <f75f2cf97f44375fd2c8820e0caeab703cdb371c.1794572365.git.ritesh.list@gmail.com> <9a7963a6-0033-45ab-90d5-b1f580a4882c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 13/11/2026 à 13:31, Ritesh Harjani (IBM) a écrit :
>> commit 2e83e2ce34ff ("arch, mm: promote DEBUG_WX to CHECK_WX"), made
>> CHECK_WX default STRICT_KERNEL_RWX.
>> 
>> Now on powerpc, when we boot with CONFIG_KPROBES=y and CONFIG_MODULES=n,
>> we can see the following warning splat at boot:
>> 
>>      powerpc/mm: Found insecure W+X mapping at address 000000002ea08992/0xc008000000000000
>>      WARNING: arch/powerpc/mm/ptdump/ptdump.c:194 at note_page+0x4dc/0x4fc, CPU#0: swapper/0/1
>>      NIP [c0000000000ac204] note_page+0x4dc/0x4fc
>>      LR [c0000000000ac200] note_page+0x4d8/0x4fc
>>      Call Trace:
>>       note_page+0x4d8/0x4fc (unreliable)
>>       ptdump_pte_entry+0x70/0x94
>>       walk_pte_range_inner+0x15c/0x260
>>       walk_pgd_range+0x6d8/0xd5c
>>       walk_page_range_debug+0xa4/0xf0
>>       ptdump_walk_pgd+0xec/0x304
>>       ptdump_check_wx+0xd8/0x154
>>       kernel_init+0x94/0x26c
>>       ret_from_kernel_user_thread+0x14/0x1c
>>      Checked W+X mappings: FAILED, 1 W+X pages found
>> 
>> This happens because CHECK_WX noted a writeable + executable mapping.
>> 
>> This happens because execmem_arch_setup(), checks for
>> struct_modules_rwx_enabled(), while kprobes depenency on modules was
>> earlier removed via commit:
>>      7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>> Since the insn slots are only written with patch_instruction(), which
>> does not need this mapping to be writable. This patch fixes it by
>> checking for strict_kernel_rwx_enabled() instead.
>> 
>> Fixes: 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/mm/mem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index b617b69452cd..77b63b52d8f2 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -388,7 +388,7 @@ static void prealloc_execmem_pgtable(void) { }
>>   
>>   struct execmem_info __init *execmem_arch_setup(void)
>>   {
>> -	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>> +	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>>   	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>
> Looking at this, I'd use PAGE_KERNEL_X instead of PAGE_KERNEL_EXEC.
>
> Then we could get rid of PAGE_KERNEL_EXEC completely for powerpc.
>

I think it's best if we keep the definition of PAGE_KERNEL_EXEC on
powerpc as PAGE_KERNEL_X, I think the core expects the arch to define
this, if not, then it defaults to PAGE_KERNEL e.g. see this:

include/linux/pgtable.h:
  #ifndef PAGE_KERNEL_EXEC
  # define PAGE_KERNEL_EXEC PAGE_KERNEL
  #endif

Also mm/execmem references PAGE_KERNEL_EXEC in __execmem_init().
Although it references only when execmem_arch_setup() is not defined by
the arch (which is not true for powerpc).


However, even though nothing breaks today, but later if there are other
users of PAGE_KERNEL_EXEC, then PAGE_KERNEL does not have X (execute) bit
enabled, so it might break in future. Plus looking at above, I believe
there is no harm in keeping it - since core expects the platform to
define it's own definition - due to all the other references it has.

Thoughts?

However, if you still think we should remove it (?) - then I feel let's
do that as a separate cleanup patch. Since this keeps the usage of EXEC
same between prot and kprobes_prot variables in patch-1, which we also
need to backport.


Thanks for the quick reviews!

-ritesh
