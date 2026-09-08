Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B865476EB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877632; cv=pass; b=GELlrtQqN6Xoel1ZD5KBAb6W1dXF4JoLp0HXrkufPwzZy0n2QZ0nRnVOFkdAJvMzvrauandYMxYm0/BAf068OYPrVheCctFF4rYlR0n/4b9rWIxGmnubUEMG1x2GDMeiNTeZPUASxDDoLl4Q0dQrV5GqdC3ut+blNIp5Ts9ovFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877632; c=relaxed/simple;
	bh=G40gAzXJ/KRD6Urj3yKZHUekRy6EMDt5/M2dwvTRP6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V64v2r6iFhwBqDNd++o7XBVNmWC3Ze/M0Lne/heenaeLhyza7+gsJgOC2sXFJSU4zoXfYQKgBGvU7Hg2PvEg3YlmUPzx702VhooACp5poCspnun/+isu9I3GCs0wzA8nksUr4+BF1u0Zcrp9VKI+MtCjOX8x072upxZSA8Ky4Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s92MVl+W; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s92MVl+W"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso5043404e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788877622; cv=none;
        d=google.com; s=arc-20260327;
        b=kl0+Borj0rexTcK1tUOfkmWMgxDOegAofXxz0/HkwM92SunprD+PZRoY9wMRBFWWH1
         wge0Rz9PTL6RlAOOxWvsj8XBigsuEvMhzHWZfsY2sRAb3vIFW5sO+ku5IdiOn1PXydV/
         G66YnmW68sil+9dRUaL+ldve29OPjF5Lrj18fmtuPzjMQE0OjCgxURE6vCf0uh/5xcje
         bSj6ZSsa6yRhzITHUyytBKq/dmQu/1nU4fKKGZBydFlRu5Nwk3YwAt00MpKGGsMCU6qt
         6Pp4aeNhFHzEe+5W5uQ8pKc2sLF9dGDRCmA6NZ/B3pha88XK8B3OIS1tZL1zQRqaxHOW
         7L0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dpd270tknPT/7fUd94zwp0IEB0jSoCHjnSje/HknrcQ=;
        fh=PzA5d0liA0NU+B6sPCJpTT8IZvfRpMYJxC+k91o98vY=;
        b=Uz6pJgMONL80WL/AUJZqmQYSk3Ozgw7UKR2D/s4Bo1T2rGrlAAV4Whn52Vd1hG4w3w
         phMAdVVkj+dw+P5bQFy9F/ftmaLVtYbC3urhveYxWKK9I0fZlh0SA+VSNrIuRSauQABl
         SZk5qzOnFOGS8e1c3HZnPlFThI9ImWLCVfTFczYUQ34klbZS/YqE0CAjbCOJMUtbaR6X
         TDgNDyqNNw+3Yr+BcPTpNyrWSppIyJQGu3vSET13oRUUUSDLmE4BTJ0vEwdQANuEbo+v
         1Kzm6TANUjnluc/1DvNDpRTSkLziOom84ionoNNJdlbcc7sSoFLzxp7RJth3hPMjYA7g
         A4HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788877622; x=1789482422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dpd270tknPT/7fUd94zwp0IEB0jSoCHjnSje/HknrcQ=;
        b=s92MVl+We0I7bRSruOBeWLO/N6wI4qHorBGago/LfL5vqA7E/qxwkKevhKA+0Rt4a1
         QNERmG4PpoQC64/KT1KZWYeLY1kPS9DvIg80qajHeQGrqGjItI+oyKSVEG1bHpvGnAVV
         hdsWJDuQLiGr63ziNHu7nnQmpIMH50GfkvNBhFl3/o7db0CpeZMlfcj3M/1XtbQMRh/z
         o+PwEtRFQF9DP5H34PZq1liClOehK3oMtTsmlDHZ8nUw5WRVO93/hLSlIIzJMGR5wFpX
         yqdXEiqdOZCZ1v4+GN0hLK8VKoLEvmjHRtIs+3OZeLOLk2wZdLoh5PcKl2WTeiaxIX/M
         4j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877622; x=1789482422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dpd270tknPT/7fUd94zwp0IEB0jSoCHjnSje/HknrcQ=;
        b=U5tbwLYchgRuYgohkxSdjGrfKBYybi6VvJOOqm47HghVYPFsOOVTXx8MGcwjexU82a
         C/chZpZI+uKPYxNCDqgeYHaEwXNI+Qard6M5xpALzgKN2S4cfWe1ngS7sQUnURgSmIeY
         T7TtJaAHJ2ajdXSyLlgqKFlX173SUyubauJ8dE+qKqC3F5elCIYXVLJdXSyS1a7Ga6pU
         GCcmE4wtA0DTTiUNfcEU3yYlovsczjd0QDGD1kIW0EzH2ods2NZbQlxr+9wWUTdFml7W
         Rn7aa3MMID28+4lcpnqK6beC8V1jBoyt0dyrGlSf5sYDeCN0RIji/bgqI+6l4eGs0lvI
         an5A==
X-Forwarded-Encrypted: i=1; AKwUvBwpdMmgwZdd5v7fkb9CQCoYWNvJXA9fmyFn2n5AOvKL6O0Nz6R4RP2n1lYzQpdCwejo4SDlEeRrqjImX4c=@vger.kernel.org
X-Gm-Message-State: AFuF++ldqWPkuJylkW4RaFuFt/8bVandHgHyRKLQXC6rSJ5z/rh2wn5S
	Tskqt/1Rh5Zw3CuMQU1TMURSWYxlO11+H+RnLxn3obBwkPd/hgSKUtFVA9ZAC1Dot9jf86XAltG
	tXjR20F29JsbhnjtQPml4zyfCxCTRX1k=
X-Gm-Gg: AYBFou0+PFf3xpiBTMYkzqzTI74dLkqLNRl21xhOxwmkWFyEKqWhumqcS8nckE/T8Z2
	RV47pK8c3oYqSMqmGpLVlRiqIgTJ+1MTONA5c0pHMMbEDR0Tdfso8jGvOuOZLqwWccSxyL9kz4M
	iw7EK82YfVTuUCMVM3f1JNmrf3nkH98fTLwSiUdOFRrYgobijpuLltcI0Pavt78rW1wtLVvV4j5
	aErOJ8Raw2tpFSbtNfVzt/I2dbzkPSoD1uYTSRQDYkaVm+hZaVep9fKn8IOJsu1VvrzyPNSEWbD
	PgKQhiAxRABTygr6G6t1Tf8MPqm/Dm4mCB2KQJYoy07tAWI8tf6fbNLqrY3xHpZC9Bdnk/vegUQ
	btXg/w7vuh9iaL5RrqdoIDvwLKSQtfZ6pt0QCPio0co2MiQ==
X-Received: by 2002:a05:6512:3a8d:b0:5b4:a836:13f3 with SMTP id
 2adb3069b0e04-5b6170525c5mr4837266e87.19.1788877621708; Tue, 08 Sep 2026
 07:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908040041.124640-1-singh.amitesh@gmail.com> <6ec8d359-727a-4fbb-9ef1-3b96d05c2942@lunn.ch>
In-Reply-To: <6ec8d359-727a-4fbb-9ef1-3b96d05c2942@lunn.ch>
From: Amitesh Singh <singh.amitesh@gmail.com>
Date: Tue, 8 Sep 2026 19:56:22 +0530
X-Gm-Features: AcwNN1UERuSBYnvxD6bD9Ff5BlTxZcUPv7qXF6g19NK6FwHipcorUa0YckBsslk
Message-ID: <CABKcAmV09OY8fh-iZOBMzqjfUuTqsnTmKOnMxevAF7fi4SP02A@mail.gmail.com>
Subject: Re: [PATCH] net: dsa: tag_rtl8_4: push VLAN tag into payload before
 DSA CPU tag
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, olteanv@gmail.com, 
	kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:20=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Sep 08, 2026 at 09:30:41AM +0530, Amitesh Singh wrote:
> > When a socket buffer has a hardware-accelerated VLAN tag (skb->vlan_tci
> > set), the upstream NIC (e.g. imx-dwmac with tx-vlan-offload fixed:on)
> > inserts the 802.1Q header after the DSA CPU tag, producing:
> >
> >   [8100 VID][8899 CPU tag]
> >
> > on the wire instead of the correct ordering:
> >
> >   [8899 CPU tag][8100 VID]
> >
> > The switch reads 0x8100 as the EtherType, does not recognise a valid
> > CPU tag, and fails to strip it on egress. The raw 0x8899 tag then leaks
> > to the peer port, breaking any protocol (e.g. batman-adv over a VLAN
> > subinterface) that relies on seeing clean 802.1Q frames.
> >
> > Fix this by calling __vlan_hwaccel_push_inside() to move the VLAN tag
> > into the skb payload before prepending the RTL8_4 DSA CPU tag in
> > rtl8_4_tag_xmit(). The helper frees the skb internally on allocation
> > failure, so returning NULL directly is correct and consistent with how
> > tag_sja1105.c handles the same pattern.
>
> Please take a step back. Rather than have two drivers do this, then a
> third, a fourth, ... should the core be doing this?

That's very good advice. I will do the changes in `user.c` and test it
locally, and
send a patch afterwards.
Thank you.

>
>        Andrew
