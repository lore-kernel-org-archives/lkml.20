Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C96384243
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199343; cv=pass; b=CIPtW1LatB/Paf9hs4wxY2qI0DUhxSmoublDaez6AL6HY0kxoGNHnVpf+xZfeJ+tOetzkzfsrRxrMk2tvLQXfnpRb4+fs3MouA899ObLRBwdpUJqK7EtnokvsXWb6fyX3NpzzKka4Mysn/Q+8bsYHr9psMSC7/R90BCfVLiuP90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199343; c=relaxed/simple;
	bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xnt0J+llqkVqhZenPs5GezZn3Rc97SweoGIcURumvoT9oF6F44kNe4nkGGQDV+53kSKsQ9EIKxzTh33naghfXXwpwj2NHviRJhQAWXuInLKPEeU6PvlQ5DuF1ofIksBVFKgmTfVwO6+F5kzfsYWdlITGesvuI5XNwsyAcejaAWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XvmSV75I; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XvmSV75I"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a5dce0aacdso1064a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788199340; cv=none;
        d=google.com; s=arc-20260327;
        b=qeKeM6Lh21DjeZxxyuzCDXFRJk/raiNpLrvsrXMz5yRIXtMsr1UESq1bDkz6tjP8TL
         CAiUiX4Pxq0TyfpBiIapCf7hl3XWCwWGNiLiZSlABlB9rd49EuHA2rg//Sz0pXpq7nyA
         n5gCSBYoqB4eMsq06vO5HG2LdJmfKwtmk5yDEOz2NAP67gCs8dC9xNHCfW6b/4Mk7o0+
         v7y46cACl/y9uRbHTLotPgl4SlGzle7e1mc2Bc3jxB7mBgAwSxuClZG6c7L2cs0VTncy
         w2tRdGnsQ/3pAhx9SbfgtpKETCRrcqZSxuOVu3NZbcIn70EUxQrP7j6jmi9CR50yy9JH
         VQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
        fh=CL/rQ6GTNCVQ+Wgyncm1FfGKu9C6CfR/0eghqAswNd0=;
        b=naFRSotVGgf7KuWv+chERvHoSYMLwS5/g4XAX3a9VjIj9r/sX2rOpVXKGU4RUe3Ft/
         aPDmbWNb5dxMMg4O2Q0Jg2M09j0YXmXT2CcOgVEcqL8MQWYIk0ecQPeEAGzltbyCuRRI
         ze3PChQHvdDbp3W5I3U/0GlHcSQtVEbLy6M4GpwEl/wQabxjVYCz+qjPzR5cyOYgdM58
         JkTS66+j5wJ9rUR7A3UG/D1ZW6mIwrq+eXeJ2375xXp6+RXQTWF9j+SplO7WwLhnAZXs
         ANm8+lj+fb9Ar5rwHFTD/8ztxOAXnHFDRk9vvPIKk5qkVVF5lp2rj3n07GtfgkjK0DqL
         u0wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788199340; x=1788804140; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
        b=XvmSV75IGw/P5cvyNGDtsONwapenqLlDkfpkWchR8ps9lLd2rQ40bXF++IPwMNMq0O
         r1UExgWmn0seAhP/OozrlUh9194yb2hATqXzcJx9b0z4YjLxMszTH1eV7B63VxcTi4jk
         yJqnt4gbltW6mmNcBoqVsEI5pNicWU0YKrI+jPH8a/u1ZUrTMP4Hzum8yOy02iALDFZ/
         OVKa6WwR7TGtOMczxIGO5aM2YldvZE9uNUkPyAg7SGy/gp2doLvRFX5KqrspNusbhECh
         OwsS0hYSx7LSffb1INnsZjpNKsuEwx+yxs/9t6pxQzMqhQCx6XBINrnST/lhmhXziaz7
         0Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199340; x=1788804140;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
        b=FshGVvlwG401lv0DrrZ/jXH829sjr2gF/UFhYMyHZCiRK782zpkEGNFOZC4nKodYmz
         JIioGE2JB3Egrn7W448HyGej7qth9Q6OO2FSq9aVxB0lQ+bCthpaA1WegrD5WE/VEO2Q
         THxZ5UvU370J3CCZqm90zrGJ2MaX6rRWqfIh2Ebd8nJ01WvgPnYsbaHqU5Z5LHDbIXV5
         JcbRDj61YJpstSetkDxcCycvb8gRzGBQVmgm7SVj+D3whAqhhXqI6TrGxd++C7lDATxv
         T4G6b45yVYGnxN8Ht0IFjwDPNcJO04moUxlvzWk17ZooyPAymgvosqLSDOTWX66NPyam
         9ATQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVcIvnuZwKMS6NbuOXEC/HPIGqOWJzjpnrv11/s4qGfPyMZ21soTxi4FhgCPSq/rEw2kLXhpkfmz3j87c=@vger.kernel.org
X-Gm-Message-State: AFuF++kkpW62Lwd6V60H7LJWukbt0/RY7fLlDS0fSGQzyy+xczmDq45S
	tNKbhTnb7esGI46strg4zGB3f1W4P+LmH/gtANvJKILKghOb7KkrreNAROMxjxY7gl5EZW21f8V
	0TpQkqxAJzn4LjZeiSY3fD1vyzhjrktLpVrCDt4HJ
X-Gm-Gg: AYBFou2diLaq8ul7omjoMWu75wHj2AaucATGe58UFHY9Nab9JNYFopvffoEoi8G8Fb9
	zkHrXjk0R5euXchgrjSr9QN1HyYVtDQ4sYHYnS/fXwn43AAXJ7U1CwKzxuu0nnuL9k0pluoY9Lp
	yc+h/soOOZnblm5II51awk0KAk3OltCn51UpBEqARZGvhfys5ePWh9p0JYTUsnT4wKKL6Gc+P7D
	5K1M8X1W+6gCtialYPQrQUT3u4QD5SMtGK77RtWgmag/g5ik7Mrcy/QRTgIt4Z+rFpL05e5+iTn
	QI63ULxOHstexnaUnKjJJCzyvsoxx6NxWHLGOY8zAOeqV60m31ke8wnyzamBPj/q4RVRaNF4iTu
	bFQ==
X-Received: by 2002:a05:6402:22d1:b0:6a3:ec9b:9dfe with SMTP id
 4fb4d7f45d1cf-6a66a17d251mr2710a12.8.1788199340005; Mon, 31 Aug 2026 11:02:20
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828215252.4126811-1-eperot@google.com> <ceef3a1e4e86deef2970e80d94925bac@kernel.org>
In-Reply-To: <ceef3a1e4e86deef2970e80d94925bac@kernel.org>
From: Etienne Perot <eperot@google.com>
Date: Mon, 31 Aug 2026 11:01:40 -0700
X-Gm-Features: AcwNN1UnnEGdSnQdQ17OP7lths-5KZ15H5ByB4zkfrtDMak_OBA1OLjNz_lVuJA
Message-ID: <CAFKBtDL9jBTy8BQL8poUCqckwmSRDByCQMfLyo3SMV3wnpaN3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] cgroup: fix spurious SIGKILL of CLONE_INTO_CGROUP children
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Tejun, and thanks Shakeel for the review.

- Etienne
