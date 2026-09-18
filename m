Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D5A3C769B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696251; cv=none; b=VVUH4cRABf2V9wg2z6PbTM1EB//7OVAUIqCmnlxi+hLFYso3PCEVl0Ven93428ppzP/EAB2/TY9ClomNErBDbv2fyx0UR6Tv2/25AaciHZVyik3snhBtFBi02MnB3dsAHEl3aWg02mXwDXa1r9JaQAOSPlubdrdWLm6Obh0CTJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696251; c=relaxed/simple;
	bh=U6Ifbz5x0kVweq8mt/nG0FzHuV5MzqSu4AL+yPCKtnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jikiOpawEfPoC3GRe/1wEvzhIOHr40zB0z6JUFHHHkHTZT1Tqvqy70xH5S/5vJ/QS06Os4pvhvFOYDyFfZgFefI2mVAtWynTGSN9DetKjpDmUDTSQOykZNQFXoaQ72TBD2jkn7AEWeH9Ah6OXQGja5KVc1Axx1MpMATyAlixbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=hSrFgtXA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="hSrFgtXA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so1005615e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696234; x=1790301034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4QKzdzhXx3trVjHguVbL/tPhlBogzEsqfZIRGP8UlI=;
        b=hSrFgtXABYXnSOExmVjFqhtGmU5DyE7hDkypLTvCcKKpqkFJWJnFee+IPpdiSX2+Pb
         UbwMInoJOpbsSc2WxidhFtjuwpeS1OYbFCByRh9O/mIKgPAmEzErQHlUhdDR7exurQu8
         4PsgHOx/tkYaBOMjOfBLkkJzk134djbsJv/uUzwpGo5PKUxNO9ukVUnBiv5DrJkycLnL
         iz20N79ktm0wezPLKPUxz6aRpDg/z+uHyB5BVoVMC1c8MeXay7YXbKYeuXbCs6Bz5wNU
         by9A273MpD2OSkXP1e0ufghFo3JyQjfG1CNS+AVBHT9wFjnD3/GiJjZRvFoNbDBmb6GY
         4rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696234; x=1790301034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4QKzdzhXx3trVjHguVbL/tPhlBogzEsqfZIRGP8UlI=;
        b=UweMZ09xzGpcN8q1s5tTzNzJxpfsn5suQ6LIfNzC4w+/oUKHtqwCbAYNZlXNsVyXer
         3rH+hwqd9sDCmjavRTWrDFbW7NrXINxQGDWsZ8iXttIafFGLEzUma1t5DTCgiR4Ql2mo
         yih76wys+532VX+6Mpuw5zfQI6vtjySqQ7HWptRPGeXPF3IaYv4mfYI5MVM29wmsdj6K
         uY2l0mIT54sQC0NOomJRAtV14B7kqUclzuiH2AhVqc75SIERx8+h48yGcGKGY7eHG1v2
         QtSUv38aUIHDikCsrNbOEkylY37tLJumcu6QB3pYmoHOxZz/yQyxXJ/Tld3oDeArbiCL
         d5DQ==
X-Forwarded-Encrypted: i=1; AKwUvByZh+EDSMBki9khWGO/ooqgV3R5jxmYagUvIoJewtJ7bFHM3oqZlV72Wrm61dDhkdM5LKNXTpTBRuonzkA=@vger.kernel.org
X-Gm-Message-State: AFuF++lVuGhUyI0UJkY/jyeV4hi+DJRYffjk14lla30km3PuVT3WTk+x
	vVVkQVSKRgY3IUH+1gtQOyu+lNy9Ga6Qw61YTuDl7p+zyoB9/PV9qYuA0qLm9OaqOLU=
X-Gm-Gg: AYBFou0uc/DSeSY0pbZUmajtx6QuIhjvxWwKv5ErBK1pebn++OQ3HmpxTaiPe5CalMN
	YiCgazf9U3P/vNwyXK1ljYVDvRq9HshSBA/z+/qXedgl0sB/pDMD8cJJpddEv5zr7xgEE/MQfdX
	5qlZ6RBNUlbaDGhLKCCJwdBbdqWMnB69V6jamaCYgQRIwUfM8VhdpNH+KLty0lkLfqvva85TKJZ
	kAmqEf0RwvfrlwzGRqT41P1OsXQrsKLBZb5aFnI07BBWCz/3eIQEYEr5Q6Rl2+mJSBw5Hhlz163
	3O6rspRHLHl75JgNkZuhfLuOK15VuUkXG0E2DtcLLhFd1MAvsJXfeyc9RrwuqBuElHNsSrdiNX2
	TdUPeAkgonys23tebc4N2A5X27IaHubOHaI8gSUlsvNswRsEALzrXJXcWXm1idjd7NUwFjBhcAk
	QUSDV+RSif6EDk3f7g1nyB+NyP0JVNjGgXZWAD2s++tu5jCX42oQY=
X-Received: by 2002:a05:600c:8b21:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49fc57542b7mr7295435e9.25.1789696234474;
        Thu, 17 Sep 2026 18:50:34 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200745b5sm64224f8f.26.2026.09.17.18.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:34 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v8 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Fri, 18 Sep 2026 04:50:27 +0300
Message-ID: <20260918015029.2518425-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015029.2518425-1-f@lex.la>
References: <20260918015029.2518425-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt this driver maps for its PHY is written only into
phydev->irq, while the bus table mdiobus->irq[] keeps reading PHY_POLL
for the same address. That table is where phylib records what the bus
described - phy_device_create() seeds phydev->irq from it - so the
number lives only as long as nothing else writes that one field.

The bus is the one this function registered a few lines earlier, so
record the number there as well.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Compile-tested only; I have no LAN95xx device.
    
    No Fixes: tag, for the same reason as patch 1: the write has no reader until
    patch 3 lands.
    
    Teardown order keeps the number live for as long as it is read:
    smsc95xx_unbind() disconnects the PHY before it disposes the interrupt
    mapping.

 drivers/net/usb/smsc95xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 42e4048b574b..130a460c1f54 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1252,6 +1252,7 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 		goto unregister_mdio;
 	}
 
+	pdata->mdiobus->irq[pdata->phydev->mdio.addr] = phy_irq;
 	pdata->phydev->irq = phy_irq;
 	pdata->phydev->is_internal = pdata->is_internal_phy;
 
-- 
2.53.0

