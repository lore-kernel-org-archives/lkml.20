Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083413;
	b=hOmpYCf/O7xFHJSy5VelOrRvd4OhDztHZGgH8zJX7AzS325pLenvyb+HqfifTmIc03Ei
	 3JOcSQaPOknPvhyuLtWJqf8k8+LCl3iZgPj+N09LlMACsjAoDq8wty4vMU7gNGHZdZYUw
	 JK0OjWo8EEIg/4rNw0NoGXC8WhqAjYKY01jNqylS5EyB/JtGqwO0l/52YK6jvIQKLvydy
	 kGN1kUucvR4LPjP71e7m7icqzj0403h1mvngXQYOweVUGkQhk0cz+nHXiBvzETsKorKhO
	 fiGs6mazMEZgjAn+pmd2HUxEJFmx+TLKrfTTwzWDmo+KdNKPjzq8DbQAZQCtThje5Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083413;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1rV7sJ5OuvWmQzcl5Y+LhIg6Y4llgh/mlRpgtM99hK0=;
	b=E51Idrpn7JFPPU1gKAOm2E8lu5mw9YGR+PVFgDRMyzSGgT3F9wFR2/oRk8W6rOYExkDW
	 k+/6D78AlDI8HdfgAGKAoBEvkY9/YiytZqwFEt7dxA6Ae+fpuvJibiwCLJZYYFwGK8+ZC
	 VzWSRiLOxCAeBKgt8AocPfeakUNolwSoSuTVeO4JmXrESHd2DJdTTM9+5AC89qZl/kM24
	 A1VcRPKE4vTbj8ch9CfM0ZAyNgLnLNvK0RC0sdsO4GGoJRrqyDRp1a7LK4octGp+YqxHS
	 K6y8T4F6x3JuD0N99wePv67mL4thYHE4gQjgyW+3YvQPftBjzuPWDfkShIiAHstSRzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oeyLHW12;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDAC606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oeyLHW12
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C021F031E9
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793083413;
	bh=1rV7sJ5OuvWmQzcl5Y+LhIg6Y4llgh/mlRpgtM99hK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oeyLHW12ZBVJE6WwsG5A6uwis/ZOX7lxJXy+K6wLdbIGwF5dWUB7rRaEIA2sOn484
	 KEbamJPaydrLoq1Vo0IljG+Srs4rgLh9IaAnlw+HVuHY+mZXRMVsXdp3zfmn8Kb112
	 5mifVnj/u5mFKtH47GvCltgVRGPlXKvHccHv5zRgknF6rxSgxUIdYgJ3jJ+NPWp4aP
	 fs7r2yLCNDTnTn72pKo6w41h8TUnttVlWG57bPK6kHWwk1zruD4Gy5SW1BDZWws8aw
	 QuE+d7omHnJ64LXfWtKiZOm4e8pfJ2lvjvygxhS6zK5Wx9SePtpSZAjFEgZpBtZTu6
	 9NccuSBZLvfkw==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec92375d2so1703653b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:43:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7Qi0+jLDA87PnoBGOAlXB1dMeYrWDoFPoqQs+heCkmBlUuL3KkDdD/z0F6R4UvTG73enkcl4Gug0InRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu1RxQD7Uf2Z1sr+/T4olXkj9pqfMdVs8/Feo7HBx5CVLmc0K1
	64MUXkT38jWGVrDgS6gtwe52Y9PS7ruhg6J1y3ig5kd3df3eLL26w4+JQe3QzNSdGMqn2SngbdR
	DlzoC4FuA5a0htrQjPd6alAFwT2EQJAc=
X-Received: by 2002:a05:6808:220a:b0:4ed:7045:d3bc with SMTP id
 5614622812f47-55c002d9ed3mr5982970b6e.32.1793083412383; Mon, 26 Oct 2026
 23:43:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026091549.605810-1-p@1g4.org> <20261026091549.605810-3-p@1g4.org>
In-Reply-To: <20261026091549.605810-3-p@1g4.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 07:43:21 +0100
X-Gmail-Original-Message-ID: <CAL4WiiredhAG-x2Ls8moMLprzOt2Ua0E-eDSXk7Che0QHQ3E0g@mail.gmail.com>
X-Gm-Features: AclHuK8M6VbpWDO_HbzkaGdWK1HEj-x4xPb3ExTmDRcyeOQYYZiLPbtFqH9A-VI
Message-ID: <CAL4WiiredhAG-x2Ls8moMLprzOt2Ua0E-eDSXk7Che0QHQ3E0g@mail.gmail.com>
Subject: Re: [PATCH net 3/3] igb: prepare TSO and checksum offloads before TX timestamps
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
> igb_xmit_frame_ring() takes an extra skb reference for TX timestamping
> before transmit preparation. For GSO packets, igb_tso() calls
> skb_cow_head(), which can reach pskb_expand_head() with a shared skb
> when the header is cloned. Commit c7d8bc3dd511 ("net: skbuff: don't BUG()
> on bad arguments to pskb_expand_head()") replaced the BUG_ON() with
> -EINVAL, causing TSO preparation to fail and the packet to be dropped.
>
> For non-GSO packets with CHECKSUM_PARTIAL, igb_tx_csum() falls back to
> skb_checksum_help() for unsupported checksum offsets. This can also
> reach pskb_expand_head() through skb_ensure_writable(). igb_tx_csum()
> ignores the error, allowing transmission to continue without completing
> the checksum.
>
> Move TSO and checksum preparation before taking the timestamp reference.
> Add the timestamp bit to first->tx_flags without overwriting the offload
> flags.
>
> Fixes: 1f6e8178d685 ("igb: Prevent dropped Tx timestamps via work items a=
nd interrupts.")
> Fixes: 6e033700887b ("igb: Add support for generic Tx checksums")
> Signed-off-by: Paul Moses <p@1g4.org>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
