Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B48B2C235E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325546; cv=pass; b=U8cLxxMpMMawULu1a+anwQDglCWaxIAJhbCGNLv8xsTNMccoim+CNeO5ovzvNWIXbX9HMe/R3NGBjW61Ohuu2Ylzqy6qL3PRHHbDXVUTngW3f6MSdcAxjWpJFYRrJqdp5sO9Uchtda8MaNtjDRIUbJXM5J0+apxDLMV1nt7C3Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325546; c=relaxed/simple;
	bh=NLHqvXto+f3RYXsUmTwIi3mwg7y/IwmK5K15JRyNzIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxkznuxY5whRykH9xgJLwWP/+oMrDJgv7eXX6a7spL6dnvwSQ/ou6t6giSWb89Wui2X4rhr9Ds38PSuXmXqkF5WElx+njtliWkANBd0t4nYaTupOF2GgDbypok+pMpTR9tG/bzQgDUSz9rkCq3Fzk32YUX98Er1Dyil4iTdSX8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+3L2msJ; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+3L2msJ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39f20d19895so5090061fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788325543; cv=none;
        d=google.com; s=arc-20260327;
        b=Nw7eiXMuMAP49v7U9kWQK7lSpOb5RVp+IhomUkKxHbDe5RhFutIMrDKjSzGg2YjH2l
         XrJIZLOhJIBQS2LAlCo9vlJb3xwTLEP57JNSR5leKhC8WAYHA3sfgSbv4Xuxq2J96LyX
         2lwmJmZRzIYN2GSYcQ6OO6TJcHeGuzJiUvjyM3+Er+DpG2UI+ldI/4raj1mTOPe1H0yH
         zGsRTxVtx1c0OCk8RKW56O/c84ek31rf6XQwKmODydXYFVxSxh+/f7LYEiOgl5zhNuDR
         aZLfM1gU4qkAx+IeyvxrnauirtooESyzJ28ZwELGqQ/QAM4+SRqWry6BidhpsWeIgo8U
         thNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7nkXBkEBfR4l2iwoI8t7QwAJBhpGhm5orDlZN2BZ1Zc=;
        fh=HkFqFL/WQqC7BsTBEQCpmJJCL7fcj7xpqases8KELmE=;
        b=rD38BKk1ZVwpK66P34PnylQgl6PMPYPbZZpQ2wwVFH+oYyjIpAqIDxmeMr1jK/xX/H
         l10gFyKayLh+mMPCs0jkvRLnAkRZ5/HCUu+53Yc6FugFNEUYMiN7kWeyaM5Z7OKef4kT
         soLrgF6o39axbRY3lAvkuVavwMJ3aq6jtp9KuDQxvymWpLu6EW5R2OaNStqleceJRNPH
         cDrI7VgJqQBSwSuzxAVeS+s7aeicol7VS6EW7ieE4FIz2LaR8xsqERUN3vQeSaBws1Ou
         JzKwpkuYbgRvE8zdnLnQME3WwBli21rkYzft9udUqSMDRwYXrxLuB5+gDPFD5BNB/DIa
         +KGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788325543; x=1788930343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nkXBkEBfR4l2iwoI8t7QwAJBhpGhm5orDlZN2BZ1Zc=;
        b=l+3L2msJAclDMylMVngKESVYDuDdURyx2Mz0xwSZRwUENOISs+SVYaKdmAj6a0vj/Q
         U3LuYg6FXLS0q95etYUfeekJlW+VYIllaTiWRFZU0Cpiu1b5dJi/yvoKH6nGD1+tAMIZ
         uUN4w4fU0n9u/PBHoTpvdwqOdpEk7AWyrNdc2KnjejONHMRwaWgwNG3TpHE7KRFYNZuW
         Fw7BZoaB1Ft7Qrn2Nw185WB4mIKLu5oab5NzaskwOlreLKesmeOz+JNWD3fZ7dHv/cfN
         /+Ux+ats7H3/JrMgzHuwqbilYa9m7LjF9qdjWB25m3q12RwFHmWwLWxvuskoxe/BUuaA
         T0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325543; x=1788930343;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7nkXBkEBfR4l2iwoI8t7QwAJBhpGhm5orDlZN2BZ1Zc=;
        b=oJjctjbWgoJ3NlvkN98SKBhiVrX3X/0nnvV0KPj87lcJjIe+VT8wi08ihtjEGrgQ+3
         3zai9c2BG8PJy1gGTF8Ma/AM12F+rAotjYbqSmFDbvq4NjoGi9AMF8mdN4YcQ6ab9emE
         0HLcuPZT2kcMQp7kJJ6mDZdY684Vgn80yihRsNP1IyxLXOK7emuu/D9SQSkwO9I8Q/mV
         BS46pR87q876JYjNMX7Bjg03ET8fMZ3ygeFVbLdFFgcQ3Zzr2/2poRuyMg3BIdqXUei2
         MGrt4JV4gaBZwg5v4IsuFFnE3bweB3NBzsHVW/OhfWXc0LG1fDU7K3jZQGNwJb1UxqNI
         B8Lg==
X-Forwarded-Encrypted: i=1; AKwUvBwlN2ULMIKnz7p75sOKtsYFSeUDVz/aT6FWZOfbXvwjj+iEnBynmQMUuSM1HZnATPl0y73/OdI9lRwZQOM=@vger.kernel.org
X-Gm-Message-State: AFuF++kfX95vxezPCyY6qhwrp2zEUQFX34qpUMwAx/50Z9gwkmKYHcjb
	SaNfH1DaFVC9C9oEOJ1cULJFkbko8c6Rk6SyGNUnaZbZtDA/1SIhOl+J8LrJRl4bSLxRujOijaV
	MZToLzYKPNgCzlbD3q0S/77rXJzbuBXpEe/ez
X-Gm-Gg: AYBFou3Cx3Op62P77ue2ziRPxa2h/gQxo5BMGrMdXMIly2EHNe0NgDjFOpmm4sAndON
	gy2cupReTKGaaQRHJO9cbBj3nidJwA8TN/g6CrDiUK19Ph1oitwfXOR0EDjEqBZHGfsvwxJYQ/M
	BpwabqaCNeebsUFXPyJluvxuB+wUNcCdMNKKk9WiYBuHShJy0a8ieMDb0hzJPkCLaawMHnA9XmA
	zGewA6D2j9A+AkBEVQk1XU6qabA0Y8599h1mqoWJJMYnDjtv6s6rvKv1yzRBVeZ9GJDYc9Bw1AE
	T5WLazoZ9gr/OTxjJPl7geNvfDge5f+ybbeNeang2E2bK50=
X-Received: by 2002:a05:651c:a211:20b0:3a3:2a41:c0c4 with SMTP id
 38308e7fff4ca-3a34ffdf928mr3036391fa.14.1788325542808; Tue, 01 Sep 2026
 22:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822062725.60519-1-muchamadcoirulanwar@gmail.com>
 <20260822062725.60519-3-muchamadcoirulanwar@gmail.com> <20260824010726.2849f3d8@jic23-huawei>
 <CAO26r3RLnX4HXrKDF6akmG722Q2CvDU-uJ40Yfuu_wwJdGgA9g@mail.gmail.com> <20260901021420.144a64d3@jic23-huawei>
In-Reply-To: <20260901021420.144a64d3@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 2 Sep 2026 12:05:31 +0700
X-Gm-Features: AcwNN1VwSx9iXjAYtJBmAc-tUFlWH0dfDFzrjPh6nAYPikoQ80HU5nlzzOFlAv0
Message-ID: <CAO26r3S4t0GCAep7J1suedPZZA85=vCzrWXA4wR=Lox7wceVDw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/3] rust: add minimal IIO subsystem abstractions
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ojeda@kernel.org, 
	dakr@kernel.org, igor.korotin@linux.dev, branstj@gmail.com, 
	brucer42@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 08:14, Jonathan Cameron <jic23@kernel.org> wrote:

> > > > +        Ok(IioVal::Fractional(v, v2)) => {
> > > > +            // SAFETY: both `val` and `val2` are valid per the Safety contract.
> > > > +            unsafe {
> > > > +                *val = v;
> > > > +                *val2 = v2.get();
> > >
> > > Why get in some places and not others?  May well be a gap in my really limited
> > > rust knowledge.
> >
> > This came up in v3 and I answered it then but forgot to add the comment
> > as I said I would. IioVal::Fractional holds a NonZeroI32 denominator to
> > prevent division-by-zero in iio_format_value(). NonZeroI32 is a newtype
> > wrapper over i32, so .get() is needed to extract the inner i32. The
> > other variants hold plain i32 and don't need it. I'll add an inline
> > comment in v6.
>
> Ah.  This is my lack of rust knowledge (and forgetfulness).  I'd avoid
> putting too many comments in for the benefit of folk like me who are
> still failing to find the time to learn rust :(

Fair enough, I won't add the extra comment in v6 then, I'll leave it as is.

Thanks
Coirul
