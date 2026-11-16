Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858269;
	b=lmdiihJ+akDTINUBmRf2GP/5J7ZQHPwLDg5BEQcQQJMCAILPuhu++u7qvdDXTzi5G7k6
	 QKC4v5hJ9kzvQManMM02hNqKdoJsWT2CnnZb/9KE9rv6KMD0koOSOruPGY7Hup76RLXov
	 nNprk3gPyy5nUIywr0nGcrcP9xJeBxHkx1w2OGnwKKBVD+qAnGoOrIjV9BO7Uzaeqxs97
	 fkyzC0vGW/dIbQVVhoeq1eDGjMxFNijcdiFbptwzqEW5AU3sxnU7htpL0n7caPcr1lD0V
	 vheevKT/KtvKg7f4VxRKRK2Y8aDf0IjmEJRBo6hPDfKofQNpL3pBvfQaP71KCDgnYLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0GXAZLfuLwKR837KM8+lDytn2Dxn6IUb2Zze7LoZlrA=;
	b=cLJPjmzivksXduxitUPFSeRK7R4xy9iKoSNcr/rc6vPvbE8WlvukKwWsFdgz8RY33IBh
	 ClOThbd/x/bLflO9xU5dwF8/YcJkeMI6G1SG6XSU/nS4+Uc1zUPupLrV7wkjwpPYH4Srz
	 bxHqH/7qRwtgx+ybN+Fxdamg4KFi+dZK/tGfEAX5a2/6X4/IaYbQ8ngT6WkWpjjjkcV3O
	 6+84Hqpx1GrzlJsvQ7s5/G2Hv/27mdhv1w03NFjK7xKRSpOSryzT05Vm6Q0H5XQfjJwHg
	 q3LJseWX9FOB8YzvFtDn0HhePLKy2GAe9x8wFV8F90Vb9bJZVWXFNR0JuNMWrGqbe2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=BB273hOl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D90606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D90606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=BB273hOl
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1635015b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794858268; cv=none;
        d=google.com; s=arc-20260327;
        b=a9vksM9tegYtf9Gqisd8Fwaupa6ANxeynXKgqumPud4yEz0UfN19ZQ/Oy2Upq6+kuI
         JNCSq8pcgdD+T8R/0ujhfmtCNZytoQjW2FHXUFoJxvZ5qmAo0PXqfeKcXB9BF+MwXHOK
         Z1KmqUb1ar/WoYy+oazOHMrOmz2kjX88M9DiZO0tbkQhMz492CruMyS3wG6QiokukKq7
         O/+Vyq3zFlEXvj62l7gGvMu4yEDIR36igZpIp3GZnHbvONkfCv9q3Xv6IhfuUeYQO/6H
         PUrY6rE7iPVULRpprv/5I8YmnKmPOMBPOCyVCW6va4oV1BfDOj5SEJHd0GpJlCgukb/V
         A6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0GXAZLfuLwKR837KM8+lDytn2Dxn6IUb2Zze7LoZlrA=;
        fh=AH58cNlOMTmoBvdiAwFUn8Gi4y1gVVRpRxY1YvPB9lk=;
        b=Adli7SCAqrJgIWsRlZVkV4tHMC3Yo1xZWfWXZdZzZ5LhKzxU/KEC1qGiOHF4Md/grr
         GSA5o8KK6m/aYf5pjXdi/NAv1vrVQzTGDxnPtGsLYmOXsGzBYrEM9avAfF4NgR2uS9g8
         7F6KuO+WDJS7xQ9BKutwIb/LKNZOWDUAoSyNY7AJmEJYVPkd2dkydAa9pfgbtnMQdjIZ
         iucWbO5a2rHN7z5NzXsM+XQoolSDaYLVeSux1blMY+lZ/wzHaYXPcQD56gMo689diQBa
         TEY1rcJ0aESFF5o56u/mBvS/1dksFp4I8+SzE6uwdXeLQRkZNLPf8CtX5A1N7ELA1Mjx
         dHtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794858268; x=1795463068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GXAZLfuLwKR837KM8+lDytn2Dxn6IUb2Zze7LoZlrA=;
        b=BB273hOlp1RHicNqOSt1vyZZx7QGtqLiqUQwym4iCeGlGbQ5Sucmn3aYqnXXfAAaCr
         pZvtAbeGyk6DSrDkYP8/v/Cxb7IAtTfhWbJ/nG8+19tmQLa/QUYN0ms2XUzO9EOwR06p
         3jjf5Whzo9aT1swlNxQJx2BG6riCNowTM2BDcS0OO6PzQCyP8+uQcyUz1kBpXmxYbCOT
         xxF9uJ5+bd75IHiD1qou/Tw9FSDQfCyhT19/r7mJmbXBROb4dTmn+tAkmpLEJG/U9CYv
         Ky2sx9gEwcEhlCROugPhttKTwKUj4xI8DIyjit1a30pVEgN+O6HhBEtzu+O4tq3t0F4Y
         ZXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858268; x=1795463068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GXAZLfuLwKR837KM8+lDytn2Dxn6IUb2Zze7LoZlrA=;
        b=XNq7gUg9mpU7KECIjDG9DMf/+sVaZNAkxRjfYEWwXt4tVM/EFv0CXHIg2/y28URA/O
         3ImG5g8aiy/+Na2UwZTQbdUPmb45OqwhPHp+R/jZgmEIU1+FToH6t0LBl6S1iisIycwj
         BjTAWO+N8jWeEe5Efxfdu54tjDV4+wpmtz27q7ppnDms+aJvR9ZA/3gWdkmEaRSGyRDW
         ZrcoEskYL6VsJBruWMs+/9bIaZN+9mRfGM3PbWidnJzIokuA669GvGjyPSNKpMHtTuPK
         ndGlOXBuP+ZWVr3UFif2Hs9QM82Qf9hMtUarJdynzkK3/3k1RC+XT9j0H8mUKgrpMzkh
         trJg==
X-Forwarded-Encrypted: i=1; AL+hErGYYcHvtn7pyq5oRugYdB17fBqc7rkFZJmwNQiXlQcTzGXr1lVg9ff0SlN2SS6FoMxc56d71XhZfBEnkgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JpoLmbchejCM9JSTgPrLzV/MMcrVsI67YgENx4bQwsiPpBD3O
	Q8TYb8tJvacdAwHfxG6X3fVs5LThVWnGylv4SLjkChly5uxOoZLKH0rdEe7ZoX0UpVyvPzMmY28
	+OOn2KxMTFGEfxdD+oSria+x5HaFciSipJ+CgolmeuE9vWiYC0as=
X-Gm-Gg: AZFdTZeq9yR52a5YoC+YxmzrgEjyIR1RTEivz5PdI/Ysc2Va+Sy7wqyrxvH0hFe2URH
	yTV3HV7ATJaMiVcAYEFJfPCQEYRb4nWawayhHnvgYKSNJiXA0GgowSWEoVu/pd2uBrUYv7rRPXm
	z+Kz1ZEplwKYzqiS46kMsxvjfGVUoDOyEAhRUKSJeJJysh0YSyo3d9qCyF0mt5jwosurYoxbPAN
	ir63Te6kMb40tj0m3Yf2/Yq80OQr7ytWQI0DEJJ1+jvAyd6HEyX1tAcsLkQyq19qyu/Xpvg9cm6
	dcZX1Ud416w8MNXreKmtvYYrl7QE7U3gFXdS2GhHEW7rxw31L6N/lpjFmtvziesCCr2PEPwrBLK
	iITmWtXNP24wG2mvKSPTZFQ8VowHVbmGH4P8nSogvKXS1qFu+AXw3QFl4mbta6bDDPCMi
X-Received: by 2002:a17:90b:28cf:b0:3ac:8dfe:8ec9 with SMTP id
 98e67ed59e1d1-3b1b0b47416mr9502656a91.47.1794858267644; Mon, 16 Nov 2026
 11:44:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031211258.1626829-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <b446cedf8a7977337389f8cdc1e5acce@paul-moore.com> <341401a3fa5863542319566051bde1ea@oss.cyber.gouv.fr>
In-Reply-To: <341401a3fa5863542319566051bde1ea@oss.cyber.gouv.fr>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Nov 2026 14:44:15 -0500
X-Gm-Features: AclHuK9Yi3vY1OnQknBBHtyXXbTvT6zYozVYLT34YTLRhSFwwbQtKY8uTdDr2v0
Message-ID: <CAHC9VhQECaSwpjUgSoCgZAgEphEk2jKnZFESn4ivM6JAjrC7HQ@mail.gmail.com>
Subject: Re: [PATCH] audit: fix UAF in kauditd_send_queue()
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: Bradley Morgan <brads@mainlining.org>, Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:44=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<jeremy.jean@oss.cyber.gouv.fr> wrote:
> On 2026-11-04 21:36, Paul Moore wrote:
> > On Oct 31, 2026 Bradley Morgan <brads@mainlining.org> wrote:
> >>
> >> kauditd_send_queue() grabs an extra reference to the skb header before
> >> netlink_unicast() since it may need to retry a failed send. If unicast
> >> delivery reuses that same header, the receive path stores the
> >> destination socket in skb->sk without taking a socket reference.
> >> Consequently, after the receiver consumes the skb and closes the
> >> socket, the extra reference taken on the skb header makes kauditd
> >> release a header whose skb->sk points to freed socket storage.
> >>
> >> KASAN reports a UAF as:
> >>
> >>   BUG: KASAN: slab-use-after-free in sock_rfree+0x44/0x140
> >>   Write of size 4 at addr ffff888004f94140 by task kauditd/31
> >>
> >> Clone the header before netlink_unicast(), then use the clone for
> >> delivery and keep the original skb only for retries. If cloning fails,
> >> handle it as -EAGAIN so the send can be retried.
> >>
> >> Fixes: f3d357b09295 ("Audit: save audit_backlog_limit audit messages
> >> in case auditd comes back")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> >> ---
> >>  kernel/audit.c | 11 +++++++----
> >>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/kernel/audit.c b/kernel/audit.c
> >> index 9412af9144bc..5e739fa606be 100644
> >> --- a/kernel/audit.c
> >> +++ b/kernel/audit.c
> >> @@ -790,6 +790,7 @@ static int kauditd_send_queue(struct sock *sk, u32
> >> portid,
> >>  {
> >>      int rc =3D 0;
> >>      struct sk_buff *skb =3D NULL;
> >> +    struct sk_buff *skb_to_send;
> >>      struct sk_buff *skb_tail;
> >>      unsigned int failed =3D 0;
> >>
> >> @@ -810,9 +811,11 @@ static int kauditd_send_queue(struct sock *sk,
> >> u32 portid,
> >>              }
> >>
> >>  retry:
> >> -            /* grab an extra skb reference in case of error */
> >> -            skb_get(skb);
> >> -            rc =3D netlink_unicast(sk, skb, portid, 0);
> >> +            /* Keep the original header unowned for retries. */
> >> +            skb_to_send =3D skb_clone(skb, GFP_KERNEL);
> >
> > As Bradley pointed out, this appears a little confusing as the existing
> > approach of skb_get()+netlink_unicast() should end up doing something
> > very similar to what you are proposing due to netlink_unicast() calling
> > into netlink_trim() which in this case should always end up doing a
> > skb_clone().  I'm sure I'm missing something, can you help me
> > understand
> > why this proposed patch is different and solves the problem?
> >
> > Also, do you have a reproducer for this?
>
> Dear Bradley and Paul,
>
> Thanks for the comments. The fix is closely related to the current
> code but the main difference is that netlink_trim() does not always
> reach its skb_shared() clone path. Moving the clone earlier in the
> execution avoids the UAF.

Thanks for the detail.  With that in mind, I think doing our own
clone() is okay, but the ternary operator for error handling is a
little uglier than I would like in this case.  Removing that, tweaking
some variable names and comments, how about something like this:

  /* clone the skb for retries in case of error */
  skb_clone =3D skb_clone(...);
  if (skb_clone)
    rc =3D netlink_unicast(...);
  else
    rc =3D -EAGAIN;
  if (rc < 0) {
    ...
  } else {
    /* consume the clone and continue */
    consume_skb(skb_clone);
    failed =3D 0;
  }

--=20
paul-moore.com
