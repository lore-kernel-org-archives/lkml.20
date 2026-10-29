Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239506;
	b=lj8xU5gXTg/cri1BKi+9gVgjjjWgFzJhvpymjzMgMaSw28f14MaCC5tpzrlUPlDRMp4N
	 b8UFkcgeKS+p3Re3r7rYP85K4G7uKgXjbbHMqVB43sUtZzJVPjk84PQSHvGVG4eJ+h1n4
	 fg86Ubvefm0OEMsR2wDo13Q25tQ6/yvp2NTk+GvmRgQOPHFHcYeoeB8WrvEYXNAVxFHG4
	 Hh9NGjfMAFxZAwfo3+Bqatjs+pJsTJtdFwuGolS7vpCfbgdpipT9cyNGiAxcqKm1ni+Ni
	 XueMzlVtKH3/XDldv32qbYgOm6J5O0BsAqGeLLrW3eHFq71jxwaTsapBMqlVC8+vBfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rK99wOe5YgzPR+1j3EODIxuynwC2Z4XRQXrPwpcj2BU=;
	b=fVu+TAx5F5eYNF135m5otAibbB7fIvd/h1cIztSNjlRxsZsiG4DfUNEv4U9TV4Qq5CFS
	 4VtbIgjOcfZ4CvhWcD/4psbu4kT66gDe1HbbysjGEaPzKfFIQR5eKnodVAqPDDZDHislO
	 vj/UMhypfxyeHYAATHycB2gf2k0/SBrutMl85x8gIsd+abgDyqKRSjZdKYSghI83vvepg
	 72di8vsFHRO997Bd+Otdi7abH3aooLNv8IPPhNrlZ9pRFqOdQf+0/ZVA3hIS36iQAN9p0
	 wdR9ZtqWiNcT8i1jMkCevN+oTNqJbM7bVsSYHL+vmg70pPpUaJ91xFzknJrq9a5MZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q34FXj52;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CCF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CCF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q34FXj52
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e831e86ebfso9624735ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793239506; x=1793844306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK99wOe5YgzPR+1j3EODIxuynwC2Z4XRQXrPwpcj2BU=;
        b=q34FXj52+FMW5ERh61n8jdeyaSUvxeJ2Gii7cZfzYmcczYbLwcRQx34TwxQflDVIGd
         o23JqHDm6sQ9V36qbaXt+jbYX5afy0u/uQvzOWk0gyieIobG7T4d3+SXeb/1y9xbh3vV
         xWMGLEHpjdkv9ApfLhnW2rTrBTWKaZac2GKXHkOYOD16h40pt9BhLSgPaKz/n0gWWt1n
         2cI8fQMyWRfD9ZMpeqKhsJ34BcFInz5M1ujzi6wqwCeQwED/aXAHHhvbWBEbbXbSzfN1
         wDRejzF+bB0MkKEtEEAgylLcMhuWtW+rq4B2nQ2M6FFVPmfLvKrkeOk6592/YZlRyaDf
         f+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793239506; x=1793844306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK99wOe5YgzPR+1j3EODIxuynwC2Z4XRQXrPwpcj2BU=;
        b=ezxNF4zEbPXcn/COkw6eDkq5kbN4QiPD8lBMpQcZiD3olVI9cheyVnekhi6QR60xDK
         +mtIPOgkFo0NFdH53XlLbB4jtgkniJkPvz57xlZNIxaWZ2BMOYEF6jujp8xkdMoi8E9c
         JCpWI5cfISKiwfxX8WcSBhYQtdhvYdcrReAAPU4GWQ0nuSg0NjhEjce7v4nRGayD//0n
         gEbth9jPT0KWqOOn3tClromWctIHfzu1AP7SY44MU5625cVZzoCleljWkdVd2m2zswqH
         xp1sGFcL8dGDA0pfIxLIqV/r0Mh4pR4o9YDVBBfzl2zK9dwvz4BMMKKHmvgFd1n23qzA
         5AtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa584OZ6mBccouOi4XXobEVLKiCd2mEFzvTPV0qk+RBQO89KXaRvkpy21M0/VCGOxKfLQlAdjgTLtNECc=@vger.kernel.org
X-Gm-Message-State: AFq9FYISLtMiPQWLiQYZw++iN+vJzjy0Rsj15K6Qa6aMuz/+cICs/Hyl
	ri0V+cK6wdwpEbhat6/R+R+LgiPex2xdrFPFQBh6QiS5fZ2J7CdHrgbb
X-Gm-Gg: AYBFou2ogIRqcIWLdNi+Qvyn0z1rzFke6V2l9IyzqqbkQtWxrZwZz+4T9nuMH18NW1j
	l1h7eTE1TFdfPRZ1M++qRRUBeQiiJ+syVW6YqEb8AkPn7lsGDYNW8NKSW45MzwXtaZptpRUiiTB
	aVU23BAGoBvQlnR8GJZLw8n03nQ3IGsZV8HuXImS7JUVgKn8ww5nu/b91TfQZph79iI/rCq0/kd
	A2j0EEc1rBDCKyNdzaFpExHneBtA8BXwl+1RUuyy8hLDKu8do3yUTxNRQCUfIcQ1FP9GOW2s4YK
	HBxGlA6M00uXhYErJ6PvJqXyUOlRd5XDsIwqJINjYT7jEooY0tCr15/OD+ia25seE0b789zcxz2
	1VsLB0TBGGJNe8gg9TLh1QMOdQkjD/EGgd2S7maiCFEBgUj1ktjygcKVkh53ZxrtVjygXO8+DKB
	2j0l5TLqa1F+aoI00VUST7pEhKrr8dKI0g0AN2EAu/bgrwVw870LLrgUNEzNHZ2vWIK4YDK2vdB
	D+SgSNtbQJETAmr0dLSnSIpvmFJgkhclOdk1RCwhXotMb4spufr+mhenbRSaKo8TDDO6S7/RyDj
	C5b9PTFqPtRBl09AK04kGNtBdbwUvuedHhNqNxZKbcRiLCk=
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3038446a91.10.1793239505712;
        Wed, 28 Oct 2026 19:05:05 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d1650csm2351887a91.1.2026.10.28.19.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:05:05 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	penguin-kernel@I-love.SAKURA.ne.jp,
	tj@kernel.org,
	mkoutny@suse.com,
	cui.tao@linux.dev,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v2] mm: memcontrol: don't miss processes whose leader has exited in OOM scans
Date: Thu, 29 Oct 2026 10:04:59 +0800
Message-ID: <20261029020459.3335597-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-188003@kernel.org>
References: <sashiko-outbox-188003@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 02:40:35PM +0000, sashiko-bot@kernel.org wrote:
> - [High] mm: memcontrol: missing CSS_TASK_ITER_WITH_DEAD in mem_cgroup_scan_tasks()

css_task_iter_advance() drops PF_EXITING tasks with !signal->live before
it looks at CSS_TASK_ITER_PROCS, so the current code doesn't see such a
victim either.  The patch keeps that.  The changelog's "until it is
gone" should read "while signal->live is non-zero"; I'll fix it if there
is a v3.

> - [Medium] mm: memcontrol: mem_cgroup_scan_skip() exposes left-behind exiting threads

That needs every remaining thread to be past exit_signals() while
signal->live is still non-zero; once it drops to zero the iterator hides
the left-behind thread too.  Without the patch, the left-behind leader
exposes the moved process to the source memcg's scans until then.

Thanks,
Zhan Xusheng
