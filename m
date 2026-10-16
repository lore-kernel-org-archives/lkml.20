Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2AA2F7EE1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146957; cv=pass; b=FYEdRXmEErynq7MdABUM/0Hm7w+f3HpIfIhVd50skSIk2T8USAAzP3nirS3ieUveW8XE/5lTifEPuSsBDvlcb80GDPL7uVlac92MWVjKCSRDPvBO8sBDHYOvwtpGzLyJoIFHuauOk6doqHdwr2fQ7hq8Dwbo8cQE9gC7/01uKKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146957; c=relaxed/simple;
	bh=iRfVm8IL1MFnh3TXtWSNTqHffR5dbb9ebdI9wSrMS48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyiT42O8W0XDXcGfnYXJDmLIN+752CAuFfGBrCAW8Zl6wGU4B05w4A7IzMjM2V8mMRZVk1a06rWNdbGA9rpMgO27MiQYuPOkxAQ97HH15+cIuKgX4wp0u4SwhtdwdWctmS3VkYy2v1eaMwvkZXufI7IsKfs2rIlsTSPUuWiik+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDIyBTxh; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDIyBTxh"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8871ada1a26so25655817b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792146955; cv=none;
        d=google.com; s=arc-20260327;
        b=pQMyGzipcf9nNTngwCl4jJNOjbWY/EIg9ZZzVlNoVWL3uowWGMfVznbomfqql3dshL
         QeEFxZ1GoY51kK/nYh8h/0192RiFKnYwvkf8kanUuaUxcEAMkx/hqK+Gw29UTp9IcZ4h
         B95BudIBzFDe8wLekNR58TnyBdxl2Nde5k1ysCI876FGczZ8dcF8tn3VzCFmCXXiC62u
         cFL0fQcKkRTkxO9L8W7sToptA/s45maRO2ijn3HzInvrWc+atyuN9wdC4JHd5LVss9US
         DttiDt/Va+AW+jTUjUE02Nl65tMPOV0Vryf1dJtvWzuZu9z53e5mZV1Wgs9/bSn6ULmU
         ICuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iRfVm8IL1MFnh3TXtWSNTqHffR5dbb9ebdI9wSrMS48=;
        fh=eahkCZsVtgDPjPje6UiY4xYFCN5S0O2aS2Jt7EhLrbg=;
        b=e7nc0tTek56gCIIEK6g4XP+B3a2qKXkiY6ClUzOpss/aqE0o8jVxh0U4YR5Yr1iLYC
         Rz7Qxzon/9Pm9tVTI8UDqptWAO5ZRc4xp8e3ilUfTAAOioYzXvnJtjF9Yhpxy66i7CSt
         Db2+0VgveZk4oWC1gjYhjc1+2GLVRp9XPKp7qa6U49w+YqeOWx4BXxs1LrGeJO899lN1
         jKVeQfoprkeiQuv2BWV6l2yP7Lg6WEgSPJkrjmlRrPeMaAvA/ojLqUGI9IgWtD8WMFGG
         QkkARuzSS9os9J8B+n68ZOvK3WlHINtc9CS4iUjzhu6VQThwnktMP2cjOyn79w6uvre1
         UzzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146955; x=1792751755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRfVm8IL1MFnh3TXtWSNTqHffR5dbb9ebdI9wSrMS48=;
        b=eDIyBTxhrDQff7mW9sng0mdhK3g5PpoOmrMtkcWP6JeUT4/mOAEAjZpWV9xgqTpuVw
         4WmqIfMpdw/CyGzm+tjj/e+d/GSGnxSgJIK122wf2DexNRHhrvyY4JyG0eGYNb0xial0
         aGobp7Ulo7sQRukxtwfsZaxp2fZP6PUgab+9MT0w+4hvwZBleb9SxxaiEl/5bcFv6NEO
         Je4+NP8A1Vp/cLpgs1qPbS3PNYTLxMDGa57appTf7WOU19RyyichOtCGDnvTfvs6YpkQ
         Loq7c6bQNBjrgn8578PL691hsdKWIlncs6fQRNVqSYVM2/wst7lrVPHUTzY0vb1wz9SJ
         6eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146955; x=1792751755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRfVm8IL1MFnh3TXtWSNTqHffR5dbb9ebdI9wSrMS48=;
        b=s5oTydSBk8V6obCNT7tuMlHA2UHT7RqkLAN35qYRYoHAiy+/FCuzO0XOusLZf2NtSm
         KnejZ2aLyZymk9vPBNMeZHux5akGqcCxVsCN2L/o9udNuWqGSXi20D05qISX9Ppj3efH
         V8WvxnNhsNwJiA1Rz5jC8XaHI9kQXAcIlCofYnVIs7TpAerUkwnLrTO/TcllYcRX+TQI
         BiUATy7i6k8dDFF5ob/tpMQmNjOKH+LNUeIbQnJvi+38o7TlfrCnzD/kMqiRd+PV7cuw
         ghbysNCIC5G8UhM7zTFkvaXmFrMonkC7Y+zP7uSOzrILZNjO4nXOTdTUetJ35Rh7dBph
         z5WA==
X-Forwarded-Encrypted: i=1; AKwUvByAZRUR4Q6UBjRsxqfNidG5WxO6TRBWQI+uffHQS8dQg5iJ2KhaKfsB8xl/Qtdf176DLLdbg2nHYkTrH1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPehC4VqWidDAa7Ohgy7pfyR2IMPNvlyTan3w32/DCuia280ym
	tfTpr2v09asXaOdpOAtKNwUnl32Ea8VvcDgSL2Av2qo9d20VqofZ3O1hAc8SFRIvyBat68KU/Tf
	Hov1x9w+cHf/1DDk4/MQgMR5nD4GqXSlyxgTi+zvOFvL/8b0=
X-Gm-Gg: AYBFou2e4XGstYILhT8Mqg+3F3TdBOL41RSehcNnZLjs9Uy7FVK8EDrhciCIvl3tgPN
	4AzE0mfQ4q3S9YUQKE8bJ7rX6+4uJwuKn3q6N1UGSKcK8kJkkB7xBu86h2xwaM3AgQVOW32xZb4
	oxxAGibXwIdcgvp8H5XnafUiZgA/3s09+42uSV2VQmHBXLK39dCYVuvCh1pjCoe7/olEM9ne9QY
	hj85apPv3vPvo0VySlBysLaXtXgn41fgxDyqL/uw9gCb/fm+TvsQu2AyQXn3UVQB3COLQtc5sAx
	11nvcozpcfvfW64KBnNdF0xXT9uG+1/TGYzMy5dTlChp6Lxhard56NQPJ31AjsedAmbQnM3Nh7x
	dk0VBSYieSg==
X-Received: by 2002:a05:690c:a78a:b0:87e:2404:45fc with SMTP id
 00721157ae682-8b07ee0119bmr44016477b3.53.1792146954580; Fri, 16 Oct 2026
 03:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0001-v6-9876bf3e2116d47c065e@gmail.com>
 <aszZ3KPvMMHLEJ0s@kernel.org> <aszalro6U6BFO_D3@kernel.org>
 <CAFRLqsUB0MQRoCHg8cXmyofWqbDGyvAr7vV07i0jUpMnSaksVQ@mail.gmail.com>
 <CAFRLqsU7w=ctKeAv5FQwxcPVbdWO7EjC3WmE1JXywe_JWWY+gQ@mail.gmail.com> <asz2YfhterfAVIDH@kernel.org>
In-Reply-To: <asz2YfhterfAVIDH@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 18:35:42 +0800
X-Gm-Features: AclHuK-sJzY1eXcpx-cLXrXzPnaYrBx0Yr-GHF2vWKubBZ1hKuC-0SCei8df9QY
Message-ID: <CAFRLqsX--CoQ5XwazdJS_bscK43F9oE_nLOpq=2FDh3teQmnfw@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Protect user key quota access during instantiation
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, akpm@osdl.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=B8=80 23:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Oct 12, 2026 at 09:33:06PM +0800, Cen Zhang wrote:
> > Hi Jarkko,
> >
> > Sorry for the previous email =E2=80=94 the line wrapping got a bit mess=
y on my
> > side. Hope it was still readable :).
>
> All cool.
>
> >
> > Best regards,
> > Cen
>
> Br, Jarkko
>

After reviewing Chengfeng Ye=E2=80=99s v4 patch
(https://lore.kernel.org/r/20261013090358.1178367-2-nicoyip.dev@gmail.com/)=
,
it also address this issue as well. That fix looks good to me, so
please disregard my earlier patch.

Thanks for your review and patience again.

Best regards,
Cen Zhang
