Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EE3B2FF8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790528482; cv=none; b=Mi9lKXo7+NMeQpaII5UKwSFukC0fxfsAZU5jMYxBYuiEoKj8FVNpX4Vt0yZ2tfnYScItnPN16sVXliza2wKIp4peONlXxYpXCCkaHjOFzGcShTeOBPFC/lYyYTxOvjb4wv7Ka7vm8/LJqTBpmT73lI5fXv9BNg1Er8xQ0naTAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790528482; c=relaxed/simple;
	bh=D2enhUTQBMhpYSQMOiCAp1yV3UcfXSvZJMUxUPxgT0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kqoU9VZBPVvrjSo30GsgH27LMjQCjtGnrSkCDLkrgZodBpvKhfoOOMsEaHzpnKhIVRxdoD7tSX4vB+R/hnHXsNS4XdKRTj/fg4FMer+b0cu+iAwnob8x0JVrax25hnpTfYSSeDJ4cL2YNaP3U8Y+I/jS+M5YPZ0g2IIS72ZJmUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf63q8LF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf63q8LF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so972608f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790528479; x=1791133279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJaaaQOm8Jhgz0ikWsGNVhGjwuLfM0aODvUhmzSvNY4=;
        b=Uf63q8LFqOhyglA+mNGW+3Y4uc9Emlwx/z+xzuS1n+z0RVMn2vyp/cxw135qnWSAu5
         e77Inadcd5st3f2HOcVAlkFz2TGH7o2pIijCpJAZTOc3zxtWs1I8qIQCfUTMCaiFzoL1
         iKxrJ1P7wSBJchFTTSjSPSOgLxEBOHEiTGliWUSqFPv0jxIKC7vx6L/GFZx2D3ghmNxm
         +GMHPfWAbjS+e3SdEOom+ePnWbPlG8aPYJ6W6guqOxD4U5rwmhpdOqDuSMOHWThfruJI
         yvXH8XPTqvHMthkHGlGV9yjSDX90Dn4HNqoR3CR7T2VRbsaV90t4h19mSqix2TYjSPSH
         vR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528479; x=1791133279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJaaaQOm8Jhgz0ikWsGNVhGjwuLfM0aODvUhmzSvNY4=;
        b=zYOAN5uFMqQzwDrH+IlpdK+9F5EXAgHhgxoD5GLx0vCIc1QJQ3f8xz0pwpV7NgSkNz
         LjWGo+yFjjvcP8jz0F58EAnUH6CdiyFICLlPxbPtCD8qsrZlF8vXdbDE6R+udoQDnyJ3
         Ro8ZDc8oVtromn/6fpbwz1HA8evo+W77NdGG937gt3ykJ/+hQYd9TanQisclW0iFbDGO
         Aic3XfKlg8f6xU1TDHWRYwAr8TmFF+IaXdAZvwJ5cHPK/FMLAbSi2EIh53x8b2Vc+QsE
         qrYAlORpRSqUvO7D0ofLOpx6a41dMztrmlV4uVMi6PAY5LUyDalfTC+XttH9ouslXlZh
         UYWg==
X-Forwarded-Encrypted: i=1; AKwUvBwiA0Aus7IvYN3EopsAn8SFVbQC+EMa8kB4WY8q4bPVOvRwt8bRXOf5xfmWKamfkk5kgIp9USAT+xF8wv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNW3LdQMmyWCKoE2l/oO50R79fMFCbiVxsPbiDaWI7xvKKvnH2
	xPMK0ktdcl1uiZZ+SBvRkncoblF4REVMkBb3w9hy7pMrFT0m8qLY9xhF
X-Gm-Gg: AYBFou1VGsyxyU4SyewX9+A4BFwHKLOC1w2EMGfsZulKaEjqK5HVoufuXE4FUrI/QFK
	giMJ1F/1oi51B4W94nIET6y05VyLTXAIR3PZraaeV2lV7qdf0z/c5SqQZ37Ka18Op3JkQr8KdBi
	gZIWMCrdTxniul9TxIDX5Ewp06eT9AfxPsf05SJVn/tGGECXan+qeDekW1OoxyO601kdSPAaxL0
	HMEdy4ELb3qUzv6jw3qGwaf6GIZ8AuA6y+xjMNgCPt5tzpw1DFYAg+Kyl+FEWfwrfmVkRYX3vN7
	nSIuqtHpHzSlv1vNeo0+MIfDHEyVOnS91mv9AT5mhBkyFd6ux2KGDYyRnO7rDpX2QE2UhiOqw+3
	g6DHSLLw9kP+3IpYciJg2EkvEutbsPVUZ2r/VP4bPh3ncFr9aD5jrFMLK5FDBBisUyZnhUAe5s8
	KKFOFjz6QZuNvCN1/EtyK1OTR8ztSFA8tK7sh0CCZMj3bPdh1jbGKQPuHaGLclmxe4iJq3plE6Y
	S721PIRb7zpe3k/uf/BZAK2MjRc0rToRRTlCamVy4xJqKl0JkEMlsJrl8Kaq2u9V27bbA01PfJw
	88ZtDuVU7twraNrG6+v8kDPBGFnSNW9Mwea07hpWhoJ8sWEop/rSIpkCKmlOKm7iajyjlQZSpL7
	ZB6votDFVos8=
X-Received: by 2002:a05:6000:2892:b0:487:f31:857f with SMTP id ffacd0b85a97d-488716c7093mr22756168f8f.15.1790528478915;
        Sun, 27 Sep 2026 10:01:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e6-5301-2072-0420-f831-ed4e.310.pool.telefonica.de. [2a02:3100:b2e6:5301:2072:420:f831:ed4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm23651966f8f.20.2026.09.27.10.01.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 10:01:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jinmeng Zhou <zhoujinmeng@bytedance.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/4] mm: hugetlb: Fix out_put_pages subpool reserve calculation
Date: Sun, 27 Sep 2026 19:01:03 +0200
Message-Id: <20260927170103.2381-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260916-hugetlb-subpool-always-track-used-v3-2-38aae9b5ccdd@google.com>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com> <20260916-hugetlb-subpool-always-track-used-v3-2-38aae9b5ccdd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 16:39:02 -0700, Ackerley Tng wrote:
> +out_put_pages:
> +	gbl_resv_put = hugepage_subpool_put_pages(spool, chg);
> +	/*
> +	 * There may be a difference between the number of
> +	 * reservations to consume and the number to restore now if
> +	 * there are multiple threads interacting with the subpool -
> +	 * restore the difference.
> +	 */
> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);

I was able to turn this positive adjustment into a deterministic runtime
failure.

hugetlb_acct_memory() can fail with -ENOMEM, but the subpool's local
state has already been restored and the return value is ignored.

I tested the exact patch prefixes on v7.3-rc3 in x86-64 QEMU with 2 MiB
huge pages, at both one and four vCPUs. A default-off test hook enforced
this ordering:

1. A four-page reservation consumes the two remaining minimum reservations
   of a min_size=8M mount and needs two more globally.
2. Global accounting fails because another mount has filled the global
   pool.
3. Before rollback, two existing reservations are released and a competing
   reservation consumes that newly available capacity.
4. The complete subpool put restores the local four-page minimum, but the
   required +2 global correction fails with -ENOMEM.

Both CPU counts produced the same result:

  Source state  Cleanup result  After file removal / after unmount
  ------------  --------------  ---------------------------------
  v7.3-rc3      old cleanup    4 / 0
  patch 1       old local leak  2 / 2
  patches 1-2   +2, -ENOMEM     2 / ULONG_MAX-1
  patches 1-4   +2, -ENOMEM     2 / ULONG_MAX-1

The expected values are 4 after file removal and 0 after unmount. The
ULONG_MAX-1 value is the resulting HugePages_Rsvd underflow.

So, although the unchecked positive call is an older pattern, this
controlled interleaving is balanced on the rc3 base. Patch 1 makes it
reachable on the minimum-only mount, and patch 2 changes patch 1's local
leak into globally unbacked subpool reservations.

This confirms that checking the return value only after the put would be
too late. I think the get has to remain provisional until global accounting
either commits or aborts, so rollback cannot expose capacity and then need
to reacquire it.

A LLM agent helped me with the tests.

Thanks,
Karl
