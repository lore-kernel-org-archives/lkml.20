Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510621;
	b=tRcfgH+m/8TvNfgCL2+R1fQOf94gBImD7algx9oRQA/vuLyNgSl1Lp9X+tlsOrXpCsU2
	 Vyu80LX2AgEA3n7u1WXu8UfgvYht4qzmJTRDVc1iFIMXrPL/W31fYCLb9H91wncU/et3W
	 5so5yN5IncpaTCfP/KK+L7bSZCG6N3YiUfsIvaGTl+UUluMK3TBrQTXdgcEQytm68ShGe
	 8y2AfuGM/VELBV2GI3eh0Ed42q8Jmx3Oa8+nnu9FbPj6TEb11uw0/dZJnw2gwCHzlGDpX
	 a5gMEf9LyRAY3OOWUMk/OFK5MGLnS0bfAPKDrI69XDygdsnW7+vZVZg77W3refzb3uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510621;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
	b=UrYSVHKPn/3hcjDStVU1bG0T5M0Q3n4FRBgSBgby3pj4JXJvuIjBz1tDSTq1ghteFVY6
	 mRIDacGFCM0in6oQM9k4VJ904iwJ+mnsmkFD2TxwWRnCLZVNfpjVugR5udQw33O8VeuN3
	 rZY3TZpTljY+z/eTVxowJ+6tn55xaeLvQs7frfhSVlZ+ACapHa93DDOgOaIORY6XC4P/5
	 5CnBYHDS1vyBI9HDyqAyX0u2XdgZJXc0ozRbXpGIvqBaiInA99fUUUD2yHor4Eg0VFAnG
	 BP7IpvWXMm+g0epjzKXBG76NsrC9DAWFkx7FQ3ejDGmbwo428N7WubusuAbPp6dURTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F860A2624
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8F860A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-998d151f441so70221241.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510620; x=1795115420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
        b=kKn7BB0ShyxXNLed78E1XWKp4f+jWfBgv1sVYwsnheZW4bLiIB9FSJJKv/lRHjWXNs
         Z63M6+FyF0s9SY4zXdfrIdu1MTTIFqQLTJeQo1RkFQ0eABa/qyyVVUUob77GfZspY5fW
         SfqjWDvMjJenkj1Ly50n9EKRu+uLLNPAFtw3IsUbXHOqnGmMJcDKkSaQ8B1J8ISY4TlS
         Nxw+wu9L7Csu4/rhsTI2VmQyiKrzNnLl9++e63bRX6dP7T44V0d15DPAe+d6ADLtrrxo
         eL9gVO7yGipDbZiQUrw8ga/x2pZ5D1Idu0frImTiMoE1EotQBILgxvg6uGNgQ/26FipX
         jyXA==
X-Forwarded-Encrypted: i=1; AL+hErGAD8/RnH9zRW5nwX4xfMLO5snu9DRJW+394v/3v373q7PM7SRZVyTEVQNsDlCzl3dcJqrIkDr41deXj+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q+o1SKGqMfdPYHeVn1enZjkXzNpo9bKC8vb33cTFJb0yIUg1F
	KfsI7CPxr5Z1p+/LpoNXaA6w4fDdox7jGajVZPK+/S54ShDN70XOqK34u84QFazhmdk=
X-Gm-Gg: AYBFou1/oXMgd6vG6j4OiTn6TCphV01oC9YpOw28Ei89e1ITb938buwMVZiVwx1otC6
	CFxcZvprNOzV49X7kErEryCjncu7t2faRHiChS2D6m2Gk4eKJvme8CW9+SyfOBUh0u/HXpsxQ+g
	tKXfpwOtyo9OR33n87YC3EMex7SIBdEFY57bc5Px9LQPwtt4DGJjX7j2dP2XRH6cv3ALVlDP5Ay
	4hSH7c7jLwN6XMbOqwfnquLakBYvwpffFsEsaiRGijzTiGO+K7czi2TecaLWihBydqor3Pttwtz
	CNhVG8qDilD5GKV78brHo1xANPThKRsofsCw4Yta7yKQ3wEpXD8ZZs5oQ+SNR25+yjSYXFx3T4S
	RfLyP1NtLwzZ2te24wnFgWoJnyjd/Z2febuNhmMzzV461rKppcAGCE3CAhGcxfa5YPdMWookCVf
	1Sy2w6sFIIl7mJwgkVGPvAxQWCX/5hFDDxxcNPtN57kUhrnRwMGFQyFAtttg3XKa6QvpPKNP1Ns
	fxs70arNeEPeH0i6d0l9Syc1cAmxtvdbvVd1x6g7GGXFQAiw+tUw2n3cg8WNdvVRbUmKv424tRO
	vM291VsOqcmpHk2quHxs6Mm2AhWtfmnPEgPwXTPPxWeOzR8LedhKgDIlNtbEWppH0f961Yh9ArU
	bgSKtHL3OnsA3
X-Received: by 2002:a05:6102:32d2:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7d64d6db612mr57195137.7.1794510619557;
        Thu, 12 Nov 2026 11:10:19 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8427a264sm211158241.7.2026.11.12.11.10.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:10:18 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc91ddf447so28274137.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHXgHPesOK5TpD5PFlvuW7iG0MAnp1nreK/wRkZxAmiAe7WGdqlorrUpW6l7Q3FtmaWtSL72aEKo+zMSaw=@vger.kernel.org
X-Received: by 2002:a05:6102:5ccb:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d64db29605mr42432137.36.1794510618289; Thu, 12 Nov 2026
 11:10:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:10:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
X-Gm-Features: AclHuK-k7G9fpVKu6BhCbcWfXavvnldoQZhCl9e2eioRf49lg5T7xpzAfc2z5gM
Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 17:39, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without checking
> whether the mapping worked. If it didn't, the copy reads from an offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
