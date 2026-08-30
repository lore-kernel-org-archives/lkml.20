Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A514326939
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123183; cv=none; b=OIvlBSDsJmjhP98d7w4lgp7jneJBE0fxlJ/WggzIR+b1u3ORhHuC/iCb/bR2aczVBu0+2PWKVTeaGrmCkxXrFazTtW0mWrBti0cTeLu//IaIv7XgaUVhO0gar82lBpAINUkqGPWew0IxwMbGp/gp4Ea5mJ4SpPgWuA167GaFqb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123183; c=relaxed/simple;
	bh=/6qnuDkJ9Pht84ieqMDQcNLwfOfRm8nb+vO15yDAXbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss5yVuGmW7rE9l6mIaeD9P/NE2ltjqMihFKgO/DpN8TnKpR3xLlrEoBx6fYX2HLQ8xCxEW4n0gwTjjQgraFD6FQ5z6SfL1EFXLWijL2+iSw3HByLa6LbV6xHeaRPzqndh/TrV7v8GdJT70BxV7cTYZWkwTJXYkclNjj1aaCNz7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUvPLYQ/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUvPLYQ/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d710632717so22562515ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123180; x=1788727980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhuHXF4zjm1wA7Hdsp9+NElntybJGb7Ekfxcvka1Z1s=;
        b=ZUvPLYQ/ZkFAolW5sswKw9z38UVckOFX5wfnEvt3ks4/JgadPo4EVky/2AviIsCRdU
         QTWtE76sc1wB/KwaxeXdprpVPUTt9mA7BjGaadkJEmbcUW0ZA/NbTfLjdmu9Sahv4u02
         nD8LAe3qu6YO3ahLzbOz8mMa7robhkRtihjqPBKIYqWhhAo+V83vi9cpfuCG9G8Nn6Fn
         tgIShKE7vYazJWvysyUvSXyLgH/HVhwwrfYynhLO0txp/TDeq5ogZDp1X3xHsmOAjDoa
         EJEXNyElnk6KhcesOh3gdlu75eiWx7dmvUOI+suidQsuWc76MX07YTBTAqND3kLuJ94e
         vqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123180; x=1788727980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhuHXF4zjm1wA7Hdsp9+NElntybJGb7Ekfxcvka1Z1s=;
        b=Ss4p/9QWK6s/2jB1+ByiecrFfNBdbgth+XdjJ0ir3V+tdp0YeFu5YfNjyINofxY+4m
         3jrDv9azbOmhCGj1+Hif5FwTwS1apQGR4bm9QxLoNhovaRXo2t55e8vHTi5PfTIggJ5E
         0GBO+6vgMJuVafBYEOYbWGuAf0qIkeCa42MO0KDT1CjP5C2MxrFe+7Uzffwp5JapWmU2
         i93GUNAp8bUko7RhUTPqk31DJZdzuFax3nqgP8RnyC1zNuwKkn6SgeuJe2Im7Gn17i8X
         iU73VfqaHIRCbY7S0LM3p7xPbpc4kjzYDhD4sxLZViqLj8IXgY5WAsi/C3INrYUMKmQT
         ZGiA==
X-Gm-Message-State: AFuF++l9Ep4GFd+Hc6oReG+RssVBCQ6cm3rSb5I1rmeJBPV4t1g9XZ4t
	RNgayIHLJIZciyQfrL+meU1a6i7QJgsjHWZg1aBH31+EJTzee7L7f/BNwtXNDTe4
X-Gm-Gg: AYBFou040SdQnwa5i4zgcVaMZjD8cDdwLo03WWwsoXN3g8CLZM+T28eadNoKFVS0pew
	QDTUW8uefDr4/vxbfV9EUjB8nceoSAOPLu6JFf+cRU5kwgrzi+LKl2YPv9mjN/isW9RlnX594WO
	hfTS0FK6fwF1XhV+vUJFm0eFaTCOLzduR3Trqwjcwic7W+lg/bqGDRdiPxhuYraJkxPvfoU7WH1
	BoepXlhz2OW81JKW8Pr+GMkqAszKBr/Pn7H4SrDrQC0KF+d9i5Zq5d5IjqObh8US6ZMlv6yG0kP
	JH04T8/ivOHbu/aWZY+iOHTJrhiOf0eWsm6nK+IelcBNAmHznLeTmmMc1rf7YRfPDjFCjJfRyp1
	sKnY22HIcl5u/ep8HUFutyTZ9RGcOO6iEWfmJC+FV/BMur2Ix48lzExhDGxE6S2z43fXnBoS9Fi
	x1L4uGEjiidJ0Z/wMqJ4zNo3xvAtjJvfbqi6LLqBwtwaSjxTmtRRUrwIe5hDo6gXL1z5Q3GK7C/
	gPSuIq6sht/DK82HT+upaaYTEVYB+vWzWTTM4/w6JNYgX9X+tB/c0SODlJXhg==
X-Received: by 2002:a17:902:f546:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2d74df45042mr327708175ad.12.1788123180207;
        Sun, 30 Aug 2026 13:53:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:52:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 13:52:50 -0700
Subject: [PATCH 5/7] Input: gscps2 - return IRQ_NONE when interrupt is not
 handled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-gscps2-v1-5-c733d4cae7f9@gmail.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
In-Reply-To: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

gscps2_interrupt() is registered with IRQF_SHARED. Unconditionally
returning IRQ_HANDLED when no data was pending on any GSC PS/2 port
masks unhandled interrupts on the shared interrupt line and prevents the
kernel core spurious interrupt detector from identifying runaway
interrupt storms.

Have gscps2_read_data() return whether any bytes were read, accumulate
the handled status in gscps2_interrupt(), and return IRQ_RETVAL(handled).

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/gscps2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index 36c25db9ff7f..907fb1537595 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -236,8 +236,9 @@ static void gscps2_flush(struct gscps2port *ps2port)
 	ps2port->append = 0;
 }
 
-static void gscps2_read_data(struct gscps2port *ps2port)
+static bool gscps2_read_data(struct gscps2port *ps2port)
 {
+	bool read_any = false;
 	u8 status;
 
 	guard(spinlock_irqsave)(&ps2port->lock);
@@ -247,11 +248,14 @@ static void gscps2_read_data(struct gscps2port *ps2port)
 		if (!(status & GSC_STAT_RBNE))
 			break;
 
+		read_any = true;
 		ps2port->buffer[ps2port->append].str = status;
 		ps2port->buffer[ps2port->append].data =
 				gscps2_readb_input(ps2port->addr);
 		ps2port->append = (ps2port->append + 1) & BUFFER_SIZE;
 	} while (true);
+
+	return read_any;
 }
 
 static bool gscps2_report_data(struct gscps2port *ps2port)
@@ -300,11 +304,14 @@ static bool gscps2_report_data(struct gscps2port *ps2port)
 static irqreturn_t gscps2_interrupt(int irq, void *dev)
 {
 	struct gscps2port *ps2port;
+	bool handled = false;
 
 	guard(rcu)();
 
-	list_for_each_entry_rcu(ps2port, &ps2port_list, node)
-		gscps2_read_data(ps2port);
+	list_for_each_entry_rcu(ps2port, &ps2port_list, node) {
+		if (gscps2_read_data(ps2port))
+			handled = true;
+	}
 
 	/* all data was read from the ports - now report the data to upper layer */
 	list_for_each_entry_rcu(ps2port, &ps2port_list, node) {
@@ -314,7 +321,7 @@ static irqreturn_t gscps2_interrupt(int irq, void *dev)
 		}
 	}
 
-	return IRQ_HANDLED;
+	return IRQ_RETVAL(handled);
 }
 
 /*

-- 
2.55.0.897.gb25b4bd76c-goog

