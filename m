Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FED4E3EF7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576051; cv=pass; b=f94U0cZfefbd4ap6xBJqVZ3VJ+vMgLWDnsU0L3lUEKQf6x4BN0X1EKM5EkL5nT8XMEcBr9EgY6rrrDmgfjW1VN/JI7huoXYX5pgjh6kHdoMjVzIU7bkxQ9ay+81u4/r4PgjG4yOzp4UA8T9WdY0C1uicaOnaftqR9Bo9z7Ld0sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576051; c=relaxed/simple;
	bh=CZKsV8TBc/UU4QSemteZYCRFcL7JXkwYzG8Pz6oZRZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQHevYMEv9lSIRtsB/eWQfRJiZJH5vQaqQK4I4hAdsTXAqJRTcV4nkAyX1T7ys+7RzeJA21kqF8XAuGticdLPjszOYotbEJvi0hnav+slF3IvffpqkK6G7sCfNkRObO0zUDt19A3OXhW1QMAXKaYWdh1zcNm95yjxXGrOmmtmZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B5GHAVG4; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B5GHAVG4"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76bcb1fso10370631cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789576040; cv=none;
        d=google.com; s=arc-20260327;
        b=FzVKqrk3ZurNwmjcAhwEnfr2Fxongh26FVYT/StpG0oY7w/02dwuGyPlMUB09t7L0A
         h1i1pvDSwoSnIuQZ0jcpDJFb+4ZCfmjL2xCgDX/UCinP7nzfKv1AD6J5/jI36P5s/jVz
         L5bPDR8KGZTfwBZFhFpWe0OTLBQ1HCx9QQQz7kpkasHpFrQIxSWmZU+Cv5SEyqpo82J6
         7558TGCkluJcMqUYEucePAuCi3fc7qCBdgxxrc+GaA60kgAq9KstJMTrbRI2gFTj9BYu
         cbvyn6mj99Dgq0fRAnSgKt+7OgzSjcHSReMuWLX5SNRD+s5tJPpa9I8GnRQ6sIJOJe8L
         FmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wvcHHBL+iTEv0FJTwpkXt7VkvfWjy+zaGtBY5bI0rs=;
        fh=DoWagbVxndzlbFJKbVyA813xf9D7MwfB86qRepJ2c+o=;
        b=CjKSAg1H3licky6JGcuEdkfm2fE9QjtTrKkPU/tsmDUWiaMudbfIrIDOAs1cMIkJGR
         AXRW1SqwlUqE/KMe8qxrKkJxro3UiabvuCgkWH3vXWhjpCW8KflSsmvylxeHzuh82Oyz
         T5E8Z45FcJ3ZH49hmJ9FVsshyGajFnU5twuJK58RgbdyWazp7okL+QNgdwQrjj5mVEwN
         Fsm7HDm80+liMx5s/0VSKHxaEdfSUDNZNZnesnPftxJ2jCoWvcDGCcQKalz6UUhOdquy
         JrRMA/Mrei+tUImg54L4Hhjq5+m1HbkSFllzBEUrYR62VuKc7j4iVtN409lnmG9nTmWl
         tKPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789576040; x=1790180840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wvcHHBL+iTEv0FJTwpkXt7VkvfWjy+zaGtBY5bI0rs=;
        b=B5GHAVG4O5d4fEVbNzONKezi5D3pH/WzCdTpSIJH/VJmLAYY5eFMDiblK1/3bqJc4e
         p0bZ+ufhdqQ6DmfdKsx75eZBuk8vut++1kl27EZ2yntVulMmKhj/ZFC24mr3FQ8M0Uri
         YTtkXPdrXtpk0g6/TSbxo1232AGnAhTH4NtEPYqijtWVU3fNbU+4ltH5BLUbiRUG+1yn
         LLh6eyO0l859zxhMPmUHMHyK3zzNpJE+Kmkef095rZHeUAm9wNLrX3r/9PB1USdiiTuK
         GOtn8NGpTW1VTIfG0yWz9JMtcBC9zLBhI8fP9RThrWajX3hVGbxaRWe/W6OPZu05aBHs
         6i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576040; x=1790180840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wvcHHBL+iTEv0FJTwpkXt7VkvfWjy+zaGtBY5bI0rs=;
        b=iPMsT/zz2N4c+FLUTYcrrTrRLZaXqLO4WK2WaYBoiycyhcV0enbQqOWqzTif2NnG/m
         OHRqK5xBtI4c3oSfTntFQCnBkSogntsFtuAgt7rU/rrPGex6m7uOcdlqZyGrsFHG53SV
         fx7C0YZU7LCzgSdwn9QJthfU9lGyWghgVudI+x+a+xs6g0H0JIuYFUv7ikeYs6ntgmGO
         de8ZDvxo3dTGX/kJw5HEW/6jaQZwms+uk5GWDkVFhiG0004rC+kolVHdFn530reLfW3b
         PTwx4BNGEirAhtBZEAUuUcJM45lF1u+1YFyMfKSJ4/Ox/dJBdi8KOQVZP+ZfA55ffcwS
         8Ezg==
X-Forwarded-Encrypted: i=1; AKwUvBzI0CDPlC97Oa00scI8YF9iefFtVUJUuWdV1SbYuuoWGIllnSiXs54kr3FGcX3T13vv0yYC+BADvj4O0t4=@vger.kernel.org
X-Gm-Message-State: AFuF++nJCR4R9rN1/m8d3mAiwHiWjKEBtbiafVvv0B5m3LKkd1y/q4Ve
	wpE0cMs6SFOqxiDp6kJ1IQYcLR51BKPhvQvT3A3+nDlE4Er3kGEc5h67Gzp3YJWZrd0unaNSkuD
	/2OuorB6BGp+5WxetTTIoGGjU66dmNxDd6K6QVI9w
X-Gm-Gg: AYBFou36kDGY1L7sz7xmpGHrHLbL82xp4EDm7fyba+MMoqajZrd0DLrQuaYqbGbzEwP
	+9OIkqaJaZ+BrCeFyRynkkzFYKSy+X11m+2YQ1KGGA63/y1qM9roh+GsQPOikgQoQkKtgO5iGB/
	rN2Pk21b4ZRyuf48GxQZjOwq4ZvcpESv6TnloQb1Sszz8KoqqVUU0OLWZ2F7huVW2jt08BP6T28
	ODQeFZ5jfHBJUj8NUAVp8E3anJ/dQJRmuBTZfbv6s8u/ugxFCjdNc4U0zRis37aecn1054qKMDZ
	K5OTVQX3GlCGrZMTFp8TwLQqsY6uUOmu2dOm+hdsYJPXx62Hrx5VZUGFX6ryLWLRfSe5qM/N4F7
	J0p9awSEIdNsquZzX45PtWn04kuHL9/LJnvlI+GhDeC2sS18m/3hCtHvxe6Sr2r3Akzt4zSgAPP
	7tc861bJimAM3Ro1KE12wXVD3gjqEG8G8wGw==
X-Received: by 2002:a05:622a:110f:b0:531:cf:b9dc with SMTP id
 d75a77b69052e-5327ee5e315mr57726971cf.11.1789576039235; Wed, 16 Sep 2026
 09:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
In-Reply-To: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 16 Sep 2026 09:27:08 -0700
X-Gm-Features: AcwNN1VQ6CTcVmS3X_ezXS1lS3jOoR8VrCY1MCKo-lPJza77JSmcjB68i55jAx0
Message-ID: <CANn89iL5XujaOU9TjhOufAR092PXDBumMPiJy6GFXdzjujH1kg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/9] tunnels: add core and gre drop reasons
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Simon Horman <horms@kernel.org>, Ido Schimmel <idosch@nvidia.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 7:37=E2=80=AFAM Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
>
> Only vxlan reports drop reasons among the tunnel drivers today.
> Everything else, on both the receive and the transmit side, ends in a
> plain kfree_skb(), so a packet that a tunnel throws away is invisible
> to dropwatch, drop_monitor and perf trace -e skb:kfree_skb.

This is not correct, and it is the justification the whole series rests on.
kfree_skb() is a one line wrapper, from include/linux/skbuff.h:
static inline void kfree_skb(struct sk_buff *skb)
{
        kfree_skb_reason(skb, SKB_DROP_REASON_NOT_SPECIFIED);
}

Both spellings hit the same trace_kfree_skb tracepoint. These packets are
already visible to perf trace -e skb:kfree_skb and are already reported by
drop_monitor today. They just carry reason=3DNOT_SPECIFIED.
It goes further than that. The tracepoint also carries the call site:
TRACE_EVENT(kfree_skb,
        TP_PROTO(struct sk_buff *skb, void *location,
                 enum skb_drop_reason reason, const struct sock *rx_sk),
drop_monitor's summary mode aggregates on exactly that (trace_drop_common()
keys on point->pc), and packet mode exports it as NET_DM_ATTR_PC plus an
in-kernel resolved NET_DM_ATTR_SYMBOL. So userspace gets
"ip_tunnel_rcv+0x1a4" for each of these drops without any of your patches.
That is how tunnel drops have been triaged since well before drop reasons
existed.

A consequence worth noticing: several of the kfree_skb() ->
kfree_skb_reason(skb, SKB_DROP_REASON_NOT_SPECIFIED) conversions in patch 3
are no-ops.

Now, I am not objecting to the series. I am objecting to the argument,
because the real one is better and you are not making it:

Every failure in these functions funnels into a single drop: / tx_error: /
err_free_skb: label. So "location" is one program counter for all of them.

Four distinct failures in ip_tunnel_rcv(), around twenty in ip_gre's
transmit path, eighty across the series, all collapsing into one bucket.

Call site attribution, which is the pre-drop-reason fallback, tells you
nothing here. On top of that the pc is not a stable interface: it moves wit=
h
compiler version, inlining and config, so it cannot be used for filtering o=
r
for comparing across kernels, while NET_DM_ATTR_REASON and BPF filtering on
the reason field can.

Please rewrite the cover letter and the individual changelogs along those
lines. Several of them repeat the "invisible" wording.
