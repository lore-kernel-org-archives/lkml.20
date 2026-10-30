Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385413;
	b=GoSgUesQcX3F62xypqK/j1Tdo67m5IULAOm4SYJZEdch+gL7iqLA5sC6T/aXbtzYJ3p5
	 9vfeQhmIM4DJ062Lqe9bSMLJr54J2wRj4GuIsITieCSduL61axbw9+5U1Zh6ENMBEaDsY
	 mzwsFW8wpgtx6DWmmNybMzWCby1LpZL4Oe2OK/lzNT4U1xlUuCbBeHzJALs8oh/qXGaHE
	 vtu1Z2roNOzjYBrqiOjbEnBJOeGIu0yHxlBk8PaagwyAW/TkMVMMmsyPWFXtujEm8t1Y0
	 MwOyPa1msnEVyCGL8UYuzMIgTYQqwpG004og4q9HqxwsUs1JR7UdEPCaWGSAtUzGhTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lnreq8dc1kXyWMWD+2wEJ3SBKmyDtG659lWmXyFpFB8=;
	b=ZRs5esz4tk5RYYRIkHoNJ9tUaNvSAO0FXLttSQCiEyqkxSLP0TVCftSps8CM8AHrJ3x9
	 H6Rr8wRzz7n4wIBUo6fNGybkFAhbh3S1urzyEC6hFSqYm9oszDwlHdbHn+ZjAfic9yHdy
	 mHiY3c5Ql3ZdCrOPivPb3oC7Hn+0piidyknMg+KkVKKlLVW2TTOS0hGsEz8hFAni296bx
	 d8AB6PeVWayujj59EOcXh16kYwm++TxMIx3c1Gr6H1CgPS+5QZYnr09mB82xmZxNiJgh5
	 BqD985GFZbyEURTNPHxpF459xGvXO3QN5Qm+i0dbm86gK/zNuGjTFBWad1/9MNrsdYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=LiDqSDX8;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9EB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=LiDqSDX8
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67583c777abso1218217d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793385412; x=1793990212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lnreq8dc1kXyWMWD+2wEJ3SBKmyDtG659lWmXyFpFB8=;
        b=LiDqSDX81toWmnYVMaVZvpSJQV35AJu9DH0d/9XnYEua1Q7ZqvUgaA3i8C5fHjVeCG
         FZFwTiUIIi7rs6U4pbp/vBNF5jsAexTCe8F5oxJJKPV6t++nb0X6BKrfx/IyO9IJQrle
         TZBgYGWy//1G/JzyiIahzLqMnLi1bpTGoMl/vgu4joViUzLsrVodJ2BjRjtKZvJ9OM54
         a1QLq8t6IFbBLgHKvZpi1254vYCTA2I4ddHxaU9HZ3WvYlh7QmnKPx59p9ywLzNZT8f0
         zb39T5P6LteKJubRZIWJIyVHEgPV3MV7YKXXIpuiSfv8rjfMt43YtGDSlGuCvOS/5tnl
         pMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385412; x=1793990212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnreq8dc1kXyWMWD+2wEJ3SBKmyDtG659lWmXyFpFB8=;
        b=oT5VJp455ODUysigkyUBz1wk33GIBI9mPRhDmfBLNLgIzK9EFhzgfALsAgJ2ImOH7o
         +gU9ceKWdWEt4UFYAu6siTWZuGpCERQxTz10DnT992jwXTF/mYUXUZcD369Nc0C6N1+w
         eLFvlhzU7zZi1B4/STfsd+NbhS7FyJIOgPIb92sBOa+izbq2fxpwpnmNA3Iqft/9+1h6
         2qGVHMg/BnzW5P/0r0nC1srZ27gHbOTwTWVhNEFEpaRrPqx1e8DERLu0HD9IMPREYPCy
         O5QBOeH4Y3MD4cX+mGO5ELFnxtyjSiEbqFmBDDUGJpcuhvGHXnNG6OXNaSOGpmmy2r9i
         8zGQ==
X-Forwarded-Encrypted: i=1; AKwUvBybPWwlcIgxPcd/eNj3j6oJHmdl1wC3pt4q58XcOsAWFlax4yOnzUCwQz2WjFyyDo3iNIpKQ4pWf6wWHQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/dehKerfkdYbDPLQNQgP2Hl8igzffNbdaSyRHSiyiRfztFXpQ
	DIv4lOWhTa/wmCGjM4WoJRMP/HN+rrf5tbGxleBQvuVoL/i2A5g/wJqhDlgrx+X1w4Q=
X-Gm-Gg: AYBFou1Loj0RoMZUNMnVWbO6gZ7F3Pc33c5J8cWpZxfjylYOhUAgLSJ2Dd4yBnjy0FT
	e8SfE8g7YzR6IKwBt/APCB8oyaSvcaiOh19MH7KDDsJEtps8XZOC8TDpVCyVrJAZ+FDZ5eSU7D8
	1ZSS4uyCC5g6B+bkfk+/IRraYyC1WRBGhT1HfcsSMeRxpw3dxAn1GTUfpNveoZ+c2QoRxwUDeuy
	73usF/AKwpcsS3KLdAamlPhq/IoofwoDBvP61+gr0D+y/6G8NFojLkfZkzpikKbA7G4a9HjqOpI
	9YVDOeeeBF+i78vJapLQ+cgnSRx0zdVH9z6WOz1+0I3nebanRiaWht/or/6IeMXhqcRLzc7ZJ/G
	5bVZiN28CJVzkPSqxLdRBY1XH1MZW3r0tGInkInNR1/gvj802LveL2OsaedK3TrvwGykeZG9p/E
	XRSilWBd89pK+9PYWD/E4N4TE2CRbB0Yd3Jl5cvKPHIf96J/MMnJKGrx22ACILmzpmi4a6Io+Cu
	QqSOdbQ6m6/sPUfgFV8+1sLUY3wUs3Evmi21F1TsxSeBD/+ftBQ4PQrz92hLK+8xHJofUsLbh9N
	If77Bw4+fG/BtXTay7lpmZ0TURMX+yY+1JntLfosAcMGEifFpzvjoQhZDE1ZbQ==
X-Received: by 2002:a53:b4c3:0:b0:672:c99f:5f5a with SMTP id 956f58d0204a3-67a8d398a79mr3576548d50.8.1793385411605;
        Fri, 30 Oct 2026 11:36:51 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf344b20sm454126d50.20.2026.10.30.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:36:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:36:49 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re:  riscv: Deprecate vector state prctl/sysctl
Message-ID: <auTjwQoRqV5ayKdx@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-3-samuel.holland@sifive.com>
 <DM9V74ODA23L.36WJYLIGDDVMG@qti.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM9V74ODA23L.36WJYLIGDDVMG@qti.qualcomm.com>

Hi Samuel and Radim,

On Tue, Oct 20, 2026 at 06:08:10PM +0000, Radim Krcmar wrote:
> 2026-10-07T01:51:17-07:00, Samuel Holland <samuel.holland@sifive.com>:
> > The ability to prevent userspace from executing vector instructions was
> > provided as a escape hatch for software that was broken by adding vector
> > state to the signal context. This appears to be unused in practice, and
> > creates confusion in the extension support returned by hwprobe(), as in
> > this one special case an extension reported as present by hwprobe() is
> > unusable.
> >
> > Since we believe it is safe to always allow vector usage, hide the prctl
> > and sysctl behind a Kconfig option and mark them as deprecated, so they
> > can be removed in the future. Note that significant userspace software
> > like glibc already considers these controls explicitly unsupported.
> 
> KVM on QEMU breaks because of -EINVAL:
> 
>   static bool kvm_cpu_realize(CPUState *cs, Error **errp)
>   { [...]
>       if (riscv_has_ext(&cpu->env, RVV)) {
>           ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
>           if (ret) {
>               error_setg_errno(errp, errno,
>                                "Error in prctl PR_RISCV_V_SET_CONTROL");
>               return false;
>           }
>       }
> 
> We could have somewhat softer deprecations by defining that the vector
> prctls succeed when user intent matches the current state and deny any
> change.

Thanks for spotting this, after discussing with the team, we would
suggest the following moving forward:

 - The prctl and sysctl interface should remain, and PR_RISCV_V_GET_CONTROL
   always returns the enablement status.
 - Turning on vector with prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON)
   should always success on a platform that supports vector.
 - Turning off vector with prctl, or sysctl interface should return
   -EINVAL, and must not turn off vector at next execv. A pr_warn here
   could be helpful to inform system administrator that this operation
   is deprecated.
 - Selftest should be updated and verify that turning off vector with
   prctl does not take any effect.

I am happy to help on any part of the work if needed, just let me know.

> 
> Or is RISC-V still bold enough to "fix" userspace and hope for the best?
> (High chance of Linus.)
> 
> >
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> 
> Would be nice to also update selftests and vector.rst.
> 
> Thanks.
