Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781277;
	b=xE5Pv92n7FwCrx/YNTmZcbx6Z+vNby4TyTFAdp0VtfCIuyPX9erwPMTDBkpM662DFIo/
	 F4h/eVufkbqb8A+y6IpRCQAUY/hNvem7L7yRf3Ubh+YKjnQXlaviAdRsITGaUwjFcyWiH
	 XJw7Sm1W43AHzzmhxhBpBmlhehc6Ur/dVuZ7FcmunI4b0i87CB47yyiRFYo14fWuL40hA
	 F+AQ2GDNZJ5+IXy6yy1iMFWAej9Epr3r/zEABMBWdNS1OOV8YTh4wpKjmIneqzqqVDnBQ
	 CRUaw+TA4WDgdH3B4N0IZwhNb70/ClK4JNYoZY1zMUBbCyuEC8VoQnfq5U1a2nIjt3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781277;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7dJIJKULXdMXlKFG0VQk/UpZC37r4yyYr4hDt7gk8BQ=;
	b=kNUQh1j8wmXLkNiji5qQX/yS4dWVoPoYqBqjoHE3s+nfndG86jyBm/48SMnF1+5CHcLK
	 P/0kzJEj8ewFN1/PVUygPKvE168trNdgC4n9DPQzCP2bKhlfohnJWEM5CMlLZXqN6HW69
	 moukwYa+6mjcc8AluySfckY+M1i36l7YoOPvrg1S1x+QR7cqXdkrLPGcepWix+CMnAE1o
	 PhKUsREgQYavXf2/ZjN0Jp/frn6T7quIHuLsFHToCrSjv5vwbSXvRKAwVA0ykmpPLvaJ6
	 EHP+EykXVHinJRW1yIW1ryyjqztIcjMhUlbVMUcoO+ue47YmgXZDbcGQo5651a/WPuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=kCTvSCK2;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA2606A31B;
	Wed,  4 Nov 2026 08:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AA2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=kCTvSCK2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1793781205;
	bh=7dJIJKULXdMXlKFG0VQk/UpZC37r4yyYr4hDt7gk8BQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kCTvSCK2VFcwQvxbUM02aX70cuW1SbP6rCxzMEW7j1Uzb4OqPhp/dHtZhDIRKbcmX
	 vVsFv4Uq2fx2/PYHVKDH7R8z4+GRJF9XKUK0+9uAGHM7ysJNnmKs/2uadJ49zQJJ7a
	 52z6guHkBu/k2eKjhv9QkBUzyvyU+nrkQut8mw+I=
X-QQ-mid: zesmtpgz9t1793781188tff86e048
X-QQ-Originating-IP: zZTmu6q6f46xmWIdyU1OUvSG1UQvWXLb/CllEYt+42k=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 16:33:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2712297879338175184
EX-QQ-RecipientCnt: 9
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	luiz.von.dentz@intel.com,
	brgl@kernel.org,
	pengpeng@iscas.ac.cn,
	pmenzel@molgen.mpg.de,
	raoxu@uniontech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: cs8427: read the PCM stream IEC958 status from its own buffer
Date: Wed,  4 Nov 2026 16:33:04 +0800
Message-ID: <7A8A7F3C30522F89+20261104083304.4000520-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MIGBBOK2RQC48W3b349eeHh6nsZhj6AQkjoVNehN8xdqaTr1wt4yKb9Q
	kkz1fzPhmGwm68UpYXa0VBKdsiMLNxxrOU7+VeRlcJL7c6J0tfFnoIUbBCYyh15vD0u2SoM
	f9mOU8EEMnQwKofwTDLp5DgmzW4jBXAJoDjLP4lca6Pzw3U34rlJ6JYHWlVaYPh5x4bMwYs
	obvsQjN8fK2aFxE3500VQG1GR0VjM3E9OgKvJ/qi62HJ80u//FmHRRNHV6TrP5kuwvdOXwq
	pIJ+KUtUl8yQHXhXzPTsPAT3wzHS32D+g+IzJW1fCrR2Be/Gg3aBBQaB8AtycpVo94P7Yxc
	0esmdgDXNxIyZM1xUWaXH76PqQiiiPu5NI2xsHyhR4ExI8TA3pQk0yZG+jwFcjEOeNyB+p6
	51OcwUwjg8PlK+h7ryTA0DHKLh8ec23/0vYJ3sEKTxqDzX2n6y2wefM0IaUfZa8dfszPXdo
	75CqNSdc6azYrv00AoP97wdHS009wGnPtYUY/0ngG5st1kPJBA28ni5cJ4FlXXxiicQPX/J
	dmKu1SWT/SgLtaOUOIpK18E81W0lX1IZhVZspUe1im3uvWSgyRTndVKsW3vWsb/Brk214nQ
	f4GLEG+N4a/TEiKlFldPfzCuBKNyDYckHvlyFBMXQ5iJaSC+I0rEbKG2249DzBFxHRy9Z55
	NG6n41nZo+VZo6JuP2SOfK3FdT9oqpiHmZ+RyShrulMF7piPRXS427lteYHCpjJxtNBwvIK
	f/tzi2jFV/Zk9mQnCLdfd4yFj25VnsNKLSdMfWco68fL3Q53HgfZtnplLQ/xdjI2+Usug/P
	5SUd/ajQ0pHtHBpJMoNx13MO5g80xByph73FOSVPzfCmrFhEyFhLgod8WJkkDGxR5nAx/ZA
	B2p6ktsq7mkg/veuTNEsO4SMf5YTsTZNWHhWOOjvC0zdWrdTP6Mvx9mQX6L9Xjq+EM/wWSl
	bXqfJ5p+g8vdZBZ8kfxnehVWpj15AQkrJ6MQjwRC/L90sVSRAtStK1JFTliCzNAXj4ugBeO
	It9FRMLMCKs6L/S7yp5DX1JPDFQnfxOkDwyVin1EvqeHwQGpJsuRa/wG/JREY=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The IEC958 Playback PCM Stream control writes pcm_status, but its
get callback always returns def_status.  As a result, userspace
reads back the default status instead of the PCM stream status after
writing the stream control.  Rate changes also update pcm_status
without being reflected in the value returned by the control.

Select the status buffer using the same private_value as the put
callback.  The default control continues to return def_status,
while the PCM stream control now returns its own current status.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 sound/i2c/cs8427.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/i2c/cs8427.c b/sound/i2c/cs8427.c
index 1de985ba85d9..773383471f17 100644
--- a/sound/i2c/cs8427.c
+++ b/sound/i2c/cs8427.c
@@ -424,9 +424,11 @@ static int snd_cs8427_spdif_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_i2c_device *device = snd_kcontrol_chip(kcontrol);
 	struct cs8427 *chip = device->private_data;
+	const char *status = kcontrol->private_value ?
+		chip->playback.pcm_status : chip->playback.def_status;
 	
 	snd_i2c_lock(device->bus);
-	memcpy(ucontrol->value.iec958.status, chip->playback.def_status, 24);
+	memcpy(ucontrol->value.iec958.status, status, 24);
 	snd_i2c_unlock(device->bus);
 	return 0;
 }
-- 
2.50.1

