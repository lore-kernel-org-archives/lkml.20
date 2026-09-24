Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E44A1DF4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276671; cv=none; b=Awu2wwyUd45bzXUFrFXNq8YpQOfWgmRnRqL3Vf20ltv4x3Z5qwWG1jJL2BmiYU8t73Ou7vv2T9ebxnSjzOKITCOD1oN/Xgpr5SZBcoSJWxmbotWr0LaSxaV0eISTBL2wesq24iCe8tIAl/fkSpaibjFKg3FIADYNuOqsiylEMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276671; c=relaxed/simple;
	bh=SwQs7Al5j1UmJvVEuj3rQLTuudaBD2rDp3JiMnsW21o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k50uwx3F6xLNrk7TGq4bFy0YqEzJVKG38wTDOimZg1PT7hjz5Jy6OWLVGKyBdsUM8x78DC3vD6DU0UdFCIppJYLzJPooc30GwmsfyS0eajpQOUzDTThvnXsMa+s90TfMi9hD/J66142sRKZLl8Rfzmn3jscSzE95tvoF2U2Z8E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IsgEQMcR; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IsgEQMcR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so330173a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790276664; x=1790881464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0LKHGhZmNR41NYnppZNxPzzSiKvbLHZ+crHqls5R78=;
        b=IsgEQMcR5fcGUNjMF8TVLH3EEQEnfEf3sV63ov4pBTBGoXNQMWlapvdHrFtwF2WrHv
         PNbPOVxc//M8yMtFd9CFoKZDNfhLhJ4IMEqebrtHs3H1PvKwrt2Smc7OOeSi6+ko4cfy
         +r1EPQoZykwC3tivZZB83IN3/ayI5kkzPKOFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276664; x=1790881464;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k0LKHGhZmNR41NYnppZNxPzzSiKvbLHZ+crHqls5R78=;
        b=dZlUCUWNyiCw72xwMW5sNenYsMzs4tIe6CreUQIeX5nLzfMqJtBquAiXcUmS6L3CbY
         FGin/AfhUQPb0AGHF5LM4V/MvzYZ5N+X5L2/1iqb/k7+AUkUCDQjtfgE5WmsP5Mo0S3W
         CWF9suUSvqrl8aRxNcLtbqUMurh/Xw+zoGviD+Iws3bcidQ+D7Sg+CJ+LARD58Nf2j22
         03RdaJxXtAzqOtM00+ntNBhl0z4hV62BeYEs1l8umJWuGlM3AcFsM4LeK6ZDX/8U/t8a
         m/K8OyxMbjv7VU1GrB61Lf7HfzCnHwXSz69h5Sh2VQbGPWmIJL26Ca3d+L3Dsn8tz0p2
         iZ6g==
X-Forwarded-Encrypted: i=1; AKwUvBzi1UEmkm9iqAfE6pBnukxArraQ854W20IlJuSzGio8sKpVvTRHl/3nbBO+AtRWye1iFMPITD6RGor9SJA=@vger.kernel.org
X-Gm-Message-State: AFuF++nI1HwDspyIF8hkItomd6f8qq/IlR++ctHQmF6zcv+Z2/lhzzNI
	f6zpe5OFVM6edMICLCNmGrPpjKoWoWtVptpOci4fEnRKvhmPmp+Qydfc9UeFGaZrC7gvg6A7c8D
	R7ztPpFk=
X-Gm-Gg: AYBFou0YKt3dPmcNkYK1HauTqK62sMoTUwAvdQAkI0FM0d4jWUlTPg7G+9dCCBjbjjQ
	jhZD9dv3zfUMIXWMmPooxz6okcZ9VnoFPzbcz5Tcxsu5DPcdfv88Gqqn1PfouFUFDt40vxf4PZm
	9zIouJ2cEdV9d5iCDhE+bXS3MLHZXElg4QlFTKooBd4hOFxwNvHvf/5NxZcr/hsYMsO7BOKRJJx
	0S5gtOnA7bmi9u1KpdgJ2ZekUKTHlT5fQFlv+2buDuGdJDbY9OOt6Vqga+lpFiKljk2QZzKhYQK
	r4Da7ttug+26cakvg1ukXUKwB+SuM54aOaQwMabhMnsWjs7UWVTz24QPhfmUM4ry6AGLnwPoZtc
	MGjUPCW8gMksVkNzat0gI7+hkQaO4IYYV7Ozf0u2e7N45vN1tbb8a7k8ft/8pL7ipdraI88hK0L
	WqudMadVhNoWlmPx/K7vVr5E6cc66Hms2lRhaiCBotmW3rdbVbN8x3U21AUhSJVywkR/buLlOq/
	V+Yx/hkYj8VTLwUiW6mfaXNf12n3UW+IWpEKvT9oD7dUUUY9g==
X-Received: by 2002:a17:907:8e86:b0:c29:f5d8:9c73 with SMTP id a640c23a62f3a-c2ac226d665mr332872466b.34.1790276664120;
        Thu, 24 Sep 2026 12:04:24 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357cf3sm3620166b.17.2026.09.24.12.04.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 12:04:22 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so20772266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz93mSsnnKAYjYGspFnByRj9+ULrpv3L3J4AzSaLpf89Gpga0FOtHACPKCYNhmUEyMmadylM+8tAC+INdE=@vger.kernel.org
X-Received: by 2002:a17:906:dc90:b0:c2a:85:5c01 with SMTP id
 a640c23a62f3a-c2ac22cabd1mr316782166b.41.1790276662520; Thu, 24 Sep 2026
 12:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924183257.2700506-1-kuba@kernel.org>
In-Reply-To: <20260924183257.2700506-1-kuba@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Sep 2026 12:04:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSnTE9vBZ=5_v+3EEkdazCCbBM5YABRzRHUAeRdyd4Xw@mail.gmail.com>
X-Gm-Features: AclHuK-h0HvnSFS6BUSGEtbcXeLV5EnKaL4B831cNvb7NqxoQbE6uE34Lfb0WDQ
Message-ID: <CAHk-=wiSnTE9vBZ=5_v+3EEkdazCCbBM5YABRzRHUAeRdyd4Xw@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v7.3-rc5
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 11:33, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Every week in this release is record-setting for number of posted
> patches. It doesn't seem like we're creating any regressions with
> all these fixes, 3 Fixes tags here point to 7.2 commits but none
> are true regression fixes. We're trying to keep the count down,
> nonetheless.

I'm looking at those ovpn fixes, for example, and they fix old stuff
and they aren't marked for stable. The ones I looked at seemed to go
back to ovpn being basically merged initially.

So they clearly aren't regression fixes. Why are they in an -rc at all then?

Are they actually important enough that they shouldn't just go into linux-next?

Your merge message notes don't even mention them, which to me says
"not important".

"Not a regression, not critical" should mean "next release, not rc material".

Maybe it *is* important, but then it should be mentioned.

I've pulled this, but I really am trying to start pushing back on
pointless "fixes" after the merge window.

For post-merge-window patches, it is NOT ENOUGH to just be "a fix".

It needs to be a regression, or it needs to be critical. It needs to
be something that would merit the change being marked for stable.

Regressions are serious business. They break existing setups. They
make it painful for people to upgrade. They are critical, in other
words.

But stuff that has been broken since the first release of the code?

Sure, it *can* be a very important security fix. Or - more likely -
it's just a codepath that doesn't matter, never did, and was found by
some random LLM and that's the only reason it now shows up.

            Linus
