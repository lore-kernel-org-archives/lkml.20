Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618903;
	b=FyMXzAshHBVI+YnFVjq3paJTapua2OBTGqe2LSlHBgRMp8s7WIRrJ4EZ6o3wRn8mcEme
	 o1DnA5ZFeeyFHF1cdYwnoeWvP45snxl4twduetQ2lLBIX3wZibkzLUN9H6QJIlfTzPCT5
	 52wqWxBm5iWX2S3dMoSOjZGrwnqJI4XSuettKqTgm8SknF79fwklKeJu+QSvJvUfE7fnW
	 Z8c2NdkRsiT4zLE99ap1+evI8KZgRd1sXW9V0aUcgXbMGn2JuF8W6eXW1ap+zI6rdw5tS
	 NRea71cw/L0Zop1BxIK557fFMeUq/lb/MNa/HUqgtKJG3UUFFlCaYgy4hdm9ImjpbXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hRF/O+HDztPNhQ+cHx55rMvIzqXoQlmaSvpEgSUWVkY=;
	b=luEu+kiFseVd4LQPhUiC3VvShMNZJafHZUfRUtdjO2VAfAd7INJvQhBo4ATfsrCvfFlw
	 RYLOPxtfxCA40EKt7cca9/gkRHdoiYTh+KSiBJUDW1ezNbW/MORkgioRGMioAEGqO5lvF
	 sxJraayVlOJXoUPwrSpyzMAyLfFblqQDdQnpolKaVBaANwJofawpwY0vpZ9Cyi99SVFiY
	 bYwreIlaF1TamOQgIOGLpRbRIaTKxc27zRd+pRL0hmOKjwOuPPZCSFGsEMEdFADOWp1CR
	 7IfsWjN08UHRi3Jbq6xBiekU8mU6t9i7h2Kw5tM+oKOjB0dLc/Xz70n4U6nmTPOLKIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhtuID7y;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65D360A2622
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65D360A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhtuID7y
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so26887455e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618901; x=1794223701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRF/O+HDztPNhQ+cHx55rMvIzqXoQlmaSvpEgSUWVkY=;
        b=IhtuID7ySkIXo4Hk9MeFfA6vlePzqJmOzJUJEnLzMrG6bvadSvIlRxxnMAqBnGupC/
         SOAL3Di3s+QkKmeoJRXnGdPTNLOdJm9PqvPUYMlRU4hADJNFlTA8jTAn3ZsVoZduKkqp
         srCWnJ2DH0udYfv3spRh7hj1K0FkJzkoYEeUtoNo9iLU8dcocoWdx6PSptdc5nzS6VZC
         Z2qZDl4jgWX7rkaNoRqzqiv5e0rlfWwubo1SSgTJ6w5Y4KCZspsgOooDJ/PpnnkS/6/8
         ZnsY8XNECzBlHthEpS8uhvGsMTHLfYuiELnKUZGjdB6JBqw59dAX5h/H4x+7EoWxnS9b
         yeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618901; x=1794223701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRF/O+HDztPNhQ+cHx55rMvIzqXoQlmaSvpEgSUWVkY=;
        b=ZJ+6ZAWysgtPZMqSRpmPCWnTw1tiNl4IRX6zG+ffNiVd/U4PKMp2WmfM4Cm9OrAYSW
         Bo1+q+RDGrDSeGaQEJ4DVnjFiXAVr6YkLyUQtburB3PZP5NgshTpHpNmtYiXf7Ua3eLx
         6kPGuYANRljmUQNp5Dr4MecjDQsJmsDRvLw4AJSaNjFBZ78JdQOIAFE5/4QwftNMEN61
         e4PIZajbbjzv5zHzwAsi7EL+loWY6Hr4KCeg5y4JoML3oHQ0+jLF/LgUJwllxQpMi6VO
         yPu4EuWylOnunBisaQXkh4mz6sPuuyAcF3Oz6q7Tk/CuDEGQ/zUnauZCEC487t1GUELd
         4fhQ==
X-Forwarded-Encrypted: i=1; AKwUvByS8lE8VxPE3I+HajC+p6Fa3IxAuuVhcgF3dALMTRWH7qady3nhKOmxL8gQ+PE6KEVBEfrQVU1xa1sTmsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6OMgxRxebUA6JCl/ykOImX0g2/Ru/oDfXIi8uLKG0VN1Lk201
	QATsVZUOHfFOpAB6U3N0nufXqx8uOKP7hEnFVX7JxfXYgmVuEMT9APNe
X-Gm-Gg: AYBFou3u2/X3nA2tIlqyYKEYJrGjSf6nP76Iqz+LyfaMmNIvIjWNkDgzXFYhjp5FiF8
	UsTidGcQCQ7BCcu7zsIW1ItdAX1LQGzzK5iHB5q+ZB/jU7Mm9fwJ9ddQRIEZGsXv27TXx1saDj5
	ECp7+7DcHV39dJBDbDgQnR6d8RAALezMoQWiUrL103gYYWMiHhxKkiLJSNmpaIvI7bbwkQuOlhT
	kIJQ8trio/mLDijI2CRvKSviXSagVfmqRoXdNWMzLUYoocsMaErsroRny/MbjCfYcqa8ZfC60y+
	YsPOcNMe+Pri8exXrx3qrc1Qvk6dN0zaJ5/dZrKdEudj4LOQyaIXdHoRIPVztZEF+Mz83gEq0TT
	vsCPgZcdHM4c82+aCn8DWkS1Wylapb/asTfTDT8Ysjo9EFyT9mZCDYE7/tB44MMEQXS7Hh/rVRB
	rYaoiKKhwB3yhwCHajR4FKVYThEPd2L851NTSd7twmy4ykwii34UcSL1nL1f350PC/GHu0xzkmj
	zQ7aZq4MFvPOcdwYTygfAzut1RHKlVl/cHDP4550Vfvz0REJsUi10suNgdi1AG+WQ7pQFOKhl/M
	NxkGv439ek8j1Ny7rNiriqIs1C27q3PgSsvqnUTuxDWUduJNfyX4opvbxUEV00U/S0i9DbAYgsY
	BlE9BlrCRgq4SQl6hg0c8Kn9Mh0JAJ6RntwVJdkPkfkjH803308yDgx/G7yDYLk38BqPxNCN06P
	CbxPFaTe5EQNgKzYiZ4gBOutsok2NAWU8VSY/PdDZVpc1af+bUsX1teA==
X-Received: by 2002:a05:600c:e558:10b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4b0a3074938mr46301055e9.10.1793618901203;
        Mon, 02 Nov 2026 03:28:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f91d-46ab-c9c7-94fc.ipv6.o2.cz. [2a00:1028:8388:a84e:f91d:46ab:c9c7:94fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm311382215e9.12.2026.11.02.03.28.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 03:28:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/3] net: mvneta: lift the per-queue TX rate limits
Date: Mon,  2 Nov 2026 12:28:14 +0100
Message-ID: <20261102112816.12322-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102112816.12322-1-pepe.schlehofer@gmail.com>
References: <20261102112816.12322-1-pepe.schlehofer@gmail.com>
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

The per-queue rate limits set by mqprio stay in effect after the
shaper is turned off.

mvneta_disable_per_queue_rate_limit() only changes the mode bits in
MVNETA_TXQ_CMD1_REG. The token buckets keep limiting the TX queues
with that mode as well, and their refill rate still holds the old
limit.

Refill the token buckets of all TX queues at full rate when the rate
limit is disabled.

Tested on a Turris Omnia (Armada 385) with 10 Mbit/s limits on a
100 Mbit/s link. When mqprio was set up again without a shaper, each
TX queue stayed at 10 Mbit/s. With this patch the link reaches
94 Mbit/s.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index ea755cf05b9e..9b9efac2846e 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5204,9 +5204,16 @@ static int mvneta_enable_per_queue_rate_limit(struct mvneta_port *pp)
 static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 {
 	u32 val = mvreg_read(pp, MVNETA_TXQ_CMD1_REG);
+	int queue;
 
 	val |= (MVNETA_TXQ_CMD1_BW_LIM_SEL_V1 | MVNETA_TXQ_CMD1_BW_LIM_EN);
 	mvreg_write(pp, MVNETA_TXQ_CMD1_REG, val);
+
+	/* The token buckets still limit the queues, refill them at full rate */
+	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
+	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
+	for (queue = 0; queue < txq_number; queue++)
+		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
-- 
2.54.0 (Apple Git-157)

