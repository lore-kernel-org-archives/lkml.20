Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580375;
	b=Qbn5kZpraRkTSagMnE1vL+SR0leO8k1QLugT5nN+32ZUmA6PapOfLyBiaZ7FDtzY1NVO
	 UgD9a0ebr4hnFv/Jv3WJzyLoJQrhH5fTjBXn+SV3RGJQ5+tw1JuiThBh1ouHRpJpbLKDZ
	 imot0NDulTd6KJ32TSdihyHfeSNGsCy8QbF35gdSYJJZM1h1FMOsBuLwef/us0b+CS7BO
	 ynV/eVXY7eYVBGyE/orPRRXx+edl/d/OqAEUW/hrx4oDhixvuRau3qpjslgLH61U1OtX6
	 AwLZBQ292n8Wl6eXyBL7yALlmDFbq2vmQ5t4qY3b45+FmEf3SDjdOFzBQVXei0dd42g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580375;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=71PhXNjOvmIAl1aRTI7zqhrskFBVVkC78m4SzV3kK8s=;
	b=BZJywqptcVIXx1w7htLnd9Bojd3miFJA39+8kU1dJmMtR1viDi1OtHwkNfW/I3oYqepR
	 S5yoTC/+jf8pkOiabeltTvryN0jwng2SIXLPTWXpnRAvkSUzSF8Gm0NVO1Z6JK74c4Fbv
	 4Pebw1oLcKvdL9VPIzHplmcKD9z+AXvGoxt2qqwbK4BpVDYea/TFjcq1WagBlGD2gq7tt
	 c7BRrLjQyiTGvS8JLDsq5R/C8wi+g7ZABWOX8aArnPVh8VlPvZCGa3zHJM9HHVnHya6Lp
	 x9tqh9U3tklGYK03le51/8GelUPPqnWnHvuaamc1OaVle/LOwG7pKVxAyFAnm4T9mGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1+MDMGt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E0606A31B;
	Wed, 21 Oct 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1+MDMGt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1241F000C9;
	Wed, 21 Oct 2026 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580374;
	bh=71PhXNjOvmIAl1aRTI7zqhrskFBVVkC78m4SzV3kK8s=;
	h=From:To:Cc:Subject:Date;
	b=i1+MDMGtleUeML8OwFtwmJQRuoyHcR+jJfoYStTvTgWsP24f/QUqHy1T3LEfDIVus
	 7s05SEm17UKRkckZ5q1WypTzLMpqS+mYCa+S3iHU0OOoztNQzjtKyRRVOYK4d1a3I9
	 i0/4U+oLbwpvTr92AmPGP7gDAFTBtTdLAh/PeRIi3sWngcFDfWPWJQ2EU+8yKUz2a7
	 WWq7fcn+syQUjmmzKCvGqh543Gn4s31NSpjMhTHkDHQvI1ULFhkN3Z+CfMEjKNhshW
	 SOE3TgvKi5FOF72Zd5zcDpOu9I/zMXTk1XUirFPknSb41ekQbefQwqyDT1H0KGtq9Z
	 BTAce2BZpvqTg==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rong Zhang <i@rong.moe>,
	Arun Raghavan <arunr@valvesoftware.com>,
	Thorsten Blum <blum@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Use strscpy() in append_ctl_name()
Date: Wed, 21 Oct 2026 12:58:26 +0200
Message-ID: <20261021105826.147060-3-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503; i=blum@kernel.org; h=from:subject; bh=iiUI6+gsmzqf5KZyem4oHEBxqYvGd+SjMlFNlVP6GDE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk3Zl0yi68qmL9y1Rd/mabqQs6jD5Sf5heVya0r22Vdd jFceb5+RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEyE34aR4XH+rKC5EjWMW0tr r7Pv/XDvoegdi2+uEZeWtq8JfMvj4MXwv4jj2CP7yfX9yUyJj1yjeNbdKdvC5Pf9Qqp/xoSs15U crAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

To prepare for removing strlcat() from the kernel [1], use strscpy()
instead with the current name length as the append offset. Change
append_ctl_name() to return void since no caller uses its return value.

Use append_ctl_name() to append " Jack" in build_connector_control().

No functional change.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/usb/mixer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ecaa8bc08d7c..0320a3e8af92 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1720,9 +1720,11 @@ const struct snd_kcontrol_new *snd_usb_feature_unit_ctl = &usb_feature_unit_ctl;
 /*
  * build a feature control
  */
-static size_t append_ctl_name(struct snd_kcontrol *kctl, const char *str)
+static void append_ctl_name(struct snd_kcontrol *kctl, const char *str)
 {
-	return strlcat(kctl->id.name, str, sizeof(kctl->id.name));
+	size_t len = strlen(kctl->id.name);
+
+	strscpy(kctl->id.name + len, str, sizeof(kctl->id.name) - len);
 }
 
 /*
@@ -2090,7 +2092,7 @@ static void build_connector_control(struct usb_mixer_interface *mixer,
 	}
 
 	if (check_mapped_name(map, kctl->id.name, sizeof(kctl->id.name)))
-		strlcat(kctl->id.name, " Jack", sizeof(kctl->id.name));
+		append_ctl_name(kctl, " Jack");
 	else
 		get_connector_control_name(mixer, term, is_input, kctl->id.name,
 					   sizeof(kctl->id.name));
