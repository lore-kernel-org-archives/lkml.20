Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73A379ECD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667736; cv=pass; b=KPUBKLwMWFBGfNSZonvIeXwz6Uyymbs0qkoQm/5XX12Eoazkuf8M4xy2n6tIGJc7gdDQHQafamsONjby/we/IRk7LrX/QlhrwcXYlsvU9hvlrxzLoRrSNhQp0kEy4P7ckGZxFBuasq8IXuASrRFqA8u2qJTiwSsQmvr0zbn4QFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667736; c=relaxed/simple;
	bh=7ozGsQBsk7C+sfsWX/0wWv8JTr21QymYmr62yTXlBtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JN3lbYZsP0soa0Cn/LNQMX4oO/6eF+T3yzwCjC50mPtjehAhziOLtvIll/eX7KY4NeReP7OLzX/rwYtnepWjb6hhvLIPYBdqDgcYnJcRCf1CDGycI5qWGrMseJP5yGAWoaNScOC2ZypL4mwyAO3TaJ57Lv62gpn9qorcvXtFJUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzdLUkQO; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzdLUkQO"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2aff2c45efso338610566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790667733; cv=none;
        d=google.com; s=arc-20260327;
        b=UQ7OeAHgthHln9b0Kb2GPBIr7LVCAjV2zbf/JJUw97XDRL9OXKZCLWFNzFnU+n/Snn
         LTeN4u0MT0MLtlZjG+8fRjWNc8udFRy5eCPd1xXFs+/lNvUOogJlCyuxX8ZLY/qY27tS
         Ww9dPJ3AY46D4tIFVBZ/VH5KCbJRmDP+SRnw9dJc3UOAwynQP3iXiFO55KMyhk+ozqj3
         49SXZpxvfIpZSG+rsF2jmjToBJVOXT+QYiJlIE4I3o7wcExWjyBQTmkA1A887BFHVbe+
         CrXpyapEgYIRqUERW/zSDxVuaW878iwun8CTXZOBTYAPWzJj60UIdeWGGtiRaVHmMZ0L
         QHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SP59Zw6KE8fcEQDcR+PmgkfMu0IzhpORphPijIjqnwY=;
        fh=gZ+D9fU8sAAUAmjvFICn3EDYQifNvfv00xc4p3vVfVA=;
        b=J2GSolkGPNt+almV4Bp0zveDvugt1q8RLZ0RlLf19vrmU+Enpmkyf3koYQYsUFGAGW
         l12nGwi4Bnt3K3xTuIRXWgJnghwUNDy04KliLuSTruLbqaERqXI/MyX88QwXQfUS2o7x
         K6c+omAsXFhKsVS0BwspcQp5TamS3LqP6f7aERvzNM4Vj1GCOBfrsb0viDOQxgiBTiQx
         +5sSeY4XevoW++99p35RXRIytJuXrr4+2I5C9qa0Bn82tmowm2PrmKtQNRSaQhiuAPUq
         B2Gq1YA5fw7PRfMcHCuNWanLeT3HegrG2B94vdUCs6ytvqjg2jS8WnhA8Owg2v+pxvdw
         rWMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667733; x=1791272533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SP59Zw6KE8fcEQDcR+PmgkfMu0IzhpORphPijIjqnwY=;
        b=TzdLUkQOMuhbEr+omGnLF1E2IyvYK98nHA5BHpCFzc4lLTTccl/YqhwembVc7XMKIE
         EaEvpjyy/hn/dGN5ro2w9hobGeHslEHBKPB3LAd16klML3tme2A/IklhGBDaesEH7QE0
         nBcuYjrZXYnchbjqqp/3BPRENAjryV4cf2BK4icexAY82IF0xaiUSvnp7tQcbxKn9C7D
         IN/BIje+zzT/Zfa46cXk404JODo2r7fTVe4sx9myesSDGdO+6zSaGsnY56WyAFyJz+CJ
         sVsx8bpMG2G2ZhqL3/Ats1N2SHcsJ5/aIIbeteOx/4g4C5M6g2bSFCWC7K3ecYkxLeml
         uKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667733; x=1791272533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP59Zw6KE8fcEQDcR+PmgkfMu0IzhpORphPijIjqnwY=;
        b=CxVG0vrJZb2OGK2EGgcobz/Bay4/zGMcARYeVVkl8svYMzMFNMOBdPDsFt5vSQHBy+
         QFqRe4iCAmcF22zJhwJX4lJrNEWW5zcYTeIpWv83369ErtqP+hXcugXB6rx1696fTAZ3
         cQaV0BA4Ss2oeGbHADn12UqnORVC+plqPwb+xvfheMvDklfuMXYij+kXgHe8JCINfsgO
         AOD9Lb9pj/xQtLLdabPS6FisukDqGn0fXekD54z+SDsLyak6BJEcV/ezils44Eb8VEhE
         kUVgC5zIwXfY/r+1eoFIMuhkgwR4bMq7JDIVDScEEhkPWBuzyqgohfC4biKAkm7LV6JN
         Eq6Q==
X-Forwarded-Encrypted: i=1; AKwUvByZzWdL5ziOEsnMAhJnS/STe5x9x0B9k5wh8ixRmZptABp9Cx6cJHhj65EDFxOi3w8lPFR9OoJW9HO6+9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1dsZx+wN15XLWp5IQAYTVOhMNfWq56UShCfcBnhwcaSFMEWQv
	7hkkjdB40P4IYAfYStF8SE+yptFZKvmKMYNTCT0DV0HKpbN+6ndLZJDmvX7hVWxwA0z/KVt8jmU
	NX9hqx7+UV6xStocC55etVATDHTPK0e8=
X-Gm-Gg: AYBFou2cAsSYgGW+17NoILI4HhMvsY4k1Nxuwne40sS6FiY1xsgnp6iPgkHugBouh5u
	UAspgT/sPV21tHkrR+Xxg5N57L83vitgViZF+TOPgj8vV0i9yQ0J0EMRrzhefZcphu+/Add7qdY
	6eKuOeLKa2IMR7MQ6lozfx+hZGCVlYzEKfWx5U9Ge7aU0NGVWg4QPqqiYnfkP79mAV3urX/muS+
	m/qV1C9Vd/ZxoFEWH65bnemCM+6dhwtUvjlUUNb4qKqFlg25c17M6nDTuCW1vf2mhH0cUi/p0Ni
	0OmPZNuxNvLMYo+jDP4Vn+kzHDkXJsktodKwXpI8YwfNLBsbpXRRVWyr
X-Received: by 2002:a17:907:cd09:b0:c29:512a:4668 with SMTP id
 a640c23a62f3a-c2ac24c1434mr1275119166b.27.1790667732744; Tue, 29 Sep 2026
 00:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANypQFabseTuRiyz2pGkc_Qj0moGDnY7KEp1qdTOqkw6gAL3hw@mail.gmail.com>
 <20260911183811.374433-1-aliamemis@disroot.org> <CABXGCsMfJwgYQ6nToU2PkyZeKHZPD4K=ObYtsTx87NvhvM0xBg@mail.gmail.com>
In-Reply-To: <CABXGCsMfJwgYQ6nToU2PkyZeKHZPD4K=ObYtsTx87NvhvM0xBg@mail.gmail.com>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Tue, 29 Sep 2026 15:41:28 +0800
X-Gm-Features: AclHuK-7L_Wvx45BbyueV30Ar5vM9zdOLjWHlDlAJRJa7VeHFfnPEeUYbbc246k
Message-ID: <CANypQFZ9Fz-PFYG95otQu9Gr_wTnxbTYgJ_i+Fcej8pfFXiCTA@mail.gmail.com>
Subject: Re: [Linux Kernel Bug] possible deadlock in l2cap_chan_connect
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>, 
	marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kees@kernel.org, kuba@kernel.org, 
	nicoyip.dev@gmail.com, suunj1331@gmail.com, syzkaller@googlegroups.com, 
	Pauli Virtanen <pav@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=
=9C=8829=E6=97=A5=E5=91=A8=E4=BA=8C 15:26=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Sep 11, 2026 at 11:38=E2=80=AFPM Ali Ahmet Memi=C5=9F <aliamemis@=
disroot.org> wrote:
> >
> > On Sat, Sep 12, 2026 at 12:59:09AM +0800, Jiaming Zhang wrote:
> > > We are actively working on a patch, if the above solution is acceptab=
le,
> > > I would be happy to submit a formal patch for review.
> >
> > This is the same lock inversion syzbot reported as 74071deb, and Mikhai=
l
> > already has a fix for it under review:
> >
> >   https://lore.kernel.org/linux-bluetooth/20260904012028.77590-1-mikhai=
l.v.gavrilov@gmail.com/
> >
> > It uses the same approach you describe, queue the confirmation and let
> > krfcommd handle it under rfcomm_mutex.
>
> Hi Jiaming, Ali,
>
> thanks for the report and for putting the reproducer up, and thanks
> Ali for connecting the two threads.
>
> The deferral Jiaming suggests is what v2 of my patch did - that is the
> version Ali linked - but that approach was dropped during review.  Pauli
> pointed out that delaying the confirmation makes it hard to rule out new
> races against DLC setup, and Luiz asked to break the cycle on the connect
> side instead.
>
> v3 does that.  The session socket is created and connected without
> rfcomm_mutex held, and the lock is only taken again to put the new
> session on the list:
>
>   https://lore.kernel.org/linux-bluetooth/20260912100315.151674-1-mikhail=
.v.gavrilov@gmail.com/
>
> That removes exactly the edge in your trace, rfcomm_dlc_open() holding
> rfcomm_mutex while l2cap_chan_connect() takes hdev->lock.  syzbot's own
> reproducer no longer triggers with it:
>
>   https://lore.kernel.org/all/6ab100d7.71f81b7d.15fa6d.0029.GAE@google.co=
m/
>
> v4 will follow shortly.  It adds a check for the socket being closed whil=
e
> it is being connected, which Luiz and the Sashiko review raised on v3.
> I will Cc you and add your report as Reported-by and Closes.
>
> Could you run your C reproducer against v4 once it is out?  A Tested-by
> from your side would be worth a lot, since your trace hits the cycle from
> the connect side, which is the edge the patch removes.
>

Hi Mikhail,

Sure, I will run my reproducer when the v4 patch is out, and report
the test result as soon as possible.

Thank you for your contribution to fix this issue.

Best Regards,
Jiaming Zhang
