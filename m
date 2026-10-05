Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4FF4D6C2D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222418; cv=none; b=M1nmqys/N/mdP/tQu1s6R5rfYoZkVIxWDiH2Wlslgp4Hg5OaaKG9ucbYNdMm68k4vrSk9jItGfj+Zp/D3lZDoOkGaqAjuTP/9hko9X0WdrD7I4CrXn8xSdtfNTlGHdOHj1z6yveZcjGYZbqSvcOz9PaomF34sa3isccHWvQaXX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222418; c=relaxed/simple;
	bh=gi9qQGQd0u6RK7KmOikAumfojdyBJDeUrgOaoSGMIFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxOjKvH0Zkj9zFEQ9nOu8H88x15ttlvVzUIDV1bhhHQNnxFQQS2I69quVJNQEFXungeNP0QK6Oh6z2Q8lF3Jx1tY+8Z5V8VmRY/GKCrxwqk0zdnnlrv4BZblJtmoqM/Y+8VEt1fkqa+5TwzI2Fyu/uQB5Sl7Yxu4cShI4Jr6O+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC9nTe2D; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC9nTe2D"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bcc24e8fc8so942515e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791222415; x=1791827215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi9qQGQd0u6RK7KmOikAumfojdyBJDeUrgOaoSGMIFY=;
        b=dC9nTe2DcpLLMymUCLZlb2TluKcr6H80HBdezuV2cd1ho1ChsEYrf2l68tS81WGGtY
         8LP5RJi2+LJIyDa+/2Tf0JMgL6FhZQOWs0hxE59tCbl7BcpcmPXUtcWcpvsBnxYsnoHP
         inIh5DMFVp/IY/yVXFw8yoTVUmvsLAD0rF3ILzvdVAYYmYAUEDaYsMrHro0putVjXX3+
         4ta75AzanIfDPCucCU3GoYXYn8ME+zeR9O1nLaeJPTe5c7PYOiUkJririXAE8WNbglW5
         5Wq8mPCH/2XcT2GcBeYIHYwfBlPsjFpXHM+Z71/YLcftDbk4Go2xwIsujt1vLNQvxSk0
         K9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222415; x=1791827215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gi9qQGQd0u6RK7KmOikAumfojdyBJDeUrgOaoSGMIFY=;
        b=xVQ9df0eS4UzfS1TSb46DkI0u4nO7tzal/+wGkiqmzjpI2Cy2QHIkTqFEm6IpOBuu/
         h4a6W1Yxu74XYrLNwliGezhNOs231ceMmvucKZcFX5r5026r5LerwZnyfY9P21Aa63bd
         CmKVA/5cwOl6GMyhQUFW0V65ieUOE4AhEiMF3XVwbvBe+xRJ/wLRjnMsGAimeU/WOCvz
         hScsUTMln4WaCm1HwAB1g/bnkBk6fXMLxjSIgdjQ+du8lyp0XT5sd8qIXX/AibUIcKAe
         PNNWIRL2NH7vGUGXqWD+wdPHNJl7dOqbjIxxLNLqr++uDjskUJmNU7oUM4vrISjV9PxB
         ye9A==
X-Forwarded-Encrypted: i=1; AKwUvBwSgtiBZFmbQWH5+VbaW2HH6adlLuBSOl+pU+/mUPwLXj2B6/tIAyBe6x679h9a2NqQ37b0P9SG3WX4j5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOM+yui5rImAlJ36h5AeL2jXbq9oXllJeb7aTbwjcZOMl0zIQG
	kSiCyrQIcBZF+HHQC0BSTrM5K9JPCOhlA0YZEJZxd0ZGWiuB4tIhCt1C
X-Gm-Gg: AYBFou0O3h/8sc/tGmvmGcgwFcbZAbVslU5I8dkggnzoFHsyb2Ij305Ir7wc6L6tcTC
	4pdFl29T/W8wuDmna71QuzoiAY7sWMtwQf3DXuV23rgT9tUjCQC/zq2XJpjVRLYFDGsU9tspMam
	c6yhVac4bZyg0idvBCfy8PyHqBsK72YHhFv/kpIUrRHqaSyvw+zLNcLd81VzHenOm7rQHhp/nbi
	o84z5XfBKIozTkBkO8dAg5gmm6S5fVvvV+tg670fSp00umUhVTn4CZspKtW2hGgMTtG1kmBLI8D
	98oJkKRvi/Am/FeVPulDZ9LALi2/OSFB/A4O1NBvJMsah+uXfWvPwWLnIAuZLeZYExAGghmQQ44
	FKaVWllNCsxiM2ULVMXPuwS0Q6n6eRnXgbEwDjsGzw18DQXiUFc5F0USh4UcL2jw6o7/piaWU/p
	d8ws+oG7WszmQYt+4BFC53pRAR+/R4sBonPry3Wwt1ttZYWacgBzQI0uABw2b7z6XlZJuCEt1v5
	p9MnlJLcGjd34tKLWIjOT+JDC/rww5adswf5Ck/AQxh73uX83Ye
X-Received: by 2002:a05:6512:6696:10b0:5b8:f780:5ebc with SMTP id 2adb3069b0e04-5bb93808e0bmr2703834e87.9.1791222414595;
        Mon, 05 Oct 2026 10:46:54 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79f7dfsm3334195e87.58.2026.10.05.10.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:46:53 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 13/14] ip6_gre: add drop reasons to the transmit path
Date: Mon,  5 Oct 2026 20:46:47 +0300
Message-ID: <20261005174649.853236-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179114765080.434549.7267204104417826416@kernel.org>
References: <20260930183910.3151873-1-littlesmilingcloud@gmail.com> <20260930183910.3151873-14-littlesmilingcloud@gmail.com> <179114765080.434549.7267204104417826416@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 04, 2026 at 09:00:50PM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> This early check only covers packets without valid IPv6 metadata. What
> happens to an inner IPv6 packet from :: that does carry valid IPv6 TX
> metadata on a collect_md ip6gre or ip6gretap device?

...

> Would it make sense to guard the test in ip6gre_xmit_ipv6() (and in
> ip6_tnl_start_xmit()) with !t->parms.collect_md, as
> ip6erspan_tunnel_xmit() does?

The drop predates this series, as the review says. For collect_md
ip6gretap it is a bug: on an L2 tunnel, frames from :: are regular link
traffic. Duplicate Address Detection sends its Neighbor Solicitations
from :: (RFC 4862, section 5.4.2), and MLD reports are sent from ::
while an interface has no link-local address yet (RFC 3590, section 4).
I will send a fix for collect_md ip6gretap to net separately.

For the L3 devices, ip6gre and ip6tnl, I would keep the drop, as
sending a packet with an unspecified source there means forwarding it
(RFC 4291, section 2.5.2). What does not fit there is the reason, as
there is no loop. I will revisit it when I send the rest of this
series. As Ido suggested, patches 1-3 and 14 go out first as a separate
vxlan series, and the other patches follow once it is in.

pw-bot: cr

---

Anton Danilov

