Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794655175;
	b=dM34lq/JDUPiFBmBNMbpRcFmNX4UM5KuqAJuYoTT9aDvl6EUX1g8BeC1XOksIDUPjFlI
	 Xqura8LjTOcW0ohIu9T2cHF4b8o71dMHUaLx4RGkcQomf70wu4kwzqqQTrdsHOpVAN4o4
	 AoMuNId4/gBgM1FDiCjS/FDQs6HgissDowdSeURmiPiN8TW5gh/u2QIua+KiHCk9/w5Dd
	 6E1p0G+AtqHgnkl3KYI3wxr/tOFytuBMCA9FV2YJPE3XMTQZ7p9X9bosJGACKpxPzfEx3
	 ZQCNIYKdQ+ho/3xXf3zi6R5UeP8shSdSmAFycYns2l4fjGL6UcL52DU68R063WYDWdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
	b=lv5xPibYQPLHzEfrykXk++MvyZg076iuo71VAQQVyRgw+gtcvEirvO4Yr/gzOEB0kFmD
	 a4ICoR0XeLqHMsxi4TkbLNXmqpOz5fpKO2TPYqCCXCgHH78+cKLA+AUX18GX1oLt6FB83
	 UFsyYjTjaSoAzATMtmIGyKUxfIR5/nW5PBgGF+DPZSFpnqVy9Pw95k/7fi2uJajN24Po2
	 E5fZL6QxsxH6q3EOugxgoo+/NCn4kcCeWrgvtzKIqCM2ypiKncCPni+QbfUT0G8EtHfZC
	 WvXQehnXSAxvHVkDNdnfN+eGXRC0TAlB9jIsWYD2G4SxyD7b8YFHh+u03F5W59rZp8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDyqq8w+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E4606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25E4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDyqq8w+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e90071735so300299eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794655174; cv=none;
        d=google.com; s=arc-20260327;
        b=lMCsscJ70kiqxai0w80H7Zd/U9n31pM4atE6lib8l2O39qRIzqG98DQYVSoPbntczn
         /aF0x0tDjpet2IWlp5cuOVpx2vd1cfv24JvftlLCtS8YTq+Ajitwhd/d77m/Xi0grx8d
         OomrhwelIas2k74NhdwmsRSQVR3a5hoS5L6CdopbJjtb1t3r9pCT3t3ytghFFOACC/uk
         0+eVQ11r+kSGyQMESUaw/ZniDiCH6cJ7GaFeri7ZVMf2ZCWsbCbZvxThAvhH51p1aDq/
         hkT0LW9Jq8tflGoR9Xc5V7DEynn9P7cLKw2GQk+l8iPvvOZ705g/72r3YJYyQ0rxWFS2
         k3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
        fh=zqNuqENio/r6Ghy7L9RqIUnamhzAsehsAY5w0KWsU+s=;
        b=GFVjbM04Tv7jXgoyPCWRWrwcFoqQ/AGznQxwKxeK1xfuXmX0ZLGC/Ay4WKGTs9rCvD
         ug235fTZN33kTpXsprMvcJvLAgKpftdizxVj4baTnOEV74wB2QE46dorhiRFoqqa0L+Y
         CkgFw4GbfGrgzXX2NkJ7oFC7IiFbZalsmNC/k1pmmJ6bkbU8sb3wx5lKFLxAI6QQEwPn
         WNhG7p4vre2u8sbtLabjziW+gFALTiF82e2DqSC/e+KzTRxFFGp9rV/VkPdSkTtyYdQ9
         1qu3LHAU7KFc2oM6/UVTpm+iw4EUlVjHzws8MR73aeNztvK+vY6Uo480HLgFaAaQxpBd
         qiJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794655174; x=1795259974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
        b=YDyqq8w+qGAgC+SMwmW6ynm9wNLeSfpV8KZTdvS+BZyswTje9buIfCYxflNvLpQD2A
         aquMfZAcuQv7mfikovnbWwLUFAQR6ndmyTgYCBgoj5oOQwYyYX2S+Lw2K8wMH8sapVtu
         Ql5rgCIFVATueyG32bUPo0IQyQHViw9F2kcWa8R5APVHc3HjGPBAcx5ASgsDPoB8l1n3
         ax1acDazxb7WO1QZEGHf90B6a90oQVVtsyJ3nbhQt3meWlX+OyAvRtsnbUmWtq+cNsSI
         LhZjlzJdZUFD+h/H75c2H6Ynzjqk3G0AF8xm4xLPiipTWF2C8CYK5bwkWL+0w/d9p+6m
         9tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655174; x=1795259974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
        b=faNNQENAzBfOSx6nTOwwlhbHqEh7sd4SvyngRfWewkpPBNNH4z8t2SHSw9dSGE1w+k
         vI5HU01O406bo7pPW2hZxxlREwc1pyyqN2SXomP9trckrS2PBnC9Z1hhQ854OB8Gb1LZ
         5dii1fvhrjstPpbCD+MPNhW5P/kqBM/keDhB+UIfcWG1hUXuparbI4kjW/4kGWR/FTvI
         VIhQzEJvF2+qu9p/zrZCLQDAJVaQ2rXlqvWj1MuRN6FVpcDT32LuXyi5FWElXUAm36OA
         sm0+f72x7VppNkEUWDgzeFU75sEmdjZOhCW1gDb4xCtIW4yYHIRW30rBlZ2MgEQERRE8
         64Fw==
X-Forwarded-Encrypted: i=1; AL+hErFvcNQ1Q9SAdKOFLtPl5FlgS8igMB2NDyOUufKC6bzYD5mXl0jhJzjIivCENoBVrbBmZQ9BU5X0o9p7cFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mbuGjH6+Li2xq82rB9vte1kPMz9NZuy48zlP2yInZECqYKrD2
	CnGsGzqn4UoH+Eor49scTijGWUUzcX9dTkhdSlUfNmfBByiEc4Sz5IKa3QMIae2DTrCxW+s6IS9
	ugeqRyMNpqESIkVS22SXt52zdYebvkWc=
X-Gm-Gg: AYBFou1RrkDTwTvurG4x/Bdd+9iBiM6dYPRToYAhcw+wD3+iAgqyveupmq1eSGr/D43
	/QAxuyxrA7dFeqodqJYtQpnkRNRUhlyaQSDP/VjVGCurLm/uFbAdwJLtq2EzfgY3r/AvkmL8Ome
	1Bq4+aMZc/g28klF9MLJCdyv8mhPMmw0wixaG1s29X6BYTI2Sav++n9VHp6FwnYfB5ERIrgxCCC
	yQ6spZ0NgtKsNQRxp8uz1jyYVdC4V62b6ZEfEp2vU1i9injYOlkCX67+apHKuc2RHFQ5Yq2OKmP
	wK7RUANJmmI//O2cwKK2lZQLo4y7SPCxSPE4aGjHgS8fGI6b5SxXL2zgREG8XNI2sZ7FHjR8dVD
	mAkCoWzElHjAuzYHY8IeqQo+RumlY0ZfpxBS1BAemE8hx6nfnHd8X3Wi/WazrRUdZ34FVF1fHBL
	ntL3SyAEvbKI5+G8KFT7n0Usq3I+eoew12kXmWGExUMDAMa2Sx77yAwcWaLA02RoXFpN1OqE5G5
	EnifmL6lEe2QiPnQVwAspljC0kv15X+atP+QJLQp/1CAwP73A8eoTckn95KxR42BFP86WmvB0ti
	w38K3c7qoFIRtxYIqA==
X-Received: by 2002:a05:7301:a0a:b0:375:f846:5b3f with SMTP id
 5a478bee46e88-3796057e734mr6645905eec.0.1794655174058; Sat, 14 Nov 2026
 03:19:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114024515.1000882-1-marawanzein222@gmail.com> <CANiq72ntx7OypsqD3QmeMiYOJpqRBgzDJv17grZQA-M5J_r8mA@mail.gmail.com>
In-Reply-To: <CANiq72ntx7OypsqD3QmeMiYOJpqRBgzDJv17grZQA-M5J_r8mA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Nov 2026 12:19:19 +0100
X-Gm-Features: AclHuK_0MvsnItj1pJwqNHFtVxjXYjavsbTC3ITqF5Wwivku2HdK4fwZxJBltrk
Message-ID: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: fix lifetime of copy_from_iter_raw
To: Marwan Mohamed Zein <marawanzein222@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, work@onurozkan.dev, 
	spidermana <xuyiwen14@gmail.com>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 12:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks for the patch!
>
> On top of what Alexandre said, for fixes, please try to find which
> commit introduced the issue and then add a Fixes tag to it. Then,
> please consider if it is something that may need to be backported:
>
>   https://docs.kernel.org/process/submitting-patches.html#describe-your-c=
hanges
>   https://docs.kernel.org/process/stable-kernel-rules.html
>
> So we would have written:
>
> Cc: stable@vger.kernel.org
> Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURC=
E")

By the way, Tamir's email address in the Cc list has a typo --
correcting it here in case it helps.

Cheers,
Miguel
