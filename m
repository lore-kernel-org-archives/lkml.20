Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119419;
	b=ip77dpl/qxWfeA8KH98z36iWb7YxlA33eBRszSrWFftyy0U+zkQzfEwMWmyH0r2cO9Nt
	 5cY3NA5Jb59pAZtbBocHn6ueGWptD+b+Ug5+ie6pFgRQ8+ohk2ZPdC7pqPqpic6Symqn7
	 GDncfo2b/1prlETp+55vCfCTcaElOgCJQtsxpoAwAm6BjQLHayl2hrcXzCNWylkuS/5Rx
	 Z1I+xouIBMeYwCXOUIQzmrC6c+FgjCVx0MVzkeX4dX2hRGkeBi4OoV6vKjVFVsuma6s0O
	 oPyy/Tuuy8CERh2IsB8MakiAOXaFH6+9P3gsaJoZxrOX1KDwBY3rjneavgd1vdQfgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119419;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aPfRCzX2WRkfz/OeNsigpetDt4uv0ickuko+KgsCZ/o=;
	b=Aro49ddVIJ6LYaSGeFblBM3VxZaF9rF8CoZ7r2OqiSJaf8yro1XX8XvV3gbvqzJCCM/9
	 Xv2uDGS4fUEW/1JpieXjuu8IuPmBZR3BKN8Op1KgpTd8HSulNbP3CiHcNAXCjMVyLsN4i
	 bJck2m8G+ml5BvKoibLTauW2KZeFej/ZBZ807T+lo5Wtbdh/C28B0aAmntsaln2LtcD1o
	 obs7z5ERLbJt/MKQTY/MK2CuuHxgklyqt725vRMyXdx2U9Pz0IGfWM7/sOvl/W5D0VP5V
	 ojq6mfgNAEPj+60b3vN0Cg8IM4OeYxSmrKPSJS5WFM9luYNN2vlaVjAK2wVFuH2YKlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TlQeNa6r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D719606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TlQeNa6r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A0F1F031E0;
	Tue, 27 Oct 2026 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793119419;
	bh=aPfRCzX2WRkfz/OeNsigpetDt4uv0ickuko+KgsCZ/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TlQeNa6r5LGY6A06XeUVRMc1Kr4tybPI0g0RN+Ii/IQg55AtvpLe2jK5h7nPxqCAM
	 jNOyFrcghUHDWbzeM61iiuEDaA/q1u3JRAwIgy9O4cDHShc4q+OyJ7elQAZmWRYvdY
	 cI4GQTqZEQuP9qkZnSAaDXq+BV8/rB/SawXJGF6Q=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:43:30 +0100
Subject: [PATCH 3/5] comedi: ni_660x: don't poll without a DMA channel
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-char-misc-comedi-v1-3-1899771ee15b@linuxfoundation.org>
References: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Frank Mori Hess <fmhess@users.sourceforge.net>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=06e4ol257tlKSQhbAbQDOTQCK2kkz8xRhOIGJhrglj8=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPrmw84J7JM/XTRMHl1zojz3ek7phmG8FRm75xQtLUk
 3G3guOjOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiHDMYFlw6EFz1/jo/e0Vp
 /0+ZRWHaT/WmKjDMD/XcGLivxqVIwcidmal1vU3WdeXNAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

A counter command owns a MITE DMA channel from ni_660x_cmd() to
ni_660x_cancel(). A command does not only end by COMEDI_CANCEL: when the
reader is too slow mite_sync_input_dma() sets COMEDI_CB_OVERFLOW, and
counter errors set COMEDI_CB_ERROR, and comedi_handle_events() then calls
->cancel() from the interrupt handler. That releases the channel and
clears counter->mite_chan, but s->busy stays set until the owner has read
the rest of the data and seen the end of the acquisition.

do_poll_ioctl() only looks at s->busy, so a COMEDI_POLL in that state
ends in mite_sync_dma(NULL, s), which dereferences the channel.

Test the channel like ni_pcidio_poll() and ni_sync_ai_dma() do. The
pointer only changes under dev->mutex, which the ioctl holds, or in the
interrupt handler under interrupt_lock, which is taken here.

Fixes: 894db1197347 ("Staging: Comedi: ni_600x: Added support for comedi_poll.")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/comedi/drivers/ni_660x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_660x.c b/drivers/comedi/drivers/ni_660x.c
index 5508cdb1b0ba..9238475dda07 100644
--- a/drivers/comedi/drivers/ni_660x.c
+++ b/drivers/comedi/drivers/ni_660x.c
@@ -459,7 +459,8 @@ static int ni_660x_input_poll(struct comedi_device *dev,
 
 	/* lock to avoid race with comedi_poll */
 	spin_lock_irqsave(&devpriv->interrupt_lock, flags);
-	mite_sync_dma(counter->mite_chan, s);
+	if (counter->mite_chan)
+		mite_sync_dma(counter->mite_chan, s);
 	spin_unlock_irqrestore(&devpriv->interrupt_lock, flags);
 	return comedi_buf_read_n_available(s);
 }

-- 
2.56.0

