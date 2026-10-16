Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DFB381E8B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124952; cv=none; b=jtITadtYeM/itC6+tfzhFNGmh5QrCo2hNsSFZskzHIcYugn0JQllC4eg0EHAvo4PTsKj3FwzRvV1tGHVdusxJWBprdYp1hiyLdhRq7RMrx2X1a/+LmoNbdv5u0UZldGjvx7MmFAeGQTJEA+r8rk9Wuddw0eSLGEo7k2y3u3fi4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124952; c=relaxed/simple;
	bh=1+XW+Ome/LvXPMV4QzxLiHxj/KEOsQpJVfFab8A9Dw0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qHaFAex2qcsSspvGloospPQmCHCSJq1V1f059HuB8rnDekQllJ/a5vvPEUgYNF/GmDt+BFZZsC1nghGQOO1dCTqabwpyZsylvqv1VN0aQNt4vClZbX88wlIJfpMho1YcWdRkQnop2/YQsV98cLhQLSRGut8cx3av4YBIlRYjF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9SDdX30; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9SDdX30"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30b6dad2382so14393213eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124950; x=1792729750; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e953H2FvbuXgi6BcmoJysvQL7FaH+/bf9NBOMwRhcTo=;
        b=L9SDdX3036/LddpPgQ1jPPuUM69rcoc28SG56Tb+2jlidsszAmgL1RTg4nwDqSI80h
         Fz/Lq48XdAHnTQszT8wdsH1pPjGjtIY6EVoCNNHFENYSH1g2KZef/vgJtDFUbb/6Tk0i
         wCTGiCP6jbIx8c90Vcxqsd2psprLpjuAKHzEcKkL36ORdmlk9y+0SU+Nsi+CMspCWV2Z
         uogNhoU9Q6tV1oxMq/TYcoxVXnq6apiY8aPvnaReFY8AIxjUuBRYTsgoQtvHoI0v8FrC
         jokBmUCteZoH8fZOHTtAQbYO5qLmWmWuyHkSB9TdVQNgD818N42EazFe0agoLBYnfCNg
         kHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124950; x=1792729750;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e953H2FvbuXgi6BcmoJysvQL7FaH+/bf9NBOMwRhcTo=;
        b=Ea/qGXpRMBMxcE1K8jWpjsDnkR4c7HoaBCx9h9OUY+3L9/FXpn+Yr+odclHRDSf3Py
         GWlscU7RhSq0iDymS1A/PekmNoboPCBfsdCIyEbtZu1zKx0+Hse24jvuqkgT7+tfyv8Q
         bU+VYU2CIE03Mt/8RvKAsGJX5iSBHiKj0M99LEieOzt0kIV8U5+jGg10WRpq1pLNotdk
         LlwnPHgivN/Fl5MoTCZpIlh/kGUY2iLdehydfncvqWNwvqlrFlvDLmnSeWl/KKd+G9DI
         PEnN5ZBgg/V9bhXSQHbIqHq26wd96UnBLtOfmdsM309O7+pmU946bwHWlaHDE4eM0PPS
         EjoQ==
X-Forwarded-Encrypted: i=1; AKwUvByJXjmBFMgG0GJs3TSU9K8BIXIJYGgmzLo4DEJlmGHTC3MriSjGakdw5vtGCkYqgJOcy8e95gAKQ2m0G5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/m+YUrcvgvESuICOIJGUw5qdgAOnzoCiz0l9Dtl2vt7NTJc97
	rfEvHa8cDD6NLhhljevrh6ijR679cn6zhmS3diWdAYQUqz4Cj9OVXYuu
X-Gm-Gg: AYBFou3nuvJ0ng0MOxuG11OoVkVk/kFnOLxJPHQE7t7RlBPiW2vR8O6Sk3t1f1w3sXu
	TaFEwYMBJPI/VMpqO0g5eVkE+WAwVzbEr4jJtUW5yotnPh213ULwVe5OzlhZ6GmSpkulPz35nGu
	KcI/j1gWerjnZjO8PgTPjzAqtRWhxpkMobHnIa/79K8yL+bz9pUBHiRzVrfKseB8cAU9G5Srqss
	uo0g/4DMUB+05WHhNA0/yuZWdyhYhIR/ikcC7gX037IWOjAJUinivsp0e+TMzIEObHUE0FV71KN
	YhwJt+lUCieB/ZcveWBpgbW0wgXtekrmE6sxbJdkngAM+t1zDUMxGPexCBn36hhPYQDfa45SPa1
	LQ2rPSO+jjxH2PDlTolULTheFJjFn3cyIhDDFOmBbM4Kj/L/kfaOgZLO6+JKBnXy22OV9tDZewN
	LuENuAhhGz80VZ2KddTkwDGcbU+grrPx798q5QEIwmsCctvpZtmccn+3QHbKKIFCywXoITZR3Qz
	N8SBMwobFS3hu8sRoo+9PrNS1qs1KIXa4gyMtLXxQE0elU=
X-Received: by 2002:a05:7301:1a0c:b0:359:c212:a4b6 with SMTP id 5a478bee46e88-359c212a4fdmr20065723eec.7.1792124949538;
        Thu, 15 Oct 2026 21:29:09 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2712719eec.13.2026.10.15.21.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when
 available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 21:28:41 -0700
Message-Id: <179212492176.1746949.5300479338170135134.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792124948; l=530;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=1+XW+Ome/LvXPMV4QzxLiHxj/KEOsQpJVfFab8A9Dw0=;
 b=H6hLrJ+dPH564+n6v/3LWaPDZgSy6BD/vGWMwExGgc6G1cdhhrQteApykfi4KDHO1iJRuGgVY
 4WlujeDlRk3Dmia8YCu7PudIx3vCbm7N/PKuveT+H0bZh2ngEpuQNGx
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Tue, 06 Oct 2026 09:52:59 +0200, Radim Krčmář <radim.krcmar@oss.qualcomm.com> wrote:
> User-mode use of Zicbom and Zicboz requires senvcfg.CBCFE and
> senvcfg.CBZE, respectively, which we set only when all harts have the
> extension.  hwprobe reports the extensions from the per-hart ISA bitmaps
> alone, so it can advertise extensions that are always disabled in
> user-mode.
> 
> Report correct environment to user-mode.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

