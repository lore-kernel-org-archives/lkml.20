Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A918C02E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780184; cv=pass; b=Yvg9FInlRkWSQMezJiXdBh/sEKm9UQ6EA4gV1a0nlMwb5K6g+0TqTQqBvG8e4Qyx8tkU8ZRJrTRyKPiHlJgBgzsPRI6/+Eh1SyBDJsOc8QxzlOMsYEvbXCbFRZMI5G/s0gZdVABu8RozjzVI8Hw3lNfDcNW3JX66MQr+TOub25o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780184; c=relaxed/simple;
	bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3kKd0tnsGdGtE+bmsYeKmbcwN0HYBfhevaUKwQDB1ma7boslCo6X1YLW+LvoyNnzfcD33WBm3XLT3+Ie26jMvkm+Qh/W4E9JSHxlxMfWO9Li/PxCsW2egQuhNXIv/zZcT1ZY36XwjfJ9HN4FJw8F6qkVcoAEzMhwLU/nV76G2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lRrwWi7F; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lRrwWi7F"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5337c7b9937so239521cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791780181; cv=none;
        d=google.com; s=arc-20260327;
        b=bIXeUyj4gljY38ILAG7lm6/67qBujCLr3yr+kmFzlyF1EXffsqfrnbfm5tSPMDEuzL
         GGq8QCW6xmXESNtcVaMXxg0opOFMS0jv0Y2Q7GNyL4d3pPrFJtLZvzocEDLFuKUelh8i
         2Oi9VkdZMTyR37FeSBER11Wj8Sej3BMs20YSUwAH+CbMPT/xLRa3mEFuf30YJtdCKl/r
         A9eAV728tFAiVfq2cBeFT+EVvMhYmBdGrzBS4645Q7frVVNngv8JzH3G/31wZIoZDFke
         x0Gu51ixRYm7VOJGlf2wdkZuhn7eclFCyb78OcaGRA4IZZuigakL9f7ssIRSWyCDOdX+
         sjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
        fh=HZWi/R1QGAmB3u5WePSBaIgo57zoYVR0utffVmvO3ZY=;
        b=nI80TOwTqjF1DZLrPRrLOEaX9uHW4BeE35etWbuH4dfInDcNxm5szVJAHyh5yaaxpJ
         fCoR4gs/sidLWVh/3iKRablMuv4UVMgyC+ur4JFtMahRVF/kIm7jtAkyW15xUgyi1Pe5
         OyEChr8+DCTZ8m4hYBo7VzD7XElJCjG088VQ6eUZuuVNvbj6hZOm0DW02QsRsBG61pac
         lGfU7RBrxLVZo570y25ZrZNxNq1FUU//FqHiLjh+soRpLtoRVYA4iNrMDbAkI7WIHbfB
         8z+kA/C41b8bxd7ItH0gJYPsM/C9uiahWSBi821xNjSxy8wk6ImIq/KnGwO6+05S2Rxv
         uJFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791780181; x=1792384981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
        b=lRrwWi7FcFUPHlfDXo5k7ZZ7zaKBuPGdktkUPvK2xQT1blRNakIK98soxv+hzvAjal
         mz+htGRZD2NIdcy6tBBo5ck7iDn+Vrw4YyXtFOfEb89sJKPNmpHWgRJBTHZoT8oUw1D1
         XQfmBrTl5N/5Jzmq3XsjQREf77vlJGoN6OZeiJFryOsFJ22py2ofsuoZpQCwoJ/VdSYm
         qsdG3dn4gKuRDAZdetFgcNnu6+R4lIAW9JZ6bHab8zYmg7DYSJvLQzfaYQXPaqlHUBNg
         Z5BK5sJJyVSyqmVmS7+QoAcxvup0m1LFnRj/7PrmnJ5lFyDiRkM9EV69wLURAJlrIVkv
         x7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780181; x=1792384981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
        b=qsJ0qVudpX+qg4rwL5ZVCUtoNI2IL/TF/rSr5CXSv15d4Y4gM5ECXE5n/NjB2uaOoK
         E8WYWGhLuEktVYeula7DpHf0z2Rh38E0UrPOiGhDkxXFzNeinQpiOn/lAwd51pzvhAiB
         lnMzbLTMv0KbDmG+Q2bl+0/c3g7NJBTjdKK995LyspOkUUbkRp5eafZnnqSGj3r3PM3A
         uFNJRO4NBKYcqkNKUYx76iiJumaZvZufWmMSyq+bfk31n/eRoWC/qbAiT0xfUcKToF/s
         +i7/VBeomEEDh2cxwfBj6GaCg4lfJpHVDXmyb4vTshAvU23CRSiFpPbDHf3rOGi9Im4t
         E+Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxd2zWNaYtMX38ZRq5nQnjWg1vnmJPfvTA1uovw1b6srXes6dAq3ptTq4GU8v1I9KM+RfZNYffB3IZxa8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEkad+UxBhwQrRMtuK440mrVNqbTAx9cV+y5Y7S/Y+NdMRdvhO
	nfKQ45+BUNRwm6aGCL3YBR74QWeCSt5g9Hl6AeSleS6dV2hSugaxOSM4vb4OnuyQ1B4fcjG/E7F
	Jscwu/Fh9/0HS0MSllcZPTNnB/5iTMqYcu+bCfZ8j
X-Gm-Gg: AYBFou38yK1MyJOLzKqwc5iWFalxsQaRl677wxSXal12F+4OZaCI9d1ObqA5lKDSl3N
	7YkQ4XGVCy4A//d/1pRlznc/CNOj0oAQpVaFdKC5lYyYoBbSwDhKWh2vBnz3RJOZA8uwmw3oslP
	I7qWccOx/kxl09iNFCGz5BwgHj9c52NjdmDkLS7FGt4zE0rx5+ght5rvC3/KNL720YiaLf8iN9N
	lROw/taBINAxSwVIDWYDLCHc0TTtZDBJpBsqd5uJ8IWhFTc0VshexbPj3fSfBFKnB7Frph4hXyn
	vNl7BZjNyZQ5KFtLpv76VPIKy1JOHDxWIKsf76QpdDBer/ohVh34vBVqzeSKNM20GgZB64Xh0R8
	BM5EeFUMGsA==
X-Received: by 2002:ac8:5a0f:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-535b2d9b1e9mr21987221cf.1.1791780180731; Sun, 11 Oct 2026
 21:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-u-ether-gadget-npe-v1-0-ff466c55ecc0@google.com> <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
In-Reply-To: <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 12 Oct 2026 12:42:34 +0800
X-Gm-Features: AclHuK9p36YBKHu5O0EITzYbC1tM5lufGULED7e72-TUQxSBC9jxELhTwbNAaGM
Message-ID: <CAKzKK0rNQ2sM8unChj7Ya76ogNoPCNQNx1X8vu1Dkg2FwRfv4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: gadget: u_ether: Fix NULL pointer deref in debug logging
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Faqiang Zhu <faqiang.zhu@nxp.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:59=E2=80=AFPM Kuen-Han Tsai <khtsai@google.com> w=
rote:
>
> Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Closes: https://lore.kernel.org/all/89e19e6e-7ee7-4bb0-abd6-60971b7fd601@=
gmail.com/
> Fixes: ec35c1969650 ("usb: gadget: f_ncm: Fix net_device lifecycle with d=
evice_move")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>

Hi Greg,

I missed adding Suggested-by for Ivaylo, who already mentioned
switching to netdev_dbg() in the original report thread:

Suggested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

Could you add this when applying, or would you prefer a v2?

Regards,
Kuen-Han
