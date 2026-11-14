Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672880;
	b=qs7EZhrKw/II7tDgV2k3Oy8b4zpOffo+rYvWgarVgcmIfPRp3ncz8sy+ckMZAJBqzczn
	 zEalm/u/CuLyl0lYzv6i/cLbumtSLaFd4bf0+H1Ntizv51QYkzSpvvQvlnzn3MOGnfMgq
	 zisb4UWF3Qm3fnNovBMFpqLCk8N3nnDEo4oZCCFO1O2LGBVk3v6Z2XHmBX6ykq5X9D5+s
	 NX6B8viROIJD9/xLXYiZZl3WGKJVN+g7gVv1jDqosDVyAqS2Aq4eQHsJdMfHCmiXDLF59
	 zvmXl2txVrBIZKDb1jg1lXpmMw+j4e30mMSgh37oqnX3QXxgJgmgfrn0KF5MhaiiW9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
	b=ZwvufsKFruXR8bDlNVnUZuawfSiUKbVMVXDowAo4INBLtBoAg/H/RpEdWCEPcNh6QT+q
	 zsdUOC20MUOuOXst+OH+zCtPOT+9dBMzuZD6LtOqNsMrj+GxShUNx92NffesbFjQX2uMR
	 TVWq6+8UTnoXxba3sD7pjLnKrQZlycOL33sGFh/cXySW9DF+BTASebZJcDfeJjo4N1Tut
	 m4WcbbL7TMFprv4Lbpp+yqQWfuvjs/nzAGSUEMFbyzIkEwWjM9k5CdvRQ5NvZ0P5t2RT1
	 n7wt7kTZennez1TeFap82T24V5wcwfMxwORk2SKxxp9ycwaBbilr7C25QVACBWqH11A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eGnH8kXM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00B606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A00B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eGnH8kXM
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-54492d8a988so108381cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672879; cv=none;
        d=google.com; s=arc-20260327;
        b=J/of0OseaidXSwX+W1IAYH4XduWnhXfbSOYqh1BN1t6hUuvxP8KRMSq7B/YXCru4cB
         1Ma6uws/jCn1AZMTQ1ETNHfk6dCnL6q+/9lARVmh2Qkp3tU/KaPcbFCfVowQTA0x4dWE
         k8UlqMhvN0JVhhAuANlsi+3qeHUBnnl+lfCDGYJ/nsdYHTyFyMkq8aRghLTM/tKmIpk4
         tBgFsltiw5noMUomiTJJ+TJ4Jg5tGbyFBfXjaTgi03yljbLrg+JHBTlma2675K51OoO1
         WnV90AfpM4XN6uHr+cD3koK/ZQAUKAfGaw6jrx2AKVozVwCikAMpZb4OxMY5En8EDjNZ
         APIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        fh=kiA3ZNt0lB128ypwvsQjUBlyfFAW0fQXkX8J1KEBsPg=;
        b=HRN0RL1zy9ttlhrI++5iHK0ZjZwmPjCgs0FDUd+WKN4VtUHjU+5Me3cSCmZV2meXxT
         eFYEaR8gbDFM9+keBNzMQ9CZMIOSgLc8U5zqh2D0dmQAybJ+EUVsaoQVkES9ZuIx2Ig9
         KNwgc9Vf7iqCn+jMqCAgU/rPT9QB9vx6A689paqqgD6pOxl+4Bsg6X4WJacRWcOqQCJi
         LTyLlB1ArMTz7GSARyhOzAMKCZaRwxtw63yBUzGVf17d3+qbaP++o+Y6e5S+3P6EhEMQ
         Z9irMIQi+ksykj6T6PuGabkXqjZ95Bu47hV1i+6M9M1w0KZMyXY1aX2qLe78qJ7dsEkV
         qL+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672879; x=1795277679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        b=eGnH8kXMOYxC2TlWp4DVV3gFXtmUqtPsMEjaeD15pze6UXKcTQk0PVcY2uu88INmhy
         cQUr9WEkFjDQ5HeF4AE6m2Tudp7FCIF5CKTgK1EcnR07aNwNxqADbdO9eCaezTJUgtqm
         Fb4i2HWdBNYqQQumVPu+XIKwapyBXUNPo8zxsuaFeKFnAti+agc5Qgv4TJ++gkYDTzKz
         U5M9p6WJkHeu7Pk89bjg8ZGAsXSj1U6XFwKM9chftOZCCjy4IfUmjXrulYXGqWbbKmaM
         TFYH/pKdO/TMo5YxegGwUcggTRsZZTp2dYhIHBSzWafLSFHWPyyvGygDoSxX4Sbwjx+Z
         B/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672879; x=1795277679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        b=SZSsiMOnvmmwJKB2mi9xtK7YC77L3ZfFYcs5okX7y/mv1RLu6jQrbSMNcnUmy+gajo
         78A5Ot97nlV0piHTES4ogrdCljFKtmcG3OK8bsO8INXcWydPACt5UeJrvjxnrIfgo1o5
         32KoviqdFFDaaQbYEpwWgEsVpLkQ40hqtfFPlfr1h4LxR7illWqtRAu95fassNNjSS4m
         vyLKz+EINj6erzfM7gZfBbimEg1epuC5txNzN2xAf2qdxK3asOhMUvuK+KvTIlvM0zdA
         07YefUkq5PrpmOz/4RK/Yeu5QxMgE2Xb5b3YQm2gS0jRTtvZhNzSW3hpBuOMGMjsiz+G
         HAEg==
X-Forwarded-Encrypted: i=1; AL+hErF+qo/dgN6eRAaxuh4JHu90ZNEeH/xKxiTXnjl5K0vAYB43pj1g+kekhG99LLUkXsZPYZBBO3XQ9yWzD3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ld+tedn2p/cr4PtcJ+GX9UctBDhk/uybQfvoW0wpj3gMtakUi
	KolZBEGlX6nBrK3Bdh2t8j/J4j3iSVYRLtrJbaS1VFAz83xJbFhubibz4VcprAcWjeJq6yHT8s2
	xCUPgbzV1N0a6j/jorQafVd7qtcwuDAmrWQd5rRwF
X-Gm-Gg: AYBFou0PmvC/wD9+bAmD/ruT29G1NZzaxLfxcm2NQR3rP+s9+BTuINiCqMjn3aTD6hA
	29IjLljAqAzhbPsmRIVlNHUa8rR3WyhaqGBbj7ii2hbP0nTKlzJMmUzpNh1Tn89ExbLxosMAdpC
	28SJPGbyabHXuupHrMd3+TT1XUmJT9YQx7LsTrbZdV5IUpFHLiAMZmolf+shGSgzACvFSumpXK6
	clC7pmz1pGxqPf6KO8LtLKPqjkEdH6MrJjFBoOAvrhsqx5l4jWmIQYXi/qZ+NpBzs/MrMtr9wUj
	jfj9SUfksGt3CNZm8GWx+9wJekF6YbaZkCxZBSnWm8Z6K7l04kiWKOzsMp34FtqIollalmEAk/f
	ZiHrAq3MG+PF9eQQ3Oa0S5jIMcwmfk1FaKGjc050xcOkiwbDKCvfUnxrkJlqfcX5whNrDTPsRl0
	iJKyEG3TMOIRA0lC541P345eCCLiU=
X-Received: by 2002:a05:622a:230f:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55c67104981mr13076961cf.9.1794672878652; Sat, 14 Nov 2026
 08:14:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:14:19 -0500
X-Gm-Features: AclHuK9fNu1No-43bBVfzzgRbtaoksUaeXTfvDONR5zNzzDJjI-OMhnJGTsg3KY
Message-ID: <CADVnQykdN2GhRDNsA6yMoMcj4Yig2gYt=i96zfbVOSmP=qb1jA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=3D2) has
> no selftest coverage.
>
> Add a test for an active connection. Check that it starts at
> tcp_base_mss, that it sends the first probe half way between
> tcp_base_mss and the peer's MSS once cwnd allows it, and that an
> acknowledged probe raises the MSS and leads to a larger probe.
>
> The SYN offers timestamps and the scripted SYN-ACK declines them.
> This also checks that MTU probing uses the negotiated header length
> for the initial send MSS.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
