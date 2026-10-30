Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380117;
	b=x4FqhcCLOaWWHltvCWZ+9Dfg6BLlR6+ZGeoOglI6UrK0XDTVhOmdgyG2pz8xW9DONCDR
	 hM9FTIrkSej66KnI+g8JvkJ9zYD0n8KJP7N4uK9Qe3EJAHW27WKtLd1j6qSUfZo0/VBAp
	 ytSXluYxe1tBT7JkBA05Rg0+cHgreBPNfZ2gjVh3BWnyV2gLxlALaKbcF8DEJofmZWAnL
	 kSGZb5HPBEHla8jqPtKRApfd58J7E0Cgknb9unjl/g/KRal0gPiDI9xW9NUSSOA0tuCUT
	 ++MpM1lKVwm/4N1RK7NZkfbpWbrim70N9Dm4Gq8lF2VeAsMaeg1JFxtGtN56GplH5HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HxML07JrVrj4RRpOs9TXwwC7f4fwJda0Oemp7EKVGdA=;
	b=eZ2ThbAvvEwPjFQPoZ/J6as4AGvRMG5w5Xz+LZGdPFsfNFSIssju3Aa4dB04hrSALtlK
	 UalX3gVY6/1cGqRWpvwly5Jgc/vGz/dHPIOTVuaL0NKax3jLTgmCZ1g084z1yffOGvm7j
	 tp/OwCSQFKT5QJN5kTkqg6X3WjRqStXXuPpbneDIwoNd//FrDU1VcO7LPIBKN/Vo/Gi98
	 3yeFvdgi8sLtkrlZK2DrLegcMdGHnJ3McxcgUrMpuGwTMFFI2tPJAwxI00Q/w4SH/dEk2
	 vbvD1LgS5R15Lm6tbOD9POdTJjzY7eGi/n4KcI0ewMxudSbl88++I6T8b2tCINLaGdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzvdKKji;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49E606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A49E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzvdKKji
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso305787eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793380117; cv=none;
        d=google.com; s=arc-20260327;
        b=Zpo2atrbR5vatDGhhVa8tGKIQaNopTsqe5XIWxzmpfvkaqyCDnu2/aAy5GjsBuIF81
         3HJCzp1eA4BoOGsJpkiPAG61J4quKYCTcS7kEMJtf3mCB2ROROXtnzICIT1NFSM/8IGo
         p61fg29GHDEkiOh0HoAQ4bf/M6pkS5V06iAR7EkqqxPtU1AxmMF3ocG7SD+hEq7ESXDi
         IfXu4oRmlkEMb5icteKRDL20i8odHn7ljcxwGuyuPL0ebic2tLyuth1WsbGIKm/rqpYu
         9kety8QHBCzRvei5f7mRBt4ZMCYP3OdckhCsHsKcmEy+G6oFQxUYhftDTYvc+VgC9YkR
         TX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HxML07JrVrj4RRpOs9TXwwC7f4fwJda0Oemp7EKVGdA=;
        fh=58wooEvF3/rQXDo8/0r1AWxf0aDhnOFYJo9+vKxa6SE=;
        b=dvwqMNmeTBBVCugvYgksKF+Xhy2jIsYiLuRDVIxjlCGNoPxeEA6Io+a5i2G5bjmayi
         KRa605NIr67/D7y9dMcYEiuMlhLIflS4WFMBVTYeUijmwT7/qj3EfmgIv0UWxT/EW/Oy
         K3/Ko4BJWghHjSNNW/DIHvOxi/CFaN/7UWVRs3jHbgJKKaIp8yJyvqDRyDyvk3tqeJwb
         v7kB97GLf6kwurUMBHihasXzRClLJWWyWN5l62Ubm9fPIJ+upGIlzeOkUavP5AxjeEUc
         pMfJxLO3Ba879pajKN7dJXMUKXuE5onkvL2i4k3G67hrp53GgNyFFBjggg/UBXolmPTs
         QF3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380117; x=1793984917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxML07JrVrj4RRpOs9TXwwC7f4fwJda0Oemp7EKVGdA=;
        b=DzvdKKjiubsVbMwKzsQ7OZz2Imxqi+00JZUqKyxM8AOizqzIOyKcW6VOykfZwiIHGF
         57cMPbwdV+ny3p3vnIld8EStmBo5eIvqQ50ThFFCUVi49IorC9D2QtXmQ60t7QUSIaJC
         AhANEJLnTC8IkzRYwMN249nWNY1gYM+976/qNZEBbrEaj6Ohp3I9L2giYdp/iU358Kms
         WoRsCYo3kgG2V8NOqNY5x/JQeC6BIKYP7mnvMp2EBm3CquEIkQjdYY4y5naql28TjYx4
         od8G+VEDCU5zrLYUE89hS+u8fxyYybDFcLmiHfmxPrRvc4n5fdCmGyf5TaII8Xf3NgiS
         DmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380117; x=1793984917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxML07JrVrj4RRpOs9TXwwC7f4fwJda0Oemp7EKVGdA=;
        b=W6Ic2CorP5vZlJoZi4UPBHCkiX+BUCQuzh4TeQooOG2/4V6g0NoGUVAmnD0tRL9eks
         TW/5heAhooBmd/Co1yc7zD7AklS6UyjaaCE83r6vYeOrjutNtlz3MwZl4+aLbpwQvY/m
         A1qa70sFllCHQD/kskylnkU2wpJbH3vRneGweKUKm+VpuQKZMRB9hrh8gcDkug6DsR7l
         sV9aBtvM+o4yjJCWlTxoE4rfkOxdqsxvXes2z+ojM5m1dqJj+VIS/ruY6QCh+PjZ+Es/
         ElwgLsZL7dg37eStdrVMLcr5jnpOZEVFl64r4sxPcFIcXEetaAFzjiWJ8xR0iDcvKg8l
         aPEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKLsJD7C+u9fVJW7omOVdW1hDrBMhQgcIN2+XB7qiO/x2PPxUdtLocFiF41OM+z7GL8reHKcNb+vDGSPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUEaLJqFB56DBt+k6v79jirksLCcUakCfrmIB5Cs6J/D/+YAPm
	DDl5YizZW3bgjj7UDLeTOFbzmACaZ/cMrASZH9PuwTbnK5TsKWIn1wMNTRpO5/Y0iJUdDF6tvPz
	o0tExXvA6y+87sKs6Nds5AVSNM6PjrjY=
X-Gm-Gg: AYBFou0v3k0HgRejLBlbhI9hHI2EKdPscmuNvydrpUXBe9ryaD8K1fhjc63p+/ckT0P
	gI2Ge/Zm0RDc8xkW3LZ3FtyIimEOLMdX0SlvWIpUtCxtpI6FZh4CrhX/IcJsDCqxVLpBwuKB2Oj
	9ESLedi/ngT21d5ixxOrhCQax42j6LhHObqEfrRlEXM5k5TEcYILFrQ2tYturxoMkiTDhDfij6j
	TvtNTdyGW9EhQVotd1DcDBkZ9V3FMhFKoF8ugt9ESiTkTCQMhYI4ZlDTDvbehce5rPKvRlqbVSP
	VRpxqYlww0fQWcUmZ5Pntsuh9y7L0tnlc3yk+yJzLM8ikY2mFrNDqmhwjShFpwqPglXHzHW4SAS
	DKnFCvTCuADbF40SBycthaDfpib/a2E55m18J1YvDXez2MtQoPpuJTd8v0Q==
X-Received: by 2002:a05:7022:628a:b0:1a4:c892:b130 with SMTP id
 a92af1059eb24-1ac5b9cb62dmr4974858c88.15.1793380116576; Fri, 30 Oct 2026
 10:08:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028104758.299129-1-timur.stukan.linux@gmail.com> <91955.1793289071@vermin>
In-Reply-To: <91955.1793289071@vermin>
From: Timur Stukan <timur.stukan.linux@gmail.com>
Date: Fri, 30 Oct 2026 19:08:25 +0200
X-Gm-Features: AclHuK_q4UB9KXrhigTXAjvWJSIdR7qM0bZtgDXcbgAdX5p_OjAdmHpPO-SNVk4
Message-ID: <CAF+_u5CGDY8m_abiXMZFboaSnfShmFh-c_EE2EaQSOQOTu0ezA@mail.gmail.com>
Subject: Re: [PATCH net v2] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
To: Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, Hangbin Liu <hangbin.liu@linux.dev>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Fernando Fernandez Mancera <fmancera@suse.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 17:51, Jay Vosburgh <jv@jvosburgh.net> wrote:

>         Reading bond_commit_link_state(), for this call site, all it
> really does is slave->link = slave->link_new_state, when link_new_state
> != BOND_LINK_NOCHAGE.  The changes to ->should_notify_link only matter
> for the ARP monitor, so that part is effectively a no-op here.
>
>         Therefore, I wonder if it would be cleaner overall to not do the
> bond_commit_link_state here at all, but instead keep what you've added
> in the BOND_LINK_UP part of bond_miimon_commit, and then add calls to
> bond_set_slave_link_state(slave, ..., BOND_SLAVE_NOTIFY_LATER) to the
> BOND_LINK_FAIL/BOND_LINK_BACK case to make the change stick.
>
>         A quick hack patch that I have not tested to hopefully
> illustrate what I mean:
>
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 756d79281ffc..5fb215fa85f6 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2877,6 +2877,8 @@ static void bond_miimon_commit(struct bonding *bond)
>
>                 case BOND_LINK_FAIL:
>                 case BOND_LINK_BACK:
> +                       bond_set_slave_link_state(slave, slave->link_new_state,
> +                                                 BOND_SLAVE_NOTIFY_LATER);
>                         slave_dbg(bond->dev, slave->dev, "link_new_state %d on slave\n",
>                                   slave->link_new_state);
>                         continue;
> @@ -2933,19 +2935,8 @@ static void bond_mii_monitor(struct work_struct *work)
>                         goto re_arm;
>                 }
>
> -               if (commit) {
> -                       bond_for_each_slave(bond, slave, iter) {
> -                               /* UP state is committed by bond_miimon_commit()
> -                                * after the speed and duplex check, so that it
> -                                * can still see the previous link state.
> -                                */
> -                               if (slave->link_new_state == BOND_LINK_UP)
> -                                       continue;
> -                               bond_commit_link_state(slave,
> -                                                      BOND_SLAVE_NOTIFY_LATER);
> -                       }
> +               if (commit)
>                         bond_miimon_commit(bond);
> -               }
>
>                 if (bond->send_peer_notif)
>                         bond_peer_notify_may_events(bond, true);
>
>
>         Thoughts?
>
>         -J
>
> ---
>         -Jay Vosburgh, jv@jvosburgh.net


Hi Jay,

Thanks for the review.

I had the same thought and was planning to send it later as a separate
patch, but doing it here makes sense.

I went through the possible consequences. Without the loop, DOWN is
also applied only when bond_miimon_commit() reaches that slave. I
don't think other slaves handled earlier in the same pass can be
affected, because when each such slave goes DOWN, its own link change
rebuilds the arrays and redoes the aggregator selection anyway, so
nothing stale is left after the pass.

I tested it in 802.3ad, alb and active-backup with downdelay 0,
including two slaves going down, and the original FAIL->UP case with
downdelay. I'll send v3 with this change

Thanks,
Timur.
