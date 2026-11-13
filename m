Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587575;
	b=AXcuWG5r2T+Pd0JQjvt7wwQbp9E1X/vo48V5fh1EWbLEZwdONTk1dg9YPmvgWO1H+KDI
	 Wzw0KNSih5On9xvttF76n3P0h6rs5qFX8TepHa+NbRi+LDNvPYOU/chXCqFn4sCmHB7xI
	 EjWwnZtBQp3YRcxF7Jdn9uQGKvM4Q/pGEOpwuyGxLbmxqzJWKwqmyQ6Hr/3Ie+JG64Wbb
	 jaybPAGY2V/8u+BnfsbcsGOBtO/E+Bf5arpBcG3hXE2zKCp2AnhzVteD6NrgpO5qRrq8C
	 sf7kL0xOMMAI8bWgK947MHJMIIm6aAcMhJb5NUWN8aVKsTT6zCLEvchk40jmzHUxTtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OhQ4VvBeytePCKEBDRXAk9FEqcTaWFnpXRWzd42nCrE=;
	b=qyAXdgmdGvY6hby1GBrnS1F6T5VHTfS6lJCpc1dpaBmMJI2HNLu4LY5Tg+i44WfdATR4
	 p6gfGvFmWZTVvJU7jdEFwNoCYMEbnvRnEuyrxFz0HhZCQifHHh9k4BVWmIpfVpGfMmPLY
	 ELG8YjXwWTpHNbsidw2/Bzr4CjlN1ile4f5LbnYFPM63dtKHvTDfMaEofZ2cW/9ZToW1p
	 91w9pXFPT6hTKEdzwm89aZj0km669PDBnkND06eX0x9Qdz1vbgLvpMU2iVjWCaNXg3gnQ
	 qGJgYuVFpHxj9gxqx/IEy2Fl5W9j33r/rqzUMIiZVPCT9PvX+5cqsOYjxTTQlDjHvUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WGLfZu+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C1F606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C1F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WGLfZu+N
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4697404c2bso202209866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587571; cv=none;
        d=google.com; s=arc-20260327;
        b=aipos0P36sgnCL6jKWNuTEyU++mCOqknGQsXaUWjV5vklaHG8t2I12gbU1SmFyw9f8
         xtDAfSaxqTG/mDBOIN2K9jnIqloLHH4AWJgUnEgBdmYxmiR9FUNXsl4NfBc00b0AYT/9
         c5iPeU8u+07CPzCQJV4hSRoCCWf35urYm9rdKDjzhbKRKINJ6DTdgmCnMcUrfaW5W3eM
         8JuyTBrMq9OOgjtFiK9d8GGf4yLFn8oWR3C6a703bRMer50ikfZvgKDeAZ3wX6aTjRkS
         qZRh0yVCnlUb/1+t9z39cMBotvJ8EKYyG6QuGqKc3C1kzHly7yL7uZZTDiV0R+YYADve
         QUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OhQ4VvBeytePCKEBDRXAk9FEqcTaWFnpXRWzd42nCrE=;
        fh=upi0xZhde8VZNPEkyErNHO0ZDT60tDvHLa5ymL0l0VE=;
        b=mMPJJmJuPbH7VcbOyj0GnBWtnjBNktAAeE3VmVIJD3jIbl22HhCuk12XFFJ7ivwiLe
         91WGwD59Xr8vMCahDgnUwE1Mm0XSXH+noQCUBPwLqhj6aitW7EiAoNFWzNWbz4KK5Dgv
         kAPtup5yC6mTaKBUe6dRiOnHJZGJV8Z4xjdlG8RVliiE3s9eG/ym5XvDiv+0cE16t/1q
         j2yTZ7yuHShSrvwVESK37uNYH2yCDUiHAw1hhodA6br56e4mY0vB9LqYEOEwFIbMQmWn
         AXNTkYqwybYLfaHUg1Y1RHEVQTB/Mkh8mVZHMf7nLp8D9Shj5J8UCC/PkcPrcuKhwT/X
         tMFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794587571; x=1795192371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OhQ4VvBeytePCKEBDRXAk9FEqcTaWFnpXRWzd42nCrE=;
        b=WGLfZu+NiPQoyA0vDbMykLD+krbRxp9B60Od8eNtRf0KH5qx5oN1mBHD532BaYYPLQ
         nJ3wGbxu8hRo5MUJ9jNyQN34I7wCzdffdgMt4QK367T0OJ7XTkkNQ1IV9pESwebmF/of
         q9UvfIlWaKbJPI01LWTmZYQkW1stEGqAXgdG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587571; x=1795192371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhQ4VvBeytePCKEBDRXAk9FEqcTaWFnpXRWzd42nCrE=;
        b=UB3PytxKb3p3+hGnZzpLMwbdUTbrJSGZunZttcKXCNd42rzjzBeyzaVn9EvEB9+QPD
         fEFDVHF2nUim7gXZyEaaMzVcItVgn4HDB9u2F6C4ry8hrrxTtp8FfmIFiVbuP365yvin
         h9rIS3SpgRj3Mxg5VrCsH8dd67MoRIj2wNmzIFef2pYefrgg3Fa815Lbk6RoKPOrazLU
         8LD7SsYuu5sQyXsFEzRJ7ghHj7Z5GaXrLWoJDRJhiKot2xzgCwn22YVw+g8JHUiA1xFU
         cvuTAZM+jAktVS6Lpwq2zvZxrh5h1yX43DgdLWZLmHxmruF1LlsLSec4pO62rSbGx26o
         1Ojw==
X-Forwarded-Encrypted: i=1; AL+hErGuqjUFvBb/3dDnvThHQ9jHXraxeRsK8xnA2vEcaiF7U6wXBMcqOD6EuVLrg0Fx21PGGYG3y43jwmd1qtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aGzTxYQswIoP2T4eDF5+ew4GYnKDJNnFJKzcY+uH+5zEiqr85
	ivOqPQ+Mq23KuS4UedRW5QtjhhKa5fEOAT8TtVGmQgQhjEQ1F0VaYh8fLWDMJi3AnXtIx8eWl1L
	aD3L1LSOrnBiZNXxagk3aJiTw4/gG69SNO52GfDZ8hrpZbBnw3+btL3NuNA==
X-Gm-Gg: AYBFou35OmmMA87OGgpDhxV43FSV6ZRBvxgYoAgPLm1zwZ0KADMKVV5BmVEr+iS1XfX
	D7DHTgxkSiXxy7JjnmaLsGUD6AHLm6kO3+RXTYhj/z9HPLnTKMa0UBtQGmP0EdwGNeM6onp1qPO
	SX+dMv0Z+m6jeV7GgygYCv7xjg+E8O1X/FU++oBS22g6HagU3gCkNGFF60JJ5efZTrqDeDkXjuL
	GQxM+M+ulFokf4LinPgjpjQ6562p1T9VRz7gW2cAsy9WX5Pw+vJpJug0ExVH1x2qHynGUyxF+Zu
	O5P+6YVJxG/xYtbPXpLOu9tmYwQFsqLe+rI70RP5M27LGFBsOWEZtB/6B/xMu33BsdJj6p+AgdU
	nQmj/AfnWi2Fn44F/jZrL+rNZ5Ft1Hy4LllEFeuZnhwKrJreL3vOlU312yx4rtNQ8JY7Mjw0HG7
	TNHeKNVJ/H0oSIpIXPvSNgPNYW24e2BQojQwPNsbAqeluPg67FmO80uoU=
X-Received: by 2002:a17:907:9304:b0:c46:9ee4:8f0 with SMTP id
 a640c23a62f3a-c50963d470fmr304538466b.10.1794587571235; Fri, 13 Nov 2026
 08:32:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173812.18696-1-piyus@iiitd.ac.in> <20261112173812.18696-2-piyus@iiitd.ac.in>
 <CABBYNZK4akYzoWc97v8FTXc77+godNTHASn8ZnfNji=jPd2oiw@mail.gmail.com>
 <CADq=QSz7GMXXjsykU87=6yCcWL1QX3NVOpxjQpJD3T2KG-nssw@mail.gmail.com> <CABBYNZKeBYiJTH6m+yo5bqfpmVO6cpqLcz5ZdQ0xvw5kjnGN9Q@mail.gmail.com>
In-Reply-To: <CABBYNZKeBYiJTH6m+yo5bqfpmVO6cpqLcz5ZdQ0xvw5kjnGN9Q@mail.gmail.com>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Fri, 13 Nov 2026 22:02:40 +0530
X-Gm-Features: AclHuK988UL3AkRvIvimRf7f5ka9T8GhR_5iJfAVFt9_JRB0HJ4AO-rpsVa8HZE
Message-ID: <CADq=QSy6Z_5Zj92mQQZzOCNwYpEa0eXHY7DO685koCPEJ=0CBw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: L2CAP: clear the SDU before the receive callback
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good, thanks for taking care of both!

Best,
Piyus

On Fri, Nov 13, 2026 at 9:53=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Piyus,
>
> On Fri, Nov 13, 2026 at 11:20=E2=80=AFAM Piyus Kedia <piyus@iiitd.ac.in> =
wrote:
> >
> > Hi Luiz,
> >
> > Thanks for sharing this!
> >
> > On the double free: that free isn't new. The block this patch replaces
> > already did it,
> >
> > failed:
> >   if (err) {
> >       kfree_skb(skb);
> >       kfree_skb(chan->sdu);
> >
> > with skb NULL by then, and l2cap_reassemble_sdu() has the same block.
> > So if a shared skb can reach the callback, the existing code
> > double-frees in exactly the same way - this patch neither adds that
> > nor fixes it. What it fixes is the use-after-free on chan->sdu.
> >
> > As far as we can tell, it can't be shared here: skb_share_check() only
> > acts when skb->users !=3D 1, and nothing on the ACL receive path takes =
a
> > reference - the only two skb_get() calls in net/bluetooth are req_skb
> > in hci_core.c and req_rsp in hci_sync.c, both on the HCI command path,
> > and
> > append_skb_frag() doesn't touch skb->users. We may be wrong about
> > that, and if we are, the fix belongs in recv_pkt() rather than in each
> > caller - it frees the caller's skb on one drop path and leaves it on
> > the others. Happy to send a patch for that separately.
> >
> > You're also right that "frees the skb outright" was wrong: recv_pkt()
> > consumes the skb on its success paths and leaves it to the caller on
> > most of the drop paths. I have a v2 ready with that sentence fixed,
> > but the diff is unchanged from v1. Please let us know if you want it
> > posted.
>
> Ive sent a fix the 6lowpan, so no need to respin this, I will add the
> missing Fixes tag that sashiko flagged.
