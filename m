Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6D52E5B2A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618471; cv=none; b=aO0qGCRHxH2+prqtUHu5xapwo6zD8tIdzti8zOp3aUZba+P35D0LKjvKgS8Lt7zfoT1eQdvwS30+asXgjfCcBbRfEpUd7YeM1zpo9PpsMiozJswbwIaP2KfnMFIwlxskp5gNV5m0e2eHfLBuVfBb19fXwOfp2J/8ibERnMnfc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618471; c=relaxed/simple;
	bh=hCjncUcjccL8dLLQkdqgionB2mq4SnnDe6up7exhToM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=STanmvbgFExoqmbSdmcr0d6CFl4m3Hg5N8VaXsICZEcIj0gy7CNp3p8FxwSE6xmKYrgcwULHeQ9ZUjDCOv7ufZ0yv7caoivLbO+cioxP3/U1tgchxEDVYB/yF3D9+W/KFVZaGtITV7LZCTedFz7PlywOrUR45d0TRx+Av7H2H/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfwFC3/A; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfwFC3/A"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff6988855so1213835e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618468; x=1791223268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kfh49rBnp+fv8rYbtPwFIFAZ780+WTkGnS4eo4NPc78=;
        b=JfwFC3/A+g+/pwKCMx0IVPg8SXQ0H9Jbn0XLGlIFKutinPeBMPWwYQkZLBATaZ+F5S
         S/buuuH51QMU2IA65IqnUTRZQ+vXg3Azxs4oSNgK1x6H5VOyXfDDdP6OsNMu6l+j47+h
         Mf6oE7lVzDG5GarVZOS0oXzasa5plOdcyMu5lCmoiRN/AR4T5DgxflcN6HzrIrKjmn9e
         61rjp+kn2+o6SlRyKOfbRadUNmFVbMkDBHOOyhWwADncdR7Vg098fJaQqaxf+zsdm9yu
         zY8ztioiaCnfu08KZvq2vOUzJ2qie5lvhMJ0FOpIUhkkE3fTHj9Kp93Vo7n3VAwiUc8d
         ogdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618468; x=1791223268;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kfh49rBnp+fv8rYbtPwFIFAZ780+WTkGnS4eo4NPc78=;
        b=hrluQPgNPUd1YosCGGvzE4vUDHWvtowXfpMcv4mhpN1xhMTGyUEezMc78UNS/XkqSZ
         Y4brvZnJ8771NinnxRwLI7ZOb96Algq4kgNP4ti+JhMzoKr11E4VtNhz8/4ofv1NPgoT
         XELT7gJVHFCYg8Kqo7ghxrPV5wM6+3GthntPDvNaXD04YxyGrbocezbf/5Imq7hZmlOA
         hNyNjdNQUkCFqCzY/V3+7nzGWshpDn8s1PLodlY3b8Hli4o0aXMMSoGgnSS/hlMDEL7f
         4JSHaPBr2v+WvP1b9R3RqR+V2+GuTN3GKkC74mzeDWrO7DaMHZpMzUBAU3EfqKfximix
         BvAw==
X-Forwarded-Encrypted: i=1; AKwUvByDkTP0++o/uu5psoCNayJQG49b6Jyg4mYaF/iTjnqFM3dMlLwhZbcFxLi2c9YQjau00cXakw9nnarNxM0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRU1yIoAs+RUKWjefgdb2PK3qZaNjkp54wA4Klh28u3TTeBq3Z
	yw2NWpdcvSwBgohqvWIZoGnWgLNZDxR6xjY7ddEZw/Xej1+oZ/VRTY1W
X-Gm-Gg: AYBFou0/hd3lKyQGYiKR2Hi34467TyhktvdjHVS1lEqiH2dqoJyTzIt01FwB5p+Z7fz
	6AMTSGz2JSF6COBcf1vyZeA/Cq22HI/WvZyh6mBl4ZhaE40nbj9wHiX5BNxTSKikzYmXaGkcIbi
	9xyUq10ggTcE40TpUViwv6rxd1ug1M88J4Zv7F3iFujt2oPjnC3IRBFLIlZxSpQQ8LvZl74mg54
	RvAb/nupgcyPEQFUUO2EH0pMmFXx+8YLYJY642c7I8KF5R/I2ZPvcb6JTAPEEbeCUdCUqe23n0a
	LpMCH+kvhtqSLkSDR1erAjvwg5yn9k8tjMZHYER/jDZDLYVEr1kaU2oaZszuDKNFwCidKyLslwy
	S44MkUbTk9X/hEvYChnM2yD6mNjqiSJ/OX/RYMt+/dZN0iNhDWPMoIGVE5R5MuzWlMyO8xhyCyE
	l1F/h/vamxOmPdKvnTw8oL+CjWmoRdY8dHl2+eKtV5K3d71sJGyxeI
X-Received: by 2002:a05:600c:c48e:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fedd2c6dfmr164489635e9.0.1790618468247;
        Mon, 28 Sep 2026 11:01:08 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::5:c231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf4598esm10991745e9.0.2026.09.28.11.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:01:07 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Subject: [PATCH net-next 0/4] netconsole: fix target enable race and
 configfs read locking
Date: Mon, 28 Sep 2026 19:00:02 +0100
Message-Id: <20260928-netcons-fixes-v1-0-bb5ffe5e698a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBREr0JmbRNogQSvYlxAHfW7KKa/GBLC3
 f3K8mXemw3KLFScqw2ZH1GZk0FzqhCfY3rQyc0YvvZ9PfjOJZY4J3V3WaluCGNg0wbfTx2seWf
 +B0suMNX0teB6LLpML8byu8O+fwFeDvocewAAAA==
X-Change-ID: 20260925-netcons-fixes-93a3e14326b5
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matt Mackall <mpm@selenic.com>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gustavo Luiz Duarte <gustavold@gmail.com>, 
 Sashiko <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.15.2

While looking into the sashiko report about local_ip_show() and
remote_ip_show() missing proper locking [1] (fixed in patch 3/4), I
noticed a couple other places that need locking: patch 1/4 fixes a
null-ptr-deref when enabling a target races against a NETDEV_UNREGISTER
event, and patch 2/4 fixes a use-after-free when the local_mac_show()
callback races against a NETDEV_UNREGISTER event. Patch 4/4 is mostly
cosmetic but worth fixing.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-netcons_ipv6-v3-7-bc0915e8c75f@gmail.com

Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
Gustavo Luiz Duarte (4):
      netconsole: finish enabling the target before releasing RTNL
      netconsole: read np.dev under the RTNL in local_mac_show()
      netconsole: avoid printing partially updated target attributes
      netconsole: remove unnecessary target refcounting from the netdev notifier

 drivers/net/netconsole.c | 110 ++++++++++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 50 deletions(-)
---
base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
change-id: 20260925-netcons-fixes-93a3e14326b5

Best regards,
--  
Gustavo Luiz Duarte <gustavold@gmail.com>

