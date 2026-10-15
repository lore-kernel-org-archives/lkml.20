Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469D08003D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029849; cv=none; b=UtYJsukzwHVI/qPg2hQSU0pbrb9Z61IoAcytFvtEkFxqLtxFARUdOLLzWp9kcSu/5veyp5Ry5poEq9sArG6Tckh3gptt6aoVV9/yVHdY1hbVtvjJQ4ulJkT6ON3cNEtqf5kcQ8X+0xWqYe8wA66f8HNwshFZEB8hFYdXZY7cI+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029849; c=relaxed/simple;
	bh=5/R6V1sofD4k0McXJtl/Urnps5sOzFV+59970M1RyAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTLSyGW+txqCdHlNIEVCxUrQJ5FNKzvxXyxYpYKK75GVPkkNf64qNYEZB58lYrrLypL+wS46U5l3W0il4LsJnjz6YmMOpoF0lb7Pr58R8FJ0Nxy2ZNhZKgwx8YPWr577xsxzoKzLpmO2fZ49HHDaH7vlmeuQGO1v+5GWtM53N/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DWVf8Kik; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DWVf8Kik"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so3038006a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792029847; x=1792634647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+wgW4AUmqbNUpe4dZRuBCucz11edTIwYqEDP8LKuxdo=;
        b=DWVf8KiknBxVj3QDwjr6EBhSZyNKrFhkcz0fZkHIgHbTD7vKtzHIlSNVF8PBAhtJWx
         DCJLzkpxLIY77V0es6cyjZ/JtD0lv48mfEExATMMKoD0SSA9P4YRXRRDTbE62sQ1Q4/S
         xwxJy7+vGQlnQif5TA8yeAdRby9GzOoGHv/c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029847; x=1792634647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wgW4AUmqbNUpe4dZRuBCucz11edTIwYqEDP8LKuxdo=;
        b=Dr5SAcKvVpY4M/b6Mw63rKgde0C0Q9We+xun9ZxeYjkHnG3JcNAht/Y+2IwzboLUTC
         VHkoksJDgWUlDitFauOWZ6pyoyTHoTf/jE5JNJevxvXtZ0/lo82jpUdSulm7PKvNX1J4
         BhVRV3B4zrklmk3Jx8X5vB7LurP6AfzFdM5uboTaPwm8cMEksNjoR+1vOmJiVdl41GlQ
         rLfAYHmKpHMXm0L0G5btO50u1HpO4G5zo+Wok3W6s+XOPAaAx5W7Hvzojhyd3f/wbduw
         wDPDbok9Dv/vAhoDQdCOhV93i5QQoCYqToXXpWr7e5NDH0smWE/bky7mxYxwV7GNUJEx
         +NhA==
X-Forwarded-Encrypted: i=1; AKwUvBxRnN33gQPURiYSy7QuAQvI8XBTUhaDEcFLdP6lXq5hKlqBkns7r1Wv7eVPS8e9ujL1oEEjCvfnsrA2nAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHtNd1IkRqnYaGqlGeUwN/Gkha/20hmPej9X/yMHB18VQa3eYr
	uLmtYqGW8kRT8brUfcjRnrBsQ9eWigS+1mAZnavuf8IArDSRADhgcG+hXyKX/bninQ==
X-Gm-Gg: AYBFou1vP+KayISYfmK1Pz2c2gbexOQqF8+46wMi82ousMyL4OdDKzW8maub48mm+AS
	FWPqmaE0NHxWYVyiNAOV3LndTHyGORhKmLAHw6uCOqYBzOtEO+wlTA7ebTIiWZMrNjf9lMac4kP
	0EPjChVYHapN2h1FoCOikF4OOzp6rx73g4U4FKFBKHKCoJ7sXTzZOl+go2IupoX5IcZjIbvDVdg
	IqOTGDQ1TRsiMqMI7/E9FLozNCqAWEUwtSVFEMKOOBpn8WIIm/c8kbCyT4oea+GqMxNcCAy/JnO
	DqSqesrhA1Q9rSawDyRB4KTQTB5Lap3QLkC3khpwhdgw1ag2vyrTdHhkwz/TqeA6T2HLINa7/5g
	4MsCwEY3ZH0PsKlDjD2N3qRkTklj87cioOZPZwic4BS+C972oNQdukmxSA4sux0gsNREpr/DJ6P
	o4JlfKTJbMKbYThhnwNGI+53ZpsJRPeoKA4B6yYHOJVAdVG+NRo/ygoItGyOLQcoD9MBW3mfTw8
	13JGlVGWkxvYO+USR1pCV72DJ4+0hUllLUZnWQ=
X-Received: by 2002:a17:90b:5828:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3ab3ac95f56mr12616470a91.59.1792029847508;
        Wed, 14 Oct 2026 19:04:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:8455:7899:5a2e:26f8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm1889088a91.10.2026.10.14.19.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:04:06 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:04:03 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Barry Song <baohua@kernel.org>
Cc: Bo Zhang <zhangbo0325@gmail.com>, senozhatsky@chromium.org, 
	akpm@linux-foundation.org, bgeffon@google.com, minchan@kernel.org, richardycc@google.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Message-ID: <atAzS6mTZQ80tTHM@google.com>
References: <20261013035201.2809924-11-senozhatsky@chromium.org>
 <20261014153603.1365617-1-zhangbo56@xiaomi.com>
 <CAGsJ_4wuPCPR0DnbrLp7ebdO=Oih6K_yP4XxwETKQ+3U+THVjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4wuPCPR0DnbrLp7ebdO=Oih6K_yP4XxwETKQ+3U+THVjg@mail.gmail.com>

On (26/10/15 04:46), Barry Song wrote:
> Also, with either deflate or zstd, create_dctx() will
> always be present. So, what algorithm are we actually testing?
> What happens if we switch to zstd?

Right.  Am not that concerned with deflate, but seeing zstd on that
list is a tad sad.  zstd mutates decompression ctx, so it cannot be
shared.  On the other hand, zstd_dctx_workspace_bound() is almost
100KB so allocating dctx per-read request will be rather problematic.
