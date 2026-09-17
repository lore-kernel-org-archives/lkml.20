Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D518D1448E0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609125; cv=none; b=SysGy8Ffjf3BLnpXWS6btdFzXHyr6QfwSSbhXq0xXuC/vx9tCqkpSa5RTA/VdsGHtjkE3HNahbNzR/IV8Ou5aMy7H8PRNzoVohg0OB+lZhBJKumaFHbzLRntduJYh3j2VsBWTHOGhe2Va+RIEELG7jvQJXr3ekSYirWKZI6qQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609125; c=relaxed/simple;
	bh=7p3fOD11xt5iB0wCw2rgjR9L6cWQ8/qyfL1jiFK+wLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RiUfkq7G5k/Sap/X2irT8P+Qnr2tYUO+9r2yIJ+sp2RKyH5Mokw8zxN/5deYWoHbeMnUy+y6gBN+V3osLRkS7yT/GyqFyiYTU9Uh0Y00Fn1OmFN9XMAfzHVtQ7+QUYpW096SJaGSFgd/dOMva1jaB/HpeP7kvouiNht771CNJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1y8toMF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1y8toMF"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so3536095ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609123; x=1790213923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBi200xN/LUb2MXPCKUJDiGUegD8jgMjIoX4dvMv9gg=;
        b=h1y8toMFzrfadKd0vw177Kr+DeoSXAoKqyNoPIBSDr4NSrCWwj3p37CnPGi4IpH9AE
         wjEVI0w+bE4ri1fF7qg1ILnDbpWn1ZnLfdBCZxp8iK4D/jDTpf+4buovOoROGHdV5Wkx
         lc7j6i6Be3JaZ6dCYM7MivRV1tzFD86g3o3eokPBNn5X7fK9BT171h4OcGaqUK9Dfq8A
         bN+FK6vas0kffUBncU2LzGyp1yLjYu2P4SH0gy0xFmRKxkR/gURU3ySJc1VcmqgDwJYP
         IW0fscRPU/tCcKyPfLxwgPz9B+rNti8ilGTbeSHWVuOgRGiSCcGRXo1KZfRR4U61/l18
         Fs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609123; x=1790213923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBi200xN/LUb2MXPCKUJDiGUegD8jgMjIoX4dvMv9gg=;
        b=0dE8Bz+gVA5iaDvO+fLIZ/0bQwUgXF0wsiZpmv458ht1rnJT3K4PRfWQpFe+0fRbs3
         U+Io1ZnFQ2DTWXN72i+org9OhWh/3eNut63ik7vKturxSRMxCk/gzli1jnsM7riQEG5m
         aBFTYEx8xfRRUuUzevif4bVEA3tK9IK8Y5y2EIaw+iAJKu2CmwoYasDIc35gbRvutKKS
         UDpVpx1ziQNxDmbp89o0wd638AOOq0aVnVdPWT3R7tWrRJPrYsnTagpab2IBKIJLI52G
         WWP3ZA53GgB+ZWNf/x4ovt85wJvZr/WZcSOdlSba9+IO9RjNPIkoJm51l0hT1Du+xBVB
         lyZg==
X-Forwarded-Encrypted: i=1; AKwUvBzRwR1OT0RXPCc+mXyCg6puZ8s/G083MPlJpr4kvJZoKhFakIBzqiLLHsv2ErHldb+oagG94EWS+/WmGtI=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ5RbLIETFST1axRuWaNRtNWemv3O+th9lsGSmO6bed3h+tj/r
	Dm+gaaU07cXd5v9JOBYYRuKd8PfkU19J0gvvv3BNz5S40fnGmVFN+IE=
X-Gm-Gg: AYBFou3Kol5DVuRKciSJ5cCugMZ1GRWuouW1w/4Xayyl3X/uSxv4uw0L4ay94yH4GZo
	2af3ET92cSEZill3CnbaLkZOBQmieq/mQh7fhHWoYzl15WlKUzXsbaRP7woTBBVSk2e4mMHe5G5
	eXNY8dndW9aDjJ3cOG+3fxuA4LYeH0dLa8LjbvIWTC8bkHGfLCdo6Xod8wCKx5m9QnLiI++zEZI
	FFOaghbhPMFR9Jjznr33NmRI55+9aDSGkAiIGRbWVVj/z+XrhWo6Ji5dQ4pOWcxeZXmyRHkCyyX
	3tECl5v8wva/Cqq9laR+Ezkt1ldaNbK4Kd/ouALea+T7FyN75EmcOm3B3rztR5Eonkv1hc/OEqj
	2RPtEqORbCgcgpjcZ8OlEUXijI8xCLilKAnz1mT6OltX3rLCjM/ocl9DDSvtMXQfgD1sYB67P/j
	ULJfjhNl9Oi8KCJj1Th7mbH3uIrg8OPak9zGFzMkHBsG9AYeUrjTJ345VdL/VKiGkExsQLeRnua
	kgox17bRLiOGXPMD/lw07VYvd2zKLrWIQVhkQ==
X-Received: by 2002:a17:902:db0f:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd8e635b49mr90622135ad.15.1789609123093;
        Wed, 16 Sep 2026 18:38:43 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b6f9:c198:e14b:34c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d9007csm18335155ad.5.2026.09.16.18.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:38:42 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] mm/damon/core: charge only the part of a region the filter left
Date: Thu, 17 Sep 2026 10:38:36 +0900
Message-ID: <20260917013836.100213-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917012420.101087-1-sj@kernel.org>
References: <20260917003553.2465523-2-donggeunyoo.kernel@gmail.com> <20260917012420.101087-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 18:24:19 -0700, SJ Park wrote:
> The user impact is that DAMOS could work unexpectedly slow, due to
> over-charged quota.  Also DAMOS stat could be confusing.  No critical
> events such as crashes or leask happen.
>
> If above is not incorrect, I will add that to the commit message when I
> add this patch to damon/next tree.

That is correct, please add it.

The stale size is only ever arithmetic: damos_charge_quota() and
damos_update_stat() take it, and nothing dereferences or frees against
it, so there is no memory-safety consequence.

Thanks for the review.
