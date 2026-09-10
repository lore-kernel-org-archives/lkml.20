Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E803AE71C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084480; cv=none; b=kR3OFW8L/OxY2AA1l+Y9LM5rmfDzfHwt8tuO+2ZVqnE+zYwc26mwNmE+6AiI6UYCY3Jij+Mna3EQYkl13yjgH3+rj+RTbn88Kl2lmVhjx3KQiTE9tLfO3ECmEwGA8dt8tuDm8X4CFN1GMX1F10vvYn2+W2tNtYjzGlMlJqLS7hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084480; c=relaxed/simple;
	bh=Ft7f41YWg68luqVZMqHB/DBFbLfPIbAPmFq3513RkkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WhaqwvIW6hR+ZwEjocz+CVN1qQJNJdukrp5gCGVUxEI7RrPpfo3vhZV7Oyj8YHWi8xSyVo4ygd+rSp7F9jKQMHrXLE0UsDAmz3gcmTlA0LyB6TeJp4qwNXGkgng5dG4Gg/G75CtxDPr6BHxIvPn4riUUmzEL9cFK69KTtiuGAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBJzcfz9; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBJzcfz9"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so5351471cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789084478; x=1789689278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xr4ylB1KGaYrjMDmEnz8DBoGfYS3HjosxfsRR5CFGeY=;
        b=YBJzcfz9XjpnrU+MP3E6FepdMnL/BoE1VGxYBQQWMaVKdNYkpQ4CtAA4diNtbhN1mN
         0fJnbpBY/vv/7cN1gPD9Wo/G6t4VV34Do7wYRflaER5Tmz2jo/af1kL3A/JoqcgE2VWU
         NP7p6AphoHoE2G426jHreqcam0X4LryHEaTFoLeDCFUviRUPwX/O0sj1NIU2wLtgzyCy
         jvnAXvJ3GbeJcodN3hHJV5hvwROGLXoGE7SFMuNYR9HhJ0cHpl78q37LRXEM9lyixZki
         AiHFAd9kTuIdO+F/BwMSjem+FdDTAWSv/g5TEZkXbHK6DCzmiwB8K+kOhywP3l76dWFM
         QHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084478; x=1789689278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xr4ylB1KGaYrjMDmEnz8DBoGfYS3HjosxfsRR5CFGeY=;
        b=aMeL+zAFurYthoaLsJVSPHg0mYadL0kwft44p5MsC60LnSNksy9VpIlsRwMdV0oKua
         M9By1SzjyXC1e2sATShjz+YFK+wC9En9ZQSeNikuRceu0UNSFN7VPWProUnJ88X/aYVU
         OOPy+bgbvNHeOQo/QRz4DDg2VxRsnwdLVDbj12yBOsjUl+1ka8Fpz3qCeqfDFyjW8jXj
         VrpJXIKKrzXwRmOVNmRul2KDauOe+zy02DsS5UyNUlF+NsRnAWgJP/1cmHNn7/a2nCmx
         Pve5KELWrHr0vJKepV8n9KUyGwY+cqr0kQY1CEckuhnaOamG1ugjiw2Vh1gWX89TE3/V
         cHLA==
X-Forwarded-Encrypted: i=1; AKwUvBw0S1rtSrc+rDJZkSbo8udAAAOGi3he3PIn0HInTxZRKlPMZWCLxYZraRw87YXa4wz3qedqBssXYoRtapE=@vger.kernel.org
X-Gm-Message-State: AFuF++lHdGALbcUnrqWmofDWYP0muLA0Pxd+aEpI0Yr1RagBqpiskLqv
	0+kqxTD8TeGHALez0/2PzO7VuypGLcMM0BjA+cCuMGcG8x9W5689ndo=
X-Gm-Gg: AYBFou0wP83nfpt4qj3LzCjbwrLDIPnqBtd/pHZ984XvSe8NNz5QQzEJALMuqr5be27
	STzbx3U8vDHidBHm6eP0BKuxaGXLuVvv+HYGmgp4FGqDAN4lgxAiyJI7k70uX5GBwLjoKQtQqz7
	tGnxrU5dKcybeUEgMJswwz/Gnj7IymMBeNdZ6So+H9hnzDgUslKimPCj6qKLjxOenZo0LnxL5rk
	MEQFohEbz51jNXP+fDD0Ef7dblOg8d6Yu3a1ALRop2Hj04/DAR71cctwllHlXvpRBy517whBVGl
	OF6HjEc1TheaS0XWQ61BIw+UXl0oAAyLiGkcSvhJC4gask0qZ/4LAx0hhp+E5ZZhNQaIvyhK5Xk
	MI4h0icAB03i2KGLBFKOnM2jR714FKiAyFdvpNFdsNl41kTtrcieSE58F1RetNYGi78t9I7Kcpk
	AN5jjU0M01dK1Gl9o9QC/ya7erZlwhmRS+3iE0DUZwqj2z/opBcJOiygCEr0cwHr2Kry1shXJRc
	LvnYLfMQsRDy34lyTY1ULXA6qBS2/Vj95awsOMIEawVGB3aozkif64fb0B4Xmpl3VLVBsTEisfW
	cx07GKYossRSuCTxCavKelGHQgDmMNryug==
X-Received: by 2002:a05:622a:229d:b0:530:2146:81c with SMTP id d75a77b69052e-530c8525903mr43339041cf.12.1789084473405;
        Thu, 10 Sep 2026 16:54:33 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca48912csm6100771cf.13.2026.09.10.16.54.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 16:54:32 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: Krzysztof Halasa <khc@pm.waw.pl>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexandra Diupina <adiupina@astralinux.ru>,
	Christophe Leroy <chleroy@kernel.org>,
	Ijae Kim <ae878000@gmail.com>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/4] net: wan: fix FSL UCC HDLC lifecycle bugs
Date: Thu, 10 Sep 2026 19:54:26 -0400
Message-ID: <cover.1788128904.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

The v2 review found two pre-existing FSL UCC HDLC bugs and asked that
the generic HDLC behavior change be separated and audited.

Patch 1 validates that an HDLC protocol is attached before starting the
UCC, avoiding a NULL protocol dereference on a premature interface open.
Patch 2 allocates the suspend backup before disabling NAPI, so allocation
failure leaves the running interface usable. Patch 3 closes active HDLC
devices before detaching their protocol and documents the audit of every
current caller, including the farsync probe unwind. Patch 4 unregisters
and frees the FSL UCC HDLC netdev before its private resources.

Patch 4 depends on patch 3 to stop an active device while its protocol is
still attached and before UCC and DMA resources are released.

These fixes and changelogs were prepared with an LLM and then checked
against the cited source paths and call ordering.

Changes since v2:
- split the generic unregister_hdlc_device() change into its own patch;
- audit all eight in-tree HDLC hardware drivers and document farsync;
- fix the NULL protocol dereference reported in uhdlc_open();
- keep NAPI enabled when the suspend backup allocation fails;
- rebase the series onto Linux 7.3-rc1.

v2: https://lore.kernel.org/r/20260803133048.42650-1-mhun512@gmail.com
review: https://lore.kernel.org/r/20260806020541.2011936-2-kuba@kernel.org

Validation:
The series applies cleanly to net commit 784450234395.
All four patches pass strict checkpatch.
No hardware runtime testing was performed.

Myeonghun Pak (4):
  net: wan: fsl_ucc_hdlc: validate protocol before starting device
  net: wan: fsl_ucc_hdlc: allocate suspend backup before quiescing
  net: wan: hdlc: close active devices before protocol detach
  net: wan: fsl_ucc_hdlc: release HDLC device on remove

 drivers/net/wan/fsl_ucc_hdlc.c | 29 ++++++++++++++++-------------
 drivers/net/wan/hdlc.c         |  1 +
 2 files changed, 17 insertions(+), 13 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.47.1
