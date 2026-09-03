Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A843D4EE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425073; cv=pass; b=nsLZrSihkE+nekFn4LY+AIIdl7+xR1jyaBGeMi0qjcDeskCa5Xu1CfIaE9vn6+8OpGsFXPBlwtVB44+x830owqTmUXjLyTptoocV2yP+Fi1B3LZf75iRMtpoGs02M0zpp4nKZXFBuUW9xECt2P8IiLor9RCtk4GqcqpcBlPb0FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425073; c=relaxed/simple;
	bh=eo/mKAbZ8+ZAo6pNEeH1tClKeAv5a7K+pTLrtQ6S67w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnCcsCE2xfcXtcMCx059SvcoOdSOCHZCmQzeXQqQsIDnVy/zY3e64TotFGJKufsxPThsL9JxaN4Dlu8UZnwk4HojAFYse8cRJT+waDfD41fiHtQAjf8nfxYEawgUrNTeESFpYUt4sldh6r+HImIeo3rfTxosRa6SJSNBb/CZWmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K6kiAv3f; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K6kiAv3f"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5304310b3e0so9285001cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425071; cv=none;
        d=google.com; s=arc-20260327;
        b=hAYfRwJrLVXFC+KBAryZQ83GtLM7WVkTwMGK0Em3nAqZn8HqgJAFEXcSXETa5bnMHj
         7XB6n032JRXZ/ZdPQ2luPDXmZNWeXvkTwW8T5u+3srCNYvV9dVcvMf5EYzQAysPXmbqq
         9W332WDq0HDxt8WfpIEv3N+gh95PPRuGIlv3aTDOhHP88+/ziNHXOmQ+G+UyvSi97isp
         hcu8MoABQvQv8dkfvqu5d9GKNKFAvnIkaNsAty/4VCMYB8QD/8Q1TI9BfoMauzACEknW
         jynzOC3mtMkslDwY3jLRowBOsCK5p0BepVweSN/q1aCV3YPdTqlO2Ob3sKGF/v9Vz1Ke
         NTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UGXcmmUVVzmY3X69FZhKc8apP0syqk+bcVAviicg0iQ=;
        fh=vO/dFVCceozndOREhu8R1qEt7wH/qHYVkFTUoPkEnPQ=;
        b=fdOHlql+voF1WBKQQ28TCtiuwvT+VQTMuT5lgZt5huOCT1df5aPnQZX7YfohGhex5A
         tCgB8b/8bMR1//RfdS68yfC8VF6JH5nFnvE6k4vopo5WOFLORoT6wtGB0orY8XGklgVQ
         lNpU+pN7BGH1HO3GV6ngko8inRP2oBYNEZUI4RP3rbTshGyMw5OaQ51+Ol30sQyyzAqg
         11t4qN8E6JIhghDqBwu3mrrG2b5cRj00qq7FhkKcDqsnyCR6WY2D81P2reZ4LOXj6HMr
         UwTqsP3y/8e42+WnsYlCLvhdwEHHnlVNac0sluPeu3oG6gg7jLT5b1MxKCBqhzQYVDcY
         GH0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788425071; x=1789029871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UGXcmmUVVzmY3X69FZhKc8apP0syqk+bcVAviicg0iQ=;
        b=K6kiAv3fjWk24m0b08pvLqLEYgRTmYEtPUBxvN3wgrYRbEMZM28PCUWCjnWzwWcbSh
         uGTPbQo03cLbm8V4PV9tFHgWP+mtmy4SblAM0rOocccBe7Ar6R1u6DSaKB/cWGij9ulP
         aLNUqMssasLEYzzxh3eib9F7PCRub2d9OThGZux26GcUHIB62QB6nf1k11aSnYlacRDN
         VPy4bl77Z7cF142k8TctNHE0IHCPhpZzB5wtqCCwK9Re+I+cAXHobLVpsrh6F0L/MC3p
         2pEctyS0mgYpHUDTi/Egi1taKRsKY6OYfaaq0sKspG0ROw6QL4qy+U/fB3jvqJYedICF
         gs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425071; x=1789029871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGXcmmUVVzmY3X69FZhKc8apP0syqk+bcVAviicg0iQ=;
        b=bjxj5dOLLVJuwz8thDbqX4TMGuPxbwCO3V2MvEeWf/nRwQVmXjf4Us+0iqpvC55Et4
         MSqpd4uWp6mODVPJoiLnv85dx2MqSaAGP1Z97Ek0A/YRAIhvO7GoQoF9YcVJQ/xIfNbt
         dSrOZy35Dn7EJLzDIs5fPWzv9TshCk/OjKxurX8E6r/x6P0BbFt+gNr97EEentUDs0mn
         3Y971BzFc9/MlMHZn0KA6zPhQl4TUUJiNSvqRzsteRCFkqxSz0ibmgX0qcbXOlb80Ywa
         KfdqXu5HhMRpTyen2m7YrTMOrqWzWHwU0V/v5S2D4Fc5UWJ+rLjaZlfTnM1Tn09sdyY8
         i4uA==
X-Forwarded-Encrypted: i=1; AKwUvBwmdtZ5Q9V3nQ2KcHB6gaO4MzWBNofdDaWg7oRJIHHUZyCthWUIGRZRDYE1ubfIikuMpyF1wai8LWXb0t8=@vger.kernel.org
X-Gm-Message-State: AFuF++kubrJcBy4rNnIdiU/ziqHsZbg/JL6GcmWQYU0pD1bxoF0LMntU
	C83VI9RrP8QJyKCmEVweGUUnfqs8thGacYqyOzU4OShJKf1OOgTnjgbSYt6wR3VFMGnn0BlH48E
	VuchQqIfsObO9yEiU0ooYzv6EEZbsa0HZTRz7DSNB
X-Gm-Gg: AYBFou1D2wlUQTHg5AEZ3pYeHRjg5dGbtKLaVtvW3n1A4klEZmuuykjKzSPqGwmV3ht
	g82effbjHin8ZrZufHUWzenKnpvli+iHqrrLGuD/iGcG3J2c1H8EtOZo1uNw0f8LVho0OcBZVBo
	f06e0SOtNToawvWT1l389JFAXXeZK3VCkTzcG0Zpwp3swE8AcyhtlGcgthfybNL3L0JhijFs3Xs
	wYd3T6BlFQ4UCNi8U27zw8+0Bb8vMJglgYrwcAQx2rk49RQkJ2XpNeTrPTy7XQT0vRg/564Azw9
	t7fTL9WrQyqyHvaQjmvHMruBspwYbSO/I8mf1wQN1BA83dfHA2pQBbsmEsnFiszvUwR2Ozxw4Xy
	ZnaswEbpD+EYZY6uHp6opOcj9MPlkFsOF44JYbkl/8wf0WEnTiTBFwIKXcw==
X-Received: by 2002:ac8:690b:0:b0:530:42e5:f3a2 with SMTP id
 d75a77b69052e-53042e5f5e8mr64804661cf.43.1788425070051; Thu, 03 Sep 2026
 01:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apkR6ZU+tqP2C3Fl@griffin.linux.hr>
In-Reply-To: <apkR6ZU+tqP2C3Fl@griffin.linux.hr>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Sep 2026 10:44:16 +0200
X-Gm-Features: AcwNN1V31QTbQHlVUR2Ei5qRHgvPD8qcEst2_28P8qGgpJy2SSyFXeEe1YOcxHE
Message-ID: <CANn89iJ+qV5T1xzwqUKzw+mCryOfKyncSB2WPA7vhsTMJ6DfGA@mail.gmail.com>
Subject: Re: [PATCH net v2] ppp_async: drop the errored frame instead of
 resetting its headroom
To: Vlatko Kosturjak <kost@linux.hr>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:21=E2=80=AFAM Vlatko Kosturjak <kost@linux.hr> wro=
te:
>
> ppp_receive_nonmp_frame() prepends a two-byte direction tag before runnin=
g
> the pass/active BPF filters:
>
>         *(__be16 *)skb_push(skb, 2) =3D htons(PPP_FILTER_INBOUND_TAG);
>
> Nothing on the receive path guarantees those two bytes of headroom. The
> frame-error path in ppp_async's process_input_packet() resets a reused sk=
b's
> headroom to zero while claiming to restore it to a freshly allocated stat=
e -
> but a fresh skb from dev_alloc_skb() carries NET_SKB_PAD:
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
