Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A233A6B6F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790414860; cv=none; b=Acghgo46GQkQrbXdWd0V4okn1NDI/LNhemfaAxDbGHNlBEeIwG2SPoURcPWD1QkVb+h/JfYMOIZPXuiBZli/LTru6C67k/eCJ/JqmLdjCIpSIDiHKzwreaEsU98DLmfvLMLZ9qVmT17i23MyacWtb8pGG2Ofq8DpUiupTgnwtuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790414860; c=relaxed/simple;
	bh=LPm95XpnLeXQybjSBPGU+TvJ2dM+a6JBCBNVIAJlkKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kqm8GyY4xLPahy34AwZSxaCZl6JweWXmPNuKhDnV9QqDdvhyoBLrGQttVO24uwJJGctABIOmslZv9vOzjxoHjuFqs19QBoLYHNFFDksBImCp1YTM6yOAKyFlhGdtV017DNj8+tm4skM4cOFd4y5jAvGAqOms7ouUANpd2952rAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6ikRdh6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6ikRdh6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso2812025e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790414857; x=1791019657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WfhSiXHQRTZVo3RbQYIEvZbWb2gG5Hiz9roKfYWz+ac=;
        b=m6ikRdh6FBJNJMOpoyGR6P8xdOm/kNjIv+x7ZxyMmdcDvhZJzGaJd30IfD44Gfp7lC
         uclK2ihC7lovaT472q+FrL9BwqCUm8g7CDsiyrLbhb40Cotn6PE0wP8/dEsNo7A5KVdO
         MjufvcwsPrs6mBxuzGloni2lujJNPhDxbTMSmt+Y0pdOfgcF8Yxm7CKnuGhZJjn2QGLR
         TwvpRCsz4ZT0ayG9pBAqWcyAmv/S0TvXuuPpC3grIQjZbHVAeOlQC9YwtnwSooLjxwKX
         59HiZUHIgNCElw9xCEFPQ3Km7M4/3atkIGM/acmZu0SLJ4Y5oQmxPk+dHrz92cGb8uR7
         5IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790414857; x=1791019657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfhSiXHQRTZVo3RbQYIEvZbWb2gG5Hiz9roKfYWz+ac=;
        b=I551m+C/2NnMF+eTM7jFWyungfHvuVIb7bEWiJyPKyff3DbecmcsHNvbPgS0EAPaM0
         X0OIz8NU9zgQe/O+i08RBXV9L1zzzpOEMKEv5YlOwAznLZbyV2MI9fOxhCy7+IbjClAX
         +kDGYX6JNAEPIsZoJ6+T9IIIkOHn9JWOE8Jx0kyqRczgSeYkvucB2T7nVXC5u30vIW07
         Y8G5hZJpoGGjEAHHRD5TPTOXzdXjzpn0uzdY3KVKeBQtEpaWHJg7ZlBrXtipGlTKAsek
         bAWv8dmK1yoz/4rp+qqTkUVjnz85Q9TclWvomRZJ7m+XyDAWQxu9dDqaCvTXdGFBRz6K
         AkAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmEl7s7HePee5o7jBckKh5Wk9YQMsC4Mk/xuV0qc00emQ8a/LOgdS1d0HDnE5YlAlTLCXaFqz1ZxLYqH0=@vger.kernel.org
X-Gm-Message-State: AFuF++nY1YBM1SbAHrBzp9hWWa9oaUtjw5grB3wBexteTA5jBI7CNrh4
	0nRYad2HibnPx4lQN4iGbqHwxXcN1vv8xwpTvUwI+Z5AUphoJHOhaZQZ
X-Gm-Gg: AYBFou29U1KWY5VNGIDWWaWtRPugbar5Baxzbfy5rUr6g2aYD0j93FKOiIR7hQU45dN
	FKHtV1MsI74h9U3zAH2hs6c9wsvnbcLNGf2063mTAJdFSLH7BTp6TTf7JOTZDvdOYHZHF0ZaY1y
	Ho67oIQYiVHp05u1We8SvI6lJGD1IPzEDmfAz/bhorbhc72aPZdp6/Bvu1rxbgl5GRwieT8qKgB
	9WLDto5wciqWZPTWLcV/Mmd40f7VBMwOE7/a24a9bfGJtPttj0+NyOa4VSOGAfg1kNQyH8Lb4EK
	AyD8nVOLcHKXi6nU5qaZrvXyAO7cJV2iFqLU+DtONuJku1ZDEu7PCLGznj8v6zN7Aiu/Hl31bX9
	CK9Uj+uvzkYNHmzxBaCeFTXbk5K0SBlWYwUdiSh7sObqSdl99sXnnCVgy9rbKwoPvPz4KmBfVF2
	dhQmR5Wn9omBXgPaTnMLstGJxnze6hhc3mddVM4RseRenSDegdEAcj+0qfXYE5RkWuNhNeU9wgV
	vcBpEV9BZoTb0owj+xTtV/NkBASaI37v9fcVeWEhOXgATmx93szvg==
X-Received: by 2002:a05:600c:4e49:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49fe66d456cmr137424985e9.9.1790414856635;
        Sat, 26 Sep 2026 02:27:36 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm119604705e9.11.2026.09.26.02.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:27:36 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	sashiko-bot@kernel.org
Subject: Test for [PATCH v7 0/3] Add support for the Sony IMX681 camera sensor
Date: Sat, 26 Sep 2026 11:27:30 +0200
Message-ID: <20260926092735.11605-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923211816.89954-1-lsa.uz@pm.me>
References: <20260923211816.89954-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For this test im using every component and program used to its latest version available in the stable chanel (the only exception is the kernel, wich is 7.3-rc4): mesa 3:26.2.3-1 libcamera 0.7.2-4.1

After applying the necesarry patch that deletes the line "const struct v4l2_subdev_client_info *ci,", the kernel compiled correctly whith the patch applyed

I made a thorough investigation of the camera and came accross the following problems that affect the camera using the CPU or GPU
 1) The first startup uf the camera is somewhat slow, it starts from a grey image and then slowly starts to recover the color of the room
 2) The camera is horizontally mirrored in qcam and Firefox but not in Gnome Snapshot ¿maybe the camera has a mecanism that Gnome Snapshot uses for the correct horientation?
 3) There seems to exist a bug in wich, if there is an object that moves fast in the capture zone (like for example, a hand or a person), blue and yellow lines appear in the area in wich the object moves. This problem does not only affect the front camera (IMX681), but also the rear camera (OV13858). This issue is present both in GPU and CPU mode, but the error seems more prominent if the object exits and reappears in the capture zone and while the camera is starting up in the first use, This error is also visible if the GPU is used and if you put an objet close to the camera (for example, a white sheet of paper) ¿Maybe is caused by the ligth the camera recieves?
 
 The GPU debayer is still broken but i do not have the knowledge or time to identify the root cause, make a solution, create the report and send it to the corresponding place
