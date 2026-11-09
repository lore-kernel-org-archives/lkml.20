Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183665;
	b=hirSO0QmEXnIuw08sXC2GYR9eJXM70VXGkqhPOjN5vHalyNib61a78IemmHp8AZsqcOE
	 BhYVMqRkWASQQK8SOp7YG/Jr32E6+yUfN1GFkkUPD2gMNhwv+Q2PXz6V6nKz3hdc0BGQW
	 HX/x3DZTuHjygTtGCpgkVoT4lNMDwo8KHodWXQ3Rpo+PnOxg1ZKhSK+TD4LiM1vDiB6RO
	 6h1G+8nIjxxAZ/BIbZM97eGOWt2ns+qQiIR+U+w4O49QTR+PP2PuUB6TWwKxl5T5MxAX7
	 67eRfaL7ha7n/VpAYKpMRvylUFDTfj56uU3ziztF6oAbGnv354xTV9lHyYKV3O80waw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=GeBJObAnqhNEGePn+mfWF29BOCD0obOgEYIt4FeXOvI=;
	b=h8wywWb8KKM/7rROveRbW9+WelNUntNwIlihXiXPFHWAZH4pC1V22pZ8+gDdp8bs2y7d
	 ajJCxqyemkKos8P0tGnr8N8yAYcAloRmKyiUKXCOzwpi3ruK4UKkzvvLpm+4DVPZA1S/9
	 2ymp3uz0kRRiMUMu0Q43x84QquiMsLL9g7/R//OhvLHnKZDXWkB+xQ/DYTqud3NZAp1s3
	 Smogv/4e+IMflz/iAbzbe2fcnbHEBVXbj6KBepm3bj44+groCysTvJUHYDC8+ETuUvBKp
	 4wk5fuFDmptwbc2SHIH3w7CpMZtuvza0xihfCC2PdTaPvx2gqnfiNfLq6sqAG9qSNYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TErODvE9;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36020606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36020606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TErODvE9
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-706113e92f9so188555eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183663; x=1794788463; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GeBJObAnqhNEGePn+mfWF29BOCD0obOgEYIt4FeXOvI=;
        b=TErODvE91a25YyxDD4pdTWA6d1isfYiXbLBk6ESYrVvMnDhz3kygoaubhfo5QoZhEa
         wAEtB7/53EqglPpfHHc6UEuQpftxO7KuqfuiTHtPYPeC3melo46Xs3kpiuWmKb+ytONL
         8q+m12f4Tw8F2ybBNidO54nIO3uneGqUH5oeEKPPhGQBGba4mVIbL8Yvg/1qjvCAy3A5
         eDSAAh2sCA3o5R5/bz2+g0MUMsV0AfHItrRcCiTgr2NT5ELJkb0kEUGvROyIe7fSzJO6
         EkT/IgQa0i4e1Rdrbfgm/U7TVkDGPaBmP4ZulFdnMCuBK7DW6NJH2DDeampXXEOQfKBv
         oByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183663; x=1794788463;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GeBJObAnqhNEGePn+mfWF29BOCD0obOgEYIt4FeXOvI=;
        b=z66nGswM0R2xSQt2r9R6FcMgf+g1Gmlf9QoWjolTwxUZ1efB4fjZCixmwErxihNvCX
         +fGHqLHbYccqaht2H0SVQK38PjGLhYVcWdgylxyd1/Jq9Lm0PHI/ai+sTDyvB9ojGFaB
         IqbVJjmgIKGpkz86TukEt/aU/EICz1OikNmz41i4chHhrcLODQtFVUWJjal/kg/rAut6
         9HPXDFkci2t/3Y2lqVo7mvaC/lIHkrFKUxvneEFTw1wP+j8BofP/lWl/gJRtM87FFylb
         oYrsH83ufCshXiBksbnDzIogm4rKB0w6fRxt1eCFSCJYWnbO8q2aYF1w6y7/fS6f2MiA
         i8vA==
X-Forwarded-Encrypted: i=1; AL+hErHag9X7akax2fz7kyl7sNa9MYbF8DEHy7CTkz65hN10jaGNm8Ao3q36bE97OhXJWzHpD4fT7A9zLt4Vn8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W4xhdzQz/5RxwxbgfbnjU7WuEsHw/HR4floKbpusDUAxK3Too
	T3pPgns5K2AALHZyqGU1PeGGagiO98vafzdiH2T5GuVGHsZz3Js+dKas
X-Gm-Gg: AYBFou07oZbwraLMMZh8uD/gvFg+ah5frBTPXz2qUSPL9QLKzYybeKI6Q5mKfCls622
	S7gSnRuLDCGcxLYi7OE2ZrgHzCwuUu594ghwHAuj/BEUklECOWWz1I1wJeQqDxn5Sd85kVXanCS
	8a3VJeAfmtTUvvfDqrPKNwN3XT3uviQ82Ti5sRKlpdDLvth8lLr/Gcvz7lWqX42+nmxAf2FjJX/
	fPk5ZAnAQthmcs2LdRzGEoJr2XRDXw7XJ95o5cUFU7cMn/EyZbvwaWiNT1rARfBF8C5EdAnznFA
	Q/ZvXkaA5NdQHbkZH74DYYG6DsNlrvmOam7BOhzXiGyxnVBca5iqzoeQnRruzGeH41KZiZ8tRb3
	lLxeVNls19PHEIYvZQ+Rw7vK8r/prcggKpGaghkuWi4utptG7MHa6lM2WJKRev5vXFRA2QZqqhh
	pgOw65gVlIXpAPL0ubMRHuKcGRl7VDSW4Ezezh7UZDqRcpTItNMCImDc6FdvSr1w8Vs3J54+WJQ
	78sH8pK5xyYMA/wOhAjS8a4jWWGIeyvgq+5yEE725WpNhW3WspxRKmONhV9LBJt8nWcieTXP3z9
	NpplxPQlBFind8AcW4QyaFdw6mgEd4xqwAjECtg+5sh1X0Joo1Yv7Q2sGYEN/sKaNpFhTa6tmi0
	FkKNVBS0/WPeBYhtRZQEZgZ28eZM7Thmab2PsOEyNM7N6mooYQVOzYC2KjrKa4Zr1/lvstGC8lw
	tUwxcdj3hjhDl5HnX0m9/5RNwiKreGsvMTmhsJUC9p1Mxr4FHerJSb3j3vF2AGjAr9XQ8ck79D
X-Received: by 2002:a05:6820:1356:b0:6de:aeea:5c89 with SMTP id 006d021491bc7-7170f2b53ccmr1343158eaf.23.1794183663143;
        Sun, 08 Nov 2026 16:21:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8cbcb9sm2219207eaf.6.2026.11.08.16.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:21:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 17:20:55 -0700
Subject: [PATCH] mtd: rawnand: r852: disable the engine when card
 registration fails
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
Message-Id: <20261108-submit-r852-registration-unwind-v1-v1-1-e54be2c652c2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QqDMAxFf0XyvLBW1in7lbGHtkbNwGyk1Qniv
 69uL4Fzufdkg0TKlOBWbaC0cOKXFLCnCuLoZSDkrjDUpr5aa1pMc5g4o7auRqWBU1afywhn+bB
 0uFh0sYnUX4LzjYEieiv1vP6e3B9/LpYnxXyYj0bwiTColzge0ZS7s3gph9YM+/4F+PqjvqYAA
 AA=
X-Change-ID: 20261108-submit-r852-registration-unwind-v1-5c7cef4b5a70
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

r852_register_nand_device() enables the NAND engine before scanning and
registering the card. If sm_register_device() or device_create_file()
fails, the error path leaves the engine enabled while card_registered
remains clear.

A subsequent removal work item sees no registered card and skips
unregistration. The device removal path also returns immediately from
r852_unregister_nand_device() in this state, so neither path disables
the engine.

Disable the engine in the common registration-failure path after any
required NAND cleanup.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-204169@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..073f96f73be3 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -656,6 +656,7 @@ static int r852_register_nand_device(struct r852_device *dev)
 	WARN_ON(mtd_device_unregister(nand_to_mtd(dev->chip)));
 	nand_cleanup(dev->chip);
 error1:
+	r852_engine_disable(dev);
 	/* Force card redetect */
 	dev->card_detected = 0;
 	return -1;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-registration-unwind-v1-5c7cef4b5a70

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

