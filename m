Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F259F35E1CE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750562; cv=none; b=kU8WRmrGa+zYhZ3AO5OV425fP/nrT0lQkFpLWHS0Xr+xh8VqhR6f0O+0NeisBPQqJ9ZwDmKVmwXqCwKfaSxBKn95uEUu87eCKqfONT/M2tBRJmfevSVfQlM1nlPpvVIdLxoLtyNORx4k22xonCMZgvsIPxKZOn8wBYazx2nrzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750562; c=relaxed/simple;
	bh=mX3s7Wuue7QJugikXnPZUoqtMdlKy9faFeQAVdUnwEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AltYu35ZNwcWzQI+3VbtWIRgQVRAwrBgP05MofJZny0+5ZhG+3iJj4LKfVgENDXpNFEw3aWX8cKYQhLW8FDFdrFdPg/uit3aokaLOJam1IZ3qQw1zBE1B+R3u/hw0DvJ4Bg4NeZTYtzu8kGsCLgudIGdSmwT7ZqIQFPFk7D/dhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNlGe+5j; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNlGe+5j"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so2219366a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750559; x=1788355359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDTETowqjn58mNX6pH/9vP65F8hLbb8Lm3FCUZsd6AU=;
        b=qNlGe+5j7osTCpOzP2nFWSa33CTjNt1GBHBAeIl5y3E8QMQmQ1mT3n164x1W5RogSY
         k42CnfssvYP2dhirR4AtjO90/gJ1tv8C5hHZiJ6ky7rx79/CfxFRU2ThbpTNoCE4bcXl
         RHhQbOMQOXI/V+g1YCsENwMUdNuo6Ybn75zRcjFEeaw2VWlI74nDiHmFgaMJ+YpkT+lX
         J5e87eTxafHNqY3mSh9WDJ7iE/Ighi+MymSUIoC5Y2rsT6XXLIl6j92GmoJb9MLKqJTA
         LywFdMaX7bwK5Gr9e4Rx0Mffa4tDRmro4C2tpescosRRjoALE1M/7iA2cgW8JydmvDc7
         ofvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750559; x=1788355359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDTETowqjn58mNX6pH/9vP65F8hLbb8Lm3FCUZsd6AU=;
        b=NuRHQUkdlMN62LR1Dfarkvty9KxWF80fZmH5ML2cYZZg6vEnz0wxEvlTIZ/hdv2/SR
         EE4c1japZ2PNGh9tBfjigErkEDl94x8z+dVAKmrfOayJ6f83hzdW7+Sa92C3ecBwAzZA
         LxMz9tgPMjMQZ6cafB69qypUKoiudLhNuF3BARdMDclo6rK/sRN9JvDYLtXYOVEBGyL7
         SRzJKmE9zvcwlx41r0elDJ5I2RJq1RhakQuIQfKJ83cy8rPEMqImH4PybZsRciHvAFsy
         e5/TKi9uQZKyzluAnEnzwLaSP0xD4usxFoZCG0oH5F0YbidrrKuLNARytAFOALtcB2Yy
         FTqw==
X-Forwarded-Encrypted: i=1; AHgh+RoAGmDaZRQ6NEQdct3h2OAlsSMYXclCHHtf8oVZoEp/kwHN+9GLQCZr/HePRdUeR3BTqvXzT1aBvVMCt80=@vger.kernel.org
X-Gm-Message-State: AFuF++mzBzE+5h62RiH6PQrsC3wxrWWoXSOC7jWXO+6gxLLaW3tQLZA+
	eZDmNYlDIMpilnSkB1WhSjg1jnDRhazBwA5OTBZgQyI3bpYIo3ZYfQXc
X-Gm-Gg: AR+sD125yYs55TXIFr2AlEvfh+Np2Guyix8C8WOaN3C71oJGx85yXq4+qL/VG61swiN
	sKwEhgvtxjWWOLy2Nb5QQCD1VIXsDxZPjONnWrLzcifPwfmaYQ0gF99yCNZHltTCIJqrXJR7Alz
	oHGeSupTJKqxC9RdxNLF3VvY9vt2ZbXFlJHxRWXLk0ypLxmO3E8oXHOxLUq4s0n2k4DPAkSyyJP
	ACNppAEUcJN3+oVcEj0nIxfeQw/f0RkpXs1hNa5qsHsCP/7oyclojKOkbQrgq8Kxjk3wVkAq40j
	pes92j82N7eMUny2TVsj8CgnajCHYbB8llerA+3qEAVM8CFUycivktlqCWsVwvrNe6JxGSPyhL0
	9cysm9qiHHign//xkVXcp9SrsGlrJ4ekeMDi0OhW3prvsIdqjreGwUmHZ1YQecAm0mQZx8pyCTV
	h0x2bgDn9cltPRiK00uAaGesb0eDcKxHDPkIqctQlRkQIs74YxJqmkRiZLcKcY1WgBz8oujs1c8
	VE6lhKqC7+ymAC5PYMdT1WcPtWadd9vtD6g8S6Kg6M=
X-Received: by 2002:a05:6402:2111:b0:6a0:a46b:ad3c with SMTP id 4fb4d7f45d1cf-6a5df11bc67mr7678105a12.1.1787750559258;
        Wed, 26 Aug 2026 06:22:39 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm1689857a12.17.2026.08.26.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:38 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 0/3] platform/x86: Describe Yoga Book haptics and audio resources
Date: Wed, 26 Aug 2026 15:22:30 +0200
Message-ID: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L firmware omits software properties for
its two DRV2604 haptic controllers and does not instantiate or map all
resources used by the RT5677 audio design.

Attach the DRV2604 mode and waveform-library properties, instantiate the
TS3A227E headset detector, and add lookup entries for the codec GPIOs
which control the second speaker amplifier and headphone path.

The haptics patch has a runtime dependency on the separately posted
drv260x optional-vbat Input change and has been tested with both Yoga
Book haptic devices.  The audio-resource patches are intended for the
companion ASoC Yoga Book series; complete playback, capture and jack
button validation is not claimed here.

Maurizio Casciano (3):
  platform/x86: x86-android-tablets: Describe Yoga Book haptics
  platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
  platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs

 .../platform/x86/x86-android-tablets/lenovo.c | 109 +++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)


base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
-- 
2.53.0
