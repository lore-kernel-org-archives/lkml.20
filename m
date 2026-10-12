Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5A435676A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811352; cv=pass; b=gI56pVaCg7lc/WWxjXxrIDUPxOwFM9wxxOFS6lqGk8DRo278AiMckG81U0qcnACGAG9MfnjXQAUi46POj+xROVWPhQPcgWWBROZl+SQ0wHgCY1jqH8JG/tR4n9RoTKtTCh1o3HOohdOGMi3XT1NSC83dODF5QfdF+UNtSWfU/g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811352; c=relaxed/simple;
	bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h36yJFrhjCGitqOLF9E37FzBTQwsW7Q/dsLFbN+NjR4aSKHbf9JvJwXGUGdP7BfE9PLzrfKRprYAtRAf6Yle0lZxMiAHScrofzobcIGFqhwhT3CvWZwXZ76zHxUEYvfUuWOFu6k2k/AIvZ8943ifGCCAbEXWaHZcpXKRdvnz428=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKo6vr/V; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKo6vr/V"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451a49abd8aso1779412fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811349; cv=none;
        d=google.com; s=arc-20260327;
        b=W86Ke7xXIAr8eOpsVVA8XpLtmJe1v9Hy6QAY0GYRWtvoMwualPvo4WV2f+dSSFZ/qW
         jlmC4B9E+RR7Bs4jgIPCobqHn8pIyZVnmTW794RUVekS5Dd24WbQO7wczBEDnovyfO21
         IEDBMKXR0lXg1vwrljxgpIWWzqM1aRH1aju6X76j+2qMy8yDKUK3WZPajKxf9AqCBQDV
         yIhLMU8hFtIFhzpdMZeY94Fj3ncDEENfVbG4ZWKroMgpRKmSXUp/XZ9ucHFwnRr6E891
         8mmuwkxJXwvRIaNWcP5dmi9vJrF7G6e1ZtxaRVKjfLpDph1PDmJgYmAI01D0fYtR607r
         c/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
        fh=HVU116SgWC1YaKuhV/qSIt4nUnlWJ5qEX9FSZQb1Xfk=;
        b=QGnDol6qeqpCZNcXYBG1cIA/LVbisaSjVoy3tQHFwKewBdTwK1SsInzG9lxmdUxqEE
         5IA/bUa8pDl7/tJsNKAS8PeZyxyMFU2LOtjCRXrlXE3vzbOhUpIhy9Ovq7VEOSQKEt6m
         OcDFhAO567WuGfVy5F4QRZlj8Ubpr+H3NrWo2dBSOARk8EGH1BhTuljTXa8QY1nc2zHO
         RoFEheaaNs6/RRhLm/OPNaGfx4ixe24j7KEntnSoa315CMVLHmJjK6t+92VwGrrEiH1u
         yKYhwhwI3YAN2+vG5He78117AgFiYv1EwQEE34Kj9s3q2xPr/0Yk1kkTRnUICR6ka8nr
         cgTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811349; x=1792416149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
        b=cKo6vr/VBna3UoL7i+xzwpRUrQav/SV7LPJ8lD7uZGErUM55kdnQUkIvwYr34v8kTE
         Tvk0Stfa1EfmjASvxkYPodAEqDBDVglgVndyf4ESDXMiKV3Us/AHTHZg1MbgytsPxKl+
         kEY1+fWZjJlkjn8FnGn72u4DSXKG0SiMhaUt559m8NY/JAnQ+Iu19hHkpzwmy2UcNHqp
         karcvehK5/Nf5rT2B/s35WCHEl+31P8Y0LbM/wfH43KgZjm8J9zmsPyzlMe1h4PAxVyp
         ED4kn0Mtoy06gOV5XGxC1HMZSLB1QVHPQ7zkJVnPwZe4MFdsAkhF8qoej3QnnFgmm5sf
         n+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811349; x=1792416149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
        b=UcYxEJCwTvBQiWa5FHqvx37hrvFOIBCd6D2oCDRQr6XYxq5/TPk1HX760eLOxvRwxJ
         yfBw9QohyX7g2SFfq4A5safHAnt4AdFJDluVYwV/I3gJ8SpzN5KCxnCWO6OGEYwbfzph
         81x4c0fY82l+IHRGy2lv/P+pZPc89DI0TCckZOWlVTRLPOKkehUyTMiGNhxgNQPKjfrW
         y9r3MQBb6xYF2IXewYQRHFiHFIwBdLkJuYR/ebIbMEsk69zLpNjyn3oxh5qt1Adad4dq
         seGCHJsC6oKxuTPIn2/QjgDzXOZPbe4JBVfMaFCUY19DD/HUTWE2cJCVOt+l7gbXZj63
         5F6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzB5z6Z4e5G2IXC+E7vXbgpPiwWVLiGwVzQR3Ns7a9rJRGgL81iRMnbqMYDJ0LlyXaRZ0RWJ9fIpOClec4=@vger.kernel.org
X-Gm-Message-State: AFq9FYILxarV4TZUa/YWRD5UfCvhfjY1ZjJ1Mscil6rqRb2o80Apu/9s
	Rtv2yfUE9s8T2xYmdYrQmafo1zVgMG0XS+zKId2MbdjjfJYcGp/Yv5e/wOSGp+UkCwn4voGSq2/
	zwDUEvbGZXsFW6YR7XBt54Le4tDhwT84=
X-Gm-Gg: AYBFou3JgerlLN71CT0zj9kCeEIA5QyLLpHTUNEQWQ9zVGu4F/7wjRzw0JqKj0aXPEl
	ZqI/voSPqSijqIAoqfNNQZzEXgQte16SoIpqx31+OjSTAwX5f6R/Le5D1LcbxDxO+bZtBqe6F/Y
	WUy8h5S9PvTAQMTCaUVGYey7MOSt0S/VfVfdfEsvlIIg5XTim4gLsZHsgYcGQixzUghKnQL5ttg
	FISMiV6vFkXvGyt3EbYthcBr6E7SxRKO6KbAcluSiNzztNGoixJnlYMcjaCAidRKl+bZbvqsu6p
	iYUK3UDXqVjC767l1+PxQroxjN4XSEaHxCVV1aT+jQcbsxGwEI8N1WYE
X-Received: by 2002:a05:6870:8929:b0:49e:f7c:fa52 with SMTP id
 586e51a60fabf-4a2a8a649a3mr7055634fac.36.1791811349384; Mon, 12 Oct 2026
 06:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-3-abdelnasserhussein11@gmail.com> <aswW2bAapx3318Zd@monoceros>
In-Reply-To: <aswW2bAapx3318Zd@monoceros>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Mon, 12 Oct 2026 16:22:18 +0300
X-Gm-Features: AclHuK8W8Rlm4uemP4cn0xb4FiJCWYATf-Tyo02d_DefuCSU9DtfwEC-86YeR0U
Message-ID: <CANpqX3YqJ307B7p_q1UsZco8MEfO8-rGdaUtRsa20KahxpJ9RA@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com, error27@gmail.com, 
	narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Uwe,

Thank you very much for taking the time to review my patch. I really
appreciate your feedback and pointing me to the correct headers.

Your corrections are very helpful for my learning process as a
newcomer, and I am grateful for your guidance.

Best regards,
Abdelnasser
