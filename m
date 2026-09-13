Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1585389E05
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341066; cv=none; b=rksH9PPFkt24GHm9/VbRb6uEWA1xdImqcOIhY6ABDUmVztxgaYNxrnIXp1JckFVQXfwFk/6AgyZ3FmC/UoE+9mC3xB6cZedeNI95AEFaFPIy+S4idkpuTMC9Ac/WDmwdJah6dVnI5HYJUUk2NHD7i1dQk4fi9ydXgpMM3wSFnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341066; c=relaxed/simple;
	bh=7VRqRnWh3lGbL9kPUFthPS5dsgsRMwml6qaXfw5FMHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4BGIVNzYwTW7ZC/mL7c8tl/sTeBr9WgcR+SNkMYK8VCclNg9NtIwM2sAS3B7z01IlsF4k3ijP9B9VPxQTqqb80IGmCdsXFduozwuxkct7xcJsnPGyWlmh+KnpT4iX8/P/+L7KiZNZRc6Jb4+ijIYQOh9iFydrU51GnHhvlwLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W0oAEPBy; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W0oAEPBy"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a9ac6aa620so3711828a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789341060; x=1789945860; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otUdbuSiFhBRkZCEqyxGlxc0YCwlt0UQ0qDbBI/rBSk=;
        b=W0oAEPByLFQy4aoJWGWJ1cf6S8c9OXFeWSNgQzyFcfrTS8QDoB0mSL+2ZxWsb8T55K
         /sSYo+3K6uS4MqrLGAOnOk1dDmjAXnFvJ52ILJIAu8MbOViKF1b22E11B3uZXtSuHoAb
         iUOFmhcLqF7uHnhAYXaMKxaq9/8EQarEPiWLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789341060; x=1789945860;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=otUdbuSiFhBRkZCEqyxGlxc0YCwlt0UQ0qDbBI/rBSk=;
        b=Petl7uCBi72MVsYzk4ADBoQmagqsaTd/AbAFC4lRM+Bt82GQ/Cd/Q46xRuZ1bvnxWZ
         9lua06eBzPU6BiZIGCGMYEtRDeSGVryUBGDPX7Ly5NQF9rSTOqhYMfk76UHwJb6TmJkv
         3eY45tteA0EZPGUGCSOOUhb1ADsUVEMF2Rf4wxvCF4/rjh/UsZlRtdlIbvAiXBt+Aye2
         7pIVRh7DhiK0/i7YU02g7x1prqAJiHNoFBbwny9kHqZhPjV6lWuSXfDdcLB2jg25cjkN
         m2urBu+mAbqvFvqfwVQ2AQhejwtsWjwQThIweDFk7UNXAikutwSbROIJ5f6HbtnoY9ST
         n98Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiRw9sxl/c+VAN5BCQ7e4UMwy4BZu8552RXmvcdvKFEuIWYRkqsAGE3QuuerwmsHPFEVVa3qia+PCeVNE=@vger.kernel.org
X-Gm-Message-State: AFuF++k5VlH3QHAj/zcCgQhVSbAE6XI+Y3kSh+Zn0ufTrHlR/xQvfiok
	ZvNq7Iq5hJvLTNJzwUqpr/IO0KwW1w2GvIc+83IP0y2AVf0pvzLGtNCsFCVa3sI12akaMIO4sad
	FVVtywwc=
X-Gm-Gg: AYBFou2THi3DAS4Rdh3WWIJF0oaB9yW2gcmjOggAhlowdq8REIghu3XW/07uXN1J+uA
	bcZ+njzYo/RTn2+fT567Y6aYpyo3r4V6ci+HgxL7+whp737s52+0vCwu3LlVVI8BYDd/l5WofSg
	VC77zoiechqvErXznQx6YWJ3ZYaNqs6ku6canNtB+GnJh8kWxW5/NbYc/XJBDviKiF1uJ3trh85
	zVaUG9EQPdym6tWZrKFHgrcp4rmxi56/mxZQxJ4IjbsOULe8Ttu7qQWA3KBHDAPqu4DsfUGIcyg
	6QERd9xMQ/qPq2iWqayzNrsMg02SluqoaiLGdutry6HIe7um4ofL3kdl6PF2raiUVIJhfN/nhc4
	19t4iJuMMJluXdHAcr24FkQUrL1BLKSQM+a+Jq3hF1VJmHlzL47btjzVsdN00ktz71maDvJQ55n
	/B3ykduadwk+mc8HcsGQ1sIpbtrIX6RyQLFLsQHn39hc0tesEcJxRMzeKTWhRr8KYkRnB7ELIpH
	NnsXA/XNxebrKC9n9sQKG5l9dJr6/WBGR9xYjNmk0XWHLqG6Q==
X-Received: by 2002:a17:907:7b8a:b0:c29:519b:3aee with SMTP id a640c23a62f3a-c29a44696d8mr181892266b.33.1789341059722;
        Sun, 13 Sep 2026 16:10:59 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c56183sm346154666b.3.2026.09.13.16.10.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 16:10:59 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d1so1195606a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:10:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRsuiGk3eWHZTgymhd/CGTBpUwYT80dR5QTDXJLf1teBF5WKrdgLwFPg0i+TlfLNo7wFqSuS2AXEZITk0=@vger.kernel.org
X-Received: by 2002:a05:6402:234e:b0:6a9:8a53:48a8 with SMTP id
 4fb4d7f45d1cf-6a9f6493112mr22906a12.2.1789341059245; Sun, 13 Sep 2026
 16:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
In-Reply-To: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 16:10:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
X-Gm-Features: AcwNN1WJn2dIcRKTxWI2NK9TWM5_XuOac1c5JTWVWQ4cNm7_m43QgkjCaj8QrlY
Message-ID: <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
Subject: Re: [GIT PULL] x86/urgent for 7.4-rc4
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 15:54, Dave Hansen <dave.hansen@linux.intel.com> wrote:
>
> The MADV_FREE one is notable for silently losing user data and having
> been around for a couple of years.

That explanation rewards horribly badly.

MADV_FREE itself is fine. It's *supposed* to drop dirty bits and lose
user data. That is the whole -m and only - point of MADV_FREE in the
first place.

The bug seems to be elsewhere in non-MADV_FREE code that then just is
confused about things. But both your pull request and that commit
message seem to try to blame MADV_FREE. What's up?

                Linus
