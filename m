Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED2D35C6BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416209; cv=pass; b=lUIcrHm45OVwIE0qH4X+7IbVqXPbfC/8Gf9C+TUBcwqR6h+//FuiAefHhvjqb4KuzMOf+wnaIj2LY3rIYXnHhI1x/En1cpzxM6f6gzo5/SjgOtQ1SykUVnk6vsVLGW724zxMExsS3+05uQxsPem8ddGxDO6QFMhC9Sod+GKI2XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416209; c=relaxed/simple;
	bh=YW7ppVeoRLVQCLnGvfkZ3DPxaXrIg4n4TYyY9tNYUuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRrxfFrSlizar7jHSVSsvS+rjBI1AxEcL7iumSUkkueKHpeb7leTeylMmIR2OouscaHGMxLUNTa1mIES6kWRPFhZInV2WMhU4YBFAzAxm1Yy+6d9WVZMsb1bqz5xd7G+QDY0fpjJKRcPpHp3rjJ+ehpUOJVFPzr7a/++5T/5X1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSXDPnFz; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSXDPnFz"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677dbe051d4so4305561d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 16:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791416206; cv=none;
        d=google.com; s=arc-20260327;
        b=EyaA9y/UvDTSdoUv+dkDWDUXKaFS3qMcP/QipWEYOQx45IoigCGoOQVik3JZDCRaD8
         202Txck09QjXYM9mz41L55skqjOlpGsbjP7iwJ4b7LfN1t8Cjs9Ol7MnRvX/dqwlI9nf
         2HOdLoCL3utfNtUaCi8AQNcTibzZycKqbbiwQxg0CjNuGS2pYVo4YIBCE5gAbdGF2xqb
         PyMEgINj9lxXVEc4zDv32LMIEBLdUMJ1k7BqIPwEsaUIfxtYRssDRolFPYwda+z2byL+
         lm5oeLDJ30ya/QemAUSIdN9K80vyejjQA9GyPnpVX9ablsYiE8gb6msEO3GBjf8Jvpt1
         y1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YW7ppVeoRLVQCLnGvfkZ3DPxaXrIg4n4TYyY9tNYUuU=;
        fh=5DDb+QWEfoEoBoJ+af8lWYGsK9JtLPSrXvySvkEMHEo=;
        b=h/xn36pet2DCIgcRTUFr9q05oM+tee9HgQgMstWDX3uKY7/LGY9SuHdhx4ptUbkaoA
         CUxai5qGIv7JRFReROw0y9ONnDkmg5La9s133sxoaIMO13ldFF2LvJld2pIolpnwI22x
         +vK0UCwFDmogTKueYAFQXkZZW9ERVFa505Ly370YjcTuMI2DRqmDUoXEm/0nkhAmjnEr
         WN7JfMWA9WePND8bgfPUUG+suNR5fb5oaCUfcM0kEGkPleOsOierxpqyE2tHO2Gi5KUd
         OpBGr6s7/Jq78OhlBBb+XdFIJZDhg1Ojhgn3x9k86tn72HKcQcLW+LyUtvTdVcMAOoio
         8GxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791416206; x=1792021006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YW7ppVeoRLVQCLnGvfkZ3DPxaXrIg4n4TYyY9tNYUuU=;
        b=qSXDPnFzOgu1X/v4N/tt4GN26skSKHLDR0E0tu7JR5k8wGhuC8zYDK2vhdNvk88i1A
         I+Xyx6+Dh+AhvMnUF7ulNkD3qLEfXCV1xPEmVAkRRBrHsAdn9fecAo+HoGop13Yr1mwJ
         wHHO7dqerVtI8ScFlq4mhdTKxthUvVYEVk0zHQz9beaEkWuB0T5h59+7b3xmkFanfK02
         4N9iGuNMwiXgTs2lG8t7AOe6muH9E9eLWRr5hzPDCdb9qx/OnV/tgiBzWweGmUuiSObK
         +GoXxtqqdIXOYahnOCJlS7vENi204Ob+SsyBFzoZoRMPQbeLf8AH9XZSjgPWK6s1yuf5
         ARdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791416206; x=1792021006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YW7ppVeoRLVQCLnGvfkZ3DPxaXrIg4n4TYyY9tNYUuU=;
        b=j6YTWEm3qc87p2kDUeqJ09hKURMguJhaIZa5rLC8EKraKY8mPCky/jKiar0Jv0gppW
         +NO7XE+rNWMbxf/FiC0gnBqvxwJyAHHKYJdLbh7G5ulKlVKKZMhttUOF7Vs8Ard4QvIW
         LYIv0yiD+Rd9+pxw/sauOhzeKHwRGv8BPpzhzA6OsowYhJpdQHr7acdv1Acln8LrrBzC
         LipzW1eMn28aO6QoyciVcxmG6khtvXvSS/OzGVKwCX6cZPz1hDgTi9V6eRd0FEttV7US
         vYzSkH7hMA2PBun6nqcsXY1VL/TomTlJhIEDa2J5eqvJ4ckdwzMqiBFyeVWpR1aq7cI1
         p6GA==
X-Gm-Message-State: AFq9FYLojON5Z0CvIXHouVFWcFeOLAIqiUXYgJJ1z4TT0e0rKdz370LF
	xd7f1JrS4NnsgQAHUPKp91iPDCHZj+QxRUNCN190wwv4mzJGRkywu+9k3Cuxp7tHAJc7rubDK2n
	DK2OmHkHVQtSv1Mge3LIxUgPjG8vfJpY=
X-Gm-Gg: AYBFou245YJ3y8PH5NIRjNTWKj7szfVJ+uDaOuU39w9cx01cDDAClechfyNt6tm0AJw
	tcDuKn8CR7pmFx0iua/0Ygk3YWRudbUC6oNQH8Y7cFL/VljRxSQqguBiiK4ox5zeuqvGQOir7Ts
	utRmcsCVkq3sFgSK7I7mnRMkJI96DItorpfyRa6zNc3gtc0Gmgeyb3/GyPTtmOcjzOuDF1p1p9i
	75NOji5dBQQQK/PEdQASY85lGhRTzQhteuyTG1g9jUx9oydcd1vEpkugObSxu91dxsqqtJQ58TA
	0KacKR/u9pC2E1xZbBd8hsT4mzKQQcqJq+VqF7D4zM/bSzj3MpqE9zj95JNktCaeRZJ0pk1Tnug
	x0Kl3AGgjRCFRKhxNRwD6ElbEgQYg1R5wR8cO46ZX58pWKycvr5Z4ACbZALRutYWGVdUw9qdgg1
	s=
X-Received: by 2002:a05:690e:4853:b0:677:c24d:ebfa with SMTP id
 956f58d0204a3-6790a3eaa26mr994855d50.58.1791416206358; Wed, 07 Oct 2026
 16:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0a012b4923e189c4c593ef4f471e5ff0edbe9030.1791412497.git.mst@redhat.com>
In-Reply-To: <0a012b4923e189c4c593ef4f471e5ff0edbe9030.1791412497.git.mst@redhat.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 7 Oct 2026 19:36:09 -0400
X-Gm-Features: AclHuK9jyyf5sYugVmTQQFcLaa4pyEtdizNnLZGPpZtB9PsCE0-Mfu-D4Td6hn0
Message-ID: <CAF=yD-L_sv90qxUxEh6HRrz3mHMRP=WK3smkMMYScLAnJbgTpA@mail.gmail.com>
Subject: Re: [PATCH net] ipv4: validate checksum_start before completing checksum
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	Phil Sutter <phil@nwl.cc>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, bridge@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 6:42=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> If a packet with bad checksum metadata gets into the ipv4 stack,
> skb_checksum_help can corrupt the network header and cause a bunch of
> mischief.
>
> This was discovered and reported by Paulos, and has been reporoduced

(minor) typo: reproduced

> by others independently since.
>
> We really shouldn't allow such packets in, but as a defence
> in depth measure, let's also check before we complete the checksum.
>
> A more complete validation at input is forthcoming, but needs more work.
>
> Assisted-by: LLM
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> Fixes: bfd5f4a3d605 ("packet: Add GSO/csum offload support.")
> Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> Closes: https://lore.kernel.org/netdev/20260922030310.8684-2-habte.yibelo=
@gmail.com/
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Cc: stable@vger.kernel.org

Reviewed-by: Willem de Bruijn <willemb@google.com>

One point about sending as a single patch touching five separate
modules: nf_br_ip_fragment was only introduced in Linux 5.3.
Such a block is probably easily dropped from a stable backport.
A single patch is likely still preferable over splitting into two
(core + optional) or even five (one per module) patches.

> ---
>
> Lightly tested.

Tested by me as well and found to block the known bad input.

Touching five modules is not ideal, but could not find any other
approach that would be preferable: low risk of unintended
consequences, out of the hot path, and relatively concise.
