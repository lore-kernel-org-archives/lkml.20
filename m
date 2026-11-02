Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585664;
	b=c1eLKbjdlJqsPEbTO0h/tVJaE/clygNY35+HiKyfQjUK+fo4M70PtsEMns8qugLfpVeX
	 K7qQAsm2b8V4dNENDPWJJ/YEcc4jQBFqBlUWjzNS+a5skFMSPkd2kVBvXS8r61b+EENmS
	 WnaWb3LEXsvLWMnomYuhGNfWz9gGrnlfvZb2TTWXmjTnagNdBrChy4Pk/Lak5xBM5eXP3
	 90gLItZm/gI19ae3Uc4SVCG9oDcGy8qGdv+wnRRtmPAhYkkOHApbc9SsEDBgn2kvDAeo4
	 WOv/X2H7deeARDp4RNHiY0hKN3rTjN7UE2KdyCb1dooBbHc9JxF159Wmm9ZY6Ussj8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J7MH/48r4Ni/jzs6ijJK/lnj/9Uw/DovSxpncCh69tY=;
	b=z3cmeLZGBGMUTDLcmvd02PiiZ+h1gU8LQzjNO8fu5w/LzkC5xMrvnpVR7c02dVaI7Ukn
	 rRmzBCb6CadRRmebvB9M6uWGS0YgPiRFe/hnexO19Y0AR6qXFik883tyxHO8RL8ukH5jt
	 pMktZN9Xcy1bwVxYWaGeyDC7/PiSsSFNBr2HRmQU9dkTt0LK+aU3p21MWJQM3Cp3YRoNN
	 HDJaRLmQI4znSEUmW9oyHCRmGK/w7fKrmBadVL/eM4uT6wufQouMoxYdO/Y3wIqUKHIMA
	 52Wdnn9TclrElVq7zVU4tHWJRgoi3dd1BGAe0Nk13+wv2psTS+6jUoHYlXBjFGnAATw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIy0iLWW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4A606F6CB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF4A606F6CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIy0iLWW
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-48ed0b68895so1757965fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:14:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793585662; cv=none;
        d=google.com; s=arc-20260327;
        b=EHMJgcbfK9GHGLWK+uRF+8gN+zM9ud9ERbP2CV6pMcHzpbXkH7wBQnHB3JG6Xx340T
         JUrqs0pxOFn0u3Ho0P9CoFSDnwq98PbhnR56SXF3p2OHurbxqZHTRyx+l3p5p7OYT+eT
         DojKQHbLNQgjZ13JChOb0Rw4jLzfIxZih1dnDJ8kAkyF+TRCqj1QQTbn0bQTG3RjW6ig
         9o/3lxH0MEAuUkVvC6oB+o+7Ta2DKFT2IHCjv0pa2bTE73JsXAVVwqdCpDoUskREna1o
         hdDv2h/S3jDT/t/TaAXN9dcDGqQqhLt5ZShuk4o05tCccX/ObGvATNjfABsXePc94Okl
         W+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J7MH/48r4Ni/jzs6ijJK/lnj/9Uw/DovSxpncCh69tY=;
        fh=0IWzpFQp0Py258eGosOxV4qDI9i22mpQ9VOt2n6Aj9Y=;
        b=By1BGtb3h4H8DTvkdbD8+d6RfmEzWg0ejBVBUoxXX+yN9d4q3bHNy2PkLhlAWD8hHj
         7a8MoHFSQVJgf9504ourtlZ3kyFL0MESITfG/8L+8HMp++TVwBe9PxD2mB5DvVwukBDs
         V0xHX23qF3UqPJZTcefp3vkViTfyKpe2oQLtihWLC31B4QhAZdaqPP19Jjxv3W0QWxWj
         7jrarTWmgUiM+aXVboXVEUQxLhzwW4buVwO/pwauhRLovianqGOaDVfyFAN+HpifYR5j
         rc9WNbANUsIkz9Ag65ubNAzTWFYjsMO6+P2Abh36Yzeho79jfxrGlRYBrqz6lKCVRejp
         SIAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793585662; x=1794190462; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7MH/48r4Ni/jzs6ijJK/lnj/9Uw/DovSxpncCh69tY=;
        b=EIy0iLWWc/ueA+1nbLeuNzfCDQ1KKufPJKyskcFmycme1YFSiKbQ9aZWFz0yH2lRGA
         DTbZ1DQ59/ZmHGnr+hKYuEfRowd6mA+Nm2jK3Lu1jdcpno7FHI0QUG6x4ZuMdq3JXxMy
         V5NoCK5GugtC87aJJIgRW9la0lYmRFyt1JWTzklfq1g+tQ6HgC2RmTqIFQ0QJY59UiBY
         hDXwqrS2WgnHyDn5uaaw0kY7HLK1C/zO3UfWR75cFaJkWLEAZ59ZBUSYqkcylXafgX7e
         5XcJMB4YUmE9kXolmJpabu2PGjlVrdvNeclK02CP/fr9+sBGDAbnbNDGMmicL69Kvw27
         Bd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585662; x=1794190462;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7MH/48r4Ni/jzs6ijJK/lnj/9Uw/DovSxpncCh69tY=;
        b=z/k0Sy9+vXFgxgKXP9phWkIAE3kkOsXbw4F005mldNfzFujCl+/34tbPqYLS+gtSTa
         XYNSbjmkhXTlVNpsEi9EnjOmLDMefSvoGR3JyAF+aZNnHEnIZZ7xDZ+bWqsmrgwfK1Hp
         iHg0dAm1BCV5WSHNnJ3HjLMMCkDf9w/cO+RjnYGzBi2mln3cJ++pcplw/BnvRjZLC75w
         8xbXKSrxBxCrwlo3mrnTdL5iI8AZbIuodsgXqp/7CwxyKo+ng/EM3YBHY0gHsyMq/VUo
         LptcsLWqbCpcJyVrn3cjPddZB82iy7S1Kap8GQm8FQpAK9N8nhjs38OJhaPlOrnLAX20
         AXjw==
X-Forwarded-Encrypted: i=1; AKwUvBxyABmCLHgoDcIPajT7ZcUOUmwSMPZhgvLOBD49ib6heS24bGFCt5tgIbKVcNVtbepX2CtUMQrzXU/Bz3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJefqYVGJm1KYHqXWM31o5pZtLNLLI6VELyqXtKTL1h89QaYixf
	aQBOPa5xlKWNwfAhC+iFjMPNTYnpdZJAkjMlkyReDHRw1hwRBrKZOMAgnsbVbMWjFIV3x3p7raS
	Ad0qwfBQQ8zWVAoFxZ38Dlw7CLQERTX4aWY/DtOaz8A==
X-Gm-Gg: AYBFou1eQgZBqsLxEuOOYAaCKOgG8Vp37uawSkGkGEa1y7ggQ3Sd4OUs55BVR9aFXtf
	iV1hmHYejlnTWukSvRCnE2JWRz64Jmu92e693+X0SCHRIbRtDIw7GRukAEbt3fPo3z4GusLKf5N
	jO7yPUWOh+0rfzL0Lv6GkOtOJVCch8gEBDvwU5bbiuAbRs4eBOj6h2h2XuPZUAYmK0516uKVzLq
	GWXV3dPvoMd0O0ksZhpSk7AwynhCgQgpB7BjQlfBt1y/qeymt/pK/qllWi9Ma8p98iRmf4ywT+u
	jhOhs4yHPjXAjYGbGKc4DV6tWGLniz/3HOI1lUbkFKSkgZa6K6NUnVI9tlfmrI6CuUkQWjIm6j9
	k1FP3yEUCG1yOkOaTeWtV1nHqjTzBuZYmR4n9lXwLeKpWAhkn3UF1z63Ptf5QjJh/wUSsFm0=
X-Received: by 2002:a05:6870:899d:b0:4a7:6dc:af65 with SMTP id
 586e51a60fabf-4a90761c954mr5103199fac.10.1793585662487; Sun, 01 Nov 2026
 18:14:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030165451.365591-1-hjf3108@gmail.com> <2d53d5420be945fc9bdfbea5542b61db@realtek.com>
In-Reply-To: <2d53d5420be945fc9bdfbea5542b61db@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 2 Nov 2026 10:13:46 +0800
X-Gm-Features: AclHuK_MCrZszNRjWmbMr9BiDOUVzGyr9u-wzmxnrLzdDFuwUYkS6e5HNCVKkjk
Message-ID: <CABOQOSWOqGEu7xHH1ap=MYqFd_oH7oAhQqCq6Ch622ipHdF5Nw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3] wifi: rtw88: usb: don't report the
 aggregation buffer as a frame
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	neo_jou <neo_jou@realtek.com>, Hans Ulli Kroll <linux@ulli-kroll.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Nov 2026 at 11:44, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > When rtw_usb_tx_agg_skb() has more than one frame queued, it copies them
> > into a new buffer. That buffer was also handed to mac80211, as one
> > additional TX completion.
> >
> > Report TX status only for the original frames, and free the aggregate
> > buffer without passing it to mac80211.
>
> The rtw_usb_write_port() might be failed and call ieee80211_purge_tx_queue()
> to purge txcb->tx_ack_queue list. Should we check if the tail skb of
> txcb->tx_ack_queue (or just check skb_head) is drv_frame=true?
I traced ieee80211_purge_tx_queue to ieee80211_report_used_skb, and
based on the code here:
https://elixir.bootlin.com/linux/v7.3/source/net/mac80211/status.c#L759

I don't think it fulfills any of the conditions, so drv_frame=true entries
should just go through a normal skb free path.

> > @@ -431,6 +436,9 @@ static bool rtw_usb_tx_agg_skb(struct rtw_usb *rtwusb, struct sk_buff_head *list
> >                 goto queue;
> >         }
> >
> > +       /* report TX status only for the original frames */
> > +       rtw_usb_get_tx_data(skb_head)->drv_frame = true;
>
> If we can just check drv_frame by skb_head, just declare a local
>    struct rtw_usb_tx_data *skb_head_tx_data.
Is this still needed if ieee80211_purge_tx_queue works?

> > +
> >         while (skb_iter) {
> >                 unsigned long flags;
> >
>
>
