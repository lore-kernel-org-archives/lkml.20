Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838A53515E7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356189; cv=none; b=djFMKXMO0dn5QpUdu0PDq+AjAB7/eI3CFfNKJT1BtCdOWNJp88UegFOySNhUR/JFHactdoH8dM0ZSFYNpBnkQeyrCEODIlV0yr9RvUa/v3xVnuh+xkZqp425jCFretHFGyIApWSlbHwGL6G7Od913RtnuEgOX9BeNSDYGdzrEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356189; c=relaxed/simple;
	bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Egz8B/B5oUL9TcsdvcuBOwT0xp1GFcFR8x6C4X79eJ/lISm9McxOAlkuub/UEgjhsIYnAXfyCx7zoRKQT98eutsDzSV++X1yxWojkGMkAOnpWq1NDyvDJ6vXeFlONd6V6AZYWy5+xIKNedUxccIx39I4eSLUqA33YzyAwQsgSl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlBIuvti; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlBIuvti"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so2171593b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789356175; x=1789960975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
        b=BlBIuvtiqfBycKEl7PqbWXm1qTZjVSxcjJj6TyzzLkzBmJw/UUH8ZVTUbQePibOAdI
         n8dAnKOCUe5dygqZnXkrSHv88eX91+SmS4DpP1OTEGxYV7YaRRH0FaDF7vBRMeA1ZJLP
         T4Q3j+0bgOhTYi1HateEcYuunVYctKypkXqZX7y3uB/FqZ7TCynZPNRcWSyEt+lYABjg
         RvTBgogpUiZdkoGbJUmJWZlfftSkZNGlD7o4w1wm72z6CQcAX4qL4+ZUVO+vySIKcylG
         JUwnjjErN9DBjg5tvND951j2FLO/EDqm08kIsd30E5wgHHgkiGAIoPO2yUgOAEHmzpO2
         P0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789356175; x=1789960975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
        b=GpdQoKuQHizycHgUkAD6ApQP8n2Q2aagKfNnjQR5PZfBuri8axd2dwioRkYB5Eqvof
         c+arabdRzNfZG6dNupc+6oHIxDuW9QkdU0HB7aTFc6XZ9N2n4/PkfZwAdlRrf/V0d7Jh
         3a3Xh47NzoYg1tbGZsfGh2geIozUWjnf0gzg+hQwM8RZL4ScNUsSMrlQKGNSrR+lX5C2
         UcDmAVIFUaQ3iHsSGmXk//zYptv89q9vGgPyZBgRFYawewzuGtHJrA0+L+INffA79i5D
         4Cn24gHEoNtRvsagu+fJtftrfCmaDlFjMs50EieELKnSKW0FOZPCDLwH8QPYaj2yfsxp
         QNQA==
X-Forwarded-Encrypted: i=1; AKwUvBwGBLf1xkLIfkLPJmGF4KXRLSw/JkJEwYKET4XjJuPtAeM43nxfO/X6p6+/QoNp0ZaLGsY1g45x0KbYQG0=@vger.kernel.org
X-Gm-Message-State: AFuF++mNiBK+W33TMj+QzPwjke4V9MMHlhcwqNA18FGH8ySEDwe4aSxj
	eIEO46WH4rs6FStB73q5mKSY1lSitmHEneVVe374t1hS2vfdEJnCmjeo
X-Gm-Gg: AYBFou3gtVIhFMAy5lFzK2l0wqthL1HHMEgPI/Wh2LZ9TyyMcVmDXr4JdGwY6Tktah5
	16r+XHtykrWv769MHQgx8kfCq37xqCi7vCjYyZ5/uosgje8SZ4nUx+bNtRzIVuAVP2l0kmGmDkn
	JmKH+pwbDjEckeEYc620eZ0fgU7WFtYMF1wuIx2ZXbvs4dbghrmo78pNQYc+nyKKh0Ef7CfnTnJ
	1JgfgGOLtK+ENeVdz1JBrhD2eO7RdOAhqGSehJYgip6eO8GOtPCfbO3tNhdEhaARLyUCmADhcTN
	rIFV6W6Qt8Oo6xJ8M4l9QflV2NAGCC5U2w9SRL2aoW7dRMOq5N3Agfb1D4dxX+gWRj44InVAoIX
	XBJpSzw2J/B24qEsrJJoUorKJL6QdXWli6eP/gRIL5mNGt/lc8//fY1lJGOM2bGCfGOG1z30vCT
	h6dW01LVlb9JUMqqJMxZZX/E8fVS0mDGW/EoZEeF+BSy9ccAwkZkFLw5E2FhUuCa3+b4R37rHNV
	RxINQigJ5ifTvv7Rh46Jf+4/6EWFSPlKaK4h0lBEU6IxOHAltl0NnsKIa//GisnLLdGWJTNPQ==
X-Received: by 2002:a05:6a00:950b:b0:869:8620:26d2 with SMTP id d2e1a72fcca58-86f82f51c34mr1825446b3a.1.1789356174723;
        Sun, 13 Sep 2026 20:22:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c3f3csm4014523b3a.16.2026.09.13.20.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:22:54 -0700 (PDT)
From: a0987203069@gmail.com
To: linux-clk@vger.kernel.org
Cc: rosenp@gmail.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Mon, 14 Sep 2026 11:22:48 +0800
Message-ID: <20260914032248.387264-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912002326.237419-1-rosenp@gmail.com>
References: <20260912002326.237419-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rosen,

On Fri, Sep 11, 2026 at 05:23:26PM -0700, Rosen Penev wrote:
> Use a flexible array member instead of kcalloc + pointer that is not
> actually const.
>
> Simplifies allocation slightly.

Thanks for the patch, and sorry for the slow reply.

We're already working on a different fix for this driver internally:
the ADC divider register actually implements a simple closed-form
relationship (rate = parent_rate / (2 * (N + 1))), so building and
scanning a clk_div_table with up to 2^width entries via the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val()
helpers is unnecessary overhead in the first place -- we're replacing
the table entirely with direct arithmetic in recalc_rate()/
determine_rate()/set_rate() instead of just changing how it's
allocated.

Since our patch removes the table (and the unrelated mask_bit
mechanism, which has an out-of-range shift bug at its only call site)
rather than reshaping it, we won't be adopting this patch, but we do
appreciate you catching the allocation issue. We'll post our fix
shortly for review.

Thanks again,
Joey
