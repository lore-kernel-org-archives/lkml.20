Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A138A73C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521819; cv=none; b=MU+XpHC4jQqPzLUfeaQ6aNUxtzQOF19+496Gvc65V2QagKjrk1SMlxWL6RgTH1Ho1w9X6P0Z24xaoTAIHzjgnnSIc+KSIBBdhoIeHn1435b4g+BovvLnm3N30BEE6zMoasgqpj783QnjIiuDmRPc4dtQLYHB+rMB/wNbYdhMKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521819; c=relaxed/simple;
	bh=G++bRkIDNOl8sHoTbB5pTii7VM2uHLTAQscyhsYaSP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwZ/SvkFeFjmKyB8P6qHMNE4YtOy/WukQfvs7TQZiJEEp2Rz8GT1O89livgpMzJS1QoptI1K/YdaWo2jz6QzdQAor2IDNYSSGjHRNbSPDeQO01PW6eYSeAKbQU7sDIhyvtvI8xvgwqmNFD90ONY/XeEq2Db+cEDhWmWJirr/Xyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRyZpojy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRyZpojy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD77B1F000FF;
	Wed, 16 Sep 2026 01:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789521818;
	bh=A0W90VIeUB/IBMQozfKb1frW2yE+YJ2al62rTy8touI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TRyZpojyIkfGqtAYjWn5esKE2+0oYJ0ODs5DmjNbL4ra6Sl9gqoBAAzndgf/GYlDW
	 eJQKjAi2Q61lPAnXmrk3FJpXBY5Fc+AQKudHKMJMs9jJP+J5xMqUkXMcT0Dhdf61jz
	 sHcVnsb/u2OhpUAK4WyZaBm3yadKPjESvfWuN8UyZbA9h1LO6emlot06nzUqVLe2zq
	 XasURGPbpb1j3H57zzu2K4dFiI3Og3oFP3Mhg2RKVgg0XmW1HxusaS65w5I5iTJ056
	 dtTT45PF5Iww/CW8lpLffKGjmOfRzDjMD72/a4pZ1IkGo4CtIaW4OOn/coisZrQrXF
	 giNmtMYs2CWBg==
From: SJ Park <sj@kernel.org>
To: Zhenghui Hao <zhenghui.hao@qq.com>
Cc: SJ Park <sj@kernel.org>,
	linux-mm@kvack.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: fix misspelled parameter names in comment
Date: Tue, 15 Sep 2026 18:23:30 -0700
Message-ID: <20260916012331.102450-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_034C6FC23D4817C40657E5F17F64E260A009@qq.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 16:20:29 +0800 Zhenghui Hao <zhenghui.hao@qq.com> wrote:

> The comment above hugepages_setup() refers to "hugepagsz" and
> "default_hugepagsz", but the parameters parsed by this code are
> "hugepagesz" and "default_hugepagesz".  Fix the spelling and also drop
> the redundant spaces so the comment reads normally.
> 
> No functional change.

Looks good to me.

> 
> Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
