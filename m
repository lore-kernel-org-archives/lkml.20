Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832031;
	b=1ANKbIf163KTbajdyKp41u3/0hlIbT97no5EknN6Nu9+VfkIY+qC33jUXt3wWwepv5LS
	 RdAYBCAAh0f7ea9Q51f0PSWZYHsT8i6FXBgQ5r6SdJirEN/jEpu37p9yQ/PVigjub4Qg9
	 NHY/Ar7xWclFTVo9bkuVp0X+RKL7zfDswVrnsXvljGVoS5e0u/o0v5RHoeis4gWBBURZp
	 pz6BOpKDxFV8sY69XF0u3z8d6Yu5eqCT4YhtAR/nkRz9f65a6hekQOvsxVSTO6xQsrbnB
	 2E6feEt2uASp3d41SMT6KekYx45AYh6GNbbXBeBPA7lo8exULfnwUvSg92FwMM7Isnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
	b=vZiFPeduvFXx/a6Wz9QMh8ylFM4oopO2ga1Lz8xrH4EyvUbC2gOOkXglCel8tBZVrVXg
	 8hUnJ6jgUNS4dFs4b/wEt26ghPh05VGrU2jYb8gD3Dp4icgqxf7C7gNfjW/krtZ0fotgb
	 fH9JfG7Q0TYcKg6pkrBFB88nS/qhtsiosScEnWaJRLvvMSiyoGIu5je5TaYSj6t/pLZvQ
	 Yf3qavbd2wHGeZax+d77h5tJ+mwDijpnzkUUoRI1gnQPrrPOuMDQs7iy8ju4b35xwpKMG
	 H0ybFqp7mmbaqeWyqoN6FYFZ9dOFdchg2E4goajGjADUsJ6bAf0GwPNCAbcAcB2WOCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBNkVy93;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F6606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67F6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBNkVy93
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb606491faso9929785e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832029; x=1795436829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
        b=fBNkVy93+Ivhz+cLJItX7AINqI3LPXcFYjJEc6SPK0wfFZ8GArFwA8UG0umyTif4TV
         1uvWX+rG2VNZ8GI1dUuf7sBxQxy82ZUD/nDIn0T23BeRrAWvhjgbL2UA92RyEzsuDueK
         5RPCfNWASJSVPjUTUGQGMFbJe+mOFBNTnkvp6J4Hg5GOha5igl1QmPeq4fNkfLPpoqms
         kVvw0EBh9/EFRBHCbGq6rhoQ7v2N9LrrKEJu0Mbztr0btTwQ5RJDQhMh+alfveeqF+bm
         aFWQ4+raenJPfSHzTZ7jS5TpdxApbkIlnpDa2v+YqpK+9HpEtKPfi8J4xHKCnjeLZ81E
         OLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832029; x=1795436829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
        b=bHKWHHU/c9iRA6kpEIfShZRxBcyQzziqZm3ocnrcD34Hyc3Zb28mgjjDxJ3K+/rSI8
         ou7wPJuu7idqqf+6CK52yEp8jK9qi71i1fmUZoFHLiC8nVGz0acX4W2epAqafuUPfDTa
         e548zsiLNPakSL51n2ov170CV0DVU+zxTq5/mSHQkcrRxmx27xI+n0D99KnJZGofCM6p
         +iFKh3z3ejNqOGP4SSjgKSg1Haek1LZAN57lFmA3YUBYMcV76LXU1JA0f5pwM0usRzsQ
         vp+rBcueoAQvPFh1CyW9F9wh037T6Dr2HEqQZhDrCbOjbN6rnlX/2thWdZwtvv6s3BsB
         XA3w==
X-Forwarded-Encrypted: i=1; AL+hErH24+gOLWHa8Rm/8HZcbKYFAhN4LSe9pF3Jrbi6Xn+OkkuoskQhSVxSohgQZXToic2SaJRncNCrSoHb4aw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l1O/a4O1/9BVVyOEJ3c0VZQCg572g+2ii2ojzr81R6FEyJ0CF
	QedRHK+3KoaCUeELaXtV88/NaK0BDGzQ7hTZDdnnqjlAHs9eTASz0S0v
X-Gm-Gg: AYBFou1nqjLDJ4V7++1jSnBf6uIX5ETf/utQmbn9AxUWhXy83PNJOW0C2ZG4uG+VzHN
	nR0sDlIzR2NAwLJMauygG0+t18fOSRaeBW72AjM9UjcGdpgJbsKQrwcyIKg4eAdJApg1cspHI4k
	Pr5aROQi2IxYlBHrSQP4HBJFoI5cipf3eq3qtkW5fGDh6tyAtqG8j1/Pvmx50Hknf53cjxpiHVC
	sVOlJzbLDkscu1qqhP+KpgkIlL6AdyNXkkVNQs8Mvdum8a1GrWmFo4zdHFDC6JH1nGP8Qi0dJYs
	gHpODfXI9uYyI/jo2A0GLPNLhky0Ku8rvPpxhhMrGxwVXtZZ2hzGThaMDfoyyXnZNZI5KUQBsEa
	favEEoxhzxtqZ7LcNGnK4nP6LSzhtcXQQN8WGE3njtEUhmh95JyJGJTQuAlH5e0XPAHH8ChXGLe
	aT/+7dVOj7q2mjMPcin1bp+wG8b2Dwi9WA6KEK6px01ncuozsyXyjoNSch+BFBfdzQUz2ZVeJj0
	85bNH9G66PU+itggWhSxCqCs7EYP4rx/EE8TEZh8voYPCSBiEQuaQ5Sv+9F83g3eiHWmUh4+wGl
	kA4E0x86pqHcsXC/o1hq4T28FFeuoz+gss4=
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb6ac06e5dmr82826765e9.29.1794832028780;
        Mon, 16 Nov 2026 04:27:08 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm171999685e9.2.2026.11.16.04.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:27:08 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH] i2c: imx: acknowledge the count byte of an atomic block read
Date: Mon, 16 Nov 2026 13:27:06 +0100
Message-ID: <20261116122707.1349139-1-mehmet.fide@gmail.com>
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
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

i2c_smbus_xfer_emulated() sends the read message of an SMBus block read
with a length of 1 and I2C_M_RECV_LEN. i2c_imx_prepare_read() clears
I2CR_TXAK only for a message longer than one byte, so the atomic read
does not acknowledge the count byte. The target stops sending, the rest
of the block is read as 0xff and the transfer reports success.

The test for I2C_M_RECV_LEN was dropped when the read was split into
i2c_imx_prepare_read() and its callers. Commit a5d0b9e32745 ("i2c: imx:
fix emulated smbus block read") added it back to the interrupt driven
read only. The DMA read never gets an I2C_M_RECV_LEN message.

Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Reported by the Sashiko review of "i2c: imx: test the block read flag of
    the message that is read":
    https://sashiko.dev/#/bug/linux-09e3015b-fc03-4410-809b-82964cdfac9c
    
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base, with
    the M41T0 RTC at 0x68. The core takes the atomic path only after
    SYSTEM_RUNNING, so a test-only hook called xfer_atomic() with interrupts
    disabled, with the two messages that i2c_smbus_xfer_emulated() builds
    for a block read. Register 0x04 (0x13) as count byte: without the patch
    0x13 and then 0xff (50 of 50, return 2); with it the next registers,
    the same bytes as the interrupt driven read (50 of 50). With a count
    byte of 1 (register 0x05): 01 ff before, 01 01 after (50 of 50 each).

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..1a3fc245d6ba 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1283,7 +1283,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
 	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
 	 * length is unknown
 	 */
-	if (msgs->len - 1)
+	if ((msgs->len - 1) || (msgs->flags & I2C_M_RECV_LEN))
 		temp &= ~I2CR_TXAK;
 	if (use_dma)
 		temp |= I2CR_DMAEN;

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

