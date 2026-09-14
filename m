Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC246C837
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392652; cv=none; b=RTm94CtPNi5S6Dx1b1x2Vj/bnHRjHHveTCG2NH9MAA6a3W4ByOm0KMXBYZgISC5aBdpKGYCOOd9lnAo21igtR2mc2gHZ1kBRHJU/JSRwMgLXa/jxK21XzcDzq0yNP9Jfa87/nfoFDe9AKpPElpW1ICf/lkaErovXAzJE+rMMwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392652; c=relaxed/simple;
	bh=Z5aiyrhYPeBObaaSyxfH7WZ8K4IPKS8wAjD2TNWaDSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xz7EFkbr7yv2azbwCzJFy23DG0sYZ60Et9kwXrSuwvEut0Xl5j4f714tDRZr/gBrw438C3sA2IqsCnhoRZm6Hzslktx/4+BungBfXS6xsyDlG2X+iAoxWY2gO7mbBC/1t0Vo3ADgLsMdg6aGL9215uxpyUpgHPUVTDGU+ux3kAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8NPRZsf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8NPRZsf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6af07e08so1040115e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392648; x=1789997448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5aiyrhYPeBObaaSyxfH7WZ8K4IPKS8wAjD2TNWaDSc=;
        b=E8NPRZsfAHVHvGBm7g5O76RXxBV3htJiYq5v2QYIcQPRkoW/B+ZbPxgGulUs0IuufA
         6j+KRdbqcVMdyHTt1dPiUORYz+l6YcSy4dOoNllVGqEuACddLqXhREjeyDPY65VgsWoe
         iK2t2YSd86HqFptIawsY9fvaGkHbwB/z2xZJ22s70+FL10dwY7hVx305yxHXG0BW7O3X
         cuk3e2F/0Gk9mCXzSkEEBCFpgbNS1Ar74TBO3DBHARrzJO1OMPV0WNyFXI50ur7kPTxn
         P+lcxKA+oTuqvqK59cDrzgTxKix+uFRVp/ycIlE1kOKjIGKNxZ/zAXJ5NCGggITRBwNW
         PEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392648; x=1789997448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5aiyrhYPeBObaaSyxfH7WZ8K4IPKS8wAjD2TNWaDSc=;
        b=qNYz3zRRVb9UGXx39O/OPHtcA4MdRoVCGdVo8YANhcyf5JWsDKjO10i/qHOiLDlmDe
         EE5suyyIHTg2cvwaTwhf9PWd4kz10rxBSe8CYe15MiAMHZfqRojbD+dN7Xmf0R5qNTSq
         gDXYeF1Q+24gf3/IM3Es0ta94Zx7zgBQebGJrowfyXbPAXbvlxiATHl02hL4LMu4DHWg
         ufx5COzUx1ngGQyOm9Mj6sp1ZyjOXrjPpOW6FUjoApsrSLFApaziq/nOAWmIHg7Fyfas
         b38SvaCZ/e2N2lHLWdrjD3W/xT3iDNXWni+p4kQ+rKq1WrA9He3JLKIHDJV7eaujRx0v
         G2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQrPd3FvrLy+TDCj6UppZUQgZk/BEH6X2Nb4u5dgbtVxNe8UTP+aZxVGh//DjbV+C+IlNYL4WR1mmCDHc=@vger.kernel.org
X-Gm-Message-State: AFuF++nRiiI2kunpZHVyjP4nbUFMiiB8N/3NOTR7dxpeF4K8aUvU2Y8d
	3cuc0SquqHQlkDSKQStl/n7y33L24VOGpkhRycoFFyOJZasXAe5XHCIx
X-Gm-Gg: AYBFou1tgZIVTfgb4OXzLv+zFcwUym+Jzcvp1JrPgLUCDhKJsg6jQw0IJEUlxhvZm0S
	CwXrmMWA6jUlwXUcwZgcFOlrdX5Sr78TgJBLJdOh8fIomR0m2jbqjjZl248lb9X7i6qgbQ9YTcU
	TGswvk1FmkwJ4q7yNsdA60up9tM0rsO6KIciuaLGZ3h5tU5Da+Rx9pQjBdIx6ExE8WJlHOGM19C
	RtFkSF53uphdVjF9GFAcZyJXfMfLxvkYgyk6Eju/xoIXNOAPkm91MwzqdC7EeAI+kSxlZTHWL9L
	gbVy6q2Ki6gaRl0UynZakEqubZhJeuYuzNqf/8sbuP2XZTUfgXEEbU8FgMEREPKRHGB5Pw5qSCs
	9ghgoRfMhnWuN1bTqT8Mo+WWtzDG2+FWxpZA/VZyfIG/VCP2eetxSVRst2XUDP2HiOHw03RVYD1
	2o9/Tf31Tm8IjgqwW8+WZhj5DgSmmsbu0Lnx8Lr6jgBhd6ZJtq0p2b2PxeYDsLy7+zspI9g97vZ
	jqo7Gvmjev/qE+EoNF4nfDjyxY0liBWfoXtuiIoOtCS+viaWW5mC8bMxhMPtMLw3m5IknIsVt+P
	D2b+
X-Received: by 2002:a05:600c:4e53:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49e7a68b774mr27446575e9.2.1789392647985;
        Mon, 14 Sep 2026 06:30:47 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B85A6000F50888CB3F3FDEE.dsl.pool.telekom.hu. [2001:4c4e:1b85:a600:f50:888c:b3f3:fdee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7548d99bsm152380015e9.1.2026.09.14.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:30:47 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: Sidong Yang <sidong.yang@furiosa.ai>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Oded Gabbay <ogabbay@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v6 2/2] drm/rocket: Keep scheduler allocation in rocket_file_priv
Date: Mon, 14 Sep 2026 15:30:19 +0200
Message-ID: <20260914133019.6523-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914045605.381933-3-triet.hoang.dev@gmail.com>
References: <20260914045605.381933-1-triet.hoang.dev@gmail.com> <20260914045605.381933-3-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Triet,

Same run as on 1/2, on v6 as posted: ten pairs of concurrent clients,
so two rocket_file_priv instances with their own scheduler entities
alive and submitting at the same time, then closed, with the kfree()
now after drm_sched_entity_destroy(). All output bit-correct, no
lockdep or atomic-sleep report, clean autosuspend afterwards. The tag
stands for v6; please keep its comment:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, concurrent clients

Regards,
Igor
