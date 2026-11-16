Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872243;
	b=UjavYZchvlRzg56zs8l53qwunCJbGV8cSjgzPObwStvFNFHYAuKU3m1osDp8J9NQRnym
	 rAZ5ZIOI6BkZzV8LHIRLoz2qD18sGWrWK4/MCwm9ygBbrpH+AlDfFmfKVC4EBTyZxivaH
	 rAJ8FUWZq8oiDEccN/rgYuKhFLS2Ei8Wt+gIKD9vsTWQgF7QbbiJJUyIsGhs8lEuDToGi
	 Io2KFpEmyheejCyN1JuCXNM0K+aSOVTUyenQhE1IxMuRJRkDqawQniaFq2JjN7N+vN9yS
	 1QZ2jHsO66ZoFMZIlGaQaoPw2K5doP7TqaS8iFM041H0VA2jI8tflCVoJORJLUG5Y0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=uOHVmM5CmpZM7TQtreayT9wMg/R5R3UxyUKm5ik/5Xc=;
	b=iStN6WNjQYRc4NlR7BHHbBxKlREwsMTEDpI2g3WRcY8Cd7MgIoPXmsF4CkYgkFUBdXq9
	 002r42b5TUi4hnyLwXK6u0cnjcYhEjHB0Fw7AzUNSYIik63b/OjfYOWdTNzE2UldLGETs
	 9+lDWrSe3ZnOw+tWWrIJf37KHanBESup36gn6cpnjGxy7CCJYcIZ6OP7KcC5P7h08T5HQ
	 XQwDzutBBkOaz2s8QU7Rom99dEkJJ6DeAlesWTdxwh27YcT9CbiGkgKJsRwHbjIZW8GTg
	 RF10fO2M5owYHOWsTb55onsYmTzsLIR5I6r2W7bBj3mSNwg2Yy25L7x3MtDHG+UVtLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZAHbLyEa;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3725606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3725606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZAHbLyEa
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-536c8f958d7so27424251cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794872242; x=1795477042; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOHVmM5CmpZM7TQtreayT9wMg/R5R3UxyUKm5ik/5Xc=;
        b=ZAHbLyEayhdFxp4OE9d+x8JSxPhHxv1QqAg8ShjZtG2Gk/HAAg9y+b1gHVlUaPhuuy
         41fesD9fN1MCgNDI/vNC3Vu/qbDFH7uVz1+ujPEgZ55hvNvl247V4mtbEiYvU86cxWFa
         Tzdpk+pc0YNiJ5fM74DpEzU1aSud0PlIqUYofSuc4OlpQlRcFRjPIwWFZNk4HlLTLbTz
         3MvpL6IfMp0copaDFuXHQz+uDzlA8MqQakHwxgwLoqr+l+eZ7BfKf23GaQpZDOdqK44P
         EQpPSeJw0Q91Vaa8BqKIRNok2EQ6K2uOFTP8wGmVG/IGf3F5Yc+AKLx5juFHNpwxM/2A
         rXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794872242; x=1795477042;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOHVmM5CmpZM7TQtreayT9wMg/R5R3UxyUKm5ik/5Xc=;
        b=fbiHc3vuLqqp8l1xM+QwvlrUSu7TX+bG/QgNHl8AUql+8T0AASkpWy1dn9v6meN2Db
         V5VDqtZZEAqvbnphcxpXDZuKakq5cybune+18iYW0Pd8XsQSkdHwY/BODVy7Ogp6wdeg
         hSfHLRtSBMv1pQxRjSS8Py1peLvMgz4CYym+bCiHeAP9SVimQ2DRt4GY1iVWRU3J5j3f
         fvot326nE2GCR8pauOP/oF0lRR+E6t1HM54lL4JWSlniEZfG54OP/b8VuMJliMCJCuga
         U2FUJUsX4va7rglqsOBbK6hdEtfHaBEHOJDlmp4ibl2V3wu86elGVIcnKPFm9Q0NuJ4d
         Ogiw==
X-Forwarded-Encrypted: i=1; AL+hErGC/KrHuXmGxgYoFaS4apMuwuM53SXk/uVJSUxWMZix05igUAs4wxsiFez4gO8oJoYCWRFcxbTGxPm/a8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l02zH1Tc3kanDKClz5I2XPRkxZqIB8sL3PuTlNuDVDEbZIpdp
	Z70+gJC0NIn5kI+YzaUiOOvnwc9zRFpzUsk8u3Iuy2Lg29KLwGf61zH/fRjzFf6KMLI=
X-Gm-Gg: AYBFou1ilsgD1qxrfrLzSwei8nkGL65gLqYbN2l99yL+HQQHka21IcE9Xl8Qah7OUxg
	BqI7cPQPju6dTLbpJoE96PVVIUirkah+LFzGghdxVlASxyKwMUNJRzHD3xuXP/ks+XDnLJLdE5R
	VvlCm4wANGnC+8QnUbPGfuvhBzUSDOPtjqpGrABkOEWMFR9cvutecibdGbdbyVhOQy6VbwtqBbU
	D4diy2687DbGm6RJtDp13Hqj2RUNiIpI0YkbhibAm8Ij9I6uUCgKjKJBQ0bzMO9fdcHEH+zC3Bm
	LGOM0nFxHRbqa7fh1rGlU2uoO0ZklI7AShAc12q5HgKvA5lq4udQDbusb1PTtneOInMFQhF/C4Y
	MYsjx+a+Rvg9brlkTB6WErP97y58TiAaRP0zg/fbVwiRNg8bN67jcN91e6ZBkoqi9iA3tWxfxOD
	5YPA+iAvYY3gvnLSlIojymLgxy25QXDvcftcE9bz7yudgl6PgHLdYg9yfKWVHPZKNXhP5L1ABb6
	la7AgI3pIE8W1BJZPfKAQuRQZFse50vvj/MEUD6v22HMtGBDoyWUwQxQ7nPNMCR2Ouy73pONYHD
	814yMvSYT558w3JADXjBgVxjbq7KJq0kjN8VasHypYQGbsasTDTr9KQr8Lc6rH7U57nL26XwjdP
	+yRRCSkUmqeiatJPV6T4eFyrI5yU3
X-Received: by 2002:a05:622a:349:b0:55c:abad:a72c with SMTP id d75a77b69052e-55cc6d16ad3mr128623811cf.56.1794872241711;
        Mon, 16 Nov 2026 15:37:21 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d3e135dcbsm29090161cf.4.2026.11.16.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:37:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/3] mm/vmscan: consolidate promo vs. high watermark
 checks
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
 <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
Date: Mon, 16 Nov 2026 18:37:20 -0500
Message-Id: <179487224059.482102.5784465450134794105.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 15:52 -0800, Joshua Hahn wrote:
> There are three sites which all check the watermark that kswapd reclaims
> zones up to, which is the promo watermark when NUMA balancing memory
> tiering is enabled, and the high watermark otherwise.
> 
> Consolidate the patern into a helper function. While at it, remove the
> include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
> dependency on sysctl_numa_balancing_mode has been abstracted into
> vmscan code.
> 
> No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Nice.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

