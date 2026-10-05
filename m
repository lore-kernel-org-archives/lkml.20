Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AE33793B8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201059; cv=none; b=IkkKq1kD3U+zj9hQVyPWCh5NMx2VqSwfcAqb6+m6WNx2KDjZ71Ct2NOCIJIBYiNyuDxZ8UJG9lZghxaGWcnnU1yuTykex1uLmBno89C7UWffd5YQlxC9iojjolKsaLpvN5OEJ/KeB59gLXNL41QOBcvSr8JefHyNU0/vWJBecEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201059; c=relaxed/simple;
	bh=e3CuOM2eCvGmHoYcmlFPplrZp0K02m2jIXVmvukgLTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCobp2jAq1gykUE30d9G0tj3xWAE5PNqurbmMVOI7vGDJY2M/Jy137yLJG9JeZVoatCWeRvRdYqgPH72+gRMorLN4BAGfb4N4u1l5JkRzXPrOYF+sllLCwdl8FiQvy7+mxdarFBx0cUoxoFRFB4SxEwnkQqeWsB6ZQG+LXkd64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLauzBld; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLauzBld"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1274522a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791201057; x=1791805857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e3CuOM2eCvGmHoYcmlFPplrZp0K02m2jIXVmvukgLTM=;
        b=HLauzBld6OB1jTJcwIjaKdOQlgdQIWME9ns3a3QtMls4+FjLHqc77dM6+iQBw+xZRf
         qG1LxV098oSnOxSZu/46qi24vR0u+ix+FlWmWbWFIkmjrp5OiO8SyQluqm05tZLTOLUP
         BPVEHCY6jTXOe1xP47qVnCp0s0oy22jE1vGsTrZoWo8PYRfb2Klvafs73dfNg3s36RfV
         jgTgtPuzMkqcKpf1r8zZ++G+l9+1a1EeWYifiblZPtD3Hp0o9zRBK0SzsBzdz6bPAWWt
         Vk2yob0Eb3+Q+SVC0qwPJvJN95+EYqD0LaYpSd6gZH3w25Vi8uQQQA0lvybuT6FlljYN
         LjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791201057; x=1791805857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3CuOM2eCvGmHoYcmlFPplrZp0K02m2jIXVmvukgLTM=;
        b=cSPnyFfXp+LeUCgbRc0qRbc3EVU+UbEpKkBw8xz4NhEbmAp8n7sdbblHPxj7XZ36K9
         7cOTWLU/iFzlPZ0N8KzTaym2vixaLyjhdZJXZXbO6V7Vy5NXSeSBhNdqq9MAQhKtHX3J
         8Q4w24s7zxePWRJs5NsjXujxI38aXRckAq/eKXt1ulC1IANB9HPM9whVYl013SwcIyx6
         CyJ0eugUz0zlPAsxbyXdIibvght0HjzxCyh/O8p0I0DT+eC/3uugKBsT/I5UJAvyMCAt
         wILavpP3gaqk5vZSipPzpPJkSNYlecmNqFWBEppWNEJzCCM07B1+0p0D9d3Vao7bRVUN
         CopQ==
X-Forwarded-Encrypted: i=1; AKwUvByJwhVULYDrSe+1iIyZAS5atcybjwx+/xAa7cgZ2ZfZOx/OY3N6cfzN85PpOR9xtyQbIa6Cx0ceQfLYCvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPRt+MYyP8iUHPVQVnP1SyUfsIe7ExaA1on1b9IZaJj7QXniS8
	Iz2g36EPb7jD9cY0Wc+QQzcULkzKcAuxnL8Zk1saIrJJxTeVrQtv6SA=
X-Gm-Gg: AYBFou0+24m8YHcQMzSr+t420wpe1oJabxEH2ubrxBrbzPRFDPFvF45D8n07Eps8pOt
	hgVbg4J2Z1rTmKCPUBRiB1l1wVLSox4pi+p2bJRSsgtS/bThYpBR0eCX6PUaGWv7RWltIRJDVnN
	e79DzziebDWwnuAPp+TJ3qiv2ukT1qGJKweKK8BGqanezRfUEtwg/NN4Qi41FqnUCnEYbOoP5Ub
	0Lj16nUfzxTegtTeyPn0gNbRoCC/dCLIenTnrdLxPx1xhF3PXN83vk1MDOKyVNMzsPd6wK/8a2e
	6Q+qECx3V1zCNK1BHcxdxvSlJsE/dINczmOagfsL7Oow8Z90C4irJW5nqxzp9b0k3jMVrSdhzlN
	UhRaU8LnR8ymKQhd24QN1bw7igdRZcl2dSpehRhOTvFQkgcZqDguEj3M/ZKhr5g8lDacbxaaz/G
	fqwOHwP86teP2ZBomcWrc9IHXz8y4fhXXZktnG7aheYyum772StTPHnWe6q8OMFu+prOi+62iUe
	yC6kRy8fcIjyehrPEDZncZ2jt4=
X-Received: by 2002:a17:90b:17ca:b0:3a7:f45:5cbf with SMTP id 98e67ed59e1d1-3a70f45678amr6816057a91.28.1791201057185;
        Mon, 05 Oct 2026 04:50:57 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7102:e8f6:be5c:45bf:9b70:944a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262f0sm11942752a91.4.2026.10.05.04.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:50:56 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kas@kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v4 2/2] selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry
Date: Mon,  5 Oct 2026 20:50:51 +0900
Message-ID: <20261005115051.3950585-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4a24f7b1-65f7-4947-a325-7c9e9f642f2a@kernel.org>
References: <20261003103030.63380-3-donggeunyoo.kernel@gmail.com> <4a24f7b1-65f7-4947-a325-7c9e9f642f2a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 5 Oct 2026 12:43:48 +0200, David Hildenbrand (Arm) wrote:
> The CI complains as reply to this patch:
> ...
> ✗ userfaultfd(2) test failed:
> # not ok 43 minor-collapse on shmem

Thanks for passing it on. I couldn't reproduce it here. Could you share
the full log of the failing run, or a link to it?

Donggeun
