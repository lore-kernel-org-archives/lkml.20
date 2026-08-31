Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0ED4562B3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199887; cv=none; b=mfeUWcwlbtebXONmsPguX4t7eremi4LeZvKtqOoIfpBlR+gSkhIBYViRLx7o6L0Xjb4mP3oi9S5BJukE2TRdVePO/sa4sUtM+g6WjOvpcqna0rzMGM/kZEt9lJG8d4PFejf+pdyUUWBo7pah1GwmymZZyqi3cT8VcaSO2rQstPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199887; c=relaxed/simple;
	bh=e0muKbYQ0jGZZe/yf2NeyOp6Od/ZByLNgGEf/v1nleg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cc3PiHZCu54p8StccHSTOQLnflQ2ZexCtZinI/bfR0Tjm6ojHs3JHf7dHzNJrTyXu3D/CJlRvjysqwDUALB6FZrmuWXnRj6HLccU05gwxp1Bg2CBUIMX9Zu2XRYKcgELamGo0nePjF1zKtpfHS8svYiDObPqRsRYXLqWAg5yNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FSv577t0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FSv577t0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d91ded8174so13140615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199885; x=1788804685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXN0jN3MnwKVM8KAifDf5fdFy6y48QrMJCG2ssDq6qc=;
        b=FSv577t0z04XhiscG+1B4Es/09wK0aPa/+xym0bs1PH0KcO5UXTPNCiORjO9tD5GRA
         38dXgY7rg769lCEcafqIlY8tS+gaX5sBH4QMbRSqdhO4MkS2TLQWoyt9wkO73LADiJgF
         5pwcc89L6a3juu+7PgK7B0EqCB6ol8X11Pxu1kQmGQFE66efLt7Ecf29BPhcsu41vv62
         etJr19l4B7i36ca7ucSP8ox0yfFmrxdobOHq85+lh1OrQHT9DjO7T3ut2U0bMbAu8yOz
         lDgU60Dd5K9UqGl6SeltN2xAt/5HtUblwErfSCWHCDzPHeO1k7v3D5QmCA2iyv4Ef6PA
         HJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199885; x=1788804685;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXN0jN3MnwKVM8KAifDf5fdFy6y48QrMJCG2ssDq6qc=;
        b=iKaFxNmp4/Hgj7kvJGkHuz9o9knG01q+Wqe2YCHIckCpfyQHPkGgA0YXqJ1eohoLbs
         UpGAXyJ1L0ZMTsLeYPgAsS+Z/PTqf7+CCH9yiU/EnJSQ25EQIn5J70eljujVr5oB4j6M
         5uOEOZUSG1B9WYYTvA+rxXGHcqIYyoYKaBZWLlhNdqUgZ+L3+OoKnKfiDUEMs3VADXJX
         gBI2u8mG0QQ01wjS0ioKCcawt5YKWFjDcOy81CtnegNN3W7rDg5jTZEcuJDLhNbiRc06
         UhrmxF0jNaLT7FuK/Nv3rTZ9poWZM22Af5d6X+ukuRMezZN6tVLhxIGfyS4vC16ECCIr
         BHkA==
X-Forwarded-Encrypted: i=1; AKwUvBzlZ8ddU63w8C8tePmVHPI6VepaNejaw/RiOQtZGmxdrdwwfnC68t1XUTqccU4WOIIAziBQ7x/EzXQZj60=@vger.kernel.org
X-Gm-Message-State: AFuF++nhxuGrLCgP6ArOcub8vWPzc+Q3NuaQUfR8RcWFABoexvQ4y4B1
	5/jheiFsb9pAP4YtYmwX1z4P96MzmENDIiQDVz1BaD7f1GydflWX2KP00AwGbo29h/jOiqtP2X5
	bofVTJuc=
X-Gm-Gg: AYBFou30aBpEt8OJSUtazwIGsHL4812dUXOtI7vm/bibcxIWRZ1TojCx+8R6x1GsWEz
	U159g0Bi/ZJgJKqRl4hM/ZfUXnRviHqw7GA7DgVSpl4ZJKwlxHtt1hlH2i7OQ2tJCbISDqodL05
	17F+3GwEG3jFUTYFCNRHiTvVu9e+XwGwC5RpxBMeiF0O2gwmZ3fQkkGx6CZVg85aLP3SOPDjw/y
	IbGlrsKLGdPyuIItP+QU+EJSb3dQpgJKi9lN8wWS7vThymRlp4LfBkVjPYRnSy8Ys2aGTQTkyHi
	moudPwqRw5DzrDVR6NtM8wd1rFLC2Pet+nzSh/89Tlt3ChxPRbt+Uprgkl1QUqk2cc/0i5P4CO0
	HhQ0BsPBwepCfgLJUQDMeBO+rV1ODwtrVdJboDgHFFieUcDNRw4M87AVlP6nP4J6w29kwiZITMJ
	pXv2ZMVH06IFyVjc791mtESwBtN+DXAt92LIRbGxF7fgIQskFK7hw+S1N4BQ==
X-Received: by 2002:a17:90b:5626:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-3989bd135fcmr31021574a91.23.1788199885347;
        Mon, 31 Aug 2026 11:11:25 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d4ede7csm759296a91.13.2026.08.31.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Andreas Kemnade <andreas@kemnade.info>, Sen Wang <sen@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260709203757.2401699-1-sen@ti.com>
References: <20260709203757.2401699-1-sen@ti.com>
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable SND_ALOOP
Message-Id: <178819988433.2869653.5088764257816495977.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 09 Jul 2026 15:37:57 -0500, Sen Wang wrote:
> Enable the generic PCM loopback driver for arm32, matching arm64 defconfig
> (commit 7235cdd9cc52 ("arm64: defconfig: Enable SND_ALOOP")).
> 
> snd-aloop provides a virtual, cross-connected soundcard useful for
> routing audio between applications, capturing playback on systems
> without physical audio hardware, and automated audio pipeline
> validation.
> 
> [...]

Applied, thanks!

[1/1] arm: multi_v7_defconfig: Enable SND_ALOOP
      commit: b45c06f362ee5ce9ef6402fcf57077a740cf1063

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

