Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799860;
	b=jFBpxDGoUkWBQvfQkZC5N0hp2wH6W/w0uQob0VTbc7z/OQIa6Y+CRibgCiYP9U7dgLGt
	 ST3c6aMx9T+K2lM92zohZ9Eu6KfpCu8F+XVWaGSpxEyOgLSmpAVu0qYAQXSfEiDIoxQSj
	 ltohOfoUBqTY4lWOKih6yoE1sHvCvSPYZBFKmLJdD4P6DQdu9kW+NneHKlMzGLMds+LUs
	 00qdqYLba5UaUwuB4k6Ex/HeXR6awyEBH0nvHJPgSDSPo+EvtylEexX2Yoc+Xr4BrOZuT
	 Fnk9tVH1sdai37zc9xZ7wSkYaKq/QH13g1dpeulPxAajY0P903K3cynEYiYQ2EKG4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799860;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ou58Y4yxXNGWm036vXx9oCfSGptfbJo2/vxGXksCl1o=;
	b=it56ApjyD09vE7AbBO/Nzf0WRoMStqH1svCqh5TLz5GAqnyixWVS6ugzg16w5AjqouBy
	 fVsUx9JS64Yr/YrXzGR01/71hoOMQu6HoZuZJiDdXgYEDTDYq4qLQRY5s7Y4zPFaZnNMq
	 9o5BhtJxz/uaOZyzHBXFabqjVEGZ3psLWhpk648hSsMSNtf7i2G35HQlaBoPpWmNG6R7z
	 bVAshRKJvgDq9tbZ936AzfYPGOKtaNT6yQQuNTqtAfbPOi8Bp9n5MK2nzJ5KGbuwjR2QN
	 /rbiDh3F1hoV/ZD95wePt8Oytz7vNM3+ALmAkAv4LYBbssZ3rvrycsBAWy+LH/GGM0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A4/s7+Vd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA04606A339
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4/s7+Vd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E271F01829;
	Fri, 23 Oct 2026 23:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792799859;
	bh=Ou58Y4yxXNGWm036vXx9oCfSGptfbJo2/vxGXksCl1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A4/s7+Vdge+0G2LfUOjLjADYzdPY50oLRCpfOyHRwRqkFwaYVicCJBcdblgKoPUpB
	 F0eUZcjaUwGd8Xn4i2dEaDaZ8skGLILfGQ2UK3ax5iOfXmPVTqiZmHmNOxO3UB2Zq5
	 4zw3ogvp/r2tQFCeffNoTAaIduwXE++UHGQK9X/x3EgZvq7Dn2NpP+R055Xi24mhMR
	 EqABva6v1uwiopCPe3l1XtcMRLOud74nvh696kTsOQa/BeIYN5RLZ97HJx7SpWN5ce
	 vwl+zfsTJELoGpESMpwqcZQ21jE9TS+uP9hs4DTtm/im6TjTokpAxDz6SncdQ2mAGH
	 vg/v6QSMOxIlQ==
From: SJ Park <sj@kernel.org>
To: Suseendran Bhaskaran <suseendranb@google.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/zswap: validate dlen and normalize comp_ret on compression success
Date: Fri, 23 Oct 2026 16:57:26 -0700
Message-ID: <20261023235727.86376-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022232734.496064-1-suseendranb@google.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 23:27:33 +0000 Suseendran Bhaskaran <suseendranb@google.com> wrote:

> In zswap_compress(), dlen is only meaningful when compression succeeds
> (!comp_ret), as compressors do not consistently set req->dlen on error
> (e.g. zstd, 842, and qat set dlen = 0; lz4, lz4hc, lzo, lzo-rle,
> deflate, and iaa leave dlen at PAGE_SIZE; hisi_zip sets dlen to the
> hardware-reported produced bytes).
> 
> When !comp_ret and dlen == PAGE_SIZE with zswap writeback disabled,
> zswap_compress() sets comp_ret to -EINVAL instead of -ENOSPC,
> miscounting the page under reject_compress_fail instead of
> reject_compress_poor.
> 
> When !comp_ret, set comp_ret = -ENOSPC if dlen == PAGE_SIZE, or
> comp_ret = -EINVAL if WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE). This
> allows simplifying the failure check to 'if (comp_ret)' and dropping
> the ternary assignment in the writeback-disabled path.

Nice catch and fix!

> 
> Fixes: dca4437a5861 ("mm/zswap: store <PAGE_SIZE compression failed page as-is")

Thank you for fixing this, Suseendran!

> Signed-off-by: Suseendran Bhaskaran <suseendranb@google.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
