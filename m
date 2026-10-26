Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036678;
	b=Y5UctZd5H9deW80Ibc+Ek0UrDFiwkLHTF1igRtJQ5r5qRIR+GXWrrHiA1SLPQkjMbfDQ
	 xvgKWosbL18er24fgSqj/gNAGTqsFrm6mZQqTaUjAkyNyOL+OVqSxb7vWSF1QcNVqlffe
	 YmIMkyyXt+F1QkFBAGAAXUxss6uXwZFQS5s4agp0IUpYg22fCtSmp3YEhWONaWtbk3udJ
	 C+yoqyxUvkJVym6ZjaaMlXtapdADb+I1Fs/vZ/cWSRrZcGWMRQAraSeoir2GsE9fwLlYM
	 5yA+Xxdry1oDSc8XHewGiyx1rg0VLwSZ7mGi6NOmrczsYCc04+wgbw3g0Nk8bB5rHQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036678;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=GdGgYbj/RItWhGEJWXMJwaiX8A/RyYPPkkk7kCLyL4s=;
	b=EthRaACOVQhtP05OKNQlFy/UTV8SdXcAThB4cVNxSzheWSF7oIfn568dQHPnjApRoaif
	 Ctkuzn3eadNycOgsFJqn8xRmP51bQkko7SfS41yRwvVImaCbrFuoVi7HEG8ybw5ur4x18
	 uLSBe6z80Q2w7HxI6WSWF6k9Zz8pzOmxOimTQsGna4gS8p2qFo+0Km+RMIn+PQmRquapp
	 zczbxQ80UUDeayDnNLD8FPo8MA8BHg9jdpJbHcd7EPpZ4KTe5Ahu+o7iIFS/97DoRTnxx
	 DViyYX9bnBsxAXx2gr5gAsKhU8TswP5/q6RXIXJLqx8q6o0ShrU9sexoyE1+bTInVeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qEpV3WS7;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3CA606A330;
	Mon, 26 Oct 2026 17:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C3CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qEpV3WS7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793036675; x=1793641475; i=arc@gmx.li;
	bh=GdGgYbj/RItWhGEJWXMJwaiX8A/RyYPPkkk7kCLyL4s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qEpV3WS70buMLv51PxX10OVUQtXTImJZsLShEccfl68P0FluzDEqTBQeIr/KLDFL
	 eS5bAxn0uPxsrjSEu0NznaTd/diiB797nxFQcL7BLX81Ww6qUyqN9qB/QzcO0Bkv4
	 howETkq2YXbLZN3aM3xqHkm542omQOZUTxtqdtdpamEUbfBpUOdLGzKDrG8h3w3YJ
	 ZuBVoOTHsOBvgQYqNBr6aq8IFBY0XOIBHPN0gotSF5QjatrJ2627+8DU5ghMBanhA
	 LQxJVT14p/LxbNnmKp3uxO4f/5oj5TuF5JE0+simEI/xh40Ce8WJTfZw9wdRTOEbw
	 d2CUAFNFR9IGQA+9cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2Jt-1whMyB3uW9-00fy8u; Mon, 26
 Oct 2026 18:44:35 +0100
From: Christian Ruppert <arc@gmx.li>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: arc@gmx.li,
	mrwillporter@gmail.com
Subject: [PATCH 3/4] ALSA: mixer_evo: Fix endianness of boolean inversion
Date: Mon, 26 Oct 2026 18:44:25 +0100
Message-ID: <20261026174427.24947-4-arc@gmx.li>
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
X-Provags-ID: V03:K1:LFiTN5W+qF5tRrquetxokg4DQiAtAa3JzkcBBK11PPnbCMJAyfk
 U9uWT3b4cZYDR3VVIvxLTndQw3CU6q0QKc4c9IkeSbWfE0UhpDSKGKSLRFvT+JIZKHDNBqK
 ePxlNMRJHUkVdcwGmS6b/8mdtYbvKneJwiULWbGEXnYel30zO0dWph2pUbxFLsozd68K5lh
 RpJU81D/wgza4/KiAV77Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:afmE4jQ/4BM=;qvVleOH8kiW6VDgvhd9S2x6giah
 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
 rSxxniXww==

Bugfix: The optional inversion in snd_ctl_evo_boolean_get was in the
wrong endianness domain (CPU).
Move it to LE domain to make it work on all machines.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_evo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_evo.c
index 1fbcbe61b708..867d083953ba 100644
=2D-- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_evo.c
@@ -326,7 +326,7 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol=
 *kctl,
 		int ret;
=20
 		if (ctype->invert)
-			buf ^=3D 0x1;
+			buf ^=3D cpu_to_le32(0x1);
=20
 		ret =3D snd_evo_get_cur(mixer, value + i, index,
 				      &rbuf, sizeof(rbuf));
=2D-=20
2.56.0

