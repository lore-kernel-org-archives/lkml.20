Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182139;
	b=i+JGZfeC9XJuAtedf7YfNlkCaWCjXO3Zp1Uwm5P+3PVTiktWWUhZyaRUX1RVVdm1EEj2
	 ztdIaZ86a3hWxpcqceo2lyJIpXlJjyeC+XLHfV2kyNdIRi32cvz2Y8ILwp5v7kZcjvGGt
	 SlATwXJrWQ97aetC2LwP7HaYyp0ZNgl4hMnWPW5gZYWp9Fsjr+rmiW/9s6cwvDZG6zbMq
	 YXY/jba6WXDxiFNxdnRXX+OSBtl4v7kFtN8os9P1ekTWkRyGv8foFSU9uC8AsCFYszrmZ
	 V7tco/2KkwaRyb/D8sxgagxK9Vl+1rjxoY519NM2gFBUtgLBotaz5GIZI4k8lju3+JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182139;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Yte27HBiRkdFA3azARIYK+aMt5gtvslfN3WS8p7psZ8=;
	b=dL2YNnFU6nlZVXE7Tj0M+++VpHC+coNgA+hWQQmYcGN56ZuLywfwDTarDXLsuZ+iR8j+
	 Ms4GFEZzQ8BMPBm37L20FojSQO1rGWnauygqaCr3+ooavItGLhyF+Fhl9kBafMFtSjMzj
	 eNfnYT6LKsX1yE6KO3cn9NzUCH37iqk83+rYsaWgHTJ/q+6Jdln4tK6bJQ83YmgYYvuPk
	 z3gdQZCjN86BUiKyM1EEt7jheDJ/5JDA4E4uJrR/eSYOZHP9AWbN522lGLW/r4fuCCAQW
	 birwNdoBeafEF/3mES6bckb+4H4oSdI6B489+57v6KJ61v9AMep37JrMYM7DO7pWQJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRuYh8d2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC599606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRuYh8d2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDC01F01825
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793182138;
	bh=Yte27HBiRkdFA3azARIYK+aMt5gtvslfN3WS8p7psZ8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HRuYh8d2l2fAcPmnK5M+n/W6LWCtc+z9gb74LfJX9zkHupJo8qUeQt7Wr9h0//J9D
	 c2Ruv52j4vlvHNpBR3xl/vKbhl0hlZHZYxXCY+Y/yFfQ+eBr4DGakSHiNMK9f3fSfp
	 jCNlUbyyrMyrwKMif9rsfLGVjetaBm6m0CNAqsHxlRzC0VTf86DMYAoabno+JcZvrE
	 VOcy63tUKpVTcVOYQuIvc0JJeUBz5FbIcbBWkWKXvOKhk8Yo4DB0IoodkQDtlamAIS
	 l6eLYqb9CpUl7M5lG5CfYHKAKCKf42xHRjwUENEWSHm6pT6lwD+1WyFszR3kJdong3
	 IVD1QTROtiNvw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso15832851fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYrdC0W5J9cmOrPt88hipwQFXeF4XoEDgAsa36p13lNCw73W1F61GSJUeYrF4A1MkND6IPVuT92r97O20=@vger.kernel.org
X-Gm-Message-State: AFq9FYISdHXXY07+U7XsKAHZsUXXwyugMWeQ3KehwdvySYMqYSxheQ2D
	jXgYQTHNWwRv6rU777SovTB4SF5irt6MRejogFPXzdobcLIqQoqqwkpr6ibbyiSvMFj32ISwsQS
	ncqf6iHuKyTV6ivPNenIrvzyT2LgLeaosvZGTkN+5IQ==
X-Received: by 2002:a05:651c:211d:b0:3a8:7caa:cd4e with SMTP id
 38308e7fff4ca-3ac909156f3mr13186001fa.13.1793182137147; Wed, 28 Oct 2026
 03:08:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:08:55 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:08:55 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261027193615.1930624-1-valorcool@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027193615.1930624-1-valorcool@gmail.com>
Date: Wed, 28 Oct 2026 05:08:55 -0500
X-Gmail-Original-Message-ID: <CAMRc=Meo38pdx-kwdp7MpLLj5tmpPp+rzyR6B7DwUxD9m-1M+Q@mail.gmail.com>
X-Gm-Features: AclHuK8_q3eA62VLomRClgOM6Tt0o79Lb9MGtsx33mboJBo8uklE3gqL7pIwBew
Message-ID: <CAMRc=Meo38pdx-kwdp7MpLLj5tmpPp+rzyR6B7DwUxD9m-1M+Q@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix WCN3950 missing regulator release
To: Stanislavs Nilovs <valorcool@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, marcel@holtmann.org, 
	luiz.dentz@gmail.com, lumag@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 20:36:15 +0100, Stanislavs Nilovs
<valorcool@gmail.com> said:
> hci_qca driver is missing release of power regulators when module is
> powered off or serial device is removed. This issue is most noticeable
> during system shutdown, since the regulator core is firing a warning
> backtrace that regulator to be freed still has enable_count.
>
> The issue was found with the help of Claude Opus 5 (Anthropic), which
> was asked to review drivers/bluetooth/hci_qca.c for the appearing
> regulator warning backtrace during system shutdown. The fix itself was
> generated by the tool and reviewed by me by applying it, building the
> code and verifying issue is not reproduced anymore.
>
> Tested on real hardware, but not on Linux's master branch. Driver was
> backported to Linux 5.15 for internal testing and this is when the issue
> was noticed.
>
> Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
> Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
