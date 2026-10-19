Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444580;
	b=Ki+9L9LPIGkzFqHnm5RplTNGtxDI7e54jYtHJWautWAkavLHYiMMCw9WDD2rd2O2e03+
	 x3sTSDDXVuooq3tvD6+ntA6KZNN25MNTEaq2o1QmQ2ghNwsM/QiO1OCv7yk02DmGm793Y
	 FFhDVplQYwQUKOHuSPDDfawa5r71XXTJQyk1xmiZOZSyV2PngzpO7zqhjgahGuWC17lPA
	 ESWOcaib578IeTLg/zZe55OQzF0N+sVF6xRVXsOVB0faNPJZVve5jML4wzCb8fwfK4OcW
	 uQVjcfODMkqAvZJ9ElRpe7AZHGKnz5pAJ7Qo1JW8mmL5bRE7cqzPfuaIxGVDb/Hm9OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444580;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WA8GvtHzORUFT5IkuLm69jk+Yt+6Z5rfb9+0BPV+RRE=;
	b=YlNrhFbYyHJN5NEelVtyx9Y+trTFILrWjUpCyfWvhojVhc2FNHQv5lxW9pebAnqwGUv/
	 6ldte5p3jboQpsq5AP9Xy55EDQp6b7jrepx+dOG1SWS6Nzj6I53AHDubMlQalUgp8i+l/
	 duT73AZr0PhaSbs4miTmPS5UEstJlviYGgg6s/ZlC/4LeQqCSgOjy4SIsmYWOx7Utg5GZ
	 cdHajN10/qAdGk2t7ck//KfyVHxhALfUcr3/FIo50Brsx9/iYft5V+CuEGYDOk7z0YIBW
	 MuvmZH1yFn9uKwHLqtHUGKK3aDG/0zsvscOGo56nkaB2r0iWVaatbpb4tNQEP0/1QcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fluxnic.net;
	spf=pass smtp.mailfrom=fluxnic.net;
	dkim=pass header.d=fluxnic.net header.i=@fluxnic.net header.a=rsa-sha256 header.s=fm2 header.b=xBsuYQhT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=uXBJMP+p;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580DD606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fluxnic.net header.i=@fluxnic.net header.a=rsa-sha256 header.s=fm2 header.b=xBsuYQhT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=uXBJMP+p
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 7A2711D001EA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:16:19 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-01.internal (MEProxy); Mon, 19 Oct 2026 17:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792444578; x=
	1792530978; bh=WA8GvtHzORUFT5IkuLm69jk+Yt+6Z5rfb9+0BPV+RRE=; b=x
	BsuYQhTaaGeb2qnKh1kFUmDWI8au6st7wyMbK8M15iSe5eOiLs33Q+gqfFqa8jJS
	hylsXcUlMd+iA8opkFoPnOFbuDEkczBtF3eGYvBbxqt9z+CIAA7lBqzIyVfkZ9u9
	+D65Y17Vv2aYZWu+2m5CXagEogKxhvcoWG8UsAInGiKZpytfzm6r4gAEOvka95DW
	Vgj7VNQ/xA/dqQWk3HU7sJvyZnlovxDcILQOhgO6Q5SJ+gy1OIlwejBnc5P8c0U6
	kkDmpuo7QmMtSVIG8ONy9SK42CsoQpHW2VzkoqVO0GU0+BFvgtUi+BHSO/AbnfHq
	VDIA7wNFv4L+/FmUNKCCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792444578; x=1792530978; bh=W
	A8GvtHzORUFT5IkuLm69jk+Yt+6Z5rfb9+0BPV+RRE=; b=uXBJMP+poB/xUtv6w
	TksUdJLxCu8CQodmQAhFKEznHx73DgGmuBuFp+K/Y0/ZYWg6GY6lrPfcSG+dT2sL
	hcdF2ZnaSM2SDCa0QRbpWvSSe0HwpHGRv5fjxBsYvGNbTMD9bKJ77Gb0GIY4GWdE
	yaEZ7J8TRm/zzATtaYmjYVaAHr/i6/horDqQNMORQAPnzFZKNntHjGI6Kpl/vhzp
	et+AouLlmhCAQzw7emHOCd9UaCQl9q162GIKNiKNB6tyrwlHUEF3H72s15aaboKK
	SR9bylMuoscJufFmr7muTR1vbP9EbAbWcR/M3SvN2MjDNbnWsi4TwgeWkkWY9qM4
	+1wOw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=fluxnic.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792444578; d=fluxnic.net;
	mf=PG5pY29AZmx1eG5pYy5uZXQ+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:BKODxHmffAEYwCPs+C9HeBv3IUogwfIKmeC/ATxRAgPOoAk
	czLfoulr6En+lcTQLWS7E+tMflT957qzpawA2uC/I/FKPEHts3RAxO//yYjL98Jj
	622MnP7zrofTg/0oX02t9L4YwgjU8jWJukw2vcsbKkXbkW/EyJ4oylcc8e/qJo/c
	MJUjz9oRWI/IA8j1vKVQABP3lDVdxOUm8VQFFjZU5sBkylNOEtykd0T7sRLLZ4IK
	AX6BSaMJ9GOZqFZ/tmY0dJDEuCwcAyRGrVHDVKPoDZO9b4vQwjG8d12M/SfGeJte
	pKXztTiNBY3IHU3pX6ScFuRYaYcHMpuLWj29kbw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Uhgio6rnd33JQdewNW94wOsAdhpJvObU3XvfZcsX92s=:aGnF/NMpPzlaVk5biWZGkJgzc3185yWJmeaTyqkTYFc=;
X-ME-Sender: <xms:oojWajUOYCoeCVSGe8-F4dzF7skd1RyigMmqNmKjWMTCiflKtf4y3A>
    <xme:oojWatHUJuzueexFRlYi9jNdjQNTLkJq2dIJykRS5XyaYdGe0oLXqTGm6IRTK-n2Z
    m07Bw7raI3efpHHkOxjsDQc9O0MR3fwF2v5OxLe7Qi_haYgmLOM-SqU>
X-ME-Received: <xmr:oojWavcffhMjYYcRky9RhFUPSSi9hyrkXLIS0OOuA7yYZNKYw3Ta6UHXqLfT8bdKlBh7hIsrQnvPzFAsybqUaoNSy0f12Enog1RzT6oiHOOFogU>
X-ME-Proxy-Cause: dmFkZTF/vnGH0ScjvaxYxr+nv3rutIYng+eq1vxPiBPKiE3JZvmH65b3P8DmdCRPD7IBeK
    ugrAkzbPG9SBPGIZZDEhXEU7X6KDMKyBnLklQSkB1UxyewQvB6HLrWMnvG34mk3U2/2Ceq
    L779tVQ95/2tM/emuq54ysohR+3E+imrKQaInlUmEBa8mAQxiOo4HIqcAwsbbNTM5yXiuV
    /covjUzx/4rs6/hTGjpWVRBDT59UFTYfH6YGC/8gtytJybgRnCtj6Rx8PG6DPhxg+tN+2E
    gOb84bpauyj4Op6Vy1u5U1c6FIwS/0yons6lWFB7uL6EU0nvV63APo2Fi9pO9x4+KwyXi0
    2c1TLscqcMiyRZUFzddNaX0dRDzjREMEvynQGJfhp6DdCVFMTIr/NVguOw9eSmqVyNxqsn
    LRIV9CnepVsp7cInQv16NklAvX1i9kuP36bIH1Xj22PvhffQACTtkX33gSMme8a17A6kq+
    dKxgZqGRBOe1rdILAfedvI28xS+4pDM3WAEnW8wRGmxEoeuwR6+dWeaHgGiNJcWDwTNupn
    3u6K8XhrzRJqWpnZwk7aPOyYX8OFFNtWY2JPbzzd5KAg8LndkSQONNl1BeoTklffR4q0k3
    /ACDPg3iyeRALDzZKevWV83roOsq1UHM22mH6O7i+M8TNLzWXAhvCSL1an7g
X-ME-Proxy: <xmx:oojWauLfG0vnUyRzzj1QW4SjNZSE3lPkdstYY7UKydwvpOU19wVYwg>
    <xmx:oojWakGnlLzaSxhYXlOJBTZLrIsDCcUAez-miY-YvoC_0ovJEHjXdQ>
    <xmx:oojWahDe7F59pwnaoE-amq1Eigdz2n_j4lIhR-oroRWeKbI8Y4BHew>
    <xmx:oojWan9H4Bk-Rzg5KUAlTkmD8wKPtQl5OuFSWn5GHEcyBanXoOGRWw>
    <xmx:oojWah1Tp6J-6MP3VhWwcalqGE0NUe6wwvRuGmwSrQD43LMTtipUA4kK>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 17:16:18 -0400 (EDT)
Received: from xanadu.lan (_gateway [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id D5BEE23319;
	Mon, 19 Oct 2026 17:16:17 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH 1/3] vt: don't make VS16 widening depend on earlier screen contents
Date: Mon, 19 Oct 2026 17:16:15 -0400
Message-ID: <b777616c7a63920f36dd34a1ab96e95073d0b013.1792443833.git.npitre@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443833.git.npitre@baylibre.com>
References: <cover.1792443833.git.npitre@baylibre.com>
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

From: Nicolas Pitre <npitre@baylibre.com>

VS16 (U+FE0F) widens the preceding character only when that character
can be found in the Unicode screen memory. But that memory is allocated
on demand, when the first double-width character is displayed. Until
then vc_uniscr_getc() returns 0 and the VS16 is ignored.

The same sequence, e.g. U+203C U+FE0F, therefore takes one column on a
console that hasn't displayed any double-width character yet, and two
columns afterwards.

Allocate the Unicode screen memory when a VS16 shows up so the
preceding character is always available. vc_uniscr_check() populates
it from the current screen content, which includes that character.

Fixes: 95b05de0a566 ("vt: properly support zero-width Unicode code points")
Assisted-by: LLM
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/tty/vt/vt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 49a140b49eff..335253aec549 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -3128,6 +3128,15 @@ static int vc_process_ucs(struct vc_data *vc, int *c, int *tc)
 	}
 
 	/* From here the preceding character, if any, must be single-width. */
+
+	/*
+	 * The Unicode screen memory is allocated only when required. VS16
+	 * needs it to find the character it applies to, so it can't depend
+	 * on whether a double-width character was displayed earlier.
+	 */
+	if (curr_c == UCS_VS16)
+		vc_uniscr_check(vc);
+
 	prev_c = vc_uniscr_getc(vc, -1);
 
 	if (curr_c == UCS_VS16 && prev_c != 0) {
-- 
2.55.0

