Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563006;
	b=L3FeQSlUK3jcziDt0okcX5cOfjR1RnXKAZPXDq1wWe65kGOdrITov2rSWYsI6SleFpbo
	 8wRyHnEyaJdZQgStv8U76i/jNkXcA9g7jrrNu1GBtjeK0e/Yiwm9m/+DsTb5dNvYAQYmX
	 BU08Ft84gopRC7/KrOEuGrJ7+DjmL93UtgVi0hWvxztDlhA3NRvN1EDe7fXXiT7YFc9DN
	 Xk4XCRNyl9m/Ze26mZdBrjTC2AWUAIT235wme/WFAuXjtUZoxFHsXCD0+j6R/2Gs0/gxq
	 AZ0F9y6m7+ShrBruSEfu0BRDgtS+EeKaPqnLYBololaTnZWpfnKdPpaemfN3Q2Nwppw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563006;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xW3YbfBhoHEyzNLPOQyPfY3kNSYPaEkIOw9uSvk3Kw0=;
	b=VkjMJeOiMflj6y0FdKlKr+htmu068v4l/1kjFuuVA+yDnnjOwSxWkZa4W+gqCobEd86P
	 baJGEvjRL9lXebL3HLKRDKIb/5/rHE2xEkjuJIpWb32QaH+5IOULbNSjHwR+jn7M0vAob
	 b1zf5d/xw7dc4kqSEMbH3KC9JKzC/4IPFoOoOhUDwfcC0Z5O3Bv/IPt04H5lvGxin9pRZ
	 R1pBjbfuJE1192sME07TE2UPRDMJzA66T14DfBgWd24CpMPak31/o/2AkLDpDp6yCcegV
	 kJzf8Dd3uF32wQCKkyf8bfNz+lj7bqxDqz/Cle7sGNhz+j15ugkU4CJEMY2zbsJ0Big==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TqC7GbJh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D53606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TqC7GbJh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2D61F000C4;
	Fri, 13 Nov 2026 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563006;
	bh=xW3YbfBhoHEyzNLPOQyPfY3kNSYPaEkIOw9uSvk3Kw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TqC7GbJhdhCMDDNCzcYotcWvJhf/XO6f9/AeNP7U+MfuEzjXlTHD/w2CZKH0HSSA3
	 Q1Gqzi9pCjwyhrwoT7tVI7TY6saCPkd4bVyFLcDe31t6YrR5A6PM7c+cCXrKpSiOTG
	 8OUH1snZowoJjyWW8ayo/JbbDf+GrvkRoljpX0xHbTqWbemGHPB6ZQ++gwRGI/CYu9
	 PKMC3oJHYiPwO5gZgHhN1HHTz56Ov/nczwi5oFtQlKch0xS+40IeesEs9n97jPviF5
	 OJNZAm9zRB+RWcWSleQq1X1a394Z6bcqYUcwHQ8MWCGvWFK6n7FzJ9H2P9MfGoqVKy
	 FTOppSQewqzoA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/page_reporting: document @order parameter in page_reporting_notify_free()
Date: Fri, 13 Nov 2026 10:43:08 +0100
Message-ID: <179456297819.28103.6590198375118654363.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112-page-reporting-doc-v1-1-593af69f3801@gmail.com>
References: <20261112-page-reporting-doc-v1-1-593af69f3801@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Nov 2026 10:18:19 -0600, Oscar Alejandro Sánchez Lucero wrote:
> Add missing kernel-doc description for @order to fix a kernel-doc warning.

Applied, thanks!

[1/1] mm/page_reporting: document @order parameter in page_reporting_notify_free()
      commit: 3a99594e62fce8c646e8aac01d38af16d6833a40

Best regards,
-- 
Vlastimil Babka (SUSE) <vbabka@kernel.org>
