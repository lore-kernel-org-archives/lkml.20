Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939736;
	b=VcpsOZHgUg42HmOHHZ4fs+TvV44EszmF8J2bvlCc7yv/ltqV2jR3Z5ZJagEeUgAhESPM
	 G8oegtms+Kvd7EUzIq+KQN5EV/mc/DRv/i2kOmb6MWFxIlzk5jsgbRnHeaf57SY7KyJhP
	 qtADAbfw64dRcBXyu0gxDMzeRpo0v/k4guJEVNsPjqAkV/NPMLqlNLndu8PJzOOi+qBgL
	 fF6Fmf/12U2RUzjwBQKpCQSoTNI+L3758cSmr2HLyBVWFCTCh+MU6UbBfeKA+kg1TQsdm
	 tNXV+kM3Q0Q3+g/vjVD/nPScxtLKtG+Epse7lZHDq417EG3jvAjRM20L5Z6RXvgl3Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0BHKQxHth0jV1Qy3AAfupSHQukbGmTDd7nK1ds2NmEM=;
	b=KenDR1Puiw9p6KGYHkM34GVT4wXR1hcJFHDfJMOqsr/0gzPAq4mj/Pk49uOQQe9Rq1Ib
	 7n3R5bo5eLdDzeXKJFfohlWi6SYNRhVMxwl9Fn2tsxEL2zArs4t15YIDY+ylEpxdJOBTD
	 YrxnCzAN/bD7aOsxcDC29vaMa4zDg2zjWm2xub56uEQgWTo+4aLa5o875YnT+AAtfTHyl
	 dwv/SIt5ffQzCGKX5ucNuCQQXy4h8WFP6LHZbzol4dcVxZ8qpr1MgQY9qdDv80xLmJHuJ
	 ntm9zPuYExmwVICmlK2azYh1Zj+S4fo7E6nWZ62PNZQw96uWdAePSUtw8BXR2ASCT8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZgAPG+Wz;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB1606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZgAPG+Wz
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso1198917a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792939735; x=1793544535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0BHKQxHth0jV1Qy3AAfupSHQukbGmTDd7nK1ds2NmEM=;
        b=ZgAPG+WzyVCZaoNPpfze2BjqHkSO4yHwl8QI1W6Bnl1swkOB6WPUaIeTuFtgPN27Tp
         cgjWbVx2UZ/gUcb/cfbMlvqadmy4QRY9lg/cnLh0NjOioIzzGhSqC0ZJg09U7zCXCGIZ
         Mg9zOQzJRSOiFoWWPP3SRdusvhNnI/pi1DRS8keyR6+7w+gLkwVo/rAXduD29ROYsg4B
         wUsDbVEoNjGyt6uiL7P0YAZ/7MivD4P0zxJNIvAD9TH/5ZOfyIqqnq7jg2ctPn8T3J+r
         b8v72fsYuQz4L+tjsumPMpF/kio/MKuhHeAigKRnV0HPBHS7AsdslZpPmoSL5naT4w0H
         ObsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792939735; x=1793544535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BHKQxHth0jV1Qy3AAfupSHQukbGmTDd7nK1ds2NmEM=;
        b=gM79uSBJFTbZLKI/wl7OgNQOzvshzdu59Jyu3pCrE7fh3Ndwi6a5+2nLk2F5bTA73T
         za8NEJSyNbj4pRcrzFrbri5MUPMa157Fw97oNArorE7xe1zcQYXeACLrG7HPUlx5R4l6
         /VofJW/eD3LdD/c7ysNYqLgAcuKsPPJxNprwMf3KTYR2FDD6qB4mRf9IwDjcAf6DOFUc
         sheLDyXXsg5ZfQwwXVS+AIV7jnbyyLorWjQGb4nbD9SgvrvZ4Hm2deKNu0grb1RdsDex
         YSTVgx1Kcx4ssdzl77EiIbcgL5/Sc6sOWmb5qBjo/WhFahi8rzOgRPf8eT0I9nnBxn23
         ZT4w==
X-Forwarded-Encrypted: i=1; AKwUvBxRko/1IMVs7+QxCUE2KmDwEDLGxG0XnEuSCqVtXzifho/1ivfOiHCHHV4RPa2H/1/l6s9sMznBSnybgQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK533m/umodJjn1uMl/N3Clg/2wtAurr5bMnmXblWoCfXVB35nP
	e48cYiojZeqNQqOWjf2FaQve23QyG8gjy0g+sW+dGjlrtmqViK3zKL6V
X-Gm-Gg: AYBFou13NNcUf7q8v0yp2wADSGg7kAg9USF2cH9i6dj13AbO5b5mPu+SFPSWS50co4p
	cqsaVmgZFcmYy69v4ffiTfZDCu0gG/EFsJKdq1oQ70jvuWbptjFmyZg47fiaFx0z64qvxKtL27V
	HwAZccoVrksSU03kPf4AxHBQYr1u1PDUWaN+OPwP+0W4VhCD3KmexZHgxolQtC9O7/Ou5E6PEZ+
	dJByjoFP74L4C/KW/0w6NDwEnU28v3O/H2J+VZ8vtMkT9oX2+c7/eucIfQeVscM1IpTNJ9T2Rjz
	5bC9Y6TmWzNv+5VsR1zpAxFdcUAQeEPOoYYdlTdEyqTcMSUqCAq2MKsOXNza6K5IZoeCKl2xUPk
	looQIj/bCcdtVY+TD0JevGRxz4To/RjBFNuVMgvgUZ/zmY2bJC/YiNivwlaagXS/+oznPMhTuMP
	Rg8vhvhMaeoIwseXncmXWRWmUMMPtH2lqgejQ12x0DGtkXmQuFHyobsvFDDS+c/bpDpyZZF0hQ6
	dlvcjgRCgF9BJlK6b0/orXX0Gu6UjOJij1Ij/oVmfic7XYU+GSBkJf/aEYfhwTVQh7Ig3os8IxN
	btiw3nGl3bwVYuUqiR62A+eqKEhs
X-Received: by 2002:a17:90b:314e:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3adeaae8947mr4089569a91.25.1792939735592;
        Sun, 25 Oct 2026 07:48:55 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6212:1232::1d0:de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebac408asm5265009a91.0.2026.10.25.07.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:48:55 -0700 (PDT)
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
Subject: [PATCH net v2] net: dsa: motorcomm: Isolate all ports during chip setup
Date: Sun, 25 Oct 2026 22:48:31 +0800
Message-ID: <20261025144834.2810828-1-mmyangfl@gmail.com>
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

The chip setup only blocked unknown unicast and unknown multicast
frames, known multicast and broadcast were left open (though the former
cannot appear while the FDB is still empty). Before port_setup() runs,
broadcast frames received on a port flood out of the other ports.

Close the window by fully isolating every port right after the hardware
reset.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v2:
 - reword and reduce code changes
v1: https://lore.kernel.org/r/20261024144023.1010237-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d4fc20c52a58..08a880867ee1 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2221,6 +2221,7 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	u16 eth_p_tag;
+	u32 ctrl;
 	u32 val;
 	int res;
 
@@ -2258,6 +2259,17 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 		return -EINVAL;
 	}
 
+	/* Block all traffic as soon as we reset the hardware since it now acts
+	 * as a dump switch.
+	 */
+	for (int port = 0; port < YT921X_PORT_NUM; port++) {
+		ctrl = ~(u32)0;
+		res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port),
+				       ctrl);
+		if (res)
+			return res;
+	}
+
 	return 0;
 }
 
-- 
2.53.0

