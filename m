Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F096B3F5BE4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758724; cv=none; b=SH+L3mUk/iuvhL2D/m709bORFx0wHbEa/O43mMWGrWFe0v2UI7GHZwZXPFK1TKW0Gbic1z/ljZh2dBo/qhfImAkUJadFPWZppz5c+Lj4aTnmeWKFUoScVgiT6DZs7M108GNJnH+LvtIchbhpWWSNGFc2hc/Qic4sW0Zlu4raqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758724; c=relaxed/simple;
	bh=YPAWUlci+6KqrVcy+i04kgZt2T/4sid87XUoL9gAJWI=;
	h=Date:Subject:References:Content-Type:Message-Id:To:Cc:From:
	 Mime-Version:In-Reply-To; b=cVvmxaaI1r63h3upDRZ57JYnS7LNEj+l+xb6wwM4jC433a/osEvAGpIiive13qFoyHg+WishsHPT/4xRiIQesAcXBstc9cZRfGHzKPTcsgb5gtZxIfSNwHh5i8LWXTLc+HwT7sA9gr4Db6JaU7heO85SgRDzMcmUP3F7ER0xhGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=mKyesHNr; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="mKyesHNr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790758710; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YPAWUlci+6KqrVcy+i04kgZt2T/4sid87XUoL9gAJWI=;
 b=mKyesHNr4LWtT9wc54jSbilbg9m1us5nwyGYF4PAUo4rciRxCZ7yWvKb/S9OHqSmDZ80+D
 TpgKiZZ/O89OiFyA4Tm8LypjisqXe/5fY8obJdN29nnfHF4Td1bgkqLaokEub4Sd/Qn9Pi
 c+WWO12MtvpFYA4WHxmo5n6BDOA2600+M9fI8aymcS3WJJvgq4iUnuovh+NoYnMkpA10Yd
 8wrdicoCfhqWWO7TUSYYCNlhXZYpOMp95jfGNmWsjFVtAlMZGx56bbayv0dup875GOPEF3
 A4BVhcwAD3yuLtta/1guLWHhgAiovZGYdlJJcLnOUGqMxcXIH8WJFRA4J0fihw==
Date: Wed, 30 Sep 2026 16:58:25 +0800
Subject: Re: [PATCH] x86/fpu: Free dynamic fpstate on exec()
References: <20260929151013.81562-2-weiguixiong@bytedance.com>
	<7e945daf-2e1e-468b-8701-db6bbd4ef085@intel.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Message-Id: <451788d5e97cba38274e663d2b7952c593e959be.3ef67f1d.c8de.4e95.a8c9.5c96c6940a95@bytedance.com>
To: "Dave Hansen" <dave.hansen@intel.com>
Cc: <x86@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, 
	"Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"Chang S . Bae" <chang.seok.bae@intel.com>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	=?utf-8?q?=E9=AD=8F=E6=A1=82=E9=9B=84?= <weiguixiong@bytedance.com>
From: =?utf-8?q?=E9=AD=8F=E6=A1=82=E9=9B=84?= <weiguixiong@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <7e945daf-2e1e-468b-8701-db6bbd4ef085@intel.com>
X-Lms-Return-Path: <lba+16abccf34+372945+vger.kernel.org+weiguixiong@bytedance.com>


> From: "Dave Hansen"<dave.hansen@intel.com>
> Date:=C2=A0 Wed, Sep 30, 2026, 00:54
> Subject:=C2=A0 Re: [PATCH] x86/fpu: Free dynamic fpstate on exec()
> To: "Guixiong Wei"<weiguixiong@bytedance.com>, <x86@kernel.org>
> Cc: "Thomas Gleixner"<tglx@kernel.org>, "Ingo Molnar"<mingo@redhat.com>, =
"Borislav Petkov"<bp@alien8.de>, "Dave Hansen"<dave.hansen@linux.intel.com>=
, "H . Peter Anvin"<hpa@zytor.com>, "Chang S . Bae"<chang.seok.bae@intel.co=
m>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
> On 9/29/26 08:10, Guixiong Wei wrote:
> > Preserve the old fpstate pointer across fpstate_reset() and free it onl=
y
> > after fpu_reset_fpstate_regs() has invalidated FPU register ownership.
> > This ordering prevents a context switch from saving FPU registers throu=
gh
> > a freed fpstate pointer.
>=C2=A0
> Are there any fpstate_reset() paths where this matters?
>=C2=A0
> I mean, the init task, obviously not. It doesn't have a dynamic fpstate.
> During exec() this reset happens while:
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bprm->mm =3D NULL;
>=C2=A0
> among other things, so I really don't think it's even remotely in the
> context of getting context-switched to.
>=C2=A0
> For clone(), the destination task is also not in any condition to be
> context-switched to.
>=C2=A0
> So why defend against context switching? What am I missing?
>=C2=A0
You are right. Neither existing fpstate_reset() call path needs
to defend against a context switch. I overcomplicated the ordering
rationale and will drop it.

I will move the dynamic fpstate cleanup into fpstate_reset() as you
suggested. It will preserve the old pointer, install and initialize the
embedded fpstate, and then free the old allocation. This makes
fpstate_reset() own the complete state transition.

I will also update the subject and describe the leak.
