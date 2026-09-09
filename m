Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9E552ED45
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950958; cv=none; b=HO6MmgxwGTAWOHLCM1oRdLaR5avZhC3f2kGyD3TgRFUZOcoEHU72IK5eUkU8wXsrtaI5Em4RSlH12VVUNJtDfHQrLO6L8xomSACA8zzlD+JhioUegwY+JYDnLkNQSIZoPGqIkOjLZnYJbqPwhnCKhNfSADrmwTmUqf2G7IdtPpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950958; c=relaxed/simple;
	bh=SYw2gi1AC5nhm0xVe0022TZZZ0W6MNIpykFOc8BW2kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQhLOoaJbrPfcQE30of8H+KtFzxHbhuPj3B8C3HgzbsoO9jTZUSO4rSGZ8+ygDFbtDTkOmzS4CnOxETvrCGkIy+KnmJId6ITz7tc8SIcC7Q6XBgbz2B9bxtQGxtdDkK80CAbayfOqJkBiq/q+59PovLG447rvM0w9yjKwNxNtm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKownFEi; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKownFEi"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39682983a0fso6257875a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950955; x=1789555755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxKqn4CGn3MwPhUs31ivMcK4nmJ/9HPbLbrdPHhsR0U=;
        b=qKownFEiAfwIJMAOeD9aPS+01IEksv0zdvL2xC1yYoewEgeOc66MjYbJCEIp9LLypi
         WupJBKUkPOsZCY/8u4WfKZt6LnzmNMKBEXbjYEZstddj46MZ74rmFuikOjNBRgEm6gIu
         nENnP7gL5HsRIh4tJv5hgDBh883M9CH5yY2olGGWtucxtX9cmRN3QoajD46eurKR6bKe
         2S8m+ie0G066NNbaCTGXsFPtIqD+1PIoj9Q1cl1nNCsg5Whdd4gZWkuDUv0cvMT0X39k
         Id9hZHFGqko/HqEa/nsOgf0TegNEQmNbkEdOEZZ6DA7gp7wfwItmG2syjcQ8cQC/jZgb
         lc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950955; x=1789555755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxKqn4CGn3MwPhUs31ivMcK4nmJ/9HPbLbrdPHhsR0U=;
        b=iaMuAmlxo8OIQbaoWXBhKbWlTuCRqnFvANtl5kFjRWVAruo8hzxwcASJQm3+787fmn
         3dQ9rCPN9UxH8KdXUMpPXL1UUDCV1camKOQLNuHCVoqQoK+PyhExPqIxVL6hESF1UtLW
         2VvkhXqdOp/lHDKNDZvKoHcKCtNAXX42hdlsPDtKAE8Is22kPwYg+TbuBo3bYl+inhcx
         i2j5Ci/CMFuSZibBPnWHQ+fztbIoloE5ipCuBj/753B5SMr4aqGE22eVgKtcJc7JcP/X
         C5RN0PQpjD5NE/tSlMy1iNqIVu+ynv7UCU+wDIMLXQcofDJYumeGTCJoj1MEiPwLYpHf
         RTaA==
X-Forwarded-Encrypted: i=1; AKwUvBxEs0BabPAfJ1sKyNR5GoVw7qU0UCRv9BUR41YGIpGXotU7jKwrDBDOdg1uSpfvgUMEvtWZtHfW6jvPnHI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGkCd5lLBDYm62Yr4WS0HruVa2yNfmR94lDQzvEAqr57EcdTln
	z07sOXAV2odsxZBZMFSRxqL+At1JklFtniVLbz+hm//y7jqDq8JBGICc
X-Gm-Gg: AYBFou0DjkSGuQA+gJ9HwFXilbZEya5AnOxjlj53dF9lGpnF7jUIkKEsZdviayco3Al
	AnykwSGuXKEGqqYdOxadn+NnEV7psAleqpxyl1UjOOfRQXpge8ODdT3hJmlp60NejZjYEBhR9qJ
	5zXIJ1KwjV7VZJ6IsgIU8r+q1lEQJpWxvVbSqfkCV5UVRBmNKnc+3Knya3xfhF8a+mcGx3dOgqu
	8fRCDJeWEuSj40rwE9Hds5RWb2AukC7C5Z/PWcOfdRGpTXDKhUx+GkwEfmgzK7uS72Sisii2XWK
	pGP35RkK282AtoG8WjCeVbnzfJi/bv26d6ZBpwYx7yXFG2SYATq6MZPDR/961opjyj0UQ7w1Dih
	DSWafKksBjKHTjukI2XJyZLabB09x5i3Ez0AUT2/LLhQRxX92i1TtgFe6QFU73HWyc3fHWg1rLD
	afc/B1lY2FMMyi2bbOegHDY1hxROkUiHE0JVpOYOn7aEQBK8dCecivQQKwBUJN/nIQYJ//YUQZk
	8/fEuECNJuCZbur3IX3rQLV
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr51690204a91.9.1788950955356;
        Wed, 09 Sep 2026 03:49:15 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm12026723eec.29.2026.09.09.03.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:49:15 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>
Subject: [PATCH 3/6] comedi: dt2814: validate the IRQ supplied by userspace
Date: Wed,  9 Sep 2026 16:18:44 +0530
Message-ID: <20260909104848.1763-4-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
References: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

comedi boards are configured through the COMEDI_DEVCONFIG ioctl, so
it->options[1] is a number chosen by userspace. dt2814 passes it to
request_irq() without checking it first, which lets an interrupt owned by
another irqdomain -- a PCI device's IO-APIC GSI, for instance -- be
claimed for this board. When the owner of that interrupt is later
released the descriptor is freed while this driver's handler is still
installed on it.

Every interrupt this board can assert is a legacy ISA one, so the ISA
range is the right bound; it is also sufficient, because
mp_chip_data->isa_irq is set only by alloc_isa_irq_from_domain() and
mp_unmap_irq() returns early when it is set.

Bound the value before requesting it, as das16m1.c already does. An
out-of-range value is ignored rather than rejected, so the board still
attaches without interrupt support, exactly as it does today when
request_irq() fails.

Fixes: a211ea977a41 ("Staging: comedi: add dt2814 driver")
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/comedi/drivers/dt2814.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/dt2814.c b/drivers/comedi/drivers/dt2814.c
index caec16482afb..63b7f17691ff 100644
--- a/drivers/comedi/drivers/dt2814.c
+++ b/drivers/comedi/drivers/dt2814.c
@@ -316,7 +316,8 @@ static int dt2814_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 		return -EIO;
 	}
 
-	if (it->options[1]) {
+	/* only ISA interrupts are valid on this board */
+	if (it->options[1] >= 1 && it->options[1] <= 15) {
 		ret = request_irq(it->options[1], dt2814_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.55.0.windows.5

