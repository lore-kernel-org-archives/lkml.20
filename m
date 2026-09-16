Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F82563FBB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602762; cv=none; b=N4ttiEj7Ld7AHSEHn9799mWlv6J5xmgoKnLx7+jT6+WLMsXC6R5130V9j7jQ61sb5ioaLIhaL/z4Xd+rVUXwwpbCKH7kx3hEoZsJN7OHBwyEdiUgxHmHIMZvqR241IApcaP/3ab5Z4XO5W61XcTThY6GpIT9q2yyyyHONDLjKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602762; c=relaxed/simple;
	bh=cXFXLP+NjYWZtJpQfz+KEsHtZfam6Old8yzjXsddKto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sc94MnDAvoINFdEWtBm/5G2V+MXXy/cBzemcdfTcXkPJKUOKrHoYM3b7HshGScJDYjUuBauqxZcGJ4Mo/mL/CL0l0Sv4Er9B2Etr86z81etU9LLDlkDVFWfPp11PH2rwgBQHXBLYw9MQd/EHUKRRHktbZCV8LUoGWObe44YwAAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7VeK/o0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7VeK/o0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ecdeso237716f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602755; x=1790207555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=Z7VeK/o0Hki/LXVrrrkPm/toPwU7WsGonTfv71e2ZZEVViHfelDod8elIyMqGb1i6U
         Jc1ohu8eXp7kqtxUVnfBQCk+ezruz2pUNSnmlxEJOFb4nHjeBmRb4c4Qp22H1Lg2Io2M
         nSePr300R9xCT2UkvCKEf9QXidhYYMrQmgCMB9wUg4Qm3OAL6Y5W1krCb0g0A+3djSvw
         IXD3/tOpxrVx6MZWt0pknH1vFRiCzpNK5KQIosnFuph1i8YUJQAMPx1BKVJLXEW4Y9gT
         vWxnWflnLlZE/bShebjbC91EyVYUHSfccBkPUCl80FfvzoeuJL5UCtb7Yx5fjYyo7kjS
         Sk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602755; x=1790207555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=uFqPPBdCs1fjivpaSqSeg/sgM2d/k/1FqObsQr1famMxY+94Xs+5IqyTEYi6Svpuzs
         f9iBUdTDs5/NnKu2oEBGo5+JtCUVy7rloKKQTWdBwLKEzQaXy2iKyl3jGEh2lxefmYrd
         ZmJECUR2MNhdzJ8xU0S4Ng3TqCMkVlceejyniXf+9SK+hxK5FYp53ZHFqJL0Jg0gEHCH
         +NyMfQZe9tfUz+smHxUeCA78/fhl8ubla0R5AhOjdLgN0ynjRMzv/8/9Bip1mY4X+m+U
         Xdoly6nzbOFuQ3UTXRGm02OONG1SYXCDxVaCMmJhKgWAvKjytKYsLZ5Zyms079ogijGz
         L/VA==
X-Forwarded-Encrypted: i=1; AKwUvBzYo3QoqL6UevMy9UNLoH7iYDzxoYVb1gQfBlGT1yh1TKiFlV7+EP/5qo+nu52rIwe0eNhHdfEvRzakq8E=@vger.kernel.org
X-Gm-Message-State: AFuF++ko20lTw9qe5BYBGJ64rStx5QRqoWAAXkRZWtncybi5fErv/SrH
	L1GdtCp66errXNdVdLEESkXS/8MS7l5UfjT/GLNIKDi6DPVPm9iJ1I4dH2wiFg==
X-Gm-Gg: AYBFou2UJWN0ZpeTDqlxnw7FFzP2OAvmutvE6s9DRMyYjvkFDGQVY5vOVnarmL5LgnH
	mmULNAJYHolrIHF3wwc+x+6ETbKZAhep5ZwPydJRS+UNnQAqYAKFSD8gzt61tc5qOTehksDLgaD
	elB1m2dvjs99mZTktM+Nf/abFs+SR0ucE1Se7t+33uc+Z4oSXMPZTUzRQdUhr57UnHKZMZLU8C0
	lQAqnizLin9LW0wCC5UxCjGmUhgkRsy1IPVv/qKiiNlW2FIA2wlJSdyEvIrUmo2Vq9HxihWh31I
	aNsCuPifA3QUZ43tDPppANps9sFiq/WNQ01apeQX9owMvXuAftWa5Vs3oL7ySZ45Tl5EC31WRSF
	OBkD6AJR+p4M6CyNuC/L1TPZAfvfIqHV8vfGndTwwLhj77Y/80AZA8sqLQgWMvL9DVmyGy/zD5y
	alE6MfHmB3zyclaToWPwzc57A9s0DLwqpl8VcGYDEyOEQbPDqDsOGZOu8YyEjVWuLkux+UeRcy/
	877vtaP0QlSBORck5NtwtMLF+wTdzVL4hnFoauB1BUey7ueW3KSJlvZrGHhWL0=
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr5407208f8f.22.1789602754931;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v16 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 17 Sep 2026 01:51:34 +0200
Message-ID: <20260916235200.20712-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e04d92d1b09..35e20ddd018b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9755,6 +9755,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

