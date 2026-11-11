Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412134;
	b=mVge4tNnkCIqezCLAV5kINKyayCENLz+AcVj0wHDaTSMhgIIc0tMDWL89ct1VEXdIuUC
	 MzQy5P1ZPpdCmIlPfjoJGNO+33GKFAnrCxnlDyGWCIvZaM4dIykII7iGVp0g5mCJtqNmJ
	 2Gv1ne3i1XUlyhfMfHHEgws7yr7mObr5n13AE8ktEbys0txum86d0bmLXWot0MPMZ/vHe
	 VLvqSm8jKho7H/xN4552VW+QafhsWec0uAqrqECzfiefIm5UFww186C3mQbIsZ8opdBom
	 QxI8RJSCSQ1MkULTFBsDnQ6R3N5/S59L4kNIkl73OMNdKuS78H8hd7UsR76nyHDjiCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
	b=avRLEmU0elY5RdTmW905VHulRwVXjbbALw8t/jFwOOBZBNEYEe6N9vOw9tXIahPjaJdn
	 puMJt96zttlflb1vlonUHoLiA401Rzcz6P4Mvy9tkoHoASPDddENlsIFxn0A4fQqPSkmt
	 GiV8UAknJaPrzdJJcfC3RlY8/d20uLRhni/W2BBjvWWMV4x5qeHfmA4V0T93kV1/fePLV
	 H3ddGXx4yq6pwsxsCxzkq0bIExytRAv1N7ns10lcHzmzO/hnOFleZ9zFFGPUF9vmIN0qV
	 5orgS5nHXac1ifCOhchYJHZHWMZg34rlTqhoVJ4C6Tj3aN6BiZLU9eKRHLYho1GZwYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VT5a7nOG;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A4606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78A4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VT5a7nOG
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30538735e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412132; x=1795016932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=VT5a7nOGpghSxwOGtPh11IR/n8NBrwp5Z/kZ0IAAFSRc/258/hMLI0YULU6Tga3so4
         ZOTkgJqYPtYEUDheZPU4qNs/V5PmTb1pDtyltumxJ8SldEpBQtAEm5K9rcdJSFzJRlRo
         y80oezaNOVmg8DxYUX4gV9yYD5sJF/VGhAL/9JRfkjwEEBNW7fU2gmKYtP68GL6tfxkZ
         Bc6ynju5vobK6vCOs+lXV5LTw/nljSXh+GDYDPc0fDvIe8aqZ2Nn/pWRqCso4m69Cmy+
         EAttHbjde4ED2ygP/2i+qKauAZ+zpLco+XivACDKfUHeNlln39IjRFwbN45o0HTxEc34
         VJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412132; x=1795016932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=SnonsrBOJ5OL9i0HuRZZ9q8qTAExvbyN40B9WJ95aVvDO9nnblhmY0FhdtDcOlizhJ
         U5EPIeS4w5dWFvkiWxyBEi+VDlMAxnOqEIO+2+SGLVvhf8rl2cPKOLexoBj8ri89jUKA
         FklcM526u94os+kTr8TGyeJNQj47OWScn/wHEgSoCNzqZ9dSEd2UlZ1OwunaVA7VfwW+
         LHFi4LofsJ3unh0+GFf0h/Snc/Bx0inHP1FyuC0U+gZBqYQHm/dTbeRFjwG6CobEhRGI
         h1dvPvT3i8qlExFJj3nBTwArXEwPp0n3/x2N4VsRPkdhVduyGd7ekQTpY585hmd5VEbO
         gDzA==
X-Forwarded-Encrypted: i=1; AL+hErHtrCTz2Pq9f5LIM+5wohOW3gc1TP82eC7vjVXZHJPLFFufzbwCWx+AypJ0DJUfjzJtpKMXCbisS/iXrs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z90OU363hPqwRnXSlE2f5iMaTaiQyGQO03p3ofYMjmS4GtfAu0P
	emnWMNOiQZLKemJw0tNzBhcqIxiXjkN6CoS/QzGPQgTbvWt1aXM9cYM9kGUE4UD1rUE=
X-Gm-Gg: AYBFou255Lj46Mw88c/jk3HApEoA0uBZlVRfKFIaTiOo6Ufxh7M/5tYWM5WHXCuyH6M
	Ea9MSMHxVr6wn1BN435SsZRcAAHWPYdQNwZcf1WDnsEMuqbK76V48kLUp302w2cTv5ghugVnCwy
	pqMgnHPZ0GTE51pfBuhkitIs10DqEtYWfNbreXFohfwAE8KjqwDqw1080mWLCba+JSw7uQ53XmZ
	v50eXgGyG1VytBxsR1u102ZnNiKEIm53tF/xsIsVwgqILxj7leV33N1eEGbXpd0xlKUkiNwvPBL
	qVTIGdTjPm0qbByLLeULyCnzwtekTOdmGf85j2VdubJZYO4EgU8gvcanpPVnb6NgsFyYH47GH7g
	uulVSwguAZ6T+cGAEnjCit/EsyhzQxyAAzw46ctPVeQndw09ASTldEKTVju346m+V/dfgtO0+vw
	sn6AP/1e9/OWmfViCBROWx4lHnOcM2X6mk/y/Ha1kO6vTJGBVErFTYkD6s2Ys8PwcqFbLWjAaDP
	SI6PlcayN+flfG0HXaZi9qCVbUvNWDWXUzbvI1Yn/95Ae5PasHdp37pGQ03zLO+E0fQ+y/OG5sh
	fgVAcPFq+0ebda+SEIl4ZjoOUCAR5yFD
X-Received: by 2002:a05:600c:e551:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4ba59fa5118mr36715345e9.23.1794412132172;
        Wed, 11 Nov 2026 07:48:52 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm55266415e9.0.2026.11.11.07.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:48:51 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v7 02/17] printk: Rename preferred_console to preferred_dev_console
Date: Wed, 11 Nov 2026 16:48:01 +0100
Message-ID: <20261111154816.71103-3-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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

The preferred_consoles[] array stores information about consoles requested
via the command line, SPCR, Device Tree, or platform-specific code.
Within this array, the 'preferred_console' variable tracks the specific
index that should be associated with /dev/console (typically the last
non-braille console defined).

The current name "preferred_console" is ambiguous and leads to confusion.
It does not clearly communicate why one console is "more preferred" than
others in the array. Furthermore, entries for Braille consoles can exist
within the preferred_consoles[] array, yet they are never associated with
/dev/console and do not receive standard printk() output. Consequently,
the 'preferred_console' index must skip these entries, which is not
immediately obvious from the name.

Rename the variable to 'preferred_dev_console' to explicitly clarify its
role in identifying which entry is linked to /dev/console.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Acked-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b8d62fec2569..435c1b7148f1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -365,7 +365,7 @@ static int console_locked;
 #define MAX_PREFERRED_CONSOLES 8
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
-static int preferred_console = -1;
+static int preferred_dev_console = -1;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2586,7 +2586,7 @@ static int __add_preferred_console(const char *name, const short idx,
 		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
 		    (devname && strcmp(pc->devname, devname) == 0)) {
 			if (!brl_options)
-				preferred_console = i;
+				preferred_dev_console = i;
 			set_user_specified(pc, user_specified);
 			return 0;
 		}
@@ -2594,7 +2594,7 @@ static int __add_preferred_console(const char *name, const short idx,
 	if (i == MAX_PREFERRED_CONSOLES)
 		return -E2BIG;
 	if (!brl_options)
-		preferred_console = i;
+		preferred_dev_console = i;
 	if (name)
 		strscpy(pc->name, name);
 	if (devname)
@@ -3935,7 +3935,7 @@ static int try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_console)
+		if (i == preferred_dev_console)
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4108,7 +4108,7 @@ void register_console(struct console *newcon)
 	 * Note that a console with tty binding will have CON_CONSDEV
 	 * flag set and will be first in the list.
 	 */
-	if (preferred_console < 0) {
+	if (preferred_dev_console < 0) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
 			try_enable_default_console(newcon);
-- 
2.56.0

