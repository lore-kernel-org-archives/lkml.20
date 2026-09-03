Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40814A5EBE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439021; cv=none; b=Ay5z8IdgelmYuEld7+GddWl4gOKtKE8hxX0VfFVNA0JTsIIUPeo2jsTigQOsnzFnnijy8AH6PqJna/Pbc+hkhOlnDtAbP7jbPrfsl0OPQyVzkXPysm/R8NUdEhp+gRCR+gLVESOMaTwUlNqq4id18xRCnwNIQw7XYrB8OcJN+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439021; c=relaxed/simple;
	bh=brpeVGkdATm9/S/f7Zt0radMeEIsjvEyqqEBAC7TF5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=enXc1HjyB6P4joDmf8Cj+ftTpj6ch30+CPggraYBdMUEhCeqEBs3Edjx4yjViwOzg/5NnSi2lKfL3JqVjwAamDydTCQ/HXrhmrrg3mBlUegkf/qgsFqzZt/RDthfDExOQSE/H2Q9XNR8u/u9O74X/lT9V/3VWjQC0ta7MlK31IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Y6FKnRUN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Y6FKnRUN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1615099f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439013; x=1789043813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXagxsF6Wsx8TN0mAK3YK+Pn/X4rwuAoc5qw2yFfaXA=;
        b=Y6FKnRUNd4hrMRN2uDZUWlcbrsSLZ8l9GMMh2JPmJ5UDEB14rPXHN5cHVX5WD0I0AH
         Aw6c3o0Qc/TNdJgoKR5sSHirAz3rxXQalISGWgnTTep+hxDx/ugpgJEND7/cBU126h7z
         /Km2ReqUJiglpfA7pLsaqfEs8LPq8BGbB4KM+wyhrwIhfviMLFogNlHT7UZn2u9DFTK0
         MG8Uj29hpYQfv6PeYLZbZG1pSVfy7ZSqCLbxiWt5UZ1wZwqevIfFin8pe2yok/FWUEgd
         xLJif7KMnPlFQaqFLUw77kQ1su2NhNKZFtLV1FlOtQOSvYd0zm3PwGIe043CGJ2pJDQU
         Qv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439013; x=1789043813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXagxsF6Wsx8TN0mAK3YK+Pn/X4rwuAoc5qw2yFfaXA=;
        b=H+KsLKeCGj2mClEfTU35EILWQSnlm4OoAy7coFQlw0zVSsVSxF7biemo7wPwZNhusS
         NbIPRBc7lgkXWMx/CbKzAiSC4ro1W0HNhfwlizWz/wNNlPazvPYyXmmuvbffsprTFw73
         hKNzvOSGRWQS0Hyxlt9d1AnFFhnHyLQ87AFEnksSCgW24JK5leuKcsVzPwZZx0wP5bVf
         TOJ3yIlCIo14wMq4ZMOYuY1jxjxnLbXMun2ETSor4bdr8l9wslVtrOlifxRnAs30282e
         3n1MjLBPHIyrEUdRZiwmhKpw6b0vAEqxNzgcaHqj58i1A8s/9XynsgAOVvfC9J3KfNXO
         XS5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIJpM+Xe57QQC1kmGg+bO4ZGq9Tl4UgAHl2NkkPwhKzwgo2bYgxYK/jwKgquhOxmmBD5CUR6CY5T72Gyk=@vger.kernel.org
X-Gm-Message-State: AFuF++nuCFrSAsYmc7Zr2Zt/6FjfMqnoVYh/DFIcVCFYQpn8prH31rU9
	PmhlJx/9ZUgksy5gq9wp9grGARD3hX9o1uDVzAMRsaS9ziFNndATt4/mxT3mA5BLO4c=
X-Gm-Gg: AYBFou1rvzk5q71svsg4nRI7DKwA7Kj+smGJw1b90n1Uk1mcWmGcYMib9tvdLMLOLOw
	9u8ni0Ja5ejzpGnqfLdDMl9SqHGzFmYQd+VRyGDGw6aCn93jaHK/FhiAf44HZEUODYPnKyixgwB
	mzIO8A9Rp87277XcyFBmoSTdRtrEiYSxfuMJKNWcNxGzQtfs3G1Dld82Wcn6VTIXvn4bAvg6+Xz
	r5bPb9HBr6ZPzsbPjcYSMatnnvU5IESvcOENviruN1vBPnT1E5kyy5K0GjMPPXC6sUyDWHnMykS
	9Cp6k5+GzcpjDEpQB1PYIU4gZGCnmkXByjW6RaUSt13Jch5vhirViwkRMyltZddPypk0+OSLaqJ
	OBdKgFIYvXi6pVhfG9iKIVh4AQPvj+XAkLEmxECP3flgZrCW93tYkfuGdGPrNbkP2Bivj4uA2a+
	bdYuiMrSNp94SRona4l2tBAl1dRpkBMPqhJ8eJstc=
X-Received: by 2002:a05:6000:25ca:b0:482:fe64:1717 with SMTP id ffacd0b85a97d-48488dfb16amr19441433f8f.7.1788439012371;
        Thu, 03 Sep 2026 05:36:52 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3706sm13829439f8f.18.2026.09.03.05.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:52 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: phy: air_en8811h: refuse a firmware blob that is not a multiple of 4
Date: Thu,  3 Sep 2026 12:36:50 +0000
Message-ID: <20260903123650.23855-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The download loop streams the blob into the MCU as 32-bit words and
reads the last word past the end of a blob whose size is not a multiple
of four. The shipped blobs happen to be aligned, so the overread never
showed; a truncated or foreign file would carry up to three bytes of
whatever follows it into the MCU. Reject it before the first write
instead.

Fixes: 71e79430117d ("net: phy: air_en8811h: Add the Airoha EN8811H PHY driver")
Assisted-by: LLM
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Found by review rather than by a failure: the loop reads a 32-bit word
per iteration, so a blob whose size is not a multiple of four overreads
by up to three bytes. Both blobs the EN8811H ships with are aligned
(16384 and 131072 bytes), which is why nothing has tripped over it.

Exercised on an MT7981B board with an EN8811H behind an MT7531 switch,
with the DM blob truncated by one byte in the image:

  firmware size 16383 is not a multiple of 4
  airoha-en8811h-mcu mdio-bus:0d: firmware download keeps failing: -EINVAL

The blob is refused before the first write to the MCU, the driver
retries and gives up with a warning, and the port comes up without a
PHY rather than with a chip programmed from three bytes of whatever
followed the file. With the shipped blobs the same board loads
firmware 25062302 and the port links at 1 Gbps. The board runs the
loop in the library that the pending late-PHY series moves it into, so
the message carries the bus device there; the guard and the loop are
the ones in this patch.

v2: target net-next: no shipped blob trips the check, so not a stable
    candidate (Andrew Lunn); carries his Reviewed-by.
    https://lore.kernel.org/netdev/20260902080525.2211446-1-f@lex.la/

 drivers/net/phy/air_en8811h.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 0eeb7b9a4e26..34d2727e8222 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -312,6 +312,12 @@ static int air_write_buf(struct phy_device *phydev, u32 address,
 	int saved_page;
 	int ret = 0;
 
+	if (fw->size % 4) {
+		phydev_err(phydev, "firmware size %zu is not a multiple of 4\n",
+			   fw->size);
+		return -EINVAL;
+	}
+
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-- 
2.53.0

