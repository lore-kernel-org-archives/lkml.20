Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE84F85DA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178553; cv=pass; b=oWJAyJ0gYq3n15zex4THaMYPoa2QKydHEIQ8IppQHhO9IC5ubFvNQVlphAVUVAnUJUiWM6PtFuHOb+gWZ5POBEmD518OJPaDJ/Au0Jzj04tG6EvSOYS8DQFb+8fXUzxUf+ahEJ94OBHDGDheqI9QAjOP0oiIoO5Vruav+A7IYkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178553; c=relaxed/simple;
	bh=pFXiJCw5ZPUtyNnmgCVZip8L+x94Nf5NUm5RGAousLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSZqV+ZhvhWPgJSiDN4U7VZrcdFZo6+S2gMgVtcZtoJeRejq0MXJEEj8YXC7AeGanbnS0Fee3tz+AhpNhKqWxYzwWKDv/8H/XQbd+St1qWDzmwY2YpRGdPSKfR6r5D0QJ9xatEak18vFjlXKfWqtbmUbQwgCw4ntRWtwIrPR/rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEwHocP2; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEwHocP2"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664d3421so678520eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178550; cv=none;
        d=google.com; s=arc-20260327;
        b=MrSjNe/AxyLKgSXqeuQ1kGtQMxCy7rKJdk8XkcJr0kbnvOCw5JFrzJiwuDboppAe5c
         f+74lKWF4O5kind2ZpSdIC9voSq2jbL7T7PsIP6owpb2qqYP22UMRUfQ/aupyoIFM4Ri
         ka1pPNhLYEd+TgYcVaHq5De+1pt2qvKe7Q5SE2c0W8ZFehIOw3lah/FCqG/10uBwRtEc
         KRX9cx14iu/ntTdf/gSTWdJg/S7TwmLVSv2P47cLIy7hN+OMlFQVeM/8LcJn4/qhl3bP
         cqMWWDGavW0cMZiyIPfFsi8afLDDWeNlFWlIB38m6GRdxlzC95I4uBpmRdhkfJn+fDxg
         kzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFXiJCw5ZPUtyNnmgCVZip8L+x94Nf5NUm5RGAousLM=;
        fh=NREYIbZh0tnb58ltHRAwbbX/l/y6sm+4QBZfvqlQslA=;
        b=juZhOrteOjQChp8A5GMLT5doSDN3L61wmXT+skSi6HAc8HUOBTcjHvnmdkwRpM1wGO
         zcdmeZaRrlAsvZTAxNEL524Rb4t8X1m8vUNLsxWVFwHY1vP3RBmSkCqJUoS1BhmoZ9of
         hixSUERq/4YYYx7cNzy9YxRUgivlYQoXdE6jdF8YGQnRWPvV3MAsC4kvJMSx6NjIhjlW
         myGn58xcxG1au8DHgA5rzW1A/HjLm31G/gKYqchCC7pRVRY7gwj4ytQ1GVVQ+9A9JA65
         vReYG5M4Imq3A0qiu3XiRRCUt3WcVmqlwnZPMZGkUeOjW21j6qihTlh8SiRATzt4/h2v
         rFUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178550; x=1790783350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pFXiJCw5ZPUtyNnmgCVZip8L+x94Nf5NUm5RGAousLM=;
        b=pEwHocP2sIoHUtx8bZXvSw8K8SRMsos8nwjhxEuSuwHrPa6Eacc1Nzrnz+jp0jY1ho
         jLXHB/z/PyKwm/r7dm5MlbHEjKZ9MX7WNuqfNpk61slOquc9U0KxgbzmMNMby1m9qs1D
         i5wAGJaYGIg7fV3gMKwAIQcUcqHAA4OxjVZobMU6EHl3I2Ots43v/WyYFg4eGYm4SuhE
         SwEZgluuUi6ENim2vKsR+fEwDUqOc7rANUWENKrWHrxZfqAz1U2pALEmiyBurRocWqBe
         VL0zYqqgksXp3o6b8pjIkqtvqt3J6bg3QapzoOAq3E6ai/dwZLUfDOF87tv3HJ+Q+AIb
         wvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178550; x=1790783350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFXiJCw5ZPUtyNnmgCVZip8L+x94Nf5NUm5RGAousLM=;
        b=KIOZ0vgzB8ROu2yc1NUfQwqTpQY508cqut2/fS0aZ6ue+xXYPUj35qkOEdS4jbaOV/
         cey3ZziImemI47BsQnIxbinaYViI+836V5wQlCRZLMY86vLSs1OvjEPqLqmWYvthSLSk
         m0VjLZ/qnIZmjyHKheHzgfvtZ3NLPg83TjAPtzB3WpoJjlczWCiKGd3PiJ0U5zcp1k3A
         qLiaIjXn6MST2Hoyww+HExQeoHih0cMGjnbsy6jpsjTJOOAaHXWt6DtGOfpjXcYWx/7S
         kcx4jbrqaJnbDJSGCubN2Il0PUNEcvQWgi/GE2Fwc5ioWCPSloWqe7s0+md677mh9dTo
         tf0A==
X-Forwarded-Encrypted: i=1; AKwUvBw0tgfS2XpLZBYOVNjSiUfoBEiZhBx/9vXvxCu932DFZBejhQXIDj6WqFuj1vzx0gxGo3vfrIysHD801SM=@vger.kernel.org
X-Gm-Message-State: AFuF++kS+foNYpxwBCq1hsYxxbzk61FajKdS0lbxIkC39aEgqkOHURDB
	gw208WYJZMGSIiEZTgAPQcvh+BSncOwJEwcv9m3/TRHWd4c0eXJcH+6t6fGpBA4qYQ2UEKbsIF7
	+E3/lLBblVKuPfSJIhnR965ExORNibCQ=
X-Gm-Gg: AYBFou3MBXsP/GYxnbx8fY5dY1HJRxypjOvVAznKwow6vIvG2wA7QW2xYv7+AR/+0Qb
	ZqGwkQ1iiBEI/2OcdCZ74D4UO7sRrQU63cowloCesvcXoX/k41ZifB3mPCvmSwR0Jxe5VcvsxBm
	nEFh+EqV2hFHe36nnaEOIWjpWBNKSNqaCyaQIWz+RlCEGjp6XJdwZEaJ/4pzVGCHOM4eZHWwZuj
	Bpg8O+G490P+tV6ZdrBIR0h99WQk/3owr26ezAv8TPWerq7xk5nbg877XrSTKWUZZSjfZnsFytt
	x8xr9skBCcKJUL+ja9R4K1O7lE7EYJfwfBC1Fp639YI822e0rWmcZI+LuQDTK/009svzz9ckJkB
	Z4Ub3bUX2d2ss75pPoi024R7uKL/4UDgmrEiagWNaIpIJjLs3yjiemlzBPF1oDIrbsKiQdYs=
X-Received: by 2002:a05:693c:65d1:b0:33c:55c:9b61 with SMTP id
 5a478bee46e88-33e8c24a5b9mr2707317eec.11.1790178549658; Wed, 23 Sep 2026
 08:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-b4-fix-pcs-lynx-an-v3-1-dda3ac4e499c@gmail.com> <20260923150542.jo6inqtczwiignln@skbuf>
In-Reply-To: <20260923150542.jo6inqtczwiignln@skbuf>
From: Patryk Biel <pbiel7@gmail.com>
Date: Wed, 23 Sep 2026 17:48:57 +0200
X-Gm-Features: AclHuK8ni2GY4xiKPs59pfjPF4T8nzT9BehaQWgqHpGgHfXg2qrLIPNRNW8UXTI
Message-ID: <CA+DkFDaau33xZRCLKTX+V2+1M9SiypTPLh6Je1SvB1xocdcprQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: pcs: enable autonegotiation for 10g-usxgmii
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 23, 2026 at 5:05=E2=80=AFPM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
> There are 2 problems with the commit message. First the prefix should be
> "net: pcs: lynx:", and second, you say you enable autoneg for 10g-usxgmii
> (which doesn't exist) instead of saying you enable it for 10g-qxgmii and
> usxgmii (to correctly reflect the code). You should probably fix both.
>
> Anyway, with both addressed:
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks, I will send a v4 with fixed commit message.

Best regards
Patryk
