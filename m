Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450939;
	b=KWUJnTWQaOxdy8eBe40aQ9nNGIi/H3YKEyAf95mxclvV9Oc6j2/s4rq8CsGlWzgRXifz
	 cxx+AwarOTpWG+vQYRt+PkDoqrSbXFMztK9zujvyemkUql8dboZZq3zFVKTo48om3x7nD
	 kHnqzLUEGBzn2u7tPDYNx5723w845vhAKV2yDnsaP7LMXIm8L7xVHcJesw6XPOV8r5fwE
	 C/RcoEBEpFtznfHqznGyFDilFaPLzwnpSPzsZDOGKQ44OXSf5bkj41QpASnITZn8x5PSW
	 3bJawn+Gvau/uny0jQoQtbOTY1kwcVGp9DgU5D/8r/kSeH5Ih2Zum0QuZnlXSmJl1tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKrau+m/5d9h8RdCs67qnCHLNnbCAHUHutvRJ47H+Y0=;
	b=CC6ZI0AhmojkzlaYGJs8J8jr13CZyYXucX2aC+1DHBDiB6liY+vj5ntmyiRisiR88/nH
	 AewYLn1rF0hIVnYf7nYv2/Ao1vQeWQTFMwOBJ3/xT3FwWnHWHWqSjmUxzz4139UgIVpM8
	 L2YGrC4BPrZ/XFvurOnc+e9P/4hYgh9LgXpeKBfzQbEdlgPLThAXMPvnvBAdbn4FdMV0o
	 I5neeBJtOQYvVMohUIl8Pm+4GSqgYZHym0Ws/kqjnIpZz2Jj73VNKzkQUKPO4okWmg3dO
	 Q4aDzg1bSj2MBXCme6pe7tICWcvHsIFcilZ/aQ5zFw0Q4XpxktejNteGcEgYfT3lnfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W0of8x6F;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4CF606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4CF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W0of8x6F
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-48eee44b908so1405311fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450937; x=1793055737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKrau+m/5d9h8RdCs67qnCHLNnbCAHUHutvRJ47H+Y0=;
        b=W0of8x6F8u/SNC/BAQb1Z320Wq4Igi2MWnorfjfmBwYL0YTiDpQpBPGwZvrQipoFJH
         FHNfsFoLfiy3UKH2naa9g01bL5+VianZ1v+81r5Lftbtx8CydJO8nyViz34TwbBF4zaG
         +yH2BDdp5k5Q78OcIk2/giDL2eDcePLSKb8aahidpHnDS/MZffjDqZC0CY5cD4mooZ/m
         0JzNgjCe9pd91pDFKSErzg3wOxT9w0nTerBx/XGWLChM6I4dS4Hk3zJ5SREIGMm9TQhy
         ExRYuFA1F9ZlqVrEj8hs3Volh1pt29mobFt91MhpbJ6XTqV9agEHkEqDZrfKhPvlhaFZ
         5Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450937; x=1793055737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKrau+m/5d9h8RdCs67qnCHLNnbCAHUHutvRJ47H+Y0=;
        b=l8Ueq0vAm5wXj7ow37qe0GlBn2v8FFp6kaccgVBmYqbKjpXoCMKV1oJh2aMBacGvJK
         qmDsqeO3zwR3MZt3559pAA/yOENJuDn8EIKJqJsbxQAauirEB05y9ONJ1RGJvnJ8ZMal
         eNuV990WxNA02In0pBuCLd7/J7PBdbKnqWFKH5RsHqNpBrafdP5axJKb+Px6Rj23lD39
         kE8C2STgYv+kUcvEBu7RkkIkqWlBQ/t+iyfuww5fg7P8MRJgie4C2Zh7WcaY8L1Kwr7P
         AkeV01SQ72TmKHmPCq4e15JLPHQ02vZI8R2XFwz/AzbJ98BF2LcnKXgn/DxM7rij+yJB
         wyYw==
X-Forwarded-Encrypted: i=1; AKwUvBxREbR4jn5a1y9KPDlaoNmDhBLw9CUoo6ZFRRrbOl7hJzhmJey/7otcjiiJeYvUAe6EfUb2jhERMfmvKHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMqwHv/JSNGxQ+HxEVHyPLqvSs16tSSsFucJ1Og3rSCluvI1P8
	A5nQzEAtbatxdBWdLHZ4zLf8WP2qMezRFTDvMeJGym7DpbqNsTS00u+w
X-Gm-Gg: AYBFou1vqCJxf9u1kqdT23eDtaIXznyP44ohjcoqLlbT47wpULoYlZwMn61POETaedA
	Ln6DsQOg64SqUsibtVaYzxNJeN+YT2k5bF/KjPSdnxIUARCOLUlDTefWpmptazyjvdaNeiy4Uvg
	uDAZ8ybRVKUp68mQXB8/HzXOswytouIedgFsUDxKESd+NOBItDWPP47w2QT91652HN0UZE1A4zH
	ABnwHN0x65Kpm5Bv16meLPzITV8Nxo6gLyFWDXu1aXNWwAt4c/oYeSrGhK1jLCHx29z4/QnNsim
	8KRF33vvvtaMb9C2MhNQt/qmiegZI4G1S+iymXKqh3bW1q9A7dSZslM7k74fHPUGMpSLhQBbGf+
	RUMF5uNtFdK3pU9StdK5oD93xIdDw2GGpmg+pwmhJ8XJG4Jmb40tTlD9kReWwQ+dOimvX3loqQC
	g48zjpZ7+NeUPrL6KkK+DarRIaFaXt1680n9EUhGmoS1OBOtJM4hhkUuiBQl2A53cjTz4jJJbmR
	HT5xY/AHFkuEn0=
X-Received: by 2002:a05:6870:7386:10b0:4a7:6c8a:f47f with SMTP id 586e51a60fabf-4a76c8b0f0emr3569956fac.37.1792450937520;
        Mon, 19 Oct 2026 16:02:17 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:15 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 1/5] ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
Date: Mon, 19 Oct 2026 18:01:55 -0500
Message-ID: <20261019230159.834954-2-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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

The iD14 MkI (2708:0002) and MkII (2708:0008) share audient_id14_map.
Later commits add MkI vendor controls that replace some of the generic
MkI controls. The MkII keeps the generic controls. Give the MkI its own
copy of the map.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_maps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 98b414621..7795a5fbe 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -526,6 +526,12 @@ static const struct usbmix_name_map audient_id14_map[] = {
 	{}
 };
 
+/* Audient iD14 MkI: model-specific control map. */
+static const struct usbmix_name_map audient_id14_mk1_map[] = {
+	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{}
+};
+
 /*
  * Audient iD24: feature unit 12 ("Speaker Playback Volume") sits in the
  * monitor-mixer branch and does not apply volume to all of its channels;
@@ -638,7 +644,7 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{
 		/* Audient iD14 MkI */
 		.id = USB_ID(0x2708, 0x0002),
-		.map = audient_id14_map,
+		.map = audient_id14_mk1_map,
 	},
 	{
 		/* Audient EVO4 MkI */
-- 
2.47.3

