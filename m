Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559E151CF5E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803444; cv=none; b=pvb+JiSrXLLDwQPhY39AGUoI63nqdEXAXm/2Daqz0FM8DqtNV0FYpKU6ifCa2qCf+4RjdUWVE5hn+g8KdIqjNDqf9KZ6t0E+CMTsiwB3X+yJbV1EVaT0f5rtvR6wINNcDPp2/MyEXQlxy6xcbzHgkeX0R6LFuZlsKWiTsWvAtMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803444; c=relaxed/simple;
	bh=ql8LGLP+FbssYsb6X9SkqbxuRTizCwXQDy7f/v3NOK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGfnjbARu97u/8NLrha8Z/fo4Ksc5ykdD/t2RzYJWf8u4LlPxWpr1i4wXPTgGDsKrQtyLcf1FXSOMz34c1Pw1YZTn03DU/GkWts5onwwzZavccU7DdK3CCzE8ZlIo9wYpP5emd6iLDGnNjI3UW/9ZGeffCd+7Lz7PXB1rdyVugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R55/N2tl; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R55/N2tl"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e17363b97so212324066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803440; x=1791408240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ql8LGLP+FbssYsb6X9SkqbxuRTizCwXQDy7f/v3NOK8=;
        b=R55/N2tlfKi/TzSJhou4ccC0LR7owi5hDDjl6evHqBcCduqk+EaL/+brIlxBExLovy
         YK0/3s5tky7xOoZG+ezLUxZcnDsgXxOJTo2G0x37Bvk6rdgY6x1JoUpdd4iUDiLs6ISR
         aShW4lhXjcfqBRo811fxIXUYCe7tPwxp1s4+jAQooWEh+P3KF9+uFc/Lf5R73gwlBnb1
         ruTqAKp0yiWsRKDCtlRpvBzHO8/tx3bMjg5CuCSzazk3OkvHLPwW0DTJbTC3ZTZ4wd+m
         XgD7X+bHeOZ57XpSNz7gQHGxVYeBGkH4rzY9Pn3MOc5z5a/hDIskQw3uGQuvh70Jx6cm
         NlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803440; x=1791408240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ql8LGLP+FbssYsb6X9SkqbxuRTizCwXQDy7f/v3NOK8=;
        b=IPfDa54se6dts4N7MqtJd/93b35xXSg+AbFeVZcoi9BU05O0zhEwGIbS+hb0GRJeP9
         Z8xppRR/eRpf/I4VO6Ku6NtBsSyamn4E3E+davku58QYyfsCyOM38rX/sAAowzUqHZbS
         mkg73DpINSFEua72B59944X8POfDXmmUtj1LdGHmnotamhdPHkhhk5WxnIzgBA3Xjhgr
         GYBqPaml3W1N6jOTNNZlT/dQoZU7Im1wLaMdS879M9vSm4sUBzKc+RGdcMS+i8puWFsE
         GP5W7aY0vW8MCOZZmXLq+ePC32u05CO8uRUlO91WnFcy9lTUjn5uEGoY0zX/RN0M5EJP
         jnfg==
X-Forwarded-Encrypted: i=1; AKwUvBwdo4SG36GRkVYpRUnm1yfWymE7sUysgxDIWjyK6fMxcPBjDY31GSXbMURZJyBy48qmejgEWsn3KmWDnkg=@vger.kernel.org
X-Gm-Message-State: AFuF++ms8VCiKGg5Fe2hCKcmkayW8yth8DzrgmNux/8tZaNXcRjtsp9k
	uSQDGstzDxA+jWa0fBanJH5TnxNe85G97PNQ2w3ZrevnnXP0OVA8B07I
X-Gm-Gg: AYBFou1umlh2j0K33BexvcNBvjHGBmKj3ArTuvEELKaoyh5qSMt9j67dTDvB7NNBc+9
	EszeUqgvdU1MkjT6wGAJ7C9EU9X3fIVKlrWW7J3CLj62hENMzmjzL/ooOrr6N03qX6obGEx7QSV
	DLEbtVgz6lJEAVWJhy5WBaN4yXJ60eJRHhlQYhvdQSWTOtXSxXtg2EoluyqhumUSl7aANbHr4A+
	JtXTCArTz3YVsGIA99N5UbTXbK+SzoNS0qoHyTD/3QXyWvTqT2Hp/MyjLj5j/Sq4/69h5Sq+QCp
	34PxiOWZNI9xGyOrqp7BhLA2Ti7ugsEp4atVHcTFSeFp7vZqGw/2HCBzhdH4FQMdDyA9g3PjkDy
	Y5z4rL/QDugDJkSdTYqcYuJUlxhyPYm18Leue6AvScR9Q9no1S7MMsfYyAakNBJMyYmCNchxTEx
	Wx3nyRLGQzcqKA9XNlZeFeznklWGO7cAqh2D9kroZuvglp6KeRwB5CdPJRf5VHQeiA2gFVk4dv6
	qjVYYeT2Re9KSAoVtzGGdcHJG5l6ekQUc0qljrUYSQyogrrro1S1u7Hn/cYtjVuDXU+GwcymtGh
	Tt394ifgi5YC9s2vHjXHgvbR1/o5dfU=
X-Received: by 2002:a17:907:72d2:b0:c2a:fd39:f23b with SMTP id a640c23a62f3a-c2e23d6425emr246236266b.24.1790803440171;
        Wed, 30 Sep 2026 14:24:00 -0700 (PDT)
Received: from localhost.localdomain (83-233-221-82.cust.bredband2.com. [83.233.221.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d867ffsm57071466b.59.2026.09.30.14.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:23:59 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qca83xx: read resolved QCA8337 link status
Date: Wed, 30 Sep 2026 23:23:47 +0200
Message-ID: <20260930212348.1919-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <01a62e77-6c4e-4665-ba46-26d12b1c77b4@lunn.ch>
References: <20260928220749.857-1-yongzhao.derek@gmail.com> <01a62e77-6c4e-4665-ba46-26d12b1c77b4@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,=0D
=0D
> If there is no link, genphy_read_status() will of already set these to=0D
> _UNKNOWN etc. There is no need to clear them.=0D
=0D
Right, thanks. In the next revision I have replaced the custom decoding=0D
and state clearing with at803x_read_status(), followed by=0D
genphy_read_master_slave() to keep the master/slave reporting from the=0D
generic path.=0D
=0D
> Can this really happen? BCMR says there is link, but this says there=0D
> is no link? What does the data sheet say? It seems unlikely to me.=0D
=0D
I have not observed it on hardware. The QCA8337 datasheet (80-Y0619-3=0D
Rev. D, p. 328) describes the resolved bit and the speed/duplex fields=0D
in register 0x11, and says speed/duplex are valid after autonegotiation=0D
completes. I could not find anything there about the ordering of that=0D
bit and the BMSR link status across separate reads. The unresolved case=0D
in my test was synthetic input, not a state captured on hardware.=0D
=0D
In that synthetic sequence, at803x_read_status() reports link up with=0D
SPEED_UNKNOWN. If BMSR stays up when 0x11 later resolves, the speed=0D
remains SPEED_UNKNOWN until the next link transition. So switching to=0D
the helper does not by itself answer whether this state can occur on=0D
real hardware. Is there a QCA8337-specific rule about when register 0x11=0D
is updated relative to BMSR that I should check before deciding whether=0D
this needs separate handling?=0D
=0D
Separately, I have not yet reproduced on hardware the case this patch=0D
targets, a QCA8337-side SmartSpeed downshift where the old code reports=0D
the wrong speed; so far that difference is only shown by the model test.=0D
With a two-pair cable, the link partner advertised gigabit and then=0D
withdrew it, and the link came up at 100 Mb/s without the QCA8337=0D
downshift status set.=0D
=0D
If you know of a link partner or setup that reliably makes the QCA8337=0D
side downshift, I would be glad to test with it.=0D
=0D
Thanks,=0D
Yongzhao Chen=0D
