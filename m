Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762765;
	b=dbAQOOu8RGeoEfhNLQwHRAFuNmxcewUgewHNM4TBRFQ2IIaiDNHe/4IWVjHPMHYsfFVy
	 YheD8zsNvf1UvIjqLSgdiG+jHW+QNs64XB4s07qCo+5E0VWuZtcBAczJjN5FMPZ/nZEyX
	 uj8/sBtAJKvlYFrIeeMdFAdJWfYJJr4U7I49ojPFRBHnodDKsIxqByxAdr6kehfj4GZ39
	 vAQyS5wHgOVpjKYJq1DWHIbMX8RGrPBNRhxqHCWNXMlAILID6vymawpVpWQSD0FcrFOoi
	 kLoUycpm2gCjZ+sQKSrdy5Qna9Z6cxH9mYKxpv6p4xLwzf4HSe4UdovpcEWjFwS5fRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762765;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=q/FXb9aWk8RMV4mySgy4meuQjo/Ip780RyKlEE+DHWA=;
	b=sDheJCwa4zkBAfl6kGJ8lnB0bVWkpsfLcYZg6I3HjLOCDQ6i53wHOJ7/6R91GKsf82s5
	 xjpf3OCN5eAQpoyZ/C1tIqujlQXNp8Fw4PyWGvG/jdhrq/sOfA79SEYi137zCHuDJK8rO
	 IrjntkRP9FWChptdmYEAHTx2rOjOP2LJqFxVY7beqnrg6NzuzJ8X/RCbTvE2htkoTmlI7
	 Z5IlupzaKTejDKnz3MA87Kt8pWCTOjwzd7lphPSCcR+HYFge1OZCp0adt+SjFSm9pX31E
	 2S4EvRI0Yeh2r3jIFx2wy2sNaXcTDeiIJf0GY81yOazBQm4a5Qsh8jvV1wKJmvHHg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E09606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E09606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso144047366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762763; x=1793367563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q/FXb9aWk8RMV4mySgy4meuQjo/Ip780RyKlEE+DHWA=;
        b=vWH5cGWb1SQzlGFuuRkbWJZ0Qjo9LC3pFKszl+eVkjW4/ub0dNBifbarunPhndZQ7K
         G62V6x99MVQ5IZ8oQEYhQSDXE3Nq49KGIIAUxJuXJ0O3jY2JKZK9/bjDxe6SSBZLfOi0
         popssOtLaQYpDmdQJZ/3NTnsoajKaHln1sqYJjim+ZxvDw3EgGFc00RazRD6PWt4uyF/
         1zk1F5cVdCwgFnl5CH2g4K3eHvy2AnfrnjQAO+REe0mEHlrgYVAFSc2DCcQ9r6rZPQBc
         fTa7c4VOljVO63L9IwDAUHZFk9FZjFEdURj/KDQcKWB87EFqkyOM0oBGI0+ibmMhd19+
         KAig==
X-Forwarded-Encrypted: i=1; AKwUvBykRgplG8HuP9c9GnRWwtVaGY3QvnYRN6EYBRBwYN7r2H+tNo7KjBWLkNeY05u75Uta6XzlVIaAEJB/xS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyFF/qLI0+XUEQpQUBnqryLwp37V4VeOpCxI3RRW0DIKpgG46F
	UgsO60U02mrFssbvIMGvapLjmZC/CySJgmEYgCb9qLvZZtW6DYZ6idoa5z+2CGDcU8c=
X-Gm-Gg: AYBFou0XEl1Hrh4ZfMaGFawtTbpy9kDTCvxpvFquUDEITHu68L33vGWIK2thIvvmmYf
	64Yoc0u8TC8k/FLrbUeTDzYS9hPW1hRsoLtyfEftLiIi/R/zH6rxq3/uz91wJsmdeYxI+2YkyL9
	iGIziNSOcqaQFpo9UZKaCaAtkzijD8BhgnOHhsbwrY2i/id+6KhOwVS967SHq8UBLAniDci9Z6D
	HY+PjtRHC8oQk5CNyMWRRSQGzJ8WW72fkbVnxmtvfE64k4Jow39shEUi0T8NM3EO9dpDC/qE0tt
	VKpHOwBX7ch/T8BqiO1dza13q2B+hZ6kfNj9tLC8uwgRYA30JEiP20U46vMaKbPRrlF1aB8gmN1
	d+xAXMAaruyctYb5lHkzxwiX6pvb9qtjDWME98ISlx/PMbtawgrQ6fl6M3IggSfCqcoYV0eYZlA
	Ta9pc4xRYqjQz6KCf07yu1RFHixWMgOhGDckFhtekEIftVNkKbyTlHyB/TfP9vMYLer+X7dU2m6
	xWNOrNm1S3x1ht5VQdyr507hB5KP0ORF428pR9fJ2oTHW7HS62RpqQfJiI7NARimW+4Z45DV5it
	UYBC6ZxmimK9brcmAg==
X-Received: by 2002:a17:907:7b85:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c46a92963camr347048566b.11.1792762762913;
        Fri, 23 Oct 2026 06:39:22 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8da997asm1648666b.79.2026.10.23.06.39.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 06:39:20 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so1390984a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:39:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwR2wHwt10W9hgen7D1It7VmF7LuOW3PNZi+A8goeUy0p9NcPiu9T8GWl2i1qczE969AHTJ4jlRu8Ofas8=@vger.kernel.org
X-Received: by 2002:a05:6402:1f11:b0:6b1:d148:5a0a with SMTP id
 4fb4d7f45d1cf-6b432be9346mr3876276a12.19.1792762760594; Fri, 23 Oct 2026
 06:39:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dev-mctp-usb-lib-test-v3-0-ee5bc3ea1db1@codeconstruct.com.au>
 <20261014-dev-mctp-usb-lib-test-v3-6-ee5bc3ea1db1@codeconstruct.com.au>
In-Reply-To: <20261014-dev-mctp-usb-lib-test-v3-6-ee5bc3ea1db1@codeconstruct.com.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Oct 2026 15:39:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTGGdGWZ9sKz5_sQF1237gV844cEhkXr6v_TUHPOb78Q@mail.gmail.com>
X-Gm-Features: AclHuK_taSWkqoWJ55TGYbrilVkTwq1Avu2z2PyWM4RMVHph7TJaMbjqEHNy60Q
Message-ID: <CAMuHMdXTGGdGWZ9sKz5_sQF1237gV844cEhkXr6v_TUHPOb78Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/7] net: mctp: usblib: Add initial kunit tx tests
To: James Lee <james@codeconstruct.com.au>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Wed, 14 Oct 2026 at 06:54, James Lee <james@codeconstruct.com.au> wrote:
> Add tests for the transmit path, where MCTP packets are handed to
> outgoing USB transfer data. Testing a spanning transfer that is expected
> to succeed, the failure paths when sends fail, and large sequential
> sends.
>
> Signed-off-by: James Lee <james@codeconstruct.com.au>
>
> ---
> v2:
> - Correct flex array reference
> - Simply return when mctp_usblib_test_tx_send() fails
> - Use skb_put_data() instead of manual assignment
> - Remember span parameter exists

Thanks for your patch, which is now commit 1e12f734afc10477 ("net:
mctp: usblib: Add initial kunit tx tests") upstream.

> --- a/drivers/net/mctp/mctp-usblib-test.c
> +++ b/drivers/net/mctp/mctp-usblib-test.c

> +
> +/* Test sending multiple packets in the same transfer, followed by one that
> + * spans multiple subsequent transfers.
> + */
> +static void mctp_usblib_test_tx_multi_push(struct kunit *test)
> +{
> +       struct mctp_usblib_test_ctx *ctx;
> +       size_t i, max_length, tx_length;
> +       struct mctp_usblib_tx_ops ops;
> +       u8 *buf, *flat_tx, *index;
> +       struct mctp_usblib_tx *tx;
> +       struct net_device *ndev;
> +       struct sk_buff *skb;
> +       const struct {
> +               size_t len;
> +               bool more;
> +       } sends[] = {
> +               { 1000, true  },
> +               {  500, false },
> +               { 5000, false },
> +       };
> +       int rc;
> +
> +       static_assert(!sends[ARRAY_SIZE(sends) - 1].more,
> +                     "The last push must claim there will be no more");

This fails with gcc-14 (the latest available in Ubuntu 24.04LTS)
and earlier:

drivers/net/mctp/mctp-usblib-test.c:819:23: error: expression in
static assertion is not constant
  819 |         static_assert(!sends[ARRAY_SIZE(sends) - 1].more,
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
