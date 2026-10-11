Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242F53403E7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735458; cv=none; b=XL2yAlQkIcIWwGkwuXUKqWvwoCWLa2lb2GDFusQ/yBdVZwhGy9kh1cy8bgYFQtGrifkHqTs5pgIg/EyQIeM93/i4RlUGxpsdi8kpAB94SEqXu501CqtexYtOFrEGYZvI/94x3+ywUY5XpJpU201otntRs84lwBwf7LJS9qS1BYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735458; c=relaxed/simple;
	bh=JviAVD7CAW7E+0vcjillo9AKIV4/oAfZhVWG33RBMgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dd69n5Q6Wamjm/hqtRM3U3+Lm7OM2ansK8URC/PNicsAx0Fdkcp51AH/jTXYOMUO6ViLWjtDc9PH8XTIjA3PGGKP3xjrYG2w8kqip1mRYQamD4eLAF651BvIYNRHScODQePVdWz0+nLNHp1M+2bRH1qAeklDsMwWqMtLYaBUXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nm0CT2Ju; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm0CT2Ju"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso1708541a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791735455; x=1792340255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrO8rMXn4hw9ZgBNUuWR+KCvckoUGl7U23CGJiIQkKs=;
        b=nm0CT2Ju7BOv1Mr51X3uxV9iXt9NJEx4u+D82C7JzLbjiOOtnzPBHTmPiz7CMYQFEe
         gVUwoS3Y1jIOiir1kXgflg3Hf2T3f/kHIlKtAWrv/6cDHaxFXSUd0p31ztYU7VJD9AMa
         Cvq/ClYugrOlsEIMTA11rnWWBm4mUXQEvJMmw81s5RVWvM2t05m7b0bvXlEdOdRcAMhY
         YJyFWOMIwAX9Ihemvessnf4Cv3LrxEdg1b0C1PRAP3S0hZhZpiuIkreTjB5nUsy42Yr7
         LpSpsVX23YiZq19Um9MDzS4BLBwasHAMUo3kMBdC+TBlvtmGM4ZDekBLXsstmYyjS9eo
         pRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735455; x=1792340255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrO8rMXn4hw9ZgBNUuWR+KCvckoUGl7U23CGJiIQkKs=;
        b=aaBwNKkKaARYNPXCpcKhC64Xny3FgD7pDip6y5a23m3LsavLwc4wv/xGr5UHXxdKlf
         cq+d4Bg90kZEl5nvXa1rxCaIYqS+j7notSCul/xf+5P6zWVh/0I1c+JPKBzInBhF/WBp
         OYyf8L8/Q8TfvJXZbBb2r2pCqISREUrYqLoJ2cjhnVbryhjmuA8R2fWMtbbmqzfYajmn
         fjADmb2xYC69so0Xf8+KGuzUGOBOJlujalrl3J8ian/NOfAc5P7DCILCmKBS/m+ubUGE
         6FdZDnkhr1jOh5lJlW/Sd0ocgOwDOJgxAI7hmH4itP+43TUI8pAD3aJOWIqhldLIkkfx
         heYQ==
X-Forwarded-Encrypted: i=1; AKwUvByDuDtaillrfRl10BLuqjc64NPErmNM4LG8dwDMyMcK4yL1CUnjlcvtPYzwSUOfP+DErSUZ9Oish5JCsQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKvxOXjc08nivBz4z5fa+H7PvWrFPZInt3m2+VmZWSjphEqGfu
	I0P+f5lsGHu5v9u1u8UWQOZAwkTlMYI7fvg+5N0tLhmujojyklu4gR0u
X-Gm-Gg: AYBFou0Tcj2uSvFpZm8wHM5AH2WUJ6WbnHP+QotIuRvVNEmei17BC+CK1zoqwzjh7Pl
	D6wVeJz07yJBFqgZoLYWOc2BDH1Z4JBVTKO3aefxf5509gsxN4D2YyEzqqbc0dFz0bNvZHl01fM
	iH2pb4tIA45F5vcL5YNyPMHy81XElPIOpdbmUI+HOCLYLpb/XQKABvKAOu7PiPLoVYqbcDOB52+
	lwEQxxBPQAh/L14vHSCfcrF4ys/xTz0ZpUPRZujAtDZClnvyYtFTkqM7LbHRg+BYcTwbPxOPgiy
	ql2jYxFgJSBCxEWcsWJfqvB06nthe8M2FIU8/901OsP0vUegihVzvyi6w/0wbeRqr2pfyqe4VFk
	XuepY3ZXUWcbodYFGqol82FPXpMDPS1R977WfDXprdKZrbAqxHP047YqBh7+8ulNBezLAXOEOMs
	hHAaUL6IMmHs64q/1+PvYWy9b8WATNOnSFrdczQQAMTH5f0sJfq8prWAm3oqNqkQ/3RJMX0m3ZQ
	xuYdX4bqM+lIBN+q7xN9oDtiY2r3m8rKA62WfBK03U6uoqjzg==
X-Received: by 2002:a05:6402:46c2:b0:6b1:c2d3:6a6e with SMTP id 4fb4d7f45d1cf-6b1c2d36d23mr535539a12.8.1791735455046;
        Sun, 11 Oct 2026 09:17:35 -0700 (PDT)
Received: from localhost.localdomain (host-188-122-3-146.finemedia.com.pl. [188.122.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd395dsm4065484a12.17.2026.10.11.09.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:17:34 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: dlemoal@kernel.org
Cc: dm-devel@lists.linux.dev,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dm zoned: do not reclaim a random zone into another random zone
Date: Sun, 11 Oct 2026 18:17:33 +0200
Message-ID: <20261011161733.404-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d4adf5de-9d72-4977-b4c0-3e1f163872a1@kernel.org>
References: <d4adf5de-9d72-4977-b4c0-3e1f163872a1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Damien Le Moal wrote:
>> +	 * Without a free sequential zone, moving a cache zone into a random
>> +	 * zone of the zoned device still frees cache space. Moving a random
>> +	 * zone into another random zone gains nothing, and when the target
>> +	 * is idle it repeats forever. Only fall back for cache zones.
>
> "fall back" to what? This comment is not clear.

To a random destination zone: the switch from DMZ_ALLOC_SEQ to
DMZ_ALLOC_RND just below. v3 rewords it:

	/*
	 * If no free sequential zone is available, a cache zone can still be
	 * moved into a free random zone of the zoned device, which frees cache
	 * space. Do not do this for a random zone: moving it into another
	 * random zone frees nothing and, on an idle target, repeats forever.
	 */

>> +	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd) &&
>
> Long line. Please split after "DMZ_ALLOC_SEQ &&".
> Also, is the test for dmz_nr_cache_zones() needed? dmz_is_cache(dzone) will
> never be true if there are no cache zones.

You are right: DMZ_CACHE is only set on zones of the regular device, so
the test is redundant. Without it the condition fits on one line:

	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_is_cache(dzone)) {

With this change the reproducer from the cover letter still shows 0 MB/s
on the idle target. I will send v3 once the Signed-off-by question on
1/3 is settled; patches 1 and 3 stay unchanged.

illofspeed
