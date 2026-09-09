Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B8833E36A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936771; cv=none; b=pN+IdTC3bvmJrbFdGvLjs2qZoicza5OM5Li2uNPewLpBsuPukYWPgrWgjki9FYn/MJIRqrNt5xiU1sT8yY6e06uN1DHSNveX5cFyMAux6nV8TH7RwJjgAXkfyvDi+s7bS3lpFzUqE4xZKAOLW9Cybr1S/iOWUyDObEiRHJFhzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936771; c=relaxed/simple;
	bh=/3ZwDm9+bTrvaAe2Rt3yKtt3btJtNucJnyLnBSRrLIU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Amy9C+g3TZbfni3fApYiDpTgDpj8g+BcH2mhhcWkKZNYONQhmYMYyUSkHHNL4QeGlgBDKJUoTvPSOnjIHCh6IKT16vUaXWeMTfC9r29EJcMC2ZBlSsW5UPh6IqxypDOMEkeRcofsWdXXkpzDIJ3aloWVj8zEu/4/0HIZheiAqTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Flz5ridc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Flz5ridc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356257so818735f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936768; x=1789541568; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OjVTYo1HpRW2IUi6y6KzSORlT0uOvmPBVl8YlcyvYsA=;
        b=Flz5ridcc8H0Fd0WPdtcfpPyztWn+Euxju9u2oQz3y+k5WaXOx2/YIGi+JI2OK5dqd
         wu0uECiNzLZkT+wQfwx2oC9VI6vByTZ8DT26yKbFhdtbromQnhKw+P221/wTxzTV2Af7
         1JcMnOtLx1h9QpT8SXBMaGlpWCTC1ZotDvLVQXF9Iv6ummjQebURcLBazHTFLY2jf44J
         LtLUrUnUkOK729KI9UNDh0zo2wQdIvzrHUVmi55Tf6BbEGOGpXUYs6J9GGDQ8B39pNGY
         IseRhS28us84H43evdasnoGbxHEyXerv477K5nxs160LE5BvW2vCLMVngpL5VP2N517B
         7ZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936768; x=1789541568;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjVTYo1HpRW2IUi6y6KzSORlT0uOvmPBVl8YlcyvYsA=;
        b=CnkhBKLiGO2DQNL46UUeHPrdiQwCfY+Q6cWuALZMqsK5CBFV2P7UgiPAd6Mmq4XQ0i
         ZfGboi44qesauBOxFF9MYPLTbXZCKyVHV1kyfuUvTfVfSDw8QxaPyTk6O4tMAjcO4+7p
         9r9xt3t5p804y+1VplF6WDxIaU8P1FS4KTQWxabUmmmt7wFLhBz+rS4R1ceh8Fcxs4RL
         iqynuhNHOgCXVCiqdl4nAKJRVxLglalCbFYsQ9AiDNTL08Cin9iGNApKNWfkS0sfc8Fd
         FL2u9UjqYjfUj6uikw8qaQw+M44YeB7c6kcmEx7mwDT/8uWbetHebo0OvIReOTxtQaJi
         2Gng==
X-Forwarded-Encrypted: i=1; AKwUvByPOrbhOrqFTlxkeoXnJqOeGxn2T3s471O9EkvBMfjg+jvPgtkOkaNPqCZQF/Ho4aQ7j4NpjO41fxNGIOI=@vger.kernel.org
X-Gm-Message-State: AFuF++lY3cDJYwhF9cQGyt/i2HqHQaA1vVSHMEanEcONj2zjIWoRqM0P
	eC+km0N1JDUcy/f1mP1uMFqwuyGy4NCAepCvCWHH5nN0xfLiBXqFRLVw
X-Gm-Gg: AYBFou1uuyEXYDg/m+iiZyguMuZnINksgZzPNDeLApNNlf4oRpQD856i6N8rrZRoO4r
	1Q0w6nAbn+ysiCrvgm+ECoG6n166A6z2BdEbWPUHe52a3A7gS/lFTqDz91B69g6ksGLnzAEs/Ok
	qxXWOe/kOSeQUyPXEEfTbu8Iolsuz1WchwTPIr2bt/Zs5tuguh3WbRCllQym+sKlgPcb/shWPUA
	u9Xyyu3r/5NAe8ZutEUesW0MhfXT1F/cg88zM9Pzl2yLpR0SI2AL/isKMcQ3RmW2b/VyPD7bkUi
	gGekjjmdMJt8RXYCMk8uSaRVWXC8fbpRkeTy2bmLiOTM1K0/YkCdN/c2Ibkp9zF54gBC4xVtb3X
	l8dFJ74jJ+9i9jEFMyac8aX4ucv8z2oLSU8HxghMAEmVQ3/oMGKbuJJ9LWxmpqw11A2MMLgAFIV
	pmqzXkLIMOBaGUSizKNR+XoqalyaUXQfB8AaXy51GTDmkDiVLdknefF0zfjvEX11hYE8/jmeLvV
	H4=
X-Received: by 2002:adf:e10a:0:b0:485:8ca6:5ac5 with SMTP id ffacd0b85a97d-485a2443b9amr11571339f8f.22.1788936768072;
        Tue, 08 Sep 2026 23:52:48 -0700 (PDT)
Received: from [10.245.244.251] ([134.191.227.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm41318447f8f.18.2026.09.08.23.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:52:47 -0700 (PDT)
Message-ID: <5faff363852572d59e34c876173d73c93734bd3c.camel@gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: TDX: Validate directly configurable CPUID
 bits
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "kvm@vger.kernel.org"
	 <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "binbin.wu@linux.intel.com"
	 <binbin.wu@linux.intel.com>
Cc: "Gao, Chao" <chao.gao@intel.com>, "seanjc@google.com"
 <seanjc@google.com>,  "dave.hansen@linux.intel.com"	
 <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, "Li,
 Xiaoyao"	 <xiaoyao.li@intel.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>,  "andrew.cooper3@citrix.com"	
 <andrew.cooper3@citrix.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>
Date: Wed, 09 Sep 2026 09:52:44 +0300
In-Reply-To: <58c185c82658819454a9950f37c6424226a098bb.camel@intel.com>
References: <20260827031837.2863609-1-binbin.wu@linux.intel.com>
		 <32b51faabf60f6e87d9fdebbf2c3fe5a45fbff1c.camel@gmail.com>
	 <58c185c82658819454a9950f37c6424226a098bb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-08 at 22:31 +0000, Edgecombe, Rick P wrote:
> We are kind of discussing what recommendations we should give about how
> msr_preservation.pdf should be defined for new CPUID bit based features. =
So
> saying to follow msr_preservation.pdf is self referential.

OK, thanks for elaborating. The e-mail was vague about that.

> Again, please do not treat the TDX specs as something to be handed down a=
nd
> "followed". I think this is something to get used to for TDX. I mean, ups=
tream
> never wants to adapt to platform arch that fits awkwardly, but it's even =
tougher
> to swallow when the arch is mostly SW defined. And further, the people wo=
rking
> on the TDX arch want to hear such requirements from upstream.

Agreed, that matches my understanding. Reminders are useful in general,
but this was not that case.

> Here, the thing to discuss is how TDX should define new features that wil=
l
> clobber host state (e.g. bits that would appear in msr_preservation.pdf a=
s not
> being preserved).
>=20
> There have been several PUCK discussions on the problem this series is ta=
ckling,
> and actually several attempts to solve the problem during the base series=
. More
> recently a host clobbering control was proposed that attempted to make it=
 safe,
> but it was not accepted. That proposal brought up the topic of whether ha=
ving
> select states clobbered was actually an unproven optimization.
>=20
> Now that we are moving back to an allow list type solution, what guidance=
 should
> we give on this other surfaced topic. Since TDX shares some save/restore =
logic
> with normal VMs, we should have it work well with that code. So forgettin=
g about
> the performance optimization question, how to have it work in a sensible =
way
> with the shared code paths.

Rick,

In general, the TDX case and the VMX case behaving the same way is
best. I thought that consistency is always obviously a good thing,
but let me acknowledge it explicitly.

I was trying to dig deeper into the proposal and analyze it.

<cite>
The proposal is to have TDX simply match VMX behavior, i.e. on return
from TDH.VP.ENTER, state that VMX would restore from the VMCS host
fields is restored, and state that VMX would leave as the guest value
is clobbered.  That keeps a single model for VMM, and means enabling a
new feature for TDs requires the same work flow as enabling it for VMX.
</cite>

My point was that hardware behaves differently for VMX guests and for
the VMM<->TDX. This is not about following "boss specs", it is what the
SDM describes.

For VMX, the VMCS host-state area is loaded by hardware on VM exit
(SDM 27.5). For SEAMCALL and SEAMRET, the SDM seems to say they operate
like an SMM VM exit and a VM entry returning from SMM (SDM 35.1), and
those save state into the guest-state area of the transfer VMCS
(SDM 34.15.2.2).

VMX:
  VM entry =3D load guest state from guest-state area
  VM exit  =3D save guest state into guest-state area,
             load host state from host-state area

TDX:
  SEAMCALL =3D save host state into SEAM VMCS guest-state area,
             load module state from SEAM VMCS host-state area
  SEAMRET  =3D restore host state from SEAM VMCS guest-state area

I may be reading the SDM wrong, let me know.

So there are differences, and I was hoping to:
- Be corrected if I misinterpret the SDM and how things work.
- Get comments on whether the proposal took this into account.
- Get comments on how this affects, or does not affect, the proposal.

Thanks, Artem.
