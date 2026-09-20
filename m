Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95093DA5AB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789883245; cv=none; b=ojZUDKxXgEyjyKsPJFu8KaFzqXE23Qq1KhEY0Q5hXHQdiaoJAPs9RhRIYzKNboJ7Df1dtf3FA7M3xzVXZXvHPHee6y4mfHHYAHEAuhUvFsQm8Tjp4z3mf+Octs1nCC2s2JCeLgsYMIV4uRIZzw0FPvr7fwBcEb0TubCUFtB6YO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789883245; c=relaxed/simple;
	bh=vGxo+U1sJMCVsq3sDI08zPDza2WpfMA+ZZBuxg0Rgp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM1UvQMj2qE6oWX8ryB5+NSZbX1D6ENWVyBIAqheHt4HOk/gRYBlMR0Wi0d5oAIbiTT9or+Tcrqo24C3Ftx5G4W+3YV4E9BR+C05dazWmaOcMG1c2ml1HSj+H99vlrT7aGq+V9KWJVmy808RoIirf3Q3dkunsoZVzlj7s7N633U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrWAtjzW; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrWAtjzW"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78565b4db77so1077364137.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789883242; x=1790488042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xdh7oWEQ9m8Qy+E3UVjKRIovBOhuQDCeQrchOYtk/I=;
        b=NrWAtjzW6crMVPACP5AVxPI3gHWW7SYC8jMg68W9Rk36SG8ecUGin3pHSbLmpDQjtD
         XsqGKITCAwaQmYXY6iwtFsmlgEz4lfCzErRqqSN/hH9iPbUCyAIvREnGpnAxtGFAdrtn
         zS8jF6UBcK33ogi2UF2F3RAs6diM5HOoePLdeROPilTTo7YK/9AqLzOiI50XnCLSLtR7
         Fj+2EVjiYvhpFaj08Vlpi4tp5L5AQQNt2CQj3sMkTBdPzYcJtbQf+xLlJcbss2B2tkbl
         phzWY2YxOZbilgHjXBB6UjnF5QkAFjvhqxbN+dyqkQCc9d0tdWT2SDTYmnA18C1MXmha
         9oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789883243; x=1790488043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xdh7oWEQ9m8Qy+E3UVjKRIovBOhuQDCeQrchOYtk/I=;
        b=K/O6CuTKRV7OcKe/LqlVTV3M4Asb8kKaVBQag3MdDOmYXWhzxpxVI3excIs2dnAsJE
         1QI9McAX8lQma2MX9YeBNEBnL/EXEkpxjEZFY68fFdld2EImcelrSvreI8H9ukTCn0SG
         oNy9UKePjTyXc+Pu8p8n0pDT76tZKV2CK0bU3dSammusqUPijXpsKG7ED8W8zLwHSn0z
         ZBHQgA9OYzHhryZzTEoiyh9rqAbXl9JDZAeDBF9VgzuyU601mFGFIZ/znb2WO4/yHvu7
         BsKVWx2aG8lwz0OYfAyssQs87NXMxCLmQdWYnRdwIRuJl0A7GIU2usqSDOpc0eR2AzFN
         qt/w==
X-Forwarded-Encrypted: i=1; AKwUvBxvRwNgz3jddRFWd4xgqelOIrgQ2PDQue/4hj+KnmbEKw3AS/KieDwSWBt7vnpi8UsOkw8XU8jEibBYMDk=@vger.kernel.org
X-Gm-Message-State: AFuF++lot+M8DHU3LFb7BJIgmMk6iPSzduvO2hvaWv36XA3/att2Dwgb
	WFNXlimaK2XPAtCZJsyUQ/q+n0WoPtR+6y0csa3QmLcpwDruk2XEQ8HOAjfh0OQI
X-Gm-Gg: AYBFou29WYfcNuxXk4hMMLweGvkAropOYVu8U4o64HH2NfhmYRtG5njU1tvKG7yC/Ti
	6dAk0vG2HYjZ5gQVftp5xGh6v8dsb1EGB2Ry72mIxCaKplDsILflPIzCF5b/tnrsR/Em3KWNtyd
	h2RsIS2pFlITSuRz7nolNuGcy/xHp4TQC2Kl5go4Q91mE4xGW/y+EWiwP01uZdp6bsR6RcDjl18
	9+3O079d56Iav/mcjm0FN2mxlLUiq6/ef6F0HI8J2VFtG25TsAL1Bq5XhEBsnGABeZj/2i1agkJ
	amw8BxYzDVzKxKrbbFYnDndo9wpfWBEEfg97KbuxN6g/zCAeXnm69ePEWSNjq3xiOvMg14YzWof
	Vf6dzu8hBGDc3TSvRyzGBR1eBERfhzZoiHZA2WUjOvWlJ/04Nw/o/XzlbDKA4IRkS4F2px2wPuu
	d4upu7dvY7DTvsGAEd6J9sA2dx1FHbGyajzAw9sfZMcjxap+6USvA+5PfkkB73Rj8=
X-Received: by 2002:a05:6102:158c:b0:7a5:2427:ecc1 with SMTP id ada2fe7eead31-7a55ce7d127mr3164716137.19.1789883242711;
        Sat, 19 Sep 2026 22:47:22 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6aa41dac0sm4521732137.2.2026.09.19.22.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:47:21 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Simon Horman <horms@verge.net.au>,
	Julian Anastasov <ja@ssi.bg>,
	Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>,
	netfilter-devel@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 nf-next 2/3] ipvs: tcp: enable per-connection secure_tcp in state machine
Date: Sun, 20 Sep 2026 02:47:07 -0300
Message-ID: <20260920054708.988867-3-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260920054708.988867-1-adrianox@gmail.com>
References: <20260920054708.988867-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let set_tcp_state select tcp_states_dos when the connection
carries IP_VS_CONN_F_SECURE_TCP, otherwise keep using the
global pd->tcp_state_table (the netns default / or if nomem).

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
(no changes since v1)

 net/netfilter/ipvs/ip_vs_proto_tcp.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/net/netfilter/ipvs/ip_vs_proto_tcp.c b/net/netfilter/ipvs/ip_vs_proto_tcp.c
index fec0e8b47b71..3b9a2c8e9a52 100644
--- a/net/netfilter/ipvs/ip_vs_proto_tcp.c
+++ b/net/netfilter/ipvs/ip_vs_proto_tcp.c
@@ -451,11 +451,10 @@ static void tcp_timeout_change(struct ip_vs_proto_data *pd, int flags)
 	int on = (flags & 1);		/* secure_tcp */
 
 	/*
-	** FIXME: change secure_tcp to independent sysctl var
-	** or make it per-service or per-app because it is valid
-	** for most if not for all of the applications. Something
-	** like "capabilities" (flags) for each object.
-	*/
+	 * This remains the netns-wide default / global floor (e.g. when
+	 * memory pressure kicks in). Per-service hardening is now carried
+	 * by IP_VS_CONN_F_SECURE_TCP on each connection (set_tcp_state).
+	 */
 	pd->tcp_state_table = (on ? tcp_states_dos : tcp_states);
 }
 
@@ -479,6 +478,7 @@ set_tcp_state(struct ip_vs_proto_data *pd, struct ip_vs_conn *cp,
 	int state_idx;
 	int new_state = IP_VS_TCP_S_CLOSE;
 	int state_off = tcp_state_off[direction];
+	const struct tcp_states_t *table;
 
 	/*
 	 *    Update state offset to INPUT_ONLY if necessary
@@ -496,8 +496,10 @@ set_tcp_state(struct ip_vs_proto_data *pd, struct ip_vs_conn *cp,
 		goto tcp_state_out;
 	}
 
-	new_state =
-		pd->tcp_state_table[state_off+state_idx].next_state[cp->state];
+	table = pd->tcp_state_table;
+	if (cp->flags & IP_VS_CONN_F_SECURE_TCP)
+		table = tcp_states_dos;
+	new_state = table[state_off + state_idx].next_state[cp->state];
 
   tcp_state_out:
 	if (new_state != cp->state) {
-- 
2.51.0

