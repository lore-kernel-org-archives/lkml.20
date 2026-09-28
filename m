Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E2C4DA9C3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637584; cv=none; b=BTnKE1LkLVTisKcvzYy6/m8MG28yaCuv2Y507hs5cT4SATh0LBVSq7Vh+zgrPq3tGsy3JRo+q4VVCn3TcNavER8pL15vCRuKvCrkcmQpQ3yCuCnkYN56HA0xSfTXSxv6i6NfAucTH6o2a7RmypMFzbBfGUu+DNgWIZzbcfS43lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637584; c=relaxed/simple;
	bh=EHfy6hM5pM0etoyr1TjkORgk67ORR+GOL0Tj6FPVj0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgQWBm+L88AqC1XJijJok5fubnrJok8bu1gzvOQ8gkoUSHl7F9NSw8UeY4slhMVphEj/5fXx/8bPApWVseQybtcYGza/+QiRt1f21iCjraJzuwY5c1c3puqPpfU5zWyNWUs/89JK+XZ7hV9ul1KNN33XjIhs07plw5ZSCbtUB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KaPsGlIl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GIScJTrJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KaPsGlIl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIScJTrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
	b=KaPsGlIl9i4TUHckJy20OqmUhpXGBcKd9O5YtfFsFDZXTBPMiBg9xBy7ABtsiIZmoayRvu
	YH9Ycrzey0v6bGRL6aOUKXrHF7sex5l2TWM7mRILnKjs2orKSGB7zexIX2k/4MSlCkwxmg
	UoAPZD+QBqsH+Zeyzp0ndj0eybqO/sE=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-Xz-ZIGZsPLO0q279_NdUIw-1; Mon, 28 Sep 2026 19:19:41 -0400
X-MC-Unique: Xz-ZIGZsPLO0q279_NdUIw-1
X-Mimecast-MFC-AGG-ID: Xz-ZIGZsPLO0q279_NdUIw_1790637581
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so5524969d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637580; x=1791242380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
        b=GIScJTrJ8jz+Jj581NlR8fmoLb3/PTqMvVW+cwre4XOMmz0OqdgwcfyLC8UOu+znOU
         cVjXUZXPd5zAc94blgMzSQX2Bd5RP95WM8BXZ+r6FMoq+os416Qj2YKi8o/QRbpGLtlj
         C5XImynsKSs/2PzEGtae+PGxLE1oWpEQzgl7rfRf3FQqVTnEWoqPt0T/YmLyqe2Xj58d
         dMWfumh9Sm2f7GQJXGKkpdzzeUEOj5tPevM0sof+M2kvaEKt+6UTaR5nXrpcMfnyOIxG
         /4Yff4F03d7VDlLwPnrx8RCev1iawX8v5m+xAdgejOjLlEIbkSpVWKkk+Yh+Q9AgWcAL
         gwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637580; x=1791242380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
        b=14NJ2rBkiOHbs6BClKpYn/MuU7+/5YM4Rq1TJCHQxTJ98ni23WSuho0ZOusEx1RCpX
         lUkfJyKrNf3HLfjc7Kv6h8rbI0Y6zsZsu3sEpGU0f4K/Ul93EfmBtZZQfUs/pvZEIwxn
         v6iYY9KLsw8agX8B0JBPA0q5WrxlA08YBLiX85NwHtqzha0Wt6z1jzLxnNKRZWUz7+Ac
         +HGHmGM4rRgFXZR2TQ6RMMT7pF1f2lUy6IYAoiRjgn7aooBxHHa72Z591+dJ7nYNsw4E
         O5UgDYGIr+YVUcYQZv0JbmZ0rIqHj6MyeIQWgki1ICB9sfG3n91+lt06uxeGKZTuAPj8
         HkDQ==
X-Forwarded-Encrypted: i=1; AKwUvBymzGj9Go3+8hk0YNyVZvG4Ib1IdIbyLdTEUPC3LCUapdOl0R3P+Ciu0ugCuopSVlPJFwE7PVcgvK8W/8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUNII0mtT+mXL7zZpwWP/vcpsq5Ho72B6M4q39JpKTMVNvUsnB
	WKSLyi1i8GXkiDA5oXmXJduD+F5HeE+ucLrxI2GVhiqkGaFZYmZXmOxAAXJD7aN7mhJ2gAju3Wi
	UrcYs9QNyxEXUTAdj7iUEXXjsVb8p3M6jO6nRJmdon1JSB//OAhbK3zF0JRugO+qSew==
X-Gm-Gg: AYBFou1qEWcbsSvUytJ8Pgt65wckxtDEYKsgY2Ijyab9ehxCtQR+OS9ogmAXWtXkmRh
	8u00VW7zJPI4cNqWEv5GFApzl8+knqsNXgTOFiues+CzeDnsEVXNF6tJXY1Oyv8ODWHv1Gq2je4
	nEltVK6dJY5mFqEemtTmdGuPYI0OdJFJeJ6qTOLmk7wGEtTNiwsi1mPQKC+0k/d+sWkPFbRd8DV
	VGRNh/5ZT9XB2zF2MCYtM+eacIFZw8asTRoSFXIwGM8L2O6vB9EjsDDGWf/Wk/izF2WyN/CSHLf
	xS73GXtPvmR6C0kkJ2ozlcs4g51fvyIrzOz+hQJGMgIoD30qdZw09Q==
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292557d50.129.1790637580575;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292538d50.129.1790637580114;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Date: Mon, 28 Sep 2026 19:18:07 -0400
Message-ID: <20260928231807.1757995-5-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
WLAN and Bluetooth.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 01e286cb05797..cd878340e5add 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
+	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
+	};
 };
 
 &combophy {
-- 
2.55.0

