Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBA3E639D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791701819; cv=none; b=n2DsJxUyIj+bf3RyxtLk3idJngZC8k5ZIZAbrUhk4khboh4znf5DL/QoQ35GRwWEbjl69Puzh1hIx2gs94ywq/bePlMXJXIWcczTIdYFk2KUyo0W60xAWeGJ4QFLHZ8cAXb0ZYk3SXacQIjnWRI16rLpoqAXxFKRVlYql5A8gYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791701819; c=relaxed/simple;
	bh=mS5lX8fFZA1W53rHD/knA2txzovPkZmDhLKWmPwConE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvVhbYGU7kXwWaU87mdX1FS76eOBuUp8Em3MKVRuEQZA7AsbC+FwtTseM6tYwc+5fXEuAbxjctbYI5exlZbXZnVxFHIsGTkLYrIeJoJZlVXM16Tb61aUE7LMReJikb0Ene1AHrdNVZ7aOz1s9bnU7zYy/qz/m+7hgOSW9M0QQrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lX2iTk36; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lX2iTk36"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a166199820so5386015e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791701816; x=1792306616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS5lX8fFZA1W53rHD/knA2txzovPkZmDhLKWmPwConE=;
        b=lX2iTk36r+Jn5cI0FtJ8Nq40yPRLLGntR4Fe4fkOubNsc/ehGWNf57hGAn3YLMj67L
         qgn82J8eiqQf3heV3nC2JuEyjmEhaRBh1ufIF0JBe9aGuTQPe5V4xrqmk5eEPa3dgB5h
         /FTOTuq9u+Ue7A7fQ2QKDfhXRrbZljKLN5XF8p2Fesu6dxysDuWCCpD8twlLHJEleFo+
         PChXKlhE4CCientVZlWL3bQdkLtkhnMgNMKeJQr5Za7L+2tD6s2eK+q/1fuJrKOGzjpd
         G0ObxJDMso+pGwso6mblNFpbS1ZiVOKwmMRY01woux04vwt3c9+bhzBi/QHaoOD2DYsU
         hCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791701816; x=1792306616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS5lX8fFZA1W53rHD/knA2txzovPkZmDhLKWmPwConE=;
        b=XmA1r5ag0MDFr0vfHeFnQDK4seRIt7YS3GOHrvCr3lYYjq+ZnJEk3Ky8QczvZZ8M3Z
         5wvCi6C9QwRpTDi2xIvUByKCyYIph8bM6zJsYN7WyB3dgxXt/B0Nvo7zjrGWbqU+vH43
         /B3s7VPlVh0ps6IiGu2L2IrfS3a7dFV9U53NMqajWvdLucHBjSRXMu3DyyXBr3pBgghZ
         M73AnLVgvl096RYUw6+V8uYiEEnpeSxYwRkCh1cFkHPIfkVrArYUyYjx8lbA99BrraF/
         U++Pp03FEM6qZePk8Cgrgv7mL2/TDy8tLrNx2JnbyJ9HaVX8s/UoW+8m7P3iZbI9g/pu
         Ta5A==
X-Forwarded-Encrypted: i=1; AKwUvByutwuNdm6dE8v1IMUatTbm01b//MztURyRKodjVrVqbxVukl6s63QAq3jpSFIS1LmkHZuaJzU+74n+wEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5/o+claHp/xGSZL8jDvgDYg0swE9vhwu8Aj9RHFEkJ0bdg8iH
	nXefPbeOaNCjwkDYpWyLRW+fiKBnsrFOytV8vKldYznWZRYJdTKOk8tK
X-Gm-Gg: AYBFou1X6jbHZbQiVortTBqTbg6ZStA6uqakf40p3074ZtGzZkXhed3KEK2WPYhCJQH
	KjuC7NpeXIwi3NdFkwxN1bRlADiRjNOV1bF4Vv7Q+uLzi/v3GGOwHbYhNYq8ZTJCXkJKRtf8O85
	6kcjQl1/sexfgUvr0S8MxM+Sf2Kk542Us9sC2nUIun5PF0p2Jx8VCDRjRcAPUiAO4wVTjwyUWhl
	ZrY9YJg54jkKOntt99cjd8QUO8nGGIcJZtzOaB2J0ZoyopbVIwbRQTBWI1IveG+rh5xcw+PhTQ4
	jurBvVvMJjlE6aynW6/yP0Rje1PcteFrVBXGJGFqb18zuxLj+qWJ4H3+DT+piWlQntfyMSZBrha
	/yGlTyWzEW6cdNTlctTIFEjeZUOKxT2HoqYpGhL7oh4dQUZuED8pNTzH4cgq97HUjUNeUJ/csWz
	EfUb9OsXLlnc5ILKr/jSJgDEgzsJZcvK+X71h5IVLKRBPrqXGtJapI8iKVIwKh+kaFouaFPWSuO
	hE2dGuC0QIA4sy1cBaFYEMlJSdflXvaaQ+02K4vjdcagxkC9ox9J5muD5Wqp+G6kUSnbfPYZoPb
	4bYBo5+b05KoygQj
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a18e4b1311mr110609645e9.17.1791701816232;
        Sat, 10 Oct 2026 23:56:56 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1900a5e17sm62584695e9.3.2026.10.10.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:56:55 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: octeon-hcd: release the USB block when initialization fails
Date: Sun, 11 Oct 2026 06:56:53 +0000
Message-ID: <20261011065653.2374089-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917072144.438023-1-orgads@gmail.com>
References: <20260917072144.438023-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

A gentle ping on this one. It fixes 22bce6d2b3fd ("usb: octeon-hcd: fail
the probe when the USB core does not respond"), which is already in
mainline: when the core does not respond, the new error path leaves the
USB clock enabled and the PHY out of reset.

If it looks fine, could it go to Linus through usb-linus, next to the
commit it fixes? If you would like anything changed, I will respin.

Thanks,
Orgad
