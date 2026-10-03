Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD223B5835
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791052782; cv=none; b=eLkjP5LbkL+f9wuTqJhm3MosQPLMkdTfvEz+Edoj6SmrmNMTuxinnSQE6JHnYpnLXfhoZRgAX4OKhV0JQ6XUGgEjd12c3O0/+i2PiGWvbVJbqd7OeqiNm9c2qFXNwkJzv8HZtMNhDw5WGs1nActhbTnUJfP6I9ldIDCYLYN50UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791052782; c=relaxed/simple;
	bh=056kRNqLTrWVRBCgOEu8imgvJ36Z9qNZEx/TfU7hb+s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ABE1hewDGF1McWpM9jLZ1Mxc65N+JZhhueWeItJGHTdr/yl0eDlETBO8onVKFZDK1EfPaK2U/R7l6gCiTX3m185jB/SsaK71E5b9+A2rgYERoBEAngVS/I3nUxNgtwJ+o7pTDMiw/ULIaQ6SlAPzz4t+J34kQsie3DO3yrtbS8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6FrHKAN; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6FrHKAN"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8871ada1a26so3796487b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 11:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791052780; x=1791657580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XBMG0D3b1PTVJxlXUwjY0aIBghz+3035Rg7em3GyBks=;
        b=Q6FrHKANCPNEevD4N8aQRTLN+opd/FYLsU7w9eO0rP3w6T3ztAIDfjV7M5KU+tU/5A
         gm15InuLpoaq7EUhzZ3bEf/D0OmihEFCYm9ObHCebj1IEpLiQvcWYqdSLp+GuX7TUewh
         f/IUM4aq9MIHxKOvpQOl7x+jmCWcLbg19sYr1P7XlA4x620+5toCFo3M6vU+qFGqH6C9
         NgSPXa/naccWc02UpJ0LI/R7LIMuMW+97lfFtDLEurK53NqJUzXQjr35HnCW8DhxXg3j
         jK3aL6xRT0jfbyrFxdTUc5I+RQWPPDeElGukZ9u0875DawYyENCWRpY4ogpHslg95LT/
         73ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791052780; x=1791657580;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBMG0D3b1PTVJxlXUwjY0aIBghz+3035Rg7em3GyBks=;
        b=0sp+lQrcPGEbRLySOULfKNjBcJzdlCBR2q/RENc331/cRkX9QvkYKFTN6nMZstXO21
         l6Y2RLzsLjF8GlYPJnLbkJo/o4VDXLzNMpprjz2rMwPtjDs8D4ahv0OR/RHQOmSgLhik
         SUqubKrX4yzEPhyiZ++31Mzm8WNaKZYVX6znCoYly3eNfYmMB79eWv6FrixutpWzcfDJ
         cjPhjPYYeFK4Jz6eVZEzBTfj74liZ10RVeUlWrY57Z37wEsnfcSbz2Nhh04Es4WESVUM
         Sag0lyM8pj91JrP7UG3B0trU4X2N6ZMelMDb3htyZCM9hc7T6H8629tAZholbDol0vrt
         QSNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwccxdOsyCgsGCpYJ1IUrQlWsIDOoWTXBesJQfIW69jzZpJkpDj9svk+Dz42pDoTd1kzxPv4xFneULi2+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc0tge3qVBmDwahHsErp1u0WhpoiUjKtRT9xmi0mal+uwodi1l
	FS7uRca3kjQm7MFPViaJIZYLfDhtjTnt9VrIiNBilCr8dDKii4vaga7U
X-Gm-Gg: AYBFou2lLQhvvhDN7hQWM0Rhl9dgbJizVUWw690PUlNkPmLPFfMxn5SbpAi/8yKdhr8
	lYZPL8BEitDRzxhqHE14zhcPLNQIsrKdyH/GDWLYkCE6kJ1pxj6FxQ0Kh1DazfaswohBYnDrhkV
	xuKuIfwDGjqmSj1pW3wJBptWLOvrYxfBFrfmowicM20S8SNoaOD5HEA9PBBcnvigo2e1My5CG83
	Mu0LHbvGmvXEzqyXdC+HID8vWhwBvhbtcaUsBfhsHcc+NYNiCfEREC96wrLLI9tNMv0Z3P963q7
	FaErbxrIMem9RxGAH4LOy3unfquiF72+rPxE+jjGnDwwpf70WT3NKkMtaGcYKyu4MmC2Q4LYWEM
	yPVhHrL+9vTVFrx5K56x2gif1lOIrd140AGnYAxBruMjS9i6ILRnVXBg0RTvnpbXL5kVc4zvNnY
	dt3yFePEvAyXSc+x+mvUjhEroFQGqMx6mH0tHIZQ9ZpgUpVxi4+qeGeUs27XwwcNU7Cp10fiHKF
	fLe8rDn9juKk1IuuQx4Qpr3RQPPMwDDMTMMDCE+SB2uumbqswLSYQ==
X-Received: by 2002:a05:690c:308a:b0:873:5bb2:6c35 with SMTP id 00721157ae682-8ae94ef9db3mr10300027b3.60.1791052779968;
        Sat, 03 Oct 2026 11:39:39 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae321fa64esm21978917b3.12.2026.10.03.11.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 11:39:39 -0700 (PDT)
Date: Sat, 03 Oct 2026 14:39:38 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2d8f815dbad43@gmail.com>
In-Reply-To: <20261003132340.4175269-1-littlesmilingcloud@gmail.com>
References: <20261003132340.4175269-1-littlesmilingcloud@gmail.com>
Subject: Re: [PATCH net-next v2] tun: use pskb_may_pull_reason() and remove
 SKB_DROP_REASON_HDR_TRUNC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Anton Danilov wrote:
> tun_get_user() is the only user of SKB_DROP_REASON_HDR_TRUNC. It sets
> it when pskb_may_pull() fails to pull the Ethernet header of a frame
> written to a TAP device.
> 
> pskb_may_pull_reason() reports why the pull failed: PKT_TOO_SMALL if
> the packet is shorter than requested, NOMEM if pulling the data into
> the linear area fails. Use it for both header pulls in tun_get_user(),
> on TAP and on TUN devices, and remove the now unused
> SKB_DROP_REASON_HDR_TRUNC. The pull of the IP version byte on a TUN
> device with IFF_NO_PI was reported as NOT_SPECIFIED and now reports
> PKT_TOO_SMALL, for example when only the virtio-net header is written.
> 
> After a successful pull drop_reason is SKB_NOT_DROPPED_YET. The later
> error paths without a reason of their own, the unknown IP version on
> TUN and the path that finds the queue detached, relied on the
> SKB_DROP_REASON_NOT_SPECIFIED initializer. Fall back to
> SKB_DROP_REASON_NOT_SPECIFIED at the free_skb label, as vxlan_rcv()
> does, so that these paths, and any later one without a reason of its
> own, keep reporting it.
> 
> The errors returned to user space do not change.
> 
> Suggested-by: Ido Schimmel <idosch@nvidia.com>
> Link: https://lore.kernel.org/netdev/20260923145931.GA2859441@shredder/
> Assisted-by: LLM
> Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
