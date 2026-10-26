Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992458;
	b=3Q5LJJF4RqMB4CsV5mUn71JtrJpty12FnbLOcEa4e/ZLKyqGrel1H3cSHRyJRNbeAAyK
	 MzerCtqB3c0wlgTJsqPET1MV3XQwOhSrw6RWgLXyByJrvDFZjcVPwJW+fzqxkcmn7ZAQi
	 MaCjkdyv9N3lixDDqDxhwgdOOA2GNZr1hp2dwCr8uxRC45bZN9lJBNzX+ziGCbTsXRhyP
	 CbF0JdgLOZIWmPaSMEeU61EyWk1Y6Fv02+NeAcLuERA/dyJ9+mkrPl6Sd/GVQbsqmGCeq
	 D+8jTHqKtk+mTqW+IVsB+kbSlQqi60BkYCTQgOXTfra8nJKnK1La8igtvGjEWR4jA8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RCGPlQz9/nbP749pKlUHj7iqUI3R/GYuLrhh68VMhX4=;
	b=lr+CLcyOpbmWSQrse1GaWLhOu1gDV1d5lQgfJ0crSAAnYqe7nddB0kuCKBJiNWnKcUIf
	 8R8Pw3c7GHMruQl9yten0Yuy3kG2k6KK0nJXD9uA3EH6FdM+eASkwdqw7dPXWbFuYK8AZ
	 WMM5PnBXAS/Xh2C0gtiRIlhmxsfD5dfR0L/jcpHFfONti2gm94Q0qEBS3sXRU6lK3GaNf
	 7chYDr/AJMYO33dM1cUR5xxkYPT5A3I2NlQ3AHKsl7OYZ7iGrbimawgM1x9BgM2fl44Dk
	 wS7RJBqIFVthjaNPl/XlAvVRxMD5k8H49KalzIFlRFqlMYVTs+w1sRLBurPu5pL+lSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=azji0Yvb;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFD5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=azji0Yvb
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4476455eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992457; x=1793597257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCGPlQz9/nbP749pKlUHj7iqUI3R/GYuLrhh68VMhX4=;
        b=azji0YvbQpXonPfhYaQOd4vN8DayEMzg6nrWZ+k9qUgnGH+Qty9ZoVl2H1T0DpoB2Y
         S6PuW3zslfumGLO5cOFGQXqvB6FlhXNk1x3xWJzy9jzfdAYMeGnxpgXkO+CHEFl6ILHf
         CSe5/3oPDppMSzPeO+hbvs3/kG6jBs3+IA3yc65Vo3LWxwbW6oT0qRXAY3cp/bJesXIh
         9qjma+u8mCKxWUdvJR4ixY6vkgsuUSn/3KJHzOnsY+TMu7akbq7B+spnmniyndnMOXfs
         Or0qSgsY25u8uz1rqn7FjFgUDPMKRFbovrmNX3RwS6i4cze+wwfJ7njGnbzAQbv4UYjU
         UMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992457; x=1793597257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCGPlQz9/nbP749pKlUHj7iqUI3R/GYuLrhh68VMhX4=;
        b=UN6FSaxZCZ1f6c4vWiIbUEcLa4skZoyPGp3V1BM9a/cTn7VB0v3wljaAoxbW29BIIs
         60F8mP4UT9iBeU52oK1lql5cAF3zisFCIE66IC2rtJd0UrUWbH2qnn8BMpis1tjLhHxY
         8k9VrQwmtEllnYtm8LUMPrbFTmR/1BlTzsfvwKarVtn+zutfbt1S7Vch3J/8QtuZL1HH
         VhQPGf05BGcD8nfsMt9WDSuOhPC9QfGkPYevBEi/jjfuVG2QLQpgC+GSTS4P/mUv0KLL
         wEXe3UD3fgmEDaRO3CuXdRcI4dLevQCit6+HyaVgWiwu+TnW6YqY/rtDP0Fs/S430d8f
         4oiA==
X-Forwarded-Encrypted: i=1; AKwUvBxcMntU0zb/JHF/vRSzXcwDiwoVu/XNoAn0vCj+MUmtIKQcfo8XB2e+U7EJL1tdnqyXh+vi4NUK4wzVGDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBdIN1euDi3GEj4EwV9ZCrcGyDrvHqiiprf1CV8tL2pYhNxSE7
	Cz2oH5AVO5FkgoRmWdKuGR8D26JSRCbf59y2/5azPB8sRUPSMon1JvxL
X-Gm-Gg: AYBFou2UyWJ6wYom19Ij0mctMZmMkJfTuBH3Rw5UV1v40I/PdppYpReixRuPSZhuFrr
	Lhap+DnZbZQhwmCkN5FwC3NgOrGmau/fGtC4NFt2tEBnisgQr2MLmxka/8VAbPoCWY04Dvxs8Yr
	7Lf365der5ntdnI84gbeoagO1ulMpded6p9l8rsaAGtrH4SVf46sDUsKA6OB7Efr1ysYj6/EeK9
	Rsa79qbRxnLQMnbjZFxroB3FJMsX/t5xkd+fjnlIvYaBxoiBYwIRapvopfpPCdoqiDW4gIhStRG
	Fzt2MZhCjOwXd0cRusI6hY2cOhAMhvnxQbAwaBJnRNF2SxHuv60J640D8Ww4DfEWf5gMlLoSjwC
	AoL6LJV6S7qilqxi8FV9K97vU0+M//BtyyBH0o3BBVZk0gY5W7FRhywmSjrxYvJJzi6NIx75+o2
	lDBemESrffTtE56MN2qwoKXpBfxQ6jv6uIGBESRoysG7AtogfhhhhKlOuZfb6tLLN9KW/vC5vds
	6EZV7zor+gsgk9Sckg3EvYFGe9nyeoeeg2cOQflluL3jYPhVwUqmwdOffeiWAFhRX6rWd0FCPUN
	u7w2aPHDK4otEVXcs8JkX+ydVA==
X-Received: by 2002:a05:7022:3b8a:b0:166:f097:6f12 with SMTP id a92af1059eb24-19934a9278cmr9164130c88.15.1792992457049;
        Sun, 25 Oct 2026 22:27:37 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaebfsm21437866c88.15.2026.10.25.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:27:36 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net 1/4] sctp: purge abandoned I-DATA fragments by stream and MID, not by TSN
Date: Sun, 25 Oct 2026 22:27:05 -0700
Message-Id: <20261026052706.187296-1-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179293012722.3134.13316596865856977030@kernel.org>
References: <20261024120627.837568-2-tim.budding@gmail.com> <179293012722.3134.13316596865856977030@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 25 Oct 2026 12:08:47 +0000, netdev-bot+sashiko@kernel.org wrote:
> > +		if (event->stream < sid)
> > +			continue;
>
> [Severity: Low]
> Each call to sctp_intl_reasm_flush_mid() starts at the head of the queue.

[...]

Agreed. Walking each queue once per I-FORWARD-TSN would be a separate
change. I could send that to net-next.

> > -	/* purge the fragmentation queue */
> > -	sctp_intl_reasm_flushtsn(ulpq, ftsn);
>
> [Severity: Medium]
> With the TSN-based purge removed, what frees an unordered fragment of an
> abandoned message that arrives after the I-FORWARD-TSN naming that
> message has been processed?

[...]

> Should the commit message also mention the lost rwnd and receive buffer
> space? Alternatively, could these fragments be dropped when they arrive,
> or when the cumulative TSN moves past them?

Correct, and the commit message is wrong to say such fragments stay
until the association is freed. An unordered fragment of an abandoned
message that first arrives after the last I-FORWARD-TSN naming that
message, with a TSN above the cumulative TSN, can't be reassembled. It
keeps its rwnd and receive buffer charge until a later unordered skip
on that stream with the same or a higher MID, a reset, or teardown. At
the tail of reasm_uo it also stops reneging, as any fragment below the
cumulative TSN already can.

One late fragment is enough if nothing after it has arrived: the
receiver then delays its SACK for the I-FORWARD-TSN, the fragment fills
the gap within that delay, and the sender never names the message
again. With the last fragment of an abandoned three-fragment message
arriving in that window, that fragment stays queued (RX_QUEUE 1232). A
duplicate can't do it, as the TSN map drops the second copy.

Before this patch a later I-FORWARD-TSN covering its TSN would have
freed it, so if another message is abandoned later, this patch keeps
it longer. Without such a later I-FORWARD-TSN, this patch frees more
than before: in the same test, the TSN-based purge leaves the
message's received fragments above the New Cumulative TSN queued
(RX_QUEUE 2464 without the delay), and this patch frees all but the
late one.

For an ordered message the same late fragment aborts the association
instead: its MID is below the next expected one, so
sctp_validate_idata() fails. That happens on net today as well. I
could look at it separately.

Freeing fragments once the cumulative TSN moves past them doesn't work
with interleaving: a live unordered message can have fragments below
the cumulative TSN, and freeing those is the loss this patch fixes.
Dropping late fragments on arrival needs new per-stream state, the
highest skipped unordered MID, which must be cleared on resets and must
not go stale when MIDs wrap. I'd rather do that in a separate patch
than grow this fix (question at the end). Either way, v2 will spell out
the cost in the commit message.

> >  	/* abort only when it's for all data */
> >  	if (ftsn == sctp_tsnmap_get_max_tsn_seen(&ulpq->asoc->peer.tsn_map))
> >  		sctp_intl_abort_pd(ulpq, GFP_ATOMIC);
>
> [Severity: High]
> Can this branch still flush the whole ulpq for an ordinary I-FORWARD-TSN?

[...]

> A later patch in this series, "sctp: don't treat an I-FORWARD-TSN as an
> association reset", seems to address this. It drops the max_tsn_seen
> check from sctp_report_iftsn() and makes the stream reset paths call
> si->abort_pd() directly. This patch is tagged for stable on its own.
> Should that change be folded in here, or should the two be backported
> together?

Yes. At this commit an I-FORWARD-TSN whose New Cumulative TSN is at or
above the highest TSN received still takes that branch, and
sctp_intl_abort_pd() frees every queued fragment, including those of a
message still being received on another stream: the same loss this
patch fixes below the leading edge. If that message is ordered and in
partial delivery, its MID is also skipped, and the association is
aborted when its next fragment arrives. With this patch alone the
ordered and unordered tests pass and leading_edge fails. The later
patch fixes it. v2 adds a leading_edge case without partial delivery,
which shows the loss directly.

I kept the two apart because they are different mistakes in
sctp_report_iftsn(): the TSN-based purge, and treating ftsn ==
max_tsn_seen as a reset. But they share the Fixes: tag and the
symptom, so folding them is reasonable too. The later patch needs
patch 2 and the new pdapi_seq patch (see the reply to 3/4), and
neither of those needs this one, so folding would mean those two
first, then this patch and the later one as a single patch (question
at the end). If they stay separate, this commit message will say in v2
that the leading-edge case is only fixed by "sctp: don't treat an
I-FORWARD-TSN as an association reset". All three fixes are Cc: stable
and apply cleanly, in order, to the v5.10 through v6.18 release tags.

> >  			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
> >  						  GFP_ATOMIC);
> >  		}
> > +		sctp_intl_reasm_flush_mid(&ulpq->reasm_uo, sid, mid);
>
> [Severity: Medium]
> This is a pre-existing issue, not one introduced by this patch. Does the
> new flush leave unordered partial delivery stuck when the skipped MID is
> the message currently being partially delivered?

Yes, and that is the next patch in this series, "sctp: abort unordered
partial delivery when its message is skipped". At this commit no abort
notification is sent and the next unordered message on the stream is
delivered as the rest of the skipped one. The uo_pd test fails at this
commit and passes from the next patch on.

Xin, Marcelo, two questions for v2:

1. Fold "sctp: don't treat an I-FORWARD-TSN as an association reset"
   into this patch, or keep it separate?
2. Should dropping late unordered fragments be part of this series, or
   a follow-up to net?

Unless you prefer otherwise, v2 keeps them separate and leaves the drop
to a follow-up.

pw-bot: cr
