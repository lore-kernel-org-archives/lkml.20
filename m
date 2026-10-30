Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358739;
	b=fHV4MYkiamXblkwDG3gT1H/fFC3S+SXxjW1T20Snh+fAuYncazP1gdaKIMIKTXrWRwb4
	 4RKQK+9Br1Uwac9pXSKXu4nU9kYji+wtVr10S1GccLHtjuRSkWkKv+bjoP0q2q1axJI3I
	 nfqDsEeRmb7uEZ/u2R7/QHQzrgS/ThYAQnVhsIoLgaXvp1mvBUfN7dg/VXBQlIiIp016J
	 gAX8l6BdLAe6/BQKxXv5vfqzMAzKv0W0FPjBuDf8qv3c4Xp48XDZVMfVV5k9858XW0FhY
	 Bya6hu4Hjf/Ldczf8RqDj/W/LuP9ChDgWFd5MeS2AF6naMAO3ecbjgrCgzWaLPx5ihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358739;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4ytDcB9XY2YHzLOI6QFQQmRgDySP+rWAybjDyIMn/RY=;
	b=nswch2l/C4KTQAls51ptrdoIED3TvgQpvHU2SrbIRKyFineyVExFmFg/sNaanLIzIsLd
	 TL52GCAPTul6CIeFMJtOZbDR1A/rrn37Oc4tfBMouenm1vCXnLEWsl4IVEfui31MvRC72
	 41nQg3Xt54E3bfXWeNbZ/jZEO6+C/etwVdJ/b8xtL3WtpURW3+yws9q7ldLCf4jbjaI+r
	 rZDC0mFVqwECrWaG9aRewJsl9CQnftnOBeReO1j5UV+TeRFKFj4THlechUOiuwGQRN1U6
	 o0PdvBB3aCUhp+l+AsqEmMoxz6WJ/+G5Z5KmOT3iehAuHfayohLK0HJypWKb88JOdZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFRBtYmC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB2606A31A;
	Fri, 30 Oct 2026 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFRBtYmC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D041F000C1;
	Fri, 30 Oct 2026 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358739;
	bh=4ytDcB9XY2YHzLOI6QFQQmRgDySP+rWAybjDyIMn/RY=;
	h=From:To:Cc:Subject:Date;
	b=XFRBtYmCwnP3QIr6WjtkHQocOUlJOFRP7bLaS5PkgXdivVzgVP9mPxvtyDrRUIYo1
	 yai92bBJqClffopCMzHdA4tihR2YVY1X8MZXrvahpkW/LtmBvAWILFG95wlZYUjCuL
	 dzpa8+bb9JZtxEI5/I9mwpfqulz3IVl/Dpz49698/I9QGt1JRq4JnSrKfZ07LVnbEC
	 Q1+35u8N/XLaMeNp5KzptZMycwlp0ArQZtEM1zx+wM1o7CGzM4UFvw7ECz9F4o55i/
	 r9DIsf8qI8V7OOdkZZuYGBuJVKvzPngeoFopVmvPjD/4pyQi3ZDnKbk7NtH7Q3k8rC
	 40N79sLBekM5g==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usx2y: Use prepare_inurb() in usb_stream_start()
Date: Fri, 30 Oct 2026 12:11:59 +0100
Message-ID: <20261030111200.114945-3-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=blum@kernel.org; h=from:subject; bh=Pnq0FGfcBcs5kF1Q6HTPK1Tg0gol7LS4HMGSPqIN7i0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlPqhuebN/xRmaGzYO4WaV79hg76B35ciHviJA691fea b18pVpxHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRyhiGf4aKMgIXjlVd/iaw veDAmyOdezSYl+3qk2XfcG9zkPbLCHOGX0zX9NZvrv369UuTvdDr82+syoJa4nu9J+Xzti13dJu RxAIA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the open-coded packet count and transfer buffer length
assignments with prepare_inurb().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/usb/usx2y/usb_stream.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 3122cf653273..d764e8c3b8f4 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -688,10 +688,7 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 		struct urb *outurb = sk->outurb[u];
 
 		playback_prep_freqn(sk, outurb);
-		inurb->number_of_packets = outurb->number_of_packets;
-		inurb->transfer_buffer_length =
-			inurb->number_of_packets *
-			inurb->iso_frame_desc[0].length;
+		prepare_inurb(outurb->number_of_packets, inurb);
 
 		if (u == 0) {
 			int now;
