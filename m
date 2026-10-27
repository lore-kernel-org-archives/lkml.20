Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097870;
	b=FqccOecP9vnZmX9pyMti6TGoPMRq+L4TN30nfZc9JVUcxvLuEO9th4T0OvfgbDy+N5LL
	 ZmcWFxS+1qWIKUna59eE7e0Uw363wAlAUfxPxoOB6/IktedyfSysc9dzcrMI3en7Rpb0j
	 hqqeBveP9g+v8ldLIWOX+8MR0K/lOmfcBR1Zo8KwleabIdmTqA7ijwRxVZ6XZnH84pYtH
	 OgiEQNTDu5u/13sx2HepfC3/0us3eshc+WHFMPqY6KS05cme+sL/1ZI2FADlOuhzSEA1O
	 IBVwuSvFHMPHU3os07fKVK6OrU0kGGQudV+SLBRDD/W1gj+/K2ETe4s1uHQnIDNyNLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lfF2Fhz8PNov0Sv4mkHLRYpaIAJtmVVrP/HsyAkwL3U=;
	b=FYrRUaPjTALukkAvXQN78Pv95vaLDK4lzaHVsiC6rFiyv/jkRRwlT8pxD4utCQgSPcjx
	 HwvQfoMBf3ZHS1AEmlWONussDCCS23yGFHAYRuNqbUgwTPmn9wJRfSfUOvcD5OqESauKu
	 k+AtESuBtF03KQLMQcrEqjtqLMyg9qqtXJSvAbB5JSCPRc6gbuNv9sRDEDhKbWTVuWTYq
	 Fn2xRccrkyciJ5b3pYtf3jN2u3vw0FB0ocu2cUyeIGrMqfp3VU/n6SnROsADsuhU1IQhI
	 HlvB0zQ8c/sbtZDRcBcWGnYmPSzSPPLwvUILzqK2UPHNsGKzG3Z7iokOVGTbagPLUtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dd3NJWZW;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A978606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A978606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dd3NJWZW
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e946155442so33242315ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097869; x=1793702669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfF2Fhz8PNov0Sv4mkHLRYpaIAJtmVVrP/HsyAkwL3U=;
        b=Dd3NJWZWOqoPtlS3IVkJ53Ah5FQ4EgFOGvXmeqWtc0r+GCf53Zh9Vnt6MEJ95lKCnP
         ZPsP1oRRO3qAtd0AfrpPWLD+h6VfxIbK+bqsGo5htxtc/oRj5yRAkTmN+sgt4jKdi3Ch
         IJeNZrh+kLY1nmB6oAMq9FOPxs4sq5ADQojGdL5y0+vMiONZ6eC0Tu9eRL3Cf2mJspa0
         omrQ1JXArB8ob1Rbd5vsk0ArXRydiwsf8JrxidCDgd2SuS1lsNlcIhkj/jXI7nNH8gv1
         oKdw37QXTE6JEBR8JX19CTX0Y7T+dvo3YN9yUtQ1HE6+v07G4vwJigV72NIWq7MxOCnZ
         Vpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097869; x=1793702669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfF2Fhz8PNov0Sv4mkHLRYpaIAJtmVVrP/HsyAkwL3U=;
        b=p7Kt6cnjM1Hgm8ZeY3bodwHY0T5y0abX4huUYSxLmsd0xX+xaAd6WMkP4u+Rp97wfG
         Ukpn5bN7K+RetibMQNd5CYi/67W6JqRcvRHiuEvkMFVwLHnHrTr5fmLMgQ7E1qg4DT2t
         mVGimcUvXvJowqpMGGxZDE7FDzanP3+IXDYX7tCucyNyZALU6iLk88BilRhnCao0uBOV
         jICtjFErwUxmjbMhGo0SSBKGE+zDL/4MhH5NOLHztY8gauHfAYmew/wBUSf1CXj3O/KM
         te1ymeK/mJiPjvTCuFn736I3vwbHwfOTbIAUgGrluHEdW/gA9KA2Wv1yiWVUa+im3/pV
         alzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxym3sEo6WEjEjzmL3Txin2ahPPPdCPrHH6aboXefDwHZAq8ZZXWNFrjKcOLMit2eQsoCEyPA5hlB3u3WM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu7q8QOMHzhHw6EB+UXqlndZpNBcSJFLXI1hDffTPlwcHwShHQ
	dx/7HHd+J1YEGGEb3uvpov9y8sO7tBZa2TgWASVjpyX5+ojBeXQQu0xM
X-Gm-Gg: AYBFou0xB/ehmSxTYqP4mdsJNq4Rb+4PjymOdYI2j35PjfhG4Rtf0noH6n9QG4kbqvv
	B+T0Hox79M7HtqOzVXoTq6mvVwuVtb/cQaA5TvUxbBpb5GbNQArfQbDW4g3o/a7aIyI1ZuYB6OV
	GNuZ7tBO/zeqqi0k01HydxP/3/VTSLMWmf5B6ojKm9OSy68sAjw2J6II8pNASXrg3ok4lIhO44f
	dVYUo1IG9Pqb81CHiLuNhz+PfV/fr5y9H9msaWs7AozQWXhjEY94eK+PXbdzbcTxeXQNp7n8QJm
	z/o6rFhgscCGnktnKlWIx7GPZSFBcRqlJPtqXL3cPjscrzBJtrAE38pjIZVMHbUYPbVdGSy79UU
	J44rHnMiGs5y+td0p6SbAURWIyV40cjKbXVcyQ8rC7b04GzT/yy6CpeSE6uwZnLD0Fiqc0ZxMzE
	aUulLYj3ENfUK5WUtc9eMgfJoipTfpdVInvjaNyoePIIAUwseimh3Ak0lTRXvXM2SBlrhGlvxY3
	KZyU2GNkkcmOCehIclH55ATRSlKII792v2QyTiXhWdkK7tnxtEi8qYGZyeaBjwWAT0qNm+2kLos
	YoSVrgmmOLFWZbpXIZ+d4T9AZ1r6WTZUJRIDkoDr8sP/sSJFmctzPX8xYScOZBfwYbUx3Xuw/7u
	b3zXtsRN7T+NqbPs7
X-Received: by 2002:a17:903:2c0e:b0:2e2:c995:b00a with SMTP id d9443c01a7336-2ea9c83f0acmr88449545ad.48.1793097869513;
        Tue, 27 Oct 2026 03:44:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm7187525ad.68.2026.10.27.03.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: img: Fix double clock disable on probe failure
Date: Tue, 27 Oct 2026 17:44:15 +0700
Message-ID: <20261027104417.7150-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

These patches fix double clock disable on probe failure in the IMG I2S 
and SPDIF output drivers by disabling runtime PM before checking 
the device's suspended state and manually suspending it.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: img: img-i2s-out: Fix double clock disable on probe failure
  ASoC: img: img-spdif-out: Fix double clock disable on probe failure

 sound/soc/img/img-i2s-out.c   | 4 ++++
 sound/soc/img/img-spdif-out.c | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.43.0

