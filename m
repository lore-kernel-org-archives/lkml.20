Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053838;
	b=K16z0ALcd1dHSMkx6ty3UnGis41EgOs8DPIsdt3qK0GEprmePv+JFn5cdlqkel9Azwpd
	 9p1xySyWVhMMmyyUKODJewTTv9f8rXTdxBQpwpDKQ5GP28qI84ymx6Ih6XxqrA5Y8g+QL
	 XVbxsMGysAF9zGUVFtdJURY+11GLKCqMlnCwPbq0ehl8Nq/AihxKuIGJFnzSs1jgRkLwi
	 VtCMaWzPg2v6I5VucjAJ89WyIs/BNLF9WfNVB2nR/LBFzm+EhgUp8kE8X4WEYc6uxkAK/
	 3wJBUIJsOun0DJiyXrPvWXGW1TrlNhp+/MdEEdUXa9SKHYty9oxPcg4VFvWbXh48G9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xnQeGBiEH8XniaPdtXo6TRG8fMURfPvZnz3uNdKFs0A=;
	b=5KmSh3ioBZMwXhWL6kUjcFH8zDvuUOMRyHseHnQi0VVOJoKiXl2fzMxnrYlyUNiWZxtw
	 H6eFDC/YEstDUHgIxY44tledDGmZIi5lqy+JHa9UczCxNQaVwxY4mJBWIjNhPGdoAgGKX
	 KI9l/Afh3axJwshv9sQD6BEe4FUQu7GKI8ZVrSzgVgf0VB+N8hYcnRY5wIK/vVLWZgx9U
	 AbkMVyukZkgbW+8fdfkCI1fnNec7mxhDH3aH7zQr/yPw8bfbJYWBjaT65m8HzuG6P2JYw
	 2wY+F/mY0Jrp3+6bX2R1uVmv5+Iomb5MN/NMlnJ9/VIuScPFUm4Bq08Gp/srtDeap3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgdCrNB3;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C20606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C20606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgdCrNB3
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so6185505ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053837; x=1794658637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnQeGBiEH8XniaPdtXo6TRG8fMURfPvZnz3uNdKFs0A=;
        b=JgdCrNB3/otoY5WJ0YLLwCgWM2eif6xGaiMapl6vDpoRLa4+K8e/vYbzfYnz5N8WtD
         /+F/akOU8VYELp61ZorkIukkOxr+//fsQv2oUt5tuSigP4l4DwHD913E2/E4k2FF6Twr
         LUW+a6Df2HzyG9hYhRUPBb0z2RLOed7YPlvguAn2fMGAkgM6eed57mDdZt1imR9oaFsm
         SvrmPhWBT/hSpNAn9auzgNxsWXDWYiFuXWuLnbVjT6l87pqRzr55ZCp8QLVHvVgG9wug
         YWOSUtfxD3u1eS5NJgaN1tbURdbk27BIosEoJ9p9EFyo0O6JnMFwU4qDAvLgUz/Tw56u
         vCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053837; x=1794658637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnQeGBiEH8XniaPdtXo6TRG8fMURfPvZnz3uNdKFs0A=;
        b=S38HsE86rWvo4lyRkJrrs6k9ODoD/8d9+HZB8fdwXBzXJ1kH9R6OlMmKDL1J465Sln
         z04+GVr6R48Ef49hilj8IzJx90evqulABOPZ+ZkB1RgUeTAtyqdl09usWH41bl8NsROd
         IsiEaBzoqbDlA/JVHwcVWm1pa1RuH7I1ST1+xfOuJN8vX4qEyqPlmJj0lRO4TJvxvJVv
         7gt654F9ZqLlnhQOZ/5e8jJuY7E0Sqt2t7zLZ3Cy8PCglENOs3k6ZGhnRyk5by1tBZ5i
         3qRYMbm+D75zFGgnXvCZvDgvKcqa7yNkKQ71cud9N6J2d/C8I3+V0bmZiC4vPHfD9JCm
         Wkjw==
X-Forwarded-Encrypted: i=1; AL+hErE0xLJo8nHLKHd8AKeXEGSjoVy6LLt2Q7IWaEb9nNafPyiZaZ0QNl8ZDyvOOuE33VngXV4Li4rWGGETeKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tc90radRMd2SXL81MD7jiPhpKDHmfmrnNNa/EtEzHBdRYLAX/
	P1WBb2W/ixnyVoSZvWxGCv2hXHykG4hiYejWVET+Xakb8dJwnO9iqLI2
X-Gm-Gg: AYBFou2hvhgYfmASP6GerLuIGSM3LAKWZMFe5eQJuP/RrPMjnV1HoKEoFSimYG+TauM
	XoEqx5EnKlek2RLM/WU36a9Q6G8uELsawEFXfb+rngvfT6GWUpHtn8kBG9e6Mijy3/rNLrlMQtX
	v0TTdAlw/PbhE+Y2QQZr9/E6uP3vCS9yomncTp1vbfAi/HNj1sI8rD+5KYJugLIfRJYPRi2Tz+Z
	tG7gy6zu5XzFsao6lcLIdcVqV5ul4ck7UQMYYwbtQwrwQviUBfb238AXmzsLEi5Wb4I2aYJ6JMI
	cT0bKdFQgTotOUS3qCIv+C8b7jNAkZ5E3p+vjetXVNaF66EBBksvhcIyBN9OjKamaMEP6xrvBTd
	5dXR32dzaV+aRZhsqWR7l42DY5w/nwGbfMBzzevp7bvegUNwWAd5csGzckF4oX168H9X40mTtAv
	rcXZKPx1wJCnbfzxm8hQzElJ0lM3mmPpawDk3MBsgccKYsyWZcLUdYamatHd6KpNt/2zZc6OPLU
	p42nE300Hron5QpzcV8dBc6yA69K3D9SdhVC32xc1TF1B26tIPxexDlRhoqp6YnrTLPPBKtKviS
	GZ1EuvNfqwdTNLo+kToWA8/N4OSTahsMPakFxSm8izs3z/TMkw7HBA==
X-Received: by 2002:a17:902:ef49:b0:2e9:5714:608b with SMTP id d9443c01a7336-2ed40c5f4f0mr66694635ad.34.1794053837099;
        Sat, 07 Nov 2026 04:17:17 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:16 -0800 (PST)
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
Subject: [PATCH net-next v4 2/8] net: dsa: motorcomm: Drop VID 0 VLAN table programming
Date: Sat,  7 Nov 2026 20:16:23 +0800
Message-ID: <20261107121631.1040612-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107121631.1040612-1-mmyangfl@gmail.com>
References: <20261107121631.1040612-1-mmyangfl@gmail.com>
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

The VID 0 VLAN table entry is unreachable for priority-tagged frames:
the hardware classifies them to the port's PVID before the VLAN table
lookup, just like untagged frames (measured on YT9215S), so the VID 0
entry is never looked up. Drop the dead programming.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 693564aeaec1..47f06945b8c4 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2263,7 +2263,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 {
 	struct dsa_switch *ds = &priv->ds;
 	unsigned long cpu_ports_mask;
-	u32 ctrls[2];
 	u32 ctrl;
 	int port;
 	int res;
@@ -2321,15 +2320,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	/* Tagged VID 0 should be treated as untagged, which confuses the
-	 * hardware a lot
-	 */
-	ctrls[0] = YT921X_VLAN_CTRLa_LEARN_DIS | YT921X_VLAN_CTRLa_PORTS_M;
-	ctrls[1] = 0;
-	res = yt921x_reg64_write(priv, YT921X_VLANn_CTRL(0), ctrls);
-	if (res)
-		return res;
-
 	return 0;
 }
 
-- 
2.53.0

