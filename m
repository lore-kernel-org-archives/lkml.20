Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9B238330F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425259; cv=pass; b=FLubzZGq/S1HO4Qhkn4LmsZymyQAd/31Yky8c4W8KVPrStghF1qzORm2Uj6T0ef6Ubm4NH/UcpMw2zV0isdB9R5LGrolvb9rCm9raksL5WELn8XV94lHyC7HLKUhtaguwBr02QPrCAUQroxkhGaxvZCiWtnJ+ZiupVrAB2V1mhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425259; c=relaxed/simple;
	bh=05J8FDGfobF9lm48BNn5ph4iz34rcbzc9v4CylZoeOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=co9AC1GxdjfpaBj9W624R+TcFdYFmHVEGosk84nb1MjKjyYOqYSjQFd5ajtjVu2g8NJqDrAsb4ZnXt7G9tnZ6Wa4pRGVYqksj1c8JM5r0hYx1BU3CSKJmWkaRZlpfJ2FAZJaFqjDURuMib+zpLI5RZ4Ft1vyoqoWUUQitOa18aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+tF0twS; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+tF0twS"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-529a1ee0e62so23865021cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425256; cv=none;
        d=google.com; s=arc-20260327;
        b=ARS8sXe2K/yBInlw9BM9p+XF707X7fUOqnZMvyxRIyvVcds+oxfRfeBBl/UjCVJW/+
         1BhkAmf/7ejD7fpcAaNO1eJCIiuLdyHBXoqgeH0zUGvdmXiS/tSREbx/lFV/SBlVwHqK
         bQ0k7l6lo0HA09+SqfT8aGT3cmKwJM/HQHxQ1oq5jOJR0XlT2NDxMPnbUV6a0TdpCe87
         2h5us45nH9VTClBFDPYR5PKftOrVxv5HXhfhyZQkwcM5NE5nZW/6oCV4qzuzmx/LBHQR
         kjjY5RowxsiBcewD4XnkzM9KEdXUxEVMM8O+tMxE1DotQh3/Hl/CJzw27TcgSTNh17pD
         vWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlvqRataTugdfjdd+6DiNrkrIH6F8Qpk4TF7K6+Vpt0=;
        fh=GvLVuxVqaPEuwT/2M6J3KJ3WVfINBVbu35/V6pt67MA=;
        b=loJ44p1MFhr9QZxaavYQG4X5uOwmMjRAXlSq146yNGHznxW+VFDTbsH8Vjqod7AwFq
         avOx6bV/sqjEpDgpBYcUlx1mNWjsdqaNuKlQbcFqBmsoA8V/vaJQeWP7dYcEv9tUjNOM
         60pBM6+f1gTTEFslhwiYelAC4juTr3X1CpdlWSl6iFN0UOJ5/OSU1y5DElbwQLrT+LCb
         gJkxkDnXdL/ptvhULE+S68XtCDR+k+JMf0sbar67Qs7SYpqYOe61lr/CRmc1ddqpAhiZ
         Bl4wr0OgOCEF6mv6wuPzyyXZ2VWFvM7CbFmEtOvmaKGoSj1fPIGSpAtHS3yGhOVh/diU
         KY2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788425256; x=1789030056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dlvqRataTugdfjdd+6DiNrkrIH6F8Qpk4TF7K6+Vpt0=;
        b=g+tF0twSgUEAxJF0BJuirdtu3AzUTNJKteFVswI6HGVdiDlBPnA3TCXxmwWjMXV7uA
         rkoAXFRs5Xtbot4LmqoRk6ag1G4+v0Y5QGscNvagixNl71uZY6Aa35Pe2/ZFfKRiBkpC
         11046PP9nSej0c38wfNTekbdStVrSBd2KV+EpgT+mWolpg5VJcQWl359FNstJtwSyrc1
         QeOc0TbiJlNnhYsLldvK8o4mWSe70cvvOnUiP5bsmS+JzsBaenM0QjyGO0KFKBiOJC8K
         ktM4s9yfih4ERtUe7MG5n71/SGy8FAgVK+XwTVG0c/z1uVrFELvSTxlGpyWkb8o+Q5rJ
         +vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425256; x=1789030056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlvqRataTugdfjdd+6DiNrkrIH6F8Qpk4TF7K6+Vpt0=;
        b=Bui0b3wyWlOUQhWbOvfFUWwWbaHEGermncAQIZ2soJDzcqAztgThm3D/fXsyMs/swm
         fyv5e7dpTo17M/xc8h4/98nWpPeWEuN6EyIzGCviaomh3IzwyWsrJS2syedCmcO1tibD
         ApFowut2zX9Z5+1Ww/RzidGF8Y3MY94jGFQUxkDSpgOmJ/npjifdnQgErKuUY2OxuFmp
         CuQRYlViB6MiLPD8EV8JSdoeo5aJSR65HdXdRIL5J46wI8TzW729kn8R46joR/32uQ19
         RDj+7ukmsb77gKbK+LmaojBh/b0mH0yMtqozHuircaYqcdnC21yMUhKqLj+fPk8XIvGg
         9vJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSiVl+LofMw0Bxmf5WFzyI5v8rTTL6BT2s5qij9Di39VCLZJtSyyxqgsW/3+7Blz8DlExNLnlyNN3X5mQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ1mgbtP3YmQokl8cqx+DXktq0zk+0rkPB7GBAUHQlMuxPR/8l
	1nfmOmrK0PCjpqKJBNQGFrHzuj2d6fDK4Ts/ErjKT23uPdkjahmYTKv11gc7A2ias6QUK1er1C2
	YrZbSlbssTQhkPHA5qa3kXRJlvZALAAeevVQ1vxFk
X-Gm-Gg: AYBFou2+NSxkNtnFWQdKqJtpFKh8LEGW1/hpC3sDZ4B1NiN8eygxuhZI01+mHLBZkC3
	qMIl8c7/lgcC7GoXBp2agfocJcksyCmEJUIO1PdltzrYA6Zg6PXYSz/vVMDOmgWAodzMQgWXUgI
	SlmqvX4nxi8j+YUjVzEhAJ5R1QzSCMzwG9ThArJN5VjavB0FDB1RMfj3+oGT+m8A2mRxWtwH5b1
	KIG+YY78LQXpYInNwTSeYmefJj5yya6Xk/Ezm6161/rcTzxdEMo4hcYE9NKiPFAc3ReBbZCdl6h
	XEj6FKntTzH3xEM51creYglFgHXk3GQi/EQOrrjLSFpRW6ioSNKmXts9+oqHdx0HuXCd0fniGgw
	+TVtgtdkX59j/7WemO5nD1f24n4+C1v+FF/5crzAAJa6h+XIJWdcagf4znQ==
X-Received: by 2002:ac8:5f96:0:b0:530:2b31:a294 with SMTP id
 d75a77b69052e-53036cef643mr123350521cf.26.1788425255796; Thu, 03 Sep 2026
 01:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-seg6-l2cow-v2-1-f37b3b35416f@gmail.com>
In-Reply-To: <20260903-seg6-l2cow-v2-1-f37b3b35416f@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Sep 2026 10:47:24 +0200
X-Gm-Features: AcwNN1UNEffLCiS4uuycKstKIm2Kxs7muBvBi_-Ls_uLI52ZvwsZQISghlLpd6U
Message-ID: <CANn89iJ=atViUvhNJejKTJ=u6EyQ+8Zs=dLLUudu=d7-zcFBWQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] seg6: reallocate the skb head on L2
 encapsulation only when needed
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:23=E2=80=AFAM Yuya Kusakabe <yuya.kusakabe@gmail.=
com> wrote:
>
> The L2 encapsulation modes of the seg6 lwtunnel reallocate the skb head
> on every packet, where the IPv6 encapsulation modes reallocate only when
> they have to.  Ask for the whole encapsulation up front instead, so that
> the reallocation happens at most once and only when the headroom really
> is too small:
>
>   skb->mac_len + sizeof(struct ipv6hdr) + ipv6_optlen(tinfo->srh)
>   + dst_dev_overhead(cache_dst, skb)
>
> __seg6_do_srh_encap() then finds the room it needs and its own
> skb_cow_head() becomes a no-op.
>
> Drivers reserve more than that on the forwarding path, so the
> reallocation usually disappears altogether.  A single-segment policy
> on ixgbe needs
>
>   14 (mac_len) + 40 (ipv6hdr) + 24 (SRH) + 16 (LL_RESERVED_SPACE) =3D 94
>
> against the 206 bytes the driver leaves.  Where the headroom is
> smaller, as on a veth pair, pskb_expand_head() is called once per
> forwarded packet instead of twice.  Asking only for skb->mac_len would
> still take two whenever the skb is header-cloned, because the cow that
> unclones it does not also make room for the outer header.
>
> The cost is amplified by CONFIG_INIT_ON_ALLOC_DEFAULT_ON, which many
> distributions enable: every new head is zeroed in full, and that memset
> alone accounts for 16% of the datapath profile.
>
> Throughput at 0.5% packet loss, 64-byte frames forwarded through one
> 2.30 GHz core (Xeon E5-2650 v3, ixgbe 82599ES), offered by TRex and
> binary-searched over 10 runs of 10 s:
>
>   Before: 654.6 kpps
>   After:  965.7 kpps
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
