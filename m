Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794134450;
	b=U/068t4QXFSCgKUtFSTbg0uEZnZ01ms+EsH7QGyNp53CWrKRcR2wckldfk04N/32m9/a
	 Ec/bJbR6MJWMG+sWnlptHCSxlNte0g6VMJ46+CCOIihytZrcdAu6knMFbiCANEHHohpe7
	 y/1/qtCeSdnJEJhY9T+w/qX8hxjmQuYxfDuQdmiEEJjQduC8odM5qLVenPPboDif9+gdY
	 Y1j91F4bTz3ALwaJpav8HGVaNQxAlOGUVAZhMBnzHEGsIjMP6jMiJNLmw27BdF0Hbhlxr
	 aNFPdAV75y2y+DgDWHIpWM7RTeKPkACG/09XSiO6MCc3xt8qj5X6W3GU+vVZ1ql+q1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hI5wV3V3vozZi1HhdmXT2xHjqsg5h5x/8DZnssR+H1s=;
	b=k2Ji1dKVUvsZoxtNNND15izgduDrktyqOJJZa4CpsbkseXM6GyEg8N5TEyLRtCfkWgL8
	 tYRRRFm1noLxKF5UbgGf4BV45Ewbst9v8fa8Or3yRumFLWit4hpLIslpk/HbZTacnKkdX
	 3s6Ou+72XgV1G39zYe6XXBrqgOTG0PDw0RPPBN2WIKARbk3CtsBY+BrSi0+CbsjhverzU
	 w7QOL3pnjyFVXxz3KUugIen90yckWI0Vr+pS+HpU/TJeNnPpvxoW+uSsYo73Mjri9QUNY
	 l/wl18N+W39oRfUidXkD56UVUysXljZTO9rl2riQtPimIYSd18KNXNNa96fP/9gkItA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohRQ6iJ4;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D7606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohRQ6iJ4
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so7987a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794134448; x=1794739248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hI5wV3V3vozZi1HhdmXT2xHjqsg5h5x/8DZnssR+H1s=;
        b=ohRQ6iJ4wbszgq2IRy/MehqSnwaeFCGJcF8qB3YBq8L+Rk6WX3Z0ze1I72w+yJiOX9
         FYdYUqwC77dnyzTN5SLpoe94OZ04uDevu4LSD5gJJJL08Vx8GfKmTpzKt85XFZEGEF6g
         G8HClXK9XXE9vio8uhQWbmM9f1h1XAnGJNEP5AquHJF/btblvrIcmMqMe8uK1PyyWvuB
         MRQjxJSM7aVWixSaVgSXHPeSBf3qRVCHATxy9GjmwOqwKijYtKj69EW2RB8hWqFkebY4
         i3FWoSqau00UEafFQH0Qan+j2SGs0rbTow+ULzA8m2s4W5PTJJdQ1GDNv2DJXxogfH/u
         wdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794134448; x=1794739248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hI5wV3V3vozZi1HhdmXT2xHjqsg5h5x/8DZnssR+H1s=;
        b=sMKvildBF2OVfkV3NnMKYl9YBRbEkqHF4SWmfyNhdavi203rT4tXMAYReB3vlngeWD
         qFVm51gIfecMugwcslmjir3+UGKG3i5ogu4vYwrxfDHoTrpYR3SYLH7BtspNrUu7c0+r
         QsdZKVuOyeznPfMAur8zKgVALMU73wK5fDHxnG6o2jkbNKEpbHm2ESEYYnlhvByrLtAK
         OUbVlEv72K4E5xo+H3BsNKY1ScOEdhRbkHc58KS5q131q13PVNdt1/uymIIKCrUJxdx3
         KYMBvxbKY+PQSBVTu6gXYnTaE6wOcQHN2nHjhgOWlrDfL1HKYM/iVACpoVwzR/qAh+u1
         3x/w==
X-Forwarded-Encrypted: i=1; AL+hErEVnsQ9JwpmRr4STbO7YoSVeiVPG/ngota04xBgdh02SgG6Dv9s2F+aKBiuFmmIaDwCW0VgXvcZXVrdD74=@vger.kernel.org
X-Gm-Message-State: APuU4Z9We7Ibauwfn2/4bNWSVO6HcfVrIVYZ0GHYFCuI/lvqLDN4XcfU
	Llhw0Mdr9YdA44i95VG5va2k38gL+w94abIre0RQIY5fQN6SbHkxc3/zVfvM8A==
X-Gm-Gg: AYBFou3Ex3iAdph/TLc0Ua2f8k1FK0Z8VS6dTG5fEBhuE++vhKG6CBx9fGyHdMWh5JR
	TP/FWDcPTbxkXM+vtTc/Coix/1owJhkuSCkkxeLxcqdANV4KI6ifUfoVi3dRD0wr+nhdxyDrko5
	HXlGRQn9YBMViGJR2XtZPvOOUAqfGZzoZlpCQq8jsqaW6VB+HbTbaeSV0Cgxd1HxzSRDw8Lq2XX
	0sgoQvSqHy7Dln2t65S8/j4Q22q4JkCIQNXc69ppT8B2mWlfQO2GY6ejcIk7xtei4sTqmc11BD1
	gexiE4YSzKexYDsfuL31yi84SJs4VzSosxEvmWM72UaIRhfaufkqpELELsMwARUHc/wuv18QeOq
	i7/zWHrOrpkLl+PZ+3SKJDMCOue8l3jwzrjjhN/nY9Ol/YS+Hhq0u/njCWIF/ajShVtEBVJFJHF
	QX3d1Uk7CWGUu/6H2V7wvydM7Wu4PYtnJXdFLOsJm9Piy2/KUzeHMryUbteoE9uu2fmXc4Qwnkw
	OvqyIO1/kP5aaDfSHveAjwVbzrCCUIcaFsjLqubYv4l1AazuwRMXVKaRQtNf5Akx0I1Ahl5fs4A
	p23RPnnHnV7oQLWxGw721apWlf0KcFlw4iCdFlj0p2lKYOHL0IQf0Q==
X-Received: by 2002:a17:90b:578e:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b12d388298mr932987a91.40.1794134448311;
        Sun, 08 Nov 2026 02:40:48 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1032c4508sm3724945a91.2.2026.11.08.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:40:47 -0800 (PST)
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
Subject: [PATCH net-next] net: dsa: motorcomm: Stop MIB poll on link down
Date: Sun,  8 Nov 2026 18:40:34 +0800
Message-ID: <20261108104037.1320166-1-mmyangfl@gmail.com>
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

The poll re-arms itself unconditionally, and link down only cancels the
work non-sync, so a poll caught running kept polling every few seconds
while the link was down.

Cancel the work synchronously so that the re-arm from a running poll is
rejected.

Not carrying a fix tag - the existing behavior is harmless nevertheless.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..758599ba0957 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1837,10 +1837,9 @@ yt921x_phylink_mac_link_down(struct phylink_config *config, unsigned int mode,
 	int port = dp->index;
 	int res;
 
-	/* No need to sync; port control block is hold until device remove */
 	pm = priv->ports[port].mib;
 	if (pm)
-		cancel_delayed_work(&pm->work);
+		cancel_delayed_work_sync(&pm->work);
 
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_port_down(priv, port);
-- 
2.53.0

