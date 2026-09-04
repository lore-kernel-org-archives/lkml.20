Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B873A34D382
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556628; cv=none; b=cYSZ0IbvaQ98988ymu6JZdMhtuHTsQqzr8EVyj5cbNGg53tMZIR1VqzgcfQimVZoHCn/PfALjHqRVSGn98bcXK53ksZ109Ou4CA0uS4p2wLh23yjvcMLMH8RKmNYex/ymNZdq6TQ1VjpOExuHx6sachP/Lg8ba3x+pqLCivndzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556628; c=relaxed/simple;
	bh=fbcfuCNP59X+xpC5IcevYHcbPlbySqO8B0ppbV4rWIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QaoJdr6QlD90Z0miioK5PFqb5oJTrEIbF00uL06iQRM91RGBSfGOuvHb2QVTn2txhetU885pRHdVhauX1LlaDjaO9g7kDUe/Bu/+XMmwRfFcDnBNf2pciX8bre4b8TWP2gkPtuIzK0VqcZ19vXpgJBO/FJ6gKB12c744/8FE4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PawRyZl3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PawRyZl3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so19082375e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788556625; x=1789161425; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMge+xrP5bwgHdzm4UEAERiB2kJzyUIFVLBR/fB/uZk=;
        b=PawRyZl30RpsIFWClGmdd5nmrJpROzKDJfL5WiC3/1bYqUf+GJfpC7BOgtce7NkiJZ
         +fw1/nLgFZBbiMdda4pZaXaOs8+Aknc74gh+XfsCqlYuEupkBcTv67FPaCMJ0VkDcSgU
         TvdMer0cq5zfEH94Io+tmQXiV5hVPKj0mh8bWaHE+m7k6lW3ns/x860RAVO+OZuZ/Knw
         F8WV1nHKz4xEtcMz7WmoHYfGL7UeyNX4wZjBKQ7jBXxVg20FdVDkLtGcGHONTbvGsfOI
         Ihm3yCF/s6CY4FTkKK+43P6fA1JXmv8wQgG1TY3VY5g+rWQ5E6sElA//aGg+4P+gCfgQ
         zGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556625; x=1789161425;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMge+xrP5bwgHdzm4UEAERiB2kJzyUIFVLBR/fB/uZk=;
        b=GXuhV4zaOQJvtNT+4Bnsx8J08iVKJYppKnseP1U2rfTdLM0T+0v0xsvRckGrI+zVrm
         s06I9BZwdqvuERf0Q2DfjcP3yU4HYntyVEnOf76lBQ0ooUgvtOV5GcHi2U4OLIqBxJet
         68Bcln1qub2SfYj5HBAsJn3GEiBgQh3Tc9yDubLk6b2KRsjgURzTgkLG/vS9z4c4VLiy
         /2vUDx9BT3AKYdyTrGh3AtZY9QgUgSnaWX3eINXnx3fyBcXjn46Vu9+yxW/WfQpRC51T
         bTprEdTzbQCanBdsrPhy+XboMJdTO1Y4Vx20jRHFERPFa2IbKxOEz2zaVJov8wxFoRGE
         ydRg==
X-Forwarded-Encrypted: i=1; AKwUvBzOi0OyL/vMaD/s8wh172sEHIeDEQFcssIUglILjN4f9DCOnEoldzWbscF+Xn/LQPStP1Wylu9kEDSUS+4=@vger.kernel.org
X-Gm-Message-State: AFuF++m8Uqyq/C7Wtb6yEZG+fawXdC2kIJt6Z2uVZbQ63eqURTxZ5Hdn
	XZ33axb63q6vQeF1X36Zb6Exiccgy8ZYzcSW3LM84MEqMLieCXisKVI=
X-Gm-Gg: AYBFou1sqCVPsRTWnL6rFiQ9gLWwummNscu8RcLfwXtuWqY9j59OV23Qf6B0vyvE5Xe
	ZgB+7GVPJgAjQcKvOeLi5LqNdUMqP0pVd2uqfiixbhOT0d9PiLOZn/Ael9oDjt3/ww32OacyF3E
	V+70zBp0cE+jln4CJ5sa+pEPP3Dk3jxC2f2f+GTw6zvjqQV8pbE0JxXbL0lIsE7qvid30OCemO7
	AAQEeZpdZsob6K6BbCWQejYibc+Yf7Rk4qsF8lbYeQ5d1JPCttyhCFDi0Xu4gsVd56fgf0ClKTR
	WaWGs0NBr6ejZ8U+9lTH/YjH37mfV+5sQl5sKJhTKJlhQFHx7slb+hgRnFHIdK1LJOj+w8L0tIg
	nA2/MZNuwI5iljIlkr86if2JtGzEktFzlN5Mh8y854UDmLuJ33GIPjQ71R6gxRRHkflOZcg1M4y
	ySM+Pd8dP4HIiUQ7nBKnDPTyNVgnhFXN5mug3KXWgD3zKY5gQ6/fTjUTkxfzcSLbNpH8KKBQV59
	SQ=
X-Received: by 2002:a05:600c:350f:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49cf825d1dcmr82117795e9.11.1788556624926;
        Fri, 04 Sep 2026 14:17:04 -0700 (PDT)
Received: from kali (88-170-213-78.subs.proxad.net. [88.170.213.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce591f846sm102532995e9.1.2026.09.04.14.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:17:03 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Derek J. Clark <derekjohn.clark@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH] HID: hid-oxp: use cancel_delayed_work_sync() in remove
Date: Fri, 04 Sep 2026 21:17:02 -0000
Message-ID: <178855662286.3192124.2102579968112413785@gmail.com>
In-Reply-To: <949B786B-375B-4F2F-B209-C135EC62E1A5@gmail.com>
References: <20260904105800.3923987-1-tristmd@gmail.com>
 <949B786B-375B-4F2F-B209-C135EC62E1A5@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Derek,

Thanks for the review.

One thing the Sashiko bot flagged, and I think it's valid: if
oxp_hid_probe() returns early on an unknown usage page (the
default: return 0 path), the delayed work items are never
initialized via INIT_DELAYED_WORK().  In that case,
cancel_delayed_work_sync() in remove() would call __flush_work()
on a zero-filled work struct, which hits WARN_ON(!work->func).

The non-sync cancel_delayed_work() didn't trigger this because it
never calls __flush_work().

Do you think this path is actually reachable in practice, or are
the usage page IDs exhaustive for all matched devices?  If it can
happen, I can send a v2 that guards the cancels.

Thanks,
Tristan
