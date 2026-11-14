Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636052;
	b=SH6stFotQH55pc3AWSW6dv/8vkUwbs9J1SGoaZ/UMZoEH5tM3btA+C0FAB119ZZ7NEow
	 Usa2dvtGTL5QAPQ5smSe92+e3pNrNYCP3LLdtPeob03eGOANtk2Se0WDHrrX2Qz5xFhpX
	 w5Y9uv457WubB6SKpVI6HYlT/WDeJggm1cdH4nAmGqABoxeqXRoHxnaniWt1C13Mb/4wq
	 vEeZrM1EKpxSTWC2AznHz0+G7G/5nbJ5T5i0PIuJQtcInyfpyB19ypcgpWQ2HsA5OjPaO
	 o5hA0GOvlaznKZc3W+Y0pgP98th9yqUPb833lSIw6pKo014qGCiSPZTYZm5dwTFLREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636052;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XT7zRCHvVyruRHBRUx/XsXN32kUCmgefaqjrYi/Gicw=;
	b=QJisbP5LEVFTr1tyxK01mE4rGQAwSmrb6m8jtIoUJ20A+K1ZVNcdajk2+nGbauz+Hd6A
	 gtEbFKX6UGAbFqHsXL7znMU0b7MzduK8UEGLjJ9GiT+1ejc75HGQWQoiw3zjhNzj1I/Gx
	 7SFsDw9fCBEcULoh7v53WPaZB3eoUKdRow4m/FeS9TAWm2Bc60h0VH9N5g3TNG/DGkJHv
	 lpIeGpnKJakUKrkd18wrsaS4psImP1Jnw+iTXMCcrqNJHLmJOsDD2WwXBHs7pz0orEJ6m
	 WAdLRS7aStCU7IafnOlRnANaPnXed7QZSpgRwiQy/ySVelIE3Jp9VWwQMw4fsV6X+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=EdBZ27ZQ;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435E606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6435E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=EdBZ27ZQ
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F2A58402C7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794636044;
	bh=XT7zRCHvVyruRHBRUx/XsXN32kUCmgefaqjrYi/Gicw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EdBZ27ZQh9bD5H5sOT2VKMI0YxhyhzDu7qRYbi3B9wdciSdg6CKRORrM9wPNCO2Pu
	 2uXM/mKytiy+nVm0nPiuFMI2JLJhYB5iHF0ibHDRqxGMhBSlgczmIDJUmcUDD4C4MN
	 WYQOYmBeCLWNxTtSt1rDC1l88gIhHHyAU6qPKjP0v8PxCD9161kRbOvZby9jf4SgZj
	 unaAMFr2plJxgXjR1NrpJTcxxu2fQU63v+l/iZhki6s+d17QofnrcQePQ2gk0qndHE
	 Rlspr69VsXemsMML8HoCjWSSgQVDFlbGm7VftKVgjGkRnqYjUxs7M4RK+fux1o1hWt
	 ZMO8xNizD6AD7uoQ9lcP1FVhEIY3Zpkj0eVVjshx3xM2dhFAJ/HrqCV1atTrCOsiCH
	 bhdree+Grt+Od+Pi7XuouLxPg6L7B8d08zRMDrv7zWjeHzDewMOaxxZUdGJ4ZoPOEn
	 1bC8sG/oVOD03MKNygXTmsUkmMTmgGzmkqczf90+YRT1FxTm8YqTI/snmgi/aJUF27
	 Lwy457cpfS4tUtIBd/XqRewcVjc9EkM1AEm5tE7CpCvScCE8kMXYHBPN4Wi7pns4Qc
	 B+Vz5ZC1KO7cy6qvLvcRYI2O3Ks3ttYCKDEI+4Hbf1fZ1iCZ4dWp9fFQ7+VpGdUDri
	 tvyjnnJUAqyPj2JZnkHeMOl8=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1497177a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636042; x=1795240842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XT7zRCHvVyruRHBRUx/XsXN32kUCmgefaqjrYi/Gicw=;
        b=xfuxkU0vYJ5JeexcnbzX61ikSD69yRtybJ91XQz5+aGwiy/p+MR4yNuuoSlWbzHf4y
         H8IIF7w8XpXsMTfRmzGAoMVzRypAD/O8U3msN4qP0CdpXfbq636mT92L43AlJz5ulPpR
         mm/u0+dESs1+56c28VMfwYuS6cYK3t/5p2PR6DgW1AplniL5ArqA1xxtON8SPken2d+A
         S9LSa1lnfANiJBfTuEOO+YepF1B28tI09GmB79SDAnBV+K422IqGCZj9b3rZYwrU7P7I
         c/AfySYpp3/1JrM0DNfNIYGz+tE2veqQvoaT/zG2nDSanmaQTTxaUjR5jK8RegJxsUCZ
         DVaw==
X-Forwarded-Encrypted: i=1; AL+hErGUI+c/sh0GmQNkLCgoh1hSEBF1o1aOpDUTPxDhvOXy3JIBjjXwO1RBDY6o6wstzdrfTw9QBcWtuEIjfAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jPJOEDSOLjUEEk19BZ7Xg0ZYtgTGgQMdr7HiUxDsAsWnva/s2
	kXzt4AVdknrk6SNz60dI9+21mpWHBgGPCLKuq/U2JCXDX8Rto60ggpi9dpUXD4pOAkrx5KurdKF
	MoPBSxJ66PY39RNGMhPHrKRO6ICh5BM0Duhk80IddO/REG2sS4Ae1Q+z7eQiWkj2A3X5Gbc8JCQ
	BDbdlQaA==
X-Gm-Gg: AYBFou37KoSEP/C87WNPNxG+e1Aj1lAPFgCriMSbI4fCXowSqPpgiQQwd9DtX7ggb+t
	qBg8eQBlZcjyadco5X0GrbmjHztHpFw04D5Y2b25QA71WDetaAQh3gv2eXwSLTGUYM7LDp37FBn
	mZC/OZUTELi6EBl4USs6obo1iSSFhYGi+1KCx8KgCnjVwq5l7k2hdHx8G52rjniEKLxU1yNIV1G
	dD8CPGsu7GqRwyD0Ur/XLNH/qj2d+xYayzYeUPcBbzJLB13jiFOwO4ebERK7BRQtP3QftPsIber
	IYKq86/uk7sx+xc0UCTrBCJtPyvNim03oEZNGEDxVcYBjzt5R2uXNq1CPR4LSpRvxIxxSaTZbq2
	ZVV0Eiz/SAa894CTnGD8OPXO+7Bi5PavboYuQXYge/2CJTGiuhMRt3zx4e4o=
X-Received: by 2002:a17:90b:1d45:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b1b09f3aeemr4514284a91.18.1794636042318;
        Fri, 13 Nov 2026 22:00:42 -0800 (PST)
X-Received: by 2002:a17:90b:1d45:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b1b09f3aeemr4514256a91.18.1794636041876;
        Fri, 13 Nov 2026 22:00:41 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm12364451a91.15.2026.11.13.22.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:40 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au,
	sahil.malhotra@nxp.com
Cc: davem@davemloft.net,
	horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	gaurav.jain@nxp.com,
	jeffbarnes@linux.microsoft.com,
	stephane.debusne@cynove.com,
	iuliana.prodan@nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	lukas@wunner.de,
	sahil.malhotra@oss.nxp.com,
	changwei.zou@canonical.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] crypto: caam - Fix RSA error-path unmap and unaligned dst buffers
Date: Sat, 14 Nov 2026 17:00:30 +1100
Message-ID: <20261114060032.872141-1-changwei.zou@canonical.com>
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

This series fixes two issues in the rsa-caam driver.

Patch 1 fixes wrong unmap operations where rsa_pub_unmap() was called
regardless of the key type.

Patch 2 adds a bounce buffer to handle unaligned RSA destination
buffers on DMA-incoherent hardware such as i.MX8, fixing intermittent
-EKEYREJECTED errors when loading signed kernel modules.

Changes in v6:
- Patch 1: Factor the priv_form switch into rsa_priv_unmap(), shared by
  rsa_priv_f_done() and rsa_pdb_unmap(), removing the duplicated switch.
- Patch 2: Hoist req_ctx to function scope in set_rsa_priv_f{1,2,3}_pdb(),
  removing the duplicate block-local declarations in the src/dst branches.

Changes in v5:
- Patch 1: Factor the public/FORM1/FORM2/FORM3 error-path unmap dispatch
  into rsa_pdb_unmap(), so akcipher_do_one_req() and akcipher_enqueue_req()
  no longer open-code it twice (Sahil).
- Patch 2: Do not overwrite the caller's req->dst. Use req_ctx->fixup_dst
  for the DMA side (mirroring fixup_src) and drop the orig_dst/restore
  logic (Sahil). Expand the commit message to identify the caller that
  hands in the misaligned dst (rsassa_pkcs1_verify() /
  crypto_akcipher_sync_prep()) and why the DMA API does not bounce it.

Changes in v4:
- Patch 2: Describe the bounce scatterlist with the aligned allocation
  size (ALIGN(dst_len, dma_get_cache_alignment())) instead of the
  possibly-unaligned dst_len. Otherwise, on
  CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC systems, dma_map_sg() evaluates
  sg->length and can treat the already aligned bounce buffer as
  unaligned, bouncing it again via swiotlb or failing with -ENOMEM.

Changes in v3:
- Patch 1: Dispatch the error-path unmap on the operation (the completion
  callback rsa_pub_done vs rsa_priv_f_done) instead of key->d, so the
  unmap always matches the map.
- Patch 2: Bound the bounce-buffer copy-back to the RSA output size
  (key->n_sz) instead of the full dst_len, so the trailing capacity of
  the caller's destination buffer is left untouched; add Tested-by from
  Stephane Debusne.

Changes in v2:
- Patch 1: Add Fixes: tag; pick up Reviewed-by from Sahil Malhotra.
- Patch 2: Move the !bounce_buf check out of do_rsa_bounce_buf() into
  the caller rsa_bounce_buf_done() so the helper is only entered when a
  bounce buffer actually exists; add Reported-by/Closes and Tested-by
  from Martin Kepplinger-Novakovic.

Link to v5:
https://lore.kernel.org/linux-crypto/20261113113650.63038-1-changwei.zou@canonical.com/

Link to v4:
https://lore.kernel.org/linux-crypto/20261111230221.40297-1-changwei.zou@canonical.com/

Link to v3:
https://lore.kernel.org/linux-crypto/20261020025426.955531-1-changwei.zou@canonical.com/

Link to v2:
https://lore.kernel.org/linux-crypto/20261004210200.290119-1-changwei.zou@canonical.com/

Link to v1:
https://lore.kernel.org/linux-crypto/20260821045555.806471-1-changwei.zou@canonical.com/

Changwei Zou (2):
  crypto: caam - Fix wrong unmap operations
  crypto: caam - Use bounce buffer for unaligned RSA destination buffers

 drivers/crypto/caam/caampkc.c | 177 ++++++++++++++++++++++++++--------
 drivers/crypto/caam/caampkc.h |   7 ++
 2 files changed, 142 insertions(+), 42 deletions(-)

-- 
2.43.0

