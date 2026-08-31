Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386C3DDDD2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168899; cv=pass; b=p9EkXb8gyz/KbXBbFUYaYzcFxY3crn+cx1vqKsTDruW709G8G3l0xT2PMGJeUXxLch/OTigL71bozzVMOXfFhhke4746giZY1ksTrJw7wWL0tN1pxkM1e3Sg6E7+UuioC9GxsB75Mu4vG6TBxr+UvvCEyAXoSVxofWQmcLpHtdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168899; c=relaxed/simple;
	bh=U9ebD4L8ITu2kaaAEQ6ddZIE2aJmclvAiH+k7ulDCFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ImGMPkI4/A2IoIVb33Jcb83SrxyX31xpwofdhyhp+n8T7uM+cA5HnMq4kZQd+DXrU8TVgY74w+vL/B30j3qKj2zhQKWBQQbkFoDniGG4cUdSk6O61vm9oTxRc2TTdd3EVr2MHGDORhpMLsZVCGtFB9HcxK+7rItOa+TUC4g52IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H06YN6Mv; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H06YN6Mv"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-85aa9c1308dso30877537b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788168893; cv=none;
        d=google.com; s=arc-20260327;
        b=Y0ctUFl7XIFRdv+IbtLuzPFlCtxXM18hwL+7n2NsDuJAmm6yiSlaoEUkAFIFzeyUu5
         GUoTX235VEbIy6KeFjwzJKIdQZiTbBQyAyonsyAayreZ9oV7CAgLcI2xVEE8MEIzQHws
         YU5uxh077uhOAsGYRwNGsphUqTN6/q5e411BUY6AcicbOlbeYVz1LCXUyqBk/48jAU9k
         84BkPozt6aJKHGn5PDok/6AVZycoqVPhVwW0nSi9FF7puHiOIiN+Wh1iRy6nXi0qPUEb
         kyIOlP0ejxh97OwQ/+FA8hpn9F0rL+/gCmhAoOp893fgCyWIghpAvmccz5/bGGzHzhR9
         93JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9ebD4L8ITu2kaaAEQ6ddZIE2aJmclvAiH+k7ulDCFs=;
        fh=B+8eHL6of+zTsfDZBteyW38bchs1mUpsRG2CKUqNsns=;
        b=JFvpnV4arL80Xe6WCOZMqfrDH/fOXAaHpP0+i9vq4yMl9ujttERaBh/+PFHPeoW90g
         YZYXDY/GAV/Va+GIvh9bHtZ15+Vxz9myILKAMk6AHjmnnoxMnDO3ixtcYsT9LLv8twu4
         Zjk2xrptuM1NPN06QIOOj0IEvENKscNQ34d67YaV0xrFVLqTNr6Ice7366qAsvD4ELYR
         UpKwuZUd0PQH8qPjCJtAc4cjaqHGuXLK3ewtY0z8Eu9Aoi5poSl/eCKllCBEFx1xPIz8
         MBa2vqilwhhTxksaeAbhlZHZRI9Mxh7ihjSW3UVq3QKJnE9fNz4tfHfavNOhKS1QEAMg
         KIZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168893; x=1788773693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9ebD4L8ITu2kaaAEQ6ddZIE2aJmclvAiH+k7ulDCFs=;
        b=H06YN6MvRIFECWkQwykHDVqQFQnID9wF8P/0OQ91bQj0tBeEwOz56AK/n0kstsi54x
         o1FrlvRUCil7178fs8oYtiU23Ve9N6UkKr1Ev/xStCcsKgUno+qkoZAYBBeqQlwACJP5
         HhTH+R/mZxg6R4rIBC2nz3pvC9JPyEZmtNmQELXVMPR3385/q4YLLVP5S7Z5ZWF/2Uj9
         inNtM/eOpeS+54yUNBdVOJvXcE/wtKlGtjlMc6UWV08Y3+CqMWXlIs+lTw4OJkw1TwEU
         1IpGnyvd4UTV7iTpRZx3/glr1QLiGBUqUogva9G0ZHnSzlr29yXP/uAS9qYy1OjUTAuZ
         Gg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168893; x=1788773693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9ebD4L8ITu2kaaAEQ6ddZIE2aJmclvAiH+k7ulDCFs=;
        b=fYXqyBY9GolUVwXo9XAC+dNzI8VfjSMdAcDaIIy7QyiTWJY9opez2h6Ci2XPztOrND
         ZIj2oDVG1CaTB1DHCGlzRUSdgIxnxyzkAcCM8FiLoH7aIi9bUnUC4Zs+fu9/0GN2MpT8
         iHSv5Hby8iU7toXDLHMqPJO4il3Hj554roeK5pbCWPhTnsNKrcbHCXo9zFxnFahYm429
         lIzlEiqq/wSSYKqoxHxEUYEmRwFiU4IH4IJ3N2cUzAKAr3aZwoBGsldaUwg/Y7jfjkJj
         /w3gdz1lvphHtdmuNXvON/gpjooHptIcUfUb2XCSdvZ+EZBz01SwpSxAVx+SlBLtQIZ/
         a4IQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8rZWf+wJ2EoH7bKTqcZ3LCZFmUa6xWK+tktAw20y4pYdd+8HNrm7nPM8CHD2sSSsBbCbhgQzXkxr7azk=@vger.kernel.org
X-Gm-Message-State: AFuF++kJKYBXAODE++mYn05xeL9UmgAfwxKINZ3sf6SR2sEMDHRxm5ng
	6PGY/Bq+QoG9hDgiBo6wDRc5eAYqWqd9vgGttksVhmFuOJBYPm2HNxu2jhts07f69SBhvFQaGmU
	0UJukq/AAT5TYvnRm8lNmEWcgxjKls5M=
X-Gm-Gg: AYBFou1eDDnbQkK6JaE/pauiT+RjVqvJ7r1+Uv0VCRWtf3Bj8N+0CCEgRIymTamteki
	aOnAhwKVHxR3Vkx8Jwe2daXtkWiUn7/+bsKXQZ4Ay2oA8q9uM9sLDsa0CAFHf06yXnExftRYdD7
	OleoSF9eWFwuk0YM4sB1Px29BVQzYCvuqBPTnmLAbBrt55jHnY2ItxQ4QGzhhKFjxJkVcYNsZtB
	AU6K5XkqTk2r94kFXK2cViQ5ESBu0Bv7m2C34vtScnBiKM1Lk/S1Y0GJl61uTvx0ViHogWEZaJL
	kXiekyKVjX9WnBt79AFKM2tJ0thOnTNiZ3VXn4em1NOgHKRtafgoUbHokN+DoNGrIOVpqGsUZpt
	X+I4kwzxfliPufbGbwQGh051hZVP6nzJktR1lhxN4QzlO+ai14Hz7zzIJvVJuCg5gbXdwF2iuWd
	vroII3Ul/E
X-Received: by 2002:a05:690c:498f:b0:7db:ccda:a409 with SMTP id
 00721157ae682-8678bd7cd25mr5510017b3.9.1788168893210; Mon, 31 Aug 2026
 02:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831085217.391-1-strst.gs@gmail.com>
In-Reply-To: <20260831085217.391-1-strst.gs@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 31 Aug 2026 11:34:41 +0200
X-Gm-Features: AcwNN1VrKttLpgKWhAB8iBZiZxt-vHxYzhIUcbdaTqqJW999xYNsjruBpoWd7VA
Message-ID: <CAOiHx=md28_BmsDOsNDp0XbUpfih=P+-+aDYb6tiWPJTCu1drg@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] net: dsa: b53: fix 8021q uppers on standalone ports
To: Semih Baskan <strst.gs@gmail.com>
Cc: florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	vladimir.oltean@nxp.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 31, 2026 at 10:52=E2=80=AFAM Semih Baskan <strst.gs@gmail.com> =
wrote:
>
> Since v5.15, a standalone port on a bcm5301x b53 switch cannot receive
> its own tagged traffic: the switch VID lookup is always active, an 8021q
> upper's VID never reaches the VLAN table, and a tagged frame with a
> missing VID is forwarded only toward the IMP0 management port, which the
> in-tree bcm5301x topology leaves disabled, so it never reaches the CPU.
> The common victim is a VLAN-tagged PPPoE WAN, where the PADI goes out
> and the tagged PADO never reaches the CPU.

I really don't agree with the framing here. The subject essentially
claims that uppers don't work in general, but that is not true at all.
They don't work for devices with a *broken* device tree configuration.

So this is a work-around for broken configuration.

Also this is an incomplete fix, because it still won't work 100%, and
there is no way to fix this from within the driver, the device tree
needs to be fixed. E.g. with the (assumed) disabled EAP mode on
stand-alone ports, you will have the issue that the switch will drop
any frames with destination MACs that match a learned entry on a
bridged port.

I really think we should just fix up the in-tree device trees and then
complain loudly about the broken configuration on probe in case there
are out of tree device trees with the broken configuration. I mean it
was broken since v5.15 and wasn't noticed until recently, so it
doesn't seem affect many users.

Best regards,
Jonas
