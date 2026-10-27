Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111096;
	b=I5zI9L/cl0hHmJgQXFZ8oxK4QZidupPdkS3zNiqpfOO4IOxO3vXFZthpHZtdzwyCQ87t
	 0rQfsBVrwIgojg5wL0Hr6PsdgzLm4GzJk3dHUYdz/KPWDinstcvkS4/LJ4Io3yCJpfkQT
	 rLRkh1f3sG6BI1ukVHMGgA2DLvdcSdHM5bF2yYDu61qulOJlZvE7f7urB4/qEXKUZdF1P
	 zEtrFq8sES5SvKeqe44HnCtLEgLo9KmhSW/ZNP8mUsPfjHSy5/NExVt8I2+HeqVNmKIDQ
	 CSC2GoITAY8W7PTg8VU41Vh7CCF9de/gPpp2VdPintNfMITE/9MRUSAOIDFAzrWKW2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111096;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=PsGmTXa/uJnpfM7r+TZoQHID0Juv7gPJkuS/Z941NB0=;
	b=McWljdSnGe6mcaOSX2A3iJJijCGsuJ16PJG6V9ku+oHkCxPuwDYJz70Mswl/lCKzVSdL
	 bHA/NumUgOOx0oiayxaQ1K6KHquTB5gjN/Kct4FRiKx9ATBYdBfvl35EtAG9q+UMu5/je
	 mVjTZurPIXzkyjcVoYpB1jc6SKy20u6Wgz2TCpgYYDBU0Z5FIjsaNi0JThUzbJG6PHdZs
	 Kt1be5v1wmL6DlCceHow95h7fVb9MLAQezsDvZtSyWqx+mZQ0KHPfYDz5krbOn6LcgUCZ
	 7S1s0zuHsoIJiSQVmcxB5VJ+qEQNEFGSy3IRLBh64qRfTEbStLCGmkKZPQFzEOAqCIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qZahO0ZU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF80606A31D;
	Tue, 27 Oct 2026 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qZahO0ZU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04541F01825;
	Tue, 27 Oct 2026 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793111096;
	bh=PsGmTXa/uJnpfM7r+TZoQHID0Juv7gPJkuS/Z941NB0=;
	h=From:To:Cc:Subject:Date;
	b=qZahO0ZUT5liYhHMYyhjPjxZuK+lFmw3nYRs3KyJIy4FJZP0VMP0qMeasLjc3b0Qn
	 szNCHQf47vEbxoIIXN2+Lk/1So+8r0nWXnAG4oFGJFaF+Bn7dTE/EZ+lIJRpxMEL5n
	 siqOUlO84NKEHdHtggQHQ3Cs+U2dg1Nhcovz98Y8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] thunderbolt: stream: Undo more if the start fails
Date: Tue, 27 Oct 2026 15:24:52 +0100
Message-ID: <2026102751-nibble-synapse-d406@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=a/jsonkAQH7T+wb0F8TvbceQJ7ejFRmUiulJvqfzabk=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPthhz6CSm+R1ceism+NTWvd/YKjiO35z/7JFPz9HHK 2wWblVR6ohlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJVM1imKfL9aUxanLDrVk3 GtLCJVdKbnkfwcYw37X+VYf2t5JgtW25+Yt2fvWpUGmpBgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

If the receive buffers cannot be allocated or mapped,
tbstream_dev_start() stops and frees the rings, but

 - leaves the DMA paths through the XDomain connection enabled, with the
   hop IDs of rings which no longer exist;
 - does not release the frame array and the pages which
   tbstream_dev_alloc_rx_buffers() had allocated and mapped before it
   failed.

Fixes: 6db21d817b43 ("thunderbolt: Add support for USB4STREAM")
Cc: stable <stable@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/thunderbolt/stream.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index 4f9a57b77bfa..c9e1987a6924 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -683,6 +683,12 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
 err_stop:
 	tb_ring_stop(sdev->rx_ring.ring);
 	tb_ring_stop(sdev->tx_ring.ring);
+	tb_xdomain_disable_paths(xd, sdev->out_hopid,
+				 sdev->tx_ring.ring->hop,
+				 sdev->in_hopid,
+				 sdev->rx_ring.ring->hop);
+	if (sdev->rx_ring.frames)
+		tbstream_ring_free(&sdev->rx_ring);
 err_free_rx:
 	tb_ring_free(sdev->rx_ring.ring);
 err_free_tx_buffers:
-- 
2.56.0

