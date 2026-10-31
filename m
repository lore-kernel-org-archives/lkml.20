Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408559;
	b=frw4eIQQll/fGl3glJCVw/FiNLv0RhjVRiAMYd2DCzWcNPNB5ymkvybAVkKS5xYcZjfW
	 +APTc6Kes0dkl+6bYaiykXYguCR2HsKuZ8hhB+OaBnWypGXxzyxBuZU/8ecChhMkCwmcJ
	 Xo3vUlQxNzImNsxHjujF0cx1+6N6PFnIsGrFnaV6RvnyvjDEHTOYjWkaQKkl8jMkkFqVc
	 VzWzby+MYt3CDNNe6dr6hbFDAW5lHS62xgQKCWit+ExZWKJG434PHjOG2yNQYeYtJg0r2
	 cf9JX1gGgR11BuVM+NtFuTiR7bbqR3jjIYulKHChU785+5h7zZZ2dZmUuIbHF5TOMzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2DmAwvnqOJjoNtG2lpJ3xMDgLKyQyC//xlOdEPBXwno=;
	b=EjJW+sfNVANSd9cLAi0SJu1aXtXr0NKHxlRMNG7GBmS617SVPeNT2pM+SVEMvmTcT/T3
	 gd/VQ8kYkE0L7mAd/dL2rSI+d3HuacjF+ngX5IziBIHgK5IgXehG3QieM4JtyvjCqF75z
	 o9biAtoZadIZ8D39fPYPB50/MngMsHrLrYhtSESSfEerW/jTUI9K8i2BPnFLDcGG+DQKl
	 tshc/sHdpSkBsT4YHMvMU5R9K1P3HOcDYcmYt97+PUuMQgdA7b+aGRrEK0F1p5pWMDilG
	 ZgKuhLoAUjrBK4Kb+blo778hbpH21DkR9Bxv7siaEK+rwAfsdYcR8zsGlHrm7I2aypQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiQnJy24;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCCB606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCCB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiQnJy24
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso1884451eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793408558; x=1794013358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DmAwvnqOJjoNtG2lpJ3xMDgLKyQyC//xlOdEPBXwno=;
        b=KiQnJy244oaL2gVFYKbKJSJ7o5NXI0yK4KsAVEJ2H9J1GndYKtuD6FVEK2TrjWkUFa
         l/Qqj8xEWGpAtL/3jkob+iAjOzSk6+JEClxi/bei0fxYEyt+t+CDG23k3ViFJoQYY1F4
         WjC9c0z+QTaMnjPmIaNoiHpYgR8+yIvjo4xactSqGBO4FSwje4V6+7Ket4ZFaBn764LS
         cDFCy6sNVCYoyeCrXwqDq+BNO2nMoGCa/8ypftm5O5Wummg3+bRKOrL3q1ZeMOg9s1IL
         qW6XD78b8i8NNsY64Gy8ae2yNYAwbaoIUJ3Sxjxc/zP43nNcNwIRVkNv1OG0z2YLqSyI
         c8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408558; x=1794013358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DmAwvnqOJjoNtG2lpJ3xMDgLKyQyC//xlOdEPBXwno=;
        b=LwGYSyiy60NotFI43MO2cXC6lp+2ru0G407PrA4o8QZTGiBjDDXtT95pRWK4Uc96fS
         wSX17KFkFo424a7An4CcQSvLEGEJXwneJ+LspmesoM0Olv9EDFMaqQjo6Brj7l4VFoSg
         VZ9DRbSKSN9PVVWi2pnV/O5kjqw6A6KRUwwIvOf4p5/IylBA71+ZfUnwpyPkntjQdNd9
         a+B/Ah3DOsvhkcoHQv5tJHUc2+5+icFF1bLRwmWwt45rVXiJhpPVwoeD7cdawpetJ3es
         6ft4HoLULU9/Oquv1NaI9vTCWT4p44oYxQXSOh8lcUL7itbMxoQyUqXiXS5qDwrM7tTF
         si3w==
X-Forwarded-Encrypted: i=1; AKwUvBweCyGZZrUSJs2zCCJ2Dz51I1PGhDIIbijHrEpoVVo6vXoY5uj2D65iHMolkA5g2UBlhvc5bg45G7ByBn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr4KdxSdi4WznxC2QgydEWZ566oD6O6B+8S52mae6s0yu85q9B
	d6rHCqd+nHTmM31gtX6sIhY2YQo6xW2YmNfCAqV6BGxoXeOllvb8TUUl
X-Gm-Gg: AYBFou1ypXMYippMXvrXvlA3ffdPYHTY8hr+YTysQsS5TJWl65ffHw3ctRkiF9Hjwue
	6V4d3J6arUNHUVSvZSpC2x4JFYmG7C8oNWBAmhswZgdLAiX6c1vxt7Y4E3DdSCWn0+mgbcvOYyy
	lmV78KG42Q7ADApPczI1K+zwRn/wt0RR/RG6F/fhwv+Ow5Blv7ZB+Qc6gWGvhHC/6wD/nTxwzI1
	yap/D+eI/gqJBT1yr9b1zRX70ODBLzRldmOwjvfu/y+0s/zaEFYcfB4FL6Tn6H2/WC6xpVkpnHe
	fNokmg52MgOcj1CuX6MVplKJ4BQzxBhM9+QVSvndQxl/QSrv3cx8u1urxVoh6/kREiiLk9DZmzB
	NCyz4gAP+zxZqF7zUrJsTyE7o7NkWPGAbJ1HqHFsW8NBkku4jfs2jCsFtfKrczGBbEvhunffIxK
	nluYfL1g7KaOuGGUG05fLj+NmG8TzLAQjRf78sGK3pDj421guuajbDk5KdM/sZSaJ+NQcJrKpTt
	vA0P1x3v+1+YcKQDeEINtb/bLzNRoRor7Mo+D9PF1xkZJ/xEgvSodxbo1N2g/08Z6+Yc1j1N0T4
	G4HPd9tttHyIC0jzXMUZoT89gJEUAvACNWJ28yiXoKJMIvFiYiih8jB+ZcDfiAPpjh35oSAy+Ga
	5oKrWiVHQcszc/cGOBTH61nX4dnBAo/NISr6MzjeoWgp5XmqUJitfb8vBD9HPi72AFrpvjIcEKj
	mxGuCqImV7c9d2Vk0=
X-Received: by 2002:a05:693c:69cd:b0:34d:96cb:d75e with SMTP id 5a478bee46e88-36a423bed39mr5898672eec.27.1793408557929;
        Fri, 30 Oct 2026 18:02:37 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm13129484eec.2.2026.10.30.18.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 18:02:37 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] crypto: starfive - DMA left running after timeout while buffers are unmapped
Date: Sat, 31 Oct 2026 01:02:32 +0000
Message-Id: <20261031010232.3361085-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

I found two DMA cleanup issues in the StarFive JH7110 AES and hash
drivers. On timeout, or when preparation of a subsequent descriptor
fails, the drivers can return an error and unmap their scatterlists
without terminating previously issued DMA descriptors.

Line numbers refer to mainline at 83f32c773255. I could not find any
dmaengine_terminate_*() calls under drivers/crypto/starfive/.

1. AES (jh7110-aes.c)

starfive_aes_dma_xfer() submits and issues out_desc on cryp->rx (lines
471-472), followed by in_desc on cryp->tx (lines 481-482). It then waits
up to one second for the RX descriptor's completion callback (line 484).

If the wait times out, the function clears alg_cr and returns
-ETIMEDOUT. The caller, starfive_aes_map_sg(), subsequently unmaps the
source and destination scatterlists (lines 520, 540-541) and propagates
the error.

Nothing in this error path explicitly terminates either DMA channel. The
descriptors may therefore retain the ability to access their mappings
after those mappings have been released.

There is also a descriptor-preparation failure path. If
dmaengine_prep_slave_sg() fails for in_desc (line 474), the function
returns -EINVAL even though out_desc has already been issued on
cryp->rx. The destination scatterlist is subsequently unmapped at line
541.

Since the RX descriptor transfers data from the device to memory, any
later execution of that descriptor could write to storage whose DMA
mapping has already been released.

2. Hash (jh7110-hash.c)

starfive_hash_dma_xfer() submits and issues in_desc on cryp->tx (lines
150-151), then waits up to one second for completion (line 153).

On timeout, the function clears alg_cr and returns an error.
starfive_hash_one_request() subsequently unmaps the source scatterlist
at line 235.

The TX descriptor has not been explicitly terminated before the unmap,
so it may retain access to the old source mapping.

DMA provider and possible consequences

On JH7110, the AES and hash DMA channels use the sdma controller,
associated with the PL080 DMAengine implementation through jh7110.dtsi.

The transfers are flow-controlled by the crypto hardware. I could not
establish from the driver source whether clearing alg_cr fully
suppresses further DMA requests, drains requests already accepted by the
DMA controller, or retires the corresponding descriptors.

Even if clearing the register prevents immediate further transfers, that
does not by itself establish that the DMAengine descriptor has been
retired. If the controller can resume the outstanding descriptor when
requests become available again, a later crypto operation could cause
accesses using the previous request's mapping.

Depending on the DMA mapping configuration and subsequent memory reuse,
such accesses could read from or write to storage belonging to another
operation.

Proposed fix

I think the error paths should explicitly terminate the outstanding DMA
operations before returning control to the callers that unmap the
scatterlists.

Specifically:

In starfive_aes_dma_xfer(), synchronously terminate both RX and TX
channels after a timeout, and terminate the already-issued RX channel if
preparation or submission of the TX descriptor fails.

In starfive_hash_dma_xfer(), synchronously terminate the TX channel on
timeout.

Both functions execute in the crypto engine worker context and already
use wait_for_completion_timeout(), so a synchronous termination call
appears appropriate. The cleanup would need to preserve the original
error and account for the outcome of termination.

Would dmaengine_terminate_sync() be the preferred approach here, or is
there a crypto-controller-specific shutdown sequence that must precede
DMA termination?

I can prepare and compile-test a patch if this direction is acceptable.

These cases were identified by a research static analyzer for DMA
lifecycle ordering and subsequently reviewed against the source. I have
not reproduced a timeout or late DMA access on JH7110 hardware. The
reported issue is the absence of established DMA retirement before
unmapping, rather than an experimentally demonstrated memory corruption.

Thanks,
Samarth
