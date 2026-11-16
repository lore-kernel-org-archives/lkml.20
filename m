Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839845;
	b=dAfjgio7HQoP3Q1NmGCSDuO21E3MfOyYjZyN2+6gS0m5WJQQEh3LQuqTtf9csUcObd+x
	 3wPuZSI030YXOij49hRtg2Nr/SWzMTSubcNyzlHUJBq3Qpug1e4fmh4KAPThgm8wtKxsY
	 48wxzz/lxi7x/+rqgUCpC65Z3T1b2Fz4i+4jLXknVnTIyNM1Q4uXSSqeNiV0Im2yHLv4n
	 iumbEtsMs/QfViUHXPeHTFXaQ6t9U4dy1qwcYp/2aC5l3/P4zAGYmVv4ltvcHxHyIdxP4
	 f9IV+yhR6639xyIdFugAVy57ENMwiOcNV1Ip9RmWzf95tUydfDGZZSH66Q7OBwuocdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839845;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=3C3wDoRlKOnnBMknZnVvqonsM/xiO2XIhvJ8T/E9PNw=;
	b=TtrXEwkyNRNeUbs9HrHNTuicnsPJnXU9p1XIp7f8tXxMBKWaBBanapkwkXGbSmCk2Yts
	 fvXb3iDMXdFtDvUrYZveaSLmajsl9x4Sz0BLCCJSbeDCL6H2Wzgc1VzYDc+gm/R91tfhr
	 EN6FBKiCOeBREYUYMzGeRCtrQhtSkBJnjm90hZVusmMlK4lu/1bbeI1DucctQ5SbyAMeN
	 xwu7OvNn8UqOpsTB1aC1FSu/OUDqwp30SJCdAJEpVETJ6jWCTFJeuwYC7Wr9K7mjxST/o
	 X+uC45Z8c6xX9+eIOsNZNjrPItt6qVZi6cd6LbMm3g/V0No3n7Upljv6Jsu5R9FJYXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SXjMUv3u;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ulPxifPi;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18118606A331;
	Mon, 16 Nov 2026 14:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18118606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SXjMUv3u;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ulPxifPi
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB11321D8B;
	Mon, 16 Nov 2026 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794839843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3C3wDoRlKOnnBMknZnVvqonsM/xiO2XIhvJ8T/E9PNw=;
	b=SXjMUv3uFnxykhR479l2n0VlHdQypIvvXt1oU7C+rIc/RlQ/UikObNxXcOAyKmx4lLR6ew
	1eYArMOR6HCEV55RpO1KsfarZxwK9JFRbz/XoytN9QiN8UKYwEOhfTyqDXp82mIaDcigSi
	H6llazNbMvZAuGNf9+xP5PnFb8KBSoI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ulPxifPi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794839841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3C3wDoRlKOnnBMknZnVvqonsM/xiO2XIhvJ8T/E9PNw=;
	b=ulPxifPiDQ6wfUpP42tqqY0o+KHpqyhFJG4Gwn0f+MPrj1yNy6YA46lH1SCbwxfoCg4OLo
	z2HNBaLzbElvyg7l0Z/Fmr2ZhcG1cdS8PW2IQe1zE4XDYVV/iu5df8oXJqqijCIBRfAuDM
	WaGwUDjB+86sWhEONvDntRZo3OgjDvE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 634931334C;
	Mon, 16 Nov 2026 14:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sgDxDiEV+2qAcwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 16 Nov 2026 14:37:21 +0000
From: Oliver Neukum <oneukum@suse.com>
To: mchehab@kernel.org,
	bryan.odonoghue@linaro.org,
	dan.scally+renesas@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se,
	hverkuil+cisco@kernel.org,
	deepa.madivalara@oss.qualcomm.com,
	entropy1110@gmail.com,
	jai.luthra+renesas@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] v4L: core: ioctl: fix format description for V4L2_PIX_FMT_RAW_CRU20
Date: Mon, 16 Nov 2026 15:37:16 +0100
Message-ID: <20261116143716.602898-1-oneukum@suse.com>
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
X-Spamd-Result: default: False [-10.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,ideasonboard.com,ragnatech.se,oss.qualcomm.com,gmail.com,vger.kernel.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas,cisco];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -10.51
X-Spam-Level: 
X-Rspamd-Queue-Id: CB11321D8B

The description for the 20bit format says 14bit.
Likely copy'n'paste. Change it to 20.

Fixes: 78584431e2ce ("media: v4l2: Add Renesas Camera Receiver Unit pixel formats")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae70735..fe9dac613e92 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1434,7 +1434,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
-	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
+	case V4L2_PIX_FMT_RAW_CRU20:	descr = "20-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
 	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
-- 
2.56.0

