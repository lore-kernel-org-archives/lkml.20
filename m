Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1392390CA3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944534; cv=pass; b=Eb8kEjHEbN1VSDE2IIiiQYuvAS62VDuDZZ5d5ab1XyuNTnCvSIbJ2x5I57BJccWyA1p5gytcxaIvSZxIxtcb0f5TdtyhGETy5Tkl79N1QNvVJ3xdhC7svd2WRzeWFGGy2AkA2Nzmggue+xcMGjn602I3qvMgLfzbK0F2El/Ru00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944534; c=relaxed/simple;
	bh=g4tRzOP5gurinKLHFfhUWYn283fXknP0F1ZZM22K23c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFPb5+Yl9nsHkXsldoceCw7KzyVL76F5OgvL0jZiLaFXGE3SlZt5rY228i6j/RM+tAFHUsXYO8pFs2FiPeZ7YfHV3Of4jPhkfUF9tXn93MTGaagG4wJPgDJFnVAuFdLGgW58u2GOckSPzz60nXVgBuURJReZj0s8nHlPCbAW17A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/NEsgJL; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/NEsgJL"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e6892b3faso4716266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790944531; cv=none;
        d=google.com; s=arc-20260327;
        b=nMINeHvWhLywyJS9YRUX2J5PDj1AjYeXZ7smw0WRKh6FnSsY/Tswt8K9wfkJJN1iIS
         1y21IqIehwwUOkXuq3OevYRyzoR8MMNpMh9Xe6cBzhKzWJGSI/gvYBgfXfEZKol5H0N/
         Rpi7cFdfBKOZFTATcuqz+vnUgv7L2q3m3xkTFjggXCeI192WUsD0Mt/mwnGxRB8ieQGP
         5UL5unLbbxr2M709wFCzATKJgekt2hOplDV2vKv0g1QH75IAOd6vCpVRFV1l/C8Wn76X
         K5pr4sRuz5uBlt+sInVx1RKXo3BSnZjtQ8VjyvdPeCcz2DwHABspgl2lrzr5liy5pf8E
         wyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4tRzOP5gurinKLHFfhUWYn283fXknP0F1ZZM22K23c=;
        fh=kM8njxvT5AvhtHZKUDxfxSNNGI8ygoPsmON/lYb8B4w=;
        b=eAZXnHhxkR7k3vwdxBgMlYKCPbYitnl3HXo9uKUMNxrVtsssOixUf9KSDcCMyEv444
         d8+fvUMFmrI9U2hVH6mSqHJELeaVkyP1dix3lVtp2UWj/hT/ClP1xBwEjLMmvc+aRb/E
         3Oy2nHuVx/1SAsfh3qPN1ZmqIqENuXH66muZW3YgA/8UCObIdwEF63KF0Oy3YCxnQMfS
         xLKZpqdI5cyA47eXa9KDauBaxFQJ/r/zmeu7I6Q7R8KrX1HHA1keU4wzlEEP8ZDE9Tnx
         BDhAmtGKuyokTThRuEeSIwq2YNr4TPlz8ETjxB4u/kCKPuA/k1moLdVD0nJgbr1z0ImP
         eqWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790944531; x=1791549331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4tRzOP5gurinKLHFfhUWYn283fXknP0F1ZZM22K23c=;
        b=B/NEsgJLmQsJc4ZodJrgL5R8Pi+rrM8G4dXnN1gEqnakWp0Da44FRip5Pu9QYTz887
         oMBJ+Y9y+Ec5WRQdmBhwMhX2cuQsiRHpfraPcYKjqPF0dkqVRacbNg8nnBElkd1fiQfQ
         zhSCR+wo/1oEy5oErl+aEFFNFx6N99QMKtXxd+amrRmgRBwmp06cV1nIRARDmv+xCw4/
         olmA42Ml6GlAR/aGdbwwElMVO5igcRyaz5fk0Ww46SDEtMou8JHHQgkm2bobhCXIt+YC
         OWX0I68TDaoawIdIXijKXGg1RnzjN0Sko8arHVzaLuFJD2zVzz/jppyToMQVIuzNR7y1
         Tg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944531; x=1791549331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4tRzOP5gurinKLHFfhUWYn283fXknP0F1ZZM22K23c=;
        b=uVbLsv6B549zmOtAlcKDmZcpCGZ014c3hQdCu3/+YL6WewwTXlfDetN2FGhPT1bpCC
         tbB/kvV1eeBM/Q0My2MEFSUNM5h17rbbmog6g31V4ec38mwvtAABE5E4yEVxBTJt0shP
         ks3FWn8yVRXscxOuphmZL94Pe/xRPP8N6GRScPuIRWYgdq/DMrsu5yrcG9Nj4rjthWVu
         QW7C7zUdyO3JETmd0FLvEI7VMMGWAWBDb3gBnf+jBKzYijJkzOc1gvAf3mIrbXBJZjxP
         y/3jF/1uvDanJKMoo01/dEECeaOYFJ3DO2LI6LX5Djcq0y+5vF55D0+pe/+n/RgTRpz8
         JYOg==
X-Forwarded-Encrypted: i=1; AKwUvBzJGmck3XbVOxwunOKfOwAq2qjhG4r0CwXJsa3H3HTJmoC06HNZRCI1cpA8TihPbBxpQCIN6JOyFpNw8qI=@vger.kernel.org
X-Gm-Message-State: AFuF++muXPH+ktuW/oJTEDNQDDpa5T3OcWww/eEQ6HW5vu2AGeCFjJh/
	yj6wKxpyKkx0NK9jeThL4HU1H9pUVvbgbMc/hesFpOJQ6cVwxsjMUiwoVDNQcnUAPSocM73Kr4i
	M9KNlRmY5hfT1jb8bsXThZAI0XClqYzo=
X-Gm-Gg: AYBFou2Mgt2uQfO/XzRd6o4btFLAmo0rLPy0N9Xdb/aGUTKC1PFawH8CTXlzHdyxxKv
	LySMvmActtxe3ZwtEHCgfhnqdHdN6uX3cWUcffdxXagPC8SKnP1GVlinp56WY8Bs9/Jtf3y52Hr
	pN828y/DfvLDaa3PWY64f5upHhWEw+clGQtI9i/EWeFazBHTrQsbfYMGi94UPiZijX7itllTqz4
	rer65uDJQ0qcNQizwH1EdNd8iqyMRUsbLHaZTkxznzsTl7OF3utZ2perB7hFC4MbnAIpunNDnOV
	JqbZbkR21tyU6Oi1nJHYyuF8lTJdLnt9Q8/PrZz0kc6eebWmRnBCPQ==
X-Received: by 2002:a17:907:9490:b0:c29:f5d5:5a96 with SMTP id
 a640c23a62f3a-c2e4b20d9c2mr208899366b.32.1790944530536; Fri, 02 Oct 2026
 05:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002100935.449473-1-al.kochet@gmail.com>
In-Reply-To: <20261002100935.449473-1-al.kochet@gmail.com>
From: Siarhei Volkau <lis8215@gmail.com>
Date: Fri, 2 Oct 2026 15:35:19 +0300
X-Gm-Features: AclHuK8oT17fr99ppSn_bGvjxkd_dqcCHCFbqpWJG6tCtlizdpUY_p2i8jO-OAQ
Message-ID: <CAKNVLfZG0cnu09mZ2HYRRvbSd4uLeOBXR--nUHK9YtOb+a0TTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "Input: matrix_keypad - force switch rows to input mode"
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Paul Cercueil <paul@crapouillou.net>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 2 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 13:09, Alex=
ander Kochetkov <al.kochet@gmail.com>:
> Siarhei, Paul: you both agreed to the revert in the thread above, please
> reply with your Acked-by/Tested-by if you would like it recorded.

Acked-by: Siarhei Volkau <lis8215@gmail.com>

Best regards,
Siarhei
