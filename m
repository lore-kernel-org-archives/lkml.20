Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B1B4CB8AB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769537; cv=pass; b=c7KM0MpjnoKe/WAUwNuSfHsZXFywjFQJmA9GxaREKQ37AxuWgV0lDrMM6N1tlTUvzhlT1ibAydsRHkd8Vzeo3ciBxgnED4mTrcxOJ8D4tIDG9ooc7zJ3AoEcfi1NAPGjUnRxtQAMetdGlcNsU9+Gwohos8vkv4iotKmgGbREaCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769537; c=relaxed/simple;
	bh=gDDF0XFUuoqlHKuciYsAXxZPSv08MbbVx/bzfReSE8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhUC2AoAVezmXA6KajBwM/pfAl4n4gziXbkURnuVoozcwkmmMB2WuwEirDaoNlOG+OeElycAfOnZXJiFQvsmrIloNWHymqDsRJZJicZDGNtJOr10XhL0x1CGyGmoGqYda25Y3ZmS6KhwGE3WBY4LT8zTwZUH/GCopArPgSKtfig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=I6Ou7jtF; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="I6Ou7jtF"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e17e5de00so128818566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790769533; cv=none;
        d=google.com; s=arc-20260327;
        b=B9cRnFponNasWj3dvQCSY8jIy2RkcJhprBiS85fkBa1AoN+aWOa7Qy4/qPcs8w1Mbp
         NX2Ui1hQ2CbeKMDgxNmjd5x2oLR9I12mFIadUtEfqrEFVKO7bPlDHo+BBetTk2Zdx8+T
         l1RS41XmWAieXaCsd9QU40tmDcyfT9YI4hOB1ZIrxilVqYjrRMvretQtLW5/3nIldebP
         /hX4q7F1UdVLoR2N0Eyyh4SdKDWreCAWgz5cu7QoZj2CXsPHdbtLieBGPGALN5kdG0Zd
         /gvpMRunaVChx0GKBkedKo6amRXrWpsgrcSwkM6R5ANoahsuto57V/e6h0Xe4Is4o5K7
         xAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        fh=NdKxjiiyK4YlsVMZcOCoOkofWxFGBVQkGP02ABRUl4g=;
        b=XY7bSi49RG1go7QjrAljdDEp3Ov1Ssu7NEUk9I6aASP30KxA7ix7WsYvEHWq4XczNa
         c5igWfZ/Ka9OVoqTH1IXkPPNw14S54ua4/j+AVDcRFUZQJiQq04fiIi0GlOZCext8uhc
         N8h1svqIR710dWrWs8tdSBFH32BTbHN4cTClSJuJpeZkJHpcRcoz18JdQfept2lyHgFM
         EiyRRZ/+a4MR8hqMpyAfjhKs6LZKjAsCkJK+49D3BT/Knx2eWCo5h+o9szyADDhAGy4M
         o8aoLO+I8cshpm4+sESh+Dyn0d4KnL6C24pWtPsupMDwZyZsZKJMkCtH0aTJ4MHw/pmo
         r4ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790769533; x=1791374333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        b=I6Ou7jtF3DP4pS402dtNK+2SD6R1BKdYTVSruchFRPXUmAcszzgBp5ws7sA+bY3Zzo
         nKvRl21mTNINsLGVIp17z3PI8aM5mAH4YxlLp2ka9hfRGBqUSDSY347ekDkZNSJ8MMvf
         /+Av059YD6q/04oJaoZ+S01ZjXstAXYxZa/mFrIVnj1C9vxr5jqiZWtFvojuhw8xYIjz
         YcITNQdgSBAheMj+JOR5faow7VYFQGFVDIXFdN45CsI5Y++j0H6eAbkLWzodIwwwCQ37
         e43rJVJEz4BMwQlWb7OfqQr5uQjTa8YpSdndIJAjdCGwkG0kdNk5F+6fhrApZCVr6ooG
         upVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769533; x=1791374333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        b=z9Eih1BLFGnPpx/gJo4D5a+mEGGU6CkjBP0M/k6RZlFJ5jVW0LBTNhqVLr76+L/yWU
         bek5IwGo0FZ4vSJo1rLNDP0G8NGdy6MafLZFlT1ZdwinOxHc5qHw3gcGPqa90Lfko8eh
         i6jZRAecTYzHs4vDEfU4DjKSXvnVvYJ55VT/mTNAnIZEhvjeq308bPQ4/iW6d+wn+ewR
         R9EMSjjwO1jGjWF6MGDT4ZweEQl4fYmw4z9v1XV+fh2PySuf69zbAGoN6Y/vEYnukEH4
         N+tgHHhOMRg01S5ZoEDjfLzY5UPutcmixFKY54xzvleNZ0d4VZaQoj+tfio39S1rLsqx
         ereQ==
X-Forwarded-Encrypted: i=1; AKwUvBym9P4JBfCpg+NuvAAxw8d6ijGFoUwCCqEHPYhv2L2YCq14Emzz9XZxTF3kagtqHhOUmJxP0FGMOYowhxU=@vger.kernel.org
X-Gm-Message-State: AFuF++mFva2j9XO8wAclpCCy2DcTSW9j0yLfYFNywzHSQpxab5Qv3SzX
	xabseKiw5+Vi7jh2KwWrZvV7F0oZbKvld5Ugv2TRWGtoAkuL9CuN+0oHi0kMt1Z8udlpb0c0DIY
	F99XQ4W0a7iKH8n/Gb5NOgI6DUFYQc2ovpONhzppL3g==
X-Gm-Gg: AYBFou3xm1nzIPEQYi8kxvD2TCrrvG7ufuuR0N85CtSbmdJukwja2pH1ujnq7t2IN20
	h5R4dLNR5R2Am5GNEMytJ5MSD04iVgYBTTYXe9dE3br+WZDt4vlrCBUK8b6Lm5+nK23RAy7LW4f
	UrCHqrP4XhycLQCYD7HNG/IRh8skebAANf0OgJytj5blSjK0VpCdho7t/GhmxRAcNYMHbyC6aJT
	3nVix4B0CIU93skYfPeh9P67Dxyk+3waBpEXgTQ1bcfgkyKEvXmThgYRfuRfZDwELPKUAJQvm35
	8yfO2srWoAFZzlydSs8NiyM6TAqfyo32NLZkPRAOIvIhXhKcJ70iv7+IwB05qHNGhYDKKXi7S9t
	NGNqA0BcnIdUtvw==
X-Received: by 2002:a17:907:9708:b0:c26:19de:913a with SMTP id
 a640c23a62f3a-c2e23e58df9mr108073466b.45.1790769533085; Wed, 30 Sep 2026
 04:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
 <20260930-fascinating-cheetah-of-speed-7cccd0@quoll> <eb2d513b-3c7b-4298-932f-8e7cc8d9c08b@kernel.org>
In-Reply-To: <eb2d513b-3c7b-4298-932f-8e7cc8d9c08b@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 15:58:45 +0400
X-Gm-Features: AclHuK9WjZS6N6YQrXd5XAL-P_3Z00CVqfe-4TuT9v8_bFTVQ6par63t-_u8TFM
Message-ID: <CAKTNdwHy41vh_Hp1zOnOtK-v7LvpvH0tgjP0MrMXdtZUqwubnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Shawn Lin <shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:50=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/09/2026 13:47, Krzysztof Kozlowski wrote:
> > On Tue, Sep 29, 2026 at 02:28:19PM +0400, Alexey Charkov wrote:
> >> Whatever program that acts on a reboot mode runs before a full OS, so =
it
> >> may lack the capability to enable the regulators it depends on, and a
> >> reset that preserves the mode register generally leaves the regulators=
 as
> >> the previously running system left them.
> >>
> >> Allow a reboot mode node to name such supplies, so that they can be
> >> turned on while the mode is being requested.
> >>
> >> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
> >
> > Again fake tag.
> >
> >> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >> ---
> >>  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8=
 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-rebo=
ot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-=
mode.yaml
> >> index 79ffc78b23ea..5ed70c87269e 100644
> >> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
.yaml
> >> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
.yaml
> >> @@ -36,6 +36,14 @@ patternProperties:
> >>    "^mode-.*$":
> >>      maxItems: 1
> >>
> >> +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> >> +    description:
> >> +      Supply that has to be powered for whatever program acts on the =
mode.
> >> +      That could be a boot ROM with no access to regulators, and a wa=
rm reset
> >> +      leaves them as the previously running system left them and not =
necessarily
> >> +      what their expected out-of-reboot state is. Any supply describe=
d here is
> >> +      enabled when a mode is requested, and stays enabled.
> >
> > This looks like workaround for missing supply handling in actual
> > consumers. Fix your devices instead.
>
> Heh, I misread - you need to power this on? Then how does your board
> powers itself in the first place? And how do you even solve the
> incorrect - e.g. too low - voltage on these regulators?

When the PMIC comes out of a cold reset it has all the needed rails
enabled by its power-on default state, which the DDR trainer relies
on. But the OS will normally disable the rails it knows it doesn't use
itself, so a _warm_ reset which keeps the boot mode argument live and
keeps the PMIC running would leave those rails disabled, unless the OS
put them back as it found them.

So to make warm resets work one would have to either ignore unused
regulators in the OS to keep it from powering them down (ugly), or
mark them "always-on" in DT (also ugly), or state that they are needed
for the reboot mode feature, as done here (which is least ugly IMO).

The DDR trainer unfortunately cannot access the PMIC at all, so it
won't be able to enable the supplies it needs.

Best regards,
Alexey
