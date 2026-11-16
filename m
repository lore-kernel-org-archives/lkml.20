Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846887;
	b=04+2GmI11Eo0ggecVkTj9U1YC18knbmmxNc9E/uSFbDDcI9czuJOXDp6cJ1RI6HV+7O8
	 J582LtWgUIdKsubMr0fFY7IU9VYRdRqTW9Q5tb9t4FU2NxmkUiDA52778WzqipuX8QOGN
	 EfTmii4C8CzzetqLqysyxv6p5gMA7AzpCgKRL6FZlVPIH7wl+WsswTcl+ssyT1mnEUxWH
	 NXtcvpcbK8mtACG/gV+1snwboHCPMixqYfNx8wmtUYnjCyeusPMZRcYIPe5CPmTjdblzd
	 ECc9TEp+3qxavFhuB8hlJ2Lr/TSPdqqQlNClIzET7tyFJwu9YjEbbO5OwXdJxpbphxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=u7SuGvPOuXWl2FwqgVcmSAlbzfCb6z2QvbEIeAX56l0PdTjbcPpCj2wQe+N9MFXURjz1
	 iFMo5yg7LJ2bve7MT2U4d2bEcu1JIXvtOyIZKJxIz6hxjZiZvQvPsmYfKWOoNOjZEt6Jv
	 jiiUbH5o5n7ODLORIdmJCM0TcDt84x2jH+NDbSQkZ3Pb2YpmwahsJeuEw042+GcTrPz7U
	 jPhIeGi6gGHqw9QcOxqYHoVb5t1BNVHkpA8OjC/Hzp0mcpfxhX6cUuQsPI3OlBlUx+zXi
	 OFP7jb1shhDJIeZleM6gVmTOWYYovTGCMY2T49Q6V5LefZDlO3i841YnEt0z5+DeU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB260A3816
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CB260A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2022535f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846885; x=1795451685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=SBGFb2rsyAC9jD3tKgIN4fbPBUpUflk3N+UsFIOl6hllQuxDBI974ZDeG4zfiA4m3D
         i+1u24Eixxy0zg4L3Ip6vxy3euaXCMj4p/hu0ibsgE7wNq4A9B2t38HnaCjuWBjublSo
         AgZZm7Ko3xEkofFiMYmKJ7W1wTaFPx3cJ3Hde6N8Q1lHwf0QF4YmjoTJx2qh7PcV3sFj
         j1iGRovqL9Q893jbcc2XadWmXvnWiaQbQfFljwjSBqieZ/Pm80eWAcoQIySi5pv+/g0Z
         PVJ6Kyq6k2aV5LLCGvYmP/czJeatXy13/S/cIQKYftUaX4GpEStdHCfNLIGYjObx6tOj
         +t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846885; x=1795451685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=X9paZkge7g81agS6ym/EUUuhOeJGiIvKINnmV1cbnGH3m+8Ae/2/qKMJ3OG8g84zuf
         GuMHBpERFDS+Jppzdy16FnNUYpShGVYCOofvmKZdPCABb8BUQr1LoGIvLnsuj5ZZGAJb
         AwiM2t2tQ/gHvs8SFmpcTAmA1xLe2IgkXDt+BbdTSLSGRSvl4/lINryvKY1/E8kjeXZ0
         5d99UeALCrm1OSWSqze3zPe4/RSb2j1lZJzzKSZJUXbDaXw/+K82ohcooFxWQCGYjbwj
         1lCNSmb/iLvtob5w48Jn9QLZjLsFO/naH9kBuV6KR057yADeqwb9ditYYpdnfsCS44gx
         BJdg==
X-Forwarded-Encrypted: i=1; AL+hErEEqy4VrzfuCUMLLBIOkiWhVe7jvOpz8AeuBnTNidGBmtz5PAxagazxzaowk1wkS/7HzLOhnC0f9l5IeEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8voGkwaFJZ0SxLe4Qn31r4FOSxaBlB5Xmr2mIEcw6b2/ikUW9H
	62nFfE5FoAfmEnysHlu3VjDn5N8sWDFyC5EJYL+EuORwXwWU6nCnnbR8
X-Gm-Gg: AZFdTZcY+BCSDwba4ZpIV79uS36GHl+pLZ5Byz5fzq38wfUCBP4C4id9gq5kBN2KIKc
	0sPeEUqEUwi8O0FtSh2RcQ2zIFZKRxg9fPDl73lgFnmocTjiHPBsUwlAYvlW2Mp/xmxGBGCIFEZ
	esPMQwqbIiQIfniBu4Ropoiw+wnVnYmSrHQPsShIXbx0poqWHADWvtaf7Qsw4jm6TXUWIs3XUnD
	uRTv6+DCkBwbwJi2v4PFOV9pIz+G5Wki6uwdFPk4dJeKLnGDCZdiS8KBR793oF1wHeeFqMeugza
	eGQojjtRAZsE6A0+EKm7jGBJI8u8LFwJCYWmrazKo95BDr2S9SIy1I5XoYs3gTlRlX9NZlG86HY
	FVaLJWvItw+sZL1xOpC4BqS/Zf8yf3rJrVBSe7kwo60Ke3ag++BiOjW0TzZpgoUEO/35jEqU52Q
	CcuaVFPLa7bVUDRD8sHc45EtVm8k0SNDP6S+zJo/m9KyXnl3daxzmI30i+D6dIGx27VgasxVS0v
	+IwcsyAIbmXmP4jPGl2ywVeK+UVg+ZyB3/eshn8fetvu4SBQUG52OsyejGIaySv3Ui4XP5RKtMJ
	56e8nAJwNeL5mTUG0U+WBrt5QjdcsiBEN87+J20ekXI+gQm2Er+pLi+SW5AOEbdXAByEblaTxCO
	+qDeCYh7ppMA0+l68bRMkkPQNK+UIYus/Vw==
X-Received: by 2002:a5d:5f05:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-49c6e4a344emr23224419f8f.5.1794846885071;
        Mon, 16 Nov 2026 08:34:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 16 Nov 2026 17:33:55 +0100
Message-ID: <20261116163412.551438-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
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

