Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A019E5519B5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707429; cv=pass; b=VZOWpjB+OQEJ3LHZFuZkHMNngBeD2/DF8ofzL+lPT9xaqSTlPzt3IEqtFePFOoJAV+c1z860jXteMUUVipG94mugCkl/QCGf6+TvztTC1lFmOY84lyKbzgSXDwznOmLKpxYGflmL1kPJu0V/8tCE3wKuPmZmbyCHV5V897KDKJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707429; c=relaxed/simple;
	bh=kUVIdjgru6UCDpJhTGa7usyO5wvxDzwVO0NEapvsU6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbPqyi67PRbdseaEnUt4BguPu/V19yBWBBOzRTzTlNQnze3YzvSRksRUAsl87pTvJ7gznL9cQ3zkEhf5ecDasessQVPM/wnq4OUuSBGBGzKb1/8kzvVSOm4UI81rsoNfu/WF5lqy9d7l2GALD7dDDOpx2pA/OrHEQUSuu6jD7gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=juliahub.com; spf=pass smtp.mailfrom=juliahub.com; dkim=pass (2048-bit key) header.d=juliahub.com header.i=@juliahub.com header.b=OdUPUFE0; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=juliahub.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=juliahub.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=juliahub.com header.i=@juliahub.com header.b="OdUPUFE0"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5f7af3e1so313452985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790707427; cv=none;
        d=google.com; s=arc-20260327;
        b=Ms8fZfWYLUVNvzljPKgPumsAsrCiMn3Lbw5HfzwCC70lhyNxUU78Xu1a6KuUVBy5pg
         ZkvX1niKfT4paGG+AmMa+6t1S5YdCztcizpzzE4W+gh3rYAzgjpOiTSQOf40LDE5TQVY
         AmdX6PPEFnXC7+Vqs7mT/mZ9AmFEPGNRwwxxTQM+k4UirH1qbmhdUKHp/ErKwxpvct5A
         kRaIngJjDzYqHHD/sHYIW7M3UMfqyMweOfUCec+Gj0GJEsbnyygyxabssvnjSmCPd6O8
         aX98gS/nKyVLa93QEIPGluM9kRBuT/1lWP5KR3USq+lnBGRxo3MeW1gGqRCTfggDcUTS
         136w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUVIdjgru6UCDpJhTGa7usyO5wvxDzwVO0NEapvsU6g=;
        fh=JnTQEmMwZaSWKvgyCPr9G1zofdUuxJUwoKOiKPdUk00=;
        b=pltE+GMhz8ubMxSI7aGtwH9vts9PbDLLZs9ZuvhIZ6r3uFHP9xX5syvbQGMHU2WKYb
         4Snu7gwzP3U4A7TdyTT+9cK75+61bs4EguWVrrl7aP/cIirmQGcsU53zdKNl21p+o1X9
         GjfYlFnzPpJkHiUhOA7+xJhCxCiv5QeOHBFJmWRHk5QIi47axRxI4vqbDH9SCkdwSTVD
         zp3NsjgeNUVrThI+Q3stzcUhul2KugwcUICN78UJMqNKqsXasHTcKn5T4GQGoo2Ge+CS
         eT7y4WGrbv1qO84Dda87Yfw/zCMJtSfwRxL47fT0KdqwJCi5VbdaVjtprqwz74OIVwCs
         vuMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=juliahub.com; s=google; t=1790707427; x=1791312227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUVIdjgru6UCDpJhTGa7usyO5wvxDzwVO0NEapvsU6g=;
        b=OdUPUFE0H431saD30uHNe3HvLT3vYvkGnoMLspKiulsmvpbk9mnBHU223LcuPmM+kC
         SAsHDJuUnJujbLyRIN217utEl4lNr9iIfcxpK6xyDtMl+KP5Ap50ZwMnzuA9uv3ImSS2
         xds4fh70ks7/mGsqgoxDOOkwA4Z6gHz4K3Kper/CuBVpKcy4/7F2lYb9iP2iBjlow9hg
         K1LzYccoUkSmikaMPy/QiQ9NO9J2hAj4mvq5g3UsHKQG2W2TQFJhMOtaiJnH0H/5ckBr
         A1FMa+QFJ5Ap+2ioi+fUq1YOGKxeKkxDt13VtFi+OtSLXT2hV2sRYhbNZjO515MQFhju
         AsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707427; x=1791312227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUVIdjgru6UCDpJhTGa7usyO5wvxDzwVO0NEapvsU6g=;
        b=XTK/e1ols7CaUC++8qLDEr7PJoDs+ccEYpbIke4iaKyM5n1yrmP8Lvh9w77HJpn0wR
         Nuk4u/8ULOaJZDa9Ey92P6ei9T9nkvg0Q8ihqMOpx61HhVyHnk7qtuM6KRh0waNjZKTw
         NP50ewMxX/bfsWjRMwaIGZovAxoHrZsbiMyuCIsHKYXmJcPh8BF8KoqJvHxsV38peFBz
         Si9VaudHW4WOBXWlusT7bax6WTFd8W+u4qG2rZ5TiBrDVOtRqcI2sF5JrYeg+t4zDUZs
         bS5sZp2y8WK+L7iCqEcqE58LEzf0EKr3L+VgYb5mIPdAkX3pwVkZZx8rIOvrgQ8p2WOz
         G14g==
X-Forwarded-Encrypted: i=1; AKwUvBxcilKw7xyDPp7MoU/nUX97S8yJk8WD69foFdApxG7SKEbyfIR9mAtiTWSngKHktnF0yk2dbCjvsJ/AJbI=@vger.kernel.org
X-Gm-Message-State: AFuF++mjGZ59otuqgCMkD8lt+de8AoxkT6bAhooTN+qKqf/wq10nDPV5
	zjvxk+bMaANBt1E9VPx+nq2ZD2Yld5Bm17MC5qTn6zQLHAHe+8t30Ice2mTP4T7uogr7KFdl9Ug
	DPhAqQ1HQ21mq3HiLl7jQFOFFkjnx1Be9N5UOIQ4NUA==
X-Gm-Gg: AYBFou2ilBVfqakzEhXpIjvWbOTtHQOa1gPBimW89jeM0mcMuucsvqX8BZACfxoXDVd
	uC4BMIPDOAkbJ343n2rHvDo/6hLYfs+md6Ozf1R7EorUWvL28qNBWj14Dvuaf1Krtv9qKfA2xFT
	FxdwydzoiYs3tkvaKZaVnYvHMwAMhx2hNy1yFCvlJ5Kod/nRTW8BtzQ4rVAQCV+yHXaVr3qTdip
	HfpZOXiLTPNtKk7SzSfACWUecOF8jOMguhsqGOxbH8WfrrggNrRHADVbXU5Q8PhLBUGkc1rnbaz
	Hguth7aBmnaRXIIDI9l/8BjclD1uCma3mCrGX6trsqtklfCoN7bKQY3mGUa/HDG42EsCY6pXIJ5
	ne9QfpzQFMmv4TieWgAWWe9ElYPBftcStNhPraSz//zNCd94h3FOAGyc=
X-Received: by 2002:a05:620a:361d:b0:93c:90f:b535 with SMTP id
 af79cd13be357-93c9f98ed93mr71424485a.4.1790707427346; Tue, 29 Sep 2026
 11:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABV8kRwvex1VvQ0eGwUQmJL_vA7AP2h64VpHqtXvfOXMvvJQZA@mail.gmail.com>
 <87bjc0led9.ffs@fw13> <CABV8kRwDhwa_OoQ9zx4sv3tDATZc0Yy-mYGObRXw59DO0cDfLw@mail.gmail.com>
 <87v7a7jeav.ffs@fw13> <CABV8kRz5c4opGVA3CPdALWxjUH_DkLf_tBLdefajsSevfHFYpQ@mail.gmail.com>
 <87zezdiiyg.ffs@fw13> <CABV8kRz1nLxUDAgCSKHB2oqME74M6PyxB-t+u1it=6eYo5cFAQ@mail.gmail.com>
 <87ldawinki.ffs@fw13> <CABV8kRw92-0sx6Mi=z5pzCA9gEE9nnBbTjwKHzEr35DpSk6keg@mail.gmail.com>
 <87o6fqhpcw.ffs@fw13> <87fr10faqi.ffs@fw13> <87cxw4f7jh.ffs@fw13>
 <CABV8kRws040xRZqsLdDJNaHs-3Ax063uQnqTR-1mMMmkaCq3ow@mail.gmail.com>
 <87a4r7fnl8.ffs@fw13> <877bmbf8kp.ffs@fw13>
In-Reply-To: <877bmbf8kp.ffs@fw13>
From: Keno Fischer <keno@juliahub.com>
Date: Tue, 29 Sep 2026 14:43:10 -0400
X-Gm-Features: AclHuK8X2NNf1YOtLa_rf0CsjHFHtehvfMchFZ2pGuoGH3kVhAPKrr8BC1QIO0U
Message-ID: <CABV8kRxDSbUwLTiNxauakM6HEOHqhaybFnHEkC6iFOVtWHfhVA@mail.gmail.com>
Subject: Re: [PATCH] futex: Make FUTEX_WAITERS state consistent for robust
 futex unlock
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Yang Tao <yang.tao172@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, 
	Florian Weimer <fweimer@redhat.com>, Oleg Nesterov <oleg@redhat.com>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 12:05=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> =
wrote:
> I'll post the lot later.

Was there an updated version of this patch?
If we still want to do this, I think it would be good to
get it in sooner rather than later so userspace can adopt
the new ABI alongside the new robust unlock path.
My apologies if there is a v2 and I missed it.
