Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F9B3839B2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946655; cv=pass; b=LFaai8jejYF/xaqFkIQCqQIacVlWcApeiODTz4Cvo1Ms3extFxVED49PYSVqKtphHWDwAKq/KuwBC4wvSGUT+IsryBqLxSw7GyOhtwEgAcaQgKPsznX4vh7GZJVHCFVrmjpBy+eq7HY7qlxYXQF58SityDSAANH4Hrl9Z9knoyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946655; c=relaxed/simple;
	bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8IL97TL2RLsapXhYwUPFJ+M1jEO6enjMQ+gA2oX53k5Ksu3QmI7ZjG9q4vLZBy2aeL29F1/qkaUCsXB3dKtNCxbnSF9yQ6/0l0aFcPr8/h3pxpvNCUZ0SyJQqopViVghTYDHUgx1PgaFrWTRGNjShI/IaQocfPAHfeVa7F14RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckaTpbj+; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckaTpbj+"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c10e86e52so5031cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787946652; cv=none;
        d=google.com; s=arc-20260327;
        b=ic8if9BzjCPsJzmC4BV4eq1fEfRgU3Kj0NDQRmja1RxKYPhAvFx8FFVBLJ6CbZeWD/
         cKq/YfXkwIOltJdsGb1UUp3YHHbZd7fOMLyNRCn+pMTUqkpXENayrMsjcBGJ5vxDAxUM
         X6QVMPi5nL8HldbXgWxtspM/I/+zcpkexuFuZgvV0iphjBllKYsgC4NI/+4aA7zoU8FW
         YPdYr6e469tjReIDTmrM4En/LkOZlEJCjK7JlOpN0DsRHjOjvZb1xXeOLCBBc+orszxj
         l+0SCblXwD66fzAogiKW1VqykvmhVR4if/s33VR0NySXqTejTZwBIPIYwqYleW5uvIkb
         BXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        fh=YEt8FSzoc6ocYJ+dLSvTbxzoVswkYF3OuEDxhFuFnl4=;
        b=CZyjvYtOx8UZKRdwfnqKd3cIoJRbs2tp07Jhf+Au8sb3pVq1SW+DsEx2ytvN2lgls7
         lazIpSR8E7aCCFW8Mtwoj7dOfLIGXspb+xxo6q7g4EoR5ByZPLyis9XFOzMZe+TT56ND
         hLfiuBpdDSDi3ZlakMXGOEaPL8PZDmB02PVo3Q9a5Zy7gzHp0RNHFNZPDF4IsGTWDMue
         g81aAxYt2ljlwc4Y2qPGb3B+xfeK/oI2Wm4a8t0uq/pEluwnPglGr70ZVfsvcxyvl4Sd
         5IXCA9Oz/aus7fwPa5SPyuL7YBka//Mgt8kZCUqH3mjSKUSJuVZMrNP2h5dkxgKOE31V
         XkbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787946652; x=1788551452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        b=ckaTpbj+NxSM3jGyluFreV9L6TYg1sWUEFlLuxYQcxwyjbeo1xHw1XgmkjHFuBQnZu
         eeClPLkF3Eq3aYM48Pu5khSiKEdW3XhU59DuZpuRPa3q6qhZBNAaNb7Ih0sAw36tSqas
         F9c/XtGkNpLfTT/CH5NRP/svCTt3P3P54D24lGunh2vL+FPYtjWHtfeW7LxSEEN4yPcn
         z/Q/2SxZ06LiEYsawxRJtqPvum81kl5uVfe/t8zkOkJptbzidzimBItbJivDt0CaLZjf
         yrQRQ8gv4OnHpvnFfo8m8E53IcPOUOy4tDX7XXKBPGTjCG4sJrQ9k/46r1KnPEv05gPa
         42Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787946652; x=1788551452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        b=dbWM6tSewBEh+HMQFZlaUct1iECXUmkqFydzQwXWv2rFVNzcYYMCh6vDyirbFe917P
         MYzp28tMdmTpOyFPkp0O378F/CepRXOKSuo6HwQb4h2b3jZIesGV2pyIyOhYLhTlWk3u
         0COehaKTAzMgEYza/ie+I0rF2fqfdGnjTmW6dV76fEu/YuaH0U4BlXHcJK6nqwnRCVyS
         QN0hBvX77+eYAwb2azxqjgfYzrSjTijl04eO1UeCwwo70qQubBtv64xxj2bnp8kpQAAU
         DI8asUc0BsgYhAeY9McFBs7Ay9iKxL3oBuNYRpcsZTH6zYSdU2s8XPCZMktuLOiHvo+v
         FHyw==
X-Forwarded-Encrypted: i=1; AHgh+RqMYY8JRL0UWeoA7QJZATDETs4/ejZ4+ZWXSYjscztuQpiZqNFghEllWrE48CAm6qK5y8Fwd/64e9R4FKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n3EJId7V4SylIid5eiKgJnTqflVsM7oHv8Qcab8i0xu5dq0tyW
	yYCjyE5kvhBJ88Egs2XLLyKfZo1iunrltaiSFSL7UTKshDm+k0lT9E1aGLj2E2LHpQaeInlGlPF
	9cb/0H/JW6fgLAlpe0e8Eu7rk7Uw0s92r8pvW+/an
X-Gm-Gg: AR+sD105g4DRFVq5JUgfu4MRRL9gtRIO+yfjUotcJsDyFGRdzbqRglTCUi0F9F+dz1B
	IYy02gUnmoz+IxAhsaGs1CzdF31sXCaPEhzVSfziwQ4hMI0rkpe/c+QiKk65rvz7HhAqZ4IFGzd
	yfV0YGkVhqm3FGWQ4ndIRe7PScMW8LQAuQ+p5OfBRuGeqrxFXupR0eYGMV2rWRAp26CBOdy49li
	EtNXD+g8HP4xmHe2Hg3TwzOU7KrZI2DMkpHfxaJK6MQmkUghXVff7If35FrW05Lp1vAisb6YoHG
	lQiTBLbd002gNVdjV+mpQYXN0NTUTK2FAlUOAfr40YxUO8Rsp+1j+RzZU/Uytg/V7MugVEt/p5U
	=
X-Received: by 2002:ac8:7f51:0:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-52ff715f969mr2184691cf.7.1787946651120; Fri, 28 Aug 2026
 12:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-4-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-4-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:50:40 -0700
X-Gm-Features: AcwNN1UGA8VSxLqG_WtYxcyIroEJNe3FATQouEdY6s-KcMOngGCRN2JEgv1FXj0
Message-ID: <CAGtprH9ERb_fFG-4JYR1Bjxyyvnk3Ys4q=9ioQz0Cq6QCXtVBw@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] x86/virt/tdx: Add tdx_alloc/free_control_page() helpers
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> Add helpers to use when allocating or preparing pages that are handed to
> the TDX module for use as control/S-EPT pages, and thus need Dynamic PAMT
> adjustments.
>
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically.
>
> KVM will need to hand pages to the TDX module that it will use at 4KB
> granularity. So these pages will need Dynamic PAMT backing added before
> they are used by the TDX module, and removed afterwards.
>
> Add tdx_alloc_control_page() and tdx_free_control_page() to handle both
> page allocation and Dynamic PAMT installation. Make them behave like
> normal alloc/free functions where allocation can fail in the case of no
> memory, but free (with any necessary Dynamic PAMT release) always
> succeeds. Do this so they can support the existing TDX flows that require
> teardowns to succeed.
>
> Also create tdx_pamt_get/put() to handle installing Dynamic PAMT 4KB
> backing for pages that are already allocated (such as KVM's use of S-EPT
> page tables or guest private memory). Have them take a pfn instead of a
> struct page, as future changes will want to use these helpers for guest
> pages which are tracked by PFN.
>
> Don't CLFLUSH the Dynamic PAMT pages handed to the TDX module, as is done
> for some other SEAMCALLs, as the TDX docs specify that this is only
> needed on "TD private memory or TD control structure page".
>
> Since these allocations will be easily user triggerable, account the
> memory.
>
> Only one pair of Dynamic PAMT pages is required for each 2MB-aligned
> physical region, so multiple callers could trip over each other if they
> try to manage the shared backing for two separate 4KB pages contained in
> one. To build the logic up iteratively, don't do anything to handle pages
> from the same 2MB region yet. Functionality to handle this will be added
> before Dynamic PAMT can be enabled.
>
> AI was used under supervision to collect/apply feedback, split patches,
> review code and workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com> for the
SEAMCALLs and the get/put helpers, assuming your are still thinking to
shift things a bit between the current and the next patch.
