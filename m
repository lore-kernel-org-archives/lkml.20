Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CEA470EAF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924244; cv=none; b=OaGhnXxWCLbD9xsA/Pyf3KpCtH0hrVSPBXrmlA5BiBOxkZF6kkeReJjtXmZgydqI1jYiLO6VJsmCvERaAET+wzbIdOCOF+kVy4Z8w4xbCxtl2uXAElf8hk9IIa6UFcGK2LPVLWsDm4V3DWQZ5GQZf9VoHWt4ysLr/O8skQ0txD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924244; c=relaxed/simple;
	bh=m/K1OkPa5NYvWpIHpoqecii+PsO5ZMdWLsbXqX3ixEQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VvQVrFrAFlSpC1bFBUaLV5XybH6U47YjrjYj9X2w7SFaURn/OQKynWsCPG5JqlgJIF3JBSzcDM/iqSVpt3dqj4gGWPHHu2rj0/h2D9QudfY5mPLU6foqnVqPQiP08ZoVWmeNrBCk5mXRyLDPHiU6U0bIP+ZYwRyO0YZB3ioUaZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fs927xIh; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fs927xIh"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc92350888so41271715ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789924242; x=1790529042; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/K1OkPa5NYvWpIHpoqecii+PsO5ZMdWLsbXqX3ixEQ=;
        b=Fs927xIh17QospCUPJcbnL8Z6UqO6gmgq9M8qaSNDCKlLZrFivkHaw+bp8c/vjbNgk
         0MAQlV/RNu1icuSaUJhNw3xk9B0c3vQO1XKj1VCzGyafkzDS0mfbO3HG8D+BAOqb/V2Q
         ngMb+Mi5DpWFeISToyhxYXxUlCSE7wtWxWEoGKWOSXm8qtnbTvkf2SxyKy8Cog/uk55q
         EpWL5SO6ynEJ76ye+OwQWjTxLYrvk5hewbjU5FFUYm96mrdWKnD6B3HpeS5xDNOrg1Sd
         mz24TVQyCOPUMwtzs8M24NkkIFCozUJ0b0aTbdfVQAmz1eZSZQuow9Kc+t347uko1ouU
         Dnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789924242; x=1790529042;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/K1OkPa5NYvWpIHpoqecii+PsO5ZMdWLsbXqX3ixEQ=;
        b=PbOkx/PABVN3tRmvhDIbb5xmokddERF6fsAUXLQ2dX+giYSUxbNDpYV466zJv2pJEV
         qF0fehtqeNmRHR1txYf/8W/6ETF9ftZLzAQ7yhdx6+lUXBJUpDU6y+DcofBGENaMPDFg
         EI+16wi3Hk7eY0O9bFhndV7OL4z+SwNE1ipuXTetgNNo9ij6D0X4XTFQW+A7NW4LZnbA
         UrNdwRRvvIOyJ+1d9CpWNUlvnpG3YoysmRvEWf80QlQxy1WodhqzkvK5F7kAiATrMxHg
         BmNzjKI7jE9P45vq9E1N9DDQW30zbS8T7sBVurb3KSEh/f/ne+NOk4XfxpeEulNCBhVQ
         EezQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxNcE0Mm0d+ztRwbvpK0bgtRlOn2IjkV1MTG5kkdxlu2JcFz26XzeHP49xNBVz2mZSfj4xEkptr/ZRVhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nJvFWL1ltsfHkzU5WOEWaYH3R2hzhWhxa3MuxxxFns5fDzIDvG
	hapnUeQOaSDVqHkBmFXig+SJdgTYlHyhal/JzJZCs2MqL6BM62CFFpERjUuBg1oIhz0GVvnaPbn
	K20L79Cw/GpOOQA6k9gemgA==
X-Received: from plar12.prod.google.com ([2002:a17:902:c7cc:b0:2dd:5ae:3a51])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f4c:b0:2dd:c170:2d4d with SMTP id d9443c01a7336-2ddc17034demr76642115ad.24.1789924242402;
 Sun, 20 Sep 2026 10:10:42 -0700 (PDT)
Date: Mon, 21 Sep 2026 01:10:40 +0800
In-Reply-To: <20260911024319.1346706-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911024319.1346706-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260920171040.4052486-1-stanleyjhu@google.com>
Subject: Re: [PATCH 0/2] scsi: ufs: core: Handle devices declining optional
 Query IDNs
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Stanley Jhu <stanleyjhu@google.com>, Xilin Wu <sophon@radxa.com>, 
	Bart Van Assche <bvanassche@acm.org>, Avri Altman <avri.altman@sandisk.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sep 2026 10:18:47 +0800, Stanley Jhu wrote:
> Compile tested on arm64 (defconfig + SCSI_UFSHCD).

Quick update for the thread: Xilin Wu tested this series on hardware
with a Kioxia THGJFJT2T85BAT0A UFS 4.0 part (with the device quirk
dropped) and confirmed in [1] that it resolves the 0xFD Query response
errors on boot and resume.

[1] https://lore.kernel.org/linux-scsi/B6ED6CADE807138B+422dda6a-301a-4bd1-befd-b932ea9f46e0@radxa.com/
