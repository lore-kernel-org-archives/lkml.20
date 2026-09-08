Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC733A9618
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880386; cv=pass; b=uXltPXr7k6W0M5yl92FDV8TOXJsNqZaZ+E2j1wW7N8CNZjy37Cozg+ymW75JKI5uNNoHcxR49TWj64cwiu0yblz6VeyYE2r6ytDQb72JbRMFPgvoU0KeNk7ysTbKfe2zWdFbuEqCG+MnDf+iM1psYY6rPswBw71NXOaWYLKJ+OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880386; c=relaxed/simple;
	bh=h4V3qmSg9Cl3SBicqioBkg1pZFXj8Z00HAErU9xLdic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5MbRItP3YVj5nhO7/m24A0gikRZobZgPg7LwXwEPuFHgjMZw8XBG5yJmDxE6wzdDCBGZrqhjVVAqrPJXEBwVtPYzluweuXT43EfYCbogPy2zYsYSlFAuGoqczCqbHdyHHBpK+K/1j6/xFyKeJWcKKcDSXO/WBvA8BQzjZ+Qw6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C8hA5CSV; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C8hA5CSV"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca07so266475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880372; cv=none;
        d=google.com; s=arc-20260327;
        b=jQFoJVU5kBwqV03kbBOo93JTwxRIFxRX1WyxZf0Em2JHznlMfTC1tbth/6SuEJR1j3
         GegT6U0a+R3Nvpqmi08JVaB+ig2du+IR+l01H9MWonN2kV8EjMz2XUVTMGn6tLuhUDIl
         s6QYx58mAHmuaax8xfAbRUb1rbP2MtFLsva9u7FuIQuu6eRllSsP8W+8A/4VXhProfzC
         B9JrMwQ5drjvJHev/IH1Qla6hNYOh4u8maG73/kzB+2dSbNMKtca/AW3FAj6UMpcHRmK
         2yWy+z/6y/ksLn10NjowDHgTDTgj/FrWSzMO4Tt7aV9LzZUAIRySbINpVlt8sHw3mw7X
         6h3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BouDQyseTpgBscOBCF3a6wtMXmz3CzisSn6GhPbdwBA=;
        fh=cfMpRBahjFNNZz2obx4ZeUWhvWQcqe7YUxrWjyUH+Nw=;
        b=UR2e9VxmB8oywFJuWR6zsF9SHGEXVWQHUAYGyicEQpaHDiSj4yk7GbKg0NpKWgUb00
         loJNT+8f2RthbWT37XfY0lLCO9szT8QvqbKYcY1dG+GXo/It5+NSPfWmRtBwVdRKVTm0
         gRvTOixcdoy7bq/X8H1fG/JM3ZmgkdjG0dNHut5M6Fy1jiFA0aGfBLVJTwDcb32Ex8Ox
         cZcKZ/w+UgMA2Xp7mZdeU1UcmG2DUaqSKu2kX5MF8W4SYRJeUW0xX4cxyPuJv5QF0ZN3
         qRLN8T/WiRL/1aaP6Qh+OMBlYVbwy9M0FBs8Ya9lyXUkKZZna+rjhgXAy1BbnZNrzizf
         0LNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788880372; x=1789485172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BouDQyseTpgBscOBCF3a6wtMXmz3CzisSn6GhPbdwBA=;
        b=C8hA5CSVxM/Z74ufDl36ekUeNsEHH0WhC055seX39waYfrIjxLVZ4VhECPL9nMmD/K
         wLdIm0FQyh/deMhjU8aIUom//KEOY82WrXpdUbM7PBWESChmWZNeTyh8FOIkFGCQRHnH
         V+QjdSgJVP6wZaBVd28laxSh8PhhsWvJvsV1HHj6qpe87nj4gtmmTAyZr3inkbnv59dk
         wOlegio/ZYU86wJwwQ+16BwGPyXrbgX2sA2hLTvUfeuEIsqb2ZeILbC/KkOzbkRi7UCN
         9IPPJlDqQt0j4OnW4uSgA5mN04rCsNt5IhBF0P9BZnrGSF/ksjVmbDiLioj2EAV5ji1F
         g6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880372; x=1789485172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BouDQyseTpgBscOBCF3a6wtMXmz3CzisSn6GhPbdwBA=;
        b=S8rP5ALDVkWZBYso37LjSabmuGFCDvpqjZZyXBOxjKIHB3Dj4k6VlJgfUtSxSYIK3j
         5JBVGURTR14c7qODyWnPtAURk/YzU6dHSaN/67MKhrbNnD1KMA3QFzzM0gnxo20hnj4X
         xD0phtDaN2Fii5+9s3OHVNvTiGkE0/yTslFcOV1pviURVGtELtvmZZ8u6UPJTIK/9ezl
         Ro9qeiw1lyDSrawv6riaZfxrq9tfaUyE3zn67OLXmyfY2zhTEMui1ttRufUEOe8Bbuwe
         lBLMLYKKkAdF73FBmBe2SptUD9xyzlviMGHzkWFDkm/DZsz1OAZlC4yNBrHSw7/NeUnN
         fkJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQu/HW1ww5WXoCQgNkimNM7T75ilSzHxHNiue0MHAvS8mVMiqRH7/JcLNjT0gSA340flZH9N6SOxbEiIU=@vger.kernel.org
X-Gm-Message-State: AFuF++k4Pzdqh6i/kyu1IMHdXMYIGjXAXzGPUsObxCjUilfxNKC4+5/M
	aqbjGNQhq22nH0bkABAbwYvLD3wVg7QbC+ZpiC6NRmgZdnS+EneG/0EUWXQ4wjsL7QgfLDhK6tW
	FZYN7iLzqZvx53sLJitSa12Ls/9yX5wrI86NJFVbF
X-Gm-Gg: AYBFou2Fei5mwkZCpwEYW3SAFWFSC+wzG6aIIZ8nkNk8gTAEXUFIEPIge26TJjcgw4F
	IpSP+FHilN5J91By5YHF9WkJv5CZrUTpq0hKpI29QXbzVPLpkj+tfclNIskN2hH3N926lzW7T/c
	GJB2xe7crH7Ha24Twt2Ceb2lzbI+iFdpBTOzEAo7HerBhDtDDcEbmJs0372tv2Ytmtfoze28BPy
	WWiATPwPH6mlCei0dQJ4kidpjNltv2f7a/R+f56DvSKqjXxdGhf4F1EZzSDLmyXOu7gyxCADb4y
	u2ukhUw4E84QM22tANlaOVndAzf5Att41lH+TrZ4e8pxilJc4gw7VNFsOzOz24jYe6nZwdrF5QC
	ex5nUtnOBy0L3/w==
X-Received: by 2002:a17:902:c102:b0:2ca:4bb4:4bd with SMTP id
 d9443c01a7336-2db294d1416mr11909045ad.5.1788880371498; Tue, 08 Sep 2026
 08:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903215606.31633-1-hramamurthy@google.com> <923eefe9-141a-47b7-94c5-c91df94e66f6@redhat.com>
In-Reply-To: <923eefe9-141a-47b7-94c5-c91df94e66f6@redhat.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Tue, 8 Sep 2026 08:12:40 -0700
X-Gm-Features: AcwNN1W-djDon6i2Oxz6RcG_IKMBsvPvG6L-ePIXfRp75VFE_wdPCqR4Vyc6SXM
Message-ID: <CAEAWyHdvav2Yd1qjt9Z+O0f5OAN3OKd1y9OPV=VuASLXYbUdpQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/12] gve: AdminQ mode related refactors
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, joshwash@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	sdf@fomichev.me, jordanrhee@google.com, willemb@google.com, nktgrg@google.com, 
	maolson@google.com, thostet@google.com, jacob.e.keller@intel.com, 
	debarghyak@google.com, kees@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, przemyslaw.kitszel@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 3:09=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 9/3/26 11:55 PM, Harshitha Ramamurthy wrote:
> > This series is preparing the driver for the addition of a new control
> > plane mode(MailboxQ) by commonizing and reusing as much code as possibl=
e.
> > MailboxQ is a new control plane infrastructure which uses mailbox queue=
s.
> > This is a new control plane to communicate with the device when the dri=
ver
> > is running on bare-metal instances as well as newer versions of the dev=
ice.
> >
> > This series contains 2 main changes to the gve driver's existing contro=
l
> > plane(AdminQ):
> > 1) refactor some initialization/teardown path methods to make it work f=
or
> >    both control planes.
> > 2) add gve_ctrl_ops structure to the driver for various control plane
> >    operations
> >
> > The refactors are mainly around the init, reset and recover paths so th=
at
> > functionalities could be moved into the control ops like 'set_num_queue=
s',
> > 'set_num_ntfy_blks' etc.
> >
> > This patch series only sets the control ops for AdminQ mode. This is
> > intended as a preparation for adding MailboxQ mode in upcoming series
> > which will add the new control plane infrastructure and then introduce
> > the corresponding control ops for MailboxQ mode.
> >
> > The entire list of future patches can be found here for reference:
> > https://github.com/hramamurthy12/linux/commits/gve-mailbox-queues/
> Imho the 'medium' severity issues raised by clashiko on patches 1 should
> be addressed in this same series.
>

Will fix in v6.

> Please note that you are supposed to act on sashiko reviews, see commit
> c82ff94592fb68f529afe63ca7f5ddb7dae4ba83. Lacking such feedback, I'll
> tend to err on the safe side - i.e. requesting a new revision.

Acknowledged.

Thanks,
Harshitha

>
> /P
>
