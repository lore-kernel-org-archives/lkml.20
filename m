Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3BF4BE434
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601873; cv=pass; b=r0Ik6NKI80lj9XXASBT57EvkhH8nHBsuvc5JV5rf7c6EjcENNHOxFaRZvMxZMBZoof7T29zA7fK0xCLOhEcMADix386gTetNy3fyHFONjfj+dmtBBANEELZ452O/02VXY1LihTbmnPeRIBl+XmROCfKpi4fDyxYsO6yPUmzGjgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601873; c=relaxed/simple;
	bh=xiRS7KM761SAu0ai2HwE3HlQM61lcg6CQtVLI1LOP9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcJKaksVibkzJGBuwzZhWQ0DOHI4fmko/kbQpcfLU+NXwIxrc6HdGijarczOaGP/Ma9ot8KdG3tlD6o0CUSg5KG03/oBw1cNEUYrSaTd3ada6UbhFSOjwqWG9LbOTRRIwX26S4rznHDmz+TVKgVmzMeT5wZseRmq9rBsaV2KtGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O+21x2em; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O+21x2em"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d0d5ae11so36974411cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601870; cv=none;
        d=google.com; s=arc-20260327;
        b=FkDAld10ZE7tgqM4jETWDQUqrH3oPUheRsjfmV2S+Hfo/AgK8O6IXhg+tq8cxXx5CW
         ldHvh18DBJdhDCII57/W02k5ND/two8n8Rv2Y7+fRzvhgNrWUjAL2xYpNpPTeA+jRuWc
         x/j9MnKKP2zYj80la+fXrIEhfMCAiwuXWLUmfvXz9A0Rz1Q9sRnSzSJW/yB+hXlMsNB7
         +BWQVHNSiEaj4trBcaAZPkH+DnNgLxw31TQlRKaUbMC6BwDtGgHYK7UkIG7GBAq7vvr9
         3i6Ndfb150EsyV4nLojEtlcqBRtb9rHHGdVY8uXIMmCBgAiv6NibJWpq4rcQ9NynwF59
         /Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xiRS7KM761SAu0ai2HwE3HlQM61lcg6CQtVLI1LOP9g=;
        fh=I7ElO0stJeG4t2PMdgJ6ryBa7euAS8fYRYP1n03lKe8=;
        b=FCTe2FQ+tSE0lHsHmDDl4l10SVsua2gVOhUnb9HNqEEMkrAtwfPTrveFOvmyZ5pjJI
         D6LoA2DkokNyQvLXIW7/KGsJnmgAUMvYcTnpyQ2YFO0VPgp1B40hlcWg6lCaQOVqLv70
         W1Ywj/xKHrpXmyBe0gyfwe6f0SAylivK617lsiOs+h+Bg36TNU7m9NhDAC9przcxVZKR
         ufgOm6W2muPU2fLBQm9Mi2C+YM/uL9PnogBsybG25OSZkAxvKVtvoX1rGzRTseRHEEBR
         A1T3WPQojAW68tZvqihOBsjDVLDjcLa+QvlWLZra6XsZOpJI/fNX2eR1DTOLkJGcXRe6
         K/EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790601870; x=1791206670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiRS7KM761SAu0ai2HwE3HlQM61lcg6CQtVLI1LOP9g=;
        b=O+21x2em4VNXBQChDlutYjO4bHTHHFQek47IbtLW33zsSJpqZueaj5up6e8V1K7Jm+
         tRZSH9S2s0HH9llOUTShlb4s9KdLUYfUEsW+50QkWV6rp9YtvxRP3Zr0TZU1OLCNdvT/
         LsqRb3X5JjI7GUtCTHmnG59SHCpysd7CFzB839Oykyc4Eber1DRW5XVXGsAKcX7xti0W
         3lMuxxX2YJEvXa+eAnWG+bwPEotTgAF5DY9pqIp4pZViE4is+IGWaoRWZdS8C2HddPaW
         Lm8MAnYR5+QuGTEwCFH+2Ncs50qKh4rjrk33eZj47ZC6s7H2pkUWeg2kkS2kwWCAwY/2
         CaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601870; x=1791206670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiRS7KM761SAu0ai2HwE3HlQM61lcg6CQtVLI1LOP9g=;
        b=y5LAMKeiRO6olhOKdzRLhCX5J2m5f1wOd7FDW0QiIslWbw0CTElGTRTytV/1vJ6G8V
         9Nf+2vLeMcZc7Oy8a7XnmA9It/yIZTamGaB9Ey0+vjfrbKpXCgNmII+HpivIM7cSANE1
         2uiYaD0LuehtQpPQ45HzNtBbLffeMT4XialUW/Dq5Ojm/EiXQcLG1T4hVbu1x8rCPg+1
         Bcq0V8cY32sKsfrcQsQ6AIi4rKg9Em35w1TRngCww2iuO86LhRpq/3qZKOq5l30lEuE4
         Ue5Fcq14sCAjsE6HyT0rYLwBQYckT84ZgDYvqiQw+vi0NNhELHdgvaNdzwLeFEVgUw6b
         OVyA==
X-Forwarded-Encrypted: i=1; AKwUvBzLjL5M1QMjhcFUl/watGnqLnMzpBfrL6lRsl03KSXklj4ZItZ3VLS3Grrx2sF+2dH7WETNbmjknv9heZg=@vger.kernel.org
X-Gm-Message-State: AFuF++ki4eXbYB+vbOejMhEA2vVFRwxWQCCUA95/E6wTTdFwONrpVO1t
	Ax6CW7BqCT1ZLCJ+d0F8MhQ+uh0aFKzKC5VR9eurM5SWpPUNPFBf4TD5JYyIfUFnBvHec6M2lYm
	9OR1ndAj5iCd+W811flVkA4+eJnfdZj0DusV1cvjy
X-Gm-Gg: AYBFou0YUmJJtLIqMkEfkjWfefwNUZ2InC80CNTCUX4n6en7WlwJb8F6YlIxRJJIUkI
	y+HYriCZODMSWo5bE462spA65+8zZthcfP5wMU0Y8tq033oJo+STAQGAprKOiG28sbDixVf3MQ8
	4vWlIthNIO9/SwwCgSLcxteWJT9hXhtFgJQnrXVUNDa5W//lx+beU8in9151VYowgjDmHfuOxBf
	Tq9w8+WFbLrQZQ7678FzXnZuCUhDs/i8zulpQdjKfHuLIOMWAbVBu9I5yYqIgE23iMukMHT+qIM
	jXMaTo0shLDEDLmFxt0sjXdLt9TsIhLoOO1M0PoDOVGl30blSJ5jmGsWp6EMLefW7GVhlwLYMbR
	EdFqhLfbEcvM6VGPL7iZ1DRbpO3rFSN3CnBB3i7SyregPUhLGN4a/L8BgLoyLhyClY9pG
X-Received: by 2002:ac8:7f96:0:b0:532:c947:6e49 with SMTP id
 d75a77b69052e-5330b6d44f2mr201964871cf.59.1790601869125; Mon, 28 Sep 2026
 06:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928121454.901306-1-nb@tipi-net.de> <CANn89iK5RTtZLPAY+rJKCeUpLkCge+PFqfN-g_M184S9fyzSsg@mail.gmail.com>
In-Reply-To: <CANn89iK5RTtZLPAY+rJKCeUpLkCge+PFqfN-g_M184S9fyzSsg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 28 Sep 2026 15:24:17 +0200
X-Gm-Features: AclHuK_m9QSkWHN5gA-_xfWJXUJhdlyqqtSxTFTjGV0NrNiSTpS8_9j-6hAOP7Q
Message-ID: <CANn89iKouU5UvXAUwX_DKJ0G6Oap9BaUoDCjY3v+rRGDF5BBkQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: bcmgenet: complete Tx NAPI after one
 reclaim pass
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:14=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Mon, Sep 28, 2026 at 2:15=E2=80=AFPM Nicolai Buchwitz <nb@tipi-net.de>=
 wrote:
> >
> > After reclaiming, the Tx poll asks to be polled again. That extra poll
> > finds nothing to do and does not reduce the interrupt rate.
> >
> > Complete the NAPI and unmask the ring interrupt right after the reclaim=
.
> >
> > On a CM4 this raises 60 byte pktgen Tx from about 187k to 224k pps and
> > saves about 5% of one core at TCP line rate.
>
> Reviewed-by: Eric Dumazet <edumazet@google.com>
>
> As a follow-up, you can get rid of ring->lock in the TX
> fastpath altogether (it looks like a leftover from before TX reclaim
> was moved to NAPI in commit 4092e6acf5cb ("net: bcmgenet: use NAPI for
> Tx completion")).

The commit sha1 is correct, but its true title was:
("net: bcmgenet: fix throughtput regression")).

(Even if this was a NAPI adoption for TX completions)
