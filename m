Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459239;
	b=MU2T8EXrhvodQF/etF2tnqN/eRrY5MFkQWSIRNzSJ2zIjhMEPh4PDRuGmZDBwz09+g6a
	 wKi5NQQP1GXVjuzAAjrUJZvNYmHtMptKyys7+pgtETQ0N3VHO0w/EDCjHQ0J5I57v9iXM
	 ANu6/TztyVzuFdA3jsIirpvKvByKc3Nm6X/MpzIc54u3isF97CwCNl7b+Y55QkUKvrUsK
	 KnGXPV6HmUbXVEMbTBNGyaIVrOnLlFLLlBd/djRB8otxsj5UYuScm+qvV7rw/uprsfUTV
	 66SZ/aBlUuz295YBvJbq8mbt4RdwzUTfek+Y+EbzIBBIEpKiFo+140fWALC4hROZMcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4jn2601OzEvO8sbqF6xpAZyXFL063l49lfq4W6eXEhU=;
	b=jy1YXHdxYLljHpNfiiZH5dulDWCgIAf4x0gsZgR2K2yF34h+Pbd0P80dOn0/CTYQlDhq
	 AQTJvq0tIb9eNv8XBCS1vloOt+YCUGn63mU94KJPVBbluJMW4XNU1iyxEhjuxLKdcKVGK
	 UqgC+K7h1q6Xfdv1erW+scwMyU/yUSeMuqa634aueAE5qfKJunF+DDFP9Y6lrfl5ZbiH3
	 8Q4iac2Ridlncqp/y/ZZQMo0PV8fivp5TEIKq/cQ+waP7qzLIFnTSncOsmnBpuDM73eIp
	 eBg3k+KyxxE2GADzayUrrWrwo1uXTSVHOPSNjPIXWGsdpV2+y7K1hHDHUqORiLvEi5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KI/Vl4Lr";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15320606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15320606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI/Vl4Lr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso3435319eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459237; x=1795064037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jn2601OzEvO8sbqF6xpAZyXFL063l49lfq4W6eXEhU=;
        b=KI/Vl4LrvvRBt4/mAUSdgGnjjqFJXwYtrPhXz9+z6Ui+qAKlsuRCXiAiPmzWP87f/K
         6IyV9r5RsM6oQK4fmxQOLnTHc1ujvznrU6xpGQDahIGaiHSbm7m0pZ1ynPxhSO/PR3QZ
         4VXgFd57h2H4ewkHSpZM/Xf5o0G5VojSb6WG6VDgvopfGZk3ztAV0/J3nEvsS/4i4YOy
         yqXux9myQ+jkj3WK64quIJFQ++U3oyxA9xQ8a67CINirAnyyHtvcdyv8vf45FPfdDduv
         zgAYrgf1GMTW91L/VrmT673crtyfSt6uL7DgyRuQ8TaYlfLVaUYzS0bwO6W2NagjJu6t
         R1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459237; x=1795064037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4jn2601OzEvO8sbqF6xpAZyXFL063l49lfq4W6eXEhU=;
        b=kUqA5Qgdxxgh6pZfyy/9QfwMnhcWJdzF7LenHAVmUQbflYCjHxnodYgiIKaqmoWtGk
         ZQUHKcfr87bK1xNH1/tN0XPT7FqG/tZs6jRuavZCzzrJx4Gy5ln84PzcgQrFLZgJXPku
         VDKmZ9pAmq62OJF30lOlVBKwYJkQPBvYcMxcFfYyOXFexKWmqcLa2T5Qh39i2FboUxmU
         4s6RyYcLnGhR+A6MSNbbcv18WXD85ZFkA5nlfCo2WOph7fGr2di7GZRm3lDFitzjlbfX
         GXc9MYuEkWIy7pD0nNKtHwlEYPCS5GS+/vHiR1XeT9YyFtdt6ZjaoraxcJsT9rZrk7g0
         Fz9A==
X-Forwarded-Encrypted: i=1; AL+hErERoITbj1zXsPxxuvuRBhSe6LL8f3GxHew/n+OcYLTu5DO/2hzl7dEw4LuTbFkY8+a9T7BNbISFUKNatuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qGG5YZ83rSWVIdq3idQMexYdmh849na9A04PlVtGp8JN4G03v
	NFA1Sb7FJuZ/i1iZFhggPrcHhsfoxbqDhvcazb37tg+1sNrv03//wKOu
X-Gm-Gg: AYBFou3ME2NMlo8RVej2dpQ3bdm4VJZRAEpAIJPJZ8inm1eSlWzEcOEj1mX9OOMxSD4
	YsESoPAk49Jdk8w9ucAbBvGiUxnO5z+KE97hI8pmrpSItBJz90kb4n3w0S+Ah7CmMQfmsGE6pOy
	65/VGRTUlWyeHoYW23no8ircFQAx/fykHNy9538zrR46faPPXacq+dENPIEPin6TcAjicAcfZhV
	hLS/eWUzPkdmJQQBdNl59aQkFpl3P9SyW9llXvc2UTSROPIG/5yflwcIQQtVpr8YEcLrbmETMfp
	nGdAdhpmVnCAeseP3cIPGMLqOdFXMF6gvN/wDRKISiPNFIYylhujXF96wK2n60XKKTc+rJt4p7U
	Yv12DnQfKrqCgnwWjsfR+dvks1YhKn8MFy97ZbppU1EoKqwWO4lE2WK7IUSrSiEcBYohryt7Y0l
	+DFBuGwgMPJu7UJ1BycBzEkdxPuABRrGupMt14H2q140w86ZRjvfSezbvfYKWaBl6m0GkvODexg
	gsGZ5J+ZFYcYdxQwILud0Li9xJJf84tsKy5xx6CNKajsPAWVXNwkuW2x7mCeVn9LWGoC1CR+qSz
	KePlZDhSTQ==
X-Received: by 2002:a05:7300:e512:b0:36a:1bd4:628a with SMTP id 5a478bee46e88-37685d72ae6mr5684131eec.9.1794459237170;
        Wed, 11 Nov 2026 20:53:57 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:51 -0800 (PST)
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
Subject: [PATCH net v2 07/12] net: au1000: fix buffer descriptor free list insertion
Date: Wed, 11 Nov 2026 20:52:49 -0800
Message-ID: <20261112045301.3669532-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
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
index ea8f7787dd5d..f127c0184036 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -581,9 +581,7 @@ static struct db_dest *au1000_GetFreeDB(struct au1000_private *aup)
 
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

