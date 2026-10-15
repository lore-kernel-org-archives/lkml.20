Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CD5531630
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084111; cv=pass; b=rbaewjbohOBh+wfYFb6xF4+jtTUzEPgzpPCqEl3Ap21p2yWGfidR13rUNvlTFalhHFoqjkAN7gKRgri7CVaCj93qS4ON6qrcAoI19s/kMMoWOey2e6G3XpLzAg79cjMYT9q5nAlmmZxUOvV/pr1MC+mrjvmGcIADThIg8w5h/uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084111; c=relaxed/simple;
	bh=EOjLYNLitfJIInUWIMI+uegThTaF0Q0MItF25km4ERw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdiVXmlp2cB339wFQhUb3wHkCaAKdkxkiCS1Ors1JiqtDAojl7FYxGXUYpKRd4XSQXDKM328rq4+yz1vC1JiU5qRiWUEyF232naGOJULM3rmGIj+XqA5KlUHtzGSrpxx/W8Mjpqa4ODJPuSE76Lft+RA/rwjRw+124GJmDztvUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KluOiBYR; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KluOiBYR"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab38a051aaso48063477b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084099; cv=none;
        d=google.com; s=arc-20260327;
        b=mnFog74agNkzBNQYwm1LjEsVc24ZYyNr4i7ahbeOPCgfvNg6GC9t5I+ja3psvBQxvW
         zam+GRCRN97Lxpw+qhsxJikYnglw879xqec4Okw7xqmRvcuTsNz2Sk3r8ZNFLbocCuY2
         Yw1m9rhnUk0ygTcL7HIIEVcKIEhC1hXjWGvBdtJJRuQc/Ncf8vEY7zOxQdyPaGzNYIFk
         yi+i4DR9unyDamJ6/puGnLy1HUNbXbcC7ihNaK8TW47gvhRWaA9OkyJ+z1Kt2O2N/XRa
         2XFYjaGgP7mSZqR/7gKs4nt3ngXNVIKBBdhrYNtkYkqShV7mBWFp1kiqU91xFOR9e5+I
         gz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EOjLYNLitfJIInUWIMI+uegThTaF0Q0MItF25km4ERw=;
        fh=oj6uCrXDG9uOSos+A+3lqvByDPsdubpl4fVBvCXQlGc=;
        b=gY6OVLsKInnaUt4JpzwM0NdEUV2QVJkogPy+YhI3aQcbyun8+2/j4CASgOSIArQenC
         SutwFJwoHkDYTgW57+ZW5NKj9z1v/OmuRanLujNDTCRi5OuO9W/jUq3evpSk6aFHUMG/
         2Gv1EB6iGmn4sldCDm2NNwE0Q/GZw99bPUfTIFrBMdq76wVBe8RZwy8uMC6R3iNYAGst
         /JJX+3BcytoKfJJxX9xLbVfg9sXb927rofVACFacM+724QHyaBirp4/PtDbnrJLiRsJi
         l4m0voC1J8xGIYHWX0XLLgQXS6Y3ZSqFXhSpvCZw1fc8MF7nJ4JoPThR7x5z22wW8GVq
         lm/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084099; x=1792688899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOjLYNLitfJIInUWIMI+uegThTaF0Q0MItF25km4ERw=;
        b=KluOiBYR+Gc9ncxw0pNcpcD/PdE3PjObqMvaHbPT1JihX3nk8yDwvZziqUatYEm4cE
         KKKla/62ENBwAB6amjByEuAbJIW9c+Vpz6IdLIxbggtD2NC/vMcotHX9KXZxYZR3c+M/
         AkfC9hSE+rTTG7IPAXPyiqoz1fpW6MnDjGQAROjCLiQRFpleX4d7bTdOS06flb9pST6Y
         CGcPgRupacOdbBmGmJwiR0l3RkQhaau0sjd9Lr51L9zunPDcoHYlU/rYryFOcBOoIQqn
         hwzOc8gaa3S/dlLCVn4mJiSXyyRXjY8dQ5SOrICW//eeRPPB9RY7d4cFKZaZd9M5BAcC
         yDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084099; x=1792688899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOjLYNLitfJIInUWIMI+uegThTaF0Q0MItF25km4ERw=;
        b=AqYBIuC29/8qIEzfug2djqa3apaV5ApPezRZb9JJXSEJC/LrT2SylyfRIN8kI8LLJ/
         NYZEuXZNl2VgO6TilxyjPOQemtsJrRWJPBjPKwEwbOJKsuFTwQBA7+3LchmZ2a304v5N
         OEyxGJxB5N9qi5E88ZVZotco3/L2VfXAmSvp5ny5DSc933QpaGULkbFodyMha1AySodr
         XOJTmOXjT7OUQVfsxMU0s47XP3h9JROrnYFbTMaLEKcN6YEl6WVVYxXXLpfe6AeCZI1M
         ByQc+6APgibW8xHcInfl8TUxE2VfyT/nhLjbMzq7g2hudcDDIwFSngPpMD+c2DjLGEsR
         qfGw==
X-Forwarded-Encrypted: i=1; AKwUvBzofGHBC0qwu24KAdY0trGaqrsKHMRBMgEHuaB7X1jjhPBpKD5Jhnh4AUcHCrp8RhQxaP3q0Th1b3+CQ2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv+Ek8xqkWq9rZNiCkRho0uoZ3uWUyFCxYr5RXJJ+UZ3LDxwoo
	NgRmyxrpMCzf18BRGAZ7AB4IoPZ23iqx4VETMbGa5Fs70xo4+RGbF1S32e0MknXe7D8P+Cz3HNf
	f62dklRKqxgCHs57kASdpLNYmrIY+Peh487YspBc=
X-Gm-Gg: AYBFou3ijE/FvAOgBcmNwYicA7afn79r0kwn4Esuux34CImc+aU5owfbjaCAXD+n9RD
	HecXUJbukkcQnsdEgNB7/l2Q6g4SVrjO8Pbfi+EvjbCNzU4QDS1/y8eXAK7eWZjAKpxrcRgkhNi
	pnvLzRUbnSKBO5ANDaO9gPm3Ko3zqRML+pwi8sUQd3YdphfoRx/aZwT58bFyVJ1zN2D5IGZQ6a9
	saQrKNMYD4bLywzlKzAhx6GF5AIkT4dbrVPW0v822cpdApL84YRbTvMuEk7d0QJgKZF1O0G3gke
	yKu1fOYEGVO3OgIjo/QrDyICmLC/qitrFclhkNfXofX0XXcCGZVoQ9aC
X-Received: by 2002:a05:690c:e681:10b0:88f:73b0:fa87 with SMTP id
 00721157ae682-8b07edb0e20mr57149977b3.11.1792084099608; Thu, 15 Oct 2026
 10:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <ar_Rathmoj2aP-H7@xhacker> <CALsPMBOYQbro2gZTQR=DSUowmVDs9kujH4ua2UzCoHAQrncuiw@mail.gmail.com>
 <asm95GdbmMpc81p3@xhacker> <CALsPMBPMHc7q-YZvqLLYDSr5RfLmDRwBSq-TFeB8Fc8bPBjQGg@mail.gmail.com>
 <as8NpaT0g9Tsl6PS@xhacker> <CALsPMBOdy4ZDWfnkYokUFuB3UYPV27wTUpBCZaxLWEV10ZuS=A@mail.gmail.com>
 <atAROTefufggiFPO@xhacker> <atBWGQ2iWpm2VKcY@xhacker>
In-Reply-To: <atBWGQ2iWpm2VKcY@xhacker>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Thu, 15 Oct 2026 19:08:08 +0200
X-Gm-Features: AclHuK_WwwJkKlFZfudhhQDlIMbwbspdMnarcp4gCr6CQeC65hQ3jIZC2-gsXTE
Message-ID: <CALsPMBPNKsnSAczyVm3LFFQjwRg8eiGgpB2hJN19iipRZ0mASA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:47=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> On Thu, Oct 15, 2026 at 07:33:13AM +0800, Jisheng Zhang wrote:
> > On Wed, Oct 14, 2026 at 05:58:42PM +0200, Roman Storozhenko wrote:
> > I think you misunderstood something. A riscv platform uses either
> > SBI RFENCE or IPI for tlb shootdown, and won't change. So you can
> > know whether the system is SBI RFENCE powered or IPI powered by
> > cat /proc/interrupts. It's much simpler.
>
> Aha, I missed aclint sswi case, if sswi, no explict /proc/interrupts
> difference between sswi and traditonal plic. However, whether TLB is
> powered by SBI RFENCE or IPI can still be known by checking
> "providing IPIs using SBI IPI extension" in dmesg.

Thanks, I see your point now.

I was treating SBI RFENCE vs the Linux cross-CPU path as part of the
per-request selection, but with the current implementation
riscv_sbi_for_rfence is effectively a system-wide choice established
during initialization.

I reworked the patch in v3 based on your feedback. The tracepoint no
longer reports the local/SBI RFENCE/cross-CPU implementation path.
Instead, it describes the semantic TLB invalidation request itself,
including the range, stride, ASID, target CPU mask and request scope.

I still think there is value in exposing this information as one
semantic event. The individual pieces can be reconstructed with dynamic
tracing, but having them together makes it straightforward to analyze
the distribution and characteristics of TLB invalidations across a
workload without depending on the current implementation details.

The v3 patch is here:

https://lore.kernel.org/all/20261015-tlb_tracepoint-v3-1-eef305a3bb63@gmail=
.com/

Thanks for pointing out the distinction. It helped simplify the event
and make its abstraction clearer.

--=20
Kind regards,
Roman 'Hedin' Storozhenko
