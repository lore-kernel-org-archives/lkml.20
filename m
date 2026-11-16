Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844927;
	b=UKU7K4HRTS13ZiubSJptn1EiEMM3kKafMpn9oY6nn0npUeeL55mMevYLnVSROr0ytuKR
	 peXQAoG8bPkroaZ2NDbwLYwKXUHsx00YKYTjzyyQeLIvIqhSOHH3gVtUt5nUPq9asWHk5
	 1arJwM3IdK2dmASBeNQFLsVVZ8mR/tRnNl2FZAjxPLTYwRb+tkTXdXc5We4bZWBKoBESK
	 CVhXWfmnJJmcbhDKqmjLcBm6R9/81Uo2XwkneeLrkzbeuuLtoEdhd3RLWwhj67Bf+IzFe
	 uiSgfd6BvUEfik5l4FhOHfiQFJhs7Y5evOET3nlFUJUlexXwY0i4UmzpcP1NZC4bJSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qS6R+qjf99PqrLSAZdR5V0+IKAMGWZ2eov4UlAnYxRw=;
	b=KzfYMFO3XKjXoRMrBKROX7q0CvcJRkx9rVG06J3rqa4v4Pq2DVsWEzFmhaEYud5WJoSc
	 zsC7C2N0O4GY70C2CL6s1VjrUFhKholL9f0IL5OsaQHLLJG7efZamvekn3Rvq4M5oZcKY
	 Va9JWbdmzumO4JKUOdEtPyEpMP9m6GkoujOdYZxdJ6QIptGjUgidvvUW2KrDSe3kYE6xo
	 EzvOIawh1E+6kh+HTV/fE3qoVDfoVMUo32+hTTzFIWMst13SwiM+U6dppJTD7S1Ztpa86
	 0x7EcoC0BJVT1+4HXT0Epdic4cI+pA5mWN7uMtRZiGutpz8k9bhpzYUU9Hun2l7DDcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJbgHL9R;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A884A606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A884A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJbgHL9R
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1380129a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844926; x=1795449726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qS6R+qjf99PqrLSAZdR5V0+IKAMGWZ2eov4UlAnYxRw=;
        b=CJbgHL9RjlVBpSHuBju7KGcw4Lm8j8lMjyRQZIC77SCi2ZQioI7OJbCxp66LQg1mT9
         6rLTDW9dwtBgorUtgk6ImczS69hg7pzJNHcyntCHbKih9SB7QXSZF3iyeopmklAxwoG6
         CJQSn6TDBDWc5GPFA/PQYpwlpc8IKucVyfOsYJXHB0GevzsWDWQoFQ5nrPtTPcpsOHe2
         p3MvFMB21wNyvxA5o+EPj7mkdyj0fbwkISqb4SuyuEAr3lMtL1ciGNGpTdQprnrC1HXa
         30KpMc6Hbjh2JQG5Y/7NfQH6fa6e2sjOQfF/1vdaGTsG87oXbMq4ibaKyGSEP3MdkTwT
         UHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844926; x=1795449726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qS6R+qjf99PqrLSAZdR5V0+IKAMGWZ2eov4UlAnYxRw=;
        b=uEEknGheCllwzSmEE9wTIiliBearKpnXCsEFcirf4uOwBPQncud5nqbXsW3l97/mWL
         LO7bN/xyIhOntqVNjpxV1WS8fAW3KAJYJB8yO0kPmcy0Tyk3NEw3SJZ4gR+YEhR8omDs
         DChPQbGlxEGueCnPtV2kpbtr/4RelgTz3FfXS0YNS3u21Nul89/pef53Lamjta+FTlM7
         d0n3Di/h5WCd+EqpbsbCNCfBh9cnEoTQhG6HDpTS6cMIPgqPUP61KIfkvxmQ5IMgooO7
         xdCDAMolgCjLWR/IVELhMweVhMl77kp/Cq4bwpkVhyS4LSEHO3jKtwAVTD9YxJB65H4w
         YhSw==
X-Forwarded-Encrypted: i=1; AL+hErGdDsounVVADBIjOy9kb+4X/jw0J1dScYJj5gymptX9sVAUEu8Q7BK48K2Ky/KRrkSK8BPI/CVNI2OgP5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P0IM9Yl/AnPvhBiKde/9xnSPype5Z3ng53TOC9SUuge2L9JZf
	vG60zZz0wFbqf9OyQuO+qVDpU33FlFfyGOFMuFfe6KB7/8hzUqnHVOMx
X-Gm-Gg: AZFdTZeq5U1HahsAMGkMRyKpqJZsLqwusfKJAZh03fdiexr2Ot5NW6ggGpgerwH0xH0
	Ku5PsarGAc9l7+TpujebybNVgO4OUAr8jLh/lWMkpijlnGKshW2qz3LsCZ5HpLAZyKyeHpxMeMy
	bYA6Xgy0pVvmqNNOiKy4nlMGfTvpPvPVxp/bPNJcwb2vAbjk3zD6YPlEczCmiM3A74H5KxsFS4W
	L+mmrYvLWk0jPUULk8e9cV6gfuyOGLTe2uZVlcZEz8EwU+CpQBHFZ53MDKC+o7iEu1nR2Jz+CSe
	t+HL/R6MezayGH9vDkeD0EjGHprCyDpE0Tbo7nXuvvKlCTeoS5D/HgDZdBvhgjN7SNok3np5wbU
	e7Ug5a8e7vyUbpDiRyVpGbtL2Fd7+joKubzQ+TIGx0I1+17wJFZ2sMZUk9CHEIcCIftgdGgwr4B
	jsFPMl8yZiaapT0K3p27QWLG0uo3mGLzqkYeJkBBfJy/GhoU2ax7Z2I4fqgB3eeiJDSa9e9nZaV
	Puj1JsRmFtp2zmv4SepHAjJ/ut6J+7vHJB2oGKnfCA2ru07/Q/uIRaXmrNjSKwCyQy4esOsA21m
	cZoj0pn0do11sIs04FfHMacvDzhYo3DOvcSDwLxTYeFAzG+yCIqViA==
X-Received: by 2002:a17:90b:1846:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b1b0a3ebb2mr9480447a91.38.1794844925609;
        Mon, 16 Nov 2026 08:02:05 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:05 -0800 (PST)
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
Subject: [PATCH net v2 1/4] net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
Date: Tue, 17 Nov 2026 00:01:01 +0800
Message-ID: <20261116160107.1351198-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116160107.1351198-1-mmyangfl@gmail.com>
References: <20261116160107.1351198-1-mmyangfl@gmail.com>
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

When adding an fdb/mdb entry whose (address, VID) key already exists in
hardware, the existing egress ports were silently merged into the new
static entry. Ports learned by hardware are untracked by DSA and can
never be deleted. Replace the port mask instead of merging when the
existing entry is not static.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index c753c746490a..c6d0f000a163 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -799,7 +799,10 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 
 	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
 	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
-	ctrl2 = val2 | YT921X_FDB_IO2_EGR_PORTS(ports_mask);
+	ctrl2 = val2;
+	if (ctrl1 != val1)
+		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
+	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);
 	if (ctrl1 == val1 && ctrl2 == val2)
 		return 0;
 
-- 
2.53.0

