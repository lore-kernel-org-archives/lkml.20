Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513066;
	b=WduFjGKEaIH5ZwU5wao6vt2BQ7rtZizjLO3nciawEEvY7m8XsLvj10wfDnNquRFznOaM
	 2Z+cl5TsZNj0T3QG0LvqkXqHznJOmHCLwKnOqebTzLSYgkjpxRadQK8HR1ERgJLcbokJS
	 nry+0BSnAWzXV8dyn6BEpRz6WKIPwvayPW7vbzmBShBkBBeJm78pqpc2Nez6bRGkYPLP4
	 cS91UQ9Dk391fNPfkypG+NcEflDI+a96YH0EbLJIISUWwPh0jVi8ox/7uQ/1goZCYF5gK
	 ayBcrxxs+7CV0Kp9br+nzMh0x3NxQbGzPHDRiSiW9xz1AYo0Bo2kMKScvNP0V+SMFdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4sBh+nBFEA5/3EJyXfrs1yFjXDyle7tyvTdRbgrvWnI=;
	b=4206eK3uSeWyVWL85pa8VYjMt/FvAaoWPPsS1d5O3IU7drT2r+ss5hs0V5PYuDaq9qgS
	 auGasgrzYZX2fHxBc/lTbUonAWvHYo65BDlS5NmpciFwTh2CUH+Zh4Cd4ml3otv+vkJTu
	 18cD0DsAV45S4cij/QVZlEQj6UVDlhOj0XEZYU/PGdOvkxEUKJAQcGiLTjl0PtJPA8G2C
	 W3lpd6O/jWDMwXZMZwX7niSX7tMueGAzgpfnNASQCzXVxqQp5V/C2Kjkt5J7x4T4V794H
	 WUuCCesHJ/ykQX7ik0QRngPAD4Haq2ett4U/AY6a6Dhm6iTYX39MOte7U99bX4JQiXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UdjresWc;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A4360A2603
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A4360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UdjresWc
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c506094fd93so8231266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513065; x=1795117865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sBh+nBFEA5/3EJyXfrs1yFjXDyle7tyvTdRbgrvWnI=;
        b=UdjresWcXLe7Q+ZgY7lDKfKfmMNVkus+3Uz5gVauAKT4odes5eUDTd8KnjdSeTStHZ
         g5iiyw0biPXWG4F8kYC6+eMaL94Or+l3CPzoOKIGFTOQPa/IthMQk1MFw3bkn6ulgYUj
         NlIdHe3Ahqwqi7xKMyPVGh8g4ic0wytR76ZhNhS1jLpMIL+4dx/oYtmaC05MzGXX5qg8
         OHPMc0VY6R3Udl0DiYGHkWnrldEwahy+xt8tuKW7j7Kl/Cx7sFc3oteUu0WsitS4fhn3
         KJhcPbV4A6xw6jh6Wbyz+m7w7LxURT4j+dNgPm4IT2w76nLeSxlXbxjGnxXBy0/e6Suq
         n03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513065; x=1795117865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4sBh+nBFEA5/3EJyXfrs1yFjXDyle7tyvTdRbgrvWnI=;
        b=MU4cSVMB2CWNrWtjamSguRzfUBrFNdMTmQCdYcUBpKy7V8q66j4sTGxCikTl8SwudX
         9+/bEso9jc4rnjPSbnR/HnmpU87OEDBiLz4YUIU0D0CIQQziFlsZPA5zIZ25ipl3wv9e
         kJwILikDwmrQxOgLhxLOsbWJWh8KFpp7MeAGJDHZhTzEidnxGlXdaocvEygxc1hpdPOJ
         HY9fKAmADIjAONPoiksbx9yzrOVBodciRjBMSCnn0wWQ+oGNUKHfrhn9i8n3TuA5jXwG
         2X/oGmgL3lFXIwVjHGjpfOGoiwpZCdvM3Eyqj1wNWeigWf2DRSfJ9QnWq+V4GDXhWgVB
         4+xg==
X-Forwarded-Encrypted: i=1; AL+hErFt1q8O4dej6AmrMJ4MCGcsEC7yDbc+ECcwz0eLd2nF6mnKlkqgQM5R7NlS1x+VzWD5DxxD8z8UZZURw2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n1o+VPxUcdNWaSaBYsLeW2PrqGxAPmFJoN7mIaX4EEis5O9MV
	HL84iX7iwfhkau4+T8J/pwMKAFmNjKhfTIEOB6OObStFCRuO55ei8Nhm
X-Gm-Gg: AYBFou2zuGCptObZLGqjFkjYPgQgxPYcifdH3N/ESao3AgIuRI0jkVGkaDgaFnJGAxz
	Hsnb8gGmV0oD55QNC16OH/bbNyijyIYVOPeRbGSR6lXmDKT16xabtX6TKT0YBab3u5n+XVmXOo+
	fKi6CGbpuhL0c1R8ML9CC5yUyQbPwVyEA/KulYTI6/rJ7pqPuSbDEkB1eg/qoRV3Y4y1V5xLNhX
	NGpMmrU9+2aFXHADJbEVMTOgNS+ac/CgvPPkdZVvelJz8yRlj22cevDFi89eD9DCOSXrK65comD
	1KQSvbbeeVnaTAVKS9cwY0CC7aO3VFRhJDJh2sGVqIBOwHMc9uo0dVnG8Tr4Qo8mVFuD6Gc4i7Z
	nRHCbxm+OSLHEI+CqS1FzttBmE7oyoZzET2apSH+5vfm2ABx7Lpy9UldwEJJxl4gycSA8fLkXr5
	uulGSk1lsxXekpxCcTQLEeKr7ILalvuQnA4o5NHKmuU+GLf0X6kjT/vpsmR7/TFPf+K3zkRBMll
	cr1kqXZuxZSb/MfZIFqPGkn/PFZWdgilZHER+2SBpOxr/t4ED6br9UqUbzus9HTEkaVGrW4Ec35
	GuyDJ4mt2K3lINV/PeIchZpxl/x+gFdbos1sdjHN
X-Received: by 2002:a17:907:8690:b0:c40:9b75:84af with SMTP id a640c23a62f3a-c5096327497mr29012366b.8.1794513064371;
        Thu, 12 Nov 2026 11:51:04 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42782sm11727766b.38.2026.11.12.11.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:51:03 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 4/6] net: bcm4908_enet: unmap the buffer of a dropped RX frame
Date: Thu, 12 Nov 2026 20:50:49 +0100
Message-ID: <20261112195051.597102-5-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112195051.597102-1-kudzo51@gmail.com>
References: <20261112195051.597102-1-kudzo51@gmail.com>
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

When poll_rx() drops a frame (too short, or not in a single buffer),
it frees the buffer without unmapping it first, so the memory goes
back to the page allocator while still mapped for the device. Unmap it
as the path for good frames does.

Found by reading the code.

Fixes: 4dc7f09b8bec ("net: broadcom: bcm4908_enet: fix RX path possible mem leak")
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index a28adef03..7f80e4e24 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -658,6 +658,8 @@ static int bcm4908_enet_poll_rx(struct napi_struct *napi, int weight)
 
 		if (len < ETH_ZLEN ||
 		    (ctl & (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) != (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) {
+			dma_unmap_single(dev, slot.dma_addr,
+					 ENET_RX_BUF_DMA_SIZE, DMA_FROM_DEVICE);
 			skb_free_frag(slot.buf);
 			enet->netdev->stats.rx_dropped++;
 			break;
-- 
2.56.0

