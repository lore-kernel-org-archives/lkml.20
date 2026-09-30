Received: from mail-wr2-f18.google.com (mail-wr2-f18.google.com [74.125.225.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87D03C13F5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763650; cv=none; b=jrTg2yBXJu99DRmckTM45S1w+eRgDjMjW7ZcVmcpKaubQrm0lbHb9XElaUxp8y+wypUB7g1hNlL1Wak4wkEGiZAMdQW09tRzjatR9Tcz8b/o882lwMXWiDCRPxcP35pIDQyG5dCs2BuwZygAOEy+FILfeUlpKN2834aTZPDngWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763650; c=relaxed/simple;
	bh=yCEUIDG2Y5GxlvT/wMCKh81Uule45kf/VzVdVnRjAAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwCyKobESX+BfaABeNgrrA29nCrhmW1gfGNudwf9llGQs24Wk8pgddRqVPuEsxzMpGIkgI1ZVsvKefj+rj1/Z7H6/ar0ytG1dvJKmUUuQfflXQPOF41t7DQO1kkdXJ7p1RaI9pb2sKTVqQLPGL55IcPfY8HR9LGhQqrPhyO9PNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDN3W9i0; arc=none smtp.client-ip=74.125.225.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDN3W9i0"
Received: by mail-wr2-f18.google.com with SMTP id ffacd0b85a97d-48435ae9ca4so581604f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790763647; x=1791368447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Trz0Hy57r+e4WvJzgKsYO+aJWqbZyy7nYQ+SL8BlRbg=;
        b=eDN3W9i0h0hlOFCy+ixfJ22h6587/Hg+2/cL1G4sit6SheMSXOExRfnQaU1EunKoGd
         9cIkUCxTZwigCLcUF0jxwUNBKrGwu98lnSO7GFN9jNWpFo3U3zbk92PZ+OYNcKBWw2vn
         5pvyn1a5k9cQ2LVnReS5jKa5zpoc/phvXJIO/XUPFBBrLZQYbdug09noosxcY/D2WbW2
         +OHXVkSUoVQ1AMQnA0gAa9cBl2IIAMEAufEUOBxj26/pbSram8UBxKwPcy142sJJpX5D
         LtgxFLZAOseYa1Mou3vz9MK7VHm6AQcOSeEUnMnhgABIBo63++ZOkfiHKYXbid0ipj3F
         kumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763647; x=1791368447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Trz0Hy57r+e4WvJzgKsYO+aJWqbZyy7nYQ+SL8BlRbg=;
        b=O82GiAEvFErWskh3bZ1Ii9vNjtGBrmv5jlDDP5YyLcZWfeuSRaG3SzZ9RFevGwj8Ji
         Pp4MSYkAIi5n/bhCzz99MX+Y4GGAmbwjaYtvvKXff4Uj5N+tdzTVJdmX7JpErp2H5lp5
         bpMLXoo1Y8mLpiK1ledagI3TD/uYQNMfL/LV8VEJoH8l1I8XLWtx2LhGpmtvotAI04aL
         5AjpVTfb/ceKGrbwDt6Z541tQCjUYeY3OrhvSw02CkIN5V6QdmDhITRtey3P8MpzvR8/
         CEC79DgWjrTfx+mfQqtuTGTeOhjPtqDPEq21ebWf4bRx4K+eDMNjiXdWGT7NhxVJQGjx
         VvQg==
X-Forwarded-Encrypted: i=1; AKwUvBw4x9kwmCv/3LEy8DhoBjHTsEp5VeNGr02jm8n15X2/lSzE9+aOMcbsaG6MI4nI1Ra6bnApuYwn32KaUXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf2YwgN6kvJgaYuuvtADil6CP/kpmPRpyx1R55TDA4xTO5Li4e
	mZ7wIUx/CfdgigGH70RSP+wwwg95ar65L2BrcAL2kGxZELsuM72/cTYG
X-Gm-Gg: AYBFou0kGI/bllrjD6cS/7YxG+aIxefN0C+raKAcTUPykrbwH/PV6COClijwHud6VRe
	vq5myOQvX4sRD1ob9eMjfvaLlCwwT/ubk19uMBPDpYkV0ouZUt91Wnd3t6M9B8mTk+EhukFKjb4
	Ak5GHwKiM+Bj2cRSB/c0S+pf8zST6s653UNxR2B3zg1XYKpJoV04dPTQYA7MuWbMXlgSJeCLGId
	0hxEd5eKqf2gvbfT12QuacxJx/PL3kDNebDcfoZMF4nMUIxQtxJ39rg6h//jl2Q1P61Ap5AO//j
	Xi9Y+xnNFC2kuEWFMYPmPQJPlnWdiRxya0fDafIGDrmRmkdlFkCax7qV8VB+B1mvD17WlGGIDpl
	5bVlLCuw4X1YtcLo2WOs/Uxcuy24WKpE6OVIRK9d84J1s6fPQTgJwn7B6z0KI/R3b5t0kEBQ2VX
	G6gJd0aoGIQkf+kDMjDOuTDAiiywLy9qF11HojFI8DLimjZDKhbGl2RFocuY9a1RpzsU0ieeGPn
	E+LqDGb0KleDy6dzZEEYSu1q7FDk0E=
X-Received: by 2002:a05:6000:4a19:b0:488:82e6:265c with SMTP id ffacd0b85a97d-48b02381237mr2123548f8f.0.1790763646785;
        Wed, 30 Sep 2026 03:20:46 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029fc420sm2328850f8f.28.2026.09.30.03.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:20:46 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	rostedt@goodmis.org,
	tj@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
Date: Wed, 30 Sep 2026 13:20:43 +0300
Message-ID: <20260930102044.208070-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929085320.337703476@infradead.org>
References: <20260929085320.337703476@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,

I checked everything *again* to make sure;

> -	if (!se) {
> -		cfs_rq->h_load = cfs_rq_load_avg(cfs_rq);
> -		cfs_rq->last_h_load_update = now;
> -	}
> +	/*
> +	 * The above (forward) leaf_cfs_rq_list traversal will have done
> +	 * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
> +	 * list backwards, such that we're ensured to have visited every
> +	 * parent of the current group to update h_load in a top-down fashion.
> +	 */
> +	list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
> +		update_cfs_rq_h_load(cfs_rq, NULL, NULL);


>  static unsigned long task_h_load(struct task_struct *p)
>  {
>  	struct cfs_rq *cfs_rq = task_cfs_rq(p);
>  
> -	update_cfs_rq_h_load(cfs_rq);
> -	return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
> +	return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
>  			cfs_rq_load_avg(cfs_rq) + 1);
>  }

Is updating the root less often intentional? 
Or am I missing something and we update the root more than the old code?

Also, there's a typo:

> + * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
> + * 'us'. As a result each segment is in fact '1<<20' ns.

'apprixmate' :-).

Thanks,
Kayra



