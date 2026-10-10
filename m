Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DAD34DCC8
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673828; cv=none; b=NeX60c3m8VANSdP/hTobIWthkgtSfU8uDheAKVkXA9uhNmxG+fPQKXpxxG7dy4+L+OQ88M3m6DM2PuEdaiIenhMjWl+kpk5jHBU1hP3/VS+bEu3ocIrulj48KyWJXqtLSrfGfRyTeWCvEn7rNBszqdbSGkQukJi/hxIR7eCJ39A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673828; c=relaxed/simple;
	bh=S5Yk9i5Uw4O3a4L26F9Dhe+pD2vL/083DG/Xe5+4P3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+9bRPDtGcfAaXC9X037prCFvY7mJ6j9xlVBK8rJ8uBDZncc3jUVmpOGTHhMUD20s702mCEmccvUeqNV1WtbO9oivHWoSbWov1kFahD9B8MfPDPXItR3+YO18vjmJi7gNNXnOEsQf9hoL5oO6Ta4gSiSZNIHi0KS5GOLW1vHG2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nN9cYXrq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN9cYXrq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db80fcdf8bso4333305ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791673826; x=1792278626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vI2kBkECW5iZmYYSZT60CeuUy8PSWpfrPWMFdyyehWA=;
        b=nN9cYXrq255tD9Aahm9RsHi+tbECrjSHxGqeYvjxXWO9iw45YcAYIMNBR1pzA/YLqm
         WbX0JBDza97y+Cpo+ZLtYxAtcyaV/SZ7l8l1Afylg2SVCtaP1OV5wtBkRAT4q1LMN2dU
         3w27CFVNO2PlB22zUTElTl3vMyhlLfAjL723UtCFFDsF7x5Dw5N4HoGO2ViIIFIBRdQ7
         lgRB0KvVoLGFwFm8lrKpaEZ+5GiGiqn6K9xSAbci604OFbHIGW8u6XqdfMln6I1ESv2w
         jcbTANXVtsevDQGPOTmU9nge62XFlXEZ7wKt+mNQ3eocE9BetstvzwbA9QDLBBcxeI3a
         hdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791673826; x=1792278626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vI2kBkECW5iZmYYSZT60CeuUy8PSWpfrPWMFdyyehWA=;
        b=qY+uwQl6DfH2hNh6Jz6Vquxf1JBFD6R9cx0o8AtpwqCPLiHy30K5HICnOM1NJQfIr5
         S+v97NGerm4xN7ynpNyIBNmlVnkssgrAvOziAj9Sdr03rBxpmFghmqDRsbYfb14UeTZ8
         dH8pJ7c5VztM6x/SPFsjCqTKdIUCrHS8KH4hvhsf7YqDZxIs1Vaw+kF5IXAQkgoaBlF6
         qbUHezO4KXRtT0/nMBJ1P5U0idDnzcSRtr1I3oOgO8V0QKJTMj5XnYubKKW91W+uvbQU
         1XEKlTS3LE3koXs1j5Qprh0snJJNtrxjMLksg2jk2h2fzUWrh7tZplmwfcTpikIGb0Oc
         hBQg==
X-Forwarded-Encrypted: i=1; AKwUvBzOnoFAh/Yc8lNj26lZqFWstAkgUhubusxgnszBcHlIsBFQ9+uUQUpkpHHkc7N7rLAY0mnpLBVwkxOv8hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOpqot3NdjgvU6Mb5uTfYmWmpWkMJsUucJj2y6kVtqlzaqN0GE
	+pV0yEgQ4xJL3CsK7+71drtR6ZOhexzPeAWBH+GMGkMWDa70mtR6krOe
X-Gm-Gg: AYBFou2WQZMeDUpxe2cA5/l0NjH2LMmNwltwmXRUCUFhXW7Jlu5h2RFZ/rSWK6cN91/
	T1eD/oThifmyghEFL2MsOQJg2cCW0YiowX0AQgG3aWBbtB48H0PtN54uklCpdQREAdLS+r3t9NN
	QeF9RBqDVENmmOtQbfU0RwD7kJ5j34PZvJt3A6wDBnPkQY/KSSVEM+XYjZgRmZe5z8nB7tXlQLN
	UZAmxGP5/YgK8mGQTYunumJvIM0+FZ/w55BmrXC2bO61AqWhp3PeaNFglitAw/FyO60Y+YXPg8N
	WyhV82KxzzyIhKa9cRA6gSY+IO+/5X4nkQAWkvKg6qpCbH3e8dTwigyZwl/JhUL/61W2Uu0RedT
	RDVkiIBvmq4AUpOJS8hpXknQf0Qt0vBJnU5b2yhCk+KOSW8N8Kdj/IiaQt/RnTiIXRoEi7TrSLt
	Y7uPQTr0oiEy/tMBHxS9K/F171adnv/Wj6s1Y2Y6A/oiWwhyrByKxSDV4oLSTMTjJ0ytE4JZlvj
	d6HjpHZzz2phTbxnoDb7V2Ugas=
X-Received: by 2002:a17:902:ce84:b0:2e6:5ef:abe9 with SMTP id d9443c01a7336-2e8429addfcmr42328485ad.37.1791673826108;
        Sat, 10 Oct 2026 16:10:26 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm26813065ad.69.2026.10.10.16.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 16:10:25 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: dsa: motorcomm: Do not do the redundant MIB clear
Date: Sun, 11 Oct 2026 07:10:12 +0800
Message-ID: <20261010231015.2600207-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIB clear in yt921x_chip_setup() is redundant: it runs right after
hard reset of the hardware, which already zeroes MIB counters.

It did not execute the right procedure either: ALL_PORT must be lifted
from latched value before CLEAN is fired. It works only because the
reset lifts the MIB control register (and counters altogether).

Nor should we take care of it elsewhere: .port_setup() should not clear
it, and .setup() runs at most once per registration, so per-port state
is always freshly allocated by .port_setup().

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 980d066a4bea..43e8af90ffc9 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -3996,12 +3996,6 @@ static int yt921x_chip_setup(struct yt921x_priv *priv)
 		return res;
 #endif
 
-	/* Clear MIB */
-	ctrl = YT921X_MIB_CTRL_CLEAN | YT921X_MIB_CTRL_ALL_PORT;
-	res = yt921x_reg_write(priv, YT921X_MIB_CTRL, ctrl);
-	if (res)
-		return res;
-
 	/* Miscellaneous */
 	res = yt921x_reg_set_bits(priv, YT921X_SENSOR, YT921X_SENSOR_TEMP);
 	if (res)
-- 
2.53.0

