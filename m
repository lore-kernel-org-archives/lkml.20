Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AC5499F09
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810652; cv=none; b=OdjzJ5MpPMGKJ1mKlgcwgGP1X7mUvZ7eK/Puj1XDXf5R3N6LCcF1a/aAqpLk/ml4FI2CHTRVVM0oHUr+oKfQgsOSCMYwT5yp3hsrB1o9Ml/6ySSmLkNoIYOwfMHhtoe2cCqGWx+9Ly4faSdpjJgUCqoIjtxKBcDexeKRM7+olzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810652; c=relaxed/simple;
	bh=HSDehu6zKcCUBJdvUllZcY/3rbhZgfYH1a08z42ov6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfM6O0bgPWL3OShF42wO7KzoWGPAUHXt5FisEg8+U77CraCWPCIOrdUm/LS80bIARykqp++Bc/fM09k3q8j2qdeQzJlxy/GDkyUzsRcClm6EAaSZds2Wq8mHX6dYOD22GDavGXkPsYVOX59ZcbZ7/oFe4sBY+eVPaBvhn5mFq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=hfRMbGaJ; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="hfRMbGaJ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso139419e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790810643; x=1791415443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQ0OdnmP0LrZt1KQaEY+HbbBliVRtQdPTnqFkA08fMc=;
        b=hfRMbGaJdcpBdtIGMJxRIq2iw4T/NxcgRpKtcDBIlcabytnsiM/71lP1qeKMViArDI
         tlBxNMhhsqUHL6jWCamYUfhHT/jVQP15JqICFO2ASvEbMtA71ET1S9RWMi46ZLkG1dSY
         4Tvn3gipduLCs3NblV0PyRxxL+AIC2bBr4C60idc/PWNgYjSKBDEeAU+qs1lJsQNYq05
         tS8NXsWw6YnI7U4GiwshmvLNPYWCJOx4yApqxUirxuK53VRpIEA3txAYj7WztILAk9UZ
         M9Nb/sFeBaISO+KON64pYqtfAo3CSzZRfsdmvefJoJt5c6pf4eB+b6D8gD0A4q8gr2rV
         7Bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790810643; x=1791415443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQ0OdnmP0LrZt1KQaEY+HbbBliVRtQdPTnqFkA08fMc=;
        b=2DugNdgxHM5PMLx9wH2igjXMH9mcoqCiN3FvV0x00KmaP3o7ysuRRcciZGIDFvncar
         fgYvWz5I/1nP9czXVDY9lGCxSDECSOzMWrvozKfWi0bJmFBV9UbRSo1zQjG+z3N2wJlz
         7eininEh5+FefL2gTPFEUUIbKBRRv1S39TFQmBzAQrd3E6STTMPyHpsziPquqv1vpIAl
         m0OgxKV7wc2LOV/Jvo+CbTrnOco1pyjnnxbhPhPJGr7kLBTWuQadZia7U7WITMFJTxjG
         OvUUdOq3DmAXdFMo1n/n7990Mj113kPTcsVc2hqJBMDbsPbW1WUIrhYh1x6x8SHALnH0
         /jPg==
X-Forwarded-Encrypted: i=1; AKwUvBwK57+ZaWXMLjiEWfLfcd0kyAaFlc6gxstSP69DBiFTppuNQrPZ/AaoHGeZbsZy46lU6lAN8QNOL7YD2Zw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy+jr3lIxL5+1YIc1k613dt0baaOJTiU8KWi5+LEyDmNPFWrGB
	znTf50PcSN7gA/MauDRjh9LtK4fDHz6alejxwrSbUibvCFaNDrl2KMZ7ySoVB/5rGENd
X-Gm-Gg: AYBFou1DaYY4CpHvGjY0sBsHA5tIuK0heA9tzspYSgTHIIL/UTsqxkkcrhWwT4o2BOl
	PGFjCk9B+yUl1ROWV8ozhT5pIrocqJi2rRZG1HFzSRjVF/V0BAX1i3mrgFh8IzQLVekxpIQa9KR
	CNe9F5G/SFAG4gYkqdMLMe0FlqCPfodsHwA4P3+FI59SQVE9dtNqNDvPo6www4W7g/TpKOXIkfX
	/Y2Ea/R/1my2wADfQyP7u/MLnHkDH5UGX8QniwPxVpteV1VUgAII6H5OgatbDChhQSDL0UVhzhg
	Sks5akiY5UAdbgBjJNgiQQxIx2xj0YsSbCJtkMrBIcwZTfkDXGamT9WfLrZlQvfSMRgrcUsEnJF
	zuoQuHzLRUGziUUg53a4Pq3+2lTRPaiQXfT8esSaBoi3maEvcXwOlE9cE7YndW6mc8tbIqBwDJK
	WvgCxa28GuzheW32QwK/z3dXvEUeTjYJunscPVc4c3kWZMdWhFAlZzi3fnWrEecCZLQpo1INtCP
	bGjdaGDSd4=
X-Received: by 2002:ac2:554a:0:b0:5b8:f960:1bd8 with SMTP id 2adb3069b0e04-5ba40608d46mr811098e87.61.1790810643087;
        Wed, 30 Sep 2026 16:24:03 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fc8023sm279117e87.81.2026.09.30.16.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:24:02 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: [PATCH v2 0/2] hfsplus, hfs: fix B-tree node leak on hfs_btree_open() error path
Date: Thu,  1 Oct 2026 01:23:10 +0200
Message-ID: <20260930232312.1405042-1-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ea8cfa5978a90d27e498fae626edfdae5bf84af7.camel@dubeyko.com>
References: <ea8cfa5978a90d27e498fae626edfdae5bf84af7.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the hfsplus B-tree node leak fix.

Slava, thanks for the review. Addressing your points:

- HFS: you are right. The classic HFS driver has the identical leak:
  __hfs_bnode_create() hashes the node before reading its pages,
  hfs_bnode_put() only frees a node when HFS_BNODE_DELETED is set, and
  hfs_btree_open() does a bare kfree(tree) on its error path. Fixed in
  patch 2/2.

- Dropped the inline block and the duplicate variable declarations. The
  freeing loop is now a small helper, hfs_bnode_hash_free(), reused by
  both hfs_btree_close() and the hfs_btree_open() error path, so nothing
  extra is declared at the call site.

- hash_lock: correct -- it is not taken because hfs_btree_open() has not
  published the tree yet (it is only returned on success), so no other
  thread can reach node_hash. hfs_btree_close() omits it for the same
  reason.

v1: https://lore.kernel.org/linux-fsdevel/20260930185033.1335238-1-guvenlik@noroxi.com

Changes since v1:
 - factor the node-hash freeing into hfs_bnode_hash_free() (Slava Dubeyko)
 - no inline braces / no duplicate declarations (Slava Dubeyko)
 - add the equivalent fix for the classic HFS driver (Slava Dubeyko)

Mahmut Emin Kurhan (2):
  hfsplus: free cached B-tree nodes on hfs_btree_open() error path
  hfs: free cached B-tree nodes on hfs_btree_open() error path

 fs/hfs/btree.c     | 34 ++++++++++++++++++++--------------
 fs/hfsplus/btree.c | 35 ++++++++++++++++++++---------------
 2 files changed, 40 insertions(+), 29 deletions(-)

-- 
2.43.0

