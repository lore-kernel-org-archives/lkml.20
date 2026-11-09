Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268631;
	b=zqC6Kn58dB2W0RSW2rHkSkQVdXB6xMP/37wUgG4nl18yQe0DC5TbKkwqfs2X/Uru7ChB
	 j193p5lgohwfWOzBp98snHJvw3YFBkChoFanynFgf5Lms2Giz2i5DNuy3MedSrXORgc4A
	 pmknbzE6Lftm+xWDLSBoFDEy1C3X4/9nYZ4Xwgrt6J9SWXmarlv09FoZaKHl8NIOj8RXR
	 8OPmSyh0wMnkLQx9TniKwwupCLknXnG5FvAjhGigzmfZDT1ecT64q/XZUebTqKB749COT
	 Dmrku760P+tlv3q6Kzf6uzUbpWjVJn9Jbmy1c/pJJHuoOQZ0xMes3UyKaMD1mesxKmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4QtPx/sfImUb2j3o6tXqSSTPDZ/xP4IpG3PYn+xcfLA=;
	b=aatg8UgpHOWT1DLeAEfCInhau3E+TFQysHGN0Dcc58Qzr/EMBjIjDUIm/ITuKGNW59MW
	 RpWKxbr0QMXku80W79tejkrg3Nx7udnxBWPiAzLvLvTjhek/mIB9oyhH0yjnLUJXDI0Ad
	 1iTioMFRaD+CHNGtofKmBUMuNlLthQ7rfMpOde/806fEvSAqlnSjqA2Kc0pMrhXfYAQW7
	 TivKnnbKx7e73Q/Wzt1U5+jzmBeT795oDqtzYVumgyp0CZWGQxc7irrjAWXZzQcuefX52
	 Lkthaqog/YMDyYjWG2feedJEg9dAvN5PsBZKmbBabPYaRL2B2bKnbZ0rohobp1CT0EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFhS9AND;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FD6606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FD6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFhS9AND
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c43373ae89aso30827666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268629; x=1794873429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QtPx/sfImUb2j3o6tXqSSTPDZ/xP4IpG3PYn+xcfLA=;
        b=sFhS9ANDj67M01mHnqET4gArH+2qoFDKb/2FsFvOS69CgWOuJ+Mti1so4OC8K/JaMt
         UQRfbA6jPzKkvBsOCD8sqR8uRFtD13GZ73yqUKLmSv/RDzXSHnaXXlWit8ArXJ0cNuve
         vX1bWb6UWP2xZd4GfMV2he77fElu+LAUGTpwRtew58D4eO1ui+MPGglA8q1WPNKkDIG9
         4m47kHNDb7Rbn4KH54NM+aBbp5r916ox5JWDL93C0ijLP8YdHAKsmH/csUscRoSxT6W6
         OzLoBfXNxfkjuSZuBazVsVWl5iv0UbzzPF/OR36ZFhFeP2Ks8tNYud/hWPBO578zs4dk
         Qa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268629; x=1794873429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QtPx/sfImUb2j3o6tXqSSTPDZ/xP4IpG3PYn+xcfLA=;
        b=BjAl8pTh2ziieaxZxHpqkXshMsnU1p2hVkKp6zbkJrLwI998lefOH1v2e4/PhJ4bOl
         JiSle0cIfabQiBe0Bsa+SAuYJbFIVpTsHl85DYHiJLiz+AOYeD2Qj30ShL3WZPW8C9/h
         AUJeb8XowyV4L2RzxaDeN1GKxWK1RuxZ6/D39TM7iLlJX4S6exC/hiLbu73/njxmILz5
         FIUBGJEP8fvS5U+UfOafrG6kPapkDjNZI1we2/zkye71zBnpaOqMsqioJJRuP7oWLdls
         R65wtH4nORbnrb3j1UWQvHDAtKOfcdh4hdlXtKsYDLy+ciL/XLRXtKsH/HUhhQA9WnSX
         yJKg==
X-Forwarded-Encrypted: i=1; AL+hErGlLNd/Cg2B450meO5qovEWdds6jiNp4DOyDLl5tkay/GxanK3vFRw4WI4u/4zq5uf8+fhynOQQrdASh7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R4F3sMVLjk/xD12NspdAppyIRYg+VxBYiVybO9iKAQdEQrMde
	rldp7LcrcDxnpShNwg41EpK+eBL+aQtMN8uFEnbB4FMO9qwp4rG6Rtnn
X-Gm-Gg: AYBFou1JAZyWPgUNegUF/8YpkJTccizZuatDNxEkSHhFy2aytur5ro1RkHcYVMScCYz
	P6m50cpi5Sihd+S2dbwVkZWqgeCqRPLjJAFaOx3op+roUqTG7uvb1f4AbO2yKdVQOup0Tqu6jOD
	dlCXWYUqKK5C/eEPiSKZ4AxMgDC7HN9HtxusoM2hqdh6I4gTDhqtZ8GFnup71Z7RqeXfOiqR6td
	/SP16u1yw2YwmkZY9wS66HK5qqHzup5J9tH4HNoqn5n4sqMv54IfnoDdKvIxaHq6gOtu7fC7jaI
	kd8SJRO/hd7PAa1FPUndPORe/+tA8jYwCHZ/R6Cmo6fbqnTQlyHVJUGKms4D8MfbwCtO5tYyfdZ
	x8tDpmDenZP+CUk/QypMnRP7Fqi8OEB69Y2tfWHbEQbaw28RTgfgWCtstod0qwbMMbLA8NpmuyL
	Je7hEu0LLOHBj7eCJ9N0YZdvR0zT7mM1djR8mF6iMnI83JoOwTeKGRUkYRSriqesnbCxC84uk9z
	ISZCyUaZuSkwrJsBDTVv95nAB6iQH6Qi16XXW/XFb0IMXTi1xyn0zVCz0rKT6MdXWTVkRTLF+gW
	mSpKD6UmNhqQ6oJQkvryz8bItI7GFKCs2QRl7OIFQy2NHPhlkEpzKow=
X-Received: by 2002:a17:907:9694:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c504922b5c9mr78004466b.1.1794268629159;
        Mon, 09 Nov 2026 15:57:09 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:08 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/7] net: bcm4908_enet: TX ring and DMA fixes
Date: Tue, 10 Nov 2026 00:56:53 +0100
Message-ID: <20261109235700.2586821-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
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

These fix the BCM4908 Ethernet driver; the bugs were found on a
TP-Link Archer AX6000 running OpenWrt. The first patch is the
important one: the TX ring indexes wrapped at different points, so a
full ring could look empty, and under sustained load the queue stopped
for good with nothing logged.

The others drop a TX frame whose DMA mapping failed instead of
retrying it, free what stop leaves in the TX ring, unmap RX buffers
that were freed while still mapped or unmapped with the wrong size,
order the descriptor writes before OWN, and drop RX frames longer than
the buffer instead of panicking in skb_put().

The last patch guards against something seen only with a non-default
RX burst length; I am fine with it going to net-next instead.

The same changes have run on the 6.12 and 6.18 kernels of two Archer
AX6000 units and an AX11000 since the end of September. Here they are
on top of net; each patch builds with W=1.

Kordian Chmielewski (mlody1212) (7):
  net: bcm4908_enet: fix the TX ring wrap
  net: bcm4908_enet: drop a TX frame whose DMA mapping failed
  net: bcm4908_enet: release the TX ring on stop
  net: bcm4908_enet: unmap the buffer of a dropped RX frame
  net: bcm4908_enet: unmap RX buffers on stop with their mapped size
  net: bcm4908_enet: publish the buffer address before OWN
  net: bcm4908_enet: drop RX frames longer than the buffer

 drivers/net/ethernet/broadcom/bcm4908_enet.c | 106 +++++++++++++++----
 1 file changed, 83 insertions(+), 23 deletions(-)


base-commit: 86706ffa990ecd46a4326f8eecbccbbd60a6cb8d
-- 
2.56.0

