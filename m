Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4849A3DB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586133; cv=pass; b=Vs34RZJ1UdaDo/fWy9ZGB4ofF33W1a8J3C5eCr0tIf7s/Ay0e6Zrz+dO6oLET3LUncA4GRmuXrPwtOPYrhc5bsWsIpxIkZn9ChdYKSHABXC5TAKT/RiDfXNubBRQbkg8NyjP+Bx6lGpJlVehq+ou4EFn86UvO2RM0HJ7rv/5dps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586133; c=relaxed/simple;
	bh=mKCoBmaoyzZyAhd96m8LwCd2lzIqte0Ik0lBIblZ+c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aeb3/jhu7VV2FsPmPQM1o0DNfJZjlRhmC/I8YpbjoJ2qAvTuE6X1kDKRI5n1BQ37XWegHUK3v1tFYmd9T5Mw8qKw30n8tTfxSeX0x/3YM/zShUlT1ec3g46DSGjQEqc4HTOcqbHqUol2wkh4K0NF0zEAZ6LgHkdmpZnpHoPzFzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iQcl1ePy; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iQcl1ePy"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so19181cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789586094; cv=none;
        d=google.com; s=arc-20260327;
        b=SKbB0Uwaz0K3J3I1rx8sVD3gCIsJd4RVlX6xD/YqHaX01eoT4/q0FgQ0T/k14pqWpn
         8VBIkCEv/IpJhG6j2pfjyRIGoRhreys8FMdzdefVqIfPdtwiJ0piDuMNtcUeBTougQ5o
         QrPV4WBJmukn7e4Hjz7H40WLneeSBsxmtLX2oCVMH0KXozc2s8aNL49KYFzNrv8yEGl9
         vACVSte7SpnRPAv5pRxqWrscYXJObZv6uXTOXItTNaQQsMnbBhPng2kEvBdQNtSlj1Cl
         fUwmmwoFmqeNag6kzM1p5gE7czFq47ZZsxZ6HbAF3rjgi+wPZcea+x9ZFT9r0vMPOn5k
         Emig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VLpUo77KwulcnAoN8HxD+dNrDd0JmlxE9cVchuUaZ5k=;
        fh=rsS8E3xgE0qbc47yIH20xXh6EzXKVHm+FO9P8HjUNb0=;
        b=KtwcS/3T9h56aYNrp0gB+fyY6jZsnlkR6TeWok9S1+gxIBqbozLh56FR8N+h0wlye8
         nQyNHSpAYa0vbMItz8uXDK/8D5X1Uvr7/hLltF4RlRGgtzLrk7qRU2oD8PWhjwmDtetX
         laJQs+TkZOk6UBG9c5zdrLIXL3apVIpFQKfdk5qfdpP9Oonl9tbueKgqXY+kHAc/a1d3
         Va6wimtmI1LP1rdNYmYIIvu3BG5cmPXUvFwPMXmkXleI66ntu6Yx9E3aun5Pm+VpWM1s
         h/7fFx9XV/cpSjwqoJvEYBUxSVqq6YO4gJJZTAprBQz2fK8tlcuO6WcN+IGgb38mfaaE
         Jp7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789586094; x=1790190894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLpUo77KwulcnAoN8HxD+dNrDd0JmlxE9cVchuUaZ5k=;
        b=iQcl1ePy7JbJRlGGD7u/iFCwyPd9ugCbdNS5eNqc/IL2NaXL+Nm//eifo3YY1fkQiV
         tuTlW7VAAvi8gHrpxW+iKFzoLUGyKsZ5jvAEIRy5oLFuzS3TT1kWbr+moGIg2xJ8kQHp
         ILCzXvjd3eRxL89HTqIgaEaejjRmYyekoKJwTuIvyij/fed/I3d5nh3QrwSJL7nt8lgv
         mtSL5Fom9TP/CJDBriqjMBwdbJVhKauLnnghhM4TSlZKPaA9sXh5rqLQTh8b15VevCuB
         Tkgf9t4fwqhn5Azjf9fIx1iZMPX8sy+Zj0+suqJFWNg4R8DVfrgZ2rq+NNFKFhuZ1Iiv
         WxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586094; x=1790190894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLpUo77KwulcnAoN8HxD+dNrDd0JmlxE9cVchuUaZ5k=;
        b=Sk+LIGPJMjwzuXm5hS3mn8/p6VBdWj7hXIozOIKmwoH3UlEmcZXbuISEJj9/TmKmuL
         WGglGjGrdGVKz4Tt1wHY1aM/k6pcDctP1plyxRcWNvlOrHG3TQg3pP46fBCbhIRNfYTx
         YauCyo2Q6UP9eNEpAtGYex6r6r4NfacV6WDD6CrhUBi+VbNyMWBlwB+NdP9wGifj5vF0
         dFe+bP7ms8FGSoMf+iV0gn2h/m9R3eblPiTjA/8b4Xn1SowMPRZqT62ZowtjXEQ5C4UJ
         tDe6/PfdKcGc6pWQSXeYWEeoot3LiCBTFU3Pj/HfkRXB5ffCWfBRjhr6oaDqb7JGPHDY
         /WCg==
X-Forwarded-Encrypted: i=1; AKwUvBxYFKNFgNQm+HaAYrnP8kbDX5M92AMjDqxwZCK7wIPZJOBV/Ku2xDd/wWUAtlQ3FqbhzeV6uLg7aJWWx0M=@vger.kernel.org
X-Gm-Message-State: AFuF++lyJLw4jQ1Ak1BqLb3hd2kMD8IIcln7AjksoBTxbTHmT1i7QH97
	Y+o73rLcRXGShn4qtX+meYNi5bkN1JtkLi5ogFbJPUYbFjDzKUmHeiiqJSXK2hLavvOOEmDDMT0
	QKa+N1GWGsqYR8qUfgYBvmKQosbuHGnuoYNsZVpnr
X-Gm-Gg: AYBFou3lhx8UQajmvD6Cy9B3cQU3szGwegERYx+qqOlq2zhP8J5ugLpDU/O+geeVmv4
	W6GKdt0H88AoSop/oQ1hB6IsVavWa4mnkOVJxzi/sK41W0HSHCVrKO58O50o/WvUax5VHQKkBHw
	MV1Pkz7GLJchFvnfqD8oqH/tBfR910We7OfCMBAS9mo01KcT8iy2ZAPnCQmDnz8hqWlKliJ7c4y
	5FRPI9bWjV0TLcmpKO/WWnDf0aZn2Ix9ISTZe/FQykRVRK+kEt46ZOciQQfANScCtWbvw5iTNwF
	+KjDbaRL4DWPGi8OSVMMtM/ZUt1fcyelHyB7Sh1Fn4TpohwxFmhRkFqnvMSG1yx2bJQzqkY6B5E
	RCXRR5RLoHLhFjl0mxe5X
X-Received: by 2002:a05:622a:22a8:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-5328dc6246cmr2795101cf.12.1789586093491; Wed, 16 Sep 2026
 12:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916065830.1619425-1-arnd@kernel.org>
In-Reply-To: <20260916065830.1619425-1-arnd@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 16 Sep 2026 12:14:41 -0700
X-Gm-Features: AcwNN1UjGdAjkF61zjU98Q6IjH7rvmM2aSLXdz3MUZJlHR2CYIuteVnbwcOHyfA
Message-ID: <CAJuCfpH0wrvnZin9RN18y=AfRFXQQmCKqDiPkhe--iFr+D2FdQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] alloc_tag: avoid implicit padding in uapi
To: Arnd Bergmann <arnd@kernel.org>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Hao Ge <hao.ge@linux.dev>, Arnd Bergmann <arnd@arndb.de>, SJ Park <sj@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:58=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The implied padding causes a harmless warning when testing the uapi
> headers with -Wpadded that could in theory indicate incompatibilities
> or data leaks:
>
> ./usr/include/linux/alloc_tag.h:41:1: error: padding struct size to align=
ment boundary with 7 bytes [-Werror=3Dpadded]
>
> The code here is fine, but it's better to make the padding explicit
> and avoid the warning here.
>
> Acked-by: SJ Park <sj@kernel.org>
> Acked-by: Hao Ge <hao.ge@linux.dev>
> Fixes: 1d581ab2348c ("alloc_tag: add ioctl to /proc/allocinfo")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
> v2; fix changelog typos
> ---
>  include/uapi/linux/alloc_tag.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index e3ad94444864..7d4618bea043 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -38,6 +38,7 @@ struct allocinfo_counter {
>         __u64 bytes;
>         __u64 calls;
>         __u8 accurate;
> +       __u8 pad[7];
>  } __attribute__((aligned(8)));
>
>  struct allocinfo_tag_data {
> --
> 2.53.0
>
