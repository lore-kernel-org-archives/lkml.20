Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5494E379B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168387; cv=none; b=nucgJ5C8jnp/V/8bOdZRSIdrkUdcT8nRRwl66EH3l4N9E2FMUJ22S5Mi8kl5dqxbA7qSRXzUj9Y6sy1Fxk6Lbdwnw1RUtWdpJTGGpKXgYzlwHkmdH8dd5SJZA63tthNgZyyGb9hFoHqUah9yQLlkrCkSw6gLgqcIxoDXc4sbm3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168387; c=relaxed/simple;
	bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=og9lCTr7Pj4/Td4uJF+4dUc1HFyqRf3POR1AM+iTrMQobmDBEhiaeGO7PIfayLS72uJmOXdX8emuy3NYCEZuTlHG89+KEYDUyep6QXhwsOAy20bXaV5HKLPNhlumcw+R3XGsT5gLFqFixxQig7QZ6Dk17Icqin5KEyLfVrDElCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExbRk1dA; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExbRk1dA"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so549014b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790168385; x=1790773185; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
        b=ExbRk1dAAwSwEyE1ABuYIA3J7px1iQ3y8sgN4c3A3x9VvkpPneNRe7j1a02xN06kTd
         3NBFUXuLhbMomg2yaP5kfVEh4NSrYiXZNZN4wz/rp/O32PsRDqtSgVx/ZdN4euRUoh76
         Hc8E9sAlA/J+y+NMSVgkqfz0NXh34QvyFThXtwB72dZKvhAqpf7yB3J9pH0WuqQxRmh0
         7vPAzKIoVx13fdGxbufi7yMs21w4Jq10dv9osF3eYmQnbNORGmVB7fQ+K6J4zBTsQyE3
         cGTWUswr8vpcoXALR7QnjlbxfD2z+ILqus3S9QIh0FU5qDyrdlvUJX7c4CdmrOLtUmzY
         Dghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168385; x=1790773185;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
        b=u3aRokEJxnS5BC7T8nTLLaaNJ4ilqKR/m8ueI+E/aNXPu96DIlYzylKgLkR+9nZIax
         LYQNzWceFT6e4LmQkjIlhQ3gap4FqgEe2Ezs4fO2/Ryu3jNMu4dtJlh5bo6hozVGRmNC
         FkWEWRKw/anN20e6qO8a2tfmIxhTrnsLruH6ERmxBov46e9F9UN31wZrYoFXLBZKMFkC
         keopak1/xrbiUIzNjg3CwJbXumqeJrj2wib66XM04pu3lrrnVrTB+fY8e8FNKG63BT0S
         dijBZuuU6iHdWmOhfEI1MCjYqLBCBfzMdGqxn56d69bcus658wRb66v49IllguFQXwbm
         O8tg==
X-Forwarded-Encrypted: i=1; AKwUvBwuFLv4CJak68CtT+iLfWgV43RDKupgR7ODxqqd3ZIy4mTmNeJhe2+7+H4uFk3GE/Nb/z/Ghm0tC0tPt4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mFAfx1OEoG7EvMIDQ/z1Fs4A88tWg9H4EpIKEqDTFbz7bocz+V
	MAaaX46yzrOtKxsoOD9Sy9t8/cj2AV2ZXLnBTgdG1yAc02Ficgf46P8Q
X-Gm-Gg: AYBFou2sO6u0kwMPPeQmafot0XZdEg5Np6TRkuaFPT0JP9hzEpB+VMU8PCt2zsysi7K
	+6YTXYOkGL/VqrU0aslmnbwJPC3vxflqMua3Z3ThefNArcIhnjJB6MWz84TiFBrDuhOQGwBqGGQ
	IMoDXTtTeYzpNg/+4+p+2nZsHkULtRab6zhHbPBj62dKS6zlTNSZQ1e+qGP2dwafsfL32An8WfZ
	fXGfEo2WhSg9lZrBm/8OjjAmFalrV+Ue2nGm63L+AF1AZckUSGUSXC+xK/6kCyFdLKzrJ1MIHe4
	3j9h6qaED1Z92fs2/eJZyqArNW3lLZgKhfsZ6DXKVuUz5rkx6AxJ5KOXpwCKbmYT41ryhiPHK0A
	KDHi4QkLu3GaCgShMfgqbAqt5OpnXiqEkcbkANxJXKaSOqNz4nBdlQIR/34d3YZ1p6IY58z+m/F
	0tMS6/vF2JymPU+ix3jpBXweE6ubf3F8URXdiVbZSJnFraL/iTb+snhGUML/pj0cWJ/9LWMg==
X-Received: by 2002:a05:6a00:4214:b0:87c:3650:6f29 with SMTP id d2e1a72fcca58-87d1ba9e55bmr1912460b3a.42.1790168384696;
        Wed, 23 Sep 2026 05:59:44 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbfd6esm1171555b3a.20.2026.09.23.05.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:59:44 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Denis Benato <denis.benato@linux.dev>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Martin K. Petersen <mkp@kernel.org>,
 linux-scsi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>,
 Marco Scardovi <scardracs@disroot.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: Re: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 12:59:36 -0000
Message-Id: <202609240122.ReplyDenis.lhw@gmail.com>
In-Reply-To: <52904b48-a5fa-4872-b9bf-a05b1b7bdea2@linux.dev>
References: <52904b48-a5fa-4872-b9bf-a05b1b7bdea2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Denis,

Thanks for the context.

I have read Marco's Dynamic Lighting class series (PR #17). The
direct frame and palette interfaces map cleanly onto what the Arion
needs: its colour tables are just small RGB frames, and the
enclosure firmware effects map onto the class effect controls. I
will coordinate with him on using it for the LED side, on top of
the verified SCSI handling this series carries.

On the open review items: the next revision will isolate the DMA
buffer into its own cacheline (a real issue on non-coherent
architectures, as the bot notes), and I will take the time to get
the full pass right instead of rushing again.
