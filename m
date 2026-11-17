Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915883;
	b=46BPzdLWEi4hFwgGYIZr4JkQz6VCNWEudj4h+53S4Ajbcp09CfPmIIcdpQga/x5LlznW
	 zSSj3BG/SvHX0gc66hKwCiMbJKxppsCOg8VhXUdogE/yzgRhmqRboazBxA4lovYHlePAu
	 RhhadjIh4WgLsTJb7kSP6tdpUubQ3KF+zFz5hmyJj0O093FaK0fWBg3SzWlEmGyWdCtup
	 pyJJmWconlPZ9epcxvk6ZsNZONglEczI8HoGACn9uaripg+pz2yCJXk15NWAmOmftLQF3
	 sHjkZ0jNYRHFBd4B2PUSHnO50fFMiQAAc2xo7Ge5FxcoPR5ZKz7CXhZnS2cvW6rlHyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
	b=KoeLhspKIk6CXzQf8JSSY0qOZpwW8j1e+n7ew8wxGtVtN5CmFvWXMspKbbtxsBLeugTE
	 pRSAWfckMd22/wj+YIH6H932pqppDz6xU+rn5alx2iwzPfOoUYgJ8VltsPZ5WeWjrEmuy
	 4xYdqnGjP+8KNVbrT5R1v04auvICheXBn7cRqcxiP5ltLVYL5ekjyTZ7UidEuSnyv8HPQ
	 FGVoShpGA/u+Y31oNzl+cdxGNOy6FKoxviPuEwNJY5Lyixb5fLMcfaMNXbg+lMsGtrR8P
	 dP188+lsgxN0d9IdIqTW3muqKfdaPNnTXxXvNswyFMrFEbDd/kFMKHb7AhbKHcntb1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3B606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D3B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccecba199so4855828e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915881; x=1795520681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=sl6D8KA3FdArmPRJE/9/3+w04VGmJDoM2kpUiE3bxNH3r6gjXuJ31wqpbPJm8xLQSP
         ReziKQZ/ww36NUUjGiK9BugbjFwhJGiKbpgb3teYqK1i/JL/DWtLuselX4Cktw4IsSzn
         BbS+lxVRb75D57P+c+oDj1oeo9TBDnsDy0dYgEs+bZBkveiGTIAT+dh9oDpb/3ydcdlp
         RcQGXATiDmRYmyANYlJNcW3h36Y2lZ/W2oQxqsSRJNQ4mh6d9h1jUgkLydLKZFO2Jw6y
         65VBX951hp9eNUwdUNBY0ktRDQ0mqSVT/Hel2uek/GoRydpA0ZdH5+mf9tHsdQhnKko8
         jJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915881; x=1795520681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=AGoYRajqyz0VOnELdO3tnXuNu5n6KqrBHJBuBTaT3ZojezXxsxh2pgjgOWfhGDTNsG
         zzqJzK2zMuJC5NAezeWel1vcZ1NQgYc4NM/6BwrM/Xx0h4wFPej3wX74RmJXhabQuWic
         TZL4Y0YHU5j/rosA+JFtJhPSpgtFEO6APZLoYJ9hnuOJhvvjd2dicbD5Wcp/kolAqW+J
         q0yhjp+ifjb+3JAVmtbpYGUUBalfRXLf0L94iaKq9uqN7q9NA+Wda35EPR1aBWkoJ188
         ug4lU5Nd1cvYxZwsfDuFcmubsEmrfc/ylSy/QVykQU9XI3cFkTR1GfuUqdpFrhLK6Tvf
         IoZw==
X-Forwarded-Encrypted: i=1; AL+hErFOtxmxFt0rMsesRbYxDVuBvhSXs3k4dVEw7/Hsv4Ev2xXXPVunn+t38hO9RJj700RXP5sWeuEwByOPg1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iQQDk1Ba99mpMeGFk0xA64a0CKgOdqFenzuykNwCHDPdcPTph
	M7l9HjJQakAQrj0GXrer9lV/paWMiNjNxH5yfherbBZJq8Hrqgka89Nk
X-Gm-Gg: AYBFou0gvR06wJKfKBmWRlJ5nzoJVJ2dpA6mXzIQNE43Brk6Y2kd6sLwDa48QtenRAb
	GEAep0RuHYUmLowMFF/zLVHAK5wVhY4dkjV0eOkiaLFE7OSy8j8bPgybhbGKKMQ/hqeqrktIV39
	Vg0+CNHv0MK9Ffo3sq3hTg7miCK9wdGrKckKHWslMgpDyITU57FyCyagjljeF88uUbf2D1DACze
	w42q2iKgWqa+VEqT3VL0DP8CK7W3Ehk6RoSCSN0aTehauPKaQLimpgR97eDHdyg2p0Ik1tBS7GO
	W7GNwYJm9Ho/TGXhQVVj65vd7Icv3Xvkjzude5AS/uzLmHUezZLgbGzuljZMCsbVkDkE/NnwgLa
	sF6ScifxFYt4XwLRKGI3yORfL7GiHfjSorLRlxw/Qg5qRiYVNGifzQMU5DbkxEGji/3w6kK5Iyz
	eDns5xhdNWD0qx2aXsFCt6FLvyhg0SplV9tKJYrjV14KMYVrqL/RxAfeeltILwY7mN/nr3wHT5i
	LtsxfUB6Sfle4sy21sfEOy32PErfPVGylUd+sRMjWHz7YGh4bY5qyL/WIaaW/jkG7dmkuAZTD+Y
	am26elqF01XhfqWrM+hl+JjTdnbF0PoXCR9GdGIf0S3QnrA=
X-Received: by 2002:a05:6512:2246:b0:5c1:56f5:fabc with SMTP id 2adb3069b0e04-5c1709b2313mr5888936e87.24.1794915880522;
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 17 Nov 2026 14:44:27 +0300
Message-ID: <20261117114432.2794961-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

