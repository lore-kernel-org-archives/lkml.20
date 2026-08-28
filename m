Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2921D3976A0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956481; cv=pass; b=pfT6owjvVz/rCU2m1KlAVhQM4ELA3d/ZOyaibuZNzCGZxxPYw6PCa2osa/ynan134hcof8lltN8cIMesQJfWYIy/JFDPVNxUD3KvKUAGqVQAZ6fCHz+6rfxQyEsedpExN1WbxqxTe7v+l+2yIgbb43U3B1rGOI2jqnuUxELxi1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956481; c=relaxed/simple;
	bh=LsddL4PRlUTsAeoM7ovykaSIoHJp/TKPnksnw+b4W0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcSDkxKU4jHgyFqIMhpLZfn5IMZTYtkgVEazw/YmPlPT90BY+5dWlKnElIxatQs5KVokNBhC/DsRbGLMfVYNeLw/9EwnEtbfUQQFG6d912jEHSnByJKPcPo0MU6fkJh4ErVm1eqGCC1fK3IWv4cVWdPaUDoTv9tqcH62wiuXeoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DVLCf++P; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DVLCf++P"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52fac937235so42021cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787956478; cv=none;
        d=google.com; s=arc-20260327;
        b=lmajCqCj88BLGp8EMCUMVOfdjpobzok+RvOfbuA3KvXSdagIUT6u+mmxdraXrZj3Zl
         QlJ11JVFAnBRkFiN3QFvPEXGcaJ1FG69r8/DPw/ci8eUGCapANEia+MsARrLLNraXGim
         joxivlkTR28uml7sk6mp0yKQXJouIF3OAi4OsAiPNZC59A5kBUxBy7KXNqN0Dzxu3haO
         t3ZUzV3rk6fi7lojd13ZbIuShHzrQzMwExiSnZhG8Z0HkJuQBhpVx739zm9uLG0ZCrHx
         bXjsnPBW2SGwmgNs90QC6kiz/zyaPqcMcGuL7Y2dy0pCI8pPxH4bN/3MGI9fHK5ncpAR
         v1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        fh=ymZuLTw/pZwipjQ0oLcmLLU39TEYo8oVt0oWkQaCFi4=;
        b=JQMavwxtULFOSQSJYg68tZJUx3YpLV/+/pxseuaTyONpNkeUrZ9XwSo81NT7Ulya+k
         jiQBQV/tionObi8e1uvcKoHQmimOyfylhT4lXBVyyWAdOv7t4OlpDUYoSqzsjy5Q1DUE
         JvnWd7zWU2QGX2WWHRFM3lSMV/Px+wLD4TwZoNAac/HCN6VHRdlhsBC0UZJbBNsNaMWt
         rCHUq5ELej9lFVaSb1fyJ4ZTGTihqyRRrY/39mWpNdc/BnXtAU27WQunJUi7uINMN+Kw
         YJ6FtriYajRirYdKa9iv0wsRuO50vALDq5+lg2wlJmX10ke+87H6GPjxgUaXxySMNdWP
         6/3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787956478; x=1788561278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        b=DVLCf++PTc4ePRoNxkjNW7uu5fXBjVqgUxMXhWa9Gzwk961XDDCyCoQ1yJIL7xsHrf
         HFQZIzkk1jWm8SkEGD5hqobPB34AvGnFKSWyEA2Skn+yuhtOdCxCZTjBgstq/c7s3o3/
         v4furAvBYdnCCbQAy5HUfk19KY57h2eR0VVSK04FcPmjzrda9MWnxFP8bBEJtKREKh4N
         XFa4b3TUwmGzu6VZSexNafPKpZkzpY5QFxZhbNlePW4Ghrktb0KJ0iyORJhJIQGqvENU
         3lwffl6WQKlHFXoQOcuQWoFUZ/7YyxbCzOqn03k/hHNajPI6nYl4Lgdy2JAp6EM1DaTJ
         55qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956478; x=1788561278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        b=tJ8sCl0cBNUqNhib0mmzBExxFe0Rr2KmOBuIQqa7mEfgsgnYYMjI8/918qfJNt9hJh
         hgep66GTEpsF2+cHltMz52e6tfPCC308/Ni/Q+Mihqv9L/1sbp06fxpKeYuQME/kwQAp
         AYFpOMMbEW0IeemQT05oSOSEmheKIkucdE8Gqz1M7YXn2CmJ90HiVrbxWh7KCONMIQds
         7ISsxqkhPMBq3C+SQgW+46idpf4CSbRlABUuzdXY3EF/KY92cWWbr5dZJCLw+Xd80Kvt
         dfRMFeIPwYb79AgHHxdzMkL2mISQmoqbdoQUNtlq/h6qyZBijzUwjQ8T01ZTfBZBASl6
         pKaw==
X-Forwarded-Encrypted: i=1; AHgh+RoGJ2ldf9go8j+pYOlIR91DwTzZyNgXI7HNQsXy0gvgufACROmaPOtXCxXsGxAZVDdv1Lk4MpT8gEeGKPs=@vger.kernel.org
X-Gm-Message-State: AFuF++l6W0WkhyhjyvwHiBaBIbUrpvfxCPTKviiViv4GX7GmkqXuPN9g
	OK4xbp26PVCikaMlO147jHWVjcPqorA2cdTETPme5+RBe8CJkFVn11Hca8DQPbuacPJPNO+tqzk
	KOQh665FnCCUwdJZgorI4sxKssfoDmRMFJprvmy0H
X-Gm-Gg: AR+sD10yqeQVNF8GXDNTKuuXcqN6cHdjs5xaaXgZ2vjxkJRbtWriIO7dwCzz0arro61
	l0sWQLC0vDgxIspA9HtDIQdy5VgZUImEsqdS33Uc6IuYN5/jXj3EDzlThAR/98RiC0AvB+f78YD
	Xr+yTkqI8Pc+Wy672egCaADpW7wmptPeeGeamMDR1YTlRU8Cy2GbZE6CUz9sUOmRvLmckuDc3ho
	9f7P9mysCsTcIpjqbz86d1BhHCPu7s++qCqTvQAUJ3ESO+oB5bJkPdzB7LF/GycmAyFKtMk2TBS
	SQgWlVpiAR/FqCzFRniFwuioTbZcwv1x8Yv0g5fEQ3aY5a2DUNcaIxL+irtDwIdqC6Hq7TGANX8
	=
X-Received: by 2002:ac8:5d0d:0:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52ff73ae215mr4559061cf.11.1787956477427; Fri, 28 Aug 2026
 15:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-9-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-9-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:34:26 -0700
X-Gm-Features: AcwNN1VVNzU9UspnZq9FN__NwaWjASBppoxqnYJM22b0AQZYrchahcz9KPBbKug
Message-ID: <CAGtprH8TceU0x4ivPk23jNGmhKBmJkhu=9YiHw2ibEJZ8gDhpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
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
> Add Dynamic PAMT support to KVM's S-EPT MMU by "getting" a PAMT page when
> adding guest memory (PAGE.ADD or PAGE.AUG), and "putting" the page when
> removing guest memory (PAGE.REMOVE).
>
> To access the per-vCPU PAMT caches without plumbing @vcpu throughout the
> TDP MMU, begrudgingly use kvm_get_running_vcpu() to get the vCPU, and bug
> the VM if KVM attempts to set an S-EPT leaf without an active vCPU.  KVM
> only supports creating _new_ mappings in page (pre)fault paths, all of
> which require an active vCPU.
>
> The PAMT memory holds metadata for TDX protected memory. With Dynamic
> PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX module
> with a few pages that cover 2MB of host physical memory.
>
> Releases are balanced via tdx_pamt_put(): every control-page free goes
> through tdx_free_control_page(), and guest data pages are put directly on
> the successful tdh_mem_page_remove() path and in the
> tdx_mem_page_add/aug() error path.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
