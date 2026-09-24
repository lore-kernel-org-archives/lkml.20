Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556154DD6F5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286518; cv=pass; b=pscrfrTiSXgEPvKyouXce8RndguM+YkDCsFhhpZY60rCrnLNagmFkhS+FUOIy1iIXUXWSHTJCVkmPh2OCyCNOcpebWRyLM2PQMaQyWMNjWQ+oLUJny8SHE2s9fyRE2H1phgHhaUIeaX/tgYyO04AQqhEiT91/ocqVSG7+NWxqA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286518; c=relaxed/simple;
	bh=rZERshdcV0tFUZGMj08I8XPWDI+kU48UpwOPfgc8PK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMD0aStxn4HmPM8yqHmWrujhyAdnw/Zd+Nfzp76s3ZASbbqr9kGrDGd3m/jenbij9RojzpqPXkVfD3fSrMGtZfOI1f0f0E/lkIa44V+iPF5SiViiaZ/L1v0SP00g2ULJnCDzoOS3IEO0MEMkI8jG5X4a3dlnV2uzYP/+aQWWY54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlbGNRs5; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlbGNRs5"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d20963so188784b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286513; cv=none;
        d=google.com; s=arc-20260327;
        b=s3g3eMnHrxeqCU4z2JIN9ftfaxtlvTmbnebkeSinvoxGHXeBb0hhzuhi476Y53bgpQ
         55e9D+SPjevdtqwWIcOjfUKhhYlOCz0HqUMpq754md+TwcTLBGuTrAYAIDhhDyrn7Lwj
         tydUbWJJcVLDLDI8t145okGtqU4DeC+2oLAaIRsFjoX2GwfW+JmPMyWX33o1QPJ7uMkt
         poM91jGP+h91sGxExO5BCiusUZcwB7jmPjm9my9+tnHRhHzqrsY3XENfsrwc4+P/JG3E
         lbeaaC7nL1gAatsWmbEJk3Hi23pbIYiN42Or2tOsyzUKiyQCrZ3MV0DY1N7ijjcNZmjB
         ff3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZERshdcV0tFUZGMj08I8XPWDI+kU48UpwOPfgc8PK8=;
        fh=IyJs8BnFqmE/CSTzxRIRm80cwwQnL1wEj1HFVeWuPj4=;
        b=dzgz0lFv2TNzX3twnPHTCDSylFytUPm44oQDmBriEF2hwGSx6c5YOWJiit8tucQ+zF
         YFYMtyWqX/wKQajWTGZxE0DlGKRHkp4dueHj2tL5po4cuiiLkT2UhE3w7vvc4vopyEqA
         QaQUrFX6kYYfpd+6jqEWzrWQFix2DPiEA0lglM/yZ99Hs/EZz8Ptg3ENigH+ONXVH8rl
         KIs4IWIm564v6o8TLAsKcjXW5M4+iq/F0LXwpiHPrSCL1yLNim5wu8AhJR/Wui4IgVOj
         //691rJMmLElmV2dATA8kbhk1rHeq7L1wPK7+ukyjKm0XgrsQLWDba16oaa5h9AnGA2a
         NDFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286513; x=1790891313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rZERshdcV0tFUZGMj08I8XPWDI+kU48UpwOPfgc8PK8=;
        b=IlbGNRs5xvgzMAn2viM87IliW3aKCTY4fZihT5eOns56NYXkcgrOIpiLqaBj3eQbeR
         Mmjv72v4/Tv3qvfNZ79K5ECJw0Ci9oEmSQyHiLWerbMGD7AOQtfbhhb9mqmRSE8kF+9R
         w/eUhV+66z+lmnG8KvqUHwYSUan6nLkuWFgaxZNFFtP5mEWCOVPFrkCwIdSfIjyvH7ep
         3U5qCoMyAOw1zgVMAJZEmINrfTq38jjm+gQB/NApOMB/JwXiPcjXXEeozb4nkTAZE33x
         LsSAqppgbBJhSs6ZkjO280zeZi60qyFk4+Yl1nX7jKAOH8t8rAzIzAugWBSRL4yspbP9
         Kn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286513; x=1790891313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZERshdcV0tFUZGMj08I8XPWDI+kU48UpwOPfgc8PK8=;
        b=MOaE+WoPthgewgkehSDV90ThsEn6ppyyWzjL/4GCRlN5XxxtlPZH3RwrGo7ssM8PN/
         sSNy4bUW+KcY8WfooYhI9MJOsJHR+5ott8St8NKWm0OareIMj0cFpB/3k65Tp4BIA92d
         E0dJRGZb/TBdBxooqHXswxnMTpZzGOOyGKxAFcoiKGgPAP1rJY9sTSA1OZnBMf1Or1ga
         UNWxp0KWQQDB1ZE5L51q/MhM29rQOFzOoe3bGLsBCQ97dRKz6GDTVt+25cinoscGE2MH
         DG1TvNdpK2Smpio2CJRpsVjIuZoPaJ0Hz5xn6Adtq6f4ctPkh8bjFhk7bmO495NR+4xX
         du0w==
X-Forwarded-Encrypted: i=1; AKwUvBzV7plgg0Xiyq6Tvb0YqsaxD8HGUEC9niRy5QhT/2A50zXJnCgj1sV5XU6KTaxvnnt+PS4qZLwBw4AITh8=@vger.kernel.org
X-Gm-Message-State: AFuF++kTqbT55WPMX/03/s6T9f3Zgyw5uaiPEZTCINqnCWKvaleiOrE6
	HotAezGGqRmtHwTN42cDwew0LlHHf3GAym9SvpbF8EScce3UgbAekvbMU+oSzyyc4gJuq4NqPDg
	xV4AYayjWpg62hzV/7UZ+xNy2q+1vP1o=
X-Gm-Gg: AYBFou2hzvyPMseW+I4CXu2LVzOm8u9lP93xP990SjgMrVuV3Ds7D8hdO5ktE5/kbdA
	vGaK8pV5mVp51JnqCiV7llsdlUWxIN+fqzjyY+PrwrJZmI6nBGiuhuZ2HbsvFUFOBz0Yc5TBhXG
	oAAdasi15FnVocADh8+3vp8Jch5z2CCUBO1ciEmbF5QU56jRJnDiXcSq9BCdTjIon3k0o0mwgCJ
	t+rVBAIcoIS59Z+WWb31Lls/wt0mB7X0mZUhXkBI8a0CPHs+ip1HeIafctnGcqL4dpna84yLlVy
	P+vBWuTqje7uE1JcFjyAObBsoeN+vsoKEvl5sZ/8y2s4p5O2kBkgbxuoDPzec+LlD2G0m0oQNvQ
	/IrW987x1vWm8hNnPqyRnx6hB0di5ZeKTqaPKs7c+XkgzbIaPvu2sQCKwM9X8mp6GTSuSzzD6CA
	==
X-Received: by 2002:a05:6a00:1c8e:b0:871:c970:cf37 with SMTP id
 d2e1a72fcca58-87e9b79bdb6mr3208088b3a.24.1790286513363; Thu, 24 Sep 2026
 14:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914115607.350097-1-imbigking12@gmail.com> <c28917c2-4715-4c70-a2d3-582ca641e1d6@huawei.com>
In-Reply-To: <c28917c2-4715-4c70-a2d3-582ca641e1d6@huawei.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 24 Sep 2026 14:48:21 -0700
X-Gm-Features: AclHuK-NmUD52AXBMVMmQy8Gn29BL7Vr649cjcXJIdr9GevbBkjrs5JhZeSwUK0
Message-ID: <CAADnVQLGWcdi+G-cWkxLCtY-Q3iQ4TJKPcL4i35+c2e_snSUWg@mail.gmail.com>
Subject: Re: [PATCH] riscv: patch: fix handling of bpf-jit execmem addresses
To: Pu Lehui <pulehui@huawei.com>
Cc: Wei-Jie Hung <imbigking12@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, Xiaofeng Yuan <xiaofengmian@163.com>, 
	Klara Modin <klara@kasm.eu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:32=E2=80=AFPM Pu Lehui <pulehui@huawei.com> wrote=
:
>
>
> On 2026/9/14 19:56, Wei-Jie Hung wrote:
> > Commit 8718e5a3090b ("riscv: patch: skip fixmap mapping when kernel tex=
t
> > is already writable") gated the core_kernel_text() branch of patch_map(=
)
> > on CONFIG_STRICT_KERNEL_RWX, and explicitly left the vmalloc branch
> > unchanged. That branch has a separate problem.
> >
> > That branch only creates a temporary writable fixmap alias when
> > CONFIG_STRICT_MODULE_RWX is enabled, and otherwise assumes the target i=
s
> > directly writable and returns the address unchanged. That assumption no
> > longer holds: bpf_prog_pack_alloc calls set_memory_rox() on every pack
> > unconditionally in alloc_new_pack(), independently of any
> > CONFIG_STRICT_*_RWX option, so BPF text in the vmalloc area is read-onl=
y
> > regardless of what CONFIG_STRICT_MODULE_RWX says.
> >
> > With CONFIG_STRICT_MODULE_RWX=3Dn, patch_map() returns the read-only
> > address directly, the subsequent copy_to_kernel_nofault() takes a
> > page fault and returns -EFAULT. bpf_arch_text_copy() turns that into
> > -EINVAL, which propagates through bpf_jit_binary_pack_finalize() to the
> > WARN_ON() in bpf_int_jit_compile() and leaves the program un-JITed.
> >
> > Note that BPF cannot be fixed the way kprobes was in
> > commit bdc46e507b59 ("riscv: mm: make EXECMEM_KPROBES writable without
> > CONFIG_STRICT_MODULE_RWX"). EXECMEM_BPF is already PAGE_KERNEL, i.e.
> > writable at allocation time; the read-only mapping is established
> > afterwards by generic code in alloc_new_pack(), which arch code cannot
> > influence. The only place this can be handled is patch_map().
> >
> > This is the same problem that was fixed on arm64 by commit b1480ed230ac
> > ("arm64: patching: fix handling of execmem addresses"), and the fix is
> > the same: CONFIG_EXECMEM is what actually tracks whether the vmalloc
> > area can hold executable memory that needs a temporary alias to be
> > written. CONFIG_BPF_JIT, CONFIG_KPROBES and CONFIG_MODULES all select
> > it.
> >
> > Note that this is not limited to CONFIG_MODULES=3Dn. Unlike arm64, risc=
v
> > selects CONFIG_ARCH_OPTIONAL_KERNEL_RWX, so CONFIG_STRICT_MODULE_RWX ca=
n
> > be disabled with CONFIG_MODULES=3Dy as well, and the bug is reachable i=
n
> > that configuration too.
> >
> > The !CONFIG_MMU build is unaffected: it has its own __patch_insn_set()
> > and __patch_insn_write() implementations and never calls patch_map().
> >
> > Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_M=
ODULES of")
> > Signed-off-by: Wei-Jie Hung <imbigking12@gmail.com>
> > ---
> > Based on riscv/fixes (b94cec5761d2).

Not clear what tree this patch suppose to go to.
If it's bpf-next then pls respin with correct subj,

pw-bot: cr

>
> Reviewed-by: Pu Lehui <pulehui@huawei.com>
> Tested-by: Pu Lehui <pulehui@huawei.com>

and keep tags.
Thanks everyone.
