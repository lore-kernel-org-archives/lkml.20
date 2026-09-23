Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C183BBFC4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181205; cv=none; b=ruXggVjQEbkdrfL+VjHFK/iYLbwWb4rwlVI9cterIUh8xfprhRHc4FQJiNAOKv5uDxYoazLuj16NIhRRrPnGV2QcWnyaKY/cEh7lib38G3rgZcKWX432RuE/E0qobEuaB4nbODZgqscMiBkerknmXeJ4IMXEwOkggur5Mg0yY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181205; c=relaxed/simple;
	bh=67glpMEqmp3cgj1Y882mMOoL/orbcvIp/trxu8TR2Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIto7D+S2hNxKMjGOGx9YZWCIm3DHdZrcw66+rZOGKMZUd3gSd1NmZRbGjx/x26sJTNDXDps5EkGoFXHVLkwpX1pq5KvX25DvdBMUWpLh5T5ZTqJAvvmz9g79pa2dSSiOMYm+R6fgp0NFIV9A+u4StpAZeVF0wM+R/RRyXG8/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEKv0l+7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEKv0l+7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so6462645e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181199; x=1790785999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMSEiPc5+o34xNJdJ/12oIWCPCor4YVV3MLKdTKKMrI=;
        b=IEKv0l+7ZoTBBkfhYTle++tqqfTdnHxXPCOBlRWj3NErHeouddelzMqfvY9B+lV5tu
         hEkmfocBl4IYtgnCdRbf1PhfLdacfnx7Y0wxy6IjpH2F5LZKlzbZDVHR5NINO7iLnvdQ
         0Y0k04roYt9QCQ1z14L+1FsOQ+Ab27b1/rjD1U22X43b3SXMfrjBLM2yxV+OWXebVtjX
         rYkvy85SHMP6wUFvaveW/LdeD0dqAPM+WmsrkDxPoChZfqyMsQIOYvQHXKDqZWrYiKp7
         SxQEfO02jd3vKoXV+zT3kKaNHqWunInoN9w8Jmsq1JbrUpapjj+I62Z70IILQbYn/buI
         qEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181199; x=1790785999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMSEiPc5+o34xNJdJ/12oIWCPCor4YVV3MLKdTKKMrI=;
        b=ufSjAe9rtbyeBrute04uWJqnjeh+zN6aNGODCVGTDYKm/GZSQbJEWTEJhJOyfMmzfN
         A5x4F9KNCYDZjl3y+FhtsL8rzrx/HxylwTFLOgogoiPtWkp8OgJ3g1U1TbZVDaX63VF+
         3q/SL8LdG2KRNhx18IJGHcVOYD3zOh0vXiEVeqUNkZ24wAEASKuwHaGMEo9Ju4dQSaXJ
         zklyw/GxC0EHxgmzb/mv3wD7G3h1FsjZBAT+QP1VcmnFDrVwD9ncmS14bGcfyUUliLXl
         a09THIR/5q3BBsXf8DTFlEPpM349SAnBrqXRaA8gTqh4lqYPdlHwCSCxT/3eBu3m636S
         N4pQ==
X-Forwarded-Encrypted: i=1; AKwUvBznUc5wgPFwAofO4qJbXjdZrG6PmVLWPlxWQ/MyS7YCRgDelsgPbidhje7l5q7+NJ8+ML1KRDJ4Ek7OBss=@vger.kernel.org
X-Gm-Message-State: AFuF++lMXzPfZaC2Axd1I7JV/SswIewB48IYGx9wISnYYRQ81jOE6UxZ
	4Bt+AahKDr9AnidT3C9hlhheVK0wPLf7cZznLI2QbNU/2XoRU195+3un
X-Gm-Gg: AYBFou29NNufa/SEkBNGn3KrYhN6ELR+MU952On9D34298g20BOC3eTVM70+70iFsdW
	ycL82rvVux0sJ9pp75ZHTFLzMTgyvd9q86gCiKsKhJwYRPs2NBDL7F+hnwx+G2opcEfZxo+4OVs
	KD7evkJvAYs5TBxyUzC60TLd126eclQY/NHKY9nug0ECfXiOtzXlk8eF56cHIxyJwh1xjzHXIhs
	7zhRiINAvFP/eVRKQ2BO+V94VzyMQa5zjw1LKFOu1L/CtG/DlmdxfxmEI8vfTE2LTOHYgugn9Ci
	g1hJJqx04Qaifau3NCkYE5D+qx6Oht+VXwHxRgVT1eQAyYddv3Z3CBF81BSV7ZmnDOs9EnjEoGW
	XsOJWQBlWRiJoqz0jFur11ZUin7HGq3AuzbwP/9tGxQWir9KQ3+XMp84uvCVLuLzPY5Ngbt9npG
	jsfU8amkHn2Oyn1eToMfJT2yVPH4laGX5AvSDW9Gsmdnt/2ud0lsjiGySibw59G3QBIK+d8jSDT
	/Bi+OQXR36o6Doa57fCIntNbNAmPov9nY9IbcSh9fAjDxlCdMLlg1hBaJDHbYR49Kxh24Q=
X-Received: by 2002:a05:600c:1d29:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49fdf12f7a8mr57065555e9.16.1790181199387;
        Wed, 23 Sep 2026 09:33:19 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm78673275e9.1.2026.09.23.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:33:18 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mm: avoid a reclaiming allocation in pud_free_pmd_page()
Date: Wed, 23 Sep 2026 21:33:15 +0500
Message-ID: <20260923163315.275046-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916062222.27347-1-mikhail.v.gavrilov@gmail.com>
References: <20260916062222.27347-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The lock cycle this patch breaks has meanwhile reached released stable
kernels: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on
attribute changes to avoid UAF") went out in 7.2.7 and 6.18.53 on
Sep 21. Both trees already carry 26444eb71465 ("mm/vmalloc: acquire
init_mm lock on huge vmap to avoid ptdump UAF"), and pud_free_pmd_page()
there still allocates with GFP_KERNEL under the init_mm lock, so the
cycle quoted in the patch exists there too, not only in 7.3-rc.

The patch still applies cleanly to current mainline and next-20260922,
and the reproducer below the scissors of the original mail works
unchanged.

Dave, could this go in through x86/urgent for 7.3? Lorenzo, since the
rule it applies comes from your series, a review from you would help.
If either of you would rather fix it differently, I am happy to respin.

-- 
Thanks,
Mikhail
