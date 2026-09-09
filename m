Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FDB530E17
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950961; cv=none; b=Fe2vNxesbCj5yAU4gml/weNokGXGI3FSLgiPDszovD6I59k/TS8N2iSGK9PhKM/V8Qy68vJC2Zh1Y2tpGZR4aZd/3lrhXcjULmcGdrDLnEA+SsZzAqDW7BQInuiNsM+Vex896AzhvLwKItdwS1sYyziTOw28einVp2CrK+JiZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950961; c=relaxed/simple;
	bh=HhUiwpApPp1PvQ5DB2B/c6qqcPMEq2cFKx+kv1MDJtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VG+3YtGH2nWcNPE1sqMLmMduhB18si6sTvaRu/ulDpVreeAsKOB7+3b0t+byS5UAjO3GHnZI36QtJH+3c+HDKgAAWq2WLnMbAGGZvostXxShFJ86BHjV8slKJIpthOWsJuDYFcEOf1Jx4Mv6gkcOseKAH4YCzgZBy/gg0UdFr/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjR1Mlc5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjR1Mlc5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so8913394a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950958; x=1789555758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYYSg4n/Nh940SSb9t8+EI1dJmqGSAca/D+rn4rXdBU=;
        b=gjR1Mlc5dde6yCZ3V8Nkyl80zz4slF9VIpMOdtsSwx6qE1BDHGuyjkNDkI/wiAlBLe
         DtgK+PsConGvkl1dGjkSrHcmrjz4lLHgo/22cvvdx69H6hbf+LiS/IVF0JmyDzDqSpYn
         nXIovB+QUCTqNbX1pSo3LA+YNiC0yyVv3JJHvfzWpdYKSXbXi+RpgGAU2/TmbhCbzC68
         LSRnKgXXTX0dgBpwoDwX0mtA0gNGxx/h7POhqXEufQEFO09fr3yVgVZUmcPKluQzO4fK
         8g7wrpJXM2tSJW8RXEb/Lu+KQUHHz2EjYuEmyE7tr/e8ZCMkR5IZIg7KkxFPoG2esSxH
         SSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950958; x=1789555758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYYSg4n/Nh940SSb9t8+EI1dJmqGSAca/D+rn4rXdBU=;
        b=CYn5AnL8SZ0H7+ta8ybt37s8cWdl4SRbdHhYj2ltVVBI/tpRed38anNmDzflTgH+Bo
         4txQsKyzATPODvJFH7PVoCY5zNIUWJbVaV/ZKH7mG4uffcasYjT4Wt8aVKbwzGXr+W5v
         jaew/PcOlLcSQQmf9dr8pOZQjL0PgwdqLmK0vPwvnbFkv2JYxAOkmdZlVNt3fGcmqylt
         S6nnqtrVULNGw5DnRbR3Pr8tLdC0cRrxlVcolTS39bsZIDFfz7eIwDqVfUxw6sFDqZwr
         1mLfYAlHrCCe9Sg9KKy8X0ID+jO8fdKpCnkUtpVgNIhQ2s7MnOL3yPMF6U02PW02vN3a
         X0NQ==
X-Forwarded-Encrypted: i=1; AKwUvByXOjyCXtgrVMIyTyX8uZ4BGGZf8ejcYy0urHJXU4XijJOLVg/lbDLNkQWhKPNgFgPGnyX57Zvww4dykxw=@vger.kernel.org
X-Gm-Message-State: AFuF++m3GkWCMdAq60xFhkl6aPqCdNlLSoj1MjWGueAbjBG9tpf7NvNX
	WVHWRhmC6SzdeEBqquRNzgP5cdbt9c7ZH1XmdMncR20crMkHjxRJqyee
X-Gm-Gg: AYBFou1WPItVPbzURD7pkrtW/HeT13eNwu2YV09G7uGTxtlvo68//w7ooQ+UH61lhwF
	DI3zQ6ogScOF0hBaS/JBFKOVFfN6uZrtgkGBS8Lx/Zk7y77gsuKHABnF1dDGXdhe4wf14t/rHFk
	QbWUcP+joMq3WjL/XqKywtxe0+blJzK1wtmv+Fe1hrNZ1BJttOG5dYAApuipTHNe9YgU7rQ/msX
	RP9TuxTBmpQhOOC9w/+NNMZdXBQBKsmAHGluvCACQFqpMM2xfrtNBBixKIRqNRL+CiFp/3jucGG
	ChQ/2gn5Z5mJawMsOjP/nblruAwuWnryQ3lKUDIzfR7Da1mYn/o4K04H74DpKxi45gJWXMLRBhM
	zp7LKinnG6hL6TemtS1a7/rdlgsobSmhnM792FRVTyS6Uv1kX+M2VUsE+fGXQa95RDG43YyZwrU
	wsxFEKXcHrTjeLQ1mvlYdIlM6z80YA9NzvtJuE61/KIbcdv8nZjGKbmKyE8A9VVQtwlh71SF2s6
	JyOs3j54v1RrhEHtLRfqT3Yoadv1TGOQ38=
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr51530680a91.15.1788950958316;
        Wed, 09 Sep 2026 03:49:18 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm12026723eec.29.2026.09.09.03.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:49:17 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>
Subject: [PATCH 4/6] comedi: dmm32at: validate the IRQ supplied by userspace
Date: Wed,  9 Sep 2026 16:18:45 +0530
Message-ID: <20260909104848.1763-5-yogeshgaur.83@gmail.com>
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
it->options[1] is a number chosen by userspace. dmm32at passes it to
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

Fixes: 3c501880ac44 ("Staging: comedi: add dmm32at driver")
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/comedi/drivers/dmm32at.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/dmm32at.c b/drivers/comedi/drivers/dmm32at.c
index d1d9f75e168f..c6a6ba2899e6 100644
--- a/drivers/comedi/drivers/dmm32at.c
+++ b/drivers/comedi/drivers/dmm32at.c
@@ -600,7 +600,8 @@ static int dmm32at_attach(struct comedi_device *dev,
 		return ret;
 	}
 
-	if (it->options[1]) {
+	/* only ISA interrupts are valid on this board */
+	if (it->options[1] >= 1 && it->options[1] <= 15) {
 		ret = request_irq(it->options[1], dmm32at_isr, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.55.0.windows.5

