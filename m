Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7585622A7F6
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685860; cv=none; b=HgDoVIkW+R4FDNbvsFDNMHAGB8uHjbHaIlAT+NBmE69plbx8bAU64j7EA6XR30fLYA7mJdOk0bZK2Ki7Yc9DFeZ7eP8dc6AwP+EAiO+KfP+GLRXcpCtR2cbmrbIFAIfDdS7o16NVKJ8TrbMc0m7znn4zqUtuFwoAu3DbxxTnze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685860; c=relaxed/simple;
	bh=X2ljtACZVrU4fNtiTp3jI+fMpPYEDJpdBKjpUTgN2ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWWKGdblS+E4fQ9zpa80GzsHNrhj+mGXervZFnfZ9GH++QMtigBfOxQ/pZ207PAhYk58ifNjKbXVF7Yt3MEtSCLkHrR7qqjVUreIOrBa8Ccg0HYQyou2vm5HbAnW5yIALQAxFgSfiXrRqKlQm1eDfExb3RoN3JEpSRSGClr7874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/zCUp7A; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/zCUp7A"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso1519069eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791685858; x=1792290658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCNfp0vGn8/xN8ripmRLy8rnMYglVOHWqc9ty1HwnYw=;
        b=l/zCUp7ABZWH8wrBVV/5dVJ6+9CYed9Ca83BrzE8tH4timNtKuX3ln2LtWCHI3qEyU
         FOtw9PTRQf5bxJzV9Ym/z9MOlFarANpv14+G+CBh8g/sHjQ6L4zVAKfJ4FjfkpGrRaMQ
         VmpPeHM2xjYq71INZOk6W5frAnl0nyvErB/aBYAZr/rQ8dvxJCaYZ9zIWuXu4nYkFjP0
         mg2jlnBnu8gzji6vApIMjsP4e1yfjMwIisczBTKJD1cNUm4MbL0t4a00E2qWuSIrU5ye
         npX50ASgfRMAI7wKtZSKZFGJJNJDfhnZMGBBSou/SzZ6tvwpERmqRe/ZiQnM+j0G2/qh
         ioRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685858; x=1792290658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCNfp0vGn8/xN8ripmRLy8rnMYglVOHWqc9ty1HwnYw=;
        b=j38VbW1djf2huBZ+HHmvKVLqNAT24aSXCPUDC1hXZxqZrGlYz+1J8+R8Q9O3tNNh11
         FWFU6cd2fouv96y6sjkaGyArYhWSnwQtoFidtp/pAiCO/nEw1Z3QdXRK46Kh2d0Eaqr7
         MZULP3RJ2rENYsANBAKuQhBhvZyLbtRLOtrtwYV6Wu5NuFEF13YRb3qwfebz1aWaQ1rH
         AzINMqGc8oRU+K8xCFTjFD57I1I6F31vamirdmrtX8X6mm4dCHuOgF71saRNY+lUnqdj
         D6AzNGXa7+YGOq8Jns8S/q7Oezf1MZUnEbqBuX2bVLD8MR/TJvWBbKGXFo6SZnSLSjgG
         kQSw==
X-Forwarded-Encrypted: i=1; AKwUvBxo2zbGl/jRClPWq9Vg4MU9MczdJ5UkeNdC/yfkDNqtNAxN2//rwwbdKfYAGSQdgzWwPrHlwzN+pFLRbSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS7MKK+4fW4rFMV7VJjmWccGsXEg8SaZ6mdyCv+6ECj+tR2RL5
	tQ7ZOvHp/47Il5d4JBmV7oB4npBqP86p08YqVuAz7pbFEX8Dnq2WRSmR
X-Gm-Gg: AYBFou25rE1+EB9OiYhHiSXSXaOIkMrZkUJAh69hUoPNZP+Ol7zmZXYNW2f98xzkVFB
	gREZIG8CsqlhjMrOKmZ4UxqgcJg8C6jSRcSFod8YMi3+x1+69W+iCkgb67VMpbgaR7WjPOL+RKe
	//6W//3huvXcf3gCVvLkyTnd9jRlsgfXb0B5+IRDvIWImIVCiidWnpqj8l+BkUd1+XQEKkvJBr0
	VYc4SLlPUko8OXm13P9xqxrHuVDzEAO3rvXNUQO2uEhwQLCARl6lNHEK7b9cmkkcgBoynDxTK9O
	oJf3iW/0RZ6Nyq2TKFtjlUcmpxQZD8ggCkSrBvx5Gx+m60GEtIQ/M49BhRlL1/G8GezGE4EITgB
	oAwxNgzAgld6CYvd3m+GiD5g/YTDh7RN4/vaPcjaOLSwW54pSAR8zm5z/+CMA5wQS5cKKg+RVbZ
	hTe8zO56yi0z3WpkIV8sW2j9I0yffAcEbsrSbwZpCo3i73cB+p3S1nrUyAmwCTzUyIyeyiByMsb
	+eCEk4hJJJwur48i48lpjmEPXDsWEglGy60TlNCybaTh4ggMJNfijE11pI+CWkM7exD3HkiWT/X
	wA5dBVHx1I2EfqrLN4K21n09TCAbWax8evcmGFyqMDZhCHTl8nYczHmyoF6s5PYY4sWGm7XeYX0
	RJ5QNsvs+PfuIIvzussMGcJ7v1i/tBan2RYgqeFk/CSrCDICH8+xVFsTYLo8NMh39SgHHv3z6T2
	Q2dpnbSilpaHjyRjOWn1oQoEGzDGkmDCdrz4mmDg==
X-Received: by 2002:a05:693c:66c1:20b0:351:1b85:e139 with SMTP id 5a478bee46e88-3537e0cefcdmr8632109eec.23.1791685858335;
        Sat, 10 Oct 2026 19:30:58 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-c00c-b850-3c50-660a-7c51-9da0.dynamic-ip6.hinet.net. [2001:b011:c00c:b850:3c50:660a:7c51:9da0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm20357265eec.25.2026.10.10.19.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:30:58 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Kuan-Ying Lee <kuan-ying.lee@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] scripts/gdb: fix radix tree lookup and stack depot diagnostic
Date: Sun, 11 Oct 2026 10:30:42 +0800
Message-ID: <20261011023044.1722-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261010141712.2db4491436e30110ccb5a25e@linux-foundation.org>
References: <20261010141712.2db4491436e30110ccb5a25e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andrew, here are the two scripts/gdb fixes as a series, as requested.

Patch 1 fixes $lx_radix_tree_lookup(), which dereferenced slot contents
as if they were node pointers. v2 also handles the XArray sibling,
retry and zero entries that Sashiko pointed out: they carry the
internal tag but are not node pointers, and the v1 patch raised a GDB
MemoryError on them. Large folios in the page cache make sibling
entries common, so this was worth fixing rather than documenting.

Patch 2 is unchanged from v1 apart from being resent with git
send-email, since the earlier copy was word-wrapped by the mail
client. Sorry about that.

Both patches are tested against standalone GCC-built fixtures that use
the kernel struct layouts (details below the --- line of each patch),
not against a running kernel.

v1:
  https://lore.kernel.org/r/CA+NtrhTyE4J-C2=hSUXYc+NJBsQeYvbwJb+-ROHE1QQP-_gYzg@mail.gmail.com/
  https://lore.kernel.org/r/CA+NtrhTQXdQRWe+pRJHyKxPPgsF7Ob5R41Xm3dAJ54OfT2_z5A@mail.gmail.com/

Ting-Han Hou (2):
  scripts/gdb: Fix radix tree lookup pointer handling
  scripts/gdb: Fix stack depot out-of-bounds diagnostic

 scripts/gdb/linux/radixtree.py  | 66 ++++++++++++++++++++-------------
 scripts/gdb/linux/stackdepot.py |  2 +-
 2 files changed, 41 insertions(+), 27 deletions(-)

-- 
2.53.0

