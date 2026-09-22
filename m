Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEA400E15
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101739; cv=pass; b=uRhwz262gvar3CoHpe9G+2tOBsSkflTfYFXRpQbsI7LPXVxsAR7qrkV4GpCuy29zz8RjUWnfdOWCh1MnFZ+5sypWdHdsDV5c3C/gPQ65kTJBTx471WEV/WFxKY5ZjnvA0iUdygnbgu/BoZokKT2/JMvwD0rZZb6eyOAFbwKV8TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101739; c=relaxed/simple;
	bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiVvlHWttLp7prUfXWoMTUdTZ8jFxYxc/9Left9pA7As1aXmjLU/vEwa3HIVhBwSHmbVnG/Q/i1HrhXAj8PoQ0ef2hzbTF3qQA6VFr4mCgK0xhuEUf/5tlRnjcJQqLCbFO0LqhRRXZTznjIKI/wHx9VobZM+8WO8GYVn55GvXaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtclKAIW; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtclKAIW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591bb18so113122a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790101736; cv=none;
        d=google.com; s=arc-20260327;
        b=eWKQoJQIMtXJF4Ajc3285s5t5bUeeFoW0Qrr/UffkEVCp20GMrHq22UzmOpKTKdtE5
         MjlUXlq0GMrSM9yJyyH64Blmba7jK2VUMjbuIvv1jfyXkJV9Sb5dWstu6uBgGYrhqmk+
         LMxZwAMAFiG9diPIBPHHK5EC/mkVSHaMVrak8E3Ty0R9TNB0Lb2fbPhuf+PseEUWt0I3
         Dl+aZapTBLJPQJCRUYOlQptcBdc69OIu9ndVD2qtvEGEANCikMSJVSVFa+93fqzIzZiK
         AZT30Wb3rNVnv33GSMhzS9E5n78hFfihlZi8vHf9J0cvCBppcsRqNgLpyjshfDCMw1/b
         waow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
        fh=BOGqNKar8SMIrEkpSqetCH/E5F7WRlIzuvhPhcxOPq8=;
        b=rP2wRVXKQB39HIfDZhc7OYRmTctpxcoCJ/zr+1HD/4Q+40RiVamh/OmRuHCHH4Dt7S
         +ju6lGWLB1/IRlKIS8UunZsvd3sroS6bA7bLzyASr/mVLT6FZe8YzOoQe/7RQ3n2q2il
         octtvIicAokzIaru6p6une5NfrqBKEsxboGVAySPXP8r3TAPjycyXj7Ijy2qcHddVXu6
         Bk37hdxlwM4yIhIUgNXlEpV+u5rr29Ao8Bp7/RK5vbiF6VjpaAFBbbS65nsokQeER+Zc
         EJnWBl3QlI3m1Tdksy53OEBNpewO1lqVn5PyEz+f6k+2qAdncL+RjJxaIZ20K9OXS0C1
         8e9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101736; x=1790706536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
        b=JtclKAIWqxCLtkTkqlwNs4gedoQhB9TYrhPin/VLA7wMWunnFbp0yC7Axwv02HfMiF
         7hSu92rXqQzCb5osiVtmvo4yHpDA/uKfLA7VcbHjuD0a1Md51KMQgqttDNkVW8q6Hl7K
         F/iY6NctZ7PhQokGz7YR6TkY/P/BTSqzGm8B7L5iIqt2hJ+1GZ86DH0YE9J/FIVJxlPU
         0mgsyDr33RiQcIlYd8NZ6yFqfojIMotVeAuiXEUaiySNrE2ZqTYeAkdWuSTHfuMpTXgd
         MBLAJkSrTnOCHCEOoyAGY7z7+TbQVd8GGtL44SBM69LJGgrKxzmNM99uLoNPfPH9SALk
         mOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101736; x=1790706536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8X3rEi3yYXQtA/Wr780nU/kG57I9jcWzCAz3MJajWM=;
        b=f1mJKaXgNRhZI0LpQuZ0FcP18oi8LjLSJj7lecrlT7i2ABLkS9TInVhXjte88/Y6N+
         qWj8Oe+ESyKCyOVcRqb+5Odg2C+kLlxvgRqI3nAARiRvr4Wg218RdqE3Pd8aK6Qp0RaW
         IYDNSC0EZl5BF3yZP9oyfOIrfTycMQMMjT+hTFfGr2U8mn/WWEFxBfCna3Zb54bAG0LJ
         uItxttqsJkDsfC0GEmO/N4bYHLCKRTMoZkkHrSeroHRhLqrRq2ijKhg/PxkKcRv7LEKj
         oQATZVqc33lIFHURSDj7YgNKOsFyvE6h9A3Z6X0+ODLG++lj2OMOHFWpJBNNsQW6XC/H
         xhpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwGJ/H5tCQggiAsT255Idw7yHKI8s6nu+Xxw9kVuz55bv0MbMrVi5Q39sbtxl0qlSTLj/yroUeIleTZmI=@vger.kernel.org
X-Gm-Message-State: AFuF++m0kIjFLZb+I8Uu132o/GkeCxLao1TDFYMV4DZrWx8rMdaqcATv
	zaW99tgoETSaqclzzqUoXTX8Yla7Ywo/dRnirZMTAxh3AE3VfeGOrmSWPfwByXKpf5xRSx7aJXG
	LSKOejcBL8hQi9CMj5QrLC0++KyPCdtc=
X-Gm-Gg: AYBFou1/3NXm8y4f90w8s1Ix6OBni2i6DstnElgGN42ywOnnZytXyhfOPRo4Rtd0f/L
	Fq8PbFEFX61OohcOm//YSZshQrqLmKxj52RAMOC9PeW8Zfys+aYwehR6ixP9ltTDiLwqSYJUknF
	B+uMg120tljJmbnetS8jHRtQXYwXXIwfaIsxvK3jipxBrEovVGvG17NLZQ17VK8BncEOtIVTnEN
	v6HeL7UbNYDO0VHxdgWUQ4V+cLhegga4uUvDmP4fgNXR3FyPeirsoAl11DyyP2ta31rWsaYOKpo
	qsf8PvrRMmv4r4+D5SnFrCDPyHFQstAduF0w4urMvgCcOPAk5NG+qA4ijxUDiwMPTNWFzGNDNAc
	1BUF9t4zonUjVlFg3YNBp0g==
X-Received: by 2002:a05:6402:4518:b0:6aa:12f0:166e with SMTP id
 4fb4d7f45d1cf-6aab38a8641mr368480a12.16.1790101735486; Tue, 22 Sep 2026
 11:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKSQd8V28WjMcsfh05P5SNfXXvtafBH6fyiyqMzQ9GtU8fQGSA@mail.gmail.com>
 <f133c35f-b013-4395-ad1f-53765114d4b9@intel.com> <CAKSQd8WqQdNDoEqM+PZNHg-yr_4VJTGYdV=bCbYfRDyR7kUjbg@mail.gmail.com>
 <01a1d68b-a4e2-40e3-b3b8-c1046faa6c77@intel.com>
In-Reply-To: <01a1d68b-a4e2-40e3-b3b8-c1046faa6c77@intel.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Tue, 22 Sep 2026 20:28:44 +0200
X-Gm-Features: AcwNN1VsibCEVXUWfVOgXZYccRZ_iWDBoTKrTPQuJ56JBNJx_0IdVjmNLexMxas
Message-ID: <CAKSQd8X0bWYbG2VcU8T5vdFsXGrTy69f_xqBUs6Ox3oNHPfbrA@mail.gmail.com>
Subject: Re: x86 CPUID mutable return values
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 5:24=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
> I'm all for documenting this stuff. I wish it was more open.

Alastair is working on it.

https://github.com/intel/SDM/issues/16

> But I do worry a bit that someone will read that, for example, "KL is imm=
utable".
> $CUSTOMER starts depending on it. Then, $CPU_VENDOR decides that was a
> mistake and fixes it in a future implementation.

Most of the mutable values tend to remain stable.

HLE and RTM were needlessly complex outliers.

> > Based on some experiments, I think that VAES
> > does follow AES (i.e. is mutable as well), while
> > KL and PCLMUL do not (i.e. are immutable) =E2=80=93
> > so that's what I am seeking confirmation for.
>
> Are you OK with just checking a recent implementation or do you need a
> wider search of older implementations?

TGL would be interesting =E2=80=93 KL did arrive back then.

NVL would be interesting =E2=80=93 for the latest P+E =E2=80=93 but
we probably have to settle for PTL for now.

> > PS: Should Linux boot check/fix that LOCK?
>
> I don't really feel a strong need to do it. I honestly don't know why
> the lock bit is even there. I'd randomly _guess_ that Intel's
> implementation was not certified for $THINGS and they got nervous and
> asked to have a chicken bit exposed for it just so it couldn't
> accidentally get used.

AES DISABLE+LOCK were originally added due to
import rules in some countries.

> But, for Linux, the kernel doesn't currently munging the disable or lock
> bits. If someone munges it with wrmsr(1), they get to keep the pieces
> just like any old wrmsr(1) user. I'm struggling to think of a scenario
> where being able to twiddle either of the bits could be useful to an
> attacker.

If LOCK=3D0 leads to someone setting DISABLE=3D1,
then things will get slow, or do who knows what in
software. But then... armed with WRMSR to begin
with, someone can do a lot more damage anyway.

> So I'm not sure it's worth prodding, even if we think it's got a funny va=
lue.

Yay. We gave it thought, and got us a record of it.

--
C.
