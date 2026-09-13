Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDB36F90C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328691; cv=pass; b=n0BPRa/OAxoOQRA+U9qQ8vHHBUiCnXz3SA0BNx2VU7qtpelZiJUcI8jHgSuFzVJ7pPoBjj0bLN6AlcJ8iJzdYORh0aqCO5nz4cuXAj6prztkLABxP6uaDuJ2fbdELuT7T7QCYkVLQV4TidHIudm4GO8intVHUzPa6600TrH7qOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328691; c=relaxed/simple;
	bh=c1x3tjxX5AVIWW3tLmux8nPDOgWyYyrg2724RgaFJt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dd6TvqdLBGGLSGs8pe/ISdITqSOIXL+YVFYSbCd/jpy8qEXQa7zMJ6CmBxynSGjcREaPEV5R1payU4uGOYvHGoR5FyWSVzleKaRZkwOkNL6fsb66nUJ/Q5XefKHrZEaaqMVD+z212PUjSzm4xMnd3fIRk2y9u43v5/098JQ/60g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hICTZU/9; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hICTZU/9"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso102696366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789328687; cv=none;
        d=google.com; s=arc-20260327;
        b=DHzcXW9J8eDrUdQeNprTExyok9zJhpzn1i6GoTIM6SAz5Os71o9h+rBJnkzRWTJ7+6
         pCjMXXgXYhbKNlcqBIroovlvtFxETvoR6krShVwSoqbb4KEa5pOEYtET3GKgu8kqvQHg
         45nV2/oHuBiPgLr7siLaKY6fzgcWJ0U3nHY0AfkaWPnFiwBPXqz7wRV2jgFayu/Jg0mk
         MDWoAEOU8NCSTRRvtAsibYNGJMGntjjncNoZfjaZeAjI5lCwMAfjdHMsoq5HlSHQ4acd
         N9gZusIidYMs167+aZKM0NdUvnnlN/zNK0zfduGb/9Mxe44Z4/LGisBjqvg8knDnp+sI
         PhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8b6r+U/DEG7an93RNL6FjyRqUyeE/SvG1QM7ET5l5mc=;
        fh=GMsKVKfvvnZTsQ0Zs1A+gHDiJB3ILxGe2Bqnin4uWH4=;
        b=FVRGCD/Q49PcG/z/g54yJEAWwzZ5/f5mNX3/tH+NZ8ln27NUYzorqc8NwMnjjLAFdJ
         cXkm98TXwFcxc/u3cnjtDMGqzRoX39J6E6lSeJO2KQAWg+SpVKY6E5o+RbsW6kXAwbQN
         rVlRbY8OXVI9979Fw85eAXImxGUurTbYz+G24fc+UpJXG4f5jeReUj3tM9ujkV/vE5wh
         Sc/vUjlmkHVzV1ClGDZkll4FWgt4UMhX7ynxn4T2qoKt/0A2Nyh2Kse4hG0O2NW1arHg
         JJVeJzJPU55YPVajUop5S3Nig7/HNwCopjzc2tWSmtSbwQEjhtr8IRrexSGXFQDTClgg
         eH0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789328687; x=1789933487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8b6r+U/DEG7an93RNL6FjyRqUyeE/SvG1QM7ET5l5mc=;
        b=hICTZU/9RTkWReyKqnv6kW4kDmapmeZ0pOd61K1d6bCY5gMm3al/LPrvte7DnWC4lo
         c5VLvvupai+YMIu7hT1GPR0AkVknF8dqaGmEGIaW+cW8bcFA+kYLhYmq0dmMDc5omhO3
         qptKnmbLhKwE87izKbeVW5MGkEmxNHogfppRyePXVaM6gMMjTQ4YMuRxJAVyEthb0L3C
         HkpSHpJVZ75WLClAzyZnL8xnPSfluJfTi1F2t1VUUUEElbuosN0kFyQHvIL93nxavlBM
         gs05Ed9YSGw9uXskdf5gNZJsMlTr3BAr7JclkazkTXJgHauu/ZCunOJBo3DFDKIOHcTs
         N9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328687; x=1789933487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b6r+U/DEG7an93RNL6FjyRqUyeE/SvG1QM7ET5l5mc=;
        b=REn3YkKsokZtVvb7R21ayeZy3gCPilAIoVDHZP2nnjgeXdyRlmHWBmxoE9IuDmR2pL
         QGrS8L3Ty9XLKfYBRb4vOQUVQCxxbxIEWC3vvmfJ5tF5g9KnumILy4ih2qRPS/vAJMZf
         X+ncfYjzePo/hNGKuZtSFU/7wI9B3W9mkqKAY7maWe9L9oSW83iYMaL9qxOe0wJbGdMr
         qDH9WeMgXyrBNPPMFK3Tk+5EZtx1XOKMXejjp7OX2jpREaR+a++uYZclC+Mpdtn//OW0
         xLokr32c+WndyBo4RzEFCqhS15LMg9UFPrdDYGlK2YzSRkEdtlTJ9eCLnDP2mvPk+gDY
         IVug==
X-Forwarded-Encrypted: i=1; AKwUvBxrnXc2RHcSZf/J0mzXZ4x4S7vVw0n5EPuWOmiOVpDcKOsKSBdvL8XWs48mUxgsP2ZQ1FAnMJTAYZCWTiA=@vger.kernel.org
X-Gm-Message-State: AFuF++nucShJA7NRYdLVCffv9ex4x8DHgC1zeQOz99CwvRy/LdOV64ZC
	c117kgBGY/E+68hY/EMgcyqfwcdfoD7AaRurRGJ52/QGeagbUbN6oWTaLaTuYi9SORQ+s8Sx/nq
	rCNwUBv0cQ4MhEnfYvjJlu1trrZGWEhw=
X-Gm-Gg: AYBFou0wqzN9YF/VX7OojSElU40FCqt7obe3Q+NvIUck8/rwn/+EMMDGKwlMZrsl6xj
	BaSSTpsX+rowa7u9VSpSV6TOkDYsSJzIzhO0BrqLVMu6u6k95SXsJC39f/lU3HlWOj9zEKjp8Gw
	MQL3yGNvoPxpq9I9TfNXoMa4wYjdAVgBzqVReYADoxviFi3M+vxsHWg83keTs/l6L1KcZ1Javko
	Vuc9H7WlLATu1E5UTQsem/ntdL1AUtOk+BGU++RB/IT6Pm/lfbsfilzyU08GD3mI5gJlFT//PAL
	I0PEqf9l4Y96P2WyKJvLiBUnA7F+kmsC3EX31HA1eJbURfgkk7Hu8b7KVNna8Rg4R0fwnoLGbOc
	OnzK1VEz6W6b1OcnoCzWR/vJrO1tSw0N5H0d0BsQd2/5wMGEuamjgvcrQCkd+yZOUqLzYPddykB
	M9xUkEW5i7QxZnY4CLNFyuXurzZaetejmEq5r/8nTCzjNA8oYFizgn32DNMecqEGMDJQ==
X-Received: by 2002:a17:907:7243:b0:c24:d6f0:aa0 with SMTP id
 a640c23a62f3a-c29a42b6f36mr194728466b.11.1789328687262; Sun, 13 Sep 2026
 12:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519015739.634423-1-rosenp@gmail.com> <147ee577-8a72-407c-b332-45dda9f153b3@suse.com>
 <aqZyNoWsZp9mvrN9@codewreck.org>
In-Reply-To: <aqZyNoWsZp9mvrN9@codewreck.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 13 Sep 2026 12:44:35 -0700
X-Gm-Features: AcwNN1WkGf_NNwT-XIS-7nDNPApAUFWz0kyN1ZEHHVq65U-G5fRQYlTnu-GfYQU
Message-ID: <CAKxU2N8XR5i36yrbNckkKgrzyGnqO-3tQV=KEVg6Z00bUnBHug@mail.gmail.com>
Subject: Re: [PATCH] 9p/xen: Use flexible array for data rings
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, v9fs@lists.linux.dev, 
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:52=E2=80=AFAM Dominique Martinet
<asmadeus@codewreck.org> wrote:
>
> J=C3=BCrgen Gro=C3=9F wrote on Wed, May 27, 2026 at 07:39:07AM +0200:
> > On 19.05.26 03:57, Rosen Penev wrote:
> > > Store the fixed set of Xen 9p data rings in the frontend private
> > > allocation instead of allocating a separate rings array.
> > >
> > > This keeps the data ring storage tied to the frontend lifetime and
> > > simplifies the allocation and cleanup paths.
> > >
> > > Assisted-by: Codex:GPT-5.5
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >   net/9p/trans_xen.c | 68 ++++++++++++++++++++-----------------------=
---
> > >   1 file changed, 30 insertions(+), 38 deletions(-)
> > >
> > > diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
> > > index f9fb2db7a066..5a110d71d18c 100644
> > > --- a/net/9p/trans_xen.c
> > > +++ b/net/9p/trans_xen.c
> > > @@ -55,7 +55,7 @@ struct xen_9pfs_front_priv {
> > >     char *tag;
> > >     struct p9_client *client;
> > > -   struct xen_9pfs_dataring *rings;
> > > +   struct xen_9pfs_dataring rings[];
> >
> > Any reason not to use rings[XEN_9PFS_NUM_RINGS] instead of a flex array=
?
>
> Rosen, do you intend to resend with this fixed number?
Sent
>
> Given that's just a two line diff from your patch (just changing the
> type and keeping kzalloc_obj instead of kzalloc_flex) I can do it myself
> but I also don't have any direct merit from it, so if I don't hear back
> I'll forget about this
> (unless J=C3=BCrgen says he actually read the whole diff and it's worth
> taking for simplification, I don't have time...)
>
> Thanks,
> --
> Dominique Martinet | Asmadeus
