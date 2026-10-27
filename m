Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140329;
	b=im26RH0dYhKmgMMEwkQGYDnuvajj62HP3GpPKq7/AuQL/ZuNXlO6rmVyG74aN/eY15+c
	 AU2He5WmQ3h1/E8DSDS9oUJaySrvG35dX4xvMpkF00LRKDi/mOJof855prVgONo/SpM/d
	 CfG1V5cmWDcCKrxnWe/D0gdk7nrwco0R3AJ+79I+o5oIq4N+Wvf9z7Lfo/ttBDsBpd80n
	 50fBQRlEICzVI+o09adGGaEMqeh+L4UfW4a24LUvQRNLNE0A7CQ4/qbwI5qPOdqDORpbO
	 71PxyH/4KEALD/duHYSMBIFyZwQBUHEQokoiuMVC6gxiDeU4CKMACFHxc/H3R88gAMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UvtJxlS4Xn9a0ucNbB5dZokM03LeBqcphUz2ZEfTajM=;
	b=HfNWFR4PSVCplwiacChTQIoxzk6FwG8bEQCxquTBce3QlzrZm9HTaPcJ+mIofJHaAlLO
	 +XVrFXHwYrjejIZiZkpMdokQaacES5JK9xe2D4l0qvN5y7izFgg6QK0KVvQU52hVSofPd
	 uPZ4/nV/5Jt0vZSLrRMti0iTdk4kTv4A37Knqz48MlL2aLCpC7PDn5g7Zr5f169eWWf0c
	 tl6HSHJ3QY/xiSzUsSdpaZ/AiNhOVfTYLBsxdZIDoMYcoUxvhRlK9ZMwPB71H8ZuXLa0E
	 qRBWoxgs6xzUQTWiiwUBHYjC5y4WUzXpsMNmUUhDdxCSF+RMWlthLoSckoJto7AP/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ofb4mCsX;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4960A2622
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC4960A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ofb4mCsX
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3550c917fd3so514759eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140328; x=1793745128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvtJxlS4Xn9a0ucNbB5dZokM03LeBqcphUz2ZEfTajM=;
        b=Ofb4mCsX9h8Dr99UoFDU974S4WLkozvmMKwd2+FYDBrVC5CiP8M+aa/0K8XAh5LWNR
         M2I+1RFjqWOLdiPYCG+2E9JunW8yQzHK45gQlW0z0TM6uWPW1m7yo5Nf6wlKfsJB7Mky
         839h0BofkZTf5be1mpTZkuNE11lPajzDCb3opAWYTe6k6zy7ni3VAyOYEPUAztfsFMWq
         w7RYiCi/8CrfjqYHEfMonQ9jZSZX72afLv8IMv4YEavA21/aRXtTnegJJovJ2lWbjWtw
         kwDNx9YbGftRvxO+shqc972M2qgayp7v3pxa9jW11+pPryuAjQomYzCrt53EYzjNTMcy
         qwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140328; x=1793745128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvtJxlS4Xn9a0ucNbB5dZokM03LeBqcphUz2ZEfTajM=;
        b=wpKfb8OplS4/4GP8Us72JgwcoV18JECHoaaaozfU/2UAbGEC/mnoGu2yTQmP/ez56J
         GxNfnNmNLnxKvKea/5VGYHBMZ/uc360iSa9uhUVngmjW/jzHxARNRL7jgaHCainI0q79
         vlhpFMeSg/q9gg3vSIF2fKqTpOdymS7afoaHRAX1/Uefy6f3bjPgLn4NPejDJF+t0kGV
         rdLiYjPQtgshTXDXqXiKHgleTp4eOL8yNIK/n2OUQcMNGTJeL+wuBzxhIa/Bc+5EDQwu
         UZnD44N7NDqIq96GPKRBh19VDynFb+noTVtUSklTZR1dr4/gKSW85t1hmnEfoALQQRzA
         K0NA==
X-Forwarded-Encrypted: i=1; AKwUvBwqbgGHl+lTwphyUmrC0G5oQHfTS9ahHMzU9Pl0o5843PDhtehoxKJpUFC9US6TZxdySDhVHCujZjBs9NM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk7GFm9PVSEjkU1dZBTBN74iFhL93m2WischldZVo8J5NTKroB
	UKlKCkAebXzOze+VDpGxBSBFKq8DwD6Niw5iFzRfi/pCuElUmbEhjhYj
X-Gm-Gg: AYBFou1g5J2dgXoAcQfeQjd8WLSJ4bRtMPThGBhrQYTzMEY6//sldPlCYSFqWwAefqa
	XJ9j28MUT+5iov7QDWI8jLFSCDZwKAwPJ8jN4aXyydn08BZq3AynTQKHMt84DwX9o1yrJ+9D6St
	bTbD4Mix/wlG6y2kVv74AmBkbiiGlwPZ3APX9ak8UIA3QoU89iOL1SeMMy3DnJWleRSSxehdNxc
	yK9985PzRXUwXiadHkjN2lmBrMsa6vCboM+QoVPIoe5O5nzFgtXdct/4/pQmeyys//L6gv0SGRs
	ew+neo8mTtyLoo6wsQzDAZCuqsVgRtM4wX/GI23RWVWPRZoulBnYxmEpV/uxZIZ7G4z0oOH2rad
	t75JkZ7IkHGZZaVnNdCo8j3vfpMJ5NMKB2fvZMm7+MZntRbCH+2sKL1KR1ne2i3Kd7qZcHLmhHM
	0C/5sP0euiHtIv8/osSbJhAT73EKpQp2dPrxC1wUebt3QxZe89xeOTsx2p7G6GF5YmCblvTRKe9
	Vl2V0Q5E2Si4wiU/N1QssxTf0o5jnBzWNfXpqOYcwRzZGmrUETzfJpFfCHek9HDxBO6XdXr6zF8
	6DyM8g==
X-Received: by 2002:a05:7022:b0c8:b0:183:3c2a:ae8 with SMTP id a92af1059eb24-1a6d0b6281cmr811524c88.41.1793140328023;
        Tue, 27 Oct 2026 15:32:08 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:07 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 07/11] net: au1000: fix buffer descriptor free list insertion
Date: Tue, 27 Oct 2026 15:31:36 -0700
Message-ID: <20261027223140.3774570-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

ReleaseDB links the old head to the returned descriptor and makes the
returned descriptor the new head without updating its stale next
pointer. This loses free descriptors and can create cycles. Link the
returned descriptor to the old head instead, matching GetFreeDB and the
list initialization.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index c0e38a507f89..f8976e324f0e 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -583,9 +583,7 @@ static struct db_dest *au1000_GetFreeDB(struct au1000_private *aup)
 
 static void au1000_ReleaseDB(struct au1000_private *aup, struct db_dest *pDB)
 {
-	struct db_dest *pDBfree = aup->pDBfree;
-	if (pDBfree)
-		pDBfree->pnext = pDB;
+	pDB->pnext = aup->pDBfree;
 	aup->pDBfree = pDB;
 }
 
-- 
2.53.0

