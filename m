Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569824;
	b=4icmMngX6ZgX5nM+LCyh+chtUvkQmveWhPSIDhVMNexmBbhue0LSGBZJNRzayPos+EE9
	 CNgCTPMnc8LC3WYawKrvp9i4CIqOtpdYzSZcFvmN7uZ8/bLdiABr4M7lYKNjJR6LWzgfV
	 tzvWJvjT79/cQYVUNC2QZCX6siLkjhAGITsokFvt9tGHyDjRUoOA2TPF12wnN8b4aXrID
	 C2xwRZFLXui0vGpTGaRHB4it7s63i0iEeMqo/F1geB9zjWzVqH63HeCBOENLhRlbzUZnz
	 N8V1U3ROTvxyd7VPDkNcqZhiegaqc3rR/ZlglX4l2/hOVjJyJlmG9oaPkcxVCjG+thA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HGeRCUdp/yqOm9ZASAHQapos9k5iYthDXsa49w7sek8=;
	b=27y3po+YrWPhrslxQUN58Cwsp9KQOMsFuHyr/t6+Uf2HDQl+IOa2YPG7tVnsiYZJK++b
	 DzJMhzDroiuTaHpvipOSO1dY/QWyyvZ+qsx+7dbxGh/V1AsC2hhtMhIiAiDpVbK6tI6yr
	 j5A8el/do76bCPcKsuHaGSquoW+ndaaj+NSwdAYlFEenTJzit64y2pq1ZaWmSdGJL0MMD
	 54FV37VMyX3rUMSaC0P4pOGmlvOf7lL+yDre87ZrVV5oUCeVgMkfoZafL4x3Z2oDJJrJv
	 Dskjg8VEsyhUpCGZ5aH8hsXj+x6vFDqSwKzku1zlUNO5bCj+IPI/l0L29cczEuSSvvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="nVgO4/RH";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD1E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=nVgO4/RH
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E7FF640819
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794569820;
	bh=HGeRCUdp/yqOm9ZASAHQapos9k5iYthDXsa49w7sek8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=nVgO4/RHGwWc2zMn7ELs3tXqFZMpt4mcZ7TsFmWwU/ZXktLXIg8kyb1gl+62lUOmw
	 kYJaAo0dBieKjSrQexPw9gzbhPzw5CW4Cet+aYMP82uioUzVAj5MJFLpr+FFkw85+j
	 mOE5x0AaeIU5cmKqCi8cBWY4nokV1TJ0Db/BlVZmMAx0aaXK4/c5KpvjcZf4LdwcsH
	 8Ly/zA+YK/P2Cw5zqQoGcJQrJtmw6ytYCGkb+TTvwONmH4LJcVTIwHq2yOwBRVAOXS
	 fdy9ACMBgAy4BnC+CQuAXsEztqMZXZDsFQj7fHZ9cqntXa4ALGGzsZ375Nd+HZY7kW
	 eRiRMhTBMaKjAXwu4cq9p7qmXX5C3P6QY6SjNLQr5z8l1ERefYKkcEblWUqiwVZ62t
	 f0PGySOgYXgekRCOeWiNFKXiF5gbJIMuZZpfrCQd+RRAlqe425hJ5qWWJTMccqhoi3
	 QmGOrTiksH7Uq70uDbVr0JFJydOFN4ELBLvtU3CXK1cRYd18JJCpWtx7SPI0n1fPLY
	 akDiye/y+ITC3AiA4pIcEiFVO5CSHSP+jaFQ0Bgwldfs67E0ooWzhxPE5V+5rl9sxB
	 BUdusQPpmf0gpAwqTJety7C0MjSi6FvYpbQHMvPW0U0SnTxK+ApKut/XmDaXRjujvs
	 cB3cQXwoFFpzigIUD+SvzeAU=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed00709df0so8653215ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569819; x=1795174619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGeRCUdp/yqOm9ZASAHQapos9k5iYthDXsa49w7sek8=;
        b=jqMSWIN4zk8NKsCKPmgcAIKeAhHVs46FY5TZAXuZOPc1Mbo/NeCSKHWWdjC37TIE7I
         vDO86Fpcj57KqVUuzgzdwT7SBeRp/cBkHnTmMB2rpSnMJEUEjuO1eNLTY99Hvvjy5xsz
         axQzH1D/tSV23Zr/7Vmv8RyWB9J2FJF6+YwInhGD3JlsQchk8TAG8mSscwFElpsOnoNt
         TYEkxEnepNwoVthfKQaz11mHghg/HZ7NTeDIifCvk1HHetF86PhdH98b0mWr/mDA/6Yk
         P8m6VLlhfcivt6qVZGzmI7KN1u6eBsgGTAFJHx3A4L3Mfi38kg+ESWulJftd5Iy49Cru
         svZA==
X-Forwarded-Encrypted: i=1; AL+hErFjYkRYt4cFtcrp02I+nbwEevzO5KsQTrX6nzIr1CODb9uaPFyW9tpyoQ8eklUpg3LDF7THaxbzaD7S66U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nTikvpp3byXZWblhgtiPt1I2j78ILv1oJYrkD64L2WAJF6BcP
	fZemCkHeVMyQ8VhTzLXNu2g0nrnLUQ/b2ySRKjsirbV72jcdKGjz1zlsrooBIic258Bt+5QWnJM
	dCcYV6oXpTnga2A3nbCgv0GMg/JJrj+X/flSPNsMizzitWkEGyH9iDxzsFNGJuPB3bkJKduju/1
	dICSCGJg==
X-Gm-Gg: AYBFou0FwQaNNlZGuyT65GuHQXTZh3i+4dQPIDZBp0RBjb+rTrEnXXzI/6XsfesfT52
	i40YA17L2VSH1UFBBqWyqHczf3KYT5cRYi/7OuE8sXpmseUlfroZIwfSu4Rd6x/eBO0AsuQMA/5
	0pwN9ClLf+dbceiywqq43mzIiF9UJgjubA7nqqRI0OO/1y519lLLfTaEYmddk0m1vvvouCXajI5
	8UPC+hUzewSkNFhPvVflihwFM/KzRtWraxvfj8ZbvsjinQlY2zLgjEUGoV519Xfwcq3iy3GYbwJ
	4L5bmlhnJELeSym4cRgWp8b6JvtVigiUZR4B5mgv8ENtNvTJvPSE848gdzoDQVoiq57nKCAgmTW
	y9bMM/nSThINLT1Ha12Kf/OPo+qKiSf2lPzxUHLukVMN7ELgEIJPuhqKsuGM=
X-Received: by 2002:a17:902:e951:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ee0da98ceemr19485825ad.20.1794569819149;
        Fri, 13 Nov 2026 03:36:59 -0800 (PST)
X-Received: by 2002:a17:902:e951:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ee0da98ceemr19485695ad.20.1794569818758;
        Fri, 13 Nov 2026 03:36:58 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f80b7f6sm8757445ad.40.2026.11.13.03.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:36:58 -0800 (PST)
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
Subject: [PATCH v5 0/2] crypto: caam - Fix RSA error-path unmap and unaligned dst buffers
Date: Fri, 13 Nov 2026 22:36:48 +1100
Message-ID: <20261113113650.63038-1-changwei.zou@canonical.com>
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

Changes in v5:
- Patch 1: Factor the public/FORM1/FORM2/FORM3 error-path unmap dispatch
  into a shared rsa_pdb_unmap() helper, so akcipher_do_one_req() and
  akcipher_enqueue_req() no longer open-code it twice (Sahil).
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

 drivers/crypto/caam/caampkc.c | 157 ++++++++++++++++++++++++++++------
 drivers/crypto/caam/caampkc.h |   7 ++
 2 files changed, 138 insertions(+), 26 deletions(-)

-- 
2.43.0

