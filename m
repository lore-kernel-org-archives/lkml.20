Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ED3486421
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401461; cv=none; b=UV08lZbeaW7Jb93Gy8pzfbo/qrqOpo8IgeFjkat6JhUN3JkSP0kAASNOuIqiAxIjYYoRSDgVaUtxK+RXO2/AGji7fiQpBdDt7etriv95liRIJPNBJV+zfOVmobxZk6VR7XL4QevCyY8bagitxCWKjkYHpZ3XhOSgIE3llCkQl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401461; c=relaxed/simple;
	bh=5ZiwVFQlAD3lG8hrfLGRLnNhI7uqv5EcZ+cUO/c5qno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJRRwqmpzNG0LmyDIWP7ZLmtmDbOZdmlP9Aj8MGuIdHS7lQkdinfMdKPcIkXsG9HHCK7xHPZCnglLrATTmLZQOvt2VrVycdEIZa7jXSD2454H+8UuXzDt0JwfmGJ3pJDWqo6rWbCgFysdpf26036NOj9qmCmMgI5YXVbmuu1Itg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5crcDED; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5crcDED"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so2052651a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789401459; x=1790006259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLQyzx/jS9wKpt8k6euuDCFOGH2TJfuVVKt6HxhJ5XY=;
        b=s5crcDEDrEGinEphgbx+6WdcNDsc6gC8hMTl/7FH9Q1YhEZPrtEF58M5ITFiRTTf+e
         Kes8XSMUjtysT+ZzQ6ZsKdQ58MMNXie9NaCP/atQmeyazWlLf0Cevkvjl9l04IIIrUqU
         3yoaywlItCpfglxiWv7NC+MdqvjtWEV0GWGaEcujo7yWy2xdcHJacwHCgFGjhUkNrOb2
         eOmmcq+UCfE7Zt7uDaTgRUeM5yko8xn6AABQwhCodhM0UyJ4JdnHpjLjUKqpPx8u84lF
         Y++PNXXxcXrYw0bwf6OcBUIZunx9VAWGQgfGNB+lwlZziQPEZNdk0ZoabuF04BKYmK9z
         zMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401459; x=1790006259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLQyzx/jS9wKpt8k6euuDCFOGH2TJfuVVKt6HxhJ5XY=;
        b=OuDrRcbohbmY9CuemesqCK+6MCnc+cWcGxJhB+GVGpxBQ9BYXUkQ/oXBOYpfFXC6zL
         CVyATOF3+dKjY4muVnw6/5aSrj5DRy8fd6eCEzgknQAYlec6t/jDYtL7EnWTWgsJQKYT
         vZB5llMUTVrz/la0+vWvb6snrTfKgWBTerB1Zz4YeD6iDPO3e3owiwY/iq7VjzvNNSe5
         QX8IO9hiuO5i8Q0SOjNUET6JN/LGOUQubCfexK8L0KKWdCH+yObrXUPlQ5lndUwHVbGV
         JzUAGq/khdOic1eM+q4gGQ17cXdSAtINlQSfPvaUVjzgwMMmamxGP2BNUpojJhz5gXo3
         TTbg==
X-Forwarded-Encrypted: i=1; AKwUvBxqyTo/edWGACNxfuvtPGUmyJyw9XktEiGeWly1uN7Eg8XPgrQEDopwBa78n75r356g7jS8HEk4UgB6WQw=@vger.kernel.org
X-Gm-Message-State: AFuF++laSxVqHEWym5HF9NmbCT1jNdsydpx28PCx0jLU+i2nvDNcBU7K
	pEQulAuPkyr1Qf8byfEaSu7LDZwtSXphXaqzjyaHHM1H/Dwyn8UK7FJ7
X-Gm-Gg: AYBFou2lLQiDSNMiGrH51AcyS5Ze/9OB8vk3ghWFRGsEOjzf8/k3oH30JotwrfecOhQ
	RKObsINecax7n06UGLcdRyUlUMtOsFxkdu77Hoh/+1Ghz3a50iHDu259snq56us28GoBcHchxq/
	EnniwkCB8KOSPP9/VPSXRp6diWBue2yEXvPtMNSzvq4XpO/g76qtqcSvryiQ8Lp6eHAtGylog2I
	ZY9iXBmT9ojn0fHljsUE6tm5ZDuYp6CfjUSt7XlZadJTbyjEeqimMh3ZVRky5LZ02hAivZzWZGb
	oI4j79+9VhYhvoKDxYZCQ+449ajaF+Dr8S4ZuJQRn4YS1VosJrYMJ7sV/c/Y1TCL8TY1S/fPiiG
	2rjs/TLQQwJzoGmhLDQu7hrK4dUs0jul+7Sht84b5AgB8EQCVRwnjLA+jAq/+MBl92rEIBOthF2
	GMSGAbm98vrHVf+QPNJcjax7b/9sZ8bKOPQms6tPFKwbNcGKbeG+te4YO3ggd1Ndy8gfcViw==
X-Received: by 2002:a17:90b:3c47:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39debf8d92cmr6628202a91.6.1789401458739;
        Mon, 14 Sep 2026 08:57:38 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda8bdf4sm141419a91.12.2026.09.14.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:57:38 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 8/8] mm/damon/core-kunit: test invalid damos filter commits
Date: Mon, 14 Sep 2026 23:57:27 +0800
Message-ID: <20260914155729.1518105-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191807.138502-9-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 12 Sep 2026 12:18:06 -0700 SJ Park <sj@kernel.org> wrote:

> Add test cases for testing the validation of damos filter arguments in
> commit time.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index c9941f3bfb42b..5da84caf4124d 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -1195,6 +1195,13 @@ static void damos_test_commit_filter(struct kunit *test)
>  			.allow = false,
>  			.sz_range = {.min = 234, .max = 345},
>  			}, false);
> +	damos_test_commit_filter_for(test, &dst,
> +			&(struct damos_filter){
> +			.type = DAMOS_FILTER_TYPE_HUGEPAGE_SIZE,
> +			.matching = false,
> +			.allow = false,
> +			.sz_range = {.min = 456, .max = 123},
> +			}, true);
>  	damos_test_commit_filter_for(test, &dst,
>  			&(struct damos_filter){
>  			.type = DAMOS_FILTER_TYPE_UNMAPPED,
> @@ -1208,6 +1215,13 @@ static void damos_test_commit_filter(struct kunit *test)
>  			.allow = false,
>  			.addr_range = {.start = 456, .end = 567},
>  			}, false);
> +	damos_test_commit_filter_for(test, &dst,
> +			&(struct damos_filter){
> +			.type = DAMOS_FILTER_TYPE_ADDR,
> +			.matching = false,
> +			.allow = false,
> +			.addr_range = {.start = 567, .end = 456},
> +			}, true);

Could we also test an invalid PROBE_HITS_WSUM range here?

Patch 4 adds the same max < min validation for
DAMOS_FILTER_TYPE_PROBE_HITS_WSUM, but this test only covers
ADDR and HUGEPAGE_SIZE.

Thanks,
Kunwu

>  	damos_test_commit_filter_for(test, &dst,
>  			&(struct damos_filter){
>  			.type = DAMOS_FILTER_TYPE_TARGET,
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
