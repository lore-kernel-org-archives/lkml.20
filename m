Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6B3DC4D7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821902; cv=pass; b=RcfMmaiz7eP5ujt8qNb+bexBmwUOBOvOevlGRdPW8xMwZO0f7ihaHsjY87cBL/EeSpioZXSNmmhdT+OzyRPOaFl0eKpWlbYQ7AQQh0zBGuxiyyO08VzTyRAUaLZEFkc8AClh6Iscb388LDguf2OSqW2OTLODBpgA2zzGify24Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821902; c=relaxed/simple;
	bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3z7RpkNeoxczeXJpj3zfDek4lJWR+h3K2eKpyR/yES/044toJgMGtuYlwwSn3dHHu1z/w6qYYsjmZW4nwl3cJRSPc52yzx3J8y5nPzA0RMr+p7M0OiwBL9TKXHf6U280f4mE96l9Zi6t4ohB26Fmqi2onUzz5I3srQRQvUq0+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq/Ogjk7; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq/Ogjk7"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52de178a66aso13677471cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821900; cv=none;
        d=google.com; s=arc-20260327;
        b=deMDMygQj/xTDvYkcpF3TXxAquzwTUnCDHiSpCUlPZj/L85oXSrMhknYvhQ8vw6pdz
         eEhzOkrBa9ETAks8yp6kHECZnRrQinCWl+SMS8eXkdUMNLupjKMa3mCXrqNEHHhiD+lO
         6uCT+p0htiAimnFcuT267BT/yhgq9tXy3/wPhie1M0SQVejhKZqLEPldZWUSgVPPfEP3
         9vLSLRmJWXtLMwPxjN/jgr3/jnF7BRZf2G4W/CtrCZvE0eJvpot3dpg21hWSDFiVs131
         YWHuEwe2TjzEKzrolw0WO4fJaFYIV03lAOceQd9cs2V9hTd6RYMrL9QHu5+v/vnF+WxO
         dTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        fh=Fw+4O7VvhE4y0H18j9G2GM6jZm7ZcP2wN3p5B+DAcYA=;
        b=OwzxniybE0Mxd/rzuog5/3us21kGDmQHKmmFCEOHCIXdM65NNQdAU+TPAHME8k6Hu8
         vNcvy3+iODna3mmVmSy7eol0jwRXFhK6YvYnYjZCib2OwESYtKyA8LWnVkKj+jEMsWcq
         MS8rej2/8TH2dEkObbMNSauPkx8MkCLMr32lKCu4YqyEYKXFeTr4lYFz8Vxot3+5NqA2
         PdkabxpkVJ6zEBntvCUUT0wwt93oIbMqayluELDfal5WOPWrjo+suOkqJjnuBvMkLrMy
         Nr/K39R2LOgj5bf1cqT6iGvUCo9u0n13SNveReRD1BZAJ3LHuVjJBs55tUGu/jLV0Syo
         kZbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821900; x=1788426700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        b=Xq/Ogjk7CMmIcC79QocK2qZ+d53P+cINMf/6qctDL9NZ11rgmUOsoFMM4VZUDc1mRJ
         r5yNFsR/IPPi9wav/BtoYJXGTr1toNBuKOsNEQuqg7YmBifLpsxsl3VdV0GYTJWYkuEw
         24ePTpXojFaGDZsaxRfWDVMF5IQnS3jQDtk6lDbM8dt1hhyIW4iJ73CmsY2dVOl9lqPq
         5NBI+l1ODO/ElSQOUXOYeDPCQHe6h8UVwiwAyBJ3HlpdVxWrPt5C+aRuZBDvn+hNucu2
         Xfgd4pnz1NNOhCyAcOZsdkwo7kZXVDSblGOSEF+grkUyXJxyXuLrKbVTKXUHcq8qBAoP
         /yIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821900; x=1788426700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        b=cG1C86HrLt5f/MZ/2waLItYYFsKcCd9RCum18mGBnLuYQVU/pmFSfY/VfSvHRzNhbQ
         uDB4wkvF3+maAX6u0syRy7RUtjl5J6aasIsZPqO1BKd7Bl3b8j1TMXbFB0QV/+HubH1n
         kEOyveSdjgQYwtcCls6EFqsZCBFHdnSCTuh2ybUpETAXzlIFyIcZxDjKVwl8vbZQsmdw
         giMtpZn8IsreNn8TuF9Efm1rfOiAAgQeWnZJzkSbJKmFGAp/p68WLHc55V8BM8DWxPRB
         dHb09UphipDXktBQYjPa93/JV1qYSRsWp7inwO5z8qEgRazdiN5e1+UQtdQ5Z0wwYHtB
         A45w==
X-Forwarded-Encrypted: i=1; AHgh+Rr021bkNJdEBHKLpCuLlpA1wUVx2Xs8HnMrvuJ3rta69i2OL+a+fPXuwITQzpAOxyNnlDKUlCalPf9EB0M=@vger.kernel.org
X-Gm-Message-State: AFuF++lqJefHq5hiQSFFTB7606L7Tkfo8HWe7mInKNACHZKQSpsdkEAe
	rnrVIIMkIkGfSInMQ3WTzcB30JHY8Mw5/XE0k+q2KpMdkUvGF+AW5EfSreUSixIQVe0eSs+YicW
	JniMgqWtlAp1ngt4zmW/wAV61vOF3fqA=
X-Gm-Gg: AR+sD11wYk6g9Oa6SDt3sLANZ8OAv7TYUkv2HN9TEUuR77F3TWnFzuZakH9Z/bQWHMb
	2skpPA2knEMadPhuggwl6nb5hzD3mGgaf/Of/jgASSJHQ07P4l7kwsR8g0jSjb9A2CFoEzoCgY0
	LjS9mE7WbwTWXUyPhVh5KC0s6ypVv6bGLAjfGrg7+gZPf5mTmFGLCeh7o3WTmV1tYA3r2rW/sbJ
	y39L/Gyrte7fscvgps+/VpRIa3NcQvJE0//LJ4dn2v3ahnxMyl/l1KYNbfHqsrpOWREofC9VuKP
	FGrO/qAGtsH4n7dPhsqDVAw+a+/Mc5A/G8o31iKJi8o/a8u+s+Ni7RM2
X-Received: by 2002:a05:622a:5a19:b0:51c:2022:cef5 with SMTP id
 d75a77b69052e-52e42344bd3mr160664931cf.26.1787821899586; Thu, 27 Aug 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811072830.10028-1-seanwang1@lenovo.com> <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com> <aoX_jiuhv3dyMS-g@arm.com> <CAB8ipk_4Zbhb=azTDGQEQ1S=n2Zhzvqs7pYr6ZfOOWL8meE_4Q@mail.gmail.com>
 <ao_9EiKz9Cmx_YHh@arm.com>
In-Reply-To: <ao_9EiKz9Cmx_YHh@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 27 Aug 2026 17:11:28 +0800
X-Gm-Features: AcwNN1WMellCGNam0VYOTagPOg-9X9_IhSGS0spY85eL_CK-6sC-A-EA_adMUno
Message-ID: <CAB8ipk9KknqBFeQrDYXAqRxGbM_bjtU0w7Jid95XucnzkgUdkg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in arch_cpu_idle_enter()
To: Beata Michalska <beata.michalska@arm.com>
Cc: Sean Wang1 <seanwang1@lenovo.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	Xuewen Yan <xuewen.yan@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:02=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Mon, Aug 24, 2026 at 05:21:03PM +0800, Xuewen Yan wrote:
> > On Thu, Aug 20, 2026 at 3:11=E2=80=AFAM Beata Michalska <beata.michalsk=
a@arm.com> wrote:
> > >
> > Should we distinguish between events?
> We could although for this particular issue clearing the source is the on=
e that
> needs attention. But I do not see why we could not have both.
> This was just sharing the idea, not a final patch.
> >
> > > ---
> > >
> > > This is just a rough idea, and needs ironing out the wrinkles, which =
are there,
> > > but that allows leaving the idle enter as is. I also believe this is =
the right
> > > approach for the interface itself, although I also see some drawbacks=
 and
> > > potential issues (in its current state), especially that the function=
ality is
> > > being exposed to modules.
> > > Nevertheless, those are my two cents, untested, just sketched.
> >
> > As an aside, could we verify the functionality of the AMU's
> > SYS_AMEVCNTR0_CONST_EL0 in the current CPU before enabling amu_file?
> > To my knowledge, many chips currently have inaccurate errata in this co=
unter.
> > Alternatively, could we introduce a command line that allows users to
> > dynamically disable this feature?
> >
> > Thanks!
> Do you have any particular issue in mind ?
> So far, from what I have been able to track, the issues reported are eith=
er
> handled by existing erratum or by the latest change that reads the counte=
rs in
> 'one go'. Can you share the details of the issue you are facing ?
> That would be helpful in potentially finding the right solution.

For example:
There is an A725 errata:
[A725]The CNT_CYCLES event can have a significant increment error due to WF=
E/WFI
Status
Fault type: Programmer Category B
Fault status: Present in r0p0, r0p1, and r0p2. Open.
......
Workaround
There is no workaround.

Thanks!
>
> ---
> BR
> Beata
>
