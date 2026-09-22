Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E66348C75
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096569; cv=none; b=Tsx5JBD4bOyWNXixImSDKF2S02PRcxLNGCR8dkEOhKEHxaTYJ8la6nAnYFW2EA3e10xUDnbTHaw1hXPfy2DrCYo1PxtqMtLZGZmve5K/oznqAtbDaW+nycqbFkKbDQhqbzBzoHDZJTJIl98qw96TbNzyUhaNHbAdLWajnYoJgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096569; c=relaxed/simple;
	bh=IxVjtVWZowYR7pjluxQtr8vlcnbSgDFgIJCMah/3yfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QU7ML/0GDVQxzJQjCDCxqtJ9DlUa3g1LzFnPWgd7r/HiLGuCTYhX2kjTsr3tVnOEX/Nb5gautRBkUQKvlF72iD0PrTNvQ1WajahX3n9DTAM6FeA9eqknJ1b8G15BXBpyr/sCE2cjTU7azmc2YDbzjUnvruzz/cqPSAD2MoOF1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6669Z69; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6669Z69"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso133838a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790096568; x=1790701368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLk2ewPZ35dO4sv1PBOEfplA7h+7hkhFAiaB5n8AGP4=;
        b=Q6669Z69aiz8evyX1oTP9YduG9GEmm+yZ1owcaweIhVIvwIu5ZeMxNwHKN9XUHI253
         bkhGTOJIRFKITQ814L6NLaFe0j0rKEgQX6uVNFe8C56sLzzRp0f55h6dCTJ7PTZHO6MV
         y0jD2zzt1GNBv1N3spkvfmblu6QEfPrpobr6GdPnxcNeorE2JF//fE2zX3cvGR7Pk8ee
         uaw7Ty1dyizdVelRgUruANY5ngpeyONi2tQzTt1vpBzGAybda1WWTdqrJw0qMS47grHN
         SzqBTGxSnRKPseOFZzIbwB3aT0C1x4sHr4ZKNdrgajRiLHk2PjyaTk8+Q/eL/G/I4JIY
         ur+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096568; x=1790701368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLk2ewPZ35dO4sv1PBOEfplA7h+7hkhFAiaB5n8AGP4=;
        b=rD5HfC8avqK+yOSdk1F4TXF/wv3Dj2LBWTBF5izYnXnS8Bw235+AIX2tUSniGFJk/8
         v9bb1hprMUk4Kjx45v91s+MYaOvB7Ea8pPQ3XJp9Sbpdk3XkUwb7EihQVawG9D76+qjh
         06RLyAFUQqHxv8IGXHd2xw6RMe+IbYcP8BpH7hdOS8cciyXtdvvjFjVMYAVZBA+FG5Dl
         QGE3l1T/kd0rrehJyYoRTqgkUJDnjvFfLcxis5UiADgj3g3ULBKq8SFc08MPUnsgYIeB
         Dtzdb4WzMcjpiTA0xCjDtZWKk+BdahwGI4psaaWRDKJkMzlFiqyOWiCKogx3dS5kjuw6
         BIig==
X-Forwarded-Encrypted: i=1; AKwUvBzJ8D84KENptWHrxNr+zPlocvnnSEWJuwQgSN2QoXMo+qFTjptnhJ51nJLqSvR8VMwD5aRSj8crQAQ68CM=@vger.kernel.org
X-Gm-Message-State: AFuF++nPMuNDTqCV28LJjP0aW9wrIGTjfGIZRN6TrCRw0fsisbsel0wh
	kSB/YonPb3mWEdpSpGsEWM81qvJGmR0HHvUiA6yTvoUxNJdzm0Ra4eiV
X-Gm-Gg: AYBFou0tL7spGC8Ywp05l2qTHoaXo6E8YKuLIw/bZ4i5kJQbjhGx4JuyY76O/2SFlnp
	zKMTAwxX8z1Lz7SiBbyJUWI2mfetfa1yjJj0Zu4oCg4M2hapFaoUApyUx6fvAcR2oQf6NOxzW9J
	ViEN40GOZQ73sBJj41lLzne6EH9afAOXLxTBciRit6jdudo77Nt4mSzSYBxyNgy4DtM/+Ry2FIW
	2s4xr61EuAQ/3X+eIiffNQOisYZVuIiBWo1fUm9Xau8EZ3ujRxB6tOnCGE//WSiZasgh/bOT+ck
	ib8Uz176QrEvgh/bIWmMLWIAbXdGj7vBYbvtuTg/XOtks5dvO9iUeLWPh46MWgUT6lPyNoAoi9t
	Zf9KZM1NTEiXb3Ex2EImSJen/P7UKjnuMo2nzGIgCO4LdH6TgPFY/0ae9vORGp0gH1PmGAjRLsj
	lWQb2TNuAHG3ysmeiFDWmXEVArkGJyURfkmsGD2GD5y0QCxRf9cP/IRpDYYpAYFjZfmrNh3Qp7o
	EMWcNq8cEg9VdwStpSwIbqIKIzyGZeybOaQRTqGiWf6IplxmRs4EWQ=
X-Received: by 2002:a05:6a21:4ea6:b0:3da:bea4:6215 with SMTP id adf61e73a8af0-3ddf7e7ab6fmr127070637.19.1790096567733;
        Tue, 22 Sep 2026 10:02:47 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a18dd0sm1274902a12.5.2026.09.22.10.02.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 10:02:47 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: jirislaby@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maarten.Brock@sttls.nl
Subject: [PATCH v2] serial: max3100: Fix a data race on s->rts in max3100_work()
Date: Wed, 23 Sep 2026 01:02:39 +0800
Message-ID: <20260922170239.33485-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260922053151.11260-1-ginger.jzllee@gmail.com>
References: <20260922053151.11260-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max3100_set_mctrl() stores the new RTS state and raises s->rts_commit to tell
max3100_work() that it has to program it:

	spin_lock(&s->conf_lock);
	if (s->rts != rts) {
		s->rts = rts;
		s->rts_commit = 1;
	}
	if (s->loopback_commit || s->rts_commit)
		max3100_dowork(s);
	spin_unlock(&s->conf_lock);

max3100_work() consumes s->rts_commit under s->conf_lock, but reads s->rts
itself outside of the lock, both when it services that pending update and when
it later transmits a character, so the state it programs into the hardware can
be stale.

Read s->rts into a local variable in the s->conf_lock protected snapshot at
the top of the loop, before s->rts_commit is consumed, in the same way as
s->conf is read before s->conf_commit.

Fixes: 7831d56b0a35 ("tty: MAX3100")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v2:
 - read s->rts into "rts" before s->rts_commit is consumed, as suggested by
   Maarten
 - mention s->rts_commit in the commit message
 - left the s->rts / s->rts_commit split alone; folding both into one byte
   would be a separate cleanup
---
 drivers/tty/serial/max3100.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -236,6 +236,7 @@ static void max3100_work(struct work_struct *w)
 	struct tty_port *tport = &s->port.state->port;
 	unsigned char ch;
 	int conf, cconf, cloopback, crts;
+	bool rts;
 	int rxchars;
 	u16 tx, rx;
 
@@ -249,6 +250,7 @@ static void max3100_work(struct work_struct *w)
 		s->conf_commit = 0;
 		cloopback = s->loopback_commit;
 		s->loopback_commit = 0;
+		rts = s->rts;
 		crts = s->rts_commit;
 		s->rts_commit = 0;
 		spin_unlock(&s->conf_lock);
@@ -258,7 +260,7 @@ static void max3100_work(struct work_struct *w)
 			max3100_sr(s, 0x4001, &rx);
 		if (crts) {
 			max3100_sr(s, MAX3100_WD | MAX3100_TE |
-				   (s->rts ? MAX3100_RTS : 0), &rx);
+				   (rts ? MAX3100_RTS : 0), &rx);
 			rxchars += max3100_handlerx(s, rx);
 		}
 
@@ -277,7 +279,7 @@ static void max3100_work(struct work_struct *w)
 			}
 			if (tx != 0xffff) {
 				max3100_calc_parity(s, &tx);
-				tx |= MAX3100_WD | (s->rts ? MAX3100_RTS : 0);
+				tx |= MAX3100_WD | (rts ? MAX3100_RTS : 0);
 				max3100_sr(s, tx, &rx);
 				rxchars += max3100_handlerx(s, rx);
 			}
-- 
2.43.0
