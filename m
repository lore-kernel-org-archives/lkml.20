Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976254A92D6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363147; cv=none; b=LvVlX7CFUWxJmGUHS7Sb0qnmuNcY3n1Yc3b6LhZ/aTPjRoDI9GvzPMLDM7BZn0BooW7K+HvogWcyZoJyJdeB9mkl4GcFd+KSJ4UAe0PXVg/Rz836HdZZQVNHy5hvAeo3xs8eefgpO3Zib2PPJ8ae3+VVYYmxC11z462h8i7aXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363147; c=relaxed/simple;
	bh=qLHWnBEOFjUrpzfP4yE/vh+2VmaJi14XWXyewY/A7BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlVNPeg6JKdEK4Puc48JXYKi6EuqTtkeJSkZ27DLxMpGYkrnJU7bN4TdX8cI4bLpRpaE/OjjePNM0Nr6a3UuXaLzxoCh6rsmZzhuzi0ed6TQTIz4/AMkVd6BPTSliyvKk1A16bVMQmO09sQrJyMOHzpiuz/2eezg7rMPTER2i9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHcpWy5C; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHcpWy5C"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce98cb8165so14263165ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363145; x=1788967945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6CFSQBR//cpcDAomOpl3DbC5UldpOdeC10IA56wysg=;
        b=gHcpWy5CV926sWiV4tBkkXxqpiDnx6+fFCwHKABJp4EU4O8gqMiOFOAXk0b87chAIH
         r7MbOXZGLC/DLXRltGs3eJ48vqkWskDMI5R7oDFLx2IMpwKC+DYjcdCv1uySrILy7QPO
         tCZyZIE6YtX2241L5kg2QQnfHUPRbUjMRazR0HTooPIGDvTioJryC4O3N62Ny/CyCgfl
         iWtK+qtD2JmcI/OlMQwVAV/Gzrk6SCJgw+t6Oy7NI4qVHZkx2/B3y5E/sftHZRRnXTyO
         jvdadV9XP98zyNQYwVvEqZcqj38En8gJTLMfjg79st8UOLNEC+jkCEZVsd2ARa8Q9iQT
         5evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363145; x=1788967945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J6CFSQBR//cpcDAomOpl3DbC5UldpOdeC10IA56wysg=;
        b=i8ZFIiwLWXznepcvFDlKukKItLiRPf89am+VMm6qjuU3fpkYtPflG4grXA3DQd0sQw
         42GPgbJdLEjYzdXuTZzXTThLbQ6KXNxVoK/yzI11KpwusKzv15N5QY7Q8Jm3UXcTmiST
         1G9lBgeFuBBIZIeL09r51sGkk8nujd9nzCuLAvVGO/QnOaF11BOIOA3bJAPhYwz1QuX9
         kCxpVI5vnvOm4YenxAdeDZ06NRnf0g3CLRD1UrAmqNbOF+2AKMLi/kX8JXCrwANHnai8
         ExKebS03jxI9TJpIwirl6kIbMBphmLj4j18jTMjeMQnoubuI1OF/ddHBreqhsMmxof7C
         y9bw==
X-Forwarded-Encrypted: i=1; AKwUvBzHNVrQ1VkD1B4elggcfORJMI04/Pd2K41QTmQlEq+YIiznu1W+reixfj+2jroDQ1fDFrfnRb6LTIOVzwM=@vger.kernel.org
X-Gm-Message-State: AFuF++n2u/NgkHfsFaUykBGt3rPDDg9wzIQkafM77pL/NBNoq39OFJuG
	Z/nCK23kYFkvhwmZE0C4P4jkjJL3L5XzgfSW7IB6lwfI7FIC5SpxBGzf
X-Gm-Gg: AYBFou3q+JxOvYXxFbQMpeFa0tV6g/sVJLOIZoOxVnzZv7s1ohIaKaa3qyjIFC+ZsgJ
	BY8JHdyiKRu5wOk/UipQUSf5cKGYd5//grQ4dv4/VawtTnxDEog77vJnknP0ci5OZ3eHdILD5qp
	Vn9N6nmlknj06KR06WI1AlBd+1M8dw2CKtg5Mty/Qpklxya4Hfm48XODknNzPxEgD7xFnRSFJx4
	vVFJo5XYk1ULLuwnHklcWItFY3H52Gz6DhweCXmIko7dlhbK/usDjoDZhYEYCLvHF/85fINoRsV
	YGgtjxKLxZu1bBXinsQkRLzycfON87iA+NoaP/+SIZS0p4clXX6nKup2Zx3r0zcFDqeAx0S/+Ys
	LvQBkrA3GYmyG8+dzl8bY0ceUkLs4QlcBjh4j1MAi4Vy5m46N1tinWX9bGn3NzohG6BXJOsb9DX
	ZT8DSKfsXcObTnB3I4cbtDSTB3r2Ua3q6kCTVJqw4neUxJq4BqJnvIgGoBQeg=
X-Received: by 2002:a17:903:1245:b0:2d7:1cbd:9ceb with SMTP id d9443c01a7336-2daf1342881mr28557975ad.12.1788363144243;
        Wed, 02 Sep 2026 08:32:24 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2daf43d41e2sm6944815ad.60.2026.09.02.08.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:32:23 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 04/12] mm/damon/core: validate number of probes in valid_probe_params()
Date: Wed,  2 Sep 2026 23:32:15 +0800
Message-ID: <20260902153216.4034305-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-5-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:37 -0700 SJ Park <sj@kernel.org> wrote:

> Each DAMON context is allowed to have only up to DAMON_MAX_PROBES
> probes.  The central place for validating DAMON probe parameters,
> damon_valid_probe_params(), is not validating the upper limit, though.
> Do the validation.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 4d28eb033fc4a..c010f686d033e 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -1420,6 +1420,13 @@ static bool damon_valid_probe_params(struct damon_ctx *ctx)
>  	unsigned char max_probe_hits;
>  	struct damon_probe *probe;
>  	unsigned int wsum, wsum_to_add;
> +	int nr_probes;
> +
> +	nr_probes = 0;
> +	damon_for_each_probe(probe, ctx)
> +		nr_probes++;
> +	if (nr_probes > DAMON_MAX_PROBES)
> +		return false;

Hi SJ,

Thanks for the explanation.

I agree that `DAMON_MAX_PROBES` is better enforced in the core layer,
so that all callers share the same validation path without duplicating
the limit in the sysfs layer.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

>  
>  	if (!damon_has_probe_weights(ctx))
>  		return true;
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
