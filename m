Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036694;
	b=L++gHq6KWIKTMROA8AoXlm20F4Nb5t1pOcn8GUwfl9Ocfk6lAGDQeHi8rYTAFDrfVM9g
	 eunOyWOknDELKWgbDgub+BZYSoIJ7yqT9eliZS57WXwbaPHp9f6jROvsigHqwH1ztXlb5
	 ESmdkwLal+PqqVpFFv4Vtm/rPXjCzurmfF5tymsHyhx5YxaScsNaXQLurLQuhDgXSZv/g
	 kc488ud9Y1D7X4ySHZ61W/650QE4K5NqKqapA3Z0ZgT3R4zZ+x+TKZ4NpSWB7hPxTp1AB
	 hB3qraEcspVLt7UhvBpVWmdjpwN4GwwyZxIGAe/hJqsHtdXR/BlLocsR5ZK9a1MMX8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036694;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=lDrHK5QaoplzudeXnJ9vo3JcZarsVq65+aXvzEJW1n8=;
	b=mGuBndR/2KVPLqBEIkXtMltbt83Y5WIY2edNdccBErPCrJjCQCBXzeWlQVtp3C+ygvsq
	 cMy9x6MBTBpf1XaZuYfJwB/Z/839U7pIDa2ZXmz4Reb7tVrYsfExVUtaSf59+ondoaPn8
	 mJsl77M5x0AeOLvtgAopSeT8LHIU9c7JHyNTfi9KGTpjQcnRE8zBye3wkP7Inn4rcDXbz
	 RyvsCTvhDrcFN0lIruYagD1MRsbu9BvO8YNMx05Oj6QLwuPnXzTLp6M0pCc3sRYPHwa1M
	 969Z6ERrConvaULvu8IT6qG/WqdruSHTu0dwqG0kaiXq/Y6fAbOstMcr01/455Wpllw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=C1Yk2rNC;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C6E606A31D;
	Mon, 26 Oct 2026 17:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=C1Yk2rNC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793036674; x=1793641474; i=arc@gmx.li;
	bh=lDrHK5QaoplzudeXnJ9vo3JcZarsVq65+aXvzEJW1n8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=C1Yk2rNCRq84tYpfZOnJa+WHJDCbPsMyzDy4YtfBfr1ofRT6Wl9YwS67ykTBXMPI
	 8VnI6bXFH4o/tQ+9vNbSfXN3MZu5LqWev5h4yVB2/7Rk+XggOlb/Q9rW1EvJ7naNP
	 G5TjOpU3Gy91Q2RF3bj8663BvbTcUi/cmJr4Fjira8/00xynaHnXL0DCZITN0zRqX
	 LXe6hqzt67TeJGnZ3PE3qYlmHsMaVHaQY/O53dO5yhtxUjDQ5Rcx91SlET9z6vFXn
	 rutxnAC/khHyRy7bN8McqaJ2VbM5DnVfNHZWUls1u//nZYnnqKzUXmB6u6xFxHFP1
	 GO4JiV4LVPQfweThNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1wycyI41MR-00Oqnd; Mon, 26
 Oct 2026 18:44:34 +0100
From: Christian Ruppert <arc@gmx.li>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: arc@gmx.li,
	mrwillporter@gmail.com
Subject: [PATCH 2/4] ALSA: mixer_evo: Add missing snd_usb_lock calls
Date: Mon, 26 Oct 2026 18:44:24 +0100
Message-ID: <20261026174427.24947-3-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026174427.24947-1-arc@gmx.li>
References: <20261026174427.24947-1-arc@gmx.li>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8j7Zcj2mTbUG8X+7dYt/23WRZ1dVNpPqUOwhGLjncvbBUrR+m3U
 qcJHnE9Ik0F6QWpHvo1m2rxZxHqEItM+f8vafA67jJhwCQaEkxYstz1hDhszYXpoN5CHB4F
 z8nEvHf0pJI2/bQr6K928Et5qr+oFkvq+Yaob1HN2963MFBkZ2uZ6Es3p+nk21zcLq7fsxo
 5KKyl6382clnGtJt8A1Fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:no8ZDFC3i4A=;4Blua2EuLyoDAXEWif6CwmfX8fT
 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

Bugfix: Add missing snd_usb_lock_shutdown calls to mixer_evo.c.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_evo.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_evo.c
index 26846108a3e1..1fbcbe61b708 100644
=2D-- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_evo.c
@@ -275,6 +275,10 @@ static int snd_ctl_evo_boolean_get(struct snd_kcontro=
l *kctl,
=20
 	int i;
=20
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
 	for (i =3D 0; i < hwchan; i++) {
 		u32 buf;
 		int ret;
@@ -312,6 +316,10 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontro=
l *kctl,
 	int changed =3D 0;
 	int i;
=20
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
 	for (i =3D 0; i < hwchan; i++) {
 		u32 rbuf;
 		u32 buf =3D cpu_to_le32(ctl_val->value.integer.value[i] ? 1 : 0);
@@ -352,6 +360,10 @@ static int snd_ctl_evo_integer_get(struct snd_kcontro=
l *kctl,
=20
 	int i;
=20
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
 	for (i =3D 0; i < hwchan; i++) {
 		u16 buf;
 		s16 val;
@@ -386,6 +398,10 @@ static int snd_ctl_evo_integer_set(struct snd_kcontro=
l *kctl,
 	int changed =3D 0;
 	int i;
=20
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
 	for (i =3D 0; i < hwchan; i++) {
 		s16 rbuf;
 		s16 buf =3D cpu_to_le16(ctl_val->value.integer.value[i]);
=2D-=20
2.56.0

