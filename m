Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819606;
	b=WBcv54Fop/mSTO8T8UnrueCWJrxH9nfPgBVY56h0136bOOhefp6hLI99j3QFt8SjlNk1
	 1bWluneZ+HS0pxCBKcy9kJm2xK6fxT1goQfQOWCtVj41oer8QW4Bb1oBt+fEc3oejKBTp
	 QzxtxcHNZxXLrnlsPDozqPPhDtkY5IfvIFG1/TB3U3ZbXlcpgyb6L82Rh88AmZQ2Eqy3r
	 ywBH1ni2o7SlB8MsZEm68eRndqo12mZaPkwILHeBnZBR8PK5/AyQEHf0ARMdS5mgpvegU
	 C+8jD8yQyPJBc3CTGkI2JmqR6jh4eJpi/0qGXwab0/eBZlHbBinRzYjoT/eHujuvKdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
	b=yoIR9Gt8zwcYatA/jyqet+ftXyyd6O/LaZNc5Z9T3K5pBcJhGyOg9nC4PDdmOiVP2RIt
	 kKXS2Pp6huyhs0v+rJhRwTPIu8tWWB3Y1U22PLcd3Q+hIWTlWgL1X+DLh3RZPrEb4yFWe
	 4aYh6rjwsUYBbbCR+RBsddvXq0frfnvjcySQ1MbM7b7t1mq358CkQawoa+vK6GgvKYg5o
	 Q42zQVpFNoq8yBjRfNTXfXPMQ0JunVMDnBtDG77s1pGprFKIr6CKNflVUwgCvwsXz4k0D
	 i/AqRpNPFNp5+1cJo6MMkyxK6uoMsUamWf0IRD3nHqq+yOXlM9mdMpv2qSnPkF9Kp0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNfvVtRt;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B4C606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B4C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNfvVtRt
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43bf9548df4so4517120fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819605; x=1795424405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
        b=tNfvVtRtVFeRRn6F4Yx1d12ky5HuQRQs2iLfreCcdSy23EJ0j8AB+6MDzN7qAtW3TG
         Xkg9tkpLQ9Ycslf07hEjqdo5C6YG9Ze/3eLBP8KZJycBbohlgm2+zOdATtDnCyugMaz3
         eY9dWP3Q9pWhM5PFi1w7+b11LbCoeW2fVYvq5KM92aSPTm+TGN/d7NYkX7hnWdj+eNV3
         0p8sCnp1eb/TccoVzAvnXjHD1dRS+shv4nQlHZ89ZOl4EJ1rZuqqfgco4b6XBW2mfNDB
         R/5X8q5ShHuD2k5iHoNuqywYlRPASkWjGakYGodZ6eVAJWosO/EcCPpM8w33jGvlQNyy
         O1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819605; x=1795424405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
        b=lYAOqNcn+jcHipTVjjaELBfDsuR/MXCv1zLRsJc71zoR08avsKWpi/IwvhsZ2iompg
         et9bHGcgaCrYf6QGXwjGHWTPUaCiZ+iXcL5zQv7loImLadLndM87grqVkPGWmGNBPaPx
         DtJNb+7RjhkI/XHKCe8IYuP7gjeEcIcodYW8CNnG/Xm1AbHOYWRr7ZIOeqdjA7H/VAPE
         z3L8Yc8GncKN1KugwPnDrYxidESgHWMOIgmyFvlaaDkKt12QCM91p9lLmoPD41u9owVI
         jCJXcChjBkf5LMBVMwO2GrvGYF4TMpEf4O/r0dKYJnb4Nk1fWC7wP4rOz7ZhAzHMvGA2
         KqsA==
X-Forwarded-Encrypted: i=1; AL+hErEeWdAKsgdo6Oe/ywR5NsBUnfoe1eIkF0aFjVGXLcrSTbYOqDcuTv6904G9kPDoNtoWGZkgAVxXFekMBw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HCvh7Xkk9Yn9dovLXAMoHeh2cD9CIHxrODNrC/Sz5uT9/EIAm
	zNxg0MFw5Gj/oBNVBnOy5yB0OU0nX4kLHTSKzzooozrYHaAjEdWljioE
X-Gm-Gg: AYBFou2lj9U1KS1sg6AXIQpCTp9zPixXaRBPIYt8EB8wl4o/BjpMUlBqMVowqdPYl6M
	fxS8N+Ij03UO1PAChlYXwhyIxXnjjzovo5d4HtgV4nj4rQKjGEthi77JLXFQRgwIbooxPrbDK+E
	goLXjQdPpzK+B/8exuZwZ6LNvDIEzdUwtkbjbuHrfdMaWmcTdTdwPD6NxHK4tuuadiQ/yx89y4C
	cIzM/xhpVMnmx8wyvIVAOjyxldXBddU4zgVZ4x/0O0PTfI5lrJgJxWIHCU3gCi3Z+CmzfyY8b9L
	3g62ld7v8h0f33D4+6085SHSBWs7DL/OhpwYorXZNTLrEFUc5ldXjrqo7TPPc+bVTrjsjBHkstj
	dOwBtop1g0aAuLHHJQ0KtZlemCA8VInDDRj7Qgat4cOZDru9iwATrzxen2GO/IVrqmYP9Lc258Z
	t+jr41rkIMvQotaGXCxVak3IDWbU/FZ9jFa/y9VcLQL2HNGHIgY5KY2QmQxVOuudGQeI8skaTkU
	FUrvyBnP3mom9LUabnai2OSPXNrgZZoOA128CE6xrUcxExsNQISCbdoCFoHEVlCWrJVTVpxIeQv
	xjuUvYWvb9KHudbYm5wDPDzHjL7X6LR+InhI+QVzOVQZp8ngEuPVUzmo6iMB7LhWYznN1TS22Vs
	4ANQEJ37TOKrud3s/hx5LS+PSwszYq2A1VtDdS6KFFFDIxn/tjWhHxaNGUxEVf6RyfYkknwMexp
	0mp3nvsYMLSNnNclmB8oXaYzkNAoZhpACywM7RtIS2h0RuauBDIw8=
X-Received: by 2002:a05:6808:4d06:b0:572:86c8:6b4c with SMTP id 5614622812f47-57286c86d22mr4614870b6e.6.1794819604482;
        Mon, 16 Nov 2026 01:00:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 01:59:57 -0700
Subject: [PATCH net-next v6 1/3] docs: networking: correct the PHY
 statistics group name
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-1-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The ETHTOOL_STATS_PHY group is exported as phydev by stats_std_names[],
but the ethtool netlink documentation lists it as phy. Use the exported
name so the documented group matches the statistics string set returned
to userspace.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 Documentation/networking/ethtool-netlink.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..8659761ebc69 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currently defined values are:
  ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30.3.2.1.*)
  ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*)
  ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
- ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defined by IEEE
+ ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defined by IEEE
  ====================== ======== ===============================================
 
 Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in the reply.

-- 
2.53.0

