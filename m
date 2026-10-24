Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812655;
	b=X5PRbrf1h7+jy7I5G/YrxV1ug3AQNTO8e5Rw6BRrudWqRGeMBezPSWs5aa9Z1Or/ukjg
	 +GxgDhjIFGF7bRfTOzK0kgjNLeAxxTcmPjIwmz2m8KJwVWlj8w6phlbvmLJ4LZJnZFpoC
	 ZU6q6HB+8tC1VlgHFGBaRThoO8JLZOufHVGfxABUBC1r0CJQ9mm3rQYjKZOV9b3MvNy66
	 sMmZvR0s6qSX0737nAtvwGS7DPwU9grgehrnAxOJHme8WJk5iMnHL9RHdOkRhfT7cYiyE
	 ORX3V0dXl6XgAUQm3bSKupSR/TONCfyxlq94twgvWIo1NlopcLrr5CqSawpMPYDpQsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BBHk/z3NrzrI4byyOl7kQJocwRAO4/8uB3uGu1WhUhk=;
	b=hOu2baatccGlVrWqkEF09NltDRckKh2BqtVuEexvnGleNcovdXIyXptpNwRESMmuL/gt
	 0XTo0tuGSz8cGeadxI0RSwXw5Zw6ieMYK5Ms4XREKNPXqpgo6YeACrUAEP46NAqQot5rj
	 id+wCX2cDHadpToQ8DZ9WArWTO0N6/IcUMHT0dKyGm+0w1GT55cykrRybP0F7d7JY+DF7
	 lNcgWZZeWJVe+deZkb2xshV4AVw/nCJzSoRn3NdE2b3Bex9w9Wblv6f3qVVhSZWdxDgLp
	 cuXfEiX1Li30ytrqzWm2kzDOdgQ5A/hQKhxYcABhojYbW5pyEkRiF0w1cVeq2xA3Smg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bUF2QtZj;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F4606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062F4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bUF2QtZj
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso2249253eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812654; x=1793417454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBHk/z3NrzrI4byyOl7kQJocwRAO4/8uB3uGu1WhUhk=;
        b=bUF2QtZjFVVulv0Fs9I4f0CSee+ua0c1lVBgpK66TFDjnOeZdGGzvDrW+esNgVE3Df
         VvuNiRHq5Za5vVGI6NHbKouXcvN9pP/7s2O1fL1JLzKWGPQii9jk4VhqIOQU5UQcRrYJ
         jwEhGfRrYWoBdxBGianUjKW78JWcfswZToE4gD8zK4vh4X4zuSAqLKyzAc0lX+xP8KX9
         RJwRG/7aRYG+LlwYZrcyw6Lp4QmqIREGdbYZ53nfsVVvqRmKRN5O3oWzd2m25ObF1+XT
         iOzw+hJ3GWyWW7d6gfFt/I7kEkrNwRqBLU9YNfJf8JIhOQXShGTPYzVOXh2/c520J0rZ
         f9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812654; x=1793417454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBHk/z3NrzrI4byyOl7kQJocwRAO4/8uB3uGu1WhUhk=;
        b=y1lCY29avTB14PMeKhzmURENH+F49Bln62dQSJ8HZv5ECUlT5NAiJvR0niWEQtmYtx
         09qjZWcngd2L8PEk7IpPDLREKPN4H9rY+RwJMlF6YfN4L6JkULQe1X5lcg3Mjetu2P0M
         VHThX/EW14Ot8Zn7nikQRB4m9QeAu6OhlMvFHAGPg2QPuoJQnn86CAmE1VxiMVSX+Usx
         DrE57RQ7DKBEOejcP0AGnr9Qyg2jRjjbyCW1lKDIvzQDfOtXIajPTSGlMGOMCcJmX+En
         DGMUBaXqWTu7H8rdAFD2iVshn0fGe0XkN0C3+aa3tLX8WmFcgScYaRSPG2mS2oalbHif
         Xhgw==
X-Forwarded-Encrypted: i=1; AKwUvBxGlc5CP9ZbXK2pm9MyqrYYCgYYxhOCzmjyDE6+pPZR3hMdWu0XGYtvA0BFEYjSQM75khMyNXKdV5JxVY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2X8nbpflCQU6Ri6kNqfyS+AjMWCtUMCm2W2epHKQgICqQg3vf
	dJXYSsaXBsJRs4r6njQUvcKMtIpfqU+BgVsZkYFOVvvJ3bW+S8vakLzj
X-Gm-Gg: AYBFou2TLShgWLJF6d6WJK7GdHs1v3UNMKSNeSpDn02+rqyTDX/tWLF0lwoxFbnXgYf
	GnmQl621xrM63MjT3YBkiRhmwD038OfQ5qlZ/w0kRlpmXQeA415FZ5IXaQziwY0iXfNYu87IYb6
	njFCZe1FiuVSnlQnDhgk9qO/84D6QJUJZlZMMw5AauBC2NChtitDbyzzM9mxFjgjWOwePnrJScq
	XzJY25pm8EwjtXizi/C1xLLBVy4hW4CnOcJLEVF6gzgADQErz4y2Sq6tmWTacbqZN+pYKuKGTpQ
	f2OjnpLgOpwLUtuLaZB+aNmvU/6OqTrhRXZ0Sloz9icJBNsvGdZobAZSXjKsi5SVHplUHKeRRG4
	vfvTyiSYeT7CxAZ+s4Fn6vC231zhO1A8TnTi3aFCp897LWDaqszLSIS+7ApDN19r15sPhxew4hQ
	7kQrJVfK39OyuEBy80ASrH/I1o+zCyEYVpq8suD86FHt8gUZUg3kOLY7KBa5VB1i7KqMYJWDccr
	GXpVBX6PICOo8JDkJZJAWZs1wdvbtf94AZCfGV7dJSwmTEhlPkfEsjkinC1SrqlpG/22Jh0TvSr
	74T6GD+5rjX/ay0Rg/Mio6iycIbXJA==
X-Received: by 2002:a05:693c:8392:10b0:35f:ef9e:f846 with SMTP id 5a478bee46e88-369e8315eeemr1809228eec.3.1792812653959;
        Fri, 23 Oct 2026 20:30:53 -0700 (PDT)
Received: from jmoon.tail8e743c.ts.net ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm2827283eec.27.2026.10.23.20.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:30:53 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v4 3/6] HID: wacom: add NULL input guards to wacom_intuos_irq() and its helpers
Date: Sat, 24 Oct 2026 12:30:37 +0900
Message-ID: <20261024033040.316652-4-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024033040.316652-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261024033040.316652-1-jinmo44.yang@gmail.com>
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

wacom_intuos_irq() assigns pen_input to a local variable and
dereferences it in a dev_dbg() before any NULL check.  Its helpers
wacom_intuos_inout() and wacom_intuos_general() also dereference
pen_input unconditionally.  Add a pen_input NULL guard at the top of
wacom_intuos_irq() to protect them all.

wacom_intuos_pad() uses pad_input throughout, but pad_input can be NULL
when wacom_setup_pad_input_capabilities() returns -ENODEV during a
successful probe.  Add a NULL guard after the report-ID check.

Adopt the same return convention as wacom_intuos_inout() and
wacom_intuos_general(): return 1 for "handled, don't sync" and 2 for
"handled, sync".  Update wacom_intuos_irq() to apply the matching
"result - 1" transform so that the NULL-guard path (return 1) suppresses
the spurious input_sync() that the old "return 1" would have triggered
via wacom_wac_irq().

Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/Cintiq")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index bec8dbec5bc3..c38fbec114e4 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -581,6 +581,12 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	      data[0] == WACOM_REPORT_CINTIQPAD))
 		return 0;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pad_input is NULL\n", __func__);
+		return 1; /* handled; the -1 in wacom_intuos_irq() suppresses sync */
+	}
+
 	if (features->type >= INTUOS4S && features->type <= INTUOS4L) {
 		buttons = (data[3] << 1) | (data[2] & 0x01);
 		ring1 = data[1];
@@ -716,7 +722,7 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 
 	input_event(input, EV_MSC, MSC_SERIAL, 0xffffffff);
 
-	return 1;
+	return 2;
 }
 
 static int wacom_intuos_id_mangle(int tool_id)
@@ -1073,6 +1079,12 @@ static int wacom_intuos_irq(struct wacom_wac *wacom)
 	struct input_dev *input = wacom->pen_input;
 	int result;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pen_input is NULL\n", __func__);
+		return 0;
+	}
+
 	if (data[0] != WACOM_REPORT_PENABLED &&
 	    data[0] != WACOM_REPORT_INTUOS_ID1 &&
 	    data[0] != WACOM_REPORT_INTUOS_ID2 &&
@@ -1089,7 +1101,7 @@ static int wacom_intuos_irq(struct wacom_wac *wacom)
 	/* process pad events */
 	result = wacom_intuos_pad(wacom);
 	if (result)
-		return result;
+		return result - 1;
 
 	/* process in/out prox events */
 	result = wacom_intuos_inout(wacom);
-- 
2.53.0

