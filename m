Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139F330B07
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538469; cv=none; b=IS5GZuTHxDCSw8zlybMrfMpBtsqrT0OPWBPY+aYL/Ey2DMNRBubUfdXnqBhtYpq0QYXgbbx9ZjvR5iZa3IUIvGgQEiMELHUkZS96WgOWeiZUJZV9Yh7ndajs/NzHvKV/uUyDNlTs4fFXcJoj8LOhuEbLAiT98omh/ScmGV6ERbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538469; c=relaxed/simple;
	bh=XUtnp+JADse6tbTIpqBlX90KrkWPNgb62TRGVh/J61E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQrXNmqG78L2FcOHcGjUjInxHaeGrDwzY5VEhoq/MhNdnuuga/0oEUsu3v1RiaKGZ12WtukRrWDF9XNXGXnZG1ewICFqxIwQlp5fFS8aRydv+N1XudC4i1HysrIDHG0vHqcurmb4gDAtB8NT3wJ5iHjCc1sqobsHpb0Bgi/RXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1mPQcyr; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1mPQcyr"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-465cfc7e33dso757048fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788538467; x=1789143267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUtnp+JADse6tbTIpqBlX90KrkWPNgb62TRGVh/J61E=;
        b=p1mPQcyr7PJDZ8ALKPbtsamyACmXdkR5ScI9SNsGYw57QB5HKFsRYQeFjM1iHsB4ax
         GDvX0iueihtRLMLXVw3Mlu5NDHBo+9F4YSB/ITcTamjoItz9KHOJRBTpPXE9tY8frhqm
         osntFh7dkuOhGnNF21bllcAF4MNcjA7QTjujDBvglIvGTU/mD1AdYQculu3OvXiVJzVF
         qdSpuBkAKaF+L9JsoHFdM3RNBnTGo6k5m89PdNEAQQuD/j2Ooq5X8al3QbX67yc5YXKu
         XUMiG81MYt/KZcTdeU7r5yB0okE8ehogdQupPApIAc9KVFKQLZzTGlogOGAE//Pc7HVu
         crWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538467; x=1789143267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUtnp+JADse6tbTIpqBlX90KrkWPNgb62TRGVh/J61E=;
        b=PnzhnIHra4mPabJ+sTD0F3evmfbv9ntBT9EHXCNpyWFQGZmbLFe4uj8hB5uH/CAVHv
         NkiGZ7+NTNNGW1UCzedFvSf42y1r/CneOXOt8KdKLo+7JPxyu0MsZ0/d98fZ6wXtp3dP
         oBkviPza9p9gKBcHXnqVG8l8R/rhFD2+38hY/Adts/eRb+Z37rxraxP064GKzyenQ/kM
         GxdjRzSlE96yCEdMFvt71Vlpsmnt+3emM4Fqus3fqbAJzCXTjVMNoOGagwDDeRGaDRGg
         G1h/siY0ZWcO3xK+e0S1OR//yX898m6cGqShlDcH0Yz02MJnsTu7hwx4DGyyNdv/D5UQ
         KRJg==
X-Forwarded-Encrypted: i=1; AKwUvBy19xjXkmmnCZxECH6BUxlNdvM5mHJ+72rVCEzH8BmrrUXj7mSB7v8h535MxXhKjP8bQPrbvOgGvwticH4=@vger.kernel.org
X-Gm-Message-State: AFuF++k8z+X4sDcjRivsosQ7vHlZhqzjSO/nYdvUvqPyfavD1CrNusEx
	vfvuABwVdWdSsh+54NLSdH4scAI7McKqJrgCmYEHFjC4zUh6gPHEqTep
X-Gm-Gg: AYBFou1AtEfRtMtfV+V+6Q7XkdzQA0i0ARsJ7hWZrrX/EPRrFWYo6CPytafxg1UsmkJ
	DNuxWm82+m2LNlAaxhGOp3lD6QoEkt7JoC9eyTBb8QW9lCnm0AaEjCPeAAPMKZlpmTDd1yxi9+4
	b3ZaX3vN685GeKzcEpc6/5CNc+4nvyt7+3IbhsNfR++gZA7RVv0QdLHnvzyJd6IRIK0ZRjnsQ1O
	I1B2cjm1CxXBh5F+biwSrUn1BF6g5NXXCEaq0GbaZ3qW/zriD6DcHh6/jMOY8YfUPzFo0Ce7FgX
	Ug6nbRKekop8pfy4mqYyXXtWjBarQzYY2rPxsUSPcn04NNYFMc2BNvgvwJf46hdjrW6YZuqD9Ir
	mrACrQKZzGGMuO0N/t+uyWW0BxtS1+z15OISqde5NcTSuAG0OwaMMHD0fcG7wd/CvLf2jxZQ/ug
	Xzq0t6huaZOHdVP2oKIj4lPZnASEiPygdQbLvdkmNhH0OCv13R0oLRNk3ZYxZYhDfUngT3A/elr
	UhKQ01KcHw395dnrjCUfTWgt1Yhh7c=
X-Received: by 2002:a05:6820:a281:10b0:6b7:8415:d798 with SMTP id 006d021491bc7-6b78415d8b0mr2054381eaf.67.1788538466305;
        Fri, 04 Sep 2026 09:14:26 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dd07214bsm3597912eaf.10.2026.09.04.09.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:14:25 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: Re: [PATCH] HID: corsair: cancel worker after unregistering LED, not before
Date: Fri,  4 Sep 2026 11:13:54 -0500
Message-ID: <20260904161354.159922-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904145330.BD9E41F00A3D@smtp.kernel.org>
References: <20260904143610.119808-1-danishkhateeb03@gmail.com> <20260904145330.BD9E41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> - [High] Reordering `led_classdev_unregister()` before
> `cancel_work_sync()` reintroduces a Time-of-Check to Time-of-Use
> (TOCTOU) Use-After-Free race condition on `led->cdev.dev` inside the
> worker threads.

You are right. Please drop v1.

There are two races here and each ordering fixes only one. Cancelling
first leaves led_classdev_unregister() free to re-arm the worker via
led_set_brightness(LED_OFF), so the structure is freed while still
linked into the worklist. Cancelling last leaves a worker that has
already tested led->removed free to dereference led->cdev.dev after
device_unregister() has freed it -- the race eb51c9f8cb4f fixed. v1 was
in effect a revert of it, which I should have caught: that race is
spelled out in the changelog of the commit in my own Fixes: tag.

v2 uses disable_work_sync(), which waits for a running worker and makes
the later schedule_work() fail rather than queue, closing both. It also
converts the fail_sysfs error path, which still had the second race.

My reproducer only covered the re-arm race; the other is a few
instructions wide and I could not trigger it. v2 says so.
