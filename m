Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B6735028D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700468; cv=none; b=DnXEqZJ04hVoUU9gAHHrWL+boaq7cgk2EkeN4lLnEDkcyQyrlxu2FvPdKBvHfKVXkTawQkxHZxH3g4uNPAjceTbxnmXKCWxJMAZqB++2k5M2TqKfz5F/f6zASKABNF9ZtzUecx2BpT1XeN3G7vbLOkj3UbWXjFc5disf9179Gks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700468; c=relaxed/simple;
	bh=gCdi8+mm0Hk4Y2N+V2qNeLa/lwj5SzUh6zHtJRCkuD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chCihQAyosDRPR6x7MaLLGMPYjYmqJzLs2w/u7sbmsMuzLW8PG0jszRy384CWMrgJ/dBYZs6qvACD75faLTTM298C1VckGZ3zeN/ksuRF3yqXlKVLxECUH4HNMGm1wCBZm8WQ1ac4H83ojSAy18qsl51cSIr9DfTie4aTx6Cm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkZX2juc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkZX2juc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d7195706f1so28525335ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788700466; x=1789305266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHTtcI2u5c1IQWlhLu218IwbzGxGSXh7P5dm0KOUeao=;
        b=HkZX2jucpX5riF0SSdReo+jhQ/Uz3qvUz2h72obwcS7mFL9EfGXb7LqVBQhLJp7I4r
         UUDMSfCoq+gzj5EcjYYh5M57OM9l2hYg0YAkFUtjHBknUDdv+DLtR5tHI8WjCMotW2lU
         vEtDak0u4AwXCjWcpNCA5tkEOTbjHQGjKXLgizgffgAR9OPd+fSm6duoZaExqL5eP8GG
         xlcY3Cq+Sc/kBJe64D/VxuRwhq0TIdlpA0WfFxXFj72SIifB0qa5FfuGdjzy5D+TOTEn
         LKwj8VZ6y0ecbOwADoyIVPrfiL57IS+oVNoHbvoo+9ZNA87Ta2LbS6crKgpM9zoW2wFd
         KSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788700466; x=1789305266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHTtcI2u5c1IQWlhLu218IwbzGxGSXh7P5dm0KOUeao=;
        b=otWaMNVE5weQvZwVvq1wK39hxHpVJdYisR8Hd0G7rwF33CZaCeC3HGZ+YgvnfbnaKc
         iZiKKR9rrYY/Z3a492+nskzM8JsAqAiVdBNgAgSwgmh41TZdOFBBSlMQNtg3kjL4d/ci
         tN9/++T7h9oyBDWdEiB4G9Sc9fleuEZvg7i6/o9naxpdO82G4rq6fhWUpUKd0VM+MDjT
         7uoFxJDermFk38CO2twFdf/fvF5dMb9eCiQpSL1RZOuDYhSWeMrr25R1LDt5l/gd1QtU
         wIq4Q7k1xlSu4jou0acy/gMsdlF2hd9WX1jZcDcD0HwjwKnj/CWpzgHDhmBlrvtnkiqT
         DFAA==
X-Forwarded-Encrypted: i=1; AKwUvByZCvwVlEoypQ9ZnVxrzhWl+QtlycCWDlU03B7/8AioU9EsYjTlWstY3mL1TqJnN9hHGfQrLLaoRtnECWE=@vger.kernel.org
X-Gm-Message-State: AFuF++njI4ypOvMF9BAbpfpWJAtoeRoiEZiY2O4D0eaIzmUz3TkOpq7G
	A1S1bzfqR+jfuoy5SH73aGIq460OO4jZpi1RedRUNbMb8C2PvBszcP0Q
X-Gm-Gg: AYBFou3Py3+9erXoWVjPowdI7jssnDOG35RRk9/7fFVXEd4g2mUk9ONqVmokNhR0ohB
	A94VsNKAY5Ix+eplO1ME72dXyjEqB8VGiEVlRpQEbROqA+4NJVfksyZLigvs7qWN7LG87Ffl/2u
	TdUsmd9jlYcJUO5ONHwDL7x814wkGnIph1LkooqKGW9zOytnoGL/P0Aj86kutFdtbbKN3sana02
	8Bw+g7fSShBBnEehajPEWpGaXw+gIW16vtaopOuxY/l2H/4ofprBYV9528GckT8jRlrmm8jA8IT
	0JipuWJbgZDEqxKirkCjexQHLAHMKVAOtAMt013xd5nbS5D4dqM4wQo87mvDXTeDB0nzvcCKhnz
	liPtOu1DoyZ/n6XkicE1hT7/8Fx6m/N1frvQQFKAI9q5UafSJp3DvOsZ55pQQPMhiPqAT2N3hx6
	FeRcipMQlRmXpcYRxu1OUb5ObY7IYww4LYn501qC6x9/iBV5K2CxhWbJG7ZU3Zqluef4fkaG556
	5mcwpNnfzbvyw==
X-Received: by 2002:a17:903:2349:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2db125a5535mr260508125ad.2.1788700466300;
        Sun, 06 Sep 2026 06:14:26 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b2f8sm32259965ad.21.2026.09.06.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:14:25 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/6] net: dsa: motorcomm: MIB fixup
Date: Sun,  6 Sep 2026 21:14:05 +0800
Message-ID: <20260906131414.2683362-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix (theoretical) MIB inconsistency and prepare for new devices. No new
features are introduced.

v3:
  - fix build errors
  - fix logic error on MIB buffer creation
v2: https://lore.kernel.org/r/20260904162952.709368-1-mmyangfl@gmail.com
  - split patches
v1: https://lore.kernel.org/r/20260903143514.532023-1-mmyangfl@gmail.com

David Yang (6):
  net: dsa: motorcomm: Rename MIB stuffs
  net: dsa: motorcomm: Split MIB buffers
  net: dsa: motorcomm: Split MIB module
  net: dsa: motorcomm: Use u64_stats_t for MIB stats
  net: dsa: motorcomm: Fix MIB synchronization
  net: dsa: motorcomm: Use safe 64-bit counter reader

 drivers/net/dsa/motorcomm/Makefile |   1 +
 drivers/net/dsa/motorcomm/chip.c   | 408 +++------------------------
 drivers/net/dsa/motorcomm/chip.h   | 122 +-------
 drivers/net/dsa/motorcomm/mib.c    | 429 +++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/mib.h    | 167 +++++++++++
 drivers/net/dsa/motorcomm/smi.c    |  30 ++
 drivers/net/dsa/motorcomm/smi.h    |   2 +
 7 files changed, 667 insertions(+), 492 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mib.c
 create mode 100644 drivers/net/dsa/motorcomm/mib.h

-- 
2.53.0

