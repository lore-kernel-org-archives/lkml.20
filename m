Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD21F3B9922
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294293; cv=pass; b=CMEpUzycypyzgc4/ITIdne2UWRwer8122/DAaRmvM3RLV8R+vrX27/ephQO+dLUcvDEHdUdxUelcCtNzGU0yzus5vTbY7DRyG82cGJBwe19Bk2C5zQiH/0e+pzh3NmzZZH7y/n64V8l7yz0zKHWEeR+ocsD1WrgwBj1tb+1mgc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294293; c=relaxed/simple;
	bh=DKo0UJCK1Gqcq7aam3bO4Ea5zj+7fJiRNghV49CRaUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=n1d07TaQjsw5kwLj2MWgxp/6iy1WrIW4ufIlJnDPhq6MaLrgO0AgZ/HG+9J0ZAEGdIGMzbv49jdQ0KugqWtNpRylOPKCiKXJTYKqXEmMMchTpaDNnRPyh+dIcIV6OopaPclaA1V1LFh5vFWmdlsPZE/0VtLzidtXVz3ZxIPGMLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MS/aP+N5; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MS/aP+N5"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530d8a00bcdso3013651cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294290; cv=none;
        d=google.com; s=arc-20260327;
        b=C8i5pFyX7G5T5g5v8/M3e85wSa7YqBBTMK2dAHnnE0NqnOKAejQAVQOtbr0y3NZc2X
         5Va3bWjHxcT2g8E288ZVmZ+67azwluRrEMLx7i1qaInY76N2vgsrK98kWwrWSpC8bKCI
         0FxitaPt01lmzLTiAqGnkNeNWwoEOZK3EIxfwj/2VpaINbIibdMV8zNr5hwljB9GIsHl
         SVCPY+InD0RFwy4mDmVaC2d5GeBIscHvlvn3QMuW6xku17vISkxXrVVYA2nk67C4Ytyj
         x9/8ClDF2JGKBFccwvaNMKoy+ZNg6dHwtdx/lsppEyd4FErgQb1aGFIF3wv4YiSznduU
         6cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DKo0UJCK1Gqcq7aam3bO4Ea5zj+7fJiRNghV49CRaUU=;
        fh=B474tINvBy4U6CIGna0t8Sx/4wgBHL3wFMHQqyNiStM=;
        b=KQj8EtwvbnfSRwiSASHTEKK5tQUONn7qcULCZcW2kx3lyvfI/ByUUFbBzZSQSVm0lR
         k3Ss8MuSwervumiI6lYrG34XyKfDTMUk1Z6jz+yiF4IdzVDF4t+0ue4sUDDzDgtxbwfl
         xPXA24xbW3qIBX3NF2s892q1xex3mG6aCV4TM5ScgYfSInd7NuW6FYl2sPvy+05N3BDt
         CyU/MhcOG4vRfGNbSTfyjvHp88ojf+3qvZDZK9V6nU2nvF+w+ij5TXtdE/saaEeOVsbw
         x7Eja8XEGR5IZV/Y2cwuHEwa0RwnmN1hOhJE9Ehdt3pHom/WexG+SDkSKDIjJ+ggjM5x
         4+Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294290; x=1790899090; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DKo0UJCK1Gqcq7aam3bO4Ea5zj+7fJiRNghV49CRaUU=;
        b=MS/aP+N5e8fM+Wm+u5jMZ2Yg7cAHezRcHQevq9PmfHiZg3XEnBbJFIWt673MrsEUd7
         xywlvrBfyrMUN36OWn34PoL5oLta3eO78RSyu1DcyHCl9hKBoSpfbm1fb1R3J0JtRPv/
         pq+qSySLVXhP2A8IeZx2pGJlnhhIDqTKHP+lDv4vnjFQeNFoHoMCGhet2FLf/woBo4iT
         rwmFinGVE92CFm3We4vk5cXwT9cliex8cDgeOwAgGDgkYIJJ+R4glMrHqkzAa56HNLMI
         rkVp5gARvwN53z1R5JR2bHKSjPzr0/71bXRjo2IS3pnZLNrfy6oo1deR2oFZvY5go1fm
         KY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294290; x=1790899090;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKo0UJCK1Gqcq7aam3bO4Ea5zj+7fJiRNghV49CRaUU=;
        b=aebFV097Iecl7+o7ZU8zFToOYyp1T2rsEJdxEZISmdn3N1brK32LYkQvPnxiRi0vNk
         U1EXMdAalrqpUnC73jYV+u3NOMnh257b8scIPkTqfCjLQc4a5cE2Lx/sGBG/GC43gzhQ
         b+sTtKgdN/uhqfrRYl8IYeSKAphctusHJ2l7texF4466RI7pPLHBrxuZHgkS5rx2G/nK
         dPr7uaiHuSY6nL2Y4YEZ4Iz2LQCDmVpsEOK/yOwfy6N91AZPMhbVgrs96dcYvQsO5lgK
         5RV3lXN/UVEffBtpGDHW8J3BdiwWfWAJGhhhYhdemaphrvR5x5ibFVH3RPL30hIQUOqC
         hTBg==
X-Gm-Message-State: AFuF++lSYd+a1nd0sxMh/idfGMFuP/+B6RTbf/JZ4hUxzLM64DTkC2pF
	xb3Aq0rfvTzsHzEMymuBbGF++fyvU1je+47IqgpPrk5AtFEseLPsS/fX69I7ifD0pi1an2m1Hxg
	pKEw5yKW7fsktBEXU06azptX1WhCuxv5lKdBD
X-Gm-Gg: AYBFou21bjcdRZMeMrtcwEGDnqbUcloA38J2lP/CnHbx4kdEBSu2/aZ1gGRjzApgpP4
	07FW+gjmHdLQlUgz4syrjLUh8d8OQ17do0FraRz1PYNh9nrQTISJqYuRmVA+C7zABUrlGOqOmAH
	DFGp7vCUqsGb6nUt8BgiAsdnKPpZd/4DZwYif5OR8/2QPPzTAPqkn15mx8PX6QBWzKxUMgjlchd
	/qjg0+Oo3/twH3W03HVVs90skJAmqtdthmmsimJE05YPxNaVUsq/aIyO/XnQMNYPVN1dS435to0
	FCP63AJQfpAvSbkUpNlcJXpIlgDeLTtUOhNMmcvqLdxdgZATt3Y3DXSZAyvDn6VqrwG8HMbhGY7
	ZUSUYcpF3dupjURVU6pymfhJ50iVU7J6YmP1FOrshyWtJLCu5YxlGNTCQBKKLtM9QoW1kJjWyVX
	Hh3YigFjBW
X-Received: by 2002:a05:622a:1209:b0:531:dca:2e8a with SMTP id
 d75a77b69052e-5330b586533mr16740121cf.1.1790294290357; Thu, 24 Sep 2026
 16:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Joshua Hudson <joshudson@gmail.com>
Date: Thu, 24 Sep 2026 16:57:59 -0700
X-Gm-Features: AclHuK9cKQ8Z-zRaak1hr2IPV3p0fBl4Z_hYkrX5vMxGa73b5gbzhiiqW5mbzlA
Message-ID: <CA+jjjYQ6kPhhbhrdioXUKNatS8rKP+rQFwMA1ieek9nHp7ECxA@mail.gmail.com>
Subject: ASLR, stack location, and BSS nonsense
To: linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I have this program with a 16 GB BSS segment that stopped loading.
Apparently there's been a phase change and some systems won't
opportunistically load a binary with too big of BSS anymore. The job
size is multi-GB in size so saying use a smaller memory size doesn't
really cut it. To be fair I too would rather allocate dynamically and
display a reasonable error message on running out altogether.

The root algorithm is a single stretchy array and can't be easily
adopted for a fragmented memory pool. So I ponder my other options
(all of which include growing stretchy array with mmap() rather than a
giant BSS):

1) Try locating stack self-relative (it's a PIE executable).

1A) PT_GNU_STACK always ignores its address

1B) Supposing I could enumerate my address space and free the original
stack and set my new stack where I want it; the original stack might
eventually be allocated again, and treated as arguments by /proc.
Oops.

2) relaunch self with personality set to no ASLR. Oops; ever try to
relaunch yourself in a chroot jail that deliberately does not have
/proc mounted? It's hard.

3) Determine what the absolute limits are of ASLR and see if this is a
problem. Oops, insufficient documentation

4) Determine what the absolute limits are of ASLR, sed my load
address, and see if this is a problem. Oops, insufficient
documentation (still).

5) Determine stack top and bottom from value of rsp and which of three
memory regions to start my stretchy array. I think I can force my
initial size via PT_GNU_STACK which means I can estimate from rsp.

So the regions would be
5a) 0x10000 to load address (easy to get from rsp)
5b) load address + size of program to top of stack
5c) bottom of stack + small constant to top of address space

Problem: what if the environment is too big
Problem: what is the value of (small constant)

Anyway, all potential solutions have problems. Personally I'd love it
if setting a base address into PT_GNU_STACK actually worked but it's
probably not the best solution (see, what if the environment is too
big (to be fair I don't need any part of the environment but there
doesn't seem to be a good way to say that)). This doesn't defeat ASLR
because it's a PIE binary so the base is self relative.

Note that "insufficient documentation" isn't _quite_ resolved by read
kernel source. It's not "what does it to today". It's "what can I
depend on not breaking under me". I just got burned and don't want to
get burned again.

The source code is published on github. You don't want to deal with
it. https://github.com/joshudson/emergency64/blob/master/ren.asm It's
kind of an oddball in that project in that it has other uses besides
just rescue.
