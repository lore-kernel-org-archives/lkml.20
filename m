Received: from mail-oo2-f15.google.com (mail-oo2-f15.google.com [74.125.231.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664039CCED
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789305682; cv=pass; b=Nfm11YggFrJcosm4l5ij/sCBblbzHo2F+AfWUwNB7Dvd4BEVTg+AOLTFWzGSGuhTeIhpP/0zACCUMK9CAjPlCoMG1XyN5/Ldmkk0FuOPX2meKtZh3etPfeUptx/1vaYC1+VOfPt3tKy0ek/vHo9eJOK3/xCKjFkJDpO2G9dl9bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789305682; c=relaxed/simple;
	bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8AaDOAkxSl9S2cHycUW2o2QkmYZkckA+V2FzDv6eClhhNaOtRakcI94UXeqeTT5Am0Gk2ZdXLA5f5e7DVr+vLzm9SFOAcLkINtVIp+u9HDUmvRrUWu4aJoA03VfBnwbypz3mVEc9olrfAJcQCcEsGPEmpqPtwP7lU7v744tWjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/oOLWaZ; arc=pass smtp.client-ip=74.125.231.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/oOLWaZ"
Received: by mail-oo2-f15.google.com with SMTP id 006d021491bc7-6b4bff33d18so349024eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789305680; cv=none;
        d=google.com; s=arc-20260327;
        b=mgCvrwB+XzmH/gri+IrTKty5tWKogGj7qHzSUeG5oRx9vBbrXHURa/tFOd9pV1f+ux
         W1tqugprz0Ujpk0KXc52Tx2HMMs30fY6wnF34LFEb2Jnzn6AXcgoXbBe/rnzo2X+GrOz
         DX0EynZ/bsqXvs4kUN+q1gMKU2kfEh8/q5tF6DcLHjpUm/qru0lQGy0WsPXKLjUoaO+f
         5pmDXS0XjgTWSBFt03k1AEgV42kVTkkz+m1djt4DLDGbWlmciMUsNp05cVoaRA61ye3i
         6cfLDnrytNAqMVPD3G3eAgzTWHAYeQgXWAHsnQFaJ7YJewTdZNrEvbqHsQLDDErDeiNI
         HH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
        fh=x68+OxLz5hmhy9erOQX/C5nknv1El2D7X6aDZyWjZ9E=;
        b=rf4u4CMSXaoACQzMJUlbAfVAkbtQk7EDTSrJ0IQM5yn0beYp3lGv03U4P4a0kTwGql
         vYjdVinlEY++tV7OlcG5upaYtO2Tc4yIK3294bW53d09c5SxSa8um78uX0ThqACpI3sb
         EOiYF5txCUO8u9eTd97GzaP6tWf6I5KgREnWAjsda27rrHJotzIKegQXQ7/JhisTYHdj
         yqLtHqO6zH3LGtrAm6UuXPVM7a364NeRsZTqrF1AgQWEHztNgQOh85IwlxS7+WTrgxVZ
         0sNN6lxb6a/oPRmkI6lErZ35sTIVKkNug524akuNeqrxfXP1lfHUSl9jupRX6gqXCGw9
         csLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789305680; x=1789910480; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
        b=L/oOLWaZX3FJqLPy2f1WZbsAGxZEnBhNcw/6CuLtlXLP37ada+l2+OmpWlgScPZC67
         mDIxpYbH/Xm2cSa8wq9nsVfeYdsqDZVlbm1sAgBWaR8SyYoawIX3Klebytz3a1fIf1MQ
         rp6fykUePvEMVmXgEwTp0n3GWpBwqbihoOJGxJIZaD6KIKvUcuFkUoUzTj7OWl5X2A+k
         smKQ9QQ9ut6bEsCBTpLLHyzhXShOhzWghcEw+3vXROn16qBXBmvPxoWqHOGR5XTnq1sR
         9Pb6Gw5K6QmORhRFPyBd9XzeDFHZjOGGOr9PKZu8I6pGNCFzVjegfU7q22Fz19mS2Dyc
         XDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789305680; x=1789910480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qruS9RaFpfludketP5nShhhjtDemkZaJSSVTOVH8K1Y=;
        b=jYe5EYEvYwmiKNU2cbQN1/pTDyRM6hds9gvrHMMi7Lj7r9DmyG21y8NMx+TR+raeC6
         o6XREfV/WU6E234cAjybSVFtUOIasi9xMWGQ2DUZw9LPJC83umy0t+UfciSPhQJCD5pL
         H7pdPEhFK/iipc5gogC23O3VTealBifaW26PI1WSBtD9cJt7SXwN/5nFw4uTtbCdTUri
         7KpgzFiLCQE6wSJ8iQbTuQlBMosn0U/g0E/tlR/OAvlwgSBMUzwqbRiouR0p8nOa9pD4
         AjL7JVccO4KyEBo7QL5uAJalJn1G4vNe94oHzwLjpTr6fa61fS0HRv9+2YevzhmrE+AX
         w6cg==
X-Forwarded-Encrypted: i=1; AKwUvBz2RZCEyP6P50U4RR0tI6MjbKV9sAtu8ThIBcB5+htq0PdLBGJD8abI2aOKwBpSFNQBQOnWaLBPsNG45Ko=@vger.kernel.org
X-Gm-Message-State: AFuF++mPOf26v4Y+G906QQrNBfW0xR9d175Jr2p4WydVEryFFOnbkKz4
	NIegS2DyhDbIFsR7ITxgsuM+pOhmSZ9zf1ve0iZ/8UBTWxbm0b5ktCXpviwbNIjbouShHjc7weH
	JySsbK4qjMc1baCmvv+jrVlComrDd/cM=
X-Gm-Gg: AYBFou0c/NkwD1u/ewMrod/klOZfah8tZLEbkZgv/TgWWWKVtvX9j78V7sfcrjEhGfh
	dOdvsxYV94GmD1UHlESL56rjZujHyEdNgiHCejQjxOv++AgcEGF2Dl0jve7URaYCfPY3keFWH8A
	XZxwpjNaiqmD96G21uFxN6TcchK/pgK3HnKFunfnoa5eib/jQ+n45li/JrXUcUlU9WlnnMjElk7
	UfDavzigOwgQA0dJ4y52sVsaOUP+eyiPSKTpjUUnJcoJ/OJjcBo2wh7WrbZXw7b+Nkz7iH9yjD0
	/TQi/peFSxjSUHEtzSgFsQeBiDZlGvxc3Ces6LaQ08TTpuY9sY+pWA==
X-Received: by 2002:a05:6820:1886:b0:6b7:8396:f3e3 with SMTP id
 006d021491bc7-6c25003a9d1mr3486566eaf.69.1789305679912; Sun, 13 Sep 2026
 06:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
 <20260912132517.55686-3-abdelnasserhussein11@gmail.com> <aqZc3LR0s0I2S27b@ashevche-desk.local>
In-Reply-To: <aqZc3LR0s0I2S27b@ashevche-desk.local>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 13 Sep 2026 16:21:08 +0300
X-Gm-Features: AcwNN1WsbiyGU7uP4XszH5roX0jEFpFRx8lXN2O10Txdr0UEK0yTaOMrsHkr1Cc
Message-ID: <CANpqX3YgFne0HvC4n92R8URm3cC+gdRWsGo4=yRkXkXf1q5d-g@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] staging: iio: adc: ad7816: Serialize SPI read operations
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for pointing this out

Placing the mutex after the `u8` variables introduces unnecessary
padding/holes. I will move it up in the struct (right after the
pointers) in v7 to ensure a proper memory layout without wasted space.

Thanks for the review

Best regards,
Abdelnasser
