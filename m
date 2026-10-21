Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606788;
	b=rpA+ZBS5qt98sxMI9RdwaL4pzNBK+19YRbGRYii+iet3oRtiSt7BWCwKtUoe5cKcdVjB
	 nmJibN8AJUUisUN/E56ye1rVTy4GsDEFOdqtln7sG+vyKMG2IOraIsouIfgSLJ0h7PHp6
	 wACRfoMXD9+qBGvIyUKjQQwPnvTlB6rzZKGRsqIcPMS7/N86aUSkvVjoZsSJc/qzMdiKW
	 utRPhHGv88CIaMoXA0mMYOyPsb3bKUIDIIjDVexscktr/IjYoznrFpbXqOePMrwTZPQIG
	 ORwKfXBCBhYPQQOCoQaxfAr2uMkU3Shni4Jh02BF/tlD+IVPY3ibbkSdzoFe/8/IoiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nco9E6pnxf1U90wQWWUGgERQdyljr6gpJ4DY5U+hjP0=;
	b=YhFegAbJLVM8rZ0BrGVeU2M5TSGxZlWgbm8hZiXEbMjCwhT6cEIEv2TncP2SIo9blFW+
	 TFn6zjwgwG8ycaps4ndvaYRDRXEndRTbRjLh99CTOUc7xM09QfiBdPQltdBWaJgVNvUxj
	 7cu91NjrFO4PKN2pH6TGC0Mgq1ngz6BQ3JFVBGwTvrl3JMyzPtAN7d4fK66TV5BTXsld+
	 M6Lee+EPKaGQpXx54ACDDbxWf8tFl1RV4PcGZ4/IvDQJ53MgDXFIYJhTaJuWacNTuIA2v
	 pxl0V8+ssVEa2vfRyzccvMVkDgn9+bEKUVBmu65FgxF2SQpfZGCuItT23SNi/YXsp6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAGpfHyV;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA6606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEA6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAGpfHyV
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcc6094d7fso821093e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792606786; x=1793211586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nco9E6pnxf1U90wQWWUGgERQdyljr6gpJ4DY5U+hjP0=;
        b=qAGpfHyVfaMIH7CJNiBwxj9rv0Qe6qb2Bz8HH8EBd7DU/Gjg/s5+p/zxDysVJdoVt6
         gHm750RlBqNpmLp3R2mVgZtSwqCnC0mWd5rSRkHqtSt84k55Wem2s13Y8Tqt9qR2pvTc
         amDxGM37Q1biWEVVa3KpRTDLEvBhyEsuBj1Wu+N/uzl3RODyG/at0S/jTNUmGum9GgqG
         yFqFiS8iKcOn1B0og2Q6mWoyM7sF1uBmIH4fPOrt23TZadX2ELc2fy3pYnR0e9VRRekp
         9aQUnX2VNlMqn6+hspMHTJwFuaPFnV0IqTAxeQ2RZGFtN/tP1+FnB7Ra0ekHtOztob7u
         4QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606786; x=1793211586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nco9E6pnxf1U90wQWWUGgERQdyljr6gpJ4DY5U+hjP0=;
        b=PgfiHqijJaidEppeQtsRa4F7KsgPX70Fm0lmCobpEzWoH4QS90dTv97izDS3i3LKrA
         PeO3uKTnoXP4L9GJlFafFNWq7njs7B6xlWWRs8m22Ne4p8twt+AIbqDrhHETYz1PNSYX
         v5FsqRDF+mN/wIplO/F6Q/NbregJARGSIFODKjuSe27HCz2sDnJohITHziuLQO1L/CCM
         ywpJhdnPfvZjVgbb1LTU4Q5m3SqW3Hhgalo0sukyccP80oUKfO78lwcIaXmpE/MgJrIc
         SnT+A/c29x+QdZsQRQO78a7xXxjPVUw95aeC9FLsQdDMAQlB3yYXiAdvarYRnEbyHPXP
         ulOA==
X-Forwarded-Encrypted: i=1; AKwUvBwSi3XQUSjylU2mRz923qPAw7hjFmw03xMQAjdJkslirPue0DMzPgYh2o0LkKyKgqDImWmzCD+3jFXcvqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7MwW0FjcZMtdfTFs5FsgX9NNPnvqolbWLA7FR8QmILWShjhKf
	vqLjA6KRv9e7eWhJMGHzMxXANnklZ3u1/nO+GYGHRD8RJigUZm0MwjSq
X-Gm-Gg: AYBFou1oyWC3+S5mgpIIbVP/hL7heLkmYdFtVir7jfcfqDrKxNh2A74YR5UMaaafO6H
	KxBqafU10LmgJLvMwPzgd+7LoRV6HArGddCSNqBgRk2cn8j2x8lPfX13Dwm1/ODJ86avK9dttKg
	q6OeXYq4oH3g3aR+46wiv5I2VW4/WuWjSmgE7boAYmcAECCemv14qziDjJlsUNpwYCI4FQFtIbb
	bjMUmB013Z2Qk8jOMzgMzBgFuSgn+dWNBGAcfVEuBfBjel13/PdNW+halmi44k/nsKFe//ni514
	WkU+l2ScE/nTDcSZfU+VXN95MrDS/yw48ff/QxRW/lIMMWLn+do/2kW0p98ZbCtbKWjDLIyAl/j
	wlfl6MaW4roEpx30BU9aLtYjIWXrasYPnh+gr+AyRSwek4hZJQHSlAf2MOknC+J7t/5N79vYToA
	vrQOSA9jaiWKuu5zDvswYp8GN7hcHK5qalmOgWUpF7yI/ySszR7S9zez6c0T7OvI3j7B38uGUjM
	cLPntRKJcS0PqXJnyG6fGdiwR1h7Qv2zoLwPZfOmqMbUEbgIRciwd19mGdnrfaZa+HCXxlTuGI+
	y1OspeNRvoTcpqXgSfWQBgC7ZzjSzxaCA1Yuih2OzRTg6DuC/UIlS+RqAY/D18A=
X-Received: by 2002:a05:6512:3e0e:b0:5be:488f:6008 with SMTP id 2adb3069b0e04-5bfa1ccefb3mr1270192e87.15.1792606786005;
        Wed, 21 Oct 2026 11:19:46 -0700 (PDT)
Received: from yantra.. (nekmmqsaylkikwvppw8-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:10fa:2e9e:78b7:e58])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa123120asm649718e87.69.2026.10.21.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:19:45 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Marco Elver <elver@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Wed, 21 Oct 2026 21:19:44 +0300
Message-ID: <20261021181944.14272-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3f41338e-fc47-4306-b68b-5a81c26027fe@acm.org>
References: <20261021052435.112686-1-zoone.rupert@gmail.com> <3f41338e-fc47-4306-b68b-5a81c26027fe@acm.org>
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

On Wed, Oct 21, 2026 at 08:15:20AM -0700, Bart Van Assche wrote:
> Why doesn't this patch set CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y?
> Shouldn't that change be included in this patch?

Fair point, without it nothing checks these annotations. v3 will enable
it as a separate patch, so the fix can still be backported on its own.
