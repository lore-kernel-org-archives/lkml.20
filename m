Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABAD34CFC2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068318; cv=none; b=kkI5GkU+iXWYFOTZaiw/mlGP6r/Gvn/QXcmHwTGgZPbNDUt1xurtblqhqHywsFDmI3bzKIY0wW38JTAYuzahwnIvCxFkpeZYw4AhyceevCQgki+MPZ5QCx7UzHY1TKo37s+Cprd08AGAn7uF40k0rmRKai5nVUP8Z7fqPPGlj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068318; c=relaxed/simple;
	bh=JKd/99dRVgae4lnvw25sHFjT8rZubkhn6aAi9iQrCsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mzCy9yxqby5/oAGt1SWbQOKZ3ctOivKZZErTid3xiuTg1Bg4D8RbTCVp/qvAOB/hZ7lO6Eo40cjPtimqBH92ruoyb8V1Mdga3M0SEa5So2rTvoJUxG3X2ORPf8MYMmgmRNiXdVrjEaxq0mDdLABJFulX3HQdPy9AN+6AASF8li4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BldH878x; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BldH878x"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso61588a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068317; x=1789673117; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKd/99dRVgae4lnvw25sHFjT8rZubkhn6aAi9iQrCsM=;
        b=BldH878xlr+STcGJSmcncuIxsO25tRoBjQwa4mLfRhKY+x7pRhuUlCLfeMOtVelkSH
         u047OTvWuHeFLuv9D/mPDKDN0SLfMiH+c6Cx7Ac9AfbxKdMTvMSLdHKwUSASkS/+ZyL5
         15HUYot36zTtyjGTbwfSejLnkviAINCZE2IJJMrI+S8uFtii5DPlPlBlyz/QPA6o1RRr
         hFxH2EMpPF62ekC8LBO6FQc2TOXHxYbBrwgKs5MgO7w55736sb5cDIFrHy/dT8DSXCEt
         kaU+ZnG/G8YeUz9R5QXQ38ibyxo4u1k26wWoWlpckR20TcszAfqk7YD3VYSUzLWtQh9h
         C72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068317; x=1789673117;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKd/99dRVgae4lnvw25sHFjT8rZubkhn6aAi9iQrCsM=;
        b=NY9gfpgZrxtCbnDnec4bl4Ov8qQssxSImnF/y9wQEuN/YevmL+fu3aP7OsmhUtnSiu
         Ad7IBF0AFn2JtQLWZk324mzR8QoibXcyJt1acTQNp/1cwrQh10QEWZuswcekC3b2D7od
         pIE03t5UQUnrlxnkoO0sPGIUFHp2IfsVVgM6e145pwl1/iNQlEvt2TOhpqBD68244DLD
         GKECa277w4jjCOrtM9nM5AB1/BXzqvPXgG5dChV+Gk/lJf2W55dqGjTuGuleFk3OwaEK
         EgMRrmvlApoZoGvqa9TgjSi/RObHBY2GwH+FmYB1c3XQLqk25TzkoaEt9tMNCVOYwpTP
         lalw==
X-Forwarded-Encrypted: i=1; AKwUvBxsYY6dsGaBw4daeYiuur2tABIQkn3g+81DMXm8+PXJpQFg7S9gof6goe8nNMRJGrMXahpugK1ZLUOCOEA=@vger.kernel.org
X-Gm-Message-State: AFuF++nmaUH3JsHeCKwYfANjh/r06td2Kki9PSRIr+Qod8Tvh3hO0esV
	PnezARj4cPa8kJMWy1SUU2sVL0GclPV25AAWxNAeCC12gIyAGCgzzlib
X-Gm-Gg: AYBFou0Yx/GH0IKSibodiszg8bxRNWk21wJ4EtCm0rkPmxp5/GlBkH37Wlc6EHnFzwo
	IYDf8W0MUh6rHmag51zdbIpGHZBVgXHHS85NqdpBIH6whVo1zyV6XM8rzPjxq/cN+AC0rYSoIQo
	KEQOkl0XgquB9EtMMkmpbkgdvFWnqwv1BDQgq+vrt4cG18d0plWXbwkxqQUFBtHbYAPmrunBFX7
	PDlzKWCbjPFZRkVe5R20ODGh+QykQPf1IdN5bBqvDQK4i2UTK2yWVWo3nRkuQFqeooqmD9PBoo9
	q5RVmbW4ROU0JyjtN3jTAf8NgAFMp6ahfhagBnpH5ZYyu77Np44+d19NmcR01W8csfzasH+N3SX
	iAGD7WE6GAYOzuEnxhR+GP1MuI2a+iSvoqxRkIBaFRGHeZrUMJXxbGMpn4v+UHMotVF+bmeAlGR
	atJEgfKoxo+QrK83Lkkvym6kmIzyi/Qzm837ZKgqldRD2/hVv8KkspnDrI0dFXO56hKRnpf9Kmk
	j7O
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr315234a91.13.1789068316984;
        Thu, 10 Sep 2026 12:25:16 -0700 (PDT)
Received: from [43.242.224.196] ([43.242.224.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4efc398sm225661eec.19.2026.09.10.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:25:16 -0700 (PDT)
From: Roshan Kumar <roshaen09@gmail.com>
To: linusw@kernel.org, dri-devel@lists.freedesktop.org
Cc: leandro.ribeiro@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 pimyn@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/pl111: Advertise no pixel blending
Date: Thu, 10 Sep 2026 19:25:11 -0000
Message-ID: <178906831180.136984.3208749717777263252@gmail.com>
In-Reply-To: <20260825105427.686619-1-roshaen09@gmail.com>
References: <20260825105427.686619-1-roshaen09@gmail.com>
 <20260825105427.686619-1-roshaen09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

No physical PL111 hardware here; I tested under QEMU vexpress with
panic_on_warn, which is also how the syzkaller instance hits this.

On current master (7.3-rc2) the unpatched driver registers and
immediately warns: "[PLANE:35:plane-0] pixel format with alpha exposed
but blend mode not setup", which kills the boot with panic_on_warn.
With v3 below, the same boot registers pl111 with no warnings at all.
One note: 860e748bddcc is not in v7.2, so the splat only shows up on
master/7.3 and later.

v3 also removes the alpha formats from the board-specific tables in
pl111_versatile.c that the sashiko review caught v2 missing.
