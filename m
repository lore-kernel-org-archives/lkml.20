Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655910;
	b=zUEj57Pg1Mbcizfwf575Ie9nUSFyRZABMUVncLWMaXHmLidPkjh18qczsVhsHCVXBCmj
	 tTD112zwM6jaiKzcCdSyOW29GPWERZSVsPDWvJzeMgeC2K52j7uBtPhCEVb/sHpIGxLif
	 oQTKmdEbU/pdf6HpyntBcJxT4Ux8NpSrAoMzfx17hrRCJacnnwVRG2nBl6fwSGqHO5gB3
	 7ybxVyLwLYyjBtCMf5xLC3eoT6Ji1DQE7jZCvfGMglzGE3ldo02rGd3TQMcAdFbNsXOIi
	 JeI7wNJ6MLJ8l5HAnW88F7JVU/vP2/TcTgMhJAwzzpaF25K3nCW37b9iTE2XuICEcwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655910;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=DOGsbHPV9Q6LEJI4bp7YU9lC5DA9e4STqXoDKb5ejb0=;
	b=AZNy7Ohp/aLbDV6FjPBZBdmphDle6vNilOwgDTzYXIYvV/Itsb8zgbRaFLEaX+bUBwcZ
	 oaCjq5gQImvX3wAKkFWhhXspCdSDB3EYlmjrQkSXns5s2BNooZG82e4joW78yZQfzp3kE
	 HmV2oiaEncuA6/qnO6AdMUZzwOBIIWhvv1Wxr3ke+tnTEG0AgNKHeibGJ4YopGsIIHFoy
	 GJRMd1vtJySsEd9AUkUlAzIJTzWjqjYybDv9hjVU5KkSUxs4ioIuDduELhrjQjcNSblKm
	 xMDs2uavhg8jwT7BsVeHheg0C4FxipF4I8pDhK4w337LX/O/T8HgfzzuLp3rNse4gVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M76WzVlP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55673606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M76WzVlP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B24C1F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655910;
	bh=DOGsbHPV9Q6LEJI4bp7YU9lC5DA9e4STqXoDKb5ejb0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=M76WzVlPBD5y4IqVS2atl7PqIsbChiueyPRFZxYypwtus+8TtzwLM94gtwqzkzIi7
	 Uynjkei/JU0SDmBsWe1Nk8I3NJSux6STZOQjVQ1eQfOQZz6HffJeHfd/TzpY15o8kc
	 8WhqCoOFQ0jxu+kkVBQNE/Yx7na5wbewb9gOJL1F8njrh6otFV4Qkg5psTGcxAq8/C
	 +zth5lBobhZL4ML2CkEKJIHNRBU6e0m6mO5QdVaQxiZpgQzE1zsViAQ+u4M5ONY3Mo
	 Uzi2d8bmao4mA3WvpxO2Ei34QzcdEAV4CGMARW/VfVP8A622QmeMYJgRcAo4DAgXmF
	 o7l9TiqPsA39A==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso14019341fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEAcmpnz2gewOPcjhrXDpekiBCHVy6y2fTgxFfa3pVNS6NtZ9nrjinUJLY70M1RQB1tXKEsNu3Oe/Qv4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOYauCQKtQmQxA1ikRSOe0XWTA71fwxZARzRJndkB4u2qc8LaD
	P2r5fM0p5oWZjNEBdqSeDRp/gfk99WbQTk/2yWQ0f4h9kM13kHCOlMaGiqaqhGFfPg0TLN0ybw9
	RCou5VvtsWo1IorUrVjI4W9/ac1Lgb3ziZnOSkU5kBw==
X-Received: by 2002:a2e:a9a5:0:b0:3ab:48e6:6789 with SMTP id
 38308e7fff4ca-3ac4414620dmr13295841fa.8.1792655908769; Thu, 22 Oct 2026
 00:58:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:58:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:58:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <179261435862.92690.4559755086697722828@pm.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com> <179261435862.92690.4559755086697722828@pm.me>
Date: Thu, 22 Oct 2026 00:58:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc1O-xSOt9RNTTF-ue_3skkNoQ4a0h7RovbCbQtexKkdA@mail.gmail.com>
X-Gm-Features: AclHuK-ddH3eyHdZmxCdnhGchR5nIcmlb3fM-yPWg22T-Acg-ykEAHgaJMn9PAk
Message-ID: <CAMRc=Mc1O-xSOt9RNTTF-ue_3skkNoQ4a0h7RovbCbQtexKkdA@mail.gmail.com>
Subject: Re: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
To: Birk Skyum <birk.skyum@pm.me>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 22:26:23 +0200, Birk Skyum <birk.skyum@pm.me> said:
> On Tue, 13 Oct 2026 11:57:39 +0200, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> The self-tests for this driver have been fixed. The crypto algorithms
>> are only registered if the user explicitly requests it with the provided
>> module parameter defaulting to false. There's no reason to further keep
>> it unbuildable with the BROKEN label.
>
> On X1E80100 the BROKEN label also costs deep sleep in suspend. With
> nothing bound to the crypto node, aggre2_noc and mc_virt never reach
> sync_state() ("sync_state() pending due to 1dfa000.crypto"), and on a
> Lenovo Yoga Slim 7x a deep suspend on 7.3 never counts aosd, cxsd or
> ddr in qcom_stats.
>
> I built qcrypto out of tree from 7.3 with 09 applied, which is what
> this patch makes possible in tree, and loaded it on 7.3 (with distro
> patches, none in QCE, the interconnect drivers or the driver core) and
> the crypto node as in mainline, with ALWAYS tags on its paths. It bound
> without registering any algorithms, went to runtime suspend with both
> crypto paths at 0, and both providers synced. The next deep suspend
> counted aosd, cxsd and ddr, with about 13.7 s in them during an 18 s
> suspend.
>

Thanks for testing!

> Herbert asked for the series to be split, and the resends since then
> don't carry 09 and this one. Both should come back as fixes, for 7.3.y
> as well.
>

Yes, I'm waiting for the fixes to be picked up before re-sending the remaining
two patches that depend on them.

Bart
