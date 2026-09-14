Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2947FB1E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397040; cv=none; b=iFXPmojtYnmKiz+c4Or8oNmdgQSdHNzVv4OpkX5lDer7UZDBE0GuFYmEWmbJ43Vu09Nel+Fq7wh4oD3TFUZZSdtfRyy9ecGiCu6CpI8INiXyJ0O16fmIkE+9QfZHPc+M0uzSvbTlO0qhyUUwcPrkubd36y9SX50VX0VKtiU6zA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397040; c=relaxed/simple;
	bh=7+JBSq1lcxjIotZlZ8H7p6Vq1EEcX6XNFUx4HjDQ4oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6x6GsgMAO5sD8+0D15MxrGUrdDZ0hvQhd9gkZeqPeZm0HQntokTjl+MEt8R3z+jkFSgmNjE7vImLMu6SCLD4KBm13Gycj6w9+acMjorEJ9Xo73xcvYx5jCAnjY3HqXzis31dl/5Ib5EGgGGcm3SCe8pvE2swrq/UFvjncS0cjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+egMaGu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+egMaGu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1522128a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789397037; x=1790001837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbWdB1y5zAgVgUDU6C58oDPNhatCe/TzGoKd8VxEcJ0=;
        b=T+egMaGuD3bz+QBn2wERO8n9VJKfrTem/Vt/NJWgWp0JplttvC5XteR9bqjdiWz8OL
         Y90rU9uW+4NMpUOm1jNKOSO/i4WSXPnCPrIkL5CLBBmx0P421PyDP7flgIBMWgKk0Xg3
         VZZk8S+1L32yklyHzJzGgYLvuirqn8cluP6GuDgherN8NxezwHb1nqJFO/uTvM8Pka0N
         RPrZgTLfeQgTz44SKmpRN3PAZ5yZQEJjHmUlO/j792afBkQlNz66kQI7rBOo8jozeHUK
         ErXX9wCoNiBqjDVEBaCaTMeI5mhcj1bJzo7qojKHjfmi6q5OEbqWrW2Vtjgf9y6vQjhW
         sLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397037; x=1790001837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbWdB1y5zAgVgUDU6C58oDPNhatCe/TzGoKd8VxEcJ0=;
        b=Eh/DrxwqFef7t0QZ9ciEc6MEpurhPZG8x9f3e0if6BJUyv28i3PaQdPizmCCuW/VgI
         gJnzUE94BRItLZE2dXOzze7GO5aOqy+AfpecmTkez+BZSnbHggNH20yKcMAtyaXkr5PP
         EaudhBZwyvUgzkNQl12VvpuXtdycED0SQT0B/+Z5/5ZrArorbAtYoqMQ7P2HBNjLylj7
         UDCVhgKpCrBTsNGLKPfApWn8BqRUBoAWRsKAlOEsKh+342OGK9Z5Q4Wqq/jKUjlj0V24
         eIEOUzzEE0Cps0ClxjlFwbjB7zkhyd4eyeoz1uOkjm1XIKsOChLEmSiy7JpwOI5kL4ey
         4k3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwD65apMBN59zBNr6c8GSPz4PsO8u37X9Jg8yCzsDxQbAuna35k/AcpDcPpxj1YZttsjlDixorThELktdI=@vger.kernel.org
X-Gm-Message-State: AFuF++mHfWJqsgvyVKZJlkfNnAJYq/NhRJA6eUjoaHdEHBkuaO8Wr6uv
	2exIyLk9bG5XqQcOuOKYiHCKI/tThdTM9114IUuJweguzlez1hGKp5NW
X-Gm-Gg: AYBFou168CeYZDsBRKWrbuX9ysxtXAP2Btg+7F03hUisUmLp/bqC55dqrDYLotP18A2
	xuWd4AgwjfBP5SxnYK0ySdeu4yZZPes83jKPUg1C9wXLBPgDUj23XkvnSOOdvt3Fhk7C5pX6M15
	3naLLQy/k2rpBeB8vawgmmaZotd7l/3dio4ADJ8IrpROstIi5Ryki90FBZIjCSNwovGkL51M8A5
	eBBmR0qMhFfLucxz2T8RVR/deVIMdNptfntmL7mgJf94rZk+aZoF+3Rq3PkhARWvfaiXIo5/EBY
	Pb0zOMyz5yTcHvMKPc0O2k+go43NxduBxTmXWjMHF7wh53jBeLGDhR+GRnP0/+H9rugXLgvUb/0
	BqFnbokhpXBXcXiY+Zur1PmppPU9QiU911u/U/5V34rkZfZ6CWJ/bsQj3W8+0sxb7NRAs7O7I1a
	JcALYB+LmUHE2uEoxKQrF9iEWaHEM+ajHfkeCNp/P2KEUS5cNfnxUtCzrJFVhNULqfez7KJwopN
	Mk=
X-Received: by 2002:a17:90b:4a82:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39dec05f681mr5602152a91.15.1789397037224;
        Mon, 14 Sep 2026 07:43:57 -0700 (PDT)
Received: from celestia ([2402:1980:8858:8cc0:7bda:d54a:257:22ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994d8af1sm22675307a91.11.2026.09.14.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:43:56 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/damon/core: add short circuit for esz<min_region_sz in damos_adjust_quota()
Date: Mon, 14 Sep 2026 22:42:34 +0800
Message-ID: <20260914144409.4592-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913162046.99109-1-sj@kernel.org>
References: <20260913162046.99109-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 09:20:45 -0700 SJ Park <sj@kernel.org> wrote:

> Hi Liew,
> 
> 
> From the next time, please complete discussions on the previous version before
> posting a new version.  For example, in this case, you could replied to my last
> reply to the previous version of this patch saying you will accept my suggested
> changes and wait a reasonable time to decide there is no other opinions.

Thank you for your guidance.  From the next time, I will reply and say
if I will accept your suggestions.

> 
> I think the subject is not very clear.  How about something like, "skip quota
> score setup when quota is full"?

Sure, it is shorter and more understandable.

> 
> On Sun, 13 Sep 2026 19:01:38 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > After damos_set_effective_quota(), the effective size quota may be lower
> > than min_region_sz (e.g., when the temporal quota goal is [over-]achieved).
> 
> This sounds unnecessarily specific and doesn't cover all the case.  What about
> 
> "In damos_adjust_quota(), the quota could already be full."

Agree, that makes sense.  Since users who is using temporal quota
auto-tuning should know what happens when goal is achieved.

> 
> > 
> > In this situation, damos_adjust_quota() will still calculates
> > quota->min_score.  However, this min_score will not be used in this
> > window, because in damon_do_apply_schemes(), damos_quota_is_full() will
> > always returns true, preventing the scheme from being applied to any
> > region.
> > 
> > Therefore, add a short circuit for 'esz < min_region_sz' schemes to
> > early return from damos_adjust_quota() before calculating min_score.
> > 
> > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> 
> Assuming you agree to above suggestions,

Yes, I agree those all suggestions.

> 
> Reviewed-by: SJ Park <sj@kernel.org>
> 
> With the above assumption, I modified this patch with the suggestions and
> applied to damon/next [1] tree.  I will repost it for mm.git merge after a
> week.  So, if you are ok with the plan, no action from your side is needed.
> 
> Please let me know if you have different opinions.
> 
> [1] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#scm-trees

Best regards,
Rui Yan
