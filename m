Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963623101A6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113073; cv=pass; b=aqEgGkvYQc/sHgIGHGjVMAd5I2ZoPTslngiCElKPbPhefUV+gVEJlPo+hkqO2SzvxffiDNq+u2DxLXGYNGoC0IYWNDbfvCFizNvztBDvbcyJMYTHk/PQ/9M/ufhapqBRT0UEJnJcPgNxdHSACWLqkH4F68s1Kfld2aJ5SE48tR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113073; c=relaxed/simple;
	bh=JzG9jaJYiued69pJ3zjgkohjroIPbtGqeOHKXUqa6kI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gC7dgb+I34LFwBF2TG7tf62h0uoy8g83S1HMJ+oTSMfcVIs7K9gPZH6EZ63xF6Io3QSm6SEpKjAV8egB9uhpbG4JKghKwMs6dnvHyAhD0Wu6B4sdRw4S1xDUlBV6nF/4yLkrbdXvxOMk4W/qoTsa2Oo7RHH5JTN3EkQE2Zm2S2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9HaZW5P; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9HaZW5P"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0dba37a7fso10491167b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792113071; cv=none;
        d=google.com; s=arc-20260327;
        b=L4wjEa3AFQEKsVVzO+RpHjol1dDnJLnnfzmHwi//uACUteJn3zxKV950RR//X0A7Dt
         WVknDtq8nE/mTVQz8vCPMYZHDhbsn0Wkc6sbcgcZrKD9oNtavjOuKJQthauWwmJ5YzOU
         4+Vx+TeYMVl2RZSscLCAC9gf3rGB8FibvoAmzXcknOPYLL+ljn4ZKwuObrY03Pthoplg
         DbphejlT38OiJ1/xp7Y7oZTZIklT93DIhPuLD1Jm0DS4+oFgzqJJwV1APUcw/u2gYv/B
         J8upP5bblgCvUxaNnJC7tGXP9LpAQfnhHwiGaOzOvFtgnDpcPdKEQFzsQ+nc1DyxxgEQ
         YnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VQkIfSljpkAXMtApCpc6CLLTd+fi+11lXbgR/qs4Vvs=;
        fh=6AxaovfjXth/RJiDCdV4pwnb1tXXTdV9tsT96wO/SGg=;
        b=RbRsJWXCx4PwsnvYnolU0pYdGmiVz8tK+N5GY3qEFBXd/brWbhaxjJqqbdc6MG11SH
         45RToeX863Jyvk9cnRCcfclXA8lNN3Gg9i7DRy6mY+QsOU4u7CydpNKuhyzLhJSrWJE6
         OsMlVATM0+RFEzrQJc4VAInwnBGE9kFK1Qj88sINPCPzZHbaCi3uVaICQ/+AZl+rlwL8
         Tukp6oFScuRU9hmBlbOM2mbmr5hnwwU7rIvpMykUYKDklRM24ocdPJs2ZfMlwsRw8A3k
         oUKVQwcxNc8VzH2FdVhezJU5mXQruLUJbUF8TzaM/FwgUipVxBmUhzQmCyUhzZ/hNMz9
         YtGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792113071; x=1792717871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQkIfSljpkAXMtApCpc6CLLTd+fi+11lXbgR/qs4Vvs=;
        b=j9HaZW5PoxhSqNwvgD0NsFCSS/JbqOhSQfeCvhwAK1DaEInaPVzP+vD/aBJkDw2eiM
         GJKvNQ1Kk8AOZYmfjgSy4Aw9Dtqhj6EBZFgejjiFi2cfcnBxTDIvyGB4TEbKpH9uZxEi
         HAKGkygSLVw/+eZ/6ClYz/f4Pdtq6gwFcP8UbeWsFU2lxDyVB7Jd31houVlvPBoz1a7k
         6jtI5/lxB88olW2p9hmrkx+e02vZRPEhEXwB9568RPEsJ3UtQhC3TJH0Gyq2tctymKyC
         jsc4/vHMJotVqBtBEcdAzobUfI8Q0TFSUuQgzY7tMqbxDI5j6BsqRBeYihDQuwOkXMj4
         ri/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113071; x=1792717871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQkIfSljpkAXMtApCpc6CLLTd+fi+11lXbgR/qs4Vvs=;
        b=kEz3o0WkqXcCYvYXDZDJ8krZHgrRnLhpfaxONBsiK+WJEa1bwp8JcxyCQAAmrtE+DV
         kn/XTrO7QJYyhMEnQIQk4aLvJjKJJpyysewIWaUWVokFW865EXjvUJMkAKOIDtxnHMH1
         w0mLN1WvxtPGKVupfBbyOd4p5FhZz4YDxWv6Yqyc8qM5656H8cukwjUc4LYsrZD47EnT
         g4OMS8pTIOZ97Hkc0YifbRg9/P1vZSQ2B+Twfk8oxFZaJ0aTHmN+up3cpbnIxPYrsAYs
         b94UHy+oP/0qIy6pIzWw4tZP3tUs3S96pPKMgEAMAlX1hPaAat5w/CX0ywIOeSLdoZNO
         rYrA==
X-Forwarded-Encrypted: i=1; AKwUvBxUf7TpZoqQYokFPUo45e7tjLGlR26T3JwZ9gyHxFrTZi0zXdTKVh9Rkk2+mnhSYaW9F1tuRqXZjQd+pY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYfk1Gts9MM0KMy8xk1ctWL8WMUYaitdM1aLViklyj4z5B7mFb
	wIVyp07h0lg9gmjOB9PYIqKh7ySb3PeiTDAriJUbohPQuWHK9TpMn4siduFrjRzmUBea0rqdawY
	7hQdyP8VHkxHBLMvKNRWbH2p1zCiPqKw=
X-Gm-Gg: AYBFou0q8PfgBblKf7D0nxYwSKXZ0WJOvHER/kLnMYqKGN1W5Kzj5ovxSlGGnJxOU1Z
	o1b2lLkcRF3KDigNckG6sN+rMyY7XaBLy529IA9Ic/23e4kSKe2oDp+ZHrcVPRGxjMqGoTJKamB
	PEFH9gudJRXmffCn4ltoWhDOtJ1M7Pj0idrofs33hyUdEZdVpbLZYoMq07Pdy2DUs3DALl+9/DW
	ca5iHnA8ZbYS7dwJtdbqL3xsfZsu3dSplTvvL59+vihBVkHLvy2HBitKlEf7H0/MsrS2pHflPcE
	YZYn0dqKfS6QiSabsxgq/TPKnfpxxMaIVkwi1a8I3DwYvznrm2H6ipVEX5TcBI8Mr67zs4ebGkj
	PPbBRAylJfMdydGi2OZ+2
X-Received: by 2002:a05:690c:c4e9:b0:8b0:8ec8:d4df with SMTP id
 00721157ae682-8b08ec8d874mr61136177b3.53.1792113071334; Thu, 15 Oct 2026
 18:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0089-v5-076c780eeaf45afb2a53@gmail.com>
 <202610151231.3D8F9A63@keescook>
In-Reply-To: <202610151231.3D8F9A63@keescook>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 09:10:58 +0800
X-Gm-Features: AclHuK8edup2SupqX1o3fhs6D1NgY4SqIBp2hHyIkSs-U-DuEilWC35HgZo3hmg
Message-ID: <CAFRLqsUAQuorPYcEOWJX-hgduzG+CGYUy=ozS-rXB-Cs+VNBTg@mail.gmail.com>
Subject: Re: [PATCH v2] ocfs2: Pin owning modules for open debugfs files
To: Kees Cook <kees@kernel.org>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	heming.zhao@suse.com, akpm@linux-foundation.org, kmehltretter@gmail.com, 
	christophe.jaillet@wanadoo.fr, ericterminal@gmail.com, rppt@kernel.org, 
	rollkingzzc@gmail.com, brauner@kernel.org, sunil.mushran@oracle.com, 
	kurt.hackel@oracle.com, jack@suse.cz, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, baijiaju1990@gmail.com, 
	jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

Kees Cook <kees@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=E5=
=91=A8=E4=BA=94 03:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Oct 16, 2026 at 12:42:32AM +0800, Cen Zhang wrote:
> >  static const struct file_operations o2hb_debug_fops =3D {
> > +     .owner =3D THIS_MODULE,
> >       .open =3D         o2hb_debug_open,
> >       .release =3D      o2hb_debug_release,
> >       .read =3D         o2hb_debug_read,
>
> Please match the indentation of neighboring member assignments through-ou=
t.
>
> --
> Kees Cook

Thanks for the review. I will fix that.

Best regards,
Cen Zhang
