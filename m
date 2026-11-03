Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689587;
	b=wZMkVHOam8VFCCG+2ZfG3JkXQ9zGHK5opgxJpFkpmQiqGMiqAe6JkEcbgdvJH0MyZLbq
	 vjw/Ak0XGdq5PqeLtXAG5QEwDU6Yvux9QJgf4kIzTC8WzHG+fu/y00Hq6hubY7J7jyrKc
	 ue17UqbBqyikHaT9kti26A/fiDfyP+wtuG3lTI7bTYai8scu9v8gVw/v/e8/v7BYbMeOy
	 1KTpH90aDRJ5s6RNjnC3Dy7ZPGvwJ53WnkgWtlMYyEinIcmUW2dp7Tn42DOqbRpE2WMj8
	 vTs+EsVSkHsaAcRm6K2AU89uAXsPZVb9lDvqCWgd2tXr42e1xp67lqtCpjs/zC6EQPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OldbtTu8SRDvvfag5jP+7J6kAcMehcX+OnBY5+x8nzg=;
	b=MTY1+FoJ4yDZIPhDDlhugZXnPmKyXl0ndAiZJdj5HGuCBAhTHzoYF+dcB1yxSaYgVZYw
	 cERS5kkV1v54V7pKk5d+YKUBPNCYHaC2YvjiSdGm/4z2/cHMm/lpw+TPIAkLbyXA2ZPiq
	 fXO50gB1ph1R8UaXNjwHCPvPJn6m9vIMYyTu7QZGB2LrzDPqD5W2b0IDNA/hw/GkGoM2K
	 0OWoakt51BxqOfmfvyYXej5Q+nBeCTHj3VJFJTuSUGNY4V/Lx8RJ3A79hkIGuoou5CPcS
	 Hf1JilFxchH83/TSZCmrbbM0y9AMGL2M24Ui9OPaIW4px+EYOPBa1QtzvC8/WoTeU2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=FdIjHudX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AED606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2AED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=FdIjHudX
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so3670373a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793689585; cv=none;
        d=google.com; s=arc-20260327;
        b=fSbcTkT0F8MW86wFR2Ma79OdMqMLLKhAiTnD5AXjLKWEjJwcskGbVEs0B7bRaHuc9Z
         me/0hedhmieU+7vfNAV1z9uywYv+TIA2oomZsq0/1ml6/O14PrxooF14XTklcJbhJbD5
         l8OCs7PHeUtv+lqDFvzJu2m3JZeNjzXg3wZOYi7Q3g1GAoutyrXo5R+uFNrCxNUjSxLY
         /uMypTN4VQ3BO7F/wSkBQUiAOUweHsDP/mY63cXz5vi3CTKbV5FVfaMHODvHGqvv3089
         ePouLz8ONsCk58j9m+cGOZ7DRiOtGnqAKonAP0qJFGhkyzhRe6doMwYCKHreqP0hjvxj
         4+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OldbtTu8SRDvvfag5jP+7J6kAcMehcX+OnBY5+x8nzg=;
        fh=PDo2OMF+mLNINl/qFGEsT/OQNzeig9zs0VT9Hdg/TF8=;
        b=qpxW/L75D+n7OXJvqE2AmKK71ej8WYxW7oGo2bdw6nyyEE0ZkPw5cJbIKuHo6XxKA+
         RUiGaiSHvvC7El8h84YEKxl/NUM8pds1EWROj6wfcGzXgNsGU6qM3iCxTd/Yg4TRQIy+
         Ap8hQodM7nCCV7m7VU56JN6BuKlC279R+tmfYq4Uojcj7Pt6AGiQTCvjdyzye1IypyVP
         0UitZZeze9xuwsnkxwt0Nz1/ASNBQdANNHbdDqtuXyder/7ktqJgUy/z8Is4zObJCrWx
         9vjiXVGh3QA2FE4y2Kg2D7cj/Tn62rIoi0wjHDGuSI25+V154MCg/e7dg5DGyx0JTgq5
         PCqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793689585; x=1794294385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OldbtTu8SRDvvfag5jP+7J6kAcMehcX+OnBY5+x8nzg=;
        b=FdIjHudX6MxqbBj+cVmyFTnWIcwpTaNo+lwV2XKjTKXc9O8YyLFtJ6n/uQNjHiD+ne
         HzdKzaa9N6V+VS9M2u1SjHpSKozq38Jc9c9/+bBSDbeeq6TscsRW9RNuxskxZTT7qhMP
         p7AHXRbJkGEd6ZvvMYFWNtnqJm1K/OAKDlWbs2GkHYV4S8tyUBIkBqeMGFKVmujCxVjR
         GUU7DB6CO+zt2Ej1IIJ/McvdLgIPG3kqLan2w+++68UgrsfBSSh+LVSVnOQZH8tjDVLP
         5Wtw7shCie2a5VjrbaIflrOX7fINXYVgaNa+dzBDQhT/32QhNGFc0P3nyFaQCRHwAuaL
         RCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689585; x=1794294385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OldbtTu8SRDvvfag5jP+7J6kAcMehcX+OnBY5+x8nzg=;
        b=qIXpmJu/vcbaDSXmeT3zNc67v9Nh1Zdxfc1HUGcz+ZTo5CxeJvg9jnR83ssJuZCx/M
         /XJZS3N4+YGYHX4/6zcZBJp87Ykgiulb1w30OBut0V2ARBMN3bMm1Scf3lVNbyiZgwm9
         rtcfMYjnBtsveFI5syyMZYNAwlfDN9e8/wq/bxK1Jwxj0jAZ7BpdtCXHtqQxfc7cQWem
         hY5VXiytHQZpfYZeaedXxHF+MiqFpRFesBhQ4RI7x1K+hM9d+DVWeQJ1EEpRqe46IDqk
         1YVuMCcqc+3xIWA/yMBoClnZX42ZPl60z5k7Ighvqd555MQ7Eoso28hqqXJs71uy3zaL
         4lDw==
X-Forwarded-Encrypted: i=1; AKwUvByrOeONY85ximrNoKPUHJ+jOPjZWh584MlhzWateGtiGaeju8oEg1PDJxNjtpeknZlqz+op6PDVw3jBoiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TdRicnabCTxUgltvk3M1oQV5LH5ofOt7OM3wnHF7SrmFCO5gQ
	rTVp7OQjSSQnyhdmd7QZAXG02lkpvoVXymheIeSmVF4qE8AO9nOlesR8PqaQQHVIitqObReM5pi
	SrrWHsM//BFZG3mhfFWiJoHWBb67xkkhe++tzWPDyJA==
X-Gm-Gg: AYBFou31bOdKfPoKJ7yy5yXMg4muapT6jS5sle+wJ8xbAy9TgbH7AD8JsYhTSART3lJ
	ulvN7Tcn1VueXxP203ntSuplCxvg8tK+rBLBcBH3uyyJlKom8z5xOn0aB2JhhPQ2UISEoxTXLGO
	XofGctVFt8nOG/peR+HHTJTD542IiNDnwC0ujqtYegG5U87l9oIATpBDlCt0WzyhqIIYfQMzOEJ
	w9IUUQUvDjW/CeVEVXFZZp9I5xdNZafCLj1OTSHwYi4+JtFBB1zCZXWfhm6NQxO9CZGHlv9gCNO
	6nhyyDPHuYQ8jI4DfncMpG2ywQn33xMSofyEH8PVa+XEWTEgLobJdlpZ7C3Tbdn8TGAWXzjF6nx
	enLwDAF0xydUkLFIsXAYYkTBN5kTSQtIiPhmjNqIwlaGzKAalJoLOvF8/n2+XV9cWKcs=
X-Received: by 2002:a17:907:daa:b0:c42:102f:15d3 with SMTP id
 a640c23a62f3a-c4ca7b45a46mr990474666b.34.1793689585134; Mon, 02 Nov 2026
 23:06:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910123951.1241279-1-max.kellermann@ionos.com> <CAOi1vP9mrDMaABV=KtLRwrGVkBrPrGGBU8mUUnfm6wpdn_rM7Q@mail.gmail.com>
In-Reply-To: <CAOi1vP9mrDMaABV=KtLRwrGVkBrPrGGBU8mUUnfm6wpdn_rM7Q@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 3 Nov 2026 08:06:14 +0100
X-Gm-Features: AclHuK-x6djlZGI_sS2fECMKb-dIFjw_YiOQ82Ze7VryW84eodaM5B7131El-Hs
Message-ID: <CAKPOu+82TXE2PqXSmSa2hPdj1X-AtP3BVACsBEhn=EKuOdjSRg@mail.gmail.com>
Subject: Re: [PATCH] net/ceph/messenger: print TCP connect error
To: Ilya Dryomov <idryomov@gmail.com>
Cc: amarkuze@redhat.com, xiubo.li@clyso.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:08=E2=80=AFPM Ilya Dryomov <idryomov@gmail.com> w=
rote:
> I wonder if saving the error that way is actually needed.  Can
> con_fault() just reap it with sock_error() at the time it runs?

Maybe that would be possible.  I wasn't sure if sk_err (from
ceph_sock_state_change()) would remain untouched until con_fault() was
eventually called, or if it somebody would clear it in the meantime.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
