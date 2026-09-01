Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E0345ECC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261927; cv=none; b=CfjXO/pnsLUk5V/v7vvZac9TCgDTpq1PBCAPewSkffEH3g0BQqmwxgjw1xDwgegTH3MxndCQbVZ6bPEgrtYSwyGW8iCecIkrz3OgnjnMmLUvfCZ6jAQjRoYUKSLrGZ4LekyjoV62MyrHcmVXgQvk26fssjbRnbDwV1sB3heDTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261927; c=relaxed/simple;
	bh=uok0MoqZQPoFbTAAAWwjQIJ1Pp75nsT1CW6Y3GJ0UEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9f5/swO+9E7/PZII/g+dwUmzm1F6WK125DrVQG/PnHFu42ZCln4qofAvolOfTIergBbOEw0UKVCBCwn36G0/ou3MM0Nta8xGAGI0koGfSc855tT5owCYs2x6dhME4sh7Whm7KzNMe9uAZ5DgR9QZFjNmeu3BJN9ea3af+eqOAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeuPPisl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeuPPisl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b965570d7so8507685e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788261924; x=1788866724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdI9C6kN8wC8gmw+WY4M3xPolKT4MPWcUpVuGixC+QM=;
        b=TeuPPislioY2D3GI9nfPjA+W9nqM4HDNo0+wWYmnAXhlnWIbFBpbG14vO9VCoxdtLQ
         IgBMzwECeJVBQ+97he04fblYab+HyH6LRj9YQhjoPThrQsbt8WUbCF6umc5glWZNUyn2
         rMayexTqJ4NtsELBTR2Ey/U4njxa+aYEuOQ31gh4FXGCaInQIhiupWoRGu7ba8Db3ohy
         cJD4dX+mVFDP8BOQ6n90aMqVh1sNm+dp2D7AuzmLBEbNu9zjD3X0oQ+XkyS+eU88Cxzo
         AqDxidKOxiEt8V2fUDS5J07TW5AXeBF4hXl22x/6HoRVqsEZFHk/cdVjgSsMpKMZXh8S
         U6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261924; x=1788866724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdI9C6kN8wC8gmw+WY4M3xPolKT4MPWcUpVuGixC+QM=;
        b=LUS45znnT8uG8n8sIIq9aUWA/gpiua3nmx1UYvYleiYhPgw6JIWpQ63U3tI8KNg2f/
         xWy/OjKMbFxZIwiIADBvOiKPajI4JGw1vhiw0nVFyV2YFjETMveLNjjyxyMIWrO7X/cw
         sRy4w4kzr8CZGxMNFrignCB7Bw3Zqem4ncnPNp2fcHiUoBNauMMJw6rqQDHT3h4s9Qkb
         DC1AkyoMzj3jV7Q/UeSNcTp7JJOZuhOoVxjEJkyh0XXeR8P6/5k+vq0gcJxmH43zwSuW
         HvtIuQ5uywg3uFaDe+J2exdx7KepobPr0nctNK/iM7kKa8UIJDieTxhG4w3r7H0/w7bA
         ++Xg==
X-Forwarded-Encrypted: i=1; AHgh+RoasO7U3GFMfC5IdJh4doY56n9fVvBpitIL4uxlc3plefXMHNpdBMflY+G8WY5swILa8fM7pjudNspRzvA=@vger.kernel.org
X-Gm-Message-State: AFuF++k1OSLgPkROuUk6/sy9PR1EliVYwEyVZthXqlKfx95c66slgh3d
	ZhxOmvrxNDkloNLI+m3uuKAu4iehWfuDAb0BggBtkNtg73BkZxI0i98=
X-Gm-Gg: AR+sD12p+YSjR432qrWvQDEH68QdHGrnsFZP1Km102M2uc8L/ReXPKZGPwgj/lCJX4z
	V7z8oloRfi6Pin1aqTdY6i9uQ3IOODO+Jo7Tg1Z+ensXGGz8sA6I7DzJl4vZOsa17JurfZM+nIc
	d5jK3XzRMb2kGNy2xwo4TB6hrrzmi3eEYgySY2rxFYhFmEZvifMXRfvYq4WZXpkiCQLwx2i+inP
	N4TEyor6q+CApNsilPVNsHUY9BPt+cfu33H7wL0vIVVsiNyrqXJorskwob63y3ubBylL0Mo04Fk
	LqqljchDApqsqSGlvzQhsEopR+uRkzZuzrqWYgVvHb79b+nKKgcV14JpEuU3asMnl8Sd30XYN0B
	FK/v7v5161ILtz3u5etxCkWRbgKeCaLrfJc5aMRGBunjzX/AK6XmiYs6l2EG/1Ku/WldzfNtZ97
	8oOhkj//UH1E7tSJa2PlZAhtHB26p+yjg5ZmH9fMBMyysq8hEEWwTopwYZMDNlniAPldXO9njhP
	+ZbyySXPg80nQBU8xww03dMGMEeJOSSssCMdO0E/Qo2
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr458680795e9.7.1788261924007;
        Tue, 01 Sep 2026 04:25:24 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08b8esm55661925e9.3.2026.09.01.04.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:25:23 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v2 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Tue,  1 Sep 2026 13:25:21 +0200
Message-ID: <20260901112521.84037-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apatSYqXbqVSGBo3@kekkonen.localdomain>
References: <20260831094257.29398-1-dmanresa@gmail.com> <20260831140304.45940-1-dmanresa@gmail.com> <20260831140304.45940-3-dmanresa@gmail.com> <apatSYqXbqVSGBo3@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 1 Sep 2026, Sakari Ailus wrote:
> > Assisted-by: LLM
>
> Which one?

Anthropic Claude (model: Fable 5), for both patches in the series - it did
the code, the commit messages and the failure analysis, directed and
verified on hardware by me. So:

  Assisted-by: LLM (Anthropic Claude, Fable 5)

if that form works for you - coding-assistants.rst only shows the generic
"Assisted-by: LLM [tools]" shape, so happy to adjust to whatever spelling
you prefer.

> There's also an extra newline here. (No need to resend if you just provide
> the info.)

An editing artifact - the trailer block should be contiguous, no blank line
between Assisted-by and Fixes. If you can fix both up when applying, great;
otherwise say the word and I will send a v3 with the corrected trailers.

Thanks,
D. Manresa <dmanresa@gmail.com>
