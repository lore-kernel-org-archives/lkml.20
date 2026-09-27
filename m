Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A53A2556
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790501343; cv=none; b=NiqTUjJqDsw/097wZPdcz5xA/mN1joncoH9SU8WcFpFfs4boSKexQhL6t40caZIYqiTguK1iSdinBz8xzxB6XoBcws+4NGnj3qQ6WTVh3RDd8F1PMt6vJTsGf2EfGUghaQIwo0vWwzisiRh58k4YqcL6ipEePYsHCFRMAiY779Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790501343; c=relaxed/simple;
	bh=4x8l5gtCNjd3MzbigudBvHHGyNlD8SUXdmY1T/ORuAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OY7SaRqX0S2mlziXzYMgJKG8iPU7GJrVzzqecny+uGO9P4AC1QcnmEibcGoCk6Gk7be3KYjH81sYf7lJs2TvmF1Xk5eurkPsu3RlgmVBK3QsFDDBdLW9RelQjYbeLQw8llyECSuL4aL58uu8TERFDKDHeNwv67HEnkOr1dht+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso1461328241.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790501340; x=1791106140;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=csdD6jxORMZoat82NKXRRvNrkjCWmWkfxNOA751RjhY=;
        b=J9UAx8MhKltZEHmgPR3+zkeP1QnHCxlWlLFgDsDXst8IN7uHynoZui15lCAE4nEFrb
         2S+/SFzVhXAqcDjq6Bc693BU/OFAmEip9K3HekpoeDsqqIX7ufmBiIeaJ0b/KHyKfyt3
         cmLCz5NqMJUuNhPEiALh/ABI43ppgOnmxjjgcGRQ5e1paemGIOuqDwtAvhAn06qTQwKV
         uSB8+v36hTCuLTe+zNVPXwvfMKvIS6OEXdvei/pFCHyhiL8JwtCZ5kPXDLYkmo0fplam
         yVB7cSAXYFDxScGucGsxJTYqAYxnlYg/Y2CtuMZ8GKM7GMLCgsRzdIJyV5dwH0u5E2EU
         Bu3Q==
X-Gm-Message-State: AFq9FYJ+SS8UEwO6xTcambANymnPcyokmq8s4356pUKGUw6KYyEgnpCh
	7eMCbeebsiB6Mbe3XCQR0JZMbhQ9SILxwOerROUx1UpxQYXMNxYTGNvF6beQndc5
X-Gm-Gg: AYBFou023f/SX2JQs4wqhwQ+UhCqrgzEQXsUJ+SyHJ4yvkC9Hzo5YVyBwm6cSFgm2Vj
	6IM8B9ETd39vyXS4zpPaSRWX1a64P6fGOxOyzcWhP9Xvw1q2Ksh7rnPMxkrQf7f9X7LUM2h9gKF
	pKzMNL2BpnXSgVLrEMNkMsYBMZQe+f8jdKlU/pTkgJRIp1RL9jkTPNTHzx00OxSRl/hmXt1aTVV
	mMOsoTiJ3Hde+UM5ZZEgiYT+NzsbOMPMaGDP0j6tuL7Tak6w7K8n9xK0+8DTWEmM38zq/PWqXig
	sGMOvRpRTwqlGFhbweAvDg9rTkH9P8zuCoZDBGKkdFytwe4uoDWadoRPqwCGPN8NuIy0K+AsC28
	uQHHSIAOzAI3zTOiC6fMYqHzI96tbmEj17cBZfRbQsyG+gQiAxpZCQJl9wGdB9jJJpcyyjI555B
	wrqhZ9/7J11DF3sTGEFGO+3eJoeADjK5PSGiolhD7gDUFTukXLVa3sM818bdMI9/OL44fUTLfP0
	LwBAdkSgTx4PIcKRVNjh39v0Etpi8Zezsr1bQ==
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr3984428137.25.1790501339789;
        Sun, 27 Sep 2026 02:28:59 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b5736ccsm5002724137.6.2026.09.27.02.28.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 02:28:59 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso1461326241.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:28:59 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7a1:f7d2:e824 with SMTP id
 ada2fe7eead31-7af1edec5famr4750030137.29.1790501339370; Sun, 27 Sep 2026
 02:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918141926.3023230-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260918141926.3023230-1-peng.fan@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 11:28:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMrBStfd8QAi4U2iZ99y=mDJOUhB58XJ9yaz0v8r4bKw@mail.gmail.com>
X-Gm-Features: AclHuK_FNakOvnI35QAAk4owW-nxtMw0s1-lNczNFg7HJNVICSo26yhinb-7UTo
Message-ID: <CAMuHMdWMrBStfd8QAi4U2iZ99y=mDJOUhB58XJ9yaz0v8r4bKw@mail.gmail.com>
Subject: Re: [PATCH] zorro: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sept 2026 at 16:21, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
