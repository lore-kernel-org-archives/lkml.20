Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793740770;
	b=GNPV1kfitwBK4HFs4VR5gQtrxoKov1RKP9itAOdzWPyOTaGnCo65kOhm2B5u0Zq+kPmG
	 9FDoYoix9yA9d/mb6IP1/ZcNqa/4+hmbmxJq5dvq6JGjtn1PNAz1yW6wia6C+wG7USEye
	 69qfbWHEZNOgeKTTlgRwh2rHpdd/6YQGZTilvwxJSwLtmCK4Y2S5GzImswkaDpAzT+30i
	 XdaRKiZ6Qef0Oj0kVKYFD91FPpWqZ/YSFUxvMFWk4GT7KhYjZWALkg3y9kyrGqk5SfE9Z
	 VH9QfpxRJsmEIyVfzKZrW3CfS5TmDorKWgC0z1j/2Ru9Bl4JGWnN3nLAQpbqVze3JbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E5djs837Oc0mgny3OGd4HuTw/22BWE5GoWMv7ehHmb0=;
	b=C41R026Z/4iqbyY0AIH/9UUXBwnkXbYho9ykj1aKVKo99QfuQnPc99IN6GOQfaKMqrdE
	 4gFSLzjB3n42unVx5EZgKEbUnpJJjgcU1jXW8JOiO6cj4rgAxDXLOS3G3DCTw7B7G7dIo
	 sDLRno+4KNajpxzBiXA+AxefXc4GrFLyb0OrzwqCa5jqbKPrNk88DR67cTm2Yd54vYeqB
	 5h982+rkDrUgKG2Pn+FdMT8DpBwhyqVY+18kdeNofhoWst7zS10EMb1KEw9noML8CafrM
	 EAaStFjyl88VEvBlpRTU47yFkqe7NXuS0IBxF2WhCQFo4ilPsf1RzY8+aj108CVyJjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYxaItvH;
	arc=fail smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC8606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FC8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYxaItvH
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so1733063a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:19:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793740769; cv=none;
        d=google.com; s=arc-20260327;
        b=Z19rr7tExbp+PNblUClt+9jeZE4z3laLBQcyR+Ma7/sEDisjRoPwbRgwQdxYnQzdRX
         hEEc3ayyjyvbYGvFtlMklWwyUBoc4FpPi/RWUUM8DvUvLESYV0/+vBSurD3/NOc05eaE
         XbbCnyJGPybmPB0gI64v+oGRoYVOLnWG8k+Cf1f2OSk9i8D1624jfpxNUT/pn7ECFrHF
         r5/6JDnQAQyLOgBmp3pjolpgrXFj360Yq5yYyF6jV8GwC03z2Ad/xCkI4w3EljbWc9zX
         M5Dev9yTKKcOfFRSBtVSXKVXvniFQQuAjE63GXFt/61DZYk1mMOYJdc0crRXA+3AJfOH
         Pjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5djs837Oc0mgny3OGd4HuTw/22BWE5GoWMv7ehHmb0=;
        fh=XA6rzFEnvVP+6z8R71SG/Pf41zURH0/4Y6FXVIg8PCc=;
        b=nE9HjaJcVw/pJXeODEf4pkHpRPyXPmbekK3cjYdJHqtmUWV7CkUwfDgPDDPJGIIp4L
         KuSLvJEmCvb26zxzgpmanS/iQnWvqpKI1lsyQprrzKqOuQAWcCfg9BGR2E8KI1SACtuD
         3gRjJMl32S9/sa2Hl6DL6LemrqTuUMHpZ83sAbA/AcwOqPQ7TdtDzG9tx50kya+10pHv
         bfeg+04Krh/Tu9gkEQoREmAwoXbmZa4bTiMpRfKEBx/zr8HfxbndLcYSimpFRDpzvXRw
         uEZC9ji/fkfGOKBFfyg0twNZjwSqLJpoGmcFG3IH7fy8Eag1vW7H9H8v9BdO53q2L6l6
         0Ksg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793740769; x=1794345569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5djs837Oc0mgny3OGd4HuTw/22BWE5GoWMv7ehHmb0=;
        b=BYxaItvHI1gZItrW86V+E4vAwKZEiV3Jru97UJtiI4qR5NfUaldAMAoMNUpyl9x173
         F/5KhA9CmA0FEys3/Ton+U3I9Nhhm1REyRvR/CPLUyBs3EmMHj3Fu9M5MrMu2KNW76kU
         s0d1grVHKHvqBrCwKSaR9976nLpJRnfNLNeMroF8QIRmdIux/v3iZja/lgLcQtI6w9VD
         GQvyTBDtM6P8vqOjLXEpj1EuZV4PSdBe6i+Wulb4OkRdwH/oAcDEKEcJ/pxOwPf6yIJO
         /awfigc03vNy39OxYWjcazcLCEruRJjEhV/rV2B4JCUIexFY+PZDtp+TxUwOdmX0s5o7
         WCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740769; x=1794345569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5djs837Oc0mgny3OGd4HuTw/22BWE5GoWMv7ehHmb0=;
        b=WIfGhEOw+JPUrPj7d9a+uyHLqK6hvJM/JoQ+g1L3wEaDK6OEUqKS44nI2UB6QjHjJh
         A8RQR4quOl+j69ioz/E1WE7JytEmAoEDr7/vrI7ZWW2hLpbAHl00nTZyBVw8jRMwxqCQ
         P8qMs4dXIOIwR3t68d6yEo/u9CvD1xJaX+AUKa/s5nR4cvZmyEjJRCyNYHwqRxge4JLS
         xrVWHqOG78OT0YOfuxau8Lx0rIw8cQB+kPPHAWhDr6fZqWodmZ0d2uTS54H0cvkvk18N
         dFe7etPxy7hV94SykRIJDfxDZpG6XqJ3yjTRsCQAL+GS0BdwipUTOipVBTaWGmDBeil/
         eLuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsV3xHt7oFcwFLYubXOe4RIn71OYsBhGIvBNkECKvSGFg9bazwT3ABchAuWg43zr+WmdmcnlpVVXKuzCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lh1WZyTpkI3XibUG55mUPLJesOI47F0uDswxgRl55XcSAQCV2
	m7fHu9OFhFfzvkAv+ICQHSqtc9NWOfU3kVCB8NBZ3CZZpoSvBir6lKrnix9gYZuIvBkBwi2Qy/Z
	3lVgXYqRKYqXRArcj5slLQYyhY1DgrV7KonLz
X-Gm-Gg: AYBFou0lx3WTZG1i8uGNy9bjtKvkjSrs2zQVE5sZVh0r3Mxwz0NGQiEguZzYUldaich
	w0K8nzm6fVF4N62UPFFnimug7BgO8hjL6Hlo/dAjRMszSoW3hD6GM07f+je+vAULf+6BaqblKp0
	tKPhJRrAgATleA9iPemIEDOM3Y8ln8TcFnImx3h6bYjX8nBBrNSjaE1WPgUvI756ZCZUNENS0xY
	OGKx1oiGxzKkqmnP6YRETvpQHTxmroCHLLU/1yeWG/7Hrk7TXpTDR9A2OFS4NSOuPvnt2RUyT20
	FdDv6LT29Vvvb9C00fLzbNFzkVoLSmkFg5hQDG+yZ1UgwueQbRPkuKD6JiTggmo8JCjLSptzHf6
	ApUE8Oh1UNDgBFKml5wUpMBBuWH8wOZATmQZoF9rVHXIZuzPNGw+dt5B8C6qu0P7RkUC6wQ==
X-Received: by 2002:a05:6402:a6c1:20b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b4d5255a99mr6904980a12.10.1793740768783; Tue, 03 Nov 2026
 13:19:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031095716.3030288-1-amir73il@gmail.com> <CAHk-=wiPhTLn1p0ZHx-7SMdk4_zazqDK1k7MMEn9scRfqeDgtw@mail.gmail.com>
 <CAOQ4uxjNrdxZdZZipsqnUNq+TswCKqp+30iKRKCqh2WOQ-zKGA@mail.gmail.com>
 <CAHk-=wiimdwWu0EVQdxGVjbVWdzNKGg0f6vZ1aR-GXxDvQa-Eg@mail.gmail.com> <CAHk-=wjz+Tg3iq_6uBqxm+egP_aRhodcz2Qu3pQaR8SQcvPt0A@mail.gmail.com>
In-Reply-To: <CAHk-=wjz+Tg3iq_6uBqxm+egP_aRhodcz2Qu3pQaR8SQcvPt0A@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 22:19:16 +0100
X-Gm-Features: AclHuK9tonoGwvOBReDPDncd9ly3rSzJs7SEyhXaRkacdqBh5Cb5BYpyjNlp-9w
Message-ID: <CAOQ4uxjL9a6c=8u=eqrtkU=K1Es5ZdekAb-v16xNeD0-87Sr4g@mail.gmail.com>
Subject: Re: Return failure from take_dentry_name_snapshot() (Was: [GIT PULL]
 overlayfs fixes for 7.3)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, overlayfs <linux-unionfs@vger.kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:32=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 1 Nov 2026 at 09:16, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I'd like to see an ack from Al / Christian, but
> > I think I'll also rewrite that function to use guards.
>
> I didn't get any acks, but I obviously did do the guard rewrite (and
> then some: I got a bit OCD about it).
>
> I've committed the end result.

Thanks for cleaning it up.
Amir.
