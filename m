Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491254;
	b=ywUnjXx4T8g4UHH/sK7cmubM3MVFvh/NK/YmOjzogP0tU5IGVQlkouGLi0/WaxuMNCCr
	 GZrxJZvmz5DE6GzTw1rmuhmnrS6/619vUioB9BsytAJLKAEJdHSWecX1osO4zQjR2LzNL
	 PQyzfSZf0vzZCq+LOozw6dXJ6bldLfFgSXvld+QZGK3MuGjuuj996bc3XKMaPISBQktY9
	 oxw+zAOyi9JVt3TqcExKctncuMYjMZJ/yZWqBAJBgFSgaSAuMVJazZKBkQZMFL0jLUB3n
	 DEokmqn9QdQJQDLMQkHailhc3Df8FykAnOzsGEedH6B1vUc6B8SugQxXN2JXO0k7lQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491254;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=vsRQPC69/CsHGZuyxWtrZHDoeWANs9z0NsnFvRH1ugQ=;
	b=RneusuSHO+RM2ORsH644KIA3PtmPtCBCAILgRDJ5cTRLJIHZiTrAUtdMsjXRCBS4jbLU
	 ty6q9RW34qJwvEKWfPfiNeBfQm9x6ztF2YXPUklR+BCT6jKuLOrYN1Z4QDVYBpybXtWun
	 YaN4Tlyk13Aw/HX+AhjPDiDG9x3j2DMTZfu5hDoxzaDV90u6kEk2hPr3Q0JXl5YemGk1Z
	 sMYXbExOXy1vkHapmz70LSx/p4ltuZagIwBTdDl0NwGcXrfnlNQW2HsNmh9JQcTzzbKRK
	 YBL6No3nOScasfPEWBotXBhxW/mubBTk5LF3DDJyJh9fa83h60Vy7KPjIWknCyxwP8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="NWojRt/P";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208B2606A338;
	Sun,  1 Nov 2026 00:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208B2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=NWojRt/P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491247; x=1794096047; i=arc@gmx.li;
	bh=vsRQPC69/CsHGZuyxWtrZHDoeWANs9z0NsnFvRH1ugQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NWojRt/Prj3Bi/dKmjfHe1UKdMfH2FYF9MPTwIUtsZNdkY3qmztsMNSy2jyFeeX3
	 s6NPCXhL+2V6m2725O2/qsY3tx0phbJJFBa9pMLs8Z812kr75qYeLIEi9/mzs1ihB
	 bt2wGw+4LNHLR+pEq6z3ImUUhvs69HFh9Dj6we5PtG249LJz6FmKdsV2jyE51+IhL
	 nfrGUbh+u2gPxBOUow0PfFcAinIHpwitPXG1mSjpfPH5szAIbolSNusJK5XFT6YYW
	 vf6leZjYkya4C9O9lGbtsuZp7hUc2g7/cPuOTcbOxkVTlKDvVce0euuQz30eLuLiW
	 AizfdYl3ZMWFDiHQ7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFzx-1xDiby17Kv-00G21I; Sun, 01
 Nov 2026 01:00:47 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 08/11] ALSA: mixer_audient: Add control initialization at probe
Date: Sun,  1 Nov 2026 01:00:10 +0100
Message-ID: <20261101000013.11880-9-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101000013.11880-1-arc@gmx.li>
References: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
 <20261101000013.11880-1-arc@gmx.li>
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
X-Provags-ID: V03:K1:niELuyvQgs3EZVvqJR/tgj9QTH+zX9y0kGCFVCaC10xCuGv5uBo
 pCCnhwMDBkHhFI3hRmvby8Em0HYOFfy+pHTvBw8P2b8Q2RPPbUUJa2c82xrYq54gfgapjpf
 7/G4Qm7wnPoaHoezUqu7DnEV1/Dwj3KaNQHMVvwcxFEQBh8z4d3M25fKHh0axglifK3NnfC
 5Bb5Ey7pnIPdJiBIHSpxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t9U5u2qZmjg=;VUI/7Fh0MvFwDphXKnlSoiSrcBJ
 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

Add the possibility to initialize certain control types to known values at
probe time. This is particularly useful for controls which initially read
wrong values and for controls which cannot be read at all.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 2f1b332859c9..803487ced997 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -36,6 +36,7 @@ enum snd_audient_type {
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 60=
0);
=20
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		(1L <<  0)
+#define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		(1L <<  1)
=20
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -47,6 +48,7 @@ static const struct snd_audient_ctrl_type {
 	union {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
+	u32 init;
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -532,6 +534,18 @@ static int snd_audient_add_ctrl(struct usb_mixer_inte=
rface *mixer,
 		return -EINVAL;
 	}
=20
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
+		int i;
+
+		for (i =3D 0; i < ctrl->hwchannels; i++) {
+			int ret =3D snd_audient_raw_set_one(mixer, ctype,
+							  ctrl->val_offs + i,
+							  ctype->init);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	elem =3D kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
=2D-=20
2.56.0

