Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net [46.105.41.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6B3B8921
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.41.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792229498; cv=none; b=B1FxuJM962PyweJDWeS7iMQab8K741n+hMzU8nsOXJ0TcPrltkEmQ4VvFgX1yUCj4zd9Ti1ZG8HBaH0aSS1X27VBKkPgPh3frfwdmCtS+fWT9zs1S1lOtMBB9Nxwqlke86NdTAc51YeAWhQ/dBDJUIKZ6e+2S+Om7AEqEPvzDTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792229498; c=relaxed/simple;
	bh=a6c0USjinHB9gathqSBKb8kpDFWWcD9tj1Hs4696W6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5cEhSe1hrLjjjfI7T2OH28/uaBQ6E8DjUB3P5iVJk1D6bzTjEibqUZc1TPnZAgxXmb1u2s5ffvyyuM8zZ93KkeqQe9/K8cZRiyECWECZ0ViLk8nl1AK8JWqjOmGtrlKqgI7hvPg2t6zHMcKiB9Go9iYsJE0xYlMW/QIVO12Z8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cynove.com; spf=pass smtp.mailfrom=cynove.com; dkim=pass (2048-bit key) header.d=cynove.com header.i=@cynove.com header.b=Whm0FN1s; arc=none smtp.client-ip=46.105.41.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cynove.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cynove.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cynove.com header.i=@cynove.com header.b="Whm0FN1s"
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.231.103])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4j6F2v68b9z5vwj
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:14:31 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-8mxcr (unknown [10.110.188.109])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DCC9BC0F63;
	Sat, 17 Oct 2026 08:14:29 +0000 (UTC)
Received: from cynove.com ([37.59.142.98])
	by ghost-submission-7ccd8bbbb6-8mxcr with ESMTPSA
	id s5OhLmUu02p31QMAAxIPkA
	(envelope-from <stephane.debusne@cynove.com>); Sat, 17 Oct 2026 08:14:29 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R002fd73e086-99a5-4ddc-ad6e-6f59f9efab80,
                    E277A82C44659F51833474C02B8FDD9281845D64) smtp.auth=Stephane.Debusne@cynove.com
X-OVh-ClientIp:176.150.47.247
From: Stephane Debusne <stephane.debusne@cynove.com>
To: changwei.zou@canonical.com
Cc: herbert@gondor.apana.org.au,
	sahil.malhotra@nxp.com,
	sahil.malhotra@oss.nxp.com,
	davem@davemloft.net,
	horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	iuliana.prodan@nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	lukas@wunner.de,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephane Debusne <stephane.debusne@cynove.com>
Subject: Re: [PATCH v2 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Sat, 17 Oct 2026 10:14:17 +0200
Message-ID: <20261017081417.2775186-1-stephane.debusne@cynove.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004210200.290119-3-changwei.zou@canonical.com>
References: <20261004210200.290119-3-changwei.zou@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 3343641252612004827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFFWE3bBGPlIBJS3KeuP/5a5zGsiUfnbi/NOsRCn5timlvoAOq9ypHB65ZuJSXxJuiItvlq/xLZ6D/ap2YixEk5F5b4kNEsPQytdBC734i/aO/LcYiQNFsWSrXxb2iX+wKk6Sy7lPsSmpUV94F8jeYOrIib+BY9X94VRQUjlYH8IBaZG4tbYvVPzG4n7NN7jBnH8mf4z5CihVpBmKw82QSJnPrvSqC60vw6WSZ5fWrX5/lXHi1gCDDFmFwctxgaWxI5mRwQuRaDOJkU1JN363DldyPaQtJpIE0DJ6gsS959qWyCvXvbMx8mRzKXchqofVVpC+dOiQvM1D1h/uYs+tintSJm7ydepwi2V63NLFeOIuKEzDOmqHmYfnGeQjclQMV1P3eNmmKyjok1+JmUBv58QczY9cMlFkPYb7vP/6iE5cIJJ3k6SW6ALZ9lLtRuXbI7ejFhcvxVtkPL3NK77y455Fuz3xMQ+OTSPmABqwhcQfqzvnLIByTQnB1Y7/6+nVTg4oTW0/GDpMViN5TdlUlSq3APaIDTkoxgHvqSqWpWcEImUKUEHkTHW7rJ0xvY/5Txm3xdgkpxKB0udzRuOTXXi0IHnnr68MJj/rRmSKfAfNkS9pPjnpl+K87a1rcH1URRdOqlIbjUP9mxE0ifcNnrUCMSTl07c3okjx53okLz+Q
DKIM-Signature: a=rsa-sha256; bh=3T5jwtWeKY4gi72mey1zyXo9lO+BeGEiZVaeBu83B1A=;
 c=relaxed/relaxed; d=cynove.com; h=From; s=ovhmo4616632-selector1;
 t=1792224872; v=1;
 b=Whm0FN1s6okz0rPZne089eOUDO5gKkDfCd/CNLdG/Jb5I1utfMY/mvm9AdbjUKxVUWpIw5P4
 aTjEKrokO7jyqTGVR+RuFbYShA74WIgzkTQZ3hZHIVPida6U9wVx0/nvbTKuTc84Tq3wYsSQ2wG
 pfndYWnZdQIsNxr0pM/kB2BrmSi1KSsR5Hz+x/qRRZ4ln1pJ05KrHjyRVt2xaNPCXZfWgxmsVyP
 okioRrhm7/1bb/+ow7NBRXy0OcCIaqLE5Y3MPfnYn9zwNv/+s66OQCLAgJOYXlA/coQG2Y6hr+2
 kVtM/m5/Bww4TIMtSV1Xap9x3DIZDA2RKIx0by1FmQr5Q==

Hi Changwei,

On i.MX8M Mini (CAAM era 9, non-coherent DMA, no IOMMU in front of the
CAAM), with both patches of this series applied on 6.18.57, rsa-caam
gives correct results again for callers whose destination buffer
shares a cache line with the request context:

- cfg80211 loads regulatory.db, which was rejected before;
- keyctl padd accepts a valid self-signed certificate, and
  keyctl pkey_verify accepts 20 valid signatures (both failed with
  EINVAL before);
- a test module comparing rsa-caam with rsa-generic over 200 public-key
  operations per case (2048-bit key) reports no wrong result in any
  case, including a destination placed right after the request context
  (in place or not), crypto_akcipher_sync_encrypt() and
  pkcs1(rsa-caam,sha256) verification. Without the series, these cases
  failed in 198 to 200 of 200 operations, with bytes 0 to 23 of the
  output holding stale data.

Only the public-key path was exercised. The requests did not use
CRYPTO_TFM_REQ_MAY_BACKLOG, so the crypto-engine path fixed by patch 1
was not reached.

Tested-by: Stephane Debusne <stephane.debusne@cynove.com>

I posted a series that addresses the same corruption on the caller
side, in crypto_akcipher_sync_prep() and rsassa_pkcs1_verify(), which
build these unaligned buffers:
https://lore.kernel.org/linux-crypto/20261016090333.2247764-1-stephane.debusne@cynove.com/
The two approaches are complementary: with my series, the buffers from
these two callers are aligned and need no bounce, while your patch
covers any other caller.

Thanks,
Stephane

