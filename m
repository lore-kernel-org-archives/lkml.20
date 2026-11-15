Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779032;
	b=t+5iDhBVe9WsVIJCpuuOaq1ujLjhMcQsRTx5BXtqP82s3ysyCbkJZFUY4Vfq3z6FEIMb
	 KZ0/E/swv0RBzbW5vyv7UkP0Hs/36FlYMQH0ESRWP5wOoJByt29VjQwpOfWXOw1D9jHvy
	 ENZR2f3/gOsRapy2+MxOeQ90Ms9kJhpCZDdEqvoDGmcTtXTe3dKRxBJdj82oQnceFW7Vh
	 JOCkE4dDJnG7xcmgez++f/pdEZYz5lUYgCbllC6xtTQbjZMsFJfmIPSVs02pdLAsqZ0sO
	 l1TRrv6lX88AwZoMQQF5tF8Os08NiZdf/SFauVRVmB1HB84pvW3y+DuHzvriSTLn4lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779032;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=E0sK6KyUgLl7lY2XpancaXOmArx1nkDYsav5D2j0pPs=;
	b=0S66bMS8ciWMEWU2tRX4NvKlW/EESjuW+8ZrIAuCjRpwJvv3UTnmnS+ECcZyCjcX/vWO
	 10eHUMWvQWdrNIs3mx9wYnF0dZ16M6GlZBf5MTRBRBygFmFXmPGIvRjExfIBo2+IUI8Of
	 1O6ZlQQ6ox2sq1jz4R/jdp/ZfqEBisFbNEvPMi7mwY+tDmvobRM/pQuL8D0Jp32lRfG4S
	 HMZ+6xD3zZbXm+JK0EhpLAYWap7uQJGCv1D84u0IdrKBhWMTE1QYxfESwrRI/dUo7tjc4
	 y45kqjP4kO6CLLsX7xGQ784Yw8gt1DgTxW4msXwrprhz3v5Ya0lrmgSaSF7l0r6Oy5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="A/QrgDHi";
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668860A2604
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D668860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=A/QrgDHi
DKIM2-Signature:  i=1; m=1; t=1794779029;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:pNQJY14cwmcRcd39BCi8s9suy3PW
   XuMQebDonK/24/YTme5ikwgo4qE7Zrwv8zvFfIsdvP+hNPNsmIP9LhhNB8erplrHcDkLq/XaZUu
   zswsn6zvMydryAlEHy2Th5loW27IRg1ESnSD1lMg31Fb5pqEEMObbrk0bhSmhgXizItzy6GW8rB
   YIwY9+lG1dxs8/Mdq/uLBl4q3KWgowzFS88Cm2wokKzpdlbJRXWNZQ3SLpTmo3PqW/DFPS5L67g
   HMdeMjKePSwx6+A88fFPX/Ld8m7Sd9ssZi/ZRHrjWASGNqRfanWpT2z9suFuDcL1UyLF7a72mSP
   7ICJXGSmBP1zZg==;
Message-Instance:  m=1;
 h=sha256:
   3+oUTM++Q5b8wFoGk3jZXE0pjGm+VZKEhUTot8sGCPw=:
   PtmrAY2In86vE++x3eqNIeIdwgkvYTyihiIgldRd68o=,
  sha512:
   F9s18eo59qKCUJHg306PWRs8KZMcfUXuc+7ER23eduNrXbDnSn5kxdSbSeqJ35jm1lA8Mcsuzb5J2guzklZ9ig==:
   AcMHg5iqpVuHFuCn3OfFERFz1HUTY7fwLKE1nGrunXuo4HowvF3SFG3AiVFhXW+ukm4z2tpCi+TaDNKPk1HAVA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779028; x=1795383828; i=arc@gmx.li;
	bh=E0sK6KyUgLl7lY2XpancaXOmArx1nkDYsav5D2j0pPs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A/QrgDHiiytU3mgm1lbiJptLdNWuVDkibNlXAff7Hlav+1fYDSSQ3HRXojr4z2uO
	 dR+hCUx94mUY+OWlskJuGmqHpjLuPUE4noq/U5qWnBK3Ug9VGXBh3cH6Cr0wKzGFb
	 4Qzq+ar7cEjhkVZ19WiSXsR5Z2NUrj4IwVqjMpmOxgw9Y90Y5E7Mafg0LBKdMN5DT
	 fiGlr6GTN7PD9Ll1UbUSw6gsgr6gD9BhLUSAW24CAku402U2vBAgYnIa+1YOEgtIF
	 mnPLtNN8dC20EtEk2l8W2NcUUtzexISijvP513yby+9/JrRi5MIF/W6xVXrDYQ7Vh
	 PdZLCW/mDcMvpq1Wgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacSY-1wqu9h3TwY-00dLbS; Sun, 15
 Nov 2026 22:43:47 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 09/19] ALSA: mixer_audient: Add readback-free parameter set
Date: Sun, 15 Nov 2026 22:43:26 +0100
Message-ID: <20261115214336.17917-10-arc@gmx.li>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <20261112023720.1503814-1-mrwillporter@gmail.com>
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
X-Provags-ID: V03:K1:N9Svi4r9vKu3IjFdpbi7aYuMg/eN9Z2m4bSc/ZsbeUCoabSMSBy
 Xu+Iyv3/8scysyZinipred/IIT5D8QmUVs1W+IYHHXMnNr+UEeT6UtSTfpcJNcR6hR703HL
 k9oEJVDQHjrKANQKbian35q60ryS4Y0KJBgXslNLDXzsx2se9p0K2CaQzTPA65N/m35euG4
 6ivOW09zFHFYskarKc2Hg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1RKw5ng98Ac=;pnBDzqNXEBVR5chvhcyKxPLzjz6
 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
 BxbaaluXA==

Add a flag to systematically force parameter writing without prior readbac=
k
to certain control types. In preparation of the id14 driver.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 70ec3274a5e4..bdfcb7fcf531 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -39,6 +39,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_=
mixer, -12800, 600);
=20
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
+#define SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN	BIT(2)
=20
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -313,9 +314,13 @@ static int snd_audient_raw_set_one(struct usb_mixer_i=
nterface *const mixer,
 	int ret;
 	u32 val;
=20
-	ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &val);
-	if (ret < 0)
-		return ret;
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN) {
+		val =3D !value;		/* just make it different */
+	} else {
+		ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &val);
+		if (ret < 0)
+			return ret;
+	}
=20
 	if (val !=3D value) {
 		__le32 buf =3D cpu_to_le32(value);
=2D-=20
2.56.1

