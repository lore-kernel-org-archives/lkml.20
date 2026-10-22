Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656897;
	b=bRxuTp8mOK5dIUNwquOLmJJWEPjfeT3ehU9COoRS9PuI/h96TMQy2j3RDTQ1dF/ptnXJ
	 9QSu1GnNOnMRtRxAGHqEBTcMkh+P6mIVl/zP7i02imOZ91nn6zsILbORdcJSGqWO29WIb
	 3YkzIGjX9F914Uantr6gKFFlK4hGK7laYOHDEDn7x455AFVI1BATjHdOsvY3PLhrww1v8
	 Drh7mDuXd/WgilonxZ9M9F04hF6IY04HUIBrned7KktWopDzov2rcsfT9ZP76XCwpQaG9
	 HUg2/S6hPcxFUVSWm2WrSXqJ1SOfwjF4qS3RkC+4Gk/nZBa4h3LIm3434X9ijGFRJ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656897;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=IYczWvl6oIr7RkPhLLIZzCriAlP0enKRmAOobHZGLwI=;
	b=IwjvAeRrEUl2Lo2eVnRC4DwR3VpC9GonQFZzbRXXDCMXokHd4QhNI298r3ai0fUXTPA0
	 hOPobP3ZpRlgLrn0zY9alVPGDP87lp68VheitCfl1+ilAX1foayYcOqc146fEPtGkgQvP
	 eYnyL+dQqNS39R4RL9lQ01egrIybS8WoUn2FwESWP7jwbjeZBXo1vKPQR1GD1T0YRLXtr
	 LC2XlUGYL2X3o1d7HfZ2e1RQKHbQw3NWJ77hwxTU1asUuF+TDRT8FUmgh46ltVnWrzPeS
	 os/9BndhXkSwWWsptcVwJK8YqjSRuB8SyCArXTtSl3kMH3GdAIQhs1Jvm7qWts4TOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iMrntu/b";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B23606A31A;
	Thu, 22 Oct 2026 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMrntu/b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE0F1F000C2;
	Thu, 22 Oct 2026 08:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792656896;
	bh=IYczWvl6oIr7RkPhLLIZzCriAlP0enKRmAOobHZGLwI=;
	h=From:To:Cc:Subject:Date;
	b=iMrntu/b7Ek7iou2YWIQJd2eI7WGgCqbEjxXXzLZyGB+4PqeDnTUo15bOq0z56RK8
	 gFn6sVKinVzq7O2JvN1GopBuYI7x+l9ko0vhpbmsbiiHSARoMmk5lWl2Xt8vWHOuoq
	 e4Aig/fQ5aZiQeo+ACRSOTX6ATQh5Fp82aYJgG6E72dvXYKynJxgg8/NrP3O0fnJwq
	 KsHaEFjF/Koc3TPIqtmeTi+lgvJ0Scu2q2all7mNijdD3p96WZ7RLGkzzjAU+6/xZp
	 nzqz0lgBizKltnycfnaIzLFvERCnThB9yyEHe8nLlYHTKAK8QTcTwNA5Qvezuf4rip
	 EMaRE8NLvGSRw==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ac97: Use snprintf() in snd_ac97_get_name()
Date: Thu, 22 Oct 2026 10:14:36 +0200
Message-ID: <20261022081437.1029-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=blum@kernel.org; h=from:subject; bh=2hi15XuMBzgMyq0G+d7wN1+oJfd7CxSvka8qaw0qm8U=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk3j76dpnhzx5r7j5If5FqK2izhbd/c8MZq8pZ5Wy//e blRpCbqa0cpC4MYF4OsmCLLg1k/ZviW1lRuMonYCTOHlQlkCAMXpwBMRDuN4X/26svtt2y0c07f fvn5FptDxYGqD2rmLgldL0oby9/4mR1nZPjgq746+VdKpa8Wb0Bc7Ib9c2RlP2h89D8+85x8nnp 6Gx8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

To prepare for removing strlcat() from the kernel [1], use snprintf() to
append the codec name and the optional revision. Also use snprintf() for
the unknown vendor fallback.

Fix some formatting while at it.

No functional change.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/pci/ac97/ac97_codec.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 0bb65be021d9..73deee7061a1 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -1832,36 +1832,39 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
 		       size_t maxlen, int modem)
 {
 	const struct ac97_codec_id *pid;
+	size_t len;
 
-	sprintf(name, "0x%x %c%c%c", id,
-		printable(id >> 24),
-		printable(id >> 16),
-		printable(id >> 8));
 	pid = look_for_codec_id(snd_ac97_codec_id_vendors, id);
-	if (! pid)
+	if (!pid) {
+		snprintf(name, maxlen, "0x%x %c%c%c", id,
+			 printable(id >> 24),
+			 printable(id >> 16),
+			 printable(id >> 8));
 		return;
+	}
 
 	strscpy(name, pid->name, maxlen);
 	if (ac97 && pid->patch) {
 		if ((modem && (pid->flags & AC97_MODEM_PATCH)) ||
-		    (! modem && ! (pid->flags & AC97_MODEM_PATCH)))
+		    (!modem && !(pid->flags & AC97_MODEM_PATCH)))
 			pid->patch(ac97);
-	} 
+	}
 
+	len = strnlen(name, maxlen);
 	pid = look_for_codec_id(snd_ac97_codec_ids, id);
 	if (pid) {
-		strlcat(name, " ", maxlen);
-		strlcat(name, pid->name, maxlen);
 		if (pid->mask != 0xffffffff)
-			sprintf(name + strlen(name), " rev %u", id & ~pid->mask);
+			snprintf(name + len, maxlen - len, " %s rev %u",
+				 pid->name, id & ~pid->mask);
+		else
+			snprintf(name + len, maxlen - len, " %s", pid->name);
 		if (ac97 && pid->patch) {
 			if ((modem && (pid->flags & AC97_MODEM_PATCH)) ||
-			    (! modem && ! (pid->flags & AC97_MODEM_PATCH)))
+			    (!modem && !(pid->flags & AC97_MODEM_PATCH)))
 				pid->patch(ac97);
 		}
 	} else {
-		int l = strlen(name);
-		snprintf(name + l, maxlen - l, " id %x", id & 0xff);
+		snprintf(name + len, maxlen - len, " id %x", id & 0xff);
 	}
 }
 
