Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645331;
	b=wqKkciZGWjKXE60WqLMZPaeT+pPwbppec1/12kumd4qGszYhBm95cV6uHpk1AvW2F9vV
	 rrTxOAPIFvf/t8FfdOPB6CMHJ9z3p/Pb+UFkPxnwTZitkTv0cpRWUwTqH2ryiTyGFiakc
	 y9ZtYXy/zSe3wV/F4sY1E4yvti48lg2JE04RXFWUP+Si6nYLi9wXwd7ZyW2AvEKdINXEn
	 Upo6QzueY4khQZnudKNUs8w6rpANf/KxZNc97l2edT4lkTqN92pokUdkMuXTTSAr1Dr4K
	 jv4oILeyIUE70U6vlZghuNm3hDWMkUCCdcTxmpeMJXFubUq5p5ftXw1Cp1hiWy/QINA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yfnJG4iiDKKQuxyCDYfideniNtJsvgutAwnUooh0Jdk=;
	b=V4u4Qu0V56wr9pDFeHu3R6h+0jp3RPumei9WWmWGZGP09UisHXdnajiJ1PisBfqqVmRB
	 Dd9KnbHOjnKFAWV6kV6CDCjdnyHnCiPBg4dtexWGR8bnsag30zyoZkEwtQd30OZqCHtQv
	 pAKXfnAYaQPuLIGKmYfogQJdd86wn4vwkkPmp9zPIPdH0k9g+iyIq8yWcNKipZe2qsLge
	 Nmhy8xgVqQ4YR5fxcydJ+INAzI+HriyK8OzzGCotQy5VTbp5MMYS+bkPRJVLeBX9Bli1K
	 ol3W6SrAmFVf2MhoGsoav9UJdKLsEOP4/2VYmRZTS/jbEUISNcxlfYMGQ21Ajki93qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y37AXEGZ;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78A606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A78A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y37AXEGZ
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso2214779e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645329; x=1795250129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfnJG4iiDKKQuxyCDYfideniNtJsvgutAwnUooh0Jdk=;
        b=Y37AXEGZNRjjow8p4LgjZLoRKWt+vX4mg8SYvuImT7FGNVyGidP9cBiU+r9aFgF/Yk
         APWWK33jwEvWKXta0k6KDONTButeyotr3NxYw05JrR9yVuPscVHnKuuaKSwyqY87IvAZ
         f0clJOvbwYnoDcdd2V8hHQs+lUqQ9EKgm/h6fUsnrrZ3QVo8TxEDcrj0ZxFIXJJntXPU
         2wQ0t9E2rUx5W1SnFl1JVxao7ECM8XiXbyLpN6PGyQV0Ezph2uKLrCpUUgjKy0aLhmXq
         A8nMvYmMfMSW7YkUUHEd7/vSv9ZOhTX6HGsYZV7J4USXZmbpEg6e8kSbiLzLfaFLv3ZB
         QEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645329; x=1795250129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfnJG4iiDKKQuxyCDYfideniNtJsvgutAwnUooh0Jdk=;
        b=r0N5PiR2nSNqk4ewNdjiI9wyQQxCSMbj1/7/WPWrKWX/4SL//XNZ39C34rtOVDiR6i
         0UX1Lo6J4pQ6yjEk74wZiOFjf+3S10m5DM8AeWMUlx1JJlQYVJ+E7uDHtkvCEBQCuQtd
         FcZoy+Yz8girCmAIcUC9OC5Q9erHXHyFxVdxW5i8wOj0KrdKdEZ1DB4GH/gkDRdtaFcA
         3QFUvC07+elOrpD57yDWtk+dm0BszcwpDPbvro7KFDAU6LMMiz7ugnbHZ51fO8qQ61zV
         lmSzlXcWzn3pAF3aitX4qTMEYOw/uuJ/W8f2qT14k/a1rdgNzo5qA+hwD+cUlJ72KXCr
         gwwg==
X-Forwarded-Encrypted: i=1; AL+hErGZCuO5j9xu+7xrKPr7xu28Z9S5+wdgBRgvPIUqp/5CNaLFPYLdWK1YE5Cwb8/WK6sefzQ4LhX1ACH/EMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rG+zhSn7W4tBWYtltC275hOq/eWDGhBxOSvH7xgTHX6MSf/MS
	jZgr6SN5ActXdjooHuExFkU9HtNBF6C9YZ5+JVetcQAH5UzjHCoNJEhkpnCYnKPa
X-Gm-Gg: AYBFou2Ars9BGMHkPERUR8BRGFiuIVebSSpYqIGapcJdgaUTS5ci0v700eQQE1CWP+7
	ykX49K4BIXCJ7cWrKhSSUPws3309td42tBgo2ToPzVeKTUhZX8ZoY5plQAnghqHAf4Wbp6vWySu
	DahuhlLmDeeHHGloLxkmDtQhaKjMNt4P7HytY/W79rjpzY9trPQ0lVtvHZoTjc6kV41Sx/vXOx+
	rayaTryPFMnTUCO/mA7yhUPtTyvnClr7JyHxSV5Cz3ZqimWwPiQ8L17lH7i6UgtJk8yrEV5D0d6
	5haFmHtJ4KWeGrJ5CJGRW6vjwgAF5zJYCaVLM6WLlW1PARrrsfo7mhhCeRzAoZPqIi6/3AM2LOb
	iIKU1/rQrxicx4qgqZt505rqUyRToMF5HOK5dlzLW+jqWwSsnqSgBYWVIpOKh4sQ8Q375exGjCB
	nfpatBSH7o9+FSMrEfJqTeQjaoCeh3H9WujwWP4rIUOLar+JXLwbqBzw06fNm8h/HXsgyMGtavs
	gis5t2ouFP6ozMSbhjCzp2eFg7bviHqcNsj1pieAfSe9GRPxvM3hHD1mMuNFitLPSRZ7n+qYhKg
	ZIpxpx0UwxokPdJ9l3g0qt5UGw8D68gr9/Wi/QTcPq5jcuDWPVB1Mo7Agx1KNKyWGevAmAp7q7V
	hr4rCERnKbTGPB0fEEqXrU5yJlOCgr1wngpqaqg==
X-Received: by 2002:a05:6512:3a88:b0:5c1:488e:a069 with SMTP id 2adb3069b0e04-5c17079a9d0mr1861830e87.13.1794645329214;
        Sat, 14 Nov 2026 00:35:29 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171356581sm1487024e87.66.2026.11.14.00.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:35:28 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: Re: [PATCH v2] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Sat, 14 Nov 2026 10:35:25 +0200
Message-ID: <20261114083525.11972-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114013817.476f8fb9@jic23-hlaptop>
References: <20261113230241.82046-1-zoone.rupert@gmail.com> <20261114013817.476f8fb9@jic23-hlaptop>
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

On Sat, 14 Nov 2026 01:38:17 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> > Read pressure first and take the latest temperature, as a direct
> > pressure read already does. Wait for temperature only when pressure is
> > not in the scan. Read a temperature in probe, so there is a latest one
> > from the first scan on.
>
> That was potentially a while back.  Why not do it in preenable for the buffer?
> Will make the buffer start a bit slow but should 'work' from there on.

Probe value only lasts until the next temperature result. By the
time the buffer starts TMP_RDY is set, so first scan takes a new
temperature anyway (checked on the board, buffer enabled 5 s after
probe). The probe read also covers direct pressure reads.

Happy to move it to preenable if you prefer.

Thanks,
Rupesh
