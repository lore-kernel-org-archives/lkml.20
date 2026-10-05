Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A5377A97
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791188085; cv=none; b=lMDVRtU10mTWQJlo5LIiDlfVMfNFx0aV/7Eq+1cYra1Ybur4xa3bOaK/AqpHwd18rB0mIGoW5Fk5lCJ1LT5klpxVryRCbAGYUHb7jybIgYXj12zt2+LI3/C8t8KtcNMEzpn72PYw0tlb8XXebSJrf1l1CA7w1NMmRk70nTtt19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791188085; c=relaxed/simple;
	bh=meaS8h7D68gc6KeY2ndo3A5Cb0GHOFfYlgjM6j/Z6So=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuhQfbMQKObTEEKVNATDB3u0+4orrM+94/2Fy3fvgfAuhD2KJEqEOm2IdWC+qSyCAGMC09jnHetUhrzvFuXWT/X90OSuldwnTHkXglpE91gwQ4y/RWdmfeaDCEkw2AkdNu1AM0gfzRcP0nrrp0veFneM1a3s02ynfVZ6EXuJUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDEwNTc8; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDEwNTc8"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so647913f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791188082; x=1791792882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lJtTXJS3lNxs6KeGf0mmSgOkxFqn8ISkKtP7HIHVmNI=;
        b=BDEwNTc8UbfNVpMfBRo2icrZbPfnvvBgGj9H1t6WZ7GqA67f3DHS+ZZyoIKyz5tSLQ
         hsWInC5rxX01B6sK/Sm11XW9mePZXW/DayS4q9sF3Otk+/GKA1UL3QuHyMeT49Ef7XjG
         X8FKILjOl+ct+JLA43f9jQjxwpHkdCNa2cpPqlirzFmLI31CHwFZzDWMFqD7tw87L+pR
         5QVbEI46z205ejfDNqeovrKwZYngnvmBvSsrKn5kD1iMH5Ai+VL3lsB51Lp64x8sUtA4
         gpGwhw16wfmjivvEHWKhetVHxet3AyWVqVuXqV7hHtIa06dpR1Ifov6HIkrZCzkdY7E4
         Mmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791188082; x=1791792882;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJtTXJS3lNxs6KeGf0mmSgOkxFqn8ISkKtP7HIHVmNI=;
        b=Ra4nR/ChO5oeRuB4trZAA+hYpBVCmJSOL9hBnJbSwv/vu/IzH6YNnPWMP88eoQ/Zr9
         wGi2XEkON9TiUyaMACjtQHDXkYiSp4zGlKWd/CixvZyxFLgEszjvJ+10SiXt2xgRw1+c
         5eCkJYb/JSYIWd+oxwrmG25c/jlomvSqGKPGn21yA3ZIwr1h7mE/hQsqjMFjRjwgSRsI
         42NfSOKse2lb4LYs3Cd+aQeybfUE5dqG8lLjczR8BXALRZwatNy1obbmjzBMVeiE7MKP
         R90BSxjLkkJyCDvQUatZk9JnlBCLQFSaDiVV7eaYDgWscRdYkEH3G+Orv3TOM54i6zNe
         ekog==
X-Forwarded-Encrypted: i=1; AKwUvBzMwHknk/leBad+u4mj7Qo0QyPCrdRadEI7srx2q7uqxZJwB4skITcAL/8gwnpG8+KPE75vpnwc0+EbmUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDoxSsMO/Gd+NvYDZytccX/L71TAV5a9qu7HvwnWXGfA3Fb0cT
	lYCQwd9T+/gMzSHmjBEpFRaeooBGGPZjOY5wu9yOZNt1uOlJscJ11shX
X-Gm-Gg: AYBFou3zy2PfFmFZMj3FRh/QBHcMzyKxA+4DPiLmXOMB3Yx8arSTQdlFAeCNYykcpQ6
	qGvjx2ILgGx0j6t790IdacLSHjYwxzPzcnJjGoeyIZffGvwa3Ro/FNFvS+niIhvlyK6lTOmnKB1
	ZUdE6H9hoxjWP3b7a+WXW/ga+gR31iZtWKYktWxLU3orUp0PiAnaaTDTW3CJbkhyySex+WUjQXs
	BdEMslvw0ncypoW6QTL6OoGnnnLIBoiD6sFEgMQ22P3DayFCJyGqy08PfhKT8Lqp2ydwhzRrTo3
	SN1NqmtR5FlaJiA/BFel7UjMn/Xi7YZrcjtR1XNnKYe4fLt7J0Nny+9qdAa2auf8OqmPNRVO57v
	nQqRQ+W2A7k8y7RkIPqRxILLlFfKcQOaygA6WekQ19ai6g5gttKYoR442Qwx4QbwdoDAR0ml9nL
	bhfiq2fFI6GsIf13cJbNrSPK8wuejpOlQGnw+2FPWiOdBWy7ZwbZ1U8uJgJRxGGg+KjbCp3mnmX
	OQS7LsfV39ZMnjz68hy8l02vBwaHPweZS0=
X-Received: by 2002:a05:6000:25e5:b0:487:15a3:1cab with SMTP id ffacd0b85a97d-48b1270ff98mr16251747f8f.18.1791188081951;
        Mon, 05 Oct 2026 01:14:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622bb172sm4106826f8f.42.2026.10.05.01.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:14:41 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:14:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <andrew+netdev@lunn.ch>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <davem@davemloft.net>, <edumazet@google.com>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <sdf@fomichev.me>, <sgoutham@marvell.com>
Subject: Re: [PATCH v18 net-next 0/2] octeontx2: mqprio bandwidth offload
 for NIX TX schedulers
Message-ID: <20261005091440.575f0eea@pumpkin>
In-Reply-To: <asMSSdIK6WBECcs_@rkannoth-OptiPlex-7090>
References: <20260929022915.2704627-1-rkannoth@marvell.com>
	<20261002103752.006a7648@pumpkin>
	<asMSSdIK6WBECcs_@rkannoth-OptiPlex-7090>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 08:28:17 +0530
Ratheesh Kannoth <rkannoth@marvell.com> wrote:

> On 2026-10-02 at 15:07:52, David Laight (david.laight.linux@gmail.com) wrote:
> > > Patch 1 converts PF/VF and representor flag access to atomic bitops.
> > > Patch 2 depends on it for safe OTX2_FLAG_INTF_DOWN and OTX2_FLAG_PORT_UP
> > > updates on asynchronous mbox paths and during the mqprio netdev bounce.  
> >
> > Can't you just move those two flags to a separate structure member?
> > In at least one place the code separately clears one and sets the other.
> > That makes me think it should a a three-valued state not two bits.
> >
> > That would save all the expensive locked operations.  
> 
> Thanks for your review.
> 
> I agree that atomizing the entire flags bitmap is broader than strictly required for the
> mqprio/mbox concurrency: the cross-CPU hazard is otx2_sync_flags_from_rep() doing a non-atomic
> read-modify-write on nic->flags while other CPUs update bits in the same word. Relocating
> OTX2_FLAG_INTF_DOWN and OTX2_FLAG_PORT_UP (or restricting rep sync so it cannot clobber those
> bits) would be a narrower approach than converting every OTX2_FLAG_* accessor to
> set_bit()/clear_bit().
> 
> On the three-valued model: INTF_DOWN and PORT_UP are not a single FSM in the driver today.
> INTF_DOWN reflects netdev teardown and is consulted from NAPI completion etc.
> PORT_UP is set and cleared from rep RVU_EVENT_PORT_STATE in the mbox up-handler and
> suppresses a duplicate carrier/queue bring-up in otx2_handle_link_event() when rep has already
> applied port state. Combinations such as INTF_DOWN set after otx2_stop() while PORT_UP remains
> set are deliberate, so folding the two bits into one enum would need a seperate work
> and review beyond this series.
> 
> please note that this restructuring feels somewhat orthogonal to the goals of the
> current series. Patch 1 focuses on replacing the non-atomic |=/&=~ operations on the
> stop/open and mbox paths with atomic bitops for INTF_DOWN/PORT_UP, which patch 2's netdev
> bounce depends on. The rep-flag sync behavior in otx2_sync_flags_from_rep() is a related but
> separate concern, and I'd prefer to address the lifecycle-bit layout and sync logic in a
> dedicated follow-up rather than expand the scope of this patch series.

Right, but the atomic updates are are far more expensive than the non-atomic ones.
They really are best avoided unless you really need to change/test multiple bits
or need to limit the size of the data area.
The patch is likely to be smaller if you remove the UP/DOWN bits from the bitmap
since it will change far less code.

David
 
> 
> >  

