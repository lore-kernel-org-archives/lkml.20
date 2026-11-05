Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907287;
	b=FI2UMDnl8sWcD4iMdXuE96OO/mgvQpstqvYYtQ111ZNtQOwybU60E6sc22tNMYjSvdPM
	 fTFG1GL2nj+7b0+FMzwwrdPxBf3zWwxhVQsdY/QWD+1ccixmaL/e4AICaIPonEuY05cxX
	 157sbiOLlfEaTQ2AeXASqyI//s+vVPOnxYTZVoqdjPdSx0QkR6pxTJC6FMHEeehtGy3Bb
	 hoagv6UVBrI8ugWRxCXNg5YdXQoj8WfW3ti3Oo8KnqOPZbu3z0PSWW8bch6fXjY1lGZYR
	 cIUUOtEZAd+UyMtH/VU6pZz+XRyFHNc0D1HIRf3qUcg3TXiVsTbJjYbl3VfNWx4SrNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Svx2OB+5F/Y9K9wuzVYoysQj3wgGVFkM/gP/phcnBkc=;
	b=G90m/EOW/3/b5xDkRUX/eyYMeu6kkAf4AhY6OsffZnV+HED6SaTFRrmbecp/iHxlXETm
	 AeUM69cnDBo17Qw4MRaS9rrJJIBN62UKsU0proN2mTFyS/XHGGDwmRJI0K2fxhiHIIWxE
	 vmabq7OnMRTfNcwFxSs4udpB9BErirsBlubJ7uqcw5p8J3/VB6xpTk3FXVEUO2WSjRzrN
	 2xft58IkPxn9flAgY4Iukq16UOAnWk92oinix8aZ0ENJJKYpCyE1hm2bV1MnQJiMiBRzB
	 kIaG//CDWZptsx9U0Ui621G7g1ZI+ot+rOKcWlTPD+uebYDDTq+Er82l3BLcPgvibhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfLzh0l2;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000EF6072C60
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 000EF6072C60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfLzh0l2
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so4366977eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907286; x=1794512086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Svx2OB+5F/Y9K9wuzVYoysQj3wgGVFkM/gP/phcnBkc=;
        b=xfLzh0l2vsCqCCdPQRfMs1ZN4FSXDvC+ZpFAda9llXVG46mE0arY6MvudKimUQHZJX
         5VDvlM2X6G2oGV15e4gxJkHk9m3LBdq3i7GpwUCgIfyCsL7aivloXlQ2+xLPF+sVvAUY
         KQdu9UK1zX9asOCqCsQngZeOElDrLw2C/kiXW49mGECA2/uwIcmMQS3jSp15FAQlcqy6
         VqJ0uhGBNvqesROQK2Rg4AOTtwUxyON4ZzbibkinXYgG7N0wQbl9BCGaF/YIL6osVxlC
         hd2HRWRNWJF4USO791FelnXoH3ikp7Kul4PMG2A9VREKPYUYR7xullxIOixCTL5qT9vB
         QfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907286; x=1794512086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Svx2OB+5F/Y9K9wuzVYoysQj3wgGVFkM/gP/phcnBkc=;
        b=SL8m9sRyZ/m4aOq8kNgVX04IMWjWtSszpZUbujkAziyT5oUBqMLIqt62n93NM0YM4G
         TeRK+w3izjtYkM9vIGpXr7CwiJmrMeWvnaPNTOkiQDkCe869DnpNFdGnGlS7o/VLhWih
         5cg6hpETIomQRML9EASS/udKQ2nyLhw/jU7fLaQOp2KXsyjDWJJBVQIQICnI5/HVteff
         UMzc7boglnwlp6LiQSOsiazXzcX3sosT8T/Fylw5qv/LATr4K829B/HkYc9cp1fqOuyo
         2pjpkCXAYWA3pw855N7qMa7mDP2ZEGr03vPUKvCpl65qPrQ86raFDe1FtYVrpgiTXADv
         Bmsg==
X-Forwarded-Encrypted: i=1; AKwUvByyGfreXNsNYu2xNsyokuKgGwqZpuIRDX4OjSAmcYdNhu11bysVCJj2tzqDqYcEbGkIUyY8tKLQ+tX3X4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I5TAi84E4JqPmePrF3rmHy4FyA/87SV/Ux5NNDhMZnHJjDJ7m
	xo1HlcGhkSQ9jykRls03J0lyiCkUlhX2eTsiXQTpyRNp3eM+wJPR7mNw
X-Gm-Gg: AYBFou32hszZQrp84GpBERxUkCu6LFiQhM0+BefCvWstro0nZaR4iFQijvwOZI7/F84
	18B/vV4FqmxKETOE43nNFLMva6fiG/yUZam9g3AvpBcEFVxHuuwz3hZQW2WCwlmia8opmUVbUGk
	vxh+EVgOIKQ4x48dJGEzwMJ8Pij4E6TfS/JqQa9eL81Vp4bLa1hVE5V9TH9qfCKZd20pPuYoN6G
	eLNsphLnj6XSAXW+uB2NmZfROdaq+zdDCdvgcStgjhGJnzNo7lVPXRm4330AKF/TH6Mk45eaoLD
	KRBUwNBTaLvCkTlKfujIFz8aunPUQawu2+/HsLtqzdahojxjSZuYNoWUJOiXykT2490aeQSGYjP
	stzOaj4/Mki1eq8nG3vx0nMAZNyjNmlPg55CMfRjAym15taVvkvxcKFhsAir6/hxSGVOzuW5dqp
	WyKHGI+zOzza+RLOBOvVzFtAaevqlAxbNl4AGybrcEPV/jjkc1XUiZXTl4XHZvue3uqKQkB5py1
	d9quTaP1gBDBzGbP+i7fgTwpK/sDL4MY//0tKQutxrkBPNXYJrMxi9ev4sbUYWlXnpIerd6Ovoj
	XR+GNJtqSFlRq+99NcGJ+JjWDQyYkFc=
X-Received: by 2002:a05:701b:42c3:20b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b2366ae854mr16753451c88.32.1793907285921;
        Thu, 05 Nov 2026 11:34:45 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm18023186c88.6.2026.11.05.11.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:34:43 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	macro@orcam.me.uk
Subject: [PATCH net-next 0/3]: net: sb1250-mac: ethtool link updates
Date: Thu,  5 Nov 2026 11:34:32 -0800
Message-ID: <20261105193435.2050321-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a few minor issues:

- Running ethtool against an sb1250-mac backed interface would not
  return any link information, although all of it is there
- There was no support for restarting auto-negotiation, also there for
  "free" with PHYLIB
- The kernel driver reports enabling RX Checksum offload but does not
  report it through the NETIF_F_* feature bits

Florian Fainelli (3):
  net: sb1250-mac: Add ethtool link settings support
  net: sb1250-mac: Advertise and honor RX checksum offload
  net: sb1250-mac: Add ethtool autonegotiation restart support

 drivers/net/ethernet/broadcom/sb1250-mac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.53.0

