Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0734231829
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675145; cv=pass; b=rrB8IbUmQF1yeUa/sWN3wJHO2pPNYceFqNpHpahseq77MrO39RYiazs9vu6qKoP9LfaPH7KLD6tU4meNq9QbhfREJVGWOkRdcAPeM9cOW6bYGVggwrfq7SWgcorcZeGLEM9BcUed/9c7iSkBni3Ln+DdfNVHpvk15HLspdSs4RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675145; c=relaxed/simple;
	bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fv8r8n9jyzsQ8ORhQbt6SOpzn49q2myhvr92UHqd7eKwMjfZpY+hDVUQ2kJjqZYfV4aS6WvRJleZ/qpsR32RlOvMnP73eo1phpqDx4jYZSmWqz2YRZr0FspV1W/mhsAeCoG6hiHOmelaB5N2wU07HJxfkIzrM4V6PH/yI/DQU/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVgMzDrp; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVgMzDrp"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso6289761fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675142; cv=none;
        d=google.com; s=arc-20260327;
        b=Sj7na3pdT3byScwEd6um6jWK8Bn7uA3yUAnpKz47/7b0DQwac6XgYA5Dvz6xYc+PVG
         FbmP3fYvNtuS21HQPt0NRyyuU6HFTFEw+dNmaKxGI8ELy6QgiZFp5WYvVlorgKxH0eW0
         R/Bz7/TiD5FdFkrnMcMi7RVMVjTtqf1mFwmvKUF01HXtGWu6Y2S3MdB8c8jbqyHza3Fi
         e7G55RcvgrspdepUqHSzKSMTHHHRaaJ26R9Tu5tovCC12pmwHo+B+98VyELSazfeQ6Ji
         eTEGtGJycoDjXh40dKZNcOPQVmzHFsbGddDobNBrhoQKpBn/s0mMNtD7w8/BksGzv9/4
         hW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
        fh=g3mnsUb+Di1c3j/edUxahVr6R1q50r3ihNFXR6Dw4so=;
        b=c2QkCREAUqCz72M9klSv6DFtJtvXkyh5v6PRU5byBZ3IR1ynTfoJUciO6iHwNBsHNX
         ub2QQBX7FSs6FYou56D5Olp+8ZN5x762EnHhavFYWwkHc2ViJQi4QxoDZo6gPnoordfX
         XP+ovoYdR2gKE2y/x22Q8iNnbRZ02paOASDlV5qG+JVg4m4EaNixpqYbzzMf/3eg1sMn
         1K0Tpe1PCVhB8VponzHZ4Xhjn+V67JjtjbjlymzoeM3RI5z11glv6pPhlLu3oBuFdMLP
         xGu+squ/58kQ/v87w3zwaUnkxofqGZxgAsq4nY5v19faKO3BYcn+y+MPVy6qsb8byRDs
         M3kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675142; x=1792279942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
        b=FVgMzDrpb/7b8OlWamopi1tfTxES9h3p6GIL81i3K8DEJOc99rMtRP/LO0d6gXigN0
         VE6Pw2m31J/VhNRNxvAsGqYQU84K1VO+UV1F2lQb1J+VCDMTvgva+ZA0Xl5wN3nxkySg
         AZmw7kFvwTqMuC3X2y+eow2fIs51MG/rLRJnlG4uCEZ/rFVgSdt7hP2U0Mhj0OA75anj
         uGN1u5TEgIanXfIY/ahZl0K7+AnpcMjl58fRWU1rkdGmHqRYAxa3Zve1mJU3APOYf3ix
         E2dCxZ40l/v+cZ9mcEA8jV9PT0W6oibwLWOeGIrC5ZLjA3cWjQCh/6YYdWNLCRZ+SQJb
         wASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675142; x=1792279942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qflQkqQeHmD36iK16xGfjqsB6XTM4Xa1UP5Z+sLs1ts=;
        b=H+3rLAN616C4MJSIjx/ltC4SIWHNW/zEkiTZKGP7o4M5QX7gf1ay4KE6h+tdWcjBtd
         YEA28/UxXn5ADNWoNdQTmV4aG4BoPBXGD3l9M0OqrPUGEAxduzV0lbYgPGsLnSwmAae0
         /HXPfztvs1FmoVuckv1YAqbRaTx4QZRo8nLsZUXb9peAIyACKVK8T4OB0ohUkVpYLGWy
         twgWjreMJtXdENUKHdvDIrQpg80L2tksWEB5ds0BYvtv/cJvypXGX914d9S7IYnTywp2
         ew00gKhhyGY+fkJegiKvcv3tUzmkzBYAqi5vzJ2XtSCtP8E62FUxMx1rWiJZ7ngcGCWC
         xXBg==
X-Forwarded-Encrypted: i=1; AKwUvBxaU7CJOc1pDJPqdpifvPFW+9Zv8NFM6mtWfBQ9BQpKmU5vrUQEsoowf05Fm69iY+It/S5EdGm1CLWaxg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2QRDdbEp71CURWF1TN9RozI4duq+E144JExaOB0r/kRbhR57H
	fj2f+eUDep6RbAE/gLwogWiXhhnUdmQZQBDK9XWBhD9mMUUFxYrWurrekKidD7WmpCX98qSM8KB
	msd1YAEOCIZkPZt7gnyWbE1ieATzw0AA=
X-Gm-Gg: AYBFou10rtFCyJRkAZNnUEzsnev8VBa542nBkk7ucXxMuFgEB9peM3zy6vYiNZwGAtB
	TEUDF0DzoHqH56bmQTRKIWiK1zLjjt5qA6EoivzKWBNRX0KIUIsTo//5Cr/rJtLcal/IIs19Myi
	HtakT8rjr/HSRD9N0huQcdypcQVdDQ+BATYxiGc28BnwSaNMmOWYCHPsBUwBYo7JzBvZ8GSAqbB
	/P89qSjoeY7Eyl3kjunuGpt7K4Cp2wHnPMeKHhBwDt5VwhwCw5I3lQSrySB/aqgvzRfXc7V6/hm
	ErrSOKT70tLLdbXPGliicheJCeFacuBUw8a/UtRVI82lR3yQzyClX4JDgf6zIyopWRKT3uVJ6JN
	mrCHnprtlu9RaXgE47LvUGPtmw0GWtRw6Npbs6ZCK8pR4KTgkvcqzTCsZdQy4uELnaFXNZGci1T
	qzesOKdA==
X-Received: by 2002:a2e:b8cb:0:b0:3a9:c04d:40c3 with SMTP id
 38308e7fff4ca-3a9c4ebaa9amr12809291fa.1.1791675141422; Sat, 10 Oct 2026
 16:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com> <20261010142533.974797-2-linmag7@gmail.com>
In-Reply-To: <20261010142533.974797-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:32:09 -0400
X-Gm-Features: AclHuK-Ff4Cr98p_CB6t_k-bkb71SKuGnXuo7evvdddqXdUWufYMH0X2srMk7xI
Message-ID: <CAEdQ38GtjhbEipnuTbo1EmzNNAE9=6p3T6MfTnMq-6okmE9-tQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] alpha: load the MMU context when switch_mm()
 switches the current task
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 04:24:27PM +0200, Magnus Lindholm wrote:
> do_shoot_lazy_tlb(), which switches to init_mm from an IPI. None explicitly
> loads the context, so the task can carry on running
> under whatever was loaded before while current->mm says otherwise.

Two small things if you touch this changelog again when applying,
neither worth a v6.

The second line above is short.

"while current->mm says otherwise" only describes kthread_use_mm(). The
other two callers change active_mm and leave current->mm NULL.

> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Tested-by: Matt Turner <mattst88@gmail.com>
> Reviewed-by: Matt Turner <mattst88@gmail.com>

Your Signed-off-by is last on patches 2-8 and first here.
