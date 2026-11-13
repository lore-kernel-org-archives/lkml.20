Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552411;
	b=weBCEkUk83U/nnl/23Qi9wUjDt8NOJBkl49mqRuiogqlX3hQAJ3zPOmhjSyZ5ymo8P/Y
	 Nw8swX6QzyEzivOrEt57XYsVeBdHyuEKCI9Y5smt4sUx9JZVAjsN2k94kYxoV8VrPaapI
	 NRHbgABWtwTEp3MzZavLGyLNNhLUYCUs04C2nBNE7/ZtVV5Zy1Q+KXqqJ0RPpHoW4zc2Q
	 iRRwfX6v0iNxjsHKm858c49o3ABJXvjKD4DUvwtuiNd1Y0GW892UuTH7FR9asnBcYsNtb
	 lnxYuw1I8hFyCgvJYGPvqOML5eznTio42wOHnQetJ7NU+iz0ckoQh+T2uGYGm/9RcBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GTUBLPeqm9O6jPD8kLy/taX+gmnNGDm5WEYH9XnBy0M=;
	b=uTndVoXdGsEpeWpqUwhuYrJfWco6nTzeHUy6DBlrbWYdQrtUbRUDOH+FiE5s7tnVO/vL
	 Kg8zJXu0kxiwK2/JXRaO0ab8LQ/Uga3Lv+nIdjCgqbfoRDkGSwTxK0b0lTWxRyi09VGGR
	 LZ7dUogjiPWE6cwHcOTrWl92PCJLAk99TsEdKnsITTg2G8xJ0DXIZcGzPwp9DKI6LdrPb
	 m4CqW2j+y87jh2KhHB9anYNN3GP0ljKqm5K+oNgGhdqQCf9O5PXbyBBEjZ5J9ptdTF4+R
	 hMfpnrqtovUIbySLhKuBuskRdAMV85G3K3fiOqi2O8RL30NqdDDh7flgDQJ7IQ3s6IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WT++/oA0";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7D1606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7D1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WT++/oA0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so3919125e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552409; x=1795157209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GTUBLPeqm9O6jPD8kLy/taX+gmnNGDm5WEYH9XnBy0M=;
        b=WT++/oA0vxnctUW92478QUirej1tXwpX3z2mO4oGFC/lk9QdCKVL71ewazttEdstdz
         DisQtY+tSVq39VuVseV9i591FItGuFQnWR3ojwY2xN75+WB88fReanrjvTcQ4F46Qj3B
         MKgyloNwwjBAILm6KqWQoNSEgobuhfegs+Kf0tr/V5gFiP8RtSKLtMjEmvFlJRqodZW5
         81Lz4Qjt8Rn4WizeCeHOtlnb0ZYjUmi3LBx/AojsSkjP8oW6Iu4nb7LyZClpt8WGvIYA
         0fFSKBtVJaDAcc1wgz/6p1oV4gL5s8b0sDXuQDPocJ0QHJasrBq8ZtM937YMlYHrklFb
         BtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552409; x=1795157209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTUBLPeqm9O6jPD8kLy/taX+gmnNGDm5WEYH9XnBy0M=;
        b=OnujDA3Wn4mtwr/rBEp1jwmujLwaVfWucRVelj1P7cxDtr62Ew8UyDpymj5QvGIx1+
         KAmLDwywTaX99VX9hvRknT+dbVovC2vJJnuTrubq/8tynnYyXMuiFhnHghAqNDX/h6kh
         X2ycP5NJ/xaylhB/ob93BFtBbjgSCWn4YGN1IlgmOqc83A4aEE6hcik6iAPnPxDlnTZZ
         zq1C0Ev3e7ZbjVfIIwPKa4y3lgPbYOE6B9mLgMi+nRMvECWE1fN31Pv3HrV8sxfXQ0kc
         gu7QOtgB1hgxaC1t5lgvx/V4Eum05ZD1blPSukos0ngavjvBHiVC2jym/xebuk3nR+lh
         n39w==
X-Forwarded-Encrypted: i=1; AL+hErGpLu48FGT0lQfcd7zhuR9GzAoy+BH6xKlriPQm/1NzzttRoled68tWlq0ILPd7kXE2d77jpu/p8CePlC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/STG343+fwgQBgCCnHqTrFoAccuFZ+rl3/P7qFwc5nYuhFplAj
	aNZsiJfyzAeCzQRfv9C7D0hC7TIjDkPTWsNwmxyAmo71fMCJHDqmdCm+
X-Gm-Gg: AYBFou3LLpQhjFdWNEP8hQOtG5Iiu+sHO8nJABgTEsG0oSfWz/GX8GHGsK7AvWMKiRb
	1qf0Vw1JXF38mNje5yby4Gx2tShBRehJ5NdkSiaHPGxH9LyRMiQ2Jp1REwFbNjYVsQ26spJy4E+
	5/pR47VhDe0lRADGopk//FrbK+7ppui1ttp1FVuzRBsSYnhoaOXSJh29u6086FqYVYQvujKd7jJ
	91pamfbPvWBurr0D9WXsaGRrB8G1GquLK6kVO5+KDGrsH/fgIs+G9lIEqfNkaC7wPDCQ/v9Mfii
	yteSlFDaKEocPCqeY/VZvWuBG9nPgViE8HDtkvlDZlJFKxbp6Bb6hFWOs3ByBIVVSALgzGpaZnr
	8fFiOUiwU3V0IJ+2/qx7TUFOb9vNehZa1PlKoMY301ayprVEULwAo/EW8x2zOGZU2RhAEibAmes
	kV07aE9goinBNzrTRbZ80sIchKm9YnMc5IDwZgNab18EAEO9NwGt8W9ovKmNFLgbWYRwK2JKacX
	J+NousOd7mqwrQJ5UTfIxSVYGLPaeWnaIT3DqH6iikWFUUs6W2L76GMN5Zvtq1qTLYjRo7W0Gjy
	Z2xshPeHtIGXBW/l66mr9wxZD5zYZOAw+Q==
X-Received: by 2002:a05:600c:548b:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4bb55ab07c6mr30002985e9.35.1794552408980;
        Thu, 12 Nov 2026 22:46:48 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm136496525e9.2.2026.11.12.22.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:46:48 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ALSA: aw2-alsa: select SND_PCM
Date: Fri, 13 Nov 2026 07:46:14 +0100
Message-ID: <20261113064614.15045-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Several stanzas in sound/pci/Kconfig select SND_PCM.
SND_AW2 selects nothing at all.

aw2-alsa calls snd_pcm_new, which sound/core/pcm.c provides under SND_PCM.

  aw2-alsa.c:(.text+0x554): undefined reference to `snd_pcm_new'

4 symbols are undefined in all.

The driver can be built into vmlinux while SND_PCM is a module, in which
case the symbols are not there at link time.

Select rather than depend on: SND_PCM has no prompt of its own and is only
ever enabled by a select, so a depends on would leave SND_AW2
unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_AW2=y and CONFIG_SND_PCM=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 98f2a97f207a ("[ALSA] Emagic Audiowerk 2 ALSA driver.")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/pci/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 6366f72b3667..9c192d51ff44 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -141,6 +141,7 @@ config SND_AU8830
 
 config SND_AW2
 	tristate "Emagic Audiowerk 2"
+	select SND_PCM
 	help
 	  Say Y here to include support for Emagic Audiowerk 2 soundcards.
 
-- 
2.43.0

