Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794039094;
	b=VrhFUTvHJ76+l0+7lIb9P8WgO9V2LpvipWanyQBQJlqLIjea51h9SZOy2WWo6+dc5fAm
	 /RfHRVsL36hSYXOP+h1M0TwTX5TSBc2oVVrPN+F+8ZaFv5oNq9bi1sMUeFMupdN9bpH4w
	 EUomgRmyq8WqS/Klx99UrfMyCkbYB+IiwSAJ52lv/R5p/mRtPC396LDd65RVDV6fZKXjN
	 SA3P8G34oj8WdUuyySZcT/2s40Bnt9TzfPRn3FVmzXpJaSYe6j8NgeTd/ZbzVMy8MCg/C
	 7FOnr1PE2xdCH6yoKbT3CCdUTeexbH5HWyDa6LAQBS2fvEPClH0O61v+IxqQe9ZGzzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Mhkve0AREgIHZlQo7Mk2vGGc3A9EkMtvF/OVPHAgmwA=;
	b=XohGGzAKFDCGkTVKO/Y84Fuhh9QeJZiJDxRqWtum4gH3qUdF4D59vQnAoF3HvBPQzX1c
	 i/JFZAX6/6mnmwww/zaIYS8+M/e5MmpNWx1i1f9wStUcbhDVKnqoCKhzBqjU3vDhJhHtc
	 gDvSDyi99ZFyJKllpiJ8BIgHU8jgPZG24Pl/a7SijW/6PpHgGLeOkdxWejJh+ZePFuzAl
	 GYcbM76IZcuH51fNznJUeIfNUgeDbZiYQYFXo8G80kRSi6bIbNPyHZdqWdv/3IXVa/kHS
	 zfwN/n3VLa2i6ZVJ8s9HN6VTUzhXFpA8kVLnpDdiEEwuIoHT339ImZ6Ycb+ekEMWMDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=i+BZEnQe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A67606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A67606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=i+BZEnQe
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so2074805a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794039087; cv=none;
        d=google.com; s=arc-20260327;
        b=XUfH26KGS+ZiVV8YFBbDPTuy2FC2hmuXmwRO8y7sQWJ+dkFR65JOA7Tl73FzY2+s0W
         MWQeb5WZUiNj2XQYJEEVlsdvKjwk1nCWrEKQAwc7N1gXVtX25Vpie30HeobCJ0zb4NLv
         fwin8RRtqtplafZtPwOiUrzOSwOj5rwEyj0YBvhP5dN1yF/7z4v3UeMouhDU1BZZXHxQ
         xED0bCOz+bE3ugPauzHyGER2IAew4xjcsww6t1mqD48LQERRPugBrvGDeNLkCxG87Unr
         R0LcjHMhx4ofseN1zBF1LsDfAyEhGrcvr0IkcABsquN1Xa50MH+dqXJ/2JM8ydFqxbgw
         /NdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mhkve0AREgIHZlQo7Mk2vGGc3A9EkMtvF/OVPHAgmwA=;
        fh=ZpZX1FlPYgSUIq7TTDaPAeI0THLgRwayfOS47AFPXPI=;
        b=jYvj5t6aqEDhUl3tjSAJc+aywpVEkMb1wMJnDcZamGTIxiunJ5Pp6unZFmAhf5Jg6I
         NiOavN/7pyiDy4nbin4wBk2hTyFoa+y9O6e6Ze5IxzNCEnxBm1V9+caqIpadM0g9IjtO
         UgB8NFkcltKnITM7/Shy4+PcF8nB2pjPGZCQQkohDbwWl9ShrmhQsD9CiGoaRAPlPM0P
         l2MkYOYfL2JTMtX7zw/zdI6yIF75+4VzDq6v/AgAuWa3cDjBgTYZ6HfN3m+cy63lQhd/
         43z+ECRayvIIfxBIMWxV/5aGuNz82pcCUOR79TP7crWBUuXzMJPTazduDXQzi4MhjGKm
         w8OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1794039087; x=1794643887; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mhkve0AREgIHZlQo7Mk2vGGc3A9EkMtvF/OVPHAgmwA=;
        b=i+BZEnQeLfpuxDV52EIGZHIqys/+bL20VEt/gQlf8jFl3tVdIjfxBnbW4Yz98IZC3X
         khkTl5z0XoW0v25+ivaKgtTIWS9Wj6EcHJJKE8Znm71tI7Ba9JXgz6b3rhJ4PJ0mCAkw
         +DT1GZzhLOpu9xarDzNFWNKHO1eRmQ1LX3aXdIbUIaqqpXB7dVsTDjnidjzHhw1aO+qp
         uJbV3LAbEmVTIAku1aquJe2IpjOF7js7fvbO4PzkBJLiz1D84rTkUfRSIaTjV0hBu+ck
         d2bPfhhnPDcegpKZVE32oynF4bAJyd04a4GxDxaQjrW67/urIOiozVNyfrPntZFfMw+9
         De/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039087; x=1794643887;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mhkve0AREgIHZlQo7Mk2vGGc3A9EkMtvF/OVPHAgmwA=;
        b=BA5Zj6FLI+byI0krO9BcW/onIMPcvW78M7gGQcVoobMVXQqRyvrGD0Jk/xh3OPuiZ1
         nFKxov4pFMqjnkXeEDB5bTDin3xN8a8DdMhZ5cbNbAY6TaHRB8mB6a7/tiasSLL+nIlr
         5n4wFokA6Jf2vf1mrxq1n66o6BM5G+IEcTxk9BzyqBOAt+CIdbL9NBFmEFFJhJA+e7eF
         6N+2WMrIegU708nvwptyAZ+Qfd5dGHnEfYsr/aS56bqiyvUR1KOUfqMKp7POQgBA24ry
         6pxHpqh5ZKlSwg7Wdu7aQPZbxF5a9gw8JKXATsh0zG3JtJ+HxIuCA3xEKKD3xSedEF8I
         ge6A==
X-Forwarded-Encrypted: i=1; AL+hErFndoTVo1w/jZbBApMXaOyA9cHrMl7iXo9z79nzOl48/W/aNWwa537tiVRjJRpn1KkgsDn3kkNY0an3YqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nu9KZpTXDVwKMh9AxGybTt7IbFf/onHw+Fn7EjQVIABolR6sg
	ofqQNhqautwBUAn1d8uyfSQpSr1q5oe2lkgXtEJZX5+kOLIBLDrjckKsR0ZOkqs5NpS4q+MARnt
	OZ14SWOfRIfw38p55FOusleBlOR0ypCRBlHN+jsrVSA==
X-Gm-Gg: AYBFou1KIlvEPBI8Gp+sKKi+61URh+J+BiA/K+ecuguIJI9AKK+2/evZOp6FPs+yeKj
	J9EM9jV/Gm6sVjdI7uHvr4PQhc+gNi2Mq/+PyrhHau0zJn+EbqMBSSOxrneNpmk9myLDClmteZ4
	6wPpkXPuFTgnl2A5VBtMMu4UETPtFXqa1SxTLGosIvgZ66QePoyxbNGuZp/Fzo/vQCnEwX/YGNo
	DMUeGscMYxm5bdDAd8idhjzXnbsidf5ONLz+0JxYwiNK/yHk1DRq+yw4iHnLtdj1R98INmzn1S4
	3gNYMGuPU13AmDOvp5l89nhSOLgcU4pfHPZJTC16D5B1aYKw+QNhOMVGel5Ap6WbIEm1fJsn7yI
	27QWAyXGHHP3ySoZGwE5uj48UBKlJvy4fzak=
X-Received: by 2002:a05:6402:2815:b0:6b3:f891:c2d4 with SMTP id
 4fb4d7f45d1cf-6b597806627mr3457069a12.29.1794039087024; Sat, 07 Nov 2026
 00:11:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101102720.702600-1-jure.rebernik@luxonis.com> <20261106131828.2844d23e@kernel.org>
In-Reply-To: <20261106131828.2844d23e@kernel.org>
From: Jure Rebernik <jure.rebernik@luxonis.com>
Date: Sat, 7 Nov 2026 09:11:16 +0100
X-Gm-Features: AclHuK9iN-4C02LmAAJuI1W1GyctSZGv-_z96k80CwTx7Gbtw0_eVmMh2EFhTYM
Message-ID: <CAD9jT+qH_XkV3vJV1OYGHqsQ0ThwK=HC+X1CCMv=kcojCx5zOA@mail.gmail.com>
Subject: Re: [PATCH net] r8169: enable the RxOverflow interrupt again
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, 
	Sunil Goutham <sgoutham@marvell.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 13:18:28 -0800 Jakub Kicinski wrote:
> Not really following the explanation, TBH.
> In general "ring empty" IRQs are discouraged because the host is likely
> overloaded, so having the NIC force the NAPI is not helpful. But sounds
> like you say there's some sort of a race?

Yes, sorry, the description was not clear. The interrupt is not there to
force NAPI. On the RTL8125B the receiver stays stopped after it runs out
of descriptors until RxOverflow is cleared in IntrStatus, even after
NAPI has emptied the ring. The sequence, as I understand it:

 1. The ring fills. The chip completes the last frames (RxOK), then sets
    RxOverflow and stops receiving.
 2. rtl8169_interrupt() read IntrStatus before RxOverflow was set, so it
    clears only RxOK.
 3. NAPI empties the ring and unmasks the interrupts.
 4. The stopped receiver raises no new RxOK, and RxOverflow is not an
    interrupt source, so nothing clears it. Reception stays stopped
    until a TX completion makes the handler clear all status bits.

What I measured is the stopped state (IntrMask 0x2f, IntrStatus 0x50,
NAPI idle, all descriptors owned by the NIC), and that writing only
RxOverflow to IntrStatus restarts reception with nothing transmitted.
The order of steps 1 and 2 is my inference.

So the fix only needs RxOverflow cleared once the ring is empty. I see
two ways, both tested on an RTL8125B with v7.2.6:

a) v1 with your suggestion, RxOverflow in the unconditional init of
   tp->irq_mask, so the handler clears it.

b) No "ring empty" interrupt. Clear RxOverflow in rtl8169_poll() right
   before unmasking:

        if (work_done < budget && napi_complete_done(napi, work_done)) {
                rtl_ack_events(tp, RxOverflow);
                rtl_irq_enable(tp);
        }

For each, a test build switched between the old and the new behaviour
on the same boot, in blocks of 5 to 10 runs of 30 s with UDP at
800 Mbit/s inbound, about 2.14 million datagrams per run. Totals over
all runs of each kind:

              runs that lost    datagrams     datagrams
              >1000 datagrams   sent, total   lost, total
   (a) old    5 of 76           162865429      411511 (0.25%)
       new    0 of 76           162861980         489 (0.0003%)
   (b) old    9 of 75           160722174     1041366 (0.65%)
       new    0 of 75           160721463         846 (0.0005%)

The small loss left with (a) and (b), 489 and 846 datagrams in total and
at most 61 and 184 in a single run, matches the NIC's rx_missed counter
over the same runs, 492 and 846. So the NIC dropped those frames, while
the RX ring was briefly full. I used the upstream ring size (256
entries) on purpose for these tests. Our tree also raises the ring to
1024 entries (not part of this patch), and with that and the v1 change
the same test lost no datagrams in 20 runs on two boards.

Which one would you prefer? I'll send v2 accordingly.

> LLMs point out that you're adding the same bit on both sides so just
> add it in the unconditional init of tp->irq_mask above

Agreed, v2 of (a) does that.

-- Jure Rebernik
