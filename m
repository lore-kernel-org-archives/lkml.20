Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421554A2A49
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359758; cv=none; b=gn9/E3hx9RVqXc3+EdSJDec1WRBk7W3pmI8Uat/XYwoOpYSWDpxz5DVdDwpWQb67Thxgh9BxLY3gzsXqo0xR1XSqDHWXmKXyNlTILdSlmpy7s/gCb7RW+MdhZ0bYBlHcAolA1Zgb4l6yNNvFgtB1yGHujAW4f7z8a7+IgKx1GHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359758; c=relaxed/simple;
	bh=6aOkKqHhym80a6kBJ8PrVxu95b/21N9MEjLfSv0uAm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bxl+Btm8fHYQR9/V/0BMgFrvBsty/BpmefK3tLMRAx+8Fa7w7kIb3gRXAsmkmHa5aLhORUaYvzjEacXACkUpiwcKdeqOQsI6g8REmzX607yZRkU0UaWFZWjUypcgKy1xnllvLC7pvxTwgygmQaMDhYa/jg7RH+wNu8N8GvP9yoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6SB7ZHq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6SB7ZHq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-851cbd64814so433981b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359756; x=1788964556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr6y/ERn9mwLYkItat9vlE3A943++Ow9sTB6oJwTNEA=;
        b=k6SB7ZHqvtvHM6xTNatLqfS6zrE/f8MhZAzWyLekglRXvfBNHKc/xMRKwkmVKy6NhB
         iLVhDOmQm6Wk6GMZUTzrOsdQo23zBhyTTUhN3GPFRiku7phxMDD9CsZWOTkLlbi3io8x
         5nvg8qM0hmA6wnz0/7ddqumb6xsOEQSfFhhst+UGekywSa9F/CRulhgmg7d4DmerP2kn
         PaVbeQs1uQBLo4cxZ9jn5suf9mRwGiwFKASz2S87+sYWWut8S8uu7FrpzlpvSHXID9YJ
         clI0DI5G0lweN9Z2ay8sG8h0AMuHHECzCxJKdGMTU0pMhYCAxLZFt6gDyqT+8Hpsc3pJ
         S/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359756; x=1788964556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr6y/ERn9mwLYkItat9vlE3A943++Ow9sTB6oJwTNEA=;
        b=LJXUA7299NJ+oqzq5xSPOrpF7BoUDuxRP+XIhdEZBWVokwaAHUztn3qJXmkY5QhHGa
         h5WthHKFDHxexqWXkUdIde6D9Qcb3NrxsE5ZTum1UnDdDPodYpz9u0MjAGK95K++ZMx8
         fRQVE0+YxEHcMmqeWPF9Xv82XoFDdN1kBb8ebeWFlodoa9Ps2vL/lbuodGwhQ5IICXgv
         5fgcU1y/nyCd1YD+o6HSpevcUolC4eYFu0pOW0BqAoF6NdRsAYs4DkJDwfxfh9oQ31tK
         +p6Pkf3LZTRasLay6tiqXkR9vDSI6aa9a6RqT5VbCajrG8mS/lXItf6uCU9csVp0h8yp
         NZ4g==
X-Forwarded-Encrypted: i=1; AKwUvBw/HCwj7PtRsLDc+Le6d/Z3++HxF7SuwJisJHC2NGJ8d1N7RWhrRbcgdpph0eJxEeG6GpIbWmVVJQRsJi8=@vger.kernel.org
X-Gm-Message-State: AFuF++n/TMujGU4Opq8Ikba/MABJaSADnNCXR9t4OZV+Sjr3d5KDdRzf
	YdwMVij2rxR20emO/Z/aOn8/XvsPVD1PX8kLzubbcFrWc/vSZe64BqB8
X-Gm-Gg: AYBFou07r5yId/7cOm+3VfoO+T/7i/0Bm+OXmqgD/8zEXdZXnYZMvyf9Wt/OjCoW9+L
	b6Yg3Fj1aM8acFG4IUKbCzmeOUyHBKGfZxlz9WjNe45ZS0DRzjhwI0Z5ZCIa4c1HoAoSfltJSiY
	Sord6mAu9C/hxVYya6dGFjolXupjqZxKDB+YfG4hhaScfjq6mRotRQqSc2yfRAzJoualZicBhSm
	ZZ2q0VmmVSbQTBxzBuZnNyCCnVjwtND2P6rtCSg4CBb6QxHNqTJZxjvlqTLSaNvGu1SRU4uZLwr
	iERyXi+oXOT18QVttiG36aTQ+UR/XKmFGgbzDxVvI3/P/z139opoV5GNllU+vyV4eWW4pTgIVV5
	OARzMGQpEo0DmkO/9f/9m5fxfFn2HnE9rPb/5MiB7EFe5kYs4aCFJ3yUvdihZAQzQDYjl46a0Sq
	D/qjEYvVGGFWgA9tikrEr643DsJ7oRgTCtcGRIQuTO8l5MHYdiKKRm8cvmjHF95p+xo9FVaKGMS
	LHDtSxnUk1EORA/
X-Received: by 2002:a05:6a00:1c9e:b0:857:73e2:9104 with SMTP id d2e1a72fcca58-85ed94bb41amr7949304b3a.20.1788359756325;
        Wed, 02 Sep 2026 07:35:56 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f2076sm1560348b3a.4.2026.09.02.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:35:55 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/damon/core: allow esz to be set to zero
Date: Wed,  2 Sep 2026 22:35:20 +0800
Message-ID: <20260902143605.6785-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902141349.86896-1-sj@kernel.org>
References: <20260902141349.86896-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 07:13:48 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed,  2 Sep 2026 16:20:50 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > When the temporal quota goal tuner determines that the goal has been
> > achieved (score >= 10000), it sets esz_bp to zero so that the effective
> > quota (esz) becomes zero.  However, damos_set_effective_quota() clamps
> > the quota to min_region_sz, preventing the quota from ever reaching
> > zero.
> 
> Where in the code it is clamped to min_region_sz, when?  And what user issue
> this can cause?

In damos_set_effective_quota(), when quota->ms is set.

'''
	if (quota->ms) {
		if (quota->total_charged_ns)
			throughput = mult_frac(quota->total_charged_sz,
					1000000, quota->total_charged_ns);
		else
			throughput = PAGE_SIZE * 1024;
		esz = min(throughput * quota->ms, esz);
		esz = max(ctx->min_region_sz, esz); /* <- HERE */
	}
'''

This is a minor issue, the main problem is that it doesn't match the
description in the documentation, which states that if the goal has
already been [over-]achieved, the quota will be set to 0.

Original documentation:

    - ``temporal``: More straightforward algorithm.  Tries to achieve the goal as
    fast as possible, using maximum allowed quota, but only for a temporal short
    time.  When the quota is under-achieved, this algorithm keeps tuning quota to
    a maximum allowed one.  Once the quota is [over]-achieved, this sets the
    quota zero.  Useful for deterministic control required environments.

Best regards,
Rui Yan
