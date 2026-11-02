Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635107;
	b=4ggk3mjxWOKDYR6rWO3JlteX1Q3MbYjaQNkAhd1kk1eCzcU+3jCXIPM3LoTHtLb8w/Sl
	 Hqr3qqU0nvLzH2IDH2cdqv7rh2t8zDrjfXOfRN5ORBRaSem3QUffLU7hYITZpvrjB8v3v
	 3eOVQR9TZ78dlSS9u+Bo3SABTS2c6HOG8+8S2vGUt2offfzibrDSRr/nbBUBiaf6QGVrq
	 wgai74aFnKl5m6vVi3ZESglUnppQk4sM3MbSZwx0FaMk7YIVA/vz/8nAUhYY6TbCUYsV0
	 Fa8hnKprzYpNo4qULlja0KZi8bpip1Esz12MFeeMeVEFlQmF2V2fpoqtoDI1fSp8ymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cBWZLJEjH2co87tE2DoLut1RHH5JuIQN5KXZ26QRuSk=;
	b=dr12Wl+cfOFqTV9JSATl8j4zjAu4IHYxIUlTdsFpI+MA1qFKSwyJwS6ktDnN0lWFyX8T
	 eT2P0ytAs3+k4RWTgUChE3JHO6k2c50bV4FYXP7ItgFuKmvFManQ9VfsCtMDjgg+uqbmv
	 RoIuS21p+m0yxiu4MezO2yoU3/RNYqIAqU8hNeIyUIAJ6N6MBQnx4vK9hSa+UHaiM+Re9
	 aUYIMr5zfOY+n/qS72IQultBlthb6Z0+d40dFKzFiqCQFC8epNuF79pwcUtoWlNMKSTit
	 ahKipx5rUOOKorKzyArS3fwoqyLGV3OZfKYJYStsQhtKm9m9MZPWjkPRGfJ9vSEY/jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HV8Ao7cr;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F309606EEBC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F309606EEBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HV8Ao7cr
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1432412a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635107; x=1794239907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBWZLJEjH2co87tE2DoLut1RHH5JuIQN5KXZ26QRuSk=;
        b=HV8Ao7crqWxEHHbRRXWt6HYL3Ox7AQpqu5PwnvFmItzJ3ItoF3mqbcnh8bZ59N96Mu
         tTgIS5Dsz2N0cOlgOznFx5vyHS25OlMb7Q8gI7aug62rsOSHU80F3l1PSgFA8HT0j+tZ
         1l4KdCyinXDVmVQEyodsvlTBqAcbQmCVaAmhfSJWqrE2g12puOxZhHAhHLzoafhwXzkc
         mGmcIOcB1lOZ0Hzd9cjh/mmGcKkVpJKXTxAOJPIhqQJmfoZksRW3XQiFWOueNLFfCwti
         g9sXir/Bh5igxcwHKPVolKLGb8XoP8ssWKdu2KS+EIPKZhS1FfsOs8SnKK/HBHCH7i3e
         1n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635107; x=1794239907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBWZLJEjH2co87tE2DoLut1RHH5JuIQN5KXZ26QRuSk=;
        b=MwOd9jgblqvFLA0NL8B/bTS9qDLXL13Jxuy+iNAfugWhhA5ZUXjoeiEmSrKGiF/6BA
         tn+vwi/7Jo/GtshRQrIjIbANrjQgWoYW5TcYPTjhIKm2gmSnWF11iyDfLDovDZ/HO1Mu
         DX4e2sUy4fqqZQ8/oIJZ9JAIlibWGiuD5cPZtF6j7x/QleGWS9609m0yy+NoxTmtW8dt
         lQGeY0RsiRCffxDgssPV/08cvMsytXZnKLJ7YdlsAoj0YVIY5kwAB7vZ0OBlH2apfdLL
         iWht+wt6W5n0qEB1xS9XGaGTEGiW7VhrZ/bg9JaN/KxEjLQ1IpWttCUzj+e7zO4LuZUd
         oFHg==
X-Forwarded-Encrypted: i=1; AKwUvBxzu5FOs5cwc71x+2N8bDk80+3iHb3tzK+hyHGWyY9rP3L2ukykbjunk8i9CAv4Hu19tR6S2Icmjyrw9fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fylmwxcM8YaMTguHl3aFZoVchhnb5+Fm6EhQ8Z/UqhXwWS2V/
	dnmpexEJaDAKkbiQ2ZPAGt88nld9eBaVABowBdtjlb2zGLtruUfO2GBC
X-Gm-Gg: AYBFou2D0UhWpcxKjwI3cFmK7MHZKMFw8fZrk4AYUX6EHw/GNtXfw8vDDDglL4ekdUf
	ZLv3I+Zd24f19YX67LkzLlSa4Y0TNzjlEkNCayvfFFkx5wyDsItocxY6LzOFzWFNdETkjBg7Asb
	SL9H+F27TIdPWcs68dXZfjL8+2lTsPgdpzN1bGwmVzE+gUCGshO4aXKyGwq0yFnANUxNnt6cYaf
	3+1dnZ4OE8QEjCWtmNCsgsYT3qBwiCMTcs5QLkNUiW8y+G7jlNxI3FmtUtWdkk/sqg1+z7G6wrb
	jkLokb3qrihPGUIE6aTuUHLj8N76ZVB4+g9yK0IZV6rQmJsE9Jh20rSoNc2RUPxrHahz5JSehBw
	2RRVRrmm45tary47hOKBgYYx8AGKxgDu/QzxGSAvvDZUgorFGHsfgN50EueixeZ5dr+geyR39Xg
	pk1mnVrQ9cBO+oQHVEjJMDBtiRCvKR2MqR6X4SWx/k7nOsVawq7MPyUr4JuhQAixNUthaHis5S6
	JLhPJwSY+amyi1oVDvwTukHWUaVUSpz9HhdjaDb3UnjXTI9TBpraO/yHiWBMHelY5j5vrpTGVtk
	Qmn7k7BbtL6ONxnCNiID2Kf/ACWiQdlWwHJ7/tZmZuXxESNN/SlT
X-Received: by 2002:a17:90b:2e51:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3ae8983f049mr8614269a91.47.1793635106702;
        Mon, 02 Nov 2026 07:58:26 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d429fsm19183949a91.2.2026.11.02.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:58:26 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/6] net: dsa: motorcomm: More BR_* flags support
Date: Mon,  2 Nov 2026 23:56:32 +0800
Message-ID: <20261102155641.3682626-1-mmyangfl@gmail.com>
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

Add BR_FLOOD / BR_MCAST_FLOOD and BR_PORT_LOCKED / BR_PORT_MAB offload
support.

David Yang (6):
  net: dsa: motorcomm: Isolate all ports during chip setup
  net: dsa: motorcomm: Rely on port isolation for CPU port
  net: dsa: motorcomm: Add BR_FLOOD and BR_MCAST_FLOOD support
  net: dsa: motorcomm: Translate FDB VID for VLAN-unaware bridges
  net: dsa: tag_yt921x: handle FDB suspend copy tag code
  net: dsa: motorcomm: Add BR_PORT_LOCKED and BR_PORT_MAB support

 drivers/net/dsa/motorcomm/chip.c | 406 ++++++++++++++++++++++++-------
 drivers/net/dsa/motorcomm/chip.h |  13 +
 net/dsa/tag_yt921x.c             |   2 +
 3 files changed, 333 insertions(+), 88 deletions(-)

-- 
2.53.0

