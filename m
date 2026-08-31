Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415823ACA5B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212873; cv=none; b=pOWUuQfpaqAekH7aesMHSRVZZ7jw9sWf2m6tQK3upbfEHdAERM0REnCL6auBpgU6Y3ZzKVk5GMEEwvXP1QTiMnEfU6ObjJZCuT0rIo9nsJaqFAosk4IkWM0iBMsChst8omDFh52ur6W7aChWDU5rm5uxfnIraxdtLHFfbe/nh9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212873; c=relaxed/simple;
	bh=ynypFeeMcVFHMmyNNm3Ko2CgLlcEE/Akeh1XxvChmQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJUkJU8IuwVPOauf9Epy5CAc44LGuvLQZPe/F0vhTvCDrdBTJb1MdnITMfTa8ooC6GFa39zXORneCGhkL8JZfq1H919tHxjx4auG3lhQAIgOVsh0Sx9Lark5uKCKu9bxdZAZyx382CjGwuiUJTb7TQU1DIIwYFmRKCOKOvkMNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxdnpo+V; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxdnpo+V"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39faa67fab8so31648301fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212867; x=1788817667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=;
        b=nxdnpo+Vjak8AQiAgFi4numunHqmLzcIH3ThaNDlmAuvcu6UpFx5Za6MaKngv24yaO
         9/6P/Um1Qi9ZLxlxjIISUXTph6BdqZOZCFMNsvFf/4zBK5VSAj0ovmebbqCXLQ5j5S/D
         pGt29061RqOuhShQaynnn+qmE6UwBLR5PeWoU9fdvUVnneziiHFVkyGvsZ7SgmIH4V+l
         YHu36H/OmW63lOckPiEVBIPLmWjKw1Cm4WO2snhVIHH9q/W5mfRKX3Ke9Qu+OxUKoRBC
         f6j9xSpZteWwVAcoSsM2bxAXm9Ym3VmDzvOzwLEpmtX2cxlTo+g0IIPVIUUZTyBK6hDK
         +IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212867; x=1788817667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=;
        b=O8Xhm08A5oHF9Q2IQu7i2/Hms5scneWkVFrodZerpsb12Orc7ySlAf4DkDfI0bl4lX
         QSLy+vtAqtPTjoPubQu/k2TXsLRvwSZeKYPQsvgNrk+WVsN6jwSVAW79yheRJX4E52In
         vJW+RJq7qZgEphHbZ4Pre6ofwiDf1m/9RWV2+IZ3ai0X1srsBvFnzX+z1r590lJuptL1
         G+o6q/IN8/Vg7zhj4OmjGIMMbugtp8I6OP6dJ443Md8mEk4hSKsOVyZGhkw20gp2mbvC
         uUPRN9djqotvKNsavmKxojo9XaJvVvcxbPWVvX8evF6E0V8lI4fbVDV68vq7P3dGDNeT
         8aSw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ1mVaz6qYaCDN1oomtmjsCiXVhH1z9MET4ng7eEDnPDh0Ez5edk7zuhHaifPSdND+/gOB1EOZwFGJ50M=@vger.kernel.org
X-Gm-Message-State: AFuF++lHz3pvOAyr9Loj4c9p6vK+HU5hTgHgxz9mCBC5W9a/D11UC+8X
	UUNqQffXMaq7bWqlZVSzANkKPRG1oA/hu6Q/E/DDxZVz2dgFFZnFDZ8=
X-Gm-Gg: AYBFou23z+lidchW6XJjkFyWjvCFJTJYbyiMoNTsWrhEFFadjc3IErhWQLS/JGcKs1+
	3iM0kVtRHTHwdRixf9kurUZC6MHllzi88uwyPw5YyOMOnzsBgb2QQWMX29wVbWwJdkmj6cJvsWQ
	04yW6eetb4Sox4Qf7Ewy3cz8Fl01ac6MkYJaUUO/4lUMxm8g4IQze2bA4DcwUTbPfXSjWUXfRXA
	pgC4WExmUhtmvI+fDItdRDalEdh+LwT0LVyZdacCOmi8EvRaAG/rI6RstzJ0Th7BYx+vzlMhrAM
	unsmRWvHIGLMXM9teDhxxFqctySUf3z3KGcMgL/ztNKF+k2DgS/7+iuao/Z3EICbYJpN5i0LrMo
	hBj/ozDFQIXmwkUKrLkFQRHZ2WKsZsncAJTd65TxWrAGe8iBBUcKn7Yiug2+yojsuD+U9IsAAP6
	8ObTJJq7QOeQwLZ8/xFmAUrB93TT7I8t2H4/Fk9NZq07HPMuBgug==
X-Received: by 2002:a05:651c:30c9:b0:3a1:ab57:ea2c with SMTP id 38308e7fff4ca-3a33948c4e0mr10050771fa.2.1788212866759;
        Mon, 31 Aug 2026 14:47:46 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:46 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v2 3/3] net: airoha: grow the small RX rings
Date: Tue,  1 Sep 2026 00:47:01 +0100
Message-ID: <20260831234701.206021-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831234701.206021-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260831234701.206021-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Raise the RX_DSCP_NUM() fallback from 16 to 32, the vendor SDK default,
and give ring 4 the 128 descriptors already used for rings 2/11/15.

Ring 4 is the shared "force to CPU" ring that airoha_fe_vip_setup()
routes BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/PAP/IPv6CP, ISAKMP,
DHCPv6, SIP and LLDP onto, so it sees the same bursty non-hashed traffic
as the rings already on 128 while sitting on the smallest allowance.

At 16 descriptors the completion stall handled by the previous patch is
readily reachable: on a Nokia XG-040G-MF the recovery fires roughly every
35 s under repeated PPPoE dial-up, and negotiation never completes. At
128 it did not trigger once across 500 forced PPPoE reconnects over 20 h.

Ring 4 and the VIP classification feeding it are shared driver-wide, with
no DT or hardware property distinguishing one variant's ring 4 from
another's, so this is not scoped to a particular SoC.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index c195dad5ed58..0b7c90940272 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -41,9 +41,10 @@
 #define TX_DSCP_NUM			1024
 #define RX_DSCP_NUM(_n)			\
 	((_n) ==  2 ? 128 :		\
+	 (_n) ==  4 ? 128 :		\
 	 (_n) == 11 ? 128 :		\
 	 (_n) == 15 ? 128 :		\
-	 (_n) ==  0 ? 1024 : 16)
+	 (_n) ==  0 ? 1024 : 32)
 
 #define PSE_RSV_PAGES			128
 #define PSE_QUEUE_RSV_PAGES		64
-- 
2.55.0

