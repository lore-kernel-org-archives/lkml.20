Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC65A41A4EF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066648; cv=pass; b=fbk94pVlUwx74OJuK91SowH0W26QIyyQo9k4VAEdwkHepwjVGStKmXjIlBXUKUBihQifKPTHSX4+Q+59mQzgEEYLpec4ncyUhTVUTVr//+HZBJfUTAvakaKD470uxUQSAP55aVfEcJOE6PbFN0ijgm4M6ycpcTowW5nQMIAsl1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066648; c=relaxed/simple;
	bh=3eIftdr+HqakZAShd7ietE6WeuNrECUgzUYoSHnLGuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJ4jMb3cfBMkijT8yCtFyOeL3A3c9izmbyNtol3XvFhSOgxCgc5SfrJwL+WYV9nlboSRSFAesE3lQmPj+lZw8AVZumzkOmup/ubGsmbg6m9Ky1DS6uagdSNYlXgnWcQUhPVeETaPKb38DBN2tnU6Rh/GFslX7Y7WASStm0A0670=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoMJGwQL; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoMJGwQL"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so6331366a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790066645; cv=none;
        d=google.com; s=arc-20260327;
        b=W9/9uJaldl+jP+idb4H4agdOWkCK/bUpCfkw6B4a2GNJpsUHwdgnVInILpn44dUxlo
         X3C1aZkd31HO4B292zESLshm95/6FWa4vSDs4xnlZdT0BcrCCCITQsqL0tcLNAF33ZAt
         BJY6reeYiswny2nMBNFR48zgMczMTwu7Hzrr1W9vj337SgtHepNrUlMc7steh5ZkGSnP
         cApAKyzHZinbTYT5tFtMfavERvw7lgNHWJp1QhBG/7uu+xWDitSO0iIUxe0JU+98DWc7
         8rimWjEmZyfX/Ow235o4M/XLiX3crEsj0m8OqBSDPKigLyOJVws+r51jtMcE8OR7JFZ4
         yDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=65vILECszTrDkUEoa8AEJpfWp35NiurtkMpk0mo7UQ0=;
        fh=xeL100DiIajdtMM1JufB2riKVEcU3B2vA3CMa24qfs0=;
        b=QlSBiOAEAZwooHSP0nf7UruSCgUvMVGJNDHKRKrvrc9pW18gDzXLEmbEPgdKWuHir6
         RMjpXUXTrEmZZqajDmmYLXE3nBLsb/2yjh/TU74nfF12ojUJTqQkc+y0c8Uclontb1Ay
         rBPX8yGFhmLdGifzyj4/PEN2PTWvUw2gxOldamQvfSfr+dUtmD4N4H4hsiVZeMPgyicz
         wYDF24FJCITXAB22zzTqDq2CMdfUC0S2HXLOc+7xwaqV204pt+YTRmcfXAO/V0mM5rMu
         WQSidKg5m37qPa4wCMO+1dGHmwk7u9bXjd4rJYx2v7PzJC1axSi+SjZBYCRXG4xhLiDu
         v14w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066645; x=1790671445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65vILECszTrDkUEoa8AEJpfWp35NiurtkMpk0mo7UQ0=;
        b=eoMJGwQLDl3hjrSBmK6W2INexYoVcmtKmBgNVBGxbrXsgWPBeRRBhDusdlei/c2jLB
         tA82s6gWY1FLM1M9U0SAJCeyDXB2kRqSmmpPig2C/gAQ7wXcWYSHBlvxV1AaZqyhaDsj
         bt0xY/JOTkd5RQiTi1TBBOiuWSkEK3nLZqS2id1D3VdPfxxvuxXrQSfgen8UeD5pzgQz
         tG+dkqO1+WrIXcUzolZ+51w2DfrFja7YLu1GCHJkQfJWiYw4N01buQ+fwldajYe1VGMj
         0vKGKlbUAXB0sBp92N7wESETEK3MpJDzqVC5FK79TH2R2SJ2aL32InF/BJFa4RCPUs/3
         Epdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066645; x=1790671445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65vILECszTrDkUEoa8AEJpfWp35NiurtkMpk0mo7UQ0=;
        b=xu6+1q9UIkrCIeKPqUCbL2ge582l+BTH89l1sAVvNJSQTaYz+4DaCk/VFvAni3R4ve
         yg6ykLg135NjE1Famrkr6OUg1dTTwMjQyFbxITARnn0zT7QkUECDkffpCXWGh0yvCBSz
         UzMfCl//hTCJaKylxJ0d81zExGPOgT7t/iAIXXoVw7k5mDGlAXEV5LH0p6GYzx5TWgjp
         f73w0eGzp73hps7bIf8uAnWUxuJ+b1HmtewzkpT18Jy35tmZqBVr3OGt6GM1tV19iiv6
         Zj0+MFQimAj9NvxvODm4f9aH08roWIeFSCK/D3/z4Loz8Api+tcy7H4TVL0VsAStbP1m
         yLRw==
X-Forwarded-Encrypted: i=1; AKwUvBwl4Cy4hfMCuGPom1iWU+botEeCca1xhxbfRCC41IQc8xXONmtfvV8HmYsHUQ9ZF70LKUTSJUao4DnUXys=@vger.kernel.org
X-Gm-Message-State: AFuF++lKTUWd0T+28QFrzvF7Z1tWBes9tQ5EUtqPtrcT9oEa9pC+D4oR
	GuFi1x3JBkYCtD9Cjga/PLOYuWfpHwJLFw1E5eOK6ad8LKN32ZMEEpPZN9bD9uVObTSG8WAjfY5
	OfQ0+AXNY14mEN8a+ASC+PS4Az2lNYRzy+USOyQWiZjRm
X-Gm-Gg: AYBFou31GV6biT6XD+MjgKatKQS4fo7pAmboVcuAxGmDvOehgKVzpDjIMYT63ebl27+
	h95VvOi5/7kNqoDzi0LmI1wgBvrD89aiebuZMtwts6MW/FGkATP4PMe2QiSyvrmYzlcibzYjY6l
	1vdkrKaHvs++7ss/UGdMytRps7w60+fYfqDrp9vc1oIRpvCLZjuuoyjmCTSzeygCN/wyQPIz5dN
	RS0q+cgoKV4PzlLuD6CHo7CnnZHa3UQ6DtL3qHxrHmYt4GcPndgY8O9RupdRrlQ6ZYbag6NPiNC
	5ppnTQI9eXUoFC+ht9kE8wgaaZxZbx7zE3GlAuzpLwMIl+zWCYQPgj6Bitax4B5atwc1tRmfK0C
	RgsU7iYCV7vI=
X-Received: by 2002:a05:6402:46da:b0:6aa:486d:96f8 with SMTP id
 4fb4d7f45d1cf-6aa5798f026mr9285732a12.38.1790066644884; Tue, 22 Sep 2026
 01:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKSQd8V28WjMcsfh05P5SNfXXvtafBH6fyiyqMzQ9GtU8fQGSA@mail.gmail.com>
 <f133c35f-b013-4395-ad1f-53765114d4b9@intel.com>
In-Reply-To: <f133c35f-b013-4395-ad1f-53765114d4b9@intel.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Tue, 22 Sep 2026 10:43:52 +0200
X-Gm-Features: AcwNN1V1oXf_XeQyH785ByMW-QMuBoGsa9e5ET8qsJSEeIcT-lxdR1I3w5kq6xs
Message-ID: <CAKSQd8WqQdNDoEqM+PZNHg-yr_4VJTGYdV=bCbYfRDyR7kUjbg@mail.gmail.com>
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

On Mon, Sep 21, 2026 at 11:32=E2=80=AFPM Dave Hansen <dave.hansen@intel.com=
> wrote:
>
> On 9/21/26 11:36, Christian Ludloff wrote:
> > Q for Intel: is MSR FEATURE_CONFIG 0x13C bit 1 expected
> > to affect CPUID 1.ECX.25 and 7.0.ECX.9 and 19.EBX.0/2, or
> > just just a subset of them? Also, what about PCLMUL?
>
> Are you looking to document architecture or implementation here?

Just the reality of mutable CPUID return values.

Because it matters. When trying to cache them.

> I poked around on a few pieces of hardware I have within reach and all
> of them have the MSR FEATURE_CONFIG lock bit set and the disable bit clea=
r.
>
> # rdmsr -a 0x13C
> 1
> 1
> 1
> 1
> ...
>
> In practice, I suspect the AESNI CPUID bits are immutable.

If the LOCK bit is set. Which is recommended.

But apparently not always done. No surprises.

> FEATURE_CONFIG's definitions also looks model specific in the spots I see=
 it in the SDM. They're also not identical, interestingly enough.

While the verbiage across documents mutated
a bit over time, the functionality of DISABLE as
well as LOCK seems to have been immutable
ever since WSM and GLM introduced them.

Based on some experiments, I think that VAES
does follow AES (i.e. is mutable as well), while
KL and PCLMUL do not (i.e. are immutable) =E2=80=93
so that's what I am seeking confirmation for.

> Honestly, FEATURE_CONFIG looks more like something that should have been =
in the BIOS writers' guide rather than the SDM.

I for one appreciate that the SDM attempts to
provide a list of mutable CPUID return values
and that it has the FEATURE_CONFIG MSR.

After all... the most recent public Intel BWG is
more than 30 years old by now [aka P6 days],
and https://en.wikipedia.org/wiki/Appendix_H
was a thing that also happened back then.  :)

PS: Should Linux boot check/fix that LOCK?

--
C.
