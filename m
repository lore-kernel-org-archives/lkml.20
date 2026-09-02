Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238327BF93
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311769; cv=pass; b=hLQRXftS7tYQMlltUZvGnAtxAOrevSCeN8rzFAs3U+AYmMIbQoxTEyfwISDx9i1kJCPtqbaq4jNGZQeyvv0WcWAuRYo4FPuUMu7wvWA/Ot9PrVeh3Sfl1BBItQg1o0P7iKCP5JYoRRB1n7An9OTBX3nbMBwEEi3QGxAJaHrilEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311769; c=relaxed/simple;
	bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GT+hDAsSGd6DeyZ50GX1ys2tmqNeQMU9TFG87Mp/gmwhMfCXhzWO61xT7emkbj2qctRo0dOGpdAMMgblbA/dHotVs6ZgRpC0Z50NdmuiBIdHaDZgKaUuXINRT9Y/yKpcMq6Ic9JSht4lk9McGWDCBcwZXRdlyROn3Jlht91zL7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rnrGZOZl; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rnrGZOZl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484415c8bf2so416114f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788311766; cv=none;
        d=google.com; s=arc-20260327;
        b=BBh0QbkXKGz6WHcd9d4D4SQMS3n5E9+UU4r3ctYybaIm11dcULi5TUpCXn8yI5AziH
         66WX3QiGsvJb35TZTSkF+sM/4j1cN4yxee/rBV5wnwf4AxWWyyFMIfViJ4xa9Eb2Qywb
         8WMUKmzj+zdZw6Lpcpl3BI6a/hQO6l93qjFmDjX3IgXXAFY/QrsQZ6WcaVtKMjOjcv1n
         +XIG0jMfp1jJ5Cpo7FZwzgcB+RJamiWL5Lm3SSEnLPNerU+r7oV+syPCtXARYKfoZALp
         u1QiWTw1i/BziwZT7YRTyplZKy+Ktwt59S0gSSeRhcFyiT0ALhgc+u8R8gsNKbNpkWgC
         2CNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
        fh=7VaAvYY8uQSxSNMnC/R8gmv/f/7rZsG7M6okJoNNUYI=;
        b=FDWsBRMc/AoU60NZupd3MU0fudQ6d8NQ35J2SdrUE56sVVbKRYCS84SkFSAamvo7Lj
         5NX+D37sW7pHTUotDn6hGV3KRd2vDt+f25fqm2zQO/4p5+uAIg7XYYk3EcX0PU9fYYId
         0j49wJE+y9bsNo9KQmrgMpH4HAjSLmnzrkr7FmCYq2cL5AcLxZXTu1wSpkJxzfxJ9pYR
         lbWxr1XZcgUlYrKC9Gfv4K+GkX+++YvGwmLCq1KxjeqkYNQzTUomu2tm/z+aCYOtR2LF
         PlQykxtTk70mcemXoGRsEBmI2bvBLTtZ7j+MpaQjTydVZCRcp8OU9PVdbuLrKtnCAYSo
         E78g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788311766; x=1788916566; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
        b=rnrGZOZlMAX3UmCRrMXFDe7L0FvALvb3cv5AHDo0U0oMjHA4kifRq5ZLHdy5p6SU20
         Pzw/cLBU/twEHZaMAdGA0ML1UoOzzF+BRs6uWTsYGpgmIhToWmbSqfzafzAxBwO3wYoM
         foNp2CHlznQQP7sogjtPIxOWcx6gyDZU2KECgwEZ1ic5AqSDBP6SNhjSzCYtAb8XZbzL
         FQ/UCewamFvUm1YOUs4vVdPGd3eu/o5KGKv5Gz53jL40VALtNA72ssVD/aJj2tQBNf+y
         prHs28toqnagGatteSofwUWUP3AK5CRLg6LdrDzeccpOdsFWmqoXYwEvaJqxYMfUuo2j
         TJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788311766; x=1788916566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
        b=ZVRPCUcIT94ArqRiLiuJqeDYhZ75A9sMes4GHMmiDLKABWloUgJQh+c6ySd+De7pEp
         qPuAZEJ/96W6v8p5irjWJupPelZN6Im+UOhbsJKT2yPxaIXQByzbka+HKEyPCbyJfE0/
         sQ9AUgVEma5k4Y6lXu9CAJDCBhYx6VO+72IbqT6ECtSXSurBuk8TiaG02Fel8NkCf3/u
         qlITKYTFzybmUWG/ebD8pbPtSyJRrYNZtRUp7e7sa4smfVO3+vHJtPbbzPagBy9WUDXm
         oPPbnR2CIcd1E6uF6EsYeTsxRn5w90ZrLbnXt56ecGZmqgDWX2Q4TW9nPl5lpQ85hCu9
         jtGA==
X-Forwarded-Encrypted: i=1; AKwUvBzJg0snk+c0xNofGOo/ZUPQUzo14UZzCAf3p1w9G0j1HXdjwijW+FBAnV3YosTfVVI+/8UpJ/b4pskcvDY=@vger.kernel.org
X-Gm-Message-State: AFuF++mqPREGKlluoXiYx+iyKo/9Ac4IwKadBOa/5P198H4d2cR8PMYS
	g+DxyCKvVkdL6O6oPFR9Yac0cv4QL7ULe+baBt/3mKhIGkYtsRNdQxQr/pY9yh3Ho5tbAbLLjX1
	dS1nuWQjdfsmfI0Oh/Y4PFtz5TwCkS7w92z9M5zudmISIqdk8NdkEcVHa4OM=
X-Gm-Gg: AYBFou0EH0mJ3TbyP5NOZflIh1sdPsMFQ/4puCSFFiIcohqJenmVez/udmj0RUf2TB4
	T08vUL5BW6FoeIEY3xUlQa08NQ+TtcFsmr6xGD8EdGFdFooL9aNKgUlTuCQ2QTythZcBHTrfwEa
	iRXjAvFHxbx+Xp7gWk12HELUN/iQj/6ta3bUbjNoaTiZ5Z3cr86fFI6VLblZsOYSsAmKEiRZBnv
	sIRHF3+PyUGzb6ysB87Vj6a7jgfW0/ltPQfuYJXyvI3NVf1/R+nSKHUbjNX4kTCO74gMW7M45zz
	r+2axpMCbO2ahGesM0yAFpWmeKovZPnryI1JrIWu4pYQlzvuNZDvYg3wIIV/gfEtBvrcYmm0gng
	=
X-Received: by 2002:a05:6000:610:b0:47f:34ba:2d0d with SMTP id
 ffacd0b85a97d-48488dfaf77mr1818183f8f.8.1788311765710; Tue, 01 Sep 2026
 18:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825234545.2076049-1-jthies@google.com> <apVZVCzUEXp1Ahv2@black.igk.intel.com>
 <CAMMMRMdiAF1Kx9CAwZrWCiLGjrzVnoQ_Rm-m-UXSAF+fhS+y2A@mail.gmail.com>
In-Reply-To: <CAMMMRMdiAF1Kx9CAwZrWCiLGjrzVnoQ_Rm-m-UXSAF+fhS+y2A@mail.gmail.com>
From: Jameson Thies <jthies@google.com>
Date: Tue, 1 Sep 2026 18:15:53 -0700
X-Gm-Features: AcwNN1WTrRxd9fhimNdvz27qwM-VziUTihyxqgKl_8a-VrgZw7w8_yKF8fKHbqE
Message-ID: <CAMFSARfWY6k=_5Yw0S6uaPs5XzVyAJA02EuEELwu9VQEKw+2wQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki and Andrei,
thanks for taking a look. I'll follow up with a v2 of this patch to
address your comments. Answers below with some additional comments.

> > Can you remove the above line while at it?

Will remove in v2.

> > Shouldn't that be the other way around?

I'm not sure I understand. Because UCSI_MAX_ALTMODES is set to 30 in
ucsi.h, verifying 'cur' is less than UCSI_MAX_ALTMODES will still
evaluate to false if 'cur' is 0xff. This update maintains the existing
functionality and prevents the driver from using an out of bounds
index.

> Looks fine, but shouldn't we return an error if an invalid value is
> received, similar to the Thunderbolt implementation?

Sounds good to me, but I think we should split up the
UCSI_MAX_ALTMODES check and the port_altmode check. Returning EBUSY
doesn't seem like an appropriate error code if the PPM returns an out
of range option. I think we should return EINVAL here.
