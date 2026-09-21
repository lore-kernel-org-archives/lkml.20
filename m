Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989DE48F02A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990718; cv=pass; b=b8qS4FYH/5gicdRpnK3yzaaaA/7LHmOQRB4+VY2BU8bBLJtD6s9uUUJ1b2jR1Mm2rB90NUr+ETHJDFQirebG55KuWRg4zPqktPjwcoCd6kdA4f5OIQqNOPl03e/YWHEhJFuv2zkPlwttlwXj+Bso4jJTZfSyAVFcxU1d2GyB5NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990718; c=relaxed/simple;
	bh=Wdp5fa7wpUtnmnOPRUiNG8VmwpeuTY/AN0sHfo1zbhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MedE3D0U8nUGHrtIsC7E3cuEzyttoLIuLPrnKEtHOyNstlabXW7FZgO1gMkLJpLI97hqLISY+lpfGCjcjOwLY+62tyxvaN0uF8TN2GenbXJOeUNisnHNWBFh/MGWuT0BWs5jnuYASeLeCciTEApE1BK4sPyQX7zAP7tCtvdh7ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY5gWOLD; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY5gWOLD"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a30eac5so1520534b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789990715; cv=none;
        d=google.com; s=arc-20260327;
        b=XRMoHPEMXgGkOQJ07kaXCHEG1C+5A5MfdskaZvRZm6yPq5JZIhnBtomy3DAexyB5dS
         ZTLLqdwn24aRJZcrkPm1x8d9KNWmBOGN6CDoa61cLzjn1nA81v1iDHAzLSuNmHyQvCYW
         9QdM7ucxM0VrXN5dh41KyreOA9vFCKfGRW1UIcYqDwwnA7yWDoNlLbHnE1jq2LTFeypK
         k1RecMppZjsfRzeciBYepD+7JGJMSFeRviQ49JznUuMAkkqiEwSEBB/QVz9n9jr9kNZ6
         rLGMo4oJQrZeRnk5AY2PqkbL0FJoSB3Dri9gKFMp2WiIjUcK3b1zC7QNZm15zfhieIC5
         gVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9sNrUr+jad3Tl28tFEmsrKuGEDrRBiHkzmqFkjdqgIw=;
        fh=7WIT8BCbmbJ9gJAuoLjthGXGR/JDkEADb7DUzrSSRMY=;
        b=akxA5g1VNu0GwpBFiq/vvryv593hzMiF8ELbjKDIjHIJ6ZqCrczXuARfF/4GeYIm8w
         A9t+G9eNftGpY7Ve13m94X/Zo5yVLvq0CZ0zs9ox/TgSSKV5m9eRxKZFECqvB0CwLHe3
         FfmzeWzlAYddMTfY6E1ig7boZptEPSNx3xLfbp1/ntNv/y5vnR9cfpYhrnGZmbJm4OS7
         0mF1pEILanfVHkUaYi3KigD2N7r/TC15OXG9yPseN974I6MZ4CQZKF3q5vEMumY8VfNA
         5AIIZKn8aFQbjT6gd5GhZxlYj/cbIpU1/075vhelbdwAYllN7NBI07zHvx5FSIqstkR3
         UwQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990715; x=1790595515; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sNrUr+jad3Tl28tFEmsrKuGEDrRBiHkzmqFkjdqgIw=;
        b=NY5gWOLDbzEsAYjAAFHaoq2pSBopWmZB1M/pL8mjPV1nQAjtuH9vs7FmJSENxkNKiZ
         /Me2QtGjtLafcQymFZy7G0+sDXHB/dTSzlhiBXzXP5pc+eVuA/3R+spwvBc73O6h89ex
         CY+8fxNKZ8nUo1vmaA8FKjA0HqPnSQJsK+FzduLyXK/rqaLDwxZ2ek9w2YLhjZtiBVNn
         LrN98r9vtQszmSIh2w/i4ApaDrid+RaUEKXqKvUHYvXkRht/Ls8T+FzGLNty8iTy3aqm
         f/Yhbaw4u1z53ynL6+dwULxvTBkZNRJ2KgXxBwqMX1Zti0eaKcJN6XE4N9ZlzQx2H1mS
         0fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990715; x=1790595515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sNrUr+jad3Tl28tFEmsrKuGEDrRBiHkzmqFkjdqgIw=;
        b=rNvywSfHLRtlEvLUb1zspllSm5e1h6/jD6JUefNTKfZLZxSN9REmQTTAf7CF7cppch
         6aoOyFSmWakeK8Zcc81Pgvn4+ql2nMF8Y30Abr/Xga9yVHWWgKpqVgImCrOeXRMcqnQz
         qJuJLO3PP+9zdnTjZ1skdDyvtR7YHtGLGA+YJ2wtuSFJcyvDwLf4GkbL8BJLo0hVErVq
         UAyJSJkZs6OsomQ/8k6ceaicOZbkkvKdzqRzBbi2pkIxxsLm7lhAVkzQMsIZXV69lAhr
         cDxQdVYiEO9ZKxQIcCGErIlmIluPr7EEIDjcnA0W5oGDnt1Qg4H6Ukw3f4LoA1RVBmul
         X8Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxvaL1G3q/yKFM+IvfWv4Ipo2vXj5bARQDddt4LqVHAOfwx9yj+1VcOEJDQP91gDHFGeaZ2ah++F5bawws=@vger.kernel.org
X-Gm-Message-State: AFuF++kFxLyeSqDxXuZSrtW+yZo8eIwGmMYKXx5+PTYLNF96zzqDPWGT
	Yu+boKFWyMzhmVTvMZPhaoaMpSxmC2aFv+aTuVeRint8EoS+41JXoTk3Nm0oycNV4YYy8JGqajH
	WhfDVrhXv+gksmICWDhR8qve2tWzeJBk=
X-Gm-Gg: AYBFou3hzaYPnEwzsZVeMgPr7a0hiNuD6LSrHktrP47qVByvR1Yi1CY64FlpYn1q5tw
	jXL8RIi1TTYbTvJBl9fPfzjX2KtLTYnYZKDuoTxoAG9xvG3TFmavtWTZrFFdABgnlqZp3sO2PGx
	9foXxiHTDPznfaJTxJB21Cz69/Bj/Bxb05bwqkg1w3c5CfFcI9kmFZBAy2S1zHVB9dQypDDkKGp
	2X0UALRzb55BNfB7sdJOSseg1eDgluJe/+cxotDPiBap5y8nY30/3xpSxai3TOYTIdPWfH73onH
	kRpIOedCe6o3KVUJlKdejgIVOoAu19QZGGDr16ahAUXvtuo0axPMVG8WcA==
X-Received: by 2002:a05:6820:4b86:b0:6c9:80d8:a1f5 with SMTP id
 006d021491bc7-6ca9cb5e01amr10711323eaf.50.1789990715296; Mon, 21 Sep 2026
 04:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALtE316UtL3x7LL6uxfXzx8rW6AbzYPeDOb478hqJCr_-dj=Wg@mail.gmail.com>
In-Reply-To: <CALtE316UtL3x7LL6uxfXzx8rW6AbzYPeDOb478hqJCr_-dj=Wg@mail.gmail.com>
From: Stefano Sasso <stesasso@gmail.com>
Date: Mon, 21 Sep 2026 13:38:23 +0200
X-Gm-Features: AcwNN1WjT8KPBvzATRlJSg-_sEHzX1wCRTtWTkB2fe-R482GL2cs_EN1Yg8W8Kk
Message-ID: <CALtE317EzDwKn_Ny8O8wZCFi+OAH4jsXzBBEDh==D5ubObOtpA@mail.gmail.com>
Subject: Re: [BUG] vrf: attaching a packet tap to a VRF device corrupts
 skb->csum for packets from L3 ingress devices (Udp6InCsumErrors, packets dropped)
To: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,
  I would like to follow up on this, since it seems I got no responses.

> Attaching a packet tap (tcpdump/dumpcap, i.e. anything that populates
> `vrf_dev->ptype_all`) to a VRF device causes incoming UDP datagrams to be
> dropped with `Udp6InCsumErrors`, when:
>
> - the packet arrives on an ingress device with no `header_ops`
>   (ARPHRD_NONE: tun, ip6tnl, gre, wireguard...) that is enslaved to
> that VRF, and
> - the skb is in `CHECKSUM_COMPLETE` state by the time it reaches
>   `vrf_ip6_rcv()` (in my case because conntrack software-verified the checksum
>   in PREROUTING).
>
> Stop the capture and the packets are delivered again. Start it and they are
> dropped again. Capturing on the enslaved ingress device instead of on the VRF
> device is harmless.
>
> IPv4 should be affected identically, since `vrf_ip_rcv()` uses the same helper.
> I only tested IPv6.

Please let me know if there's anything else I can or need to do - or
if the previous mail is enough and now I only need to hope for a patch
:)

thanks again,
Stefano
