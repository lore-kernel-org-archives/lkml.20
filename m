Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142293ED5CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169300; cv=none; b=ThKzBHTJv81tAn/6J0hHlAtQJaltderMIF5ZuazVL/TempBFHaMRlwp3+r/5qkuZOW9H9cjvEjXfFUgHH7+GuPsNcfuff2F7Jsi3YTLOYQp7+c3jAiWi+ZMBJ1yn5uR75VvHRN0D1FcoTbi1CwGN41l+H/k4h/jPCAe16Wf0PpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169300; c=relaxed/simple;
	bh=cAmpt/6jzmjRUtzY27yTb1f0xUXpTa3pQOSlnGJ3bqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jXw0u6+d7AoENCq3V/O7Bgsv/pryl2ICUpf34rRdDq/GgO5whkGbe1+oMZ220FsL5/pddnFKhPtY0Es1BoBrI0ASWZkXBkw0mJmKTAylGcNfdLoiRmwIyHrcA0llwCmP0bs/YH7xX7/7bEs8OfRvstCZ5q56fTi5bYTSyQus4sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YU88dTEy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLV/97o+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YU88dTEy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLV/97o+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789169298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNhLBr9XvtyJLawhPkiUDEcwIc+PqdjYCsGMWqH0ovQ=;
	b=YU88dTEyamxqxtHp41Rp2nsidnVMtYCdPfVomse1XlmS5yRPRMOEGcINzGh9PvVkRwc+by
	KIerkpF2Qcd2nybliIDvOQvnwotFgt6hkUe4BEHKLrLQV82mqux/sgmyHPM51E5b924Oz2
	qHRdLwse2Qp617fHWKeUU/+KZ3UtJo8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-goGHtkRaMLWc7Xe50UjLQg-1; Fri, 11 Sep 2026 19:28:14 -0400
X-MC-Unique: goGHtkRaMLWc7Xe50UjLQg-1
X-Mimecast-MFC-AGG-ID: goGHtkRaMLWc7Xe50UjLQg_1789169294
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104c2ce026so39744906d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789169294; x=1789774094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNhLBr9XvtyJLawhPkiUDEcwIc+PqdjYCsGMWqH0ovQ=;
        b=PLV/97o+l510LfhJPbIHKy1rZQsyvMbJ+rJkp+npacdsZqgJWJlaF9z12TKBu48KLt
         wIEX/JQNw/7n4J6GHpyjVmR4V5Uy5wMwl/mhjKygIjp+aOmd/wev9Is9qO2zCXhoWZtX
         B+bZrw+baZrqd6dAQsy8tNc8AYnaqnzJB4GKw3sjcsrUAyBSn/fz4nHOPfRn+p6aR5Kr
         27R0sXb6w3bemvwunv8b5n5dTfnSFL5Mqai/Iws8aeDGueJn+0ydI5qqQ5wnpTzbFLsA
         kM84E9gt3Qj7PYX3RyUOJy8NJc6Nl2uPiX2F8KjAs9uIPVIWOg8OiA0nK5YJzLtfUDWy
         MSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169294; x=1789774094;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNhLBr9XvtyJLawhPkiUDEcwIc+PqdjYCsGMWqH0ovQ=;
        b=KgXMNqOyF7/WTrN13Becrj4j3dhU0qdj4MrOBNeov9qqYBEC9bbRdxuaaMd565QXlY
         u8RsaXZUmGu84NkHXiZBDWGsrdzVjfXxhqZFBxw//WtGtepORObGOEBzfMQYJVsg0Gkg
         to4589jtHtYaGXMubg5SonT8Mo+n+Hg0cOPRMBqvfVvd2+vkPWXu+tQ3DXEJfjtOhiKW
         Izl8PJyYWVx2U8gjMdl3R9jEAfJ/m0EC7pa4VsTMBrkKU26T56doUTnuCPax+mlh3Naq
         mNhmST3Omb4yxu3FlTgKt1ACPFsozUW4zCpEy4Wy3Mx6QC9VTUE8GeWhqdzyONBz5y0s
         bmWQ==
X-Gm-Message-State: AFuF++nA34Q1ydx1pS5Uf8kNuhvWIntWkZJb8i4kvNUXOxgX5/ziXOth
	1w6eMEOHxRi1cgf8fLuaqFMYBzNThjJO19V41mJOs85eR26/YKE5PNaFq3ATB3AsE2GIJGkJf50
	J/8oazOHCBuH9b6qGHDuMwh2TCD2v/7x6i9IhoLd0xSKK752cgcgflnszcK+JchDp6g==
X-Gm-Gg: AYBFou2Pr4HoraZJweLVzAsv6K6r0tcjDGtYUN1LdC8NTWwlm2X9QkgLgiBFnISzCZ2
	5fSt8TZbf/1uLgTauDtzf/96Pt/atU+tDKZX5LQbaKE7wCdjfZGksRrLMLuyyj6kNzEQSPK99aS
	EPbvhhvnO6to+KXuzqbd1axmp+c/d5t174ajBEzqsdtHPxTnrMhkF+bX17gi0PJnEgFh+Qz2AlW
	WhBauHBgebQkW+8Lj5Yl+/LfFSL/1GzQi5zlnVKmjO3K71zpZzSNpIex3W38dOg7c9SQLf+mfzE
	N8jfxBSB0eh578tBYvasbteWdXVfvFYYiURuwIJZtDeeOliJjaNcRkNhIF4hIYKdXU4qeU/fh1z
	KVrKzzwJ+SGFvqVagYfQMsDk7+736FTL/Gq9gQIeM
X-Received: by 2002:a05:6214:252b:b0:910:7010:7a0c with SMTP id 6a1803df08f44-912120dc08emr102711016d6.21.1789169294437;
        Fri, 11 Sep 2026 16:28:14 -0700 (PDT)
X-Received: by 2002:a05:6214:252b:b0:910:7010:7a0c with SMTP id 6a1803df08f44-912120dc08emr102710506d6.21.1789169293928;
        Fri, 11 Sep 2026 16:28:13 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3779sm32038926d6.43.2026.09.11.16.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:28:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20260904110959.21527-1-hemanth.selam@gmail.com>
References: <20260904110959.21527-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] clk: tegra: fix typos in comments
Message-Id: <178916928469.770750.10487153336129404917.b4-ty@b4>
Date: Fri, 11 Sep 2026 19:28:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=271; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=n9nn2Er0cB1X2W39yCFnXtqUqoO3GH14NXe4f7iwsZA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKW9HWJyK190vqmKi70/AKH7xdqrjP6FIVqZRX7znGfp
 rrutP7rjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZio8XwV+L69l9xqzJO/Vn2
 /v/bFT2RDXf6b3+f1X1UI1fJMkSa0YThn1owz5b1Fq+aY8+Vd+Ze4Tr1VnfVvWWbel44dbXebrB
 mZAUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 04 Sep 2026 16:39:57 +0530, Hemanth Selam wrote:
> clk: tegra: fix typos in comments

Applied, thanks!

[1/1] clk: tegra: fix typos in comments
      commit: ad0252c5615a47d2c97de84bbc2570d25bbd0512

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

