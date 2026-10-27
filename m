Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083329;
	b=vl2Hgwcr1msRpxLjQ2AVIpqbaE0J1xUKHHhcHtEgxoxqSpM3evUROTWpMeBevmwz4SzK
	 3HM0xaZOOLu3SXN9QLpUdrrxKBQl392l8Ef6V+QVTOvvP1+MujGyxICfwUs9ak0ZX3+CA
	 C3uh+3ICZMWWK5zf6wqDVtoEqmTtyeznnMqeHfgYjb4YRDAKxHWsGgGE4/eH9Seg4F2rn
	 mw5BbIw6DrMu/PKWwByLYdm4RBsCsCW+wFgwP+nttpoEu7f/F5zntzYfqBr0tavRau5/L
	 bIViNynmSPrAKhnSuB7OPlV8NrmQ+094mk0gxeHc32Tc3tb6JXcbvJw+zWkM2CMjffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083329;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yhV6Qi8oP3wsBHx8AcQx+K7PgSHJp9dJD4R1lrCW+YM=;
	b=gpv5kZsUd2b4oTLygsmrJfXcZvoStzLIWCbksg+ZHTxdR9N3U3SdYq6xIlLnzfmfLcPP
	 SMSlyD0M9v/aR9Rg1ltQc50IYjjzA4LCmU+JVZ3L8lohLEbkHZyNIOvg7eDCiO72y+wXh
	 qMb0GYORVjOBXndOFoD/kPdaBH542lwlDuqkEo+PDU8WAozVhiszq+NBIzpxJnKGSWgRW
	 Bn4yBxdegq5nAf/YpWCfoBWuqceW1Oa7DhCIgVB+Jr2MDInsbNeJ4ixnhdu+K/Tuz/vPn
	 yjRO8Ol2TYmoROccyfSSjoyzNd1L5FainQ6yrxHepFDtU85yARZ2RPM9vnGnbGZVv2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNplFQEp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB03606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNplFQEp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF41F031E1
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793083327;
	bh=yhV6Qi8oP3wsBHx8AcQx+K7PgSHJp9dJD4R1lrCW+YM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MNplFQEptICEhgYJEua7ll4vbpkZ3U4mW5gzoB9k9tFiKtGPh1NUtHH2yKlqtqje6
	 4CnEPm810ZP/xLDxZChQFFgEJk9TNsENn9fiq1yStPJcuTzBRMbVv02wuqRBwVbnBV
	 HiQVkd8JF4JH9pigNWgf8Pw4QjW6+S1crroRxGUuHxY7LXqkK2LJY/vsSTgnG7U7BY
	 KP+qDId99WGr3qW7C+BVHAD6hVzZ9BGYu/naGz1QCmLr2P2QY47yeVMvw6JN7ENQWK
	 VZEvJl/PJE9HewuNCjAjnWdES2f0IOHTpcPoxcU3qjIxqgDIMIthmtfZAFk3eDoyKN
	 4zvTgKXDoktrg==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-70b875f6f13so2193863eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:42:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvdAfPKcVs4CZQDoDqTZGymker3pYO7odG082Pr8hkmZG1bq8JQOv+dsJEkUrEAKOHkC4bZ/Jvtm01HTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYISkmSvgj7ayZ0wNyELWooZdXkiZiQdrImbB4Ac9MnZCLCQQvvu
	wFsOYmLJokKYY66f15oIjRxy2n1OTuoXiSsIgDoaSndVWwOfDT45fW6vyCHAOTwBWBSbU4v3X/J
	RuYGzRRMYc39GC569M55cQ/BcHq71T48=
X-Received: by 2002:a05:6820:616:b0:70b:a4a8:a32d with SMTP id
 006d021491bc7-70ba4a8b55amr4429661eaf.30.1793083326837; Mon, 26 Oct 2026
 23:42:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026091549.605810-1-p@1g4.org>
In-Reply-To: <20261026091549.605810-1-p@1g4.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 07:41:55 +0100
X-Gmail-Original-Message-ID: <CAL4WiirG9+kP8vTNgSC=NfWA7eqnoDHZ6UMJ4bBEYOF7oNg4NQ@mail.gmail.com>
X-Gm-Features: AclHuK-_ZepuWsPA_tB9v5pjt92BBzYdY9sMEaBbm3_-uA4NkNald1VGOO5yyE8
Message-ID: <CAL4WiirG9+kP8vTNgSC=NfWA7eqnoDHZ6UMJ4bBEYOF7oNg4NQ@mail.gmail.com>
Subject: Re: [PATCH net 1/3] igc: pad preemptible packets before reserving TX timestamps
To: Paul Moses <p@1g4.org>
Cc: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, aleksandr.loktionov@intel.com, 
	chwee.lin.choong@intel.com, faizal.abdul.rahim@linux.intel.com, 
	horms@kernel.org, vinicius.gomes@intel.com, sasha.neftin@intel.com, 
	matthew.vick@intel.com, aduyck@mirantis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 26 oct. 2026 =C3=A0 10:16, Paul Moses <p@1g4.org> a =C3=A9crit :
>
> Preemptible queues require software padding so hardware includes the
> padding bytes in the mCRC. Padding currently runs after TX timestamp
> reservation takes an extra skb reference. If padding needs to expand
> the skb, pskb_expand_head() rejects the shared skb.
>
> Commit c7d8bc3dd511 ("net: skbuff: don't BUG() on bad arguments to
> pskb_expand_head()") replaced the BUG_ON() with -EINVAL, exposing the
> padding error path. skb_padto() drops one reference on failure, and
> out_drop drops another. This can free the skb while the pending TX
> timestamp still holds its pointer.
>
> Move padding before TX timestamp reservation and use __skb_put_padto()
> with free_on_error set to false so out_drop handles the skb release.
> Preserve the VLAN flags in first->tx_flags when adding timestamp flags.
>
> Fixes: 17643482e9ff ("igc: add preemptible queue support in taprio")
> Signed-off-by: Paul Moses <p@1g4.org>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
