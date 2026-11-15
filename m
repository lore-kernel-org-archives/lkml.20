Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728759;
	b=F9bOz4Sm2v0e58j1NwVZU9RuZijhhXloigH3hsPPr2gGi+ZCfNYySlJyo+s9P22LkR0E
	 /H3TBxagNKq7O6lUzO/fJiMeLmc6xJjBSOVe6LGU3p8M4ooaP4UkzFBPlD7zhicQWEvJg
	 x3Rql/rOQk2za2boZpMkwd82CvSjuUtWKwx+wbrCEvzYmyajwFDfTHTgNxm6xw4BtjBYJ
	 TgLXUYroWw2KJm6PoOonMpljGhOO6mfpvC0PqNa9ufXn43szwHIEgmTnSh3da+cuDfsdV
	 KPjIXYrq2KgNyzpsu2DaSDaeGSRzXjGIUYABvg6feoQ1W8bdUpfUJlmu9oEVfGbIZCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
	b=nvFCcYbTZz6NnWGHadi/wespGPG/I3gTM0pag+H0FqAaZ7glFmZ5C+KMXFrSWNOmNPxp
	 LwoUM73uO8wvpMWSBsmvo5dlim46iIzqlYQogq5CAaQl1GmpTYtVsOgIejXQr6Pqh9t7+
	 ItXOXaMHAIt70tmPpPhjDv9kGoeAYs36/AN2AeKzEJmI5QCYMAHTO5QvCrdWFES0WdI+f
	 zykcTKkcKi+BvCzJfIeUsoSTAO91ytFFaFhT0+MUp1O9HDPMs2c8hRcFxbWFSdJi8SbsP
	 Vw90g8Vhqws5mLQBzdlVUVZ8SLngjTIsFyBkVm8KOQaYt2x8SW9ooV6tz5xdIgYtTQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1AQTdnp;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69711606A334
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69711606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1AQTdnp
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4ada9579947so2040073fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728758; x=1795333558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
        b=D1AQTdnp4gx0VEp+HTMg/wHHUTiAlE4Ye0eF3VbKl6CljIPmbvtU+mebSHz2m37V1t
         bWiZARGqGRLxOPA1akRetRKH04YSCRMOBbYXjKEa1A5rPjSphL5MZzw5RABQ60WAjiID
         qFfKGxbPeeAMWLvHE+vmw1+dx/lK3FI/3u3GHEYJQ/P+UUoIUn/ssR/lwtDL5ngvxlcU
         8T56pCxrweujiwTwBAcAWRePgO3eEZ5kEnkZLtL/yBdNixYmOvdA6kOjA+JaIBNnRDhC
         e65BrgUSw6VdqDCn0sKHPfoOsOrIuwLvKKQL/iLses8XFZdbHG+aBG8yLJF0brkaWEw8
         HG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728758; x=1795333558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
        b=qGwOu/NNV/aIxkIhQzSPMs9xfDUZV7aW2I/8hZH6cBM9kck6wwuv/slCDsNwmoNOFH
         TTwjQPnDeha7nVp8ZIoFf30YRJhJZkzenNWSFJW58DBFoKk4WiIb0+IkhxBYvVw3LeWH
         IYhq0PvsVRCPs7ZDFMmCMbHvZdNGm4D4TgCe0eWyYVmpYbAv29vOPAr5i5QtQ2JxPA2y
         vG1VfD3QwC2AIZOLM90DIYJKVSNjGDvUOAGX0ap+rTKusTvymYEwPtKbxo+j5WnXGUy9
         hd7bRKRjkrcXva3Tht7p1zuFdHPT+/CeIdHMxYPQKZ/2JDZZBozZsvz9Sd7AOc6VzkRn
         LcUg==
X-Forwarded-Encrypted: i=1; AL+hErHP4XqyC3f0Qn2a2t7VCuf+GfwhzWLrXlnVC9vTK9k9QFstqtFAHEAy7s4J2cu2CCEViff2OP0KSOLwMTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8SVoc25MLgeG/P2e0rNvJSbcuUzaFFM52RfsSEhwCGRKweuAv
	/hrv+9tzydWemKlmiHMALdjTYGmpuS1Ho/BOW17xE4Ado2OBbTZhzOGh
X-Gm-Gg: AYBFou0QC20j1K3imXJAnrgJ5aGgBoY/E90rmCx7oevLFNGgK1hOfMOFc2mPlJmCV7T
	jePH9EyQ7DdWxC5iDilLAi7RBzSHXybZ80H/o9FUBjemtxTwkkxD2KnFlMrZz4LRw+UNVWS6Ak+
	LBg0w646XnPM4S9EsLgYTa5/eRlS7dBhd8zAcMqPFTRdew95IzzcdhOwT8T6f2d01vmTLu4GrH1
	NWlPYtRQKEaVdCdstlePalHaZkJ4VZ4IMjglUmalUA+vOLqm2b8HBxmuZmBkxcy6i0/+o7GdkDJ
	mXIIoJvlCTU9M8leporE6kKOVzwMkKYHTtqL9DAg9GhbNmWFzT8sILhe6G/g/OtURCAr81/TynG
	z/zhSHsxuRWxAsDw8NZJoQuGrL9ss/ge3VLw63sRSL2OV3ZOcCVdZ+vaM/itwNT1NH8g0HpeBNY
	x3Gjod1xIYZFbFsySD8aRJqMHm9AsoWDfgy0dlkZbRyxryJ7c8VZEIyhaMHzzUIy/BQ8lDgl9zG
	msjdBvVFhhcIKSIXqkRh9nL7vYLl/f/0YDnB2iRstOf+aykHIiMEKnUFxzXBVG4Im12VfaarsnY
	IGdlax9twzCtchaEuPc/T5Bb6TXtFjehjJ7+qr2nCHIgDqV2A5MKMskbN5Qrj7pWLXEWKGwva7s
	f6jsjWuRyb4o7wwhrCIpBjCPmdHXri25W2rj9uh3RPJYIEAax4uf6p1sjyVrjPETGuAyMj9fqwa
	qT0WubJ+s36soH5PWACkCz1tB06OZZDPcuk6/c3lmXklRnKsPQPUM=
X-Received: by 2002:a05:6871:88c:b0:494:116a:b0f1 with SMTP id 586e51a60fabf-4afdf28de45mr6492889fac.21.1794728758319;
        Sat, 14 Nov 2026 23:45:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:45:45 -0700
Subject: [PATCH net-next v5 1/3] docs: networking: correct the PHY
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
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-1-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The ETHTOOL_STATS_PHY group is exported as phydev by stats_std_names[],
but the ethtool netlink documentation lists it as phy. Use the exported
name so the documented group matches the statistics string set returned
to userspace.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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

