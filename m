Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259213;
	b=phhL1FzD+VqVQORVv9EYxXEFdINzF8fAjG7Ly2Pnr6ngLSFjbm6MBUlWAdV8fVrlcdLC
	 Ue90zuzM1+eiHYkiLkE2S6uKkRbpF5H3ewl8MsZsFKXQzpb9a4sLSs9mZuvmZSdkqtVLV
	 xXt2K2OiAGRZchb0yBo+p8N34rpBdCE10uCiid3ebSQ5WKtSyMvZzSszc4XUYJkeMvlB0
	 RgJ/c21+xuvnB2fYNCit0BXW7IEhMMu4yeB/q5d/pmc/vA8GSmkWJrqWuNEmBzSztFE0S
	 EYuZciIFZoMoQMNlZxqOToBu8A+4maj+gPMBUUsGQWJhQcMGuMrTiwUFWOwInffOZcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xIRUMFb7W2iDxt8DmgrBzYpVZ/AXxC5b6re+MsIq60k=;
	b=bLmSIM1a+qp18gXYXF8T8yrlRMylz9v2M9bTwVuk8JbqesQK/9+EOSxbOkSfNYiyyQTs
	 hljfa7MYoTx8g+6hrOCLDdWT53IYRHt6gpsMp5Gulan1R2jytALJhbxxyEzVnqGNLITi7
	 NWCg84NBjlvHWHynL5vJlgsTArNkVxmr5kptvNAZ3fxttWCWMBVwx4O2SX0/BuIH7spYb
	 FHNflumpOe2OetE4YTdSwaNu4D3Zm9WOKdDaZhJ/jEDBFrjTizyBqTGDeYRxg1W2kp6VW
	 8y24uF3un9VaG4KSy5QtC0TQZHH8OqdHEex73jUw5C5Xta+hcvQLxlHnhSgJ7INYlxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0YQJ0ag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777BD606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0YQJ0ag
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c450ab1483cso221290766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794259212; cv=none;
        d=google.com; s=arc-20260327;
        b=DHvPgGzu3ysvaKxm9eRJJSJIKFkwSorBMDlTi6pyQbxOIDx5MUmI+1HkFFCzuewsat
         6TD06QUi6D0fd1Bruo3Vox7Z1WioFzmxcf4JCCKbFCSgEj0YC1hDTKvLEtaCqSHvwfMY
         NJylM9yhodNjJCnHYyKkLIORsbGDVLaEggMImLrL6GyfJq/pe9tsnQChbTrdI8gp+o3t
         JOzC44/2JobnL5nVFuyQvHC4zffLsqu7XkWDl5mVQ27hjl6my0eWVq8WdytVfihitcym
         0WGKkgMYIYbj3hUbpb0qAGp/N/dvP6wXNUPaomIHZ7zftzQCpT1jeBNUAkdQeo9McJ7z
         yGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xIRUMFb7W2iDxt8DmgrBzYpVZ/AXxC5b6re+MsIq60k=;
        fh=kDJv3mCpqyZ/psCOXNX1Iyj3pBYgAc/9d9pjdKgVKvE=;
        b=bURRuEeE6vBdL3bSgkSbdLZvVabqMmVVsNTl2wAVcOcrth3MytZYf8E7MvrjUNecFm
         qZtmQgCBBM8jFmOUCRSJjwGJ8lucVQaSUICOwpgZorzza5v+m4sVO9x8uwlhQ2A3tWF1
         Jx4nZBgRfnVoTpCou7NEFIXbPEoTeZp0ZSF60GJ7Bjx8QWXPzEGzE3G9/h5VwGmUXgPJ
         3iTONAF3dnEosR5iD6SW5JZF7HJ3aVpBuYAm1va4Evy4VAAHNrQe+SiNfwWDXg/P/l4j
         6G3s0oq4yclUFoDLXVJZ2SySANa3tDdZoHCJFklHpFTG+wAJ73IO7y8ymsjXS8NAk6/D
         vhxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794259212; x=1794864012; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIRUMFb7W2iDxt8DmgrBzYpVZ/AXxC5b6re+MsIq60k=;
        b=t0YQJ0agbWnUbyo1uAvhtKtU2A703YAJUlA+iUfn2qc3b5YJkwfdgoy8+nYvimMg/q
         hiFEzOHOCpGRo9Tz9JJ+/HdlkcruA0m7Hs3iDVfvhREvRy9QVLI4jQHPzwKINABCNe9V
         pUYrsOoCgwNQIx02ghsJmdvS6xngZECtEsASzE4Knq8C5sRtIwReXQvkcQYIskGQsssu
         HcMe9wKZert8wtSmIt5FJ3iGwp0qqXkznTz1255vw5T03U6KLXvzUi9LV50u6W+pqZms
         t8ReFj36nvp76WYxRuAIQosTpNjvqa2jVKGmyO3OWC3Bem8iMyBv1ck/0NQIkmQu72cc
         OoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259212; x=1794864012;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xIRUMFb7W2iDxt8DmgrBzYpVZ/AXxC5b6re+MsIq60k=;
        b=oUlq/LXzglwBKPD9H3rGzTQ9Ms+bfS/kK2F85/w1ofs54EVarKD2Y54eLqcmBKs5DA
         ad3FTir009sXgPUgOAIAjrnlTNrC1wUahAJ8VijLpiSjiQMzcD3rYttoTqy+znXJOue7
         oRW4b456pHBdMwWisDqD0lcWwUuhzWbYsT/Lr+nFHbO32lNZ5Iu7rTP6KYXFlr4UcMEC
         QAbDihPhIUkVcoqhhjoEVbJj1QjJifEpvdw9FFfisdsxPV7eKHv6J05et8vxGuGgPR9S
         kkIXLKB8SmL6EzKlmYOUuHdBBkRHIBDjVSw9Zxe9Fe34K0Ko6IbEXLcw4kdq3mUve5Tm
         V53Q==
X-Forwarded-Encrypted: i=1; AL+hErExLuUA5wsGj4okN9K9chseb8+Z7hOM0LXA4JdjL5nKGjRWosKdkVnH6pcD4q6HHESIAdes7wKwLQdgAPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3pFCgCmcnKKuHBm5bi7fRPwr8ioL1iPVaDqtIeVav8oCSIgkr
	cOZ25X1Mmvc8tRWqb30/MTWww/pxqWZWcdLDDnLzdoeynrozhh7yA4w9Wb7/SzhADUJOaZj/s6L
	N5xJ9yeiowbUX3W+ABmbfXU2uf3Y82kQ=
X-Gm-Gg: AYBFou2rQZDSq4MjVhbK83aR+I+cuHzFHpeRc7HcReJ77LWxxuDiQK8qqfwzGYk0eY5
	1/5WwwQJeQH6JQjVuvkUNAh8uQr2gqz/o9Sp6QgiNs7NpwKuwdqf0lxuaJ+AmSKKhUrMdazkxYG
	tr4xJO9cRoeFsnfPvD2/MO2VMDPlCAizAMcyanvmVAaVZc6WBpplRtabGD6x73UMLQ+HmMlh/fk
	NsJth/ZV3GmeEIeenBAzHHVVI8cWSi1tb0fkLqFyuyzjCpPzgCcvjlRoWH5w7k8RoFar2sZP3PV
	1tYAGaSmrGjkiC130yXatnHorQZ6FhzYbG1YyEUHSzWi8L//s8HOeMIX31PouLVES+v48Pcdhsa
	UcF5O7/3rJBPCWfSKdoCI9LqMbKmkJaKUNHbvzA==
X-Received: by 2002:a17:906:f5a4:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c50496a40a9mr43078166b.28.1794259211749; Mon, 09 Nov 2026
 13:20:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <autLlP81HFeMyICc@analog.com> <20261106150124.3630781-1-stijncleynhens@gmail.com>
In-Reply-To: <20261106150124.3630781-1-stijncleynhens@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 9 Nov 2026 18:20:00 -0300
X-Gm-Features: AclHuK_ru7Vsb58s_yEKb9uIA5rl9_ZxNkKKy0_jnJiTtgUn0tS4mNE0wjCb1to
Message-ID: <CAJq09z4gGczRVzhrV_WwhRE_jpu8UCA+PKca6MuQR9AgmQBsbg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net: dsa: realtek: rtl8365mb: use IVL in VLAN 0
To: Stijn Cleynhens <stijncleynhens@gmail.com>
Cc: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Mieczyslaw Nalewaj <namiltd@yahoo.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > Yes, all this makes sense. I actually remember doing basically the same
> > thing back when I was working on this, but it seems not to have survived
> > the final work by Luiz. It would be good to get his input on why.
>
> Luiz, do you remember a reason the IVL setup of VID 0 was dropped? I
> could not find one, and the switch only matches the driver's VID 0
> entries with it.

Yes, it was there:

        /* Add all ports to VLAN0. Not sure if needed. But at least for
         * learning, we need to set the ivl_en bit to 1 so that the switch
         * learns with {VID, MAC, EFID} rather than {FID, MAC, EFID}.
         */
        // TODO find right place for this
        {
                struct rtl8365mb_vlan4k vlan4k = { 0 };
                ret = rtl8365mb_vlan_get_vlan4k(priv, 0, &vlan4k);
                if (ret)
                        return ret;
                vlan4k.member |= RTL8365MB_PORTMASK;
                vlan4k.ivl_en = true;
                ret = rtl8365mb_vlan_set_vlan4k(priv, &vlan4k);
                if (ret)
                        return ret;
        }

I missed that one. I might have focused too much on filtered VLAN and
missed the vlan unaware bridges.

On any vlan4k write, IVL is always enabled. It is just vlan ID 0 was
never written by the driver. We would just need to write it once.

Another way (untested) to get the same result would be to call
rtl8365mb_vlan_4k_port_del() on any port for VID=0 during setup.

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Best regards,

Luiz


> > So I'm not sure I like this function being added to the vlan.c
> > library. Semantically it makes more sense to me for the main.c driver to
> > actually call rtl8365mb_vlan4k_port_add() for each port, so as to
> > explicitly say: "all ports are, one way or another, members of this
> > neutral VLAN". Then you would get IVL automatically.
>
> I kept it out of rtl8365mb_vlan_4k_port_add() on purpose: making every
> port a member of VID 0 also sets the member mask, which the ingress
> filter of a VLAN-aware port then checks. I only wanted to change the
> learning mode, not which frames a filtering port accepts.
