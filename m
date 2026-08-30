Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8C32860B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123192; cv=none; b=mQ+gPY9Llcp6X95SdRm3ILN05Zs5vXr4tJj5VtPdQ75jHF/6NQqVy4wutPDv9ZHiL/wdXOYs3ite+gUAv+Z99HeNzXVgXCz3SGaaZFygf3pbKbHFYZonqsEPYWq0AjCuCLpSEyIkLV8lTnOw0p/SOW7jBIXWBeag9C0hj1yxd+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123192; c=relaxed/simple;
	bh=23/J+3gDoDVZml6rrky5zUoFra+g0uhnHf6Qlc/3LG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnzztNyv/7IB8by/v0bfn9mLB9jkkltjEe3v/by79annywUZH3fpYqNetm4vJcbDGsMTNbs8NmuK7GR6rqdtTVfQ3ZzEKtWTBKDXGo+6w6DqtdC0Waf+1cWa21A2wmLc+zeQjXn3s7tQkhUqehbn3f71r59p2j1zzdx+DGlpHRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLG90q1n; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLG90q1n"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3162183a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123184; x=1788727984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDmUbvUq5gus03tv1ZZ+Ru3jkSSxaXW9u1MMK1TfK1M=;
        b=HLG90q1n9NfiZ0jTc3uS8Bu24RQ401hDn1PEKJc4P4I+TZDxDTZsfN08Fm/GdTIYAw
         PFLVcVDkp1XjH16KQRkM9Wh/ke6D6mTWkMAgcSBxHBeJ6vKHL//ogA+gFDRgIjAkup/z
         ex7kPXIa8FMtdU52zuZgERfxD7vMyobTw5sF7jkF/QjYFyQFfl1zYiPhw52w00tl+JyG
         A3AYOFhDBd92cBNENjC+eWDzklw7MEZ4kREpxpw5gOBzc6nao52Z98B0MrmDJ/o6l+QM
         JhmLreb/7UtdxJF8vCPTj1TlRkgs5XMiqSw5vozcbxV5b51Z60fTtKZacb6DTTjv8vwR
         awvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123184; x=1788727984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDmUbvUq5gus03tv1ZZ+Ru3jkSSxaXW9u1MMK1TfK1M=;
        b=LCV5Ih4AsHa/HyecAXl/K4YsXqpQiqwVXWeV1LzIGM9Hi2POnGzYIrOwlATGKj+GIc
         GYdnSdUIVkHy7KXBHug6e3T5PGA+T9/v7oWvTP+SEVxpBGxGMtt498gX8RRBedxoiaOc
         g/PYrijtiP0KrtvfShpefchgdyqDfLyVChzq/JfCe2eu2GErFUsT/KGL2395Xfcei+FO
         5N9/b27sx0V6B9B4L2Y5yi57Q/az7/dzOG4ijemwG0NzS0AmqbCJ76Q4UBKBMSC+tlCK
         YNAeNyQGFOepL6w6XkKu5f3ccIxHIQ71KPxjt0xRoOcnUs5kpbW3FXUqb/bJr1k0J0ct
         yRBw==
X-Gm-Message-State: AFuF++lQgAOytf+soSRXuaCc+8JpQPvn1RkyicdhVlXeemdDmc1gWH9n
	G5CjMpSUe7h0MaAMWlMOKMVlAKgJ/oueJLphJnqsvAI0tkun6LqPiPZCnlLP+VXh
X-Gm-Gg: AR+sD10v7u3qgBkmQ6WhVof1z/5CYjKXr3fujJqk72cjMAocXYt+7ejia4nDqFbConE
	1JmICuNBbPbGtUHNHqNxZ3ylN+zkVz1SFCODiEGqUOcNAGSjSSmI/w8owaToe20IPDzN1Gt3NoP
	JkUBTfYkTKplue9WO951Q8pGcpGAwNKToSQgkFv+mfzdLnR7O6k89iJ/jwJhNG6CpnRdyYkasfB
	K7eiq5h5lev1eHHBU74PHIvztgRjnQ8D96ufu+19xteWrd8SpuFOuZwc8ux5R0Qes7SutGPcCop
	eKrGFvI/0qGLDjpiIE617hMco8B4HhZ22QXHeP9xr6IUHUmW3p+SP/mNkrywFrzb/ar7pf/RJyX
	bOIrNPX0m1AwiL+iERJAbkucaOkudKTGS/i2TcgPtL83FufHttXi1mCQ3Yvp84IUul0HGMAp+e0
	YjmUP3tqbmLyY7waFKHxrPBnWLFPQBpMVDY+P4sKWjrV06xB20iESv2yziA4PuHiHB6fDX4MTSM
	A0VDPOqcbd/qouOFjgxUVUXBnB2Ks5FyOny8stHi4pcsqxo4WJeFvL7ju6iCg==
X-Received: by 2002:a05:6a21:7e84:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3d5d787403dmr2821879637.8.1788123183999;
        Sun, 30 Aug 2026 13:53:03 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:53:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 13:52:52 -0700
Subject: [PATCH 7/7] Input: gscps2 - drop busy-wait and manual interrupt
 pump on transmit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-gscps2-v1-7-c733d4cae7f9@gmail.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
In-Reply-To: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

In gscps2_writeb_output(), after writing data to GSC_XMTDATA, the driver
explicitly executed mdelay(6) and manually called gscps2_interrupt() as a
polling mechanism to accelerate command responses (such as keyboard ACK
or LED updates).

On PA-RISC, the PS/2 controller asserts a level interrupt to the system
ASIC whenever received data arrives in hardware, and the input/serio
subsystem handles command responses asynchronously via completions.
Busy-waiting for 6 ms on every transmitted byte introduces significant
unnecessary latency during multi-byte command sequences and complicates
interrupt handler locking.

Remove mdelay(6) and the manual invocation of gscps2_interrupt() from
gscps2_writeb_output(), relying on normal hardware interrupt delivery.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/gscps2.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index 2afd53a163ff..985539f1d088 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -356,13 +356,6 @@ static inline int gscps2_writeb_output(struct gscps2port *ps2port, u8 data)
 	scoped_guard(spinlock_irqsave, &ps2port->lock)
 		writeb(data, addr + GSC_XMTDATA);
 
-	/* this is ugly, but due to timing of the port it seems to be necessary. */
-	mdelay(6);
-
-	/* make sure any received data is returned as fast as possible */
-	/* this is important e.g. when we set the LEDs on the keyboard */
-	gscps2_interrupt(0, NULL);
-
 	return 1;
 }
 

-- 
2.55.0.897.gb25b4bd76c-goog

