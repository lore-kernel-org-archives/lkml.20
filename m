Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C27043FD3F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941736; cv=pass; b=Sud2FGMa4uWPICGkLNsa8A5Iy+3k2c9e4gJmMd0iw8FZBy36BMOIPRC497ygiTtrJpetJ8eJZRr3VZ8TxX0DKub4X6zi+yu/FtMDVePkUpmWx97sL2XaN6jzT6ErgL4JD7ikVvkQ9GKGG5q2VzAk0XZnl86uJ88MZWjlNC2IkhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941736; c=relaxed/simple;
	bh=1k0YZrSks/fUFsNrSrQtX4TlMWE+gPqMH2XaCVooxz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqyJsKU/REee6dc1fMQ+89y/wverd/ugwH6U+7MEziUYBFhi3YIMylHPHIftyb2EKVP8KiSb6eenU9seJmyCfuoFkjPwW//UpwL3szWgboBNdlQR+q35VmcG1AZMIzZer6jxKa4ILjRD1F0wlCY8YCZKBvYtoTF6QlyeeME3eNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNN6BcRz; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNN6BcRz"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso3128527eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941734; cv=none;
        d=google.com; s=arc-20260327;
        b=oNUuHPeQtjOIxBKjC9Ht++60JAAGOJYBYiuQzk2yIDr2wF9wrAf0qhAbY4+rngtbW/
         51yoGHr/Y4ndLa1Qift7amJ0vpVqvmafF/mvDCAvJnF1RvvDpef2z7qQGHHYEr7hLpkE
         /KGko296Rd5MXShZwa3ww/E4zHdSMCnTGzsv8y1170iqKXx7pnRlRC+R9taEx9C0dYZo
         9H/jcT2tQMnF6EwmHb2THvfxF/Ii/9sydZAawRZUcOK+f8zbLIl3CEuLkHy2DSYa8W/d
         hxlNQbYqMsjvPZ46MIHpcGtE/S4GWGoRPsHqq385evB2iv6LwQcaRcWr7hkjHW85GStm
         u+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZpcmK/1gS5TGkCr6ZKwLD3FmVB89gMuw83dJlLlkos=;
        fh=vTP0Y7d/57wIdpUiz/o23GzxTrnz1zosb7qud7IKmWg=;
        b=XatlCaFQQqyUCVHrR051phpvyEL/UFkP2WaHi04xQFfMPHvWcVJvxQtyGMSOvRSc1v
         KC6K2Nzw0YjpRn33bqKDqhfL32vqfXt//1o1bfXrVaL15gWJ56kG0ivz5GhdGbmdMNlR
         WX2KjqG4ZDdN1U7JO7HkWP+wsHboQtTr41ZFoLGB4Wr+5KC0GBmJvRRzIHXT6K1h+HeY
         FddxHs+fjaTN7FSMZYwAVU7SUCk+KUYflxtUKbWwio/xA6r6gBkLTI1GN436ro5BlA2W
         jUvEA2gbPOMu2LwjinPwXSFsyHYdD4jK6I61pVmQZ9OER7Kv2kOgWeSWCGV6+tbCX7ds
         x/1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941734; x=1789546534; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZpcmK/1gS5TGkCr6ZKwLD3FmVB89gMuw83dJlLlkos=;
        b=WNN6BcRzs28uCyr51C4ZK+380gEmA/ni2JH7TKEMQ8v3eN3dnEpEm15818bkre7MFY
         Q3YrqFwZrkeahdmIy58fKjGDxDv61GJFVUbLY8ySTxPKQ5oS9X3hCks+eH2qUyO6+M46
         s7OZXU9DA82Wul/bMPuBLI13ZYR9TGg3KLBqOS7NvSXa705hd79e9LTedR2dj0n4ZKKS
         uf3F5HNANQV23pCwt8ZA2yLumwA3t4lU9xumxXIPfmRHWJ8m2Vt0bLn/JOdBbYx/cjEy
         xL89Ccid9rMeXjWPKE+Hbagn71OwlKnHN2Rk+TE3qLLt0iXcrZlGPbZszYLfF5Dj8Csm
         K7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941734; x=1789546534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tZpcmK/1gS5TGkCr6ZKwLD3FmVB89gMuw83dJlLlkos=;
        b=EMM4hXJxn+ZglzjdR2fLAxVzU2kl+m36N4QRm/gbHmZ6n0Boa8JLyCq2rX3LSoD5b0
         lFWJnfE75yDG0LQNabK/0k+vJ118niNkS3Gg14oAEor8iDhmtVp3YnXja5ZICIt5Xn8J
         6NWC6uS8QgDVKljxBgngn98m2Eqt0g2p0m6zsTCzdXaH4ViiYJrc+mwh3vPLxFszOSzT
         JLx/2i0qE2eSuxIaFxWAO/eB+kB7WpjioIH8rL1xtOw53r2XI8nivz6Kr2msMKK6brSs
         VziG8ac4Y3V9fm1zFyh4xiQOPO2U1asFACA6bd3HYblWktKfb4GnWzS02jb4NjeykAD0
         9OTQ==
X-Gm-Message-State: AFuF++nU/WN4Kaa4Gx6Nq/0c+QfDXDiF4gWFjqjh7bG4f3KFFruDNlXs
	szcjh2B694utNbCwMGQVTZ2DUvCR1j5KMKxLB3rB+rcCMFCQcmMY4JUNC7/JCtUUkYo6QgRtClv
	qa+dbvq+x6/EHcPP+7vCVJoVDqTVTuTM=
X-Gm-Gg: AYBFou1oj+QaMapr61TWK2+YU7RgpH0n9wS1Z59MxmILxGU23fg2WJbvzxAYnICIRAi
	OLtC4LTzsuC+N5ITTbyAgyafoliq1/ZBTyvR2mGdZSCsT4ALxJx5uxBVB7YaZlUmVS4wW9xCSOC
	NIKHl6qu+32gtSDJwaXVnPzR6eJM7K24ZH/sKFMCYV6IX6EZ+u2PyBIxlbf33zRcpvbflSfxTM2
	/B8lPIk5aAW1gYDS2yLjwR0+vnX0RanCH6YxO8nBXf1T9K7stpVU4UsuuIJlhmfW9MD/21SLmtL
	olTven5eLnKU7lnY7Wdis9QBtuPxvyA28fxn6TZ1sDGl4dPq8rrESg==
X-Received: by 2002:a05:6820:7082:20b0:6ba:b298:ea39 with SMTP id
 006d021491bc7-6bab298f025mr7233706eaf.69.1788941733917; Wed, 09 Sep 2026
 01:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827113241.993923-1-khurana.ridham222@gmail.com>
In-Reply-To: <20260827113241.993923-1-khurana.ridham222@gmail.com>
From: Ridham Khurana <khurana.ridham222@gmail.com>
Date: Wed, 9 Sep 2026 13:45:22 +0530
X-Gm-Features: AcwNN1Vn8yplOdaKFbDy39xEGoIKeoW4yBYnchV3TkVWT-OzB6_OizXULzOq6JU
Message-ID: <CAOu+XQ+=O4SfYw_ojpoj4kc7CYVUvMZ9hf3T3JHYpKuVqo89Ng@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Brigham Campbell <me@brighamcampbell.com>, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I sent this patch on 2026-08-27, during the 7.3 merge window, so it may
well have got lost in the noise.

Do you have any feedback for me?  Is there anything I should change, or
would you prefer a v2 rebased on the current tree?

Thanks,
Ridham Khurana
