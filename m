Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E43C5848
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492594; cv=none; b=unIOjOPFanNEv8SLwLXcbbhxvzvIlrvM2GnTMHAEfegOKfc9pCTzOqmLbTuGqvUh8DRB6+eGAXs6eKPy57lmCK2F2zFuHApJ2ZahF4kKSyVLGPRbVQa7HkTP9rzSSssaYA6e2Dh73YVEPIiFFLJ7IGHiyClFR5rzDDkNXm1Zl+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492594; c=relaxed/simple;
	bh=vnAwbsiy8kdzzgPy8h0sv1zV5FVT9xJQhaSoR3X0k2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYWiDKr7W2H1e9nOGofeJQ45QumkHDDbfcPZddpRD+tMi0QHq8cH32cLQ2NAk4KNxVsH5wwYHxYrqHhug+LZ8PAX4WgVUL9aew+bkGQ2GuelSaS7dfFcIU+8tP+Ws/MJ0lxBNL2Zw3qmE09WZoGLmz5Fr/HYo2/XNSkqRq19YLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=1Kq06F/s; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="1Kq06F/s"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 698KmrLM388540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 8 Oct 2026 22:48:53 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 698KmrLM388540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1791492534;
	bh=Tgy7JHtkftQQHsCh5M1j6zKdCKO5xE0MW5AcTqqIuws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1Kq06F/sYFjFDtOZMno+svrWGCL0fiB10fmGoC6qn+v4OqtweiWK8jSX5B3A1BQ+F
	 j6E7mLfWVOpCSMXshzm2/JigXZwMgOhJu01Mnr8hamVBjCd8oSp09Eapc0rtZhma+1
	 1l7BE9P1x27IBAHakZt+SS4Vdq5qTYjuaO567n7o=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 698KmqCx013982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 8 Oct 2026 22:48:52 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 698Kmfxl2543877
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Oct 2026 22:48:48 +0200
Date: Thu, 8 Oct 2026 22:48:41 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Borislav Petkov <bp@alien8.de>
Cc: David Laight <david.laight.linux@gmail.com>,
        Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        david@kernel.org, Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Tal Zussman <tz2294@columbia.edu>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <asgBn1VadUOpWFpZ@pcnci.linuxbox.cz>
References: <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
 <ar9yRqq6cBxHDWKA@gremlin>
 <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
 <asAE3kLFDUx5v0Nw@gremlin>
 <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

> 
> What is that kernel?
> 
> 6.18.55lb9.01
basically it is vanilla 6.18 + 6.18.55 + few mostly insignificant patches.
if you're willing to take a look, I tried to upload all important stuff here:

https://storage.linuxbox.cz/index.php/s/6rcp8oWCGzAqPEY

sorry for not making this available sooner, it completely slipped my mind

description of files:

linux-6.18.55-lb9.01.tar.xz - patched sources tarball
patches.tar.gz - tarball of patches applied to source, including description txt
 (stable patch-6.18.55 is not included)
kernel-6.18.55-config - .config for this release
rpm/... - kernel, kernel-vmlinux etc binaries in RPM format, if this is OK for you

vmcore-dmesg.txt - kdump-dmesg, unfortunately the box got fenced before
being able to dump vmcore binary, I have to tweak this

lscpu.txt - lscpu output

if you prefer src.rpm, please let me know.

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
>   22:   48 8b 00                mov    (%rax),%rax
>   25:   48 85 c0                test   %rax,%rax
>   28:   74 78                   je     0xa2
>   2a:*  44 8b 58 fc             mov    -0x4(%rax),%r11d         <-- trapping instruction
>   2e:   48 39 78 10             cmp    %rdi,0x10(%rax)
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
despite every effort, I wasn't able to reproduce this in lab and I couldn't easily
just upgrade customer production boxes to latest mainline...

however since we got the crash today on our own cluster node, I guess I can upgrade
at least some nodes of it to 7.2.x (possibly even 7.3-rc6 if necessary). but telling
whether it is ok after doing that is quite hard - we have tens of boxes running various
6.18 releases for months without issue. so I'm afraid the only info I'll be able
to get from this will be the problem is not fixed yet in case I get crash with latest kernel


> 
> If so, you could share your crash core along with debug kernels yadda yadda so
> that I can poke at it.
> 
> And before you do, make sure you have the latest BIOS and microcode installed on
> that machine.
OK

> 
> Also, where can I find full dmesg and /proc/cpuinfo from those machines which
> trigger this?"
I'll collect this from those older crashes as well and upload.

> 
> But still nothing.
> 
> Imagine this issue has been fixed upstream but you don't have the fix in your
> kernels and we're basically chasing the same thing again...
I understand. That's why my initial question was whether this may be some known
problem for which the fixes just didn't get backported to LTS kernels yet.


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
if the uploaded sources etc are of any help to you, I'll be grateful if you look
at them as well.. what else comes to my mind, if the full vmcore from one of previous
crashes including sources, debuginfo etc would be interesting for anyone, I can
either make it available for download as well (which I'll do anyways), or I can
prepare debugging VM where it all will be prepared including crash tool / gdb / whatever
can be of any use and allow access to it (supposing I'll get public part of SSH key),
just let me know if this makes sense..

thanks

BR

nik
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 

