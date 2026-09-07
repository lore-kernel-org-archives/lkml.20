Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659E443E2A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774706; cv=none; b=Jg8AIOl1fpHKWuBjYoeDH5g2Cbno+JodapcClPuASqCv07X9f/Le1TN9PgI9BPqhGqtTZjwEkzCLjLBeD/7pYF0g590713FQ/lOymM1JW7Y5aWUh4u34SBvPcG15UlF0sjF3EmBcAhFd+MzzmlGLBZV99KT4ob/bYwxhYG8fqPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774706; c=relaxed/simple;
	bh=sjxhVCH/bhx/nKVoP1DpZX/8EknekeeK+5x7U2iDC3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asB4nGV5OXrYIEfi9V69LEKNI7zO8zf4386mEQ2OUgi1jxO/sxwEz/lGmZHaLRmd6zbgAVV7WlzKH9CucuU13ist3vxmBHJmRRcGf5tcFLN8dketscOnnxog+T0BiC66cqo8qiFTmB6CVCTkVFhFjNEW1Bz8VT+bq5PUVlFTTYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7Er3Pi8; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7Er3Pi8"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84830c774a0so2998464b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774699; x=1789379499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ozc5aGre8dkihgDZN0g60I/nIm2ja/LB6Gh/3swjSPo=;
        b=U7Er3Pi8zvnzDom6yqTrzUtWmIv/3wHaumifRG4ZU5vUsgavYrnB++F1VuGbld94LR
         W+QxBSIZ76Xvd7tkHiTH951As/27mF9vtg+uc6Zfxok5u9sERVvPjLGPLeb09qU5huzN
         dH1MOMpkHEhqa2LV4p49upUuCWdx5D2IrBY6r0h57Owf6C5nHp985mdkWymtHpouBNa1
         i3gOcYHAmCmjVqR/HzQGcg3wo4vUJm22UFeLphOAr6eZxpbqimI3uRUwBM/XE1Y7qu1D
         tCUhzq20T9tNA9lSsJcQ7297Iqro9HRd/9hxyH59rfILT2+Pj0Iq5rTH6lNIaKEJxHBp
         cj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774699; x=1789379499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ozc5aGre8dkihgDZN0g60I/nIm2ja/LB6Gh/3swjSPo=;
        b=tNnB4G19mkGMQtarH4J2v2okl6phxqDEpj3kC8VldoEj7OR9H5V57pH3zCjB/qSrTM
         7fQruHNDXU7CZaprUu6telNnCgNDrt6+I669WyuNi3YL54xo6Cw8VWsArA3wP+Pw5u3A
         1wpH3eUcd9lkyBvPZIpX4pkZgrhx84CaE5UeOngdOgv/BH11Ed4sq1wRjKvlOj+N1SNy
         x1cdyF7b4avYGd2rnb/J6kZrCwXe4Z8z432vbSPdczbKVJVZ6bpKIL5aqr1rMmlxffj1
         QsgdSHF82cQ21hezZTJgunoTDsRqFe+kBMlSY6GIje5EPoZ0NxAmVNI/Z3HTjkCYomAO
         AMeQ==
X-Forwarded-Encrypted: i=1; AKwUvByClUn1RmaanFH4MyiLgodK3fhU+l9/Viid7MUjtippXok6Z5K04MzcMFvpUiFXAXqHPrz9DL+SuEzE00k=@vger.kernel.org
X-Gm-Message-State: AFuF++lf7VlBusk7h+qGoFBVoACGcxB9cssTJ00lbe0Ds3Gq/l3WoNeO
	ulyOPjjyYGgUsDG+4xc3ldPOcs+1UouuJCgZJE19bgMshk/hrKeHkYWI
X-Gm-Gg: AYBFou0zZcDJtIr6BlQR4KOu++Wi3mwZSUvOqyk+0P7i0kgFxw4tBhyzL8/CgsuVQAk
	tWgmc3ahYhdvpGENFx5u9pqyKHPgMxx2CmWzgBT3Sge/8yV1PZMP4qlFdFzIcIlCO3Gzcdlqw2U
	WbiE7GEXDFfNG40H3XeemuPbRmqIQJrPi9LgUWY03ovY66yrHfR600Ek4AR33DkFx5w+fih8fEU
	dT9F26A+I0x0iJ/CWGOdoR7/QNlyqesa/bRBoWix0G5Ik4eP1YPTmu4pgUC+yzAkcUmTdObMmyf
	gaRI8IyCeqA7vszNFLOOE9N/ux9TakQZAgf5Of2j3KXIvLXBL4pF8b4zZCv3HQd6GBXBGJq61vZ
	JzPNiL4IpbU2Z/7k3JNQZMY17zRSl2C51q4iX3eF7yZFzn1JgCvs2LqHJrzkeIhYvgi6rCN+0vw
	PaxqnjJrhkGqXMimc/K/OUFDYhqQZMUBb+j0nfaSWoX7lbWhOBQcsFILSnT1/kbseLtX531F/oS
	uK1sJTWMc8c6WWVycvIr2ls
X-Received: by 2002:a05:6a21:6487:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3da3a0b2671mr30540627637.23.1788774699211;
        Mon, 07 Sep 2026 02:51:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm30049167eec.1.2026.09.07.02.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:51:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wpan-next v2 0/2] ieee802154: fix typos in comments
Date: Mon,  7 Sep 2026 15:21:30 +0530
Message-ID: <20260907095132.21244-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two comment typos under 802.15.4, split per component.  Found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

v1 went out with a bare [PATCH] and a "net:" subject prefix.  As
maintainer-netdev.rst asks, v2 designates the patches to a tree, and
each subject now names the component it touches instead of "net:".  The
series is rebased onto that tree; the diff is unchanged.

v1: https://lore.kernel.org/all/20260907064346.3288-1-hemanth.selam@gmail.com/


Hemanth Selam (2):
  ieee802154: at86rf230: fix typo "upto" in comment
  mac802154: fix typo "substract" in comment

 drivers/net/ieee802154/at86rf230.c | 2 +-
 net/mac802154/iface.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

