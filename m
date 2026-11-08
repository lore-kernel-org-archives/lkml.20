Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145581;
	b=AVzhDHdydU/9QvJccbSCvZMp+ennAUY86X+N6DcA/bfn9tZ5uGLHT5prMyvM8uNslNsu
	 DCAW9HoTbg7p6QhE1dhI+tt9Kl12HMUqroSlhUpAPBN8c263ZD5mxDsAnEEdhBl0J5Bup
	 6J3aXiOJyBECYnz6E6ZLSp12ykba2i3jq3QGWb4kS/1cbM7LwW8UxeydrdAsZgT8p7lgG
	 b2j0QKli+PO+CQI5/5dPISJabaaXEtMeBdttybH+2DCbodt5qvTHqsPJ2kpYEKhQbI5xW
	 i3d5A/oLYVKVWLJMoT53vaxSbrAOuW1i48n4zEd1WhxGDLR+v3UD0d03as5v3OVmg3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145581;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=O3/VjpsT3j+gzFeQSixRzH0RuopYSoSSLufZz9nn3zs=;
	b=PrGeL/NmdA0MmJGJ6QsBVtVials9OutqqJnwAn8+/0QQWiG1GSmK9qqMxn/I1ZRt1Fls
	 7Eu/IGGAkEGLA54f5a1rGOd4cLSaPR82TAcFU8RdCiWua4RfAnALcx6f11hmrd7iqElFJ
	 PGEMyUlfxfryXlWppLPVtDTTUtUPWCDLUwUc3rqI6Ni24F2UY7y4zAAyy+n2Bt2d4zMjR
	 5MD54AfpkpxugYE4Cx38uH8TYFu3PIYCz4BTNBWpFu6x8QpTBNle8zjIc8LjyN2h3WXCG
	 mkLCCzmH6UqVDa7ss/JGMPynlHikNbjcznxnJ49ibntelHogGUcFl1c+Ycq26rP80gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aaxIkK1j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48DB606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aaxIkK1j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8791F008A1;
	Sun,  8 Nov 2026 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145580;
	bh=O3/VjpsT3j+gzFeQSixRzH0RuopYSoSSLufZz9nn3zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aaxIkK1j/cwCd52vc/W6DgdqsQoIXSlKeIOrmy7nFhABUPf9MbP7KJLUxePR3dJpq
	 hMgAW33c8BCF5TTi/feaPGIGzd/dFNa1VsrAk2ydDjASVqKKejJvIxm7tXTXn3yuX5
	 oOF0oH1jfoMVnYllP3BaoZnytzoma46z3nSj6ar1JZ7wAe7L2j8hx9NIjTya48uB77
	 kdUHP2sMaZmd5Dk+R0ULp+DLOfjmD/JqB3ZIQfro12fokj8Zik6U5L7mwbTwidqjcW
	 wQ4l3qbcdCChPPFbmujEsL1MXI8OyzWq+pdzk9U2O1jhHaLqshsp7lhoes5pobVpUv
	 kFCCMgrcNCRzA==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] m68k: amiga: Use clamp() in amiga_mksound()
Date: Sun,  8 Nov 2026 14:45:01 +0100
Message-ID: <20261108134501.404852-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108134501.404852-3-blum@kernel.org>
References: <20261108134501.404852-3-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=blum@kernel.org; h=from:subject; bh=/Q6qQpNq1Yh96WuHApb6gUa/Ly37IdV3WPRCtp4ZhJk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfapkn/lRr1p/QvjT0pizrc+sfOxj0G1smyx+09DVdr LXe9tfKjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIRRsjw/aJmm5P6hcfkpS+ atnq1cV3dmHsiuVGZdW5Fz/y7HA4z8Xwz+DFbq3Hvcl7nFOWfrrwLNBIz6v068ODO/jnnkxQd05 4ywwA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the open-coded period bounds checks with clamp() and remove the
redundant comment.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/amiga/amisound.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
index 5ae1f017b39b..5b9d265b2cac 100644
--- a/arch/m68k/amiga/amisound.c
+++ b/arch/m68k/amiga/amisound.c
@@ -12,6 +12,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/string.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 
 #include <asm/amigahw.h>
@@ -81,17 +82,10 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
 	timer_delete(&sound_timer);
 
 	if (hz > 20 && hz < 32767) {
-		unsigned long period = (clock_constant / hz);
-
-		if (period < amiga_audio_min_period)
-			period = amiga_audio_min_period;
-		if (period > MAX_PERIOD)
-			period = MAX_PERIOD;
-
-		/* setup pointer to data, period, length and volume */
 		custom.aud[2].audlc = snd_data;
 		custom.aud[2].audlen = sizeof(sine_data)/2;
-		custom.aud[2].audper = (unsigned short)period;
+		custom.aud[2].audper = clamp(clock_constant / hz,
+					     amiga_audio_min_period, MAX_PERIOD);
 		custom.aud[2].audvol = 32; /* 50% of maxvol */
 
 		if (ticks) {
