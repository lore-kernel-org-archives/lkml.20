Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9D48B383
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532851; cv=none; b=o3smgc/FFfaIkzED5b9LSxcpEsh8G5f0sVtK0D46e2j/O0+CqWqmoYBs6EafDgtjpqtxRRsXcdPouoONCdQT/sZ7jASmFyZyTD4COvZ5kVXKb9H167pkczvxExqok+wrxh3svtX/apQs93IYmX5Uk261Wi5sxaQKHgbeovlZbCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532851; c=relaxed/simple;
	bh=ClyWHXU8KJi/DnD7JIJVECbd6x3OligU/h29ocOLmt8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDCtq4KhAoCwef37Ctucx9+9gJQsjoh1WamgcCWXpaGVjn+xgLXLD+llcUGodZpoh1o7RvMcqEI+bUfCcUEohwU2vSKR1VTeK2vX6S46W1Ci3adnupJeX+c2jXHi697M27CaVXxQLqz5LB5Ib3QWRgv1DatWkg9/lrAMYEIQbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG98O5Gy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG98O5Gy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so25456385e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791532845; x=1792137645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD3nWl07/+Qda8ppzD+w4eeR0FzIMSaHVdIPgbXU21Y=;
        b=dG98O5GymAmxCQultjiScikSIqtZu/Ep/JVQQCs3utZpsw/g5FDCDfcu6Q0JhWZLGA
         eHw3ZsGqGkrHna59G4sEnQetlRpgPD0+clKETlt+6kggptMLRapF4gG/oclu0bwXlfdm
         4gJCLSV1/O7vi33lPBAqNXmTT7/veSBlYuOG73hNh4iN47OkxR5zXFv0HJn8gDjWFrtd
         PTTx8nXM10vhNafIW9k4V3FFRZ2HjpVrmOnJ1//a056IBwSV6jfdLbm8ykLYxh3c+toB
         JjE+QuHlz1r4sxktNpztlEVPi9aNh/PDgHLuc9tVhn+nCbxsFSWDAcMtyVUJgZn0ejED
         JmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532845; x=1792137645;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD3nWl07/+Qda8ppzD+w4eeR0FzIMSaHVdIPgbXU21Y=;
        b=Ka+uK/VC2RWgGYqhhfsTkSIMXbLY7IIkNcRMIH/5xt0ANQmhfU9RQ5mwoLRWGtW1DQ
         wgyB+jgJJ5KX/2abyg3aTa4JdihAOsQmOjeMeCrKtDk+CmfyLEs+3oHUCkLvuI4hQbc5
         fPwJfGb2JoGVcvX78pnXJHj1erc+8Yknd4e2rlL1GxIKDrlYyCQYbhmd796ccVERBzAG
         arTSarPqiWAuz/taNGBKQf2Ec4Kyw6NHTkiswcHJXeAARymW/PxZlVJ0eZc6Qq+/uKIu
         SUmzEsZ63p/MTHnsTt/TfXEnx2pZ/RyZ4aQuQ6UQMApKK5aWVg4OKUPLypjrkTFORThk
         kTaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcUvZLcEIks+RGSP8ORHXMGZUMfBaLSOrdLBkAj/AQoij+fURiol1Y9rQb6kKoDJijWMrZ1YxOSrN274Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lEYBX23ZTOkyUyragfmQh2gGXzDBVlyCSuCJtmCfwvdJvNeu+B
	aikA7tBmB/O8ZV9YrRI9aETOKhciPVqpF1pge/yl4EEE26+FHCtuKP1i
X-Gm-Gg: AYBFou2M+8v+P3/nWkOkMq3iclqrQCRb8STTgDPQ7S1kxALe6vjSnoZJy69fUvDapUb
	9nrvyZfZsVS7d8ziJkHfYW+5bBr5ZxEBs1xEBYbZR8tSp+mk7sUGz3l3nMghtt7wjrYXJV8Q/bb
	oW/aFD0bSiVLDKM3AYhBoWARi9AQron+eRH2stl1JsVgjCDmoRlKn21Ovq5LaVDEnrsGLVAXQUN
	Wxa9sc7imPMEHDuGpk3jJ7hcCUoKIJ1rQhBzJgEVOQBNmO3n7DVFCTDlX7B47x1wX7j3UEeNDtB
	w/sgHfsO7+e6qDGwjrYjlZEoVuVi9bW+hnWlz2G1nslnaiXQ/ylLb1BO02UEJLHPmDOLxICOvcm
	8EKUCLJtqX7zlUMHNKkvB4UDLzWnCGWL4x6+QiiSThOiZWHBra1w8pvGph8Y4eEqqaMfPHdyvQS
	gDzeRpZ+XwUaukXhCoF2IR7FQwZY3a1TsDQaUjgqhYIiGRimZOnCR2EbUJAtr5we2VUp70LP/tt
	GbwdQwM6N2+mzPf6Xn6IHn0ILsjlSE+l44=
X-Received: by 2002:a05:600c:19c8:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a18e47ad49mr20060925e9.9.1791532844985;
        Fri, 09 Oct 2026 01:00:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm38979805e9.6.2026.10.09.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:00:43 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:00:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, Rik van Riel
 <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org,
 Mike Rapoport <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
 luizcap@redhat.com, pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>,
 Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261009090042.39ba9c06@pumpkin>
In-Reply-To: <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
References: <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
	<ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
	<ar9yRqq6cBxHDWKA@gremlin>
	<ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
	<asAE3kLFDUx5v0Nw@gremlin>
	<asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
	<bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
	<20261005132113.43548696@pumpkin>
	<asP5xK4axiUk7jun@pcnci.linuxbox.cz>
	<aseMsMGpGPT/G548@pcnci.linuxbox.cz>
	<20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 Oct 2026 11:23:56 -0700
Borislav Petkov <bp@alien8.de> wrote:

> On Thu, Oct 08, 2026 at 02:29:36PM +0200, Nikola Ciprich wrote:
> > [11402.940943] BUG: unable to handle page fault for address: ffffffff0c93001c
> > [11402.942273] #PF: supervisor read access in kernel mode
> > [11402.943629] #PF: error_code(0x0000) - not-present page
> > [11402.945025] PGD 6d6f83a067 P4D 6d6f83b067 PUD 0
> > [11402.946469] Oops: Oops: 0000 [#1] SMP NOPTI
> > [11402.947950] CPU: 23 UID: 0 PID: 704950 Comm: servercare-moni Kdump: loaded Tainted: G            E       6.18.55lb9.01 #1 PREEMPT(voluntary)
> > [11402.951254] Tainted: [E]=UNSIGNED_MODULE
> > [11402.952913] Hardware name: ASUSTeK COMPUTER INC. RS720A-E12-RS12/K14PP-D24 Series, BIOS 1201 08/25/2023
> > [11402.956569] RIP: 0010:__d_lookup_rcu+0x4d/0xe0
> > [11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 89 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08  
> 
> What is that kernel?
> 
> 6.18.55lb9.01
> 
> The other machine has a 6.18.20lb9.03-something one.
> 
> How can I look at the vmlinux you're running and the sources?
> 
> rIP points to:
> 
> [11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 89 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08
> All code
> ========
>    0:   48 8d 04 c2             lea    (%rdx,%rax,8),%rax
>    4:   f6 07 02                testb  $0x2,(%rdi)
>    7:   0f 85 a0 00 00 00       jne    0xad
>    d:   48 8b 10                mov    (%rax),%rdx
>   10:   48 89 d0                mov    %rdx,%rax
>   13:   48 83 e0 fe             and    $0xfffffffffffffffe,%rax
>   17:   48 83 fa 01             cmp    $0x1,%rdx
>   1b:   77 0d                   ja     0x2a
>   1d:   e9 80 00 00 00          jmp    0xa2

That looks like the same hlist loop top as in the other failure.
IIRC the fault has the error address in both %rax and %rdx which
means the invalid value cane from the top of the hash list, not
from following the linked list.

>   22:   48 8b 00                mov    (%rax),%rax
>   25:   48 85 c0                test   %rax,%rax
>   28:   74 78                   je     0xa2
>   2a:*  44 8b 58 fc             mov    -0x4(%rax),%r11d         <-- trapping instruction
>   2e:   48 39 78 10             cmp    %rdi,0x10(%rax)

That is the hash compare instruction (that fails in the other function).
Not sure why it reads offset -4 first though - the compiler will have
reordered it from after a condition (just to slow the code down!).
I'd guess there is a container_of() lurking.

David

>   32:   75 ee                   jne    0x22
>   34:   48                      rex.W
>   35:   83                      .byte 0x83
>   36:   78 08                   js     0x40
> 
> I need to be able to pinpoint it back to the source.
> 
> I asked the last time:
> 
> "Just to rule out any other issues which got fixed in the meantime, can you try
> mainline Linux and see if you can reproduce your observation with it?
> 
> If so, you could share your crash core along with debug kernels yadda yadda so
> that I can poke at it.
> 
> And before you do, make sure you have the latest BIOS and microcode installed on
> that machine.
> 
> Also, where can I find full dmesg and /proc/cpuinfo from those machines which
> trigger this?"
> 
> But still nothing.
> 
> Imagine this issue has been fixed upstream but you don't have the fix in your
> kernels and we're basically chasing the same thing again...
> 
> Sorry, but I have lost my debugging crystal ball which can help me guess what
> the machine does. :\
> 
> > so we now know this didn't fixed it. however I didn't have tlbi=ipi set, so I'll
> > now try this.  
> 
> That won't help either but if you wanna try it.
> 
> > any ideas on this new info?  
> 
> Yes, see above.
> 
> Bottomline is: without sufficient debugging data and up-to-date hardware,
> there's not a lot I can do.
> 
> Thx.
> 

