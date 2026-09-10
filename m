Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86C475342
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052585; cv=none; b=gf5Xh1RSpQD7me/rrqur1ik84K4dcaRSEWPFyWhx4N6AwaJtfPOSEZGA26F4SSR8vzRhGrxLKCkUoCRzY6XGLaJydadfe72vHTbRlpRguE5fMyJIkKSMrCLQVAJZIhP4yu3yaFY18WiVpMFsbBdsZ3x/xFxq3yoi8EpIw+AY1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052585; c=relaxed/simple;
	bh=WEKZGkYMhuG/QcBWeOHNGGmyyaOuLvtBMV1p25iWac0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJ1kfV2ulCQmAA1pNtcwuclbH9fS7Hu1/C327osmvCQdPm3rAowGFx3FI7v/Ybv4gJJ35rJnJ2CfSuMGUESAltlvMiiRBpdTH+kRhveakBF8ENJHWy5FgwErU9wMa7DUo5SSJ2PhzInybSSXDh0XsBB3XBn5tgSnzRKeJXQntfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlPadE8Z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlPadE8Z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso4762485e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052582; x=1789657382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVkpNvpROCLLMNLfxrQVSfYLWvaKflKzjcbar59UihU=;
        b=ZlPadE8ZbPrHqU+UpuKfaKeQMl18fpsjbiiT5NLdW6yERa0nDRr7vKqETDkcHvMWDK
         gIhLZaiRGQVXVr5wHYYvb8cEQqa0rly2MH+OfqXYxxIu5LzpGp2pBdIAh+FA5mLTG2Ui
         l5+F2wdlr7ZIvHiLj5+wJcnTOFqIXnhD//QWk4bL6b+8ERnn4Fuf08/krI5hwEL1vyrH
         WVW+D8CPxlIxICf6SpmiLfOCVIgX20w2aIfUAId12PoUx/cz6Ku/rrpAvU06i14bOcBC
         U/2w6rCTk67krFes3A0Lir7o+9WQYCdhq3lkmXRZFQpGi5cu6Y1eQg03Aq1bD9xJQSJz
         HA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052582; x=1789657382;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVkpNvpROCLLMNLfxrQVSfYLWvaKflKzjcbar59UihU=;
        b=hvx6RLM41kyYflwmsaEg9InPHwdjIQ6dW/BeixO0nHYGsj8n/gyghn7Z7nrbiYe9F/
         kI3JcKkqQPARICVC1TNlyxbgtrN7nLd7AzRSml80vGM50l07E32r6rL79IxW6vHBoNsP
         9yLvnGZDVUNxn/H53VRdlJzsLay8k2klYl1zONFhmPK+ilL1pA56RKlrGwUFPj+bGUvT
         arzqd6QJjdz6R7/ly0kti1rFVhSx92C0IbEBYFw2LjsorRO3jLGJuEzKnXnBI77c0UxM
         38ODjYGnb/k2MyKxvDTN+8RaGlabGz1hQdj1lL4NlAjcl+0HE9r6z515ogjeZY8KoGxM
         vLTA==
X-Forwarded-Encrypted: i=1; AKwUvBw6+l+F3q9J3Lk1RzzIebAuyL4BM3/3TSHOKo0706tbfIDl3rYfr4+0pZaBNWgkBwmO0voUviaUEMA0I/o=@vger.kernel.org
X-Gm-Message-State: AFuF++l9XkmdO0F821PeNUGWRYBB7v9mAgAViXRk2nXxsQaaHkUwvwIP
	PxYjaMVOjY4+AC++JpKdyW5GhrAr5akBzEf/tVe4FVEfAD9zKc11Xwx9
X-Gm-Gg: AYBFou3XzSmR8ngPcPamzLVTaNfYM6gP3L8ta3Rp2pZTerkHnohjEl825H1uIE33lHA
	9uPc3NBrlsqS0AU21tc9C5oWPDyE3aLMMpyTzebqRp6O9oMZd5BtlHrAbKoyNqfwvJ8U7gehd4n
	Pi5WArisKaMNJFcVPyhfEENx3d2jgllDOHQE57+O5d+OwxguMpgl0o7Zny51vhdCDuCa7QqRUPw
	AVY28Qq7KFBTLbxrsq2Z7IpXAJ2WxdtuRKWhpGL0LGbxzzwuZC4vjilfz1I3zPIOyJTm/hGwZV1
	QGrCL2Z9lirdMKjOKOFRV19kE39HCiY3q6injvZYrtfIk3nuI9n3Tf1tilNE0oUDhUZAD3Xy1aO
	dsGGoxeb+K7zpEFVinS18d366bsCQHsLiBQFHkbIT+Gqzihj59BcgFMnE/5YGY/u9LyLaI01KOf
	UIyr9VQVg7wf4vm+pGzw3fYm44hepUVtnUTUkdLk2wwUvw0eKigDCogY4msvwb/XMJ6Sdibh701
	AP+PRopTxKso2U8gR43W62FjEbtPKKTFfacpA==
X-Received: by 2002:a05:600c:3584:b0:49c:ff66:7d88 with SMTP id 5b1f17b1804b1-49d26d7f8a2mr74899235e9.7.1789052581389;
        Thu, 10 Sep 2026 08:03:01 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-70-91.net.vodafone.it. [31.26.70.91])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm85162185e9.15.2026.09.10.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:00 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] HID: Lenovo Yoga Slim 7x Gen 11 keyboard fixes
Date: Thu, 10 Sep 2026 17:02:49 +0200
Message-ID: <178905256920.12856.4223144289618356245@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908111812.43837-1-okerixx@gmail.com>
References: <20260908111812.43837-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by an identical resend I posted this morning after
losing track of this one:

  https://lore.kernel.org/all/20260910063051.4556-1-okerixx@gmail.com/

Same code; sorry for the noise.

pw-bot: superseded
