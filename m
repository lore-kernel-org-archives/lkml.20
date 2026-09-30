Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3130569F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761459; cv=none; b=PMtL6yZpenQsIVbQtdPVPoUChSreCJFLuomuNHgibEeM61hqzlBg03lNrmVPoau1yW+f57vD6kWMB2SZXXj8q3dX+KW3kbfsqu4ySyPBcBHpp0FOicI7cYaTYiPF5IKhSg8mPGj6t6XfY+KGPznmgxuaB5/h1Z4HFpPOFX6HNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761459; c=relaxed/simple;
	bh=7TStImU1e6YwnQO/Ay+2LKUSO0Mvld8Qf7pStg711GY=;
	h=Subject:From:In-Reply-To:Message-Id:To:Mime-Version:References:
	 Content-Type:Date:Cc; b=isxrTQQy+bzYpd2xkjTZVmO+i5CutC+x+Ve85G0ERewIz4J5mvHYg4rWnM+BqL8w+OtK8Lbt/gRC2/D2v3iRClnS0kQYiFe3hNUx70gF8LtJYR9Jpo6WMEoZhG8ucysbmlePNO3+jl0a6Tlcp2wVYRlrP6Sh5o9ErJPT5srVx+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BwbmG6WR; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BwbmG6WR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790761446; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=7TStImU1e6YwnQO/Ay+2LKUSO0Mvld8Qf7pStg711GY=;
 b=BwbmG6WR67K9vvHhoKnvqVWF5i2d6dAofVb/NUpU7E9S61RWaC0usL6JyMSdq9crcBjJe4
 FOkDMavRnwmWYceyrmwevkWZXfw7dfp9YFyBmLFavNuAqH0cvjx4gmmRKPH8MIaCn9+XGB
 ktdmymZVcGZ1pxy6NRyLXW0NkwUrSRfUReDWsL6Q5e3RQVaL3vBNnqv5jcKp7zHnlx+iiE
 SEkyGI/EQvj1FPNfDIy8WyZmB99O6noXR51sS2L8RK1fZcpQqopM+lIpeeGHKg9y0nD23B
 whqD9Hsri4/SbdJxAT1392+HUv7dXXegsQJ8VpWzkupHIXrBCGSx03N8G8WmLw==
Subject: Re: [PATCH] x86/fpu: Free dynamic fpstate on exec()
From: "Guixiong Wei" <weiguixiong@bytedance.com>
In-Reply-To: <e3cba491-9fdb-4907-9843-c427c96c3237@intel.com>
X-Lms-Return-Path: <lba+16abcd9e4+9f170e+vger.kernel.org+weiguixiong@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <451788d5e97cba38274e663d2b7952c593e959be.88da3c26.f733.4725.a593.8b7f73967bdc@bytedance.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929151013.81562-2-weiguixiong@bytedance.com>
	<e3cba491-9fdb-4907-9843-c427c96c3237@intel.com>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 17:44:02 +0800
Cc: <x86@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, 
	"Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>, "Guixiong Wei" <weiguixiong@bytedance.com>


> From: "Chang S. Bae"<chang.seok.bae@intel.com>
> Date:=C2=A0 Wed, Sep 30, 2026, 14:51
> Subject:=C2=A0 Re: [PATCH] x86/fpu: Free dynamic fpstate on exec()
> To: "Guixiong Wei"<weiguixiong@bytedance.com>, <x86@kernel.org>
> Cc: "Thomas Gleixner"<tglx@kernel.org>, "Ingo Molnar"<mingo@redhat.com>, =
"Borislav Petkov"<bp@alien8.de>, "Dave Hansen"<dave.hansen@linux.intel.com>=
, "H . Peter Anvin"<hpa@zytor.com>, <linux-kernel@vger.kernel.org>, <stable=
@vger.kernel.org>
> On 9/29/2026 8:10 AM, Guixiong Wei wrote:
> > The fpstate embedded in struct fpu only accommodates the default
> > xfeatures. When a task first uses a dynamically enabled xfeature,
> > fpstate_realloc() installs a larger fpstate allocated with vzalloc().
> >=C2=A0
> > fpu_flush_thread() resets fpu->fpstate to the embedded fpstate on exec(=
)
> > without freeing the dynamically allocated one. Once the pointer is
> > overwritten, arch_release_task_struct() cannot free the allocation when
> > the task exits.
>=C2=A0
> Thanks for the finding and fixing this. I see Dave has given good=C2=A0
> suggestions. I think you can follow those into a revision.

Sure. I will add function test_exec to tools/testing/selftests/x86/amx.c,
covering the AMX use and exec sequence in the next revision.

>=C2=A0
> ...
>=C2=A0
> > On an AMX-capable system, 1000 iterations of requesting XTILEDATA
> > permission, executing TILEZERO and calling execve() on the same image
> > left 1000 16 KiB allocations attributed to __xfd_enable_feature() in
> > /proc/vmallocinfo. None remained after this change.
>=C2=A0
> I would be interested in turning this into a selftest if possible. It=C2=
=A0
> would be great if you could.
>=C2=A0
> Otherwise, I wrote a case (using XRSTOR instead) and then saw that=C2=A0
> amount from fpstate_relloac() in vmallocinfo:
>=C2=A0
> =C2=A0 =C2=A0Caller/Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Difference
> =C2=A0 =C2=A0---------------------------------------------------
> =C2=A0 =C2=A0fpstate_realloc.constprop.0 (pages=3D3) =C2=A0 =C2=A0+163840=
00
> =C2=A0 =C2=A0...
>=C2=A0
> BTW, just curious if it happens with real-world applications. The=C2=A0
> permission is revoked on exec(), that is a very edge of the TMUL use if=
=C2=A0
> so. Is it a case running another application right after matrix=C2=A0
> multiplications?
>=C2=A0

I found this while developing an AMX application that calls exec()
after performing AMX computations.

> Thanks,
> Chang
>=C2=A0
