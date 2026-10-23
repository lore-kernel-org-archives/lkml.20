Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785378;
	b=g9dJ+HLtLYtc1hAsAYaoDN05mnvckMlut+oohTAbk8oIRYsXEhYo4BW/lBj0cIs4SiUw
	 1V0mNIFYzTw3zAPIbg81G51yoxCdt+yg0s+RdhYXiBm+BMNYgiv+6p/OlCgzU0xBlO1g/
	 r4J0oNsIVNZ5XW8DHQ8zR0+Hhbwl2RM3J2BJn2Mn3Fg/YZgJwSneuf+x9F19cdH+OC+Ku
	 cPLcwwwSZlSVb36OFEQd7vDvJ9ilelwdk0n7Jrsv6Q5bZ/ux7UUriXeMmQ9L0n49rB2RY
	 mocWupOW4Qo11OhgdnaZxf1v8kDGhHrOianXAmv3I67pdY9jj/KPfDtM7on00i5l5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785378;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=55+XzUFAozA2X4gElTBV6jBnwO53UE/AlmVQbWG07bY=;
	b=Y63Yi2TXtJKPerQMbhe/YNqRtsHUtl8LS0dCZP7z8ziqS5Q4bJij48Rn3ia87MEQTDb2
	 EB6mKWV7RYSfFrBCKOaWheXB9knssLwDj9Bzv55Gx3lmFoATjeGzuhUgjLbu+osI7bbqj
	 dwGdrHLiIe1IBgwn3Ie5sfdPh6WHWHtepUu8HQtlm9aHfNxYt3nxNqv+l8nLr/F+B+kjY
	 1foP0ESlrKHsGU8Bbd6jqJB3fxbqZld9JkYncZMEtbYZXi18OYpLTTx5W0TNIlRrzIi4H
	 RjxcGKNt6T2FngxsPeRsHIaI/bf2Rqt+VQ1i4jOjAMEf5x/ftxmFzxRYlLOKaKJGUbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="UFkFhG/a";
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D482606BED0;
	Fri, 23 Oct 2026 19:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D482606BED0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=UFkFhG/a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785375; x=1793044575;
	bh=55+XzUFAozA2X4gElTBV6jBnwO53UE/AlmVQbWG07bY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UFkFhG/a78Fj/2fMYJ/5oNk5GqhpTQkZJEMKj++DTJVXAKjZphQc4PicaHfe+JFEh
	 a/8wDZB4U1JA7LTAsChJuL0FspYf6uamMtAIGbOW/HVRE8iuMkfZUtZB05Op/RpuQz
	 UScbszV2G0+raVxn6KI4sGi0wbb0HVh5lrxzUNF5dyExUtxHZUePnm3QGU5Yqh9zzm
	 5Sr6/TZ/u+biirOvkOtYgDP8dFbSQ071Z1rhZdGcntiGelvSeHshuvLO+kmPiKHQ4u
	 FXfCuMwIHKjlFwOiXVyWxSf8UHZ2YqenjuVeapYfXCrLoGvY6qalbFNySmePWOc2zn
	 S53qXtJBwhttA==
Date: Fri, 23 Oct 2026 19:56:09 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 11/11] media: intel/ipu6: fix EOF sequence logging in ipu6_isys_isr_one()
Message-ID: <20261023195446.22578-12-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 129f05fc72eecc1140259b003285aa82e0d932e4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When handling IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF in ipu6_isys_isr_one(),
stream->seq[stream->seq_index] is populated with the current sequence
(atomic_read(&stream->sequence) - 1) and stream->seq_index is immediately
advanced to the next ring buffer slot.

Subsequently, when IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF arrives, logging
stream->seq[stream->seq_index].sequence reads the next slot in the ring
buffer rather than the slot written at SOF (logging a stale sequence
number from IPU6_ISYS_MAX_PARALLEL_SOF - 1 frames ago, or 0 on the first
frame).

Read atomic_read(&stream->sequence) - 1 directly so the EOF debug message
logs the current frame sequence number matching SOF.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index 5d95fb9234..ad08506b32 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -651,7 +651,7 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09=09dev_dbg(&adev->auxdev.dev,
 =09=09=09"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
 =09=09=09resp->stream_handle,
-=09=09=09stream->seq[stream->seq_index].sequence, ts);
+=09=09=09atomic_read(&stream->sequence) - 1, ts);
 =09=09break;
 =09case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
 =09=09break;
--=20
2.56.0


