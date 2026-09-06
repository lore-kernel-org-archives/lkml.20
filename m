Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102DA18C02E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712422; cv=pass; b=lZ9ME3QaxqnXtJxPmg8JPFfRRGltRfHNm0rvbAVvKZCXhB8XrYPhxOAIkqCCkFlgDoe6zZkHxaZPtSLL1vuOWsFqAh11tRf9J7E8C0LU6Pm56wbkWFU/j5YtSlb6l3UGp1LKl8lBC0bKvV3EDRuJo9M0h661fNA1dH3JuGLtngM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712422; c=relaxed/simple;
	bh=ACLX00MYnd5B2zZS8+Hc6cEObWQxmMwBk/e3V73tefo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvPbzs3PADSRZiKyqP6I8HjSqYyFUftxGD0W17Ff/JCZ4y6t1m0VkN0JjBogQpJTjClTFpndbmMs38XWQOaxmRybm77mMtLSv0ilgn82spXRfd0jhQQG9HoNEfWNPDbQSIO7MvN507GfosyKQmczN17M4cBiBKkNLBDluoODvRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tGCkXp2D; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tGCkXp2D"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso4932a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 09:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788712419; cv=none;
        d=google.com; s=arc-20260327;
        b=q9jTmsHKilw+7taa4hxYpJMp5FxUwVHyj1odormy6V6+DsdtH88yKM0hZHi4aO1Ay5
         YyPUtLDpa3rqAvYc+VKtxsuDKiEixr1jqivxvWH4ymDu/iXPFOY0Apv0OesDtRMfx1l8
         m6l6nH07E7HyBx6Vf27uVlal5n8fCpA4HtamnJGIZPOBR9tIySahZgeWrnrFOac/Uq+w
         wXmnU1aW5YX/b4+MIPGhN9qqOA2lSfqa1A0OVlSFqehliZvQNkIYzPSvo9WGL9Aq+Yx/
         q6YTvB1QqIO5oHJ4RCUWLJGwSvVG24VpP9AF3b3K3LakuK+f9D8ZWfUUBwhj+32Pd+i5
         BTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrpB/OwY6AJF8JL9/jLG6IYpsoLmLyv+fZHJUH/lclg=;
        fh=1PwfHQnmsGY7/YDvyQT3NcTYpg3WhDpmrrrS60TFofQ=;
        b=ghouESkzmUs0vleYm7ai2GwxEvMWbd+xdlf6fYx9jhGBnrlYpRSCigrMTb8RC9QwAc
         DB+aEnPHXz2gFxkcK2PRuhvsPd9QjZ/959hQOuHZk75ojijGrYKzorQjdJgH8AqZ8hUI
         gLkREnkwe7kYwFr1JdeUw8cnnRlOQVRY52wNdgaBbeGvH/Ims4pSwnIdHk/vISuUQK0r
         L710BeZOxHU1Ngm8pGAKsNI+MC883WpkRCj8wWXdvLinkoGIfiP1jD2oifzwhnkScLso
         mV7fyIHEzbDI1DqsMGLWvBnssST2Vk5jRuvDexdZ3NwdYGXzlJUc4TXL7RkJuvhGqePU
         j0IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788712419; x=1789317219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CrpB/OwY6AJF8JL9/jLG6IYpsoLmLyv+fZHJUH/lclg=;
        b=tGCkXp2Dh03oKHWoitx7dHVWG04OfANTSA/vQF4+PbEffbotdL5Zh/Zx7K3XGUZpz9
         sZrxSGzeFT0FL2lEN53ieKYl0FAJ2o2cfeAMoT8TzBLRwAWg8lWDk8SBXZzoCzuouKS5
         s9wBjUCS+5BT74mw32CcMFsVKDx/unXYbS8COAyGhPqmkWTBTHObmHEmVmUpsvRWcBA8
         ry0fg5KJv4c8DzQ1O7XnE5ZAYxCUzSn5MLEEa2vkXFRZZ8H/kt2cOIJA0aq7SUqbOVg0
         2u7vo2xET3d7PoQhGsEazni+OzmWyOoCAhcISHlLC19OhbqV3AkduJgB5f27QCvXNCsE
         VP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712419; x=1789317219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrpB/OwY6AJF8JL9/jLG6IYpsoLmLyv+fZHJUH/lclg=;
        b=bDOmSvTra+CARgNoj6tQZmL0rLfJE20KAEFJv2ftKgvNQV9rSdwHh/vrAvpW8inqPy
         upK1Mo83cOhis33HEzYhFUE975TbllPVkzKDohXWroVKmekAPNvbW6tYO11cbcMpmBBz
         t5o0XyjijTdnuxDJujoJETby2cp4UoG6OaKGlNjj9H3UHhfjf4VZSOee/wcT10qeEW4g
         lyQA/YKaULBRwBc/j9kXmfXMzBcy18EAslTni/0XEVJkFprS+iomAedcFuAmrpeGkWc/
         Bj6jJERqClPdQjUTMBv8LS2njCx6JKYbo1+qzs269AFi9SJYdaPz7Nr5eCfgtmBsbGqX
         NoXg==
X-Forwarded-Encrypted: i=1; AKwUvBzab6odJVP+Wb02rIEpybqWnoit9brv8ZE0LhtK1KFaEXOlmb5eLsAQeikn8Lau4IvdiAzsdBRUI1LczdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lLomko2+MOhz1oGveWW9p2kSDdUWKIP73C/bLaGklwCmhkhQTC
	hYIT443bR9QE6jL5NrRnN383VMfGDUD0RzauHGKyOAwuV0z6XQ1RJXhYqbyyqtI7kOb9FDtQDlf
	M6SGmNiD8NWglSzp7AFxxw/z23a3LFZPQb56SI3/l
X-Gm-Gg: AYBFou0t+akXe/u4UJbnNomMoNMRmn8r7Vx2ZRsLTK7V4KQ0JV84ZHIDncyvlBDnnRq
	P4vv3AMF89nHUAdXjAQ3LHE3L/0GHY+x2Yhnc7BtsIfPH+yhi46Ze1gR42HUnDAFl+rr074OqF1
	/gjRktzBaLeZab64jkQwpGmSaKdEXcZqtC9YOjDHvf315jctX51+i3zReLn758Ho3nL9zLLYq+A
	V59wEvBJiZ+7TQGPi3LUfQJ4mbOx6KN1xDQFHCPXt200sGZVNkXrCSNzKrArYRCj/XAHARhzUH0
	e8WnkVQAG+E4zCbNFHY1lLAFudfdr99BZqwsgg5aVPrF
X-Received: by 2002:aa7:d8d6:0:b0:6a6:6ded:b4b6 with SMTP id
 4fb4d7f45d1cf-6a7f689d0femr33485a12.13.1788712418519; Sun, 06 Sep 2026
 09:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net>
 <20260824123954.315112-7-zhang_wei@open-hieco.net> <CALMp9eSoLMx6DLH=Ve5_r7y=0EOmxjZgJWE_fLM_CAYxOvJdkA@mail.gmail.com>
 <f187e4d1-9d31-4e54-a75b-b724ed5d0e9a@open-hieco.net>
In-Reply-To: <f187e4d1-9d31-4e54-a75b-b724ed5d0e9a@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Sun, 6 Sep 2026 09:33:23 -0700
X-Gm-Features: AcwNN1WeNE2aRN_GHL9nwnL0ZDXpzLpawxwnNQXYe6q75jXTytwFkMh9kfGuDBU
Message-ID: <CALMp9eQQY-Tu3C0QLMe2kxvt=__Fq91dLtzA=fbTDNc_Av7Gew@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] KVM: nSVM: Fetch missing DecodeAssist bytes for
 synthesized #NPF/#PF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 11:40=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
>
>
> On 9/5/2026 8:39 AM, Jim Mattson wrote:
> > On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hiec=
o.net> wrote:
> >>
> >> For a synthesized #NPF, the emulator fetch cache is not guaranteed to
> >> contain the full architected 15-byte DecodeAssist window, e.g. it may
> >> contain only the bytes needed to decode the instruction.
> >>
> >> Keep preparation of synthesized state limited to capturing a matching
> >> emulator fetch cache for #NPF.  When constructing VMCB12, copy those b=
ytes
> >> and fetch any missing tail through L2 guest page tables.  If no emulat=
or
> >> bytes are available, fetch the full window from L2 RIP, including for =
a
> >> queued or synthesized #PF VM-Exit.  Stop at a translation fault, read
> >> failure, non-canonical address, or CS limit overrun.
> >>
> >> For a non-64-bit L2, truncate each incremented linear address to 32 bi=
ts
> >> so that a fetch whose CS.base makes it cross the 4GB boundary wraps as
> >> required.
> >>
> >> Do not perform tail or fallback reads for SEV guests.  KVM cannot read
> >> plaintext instruction bytes from encrypted guest memory, and the exist=
ing
> >> SEV emulation path treats missing hardware DecodeAssist bytes as
> >> unavailable instead of decoding guest memory.  For nested SEV, report =
only
> >> matching emulator bytes already captured for a synthesized #NPF,
> >> potentially a zero instruction-byte count.
> >>
> >> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> >> ---
> >>   arch/x86/kvm/svm/nested.c | 58 +++++++++++++++++++++++++++++++++++++=
+-
> >>   1 file changed, 57 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> >> index 635ff20cc431..c677ad5df8d6 100644
> >> --- a/arch/x86/kvm/svm/nested.c
> >> +++ b/arch/x86/kvm/svm/nested.c
> >> @@ -87,6 +87,54 @@ static void nested_svm_clear_synthesized_insn_bytes=
(struct vcpu_svm *svm)
> >>          svm->nested.synthesized_insn_bytes.insn_len =3D 0;
> >>   }
> >>
> >> +static u8 nested_svm_fetch_insn_bytes(struct kvm_vcpu *vcpu, u8 *byte=
s,
> >> +                                     u8 count, u8 max_bytes)
> >> +{
> >> +       struct kvm_pagewalk *gva_walk =3D &vcpu->arch.gva_walk;
> >> +       u64 access =3D PFERR_FETCH_MASK;
> >> +       gva_t rip =3D kvm_get_linear_rip(vcpu);
> >> +       struct x86_exception e;
> >> +
> >> +       if (kvm_x86_call(get_cpl)(vcpu) =3D=3D 3)
> >> +               access |=3D PFERR_USER_MASK;
> >> +
> >> +       if (!is_64_bit_mode(vcpu)) {
> >> +               u32 eip =3D kvm_rip_read(vcpu);
> >> +               u32 limit =3D to_svm(vcpu)->vmcb->save.cs.limit;
> >> +
> >> +               if (eip > limit)
> >> +                       return 0;
> >> +               max_bytes =3D min_t(u64, max_bytes, (u64)limit - eip +=
 1);
> >> +       }
> >> +
> >> +       count =3D min(count, max_bytes);
> >
> > Ugh. Pasting together two partial reads performed at different times
> > is egregious. This function should read all 15 bytes in one go. That
> > pretty much renders the emulator's fetch cache useless, except when it
> > contains the necessary 15 bytes.
>
> This patch was based on the discussion from the first version of this
> series[1].  My understanding from that exchange was that preserving the
> bytes used by the emulator and fetching the missing tail later was the
> intended approach, as it retains the bytes actually used to decode the
> instruction.
>
> Did I misunderstand the conclusion of that discussion?  If the
> preference is now to avoid combining reads performed at different times,
> I can change the next version to use the emulator fetch cache only when
> it contains the full 15-byte window, and otherwise fetch all 15 bytes in
> one operation.
>
> [1]
> https://lore.kernel.org/kvm/20260629125205.52394-1-zhang_wei@open-hieco.n=
et/T/#m3fa3f64ddd3284b312d3ddb44fd30a2e26708037

I still don't like it, but Sean overruled me, so I will be quiet now. :)
