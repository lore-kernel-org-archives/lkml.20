Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536623;
	b=LCCtrDE/8Mfg+o8PxianKEpn3S25jT1DayRiMn4mC5IUi7aB7g6SSZyf+HaJDZGslBSV
	 5mP3eJ+hPXINEt0TAFOSPMUAqUAVKqc0h6AWsjzCIlFoilIg2EYMZtW/zza1nsU2KP2N8
	 2/ZO/dnC34YIIK2uNcGFnbjuAYnTCiwXN6/pOoOfHqb2Q9j8vT8P5juB3xEJEH9/1zveL
	 wDYTIkfgyb8us8R8us/OZ7Ez2ZaPkklP5ylTYYwjF/p1TnKqN3Ak7gwdn5gWAgLUKY1y6
	 I8WTxkWlBq6xaDsabgcu76ZQKDZnYZBosrys3hAWmIxBMnvEqX8tfjERlb6iTmMdzVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
	b=aHIKmBgRorIBxlaZLfg80cERwUHYS0lOJvQ9y/hcOlgcWPyXlGOsEw+Xib0AWzNEjQES
	 3Fg9M2lfT6rhOaJkBdaNdXTyWV9Azm5iNbkBUJXnSluztI2cb8aI6l/Ok7dXmO+NI1Ori
	 0fVa/D4IC90IWXa6Lx0FEbrnLQ0dsAafADYYdqWQv9sKvSQGbqr2lOu9BwjaosNLQRgdm
	 x2gmrh2SZD5jNJgvXw/84c1K0XiiIC8BOyxM1jdb6Otr6cWdEJd0xKF7Fsp51x+BAmYQb
	 REZ4UXWQ/EydDrfsn5up+tLw3HGTj+WIstUSeiZRI1KpCz9zHfeyEASWetD2UxP3Rag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC060A3825
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CC060A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so659395e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536622; x=1793141422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=fuL01yBCCOgff8Fcjtg40uzwGWns4yu2K79aOgLmuvLPTIqIq6xfOwGY+eNrV9NxYB
         NuLHXc6OKmZrjivF7l9UL8tnxGToPClQgFvUmKZMSX9ccJDpurVRWobpNkBCtnmcNdUB
         aQBh1L8VU/HjBgiGcJVCFs8z60tJMgw0CIfCS3TebzUjoMpedcSRCxPnL46oPTfekM/r
         EAtK3JGq6+2HquC1sETYjEiKdU2nyybu/oRxBP5t5d+kfuC6EVRuAOXmVBxFkmGmxVXv
         ZKdQvz79m7F99pOrPsWabv9/wRorRrzeQu6l+DP8GgJvbkNo/joMAomOB14jA7mMTEOo
         rlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536622; x=1793141422;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=V+A3fjZaWwr4J9sufLtsr1H/ZI4gVgnc7kyk+bp2RsxVwUelKM+qdEDim69sxOMYCB
         Y8RPQuLW2jEByrIBqHUkiki/jdV3tR5dCKYXt92/ppaQ13c46beOFvyzRKPrypSHw9GA
         4c04V5h2iE/WUq4gBU3VGzC4Wh6Hrm1HHipfpb1DoDUE1j1llzHkaJrV6lbbPQgxu04v
         PbevS96VtbYvxYe0yucCq3ltu9RTZVfuDyX52PT4eRNsKqIUQD6iFPr5xi0sKHJyQw7G
         r1hwnXbbqVh1iNmKp1x6G97FKj+IPsxHyRpVrOpKe4/AgQjBrrKLL+Hi8R8q119vJeZe
         DGqg==
X-Forwarded-Encrypted: i=1; AKwUvBwpB+64XgUDpN/nHYNlQ5WPNVJqh59QMmSHOaT9bvFs7nmgT0fVeNPkW/GDEkaR0oVbwQw4nmwKMsyIwU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF40MYKTDCRD24/hnn0C6jgiEVIOSh6w1cWSuPMNiL6RxZ8Bwj
	9kANA6vVi7ml5Qd/Th5IooqwAaSUUo6rqOxx3sWS5DUyakLO7O/X5EBi
X-Gm-Gg: AYBFou2Ou2YgKUXOJdY4C9XMLoyMzRBY7N5cIM7MF7wixNoCKMIPRXi27NKQAOAc71R
	iUbb1RFQPaQSeZW2eakyEESRkWOc3zvKGWZrOqRerSHoCOkajrvt/RCqR/TY9SibrQBsoDJ4YNO
	/kbHuz11vhfWkBgvdj72pdwCQbTSG0TfGcPklnfjyP1tRYsyyRPQd2BfuL0hSYoG41R68dyoYnt
	lR2ac9XSk1B7LSw/4c0BhJRk8e9Th2O5s4ZjDxC5Lib6lfubFcwdw0FdEBtEh9WA4wucyO1I+PA
	g8sc29QGddLy6mXhc3G85qGmDx8sscY6sWCH4Pzzi6d4vPvnTuKsXN5R+HJhr2TgLhn+FM/q/GA
	KjeYsgzqXvR2waO33tJ9+IGcK4iuk+WnLoDtgBzxHtROzdPPttIuOW0AHbgGV9vlR7QCXSsVjlf
	o+BIgkUjc3pwXIOJj8dEzE9g8yINgH72iqJXD0a28VZeqExMz7PIkJgrFd7rT/zGtpyCeAytja8
	sGjt3OZ0vkBd8VAIyhutCkR
X-Received: by 2002:a05:600d:8646:20b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a1fdd5b101mr1644285e9.31.1792536621644;
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/13] drm/client: splash: prefer what the command line asks for
Date: Wed, 21 Oct 2026 02:50:06 +0200
Message-Id: <20261021005006.2341200-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-13-maximpedraza@gmail.com> <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 20.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please see my earlier comments on module parameters.

Same here: my reasons for keeping these are in my reply on patch 3. If
the command line is not wanted, this patch goes away in v6.

Best regards,
Màxim
