Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740288;
	b=D8auCwgRgFm2lOwDQqq0AAlD4ECWdXryG/maJsKtieGQr7T3OUaO5pIB4OKnDAnBochi
	 ibPDXOWmXQkCH1Y35jObEGOdedhmFBSPEP1PeDsZaDH8859Xd5lQUKfNxQE37uuc4hgm2
	 Yyx2qK8Ln5ghbfAH+0+Yde8XslLeaiBRwD4AkCufsnD9hWfhshmnNw/XLgj0YKedUVmlP
	 TzfdIBT6x/HLh50hYo2AtayVYxAnOIUihjp+xqXg3LnJMe5BjZFg8E/Lst4LPWFcVFmmd
	 Sk6/BwXYZaK4DYQjEP5B0sqqdApykQX8jcvAugv2TBdSF9RaQOmEORdRoA8RZ+NPiUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740288;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ChFLbBkSbr0AzP8hdgcH05VxXh3ZRxWwzH5Y63ZzU/A=;
	b=tCuJsECUqG9TMYO+Zf3cRNYBVAuYnXJdxi9wXmB+6gAeu5UVkpW7foaEpK5MhFthfYgj
	 ym4PCThZNklyngk8gNUyGM3J5YSPcwE81N6lRr3ty78q9a+NOFpUjUbOnFP9gUkMjZih4
	 OCGYGVxGd197AsI4exnQ0DPREIByc66gr1gZOxNMiF5pP37AlS6pGkGKB3SD9kqSkJjY2
	 +8K1iVlqNVAUUCTaAPWjQVROmtzgRgIecS2cCPxSAsuFunTcRQ4zoMk4guuETBh/HhAg3
	 aIPAJ6AqyvWGnIunXlzcw4Nr+iLYDjzOFFA8zp8E3A58L0jA1b/slbPiG1TO4ZXo9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rPmW7Ltu;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67DD6082BD2;
	Tue,  3 Nov 2026 21:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67DD6082BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rPmW7Ltu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740285; x=1793999485;
	bh=ChFLbBkSbr0AzP8hdgcH05VxXh3ZRxWwzH5Y63ZzU/A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rPmW7LtuDdFCQNgTuqv21SIXwEZ5c3Ct2npjWGU7jEENjPKxnfqnME/cWnc6RSz1W
	 76K6vDhMoWkKRo8g+33R3X6g1cZVK1ROrzJL/Z0oacAdHbnxjbJcB6oYdQLL8zeZxt
	 fRBu9kj38fIQV4EAUzg/iXRdvGD1uSuYQ6ZqrxoATiiAXrkAfqH1RboK+v02xUEF8P
	 RwxOVrRN75XxKwSG/UVCjQSB7NXQ96N3X0SD63WVBrdFcqQGAaqm08yPtPALnwUgCL
	 fBbnpLoWqqcsc6kobOOt2fKCLGtQthc/6mqazxW5yF0SFHOrI+GDUaPTmttaOL36fg
	 OxI6/z0eEbwEQ==
Date: Tue, 03 Nov 2026 21:11:21 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 11/11] media: intel/ipu6: fix EOF sequence logging in ipu6_isys_isr_one()
Message-ID: <20261103211031.1573726-12-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: e881371e35700235f7641c50de9392bd14548fef
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
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
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


