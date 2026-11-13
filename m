Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565817;
	b=mLhBZVAWCoaPHYrfzPJ0Ny53/3OsJ/1z+JR7+h5NNEHGiOogusKFzxCPkyydczPoeCvP
	 5ogCRCvrcDjFSC3VXZyqHxNmCm2mbIgziX9eSTvIRPO3rY2J+C52mdDI0dqX1EtdCRfFm
	 tyvdqcb80c9MgFGLZZlHRY7q3mx/hGqYfYQZUFRKfnpN9DmWWTnrkFJWaO+HBhtVircpK
	 MwDIr8KmWShtpJpl62yobXCO+rAgKJ9mHmVq8P80T0YCezZwm4RbH9Q7t8HF1ydzBbiNK
	 mNuHOElQpc16/XciKUffvfMysdSq+z7QT9OWSjkYXgz/iFntrnR1hxuZm+bxhdyYceQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565817;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5IvnIMxNH4DFuBLSRMUrL4BN8mPeajYkYb4pg7wnNmg=;
	b=tNQ+vC/unTpyqXZKHoWMVr8klzCrcITZML8pA5l/+fbDMm/BV8SwsWIbjCAj8mZiTFJ5
	 WcbhtKgGNoWa1PASu4LTwFUuWpOZgeYUqk598E57mca9QPbVDuk7PEFR8I+JpeAHsqbXQ
	 UDTIZxARxllKGJqv64UtpZxdz1wZzEqHH2f+OeiaTNu9Av0TkFXB0BRmxS4G0Pkij7HBa
	 fdMTHURulB78F43cmiCnKt3Z8T6KO4FMv0y3a+Jh6+HdWH6gI+Fdyf6lUQiwsM/I3rIli
	 Aa7XGwwLmnM0/ePa9lbuTuUxgDuOoEzlIIDeAyCfd4C6HUTLRv+UvYpO7TqEyqvIbGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OrfI5aw+;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E35606A335;
	Fri, 13 Nov 2026 10:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E35606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OrfI5aw+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=OrfI5aw+MkoZPyfArg0eobtJkTHI5gxU0Gz6eIGGAMZ9J9YWK98YRhhRy5HUw4KpG6Ki5uALS0TKp
	 B9/dfh8eXeDPkOeWN4wVKhNgMc8QDjKQuNqh+ZRL9sBdJJsBNLEzXw1k1mz1/lGp5ngbD2sCEv6TSj
	 sEeFRXvr0RBqrvq4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af6e6b0d49-27d23;
	Fri, 13 Nov 2026 18:30:09 +0800 (CST)
X-RM-TRANSID:2ee26af6e6b0d49-27d23
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af6e6afd4d-22761;
	Fri, 13 Nov 2026 18:30:09 +0800 (CST)
X-RM-TRANSID:2ee26af6e6afd4d-22761
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: aoa: size the codec reference property name buffer
Date: Fri, 13 Nov 2026 18:30:06 +0800
Message-ID: <20261113103006.705-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

check_codec() builds the device tree property name
"platform-<codec>-codec-ref" in a 32 byte buffer with snprintf().
A codec name may be up to MAX_CODEC_NAME_LEN - 1 (31) characters and
the surrounding text adds 19 characters, so the full name can be 50
characters plus the terminator.  Codec names longer than 12 characters
are silently truncated, of_get_property() then looks up a property name
that does not exist, and check_codec() fails the codec with "required
property ... not present".

All codecs in the tree use shorter names today, but the buffer should
match the documented maximum.  Size it from MAX_CODEC_NAME_LEN, which
is already available through "../aoa.h".

Compiling with W=1 before this change reports:

  sound/aoa/fabrics/layout.c:780:36: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 23 [-Wformat-truncation=]

Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 sound/aoa/fabrics/layout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index 7bb541577..8ee66dabd 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -771,7 +771,7 @@ static int check_codec(struct aoa_codec *codec,
 		       struct codec_connect_info *cci)
 {
 	const u32 *ref;
-	char propname[32];
+	char propname[MAX_CODEC_NAME_LEN + 20];
 	const struct codec_connection *cc;
 
 	/* if the codec has a 'codec' node, we require a reference */


