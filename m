Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2493009CB;
	Tue, 15 Sep 2026 01:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434164; cv=none; b=lLqEJzX0TqDZfQk2rySoZZGyXZNf/FguSZ/QnTEkOiwT8yLGyjpWPVDpfU2aB0BcVzI1Hyog/0CJNHu86BgUNOQnyRBH7Fzzj8zuwY3t+9Uzm9h9xV0hlTYOP8nnBpfhH97f4OvNLRnoA2/0Ako/XBn/3yMrnMBk39do8QoDk74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434164; c=relaxed/simple;
	bh=Kz5i88PUCASOVS6k/T/aYxrHJveJ2AUmNFEZ0I09Bws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETTJxmxYe02GBMgwY67LL7PMR1ofjFkqnW9rmHaeeNoDZmtgkOk9j94EtointHT5ksMVbjNXhbsiNS9RqFWeJkMfMto7JtNKifAWn/4ZacUthG7IPnQtgbn4QEghvpP9+mu8fOMNYI8aUj5uFAds8vy+p75H2es2eaIQF92Mh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiSxcM2X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiSxcM2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC761F000FF;
	Tue, 15 Sep 2026 01:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789434163;
	bh=6m2Vn4oZUUn29f+mAvG/SuewpQoePvWx0aBZ7BrrDh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZiSxcM2XpscYGx5F1oqvPR8ScoSZMyzPtT9JPlN7MN+l5nxGiXgH4c9PA/XUon1RI
	 +LWC9u7VH2wHvzY0TtJDeCq04o/u1mpSRF5ACE6Q3DUqssKQBBsaBIU/McO4T50r/b
	 HwDi8XUBGt6f3NAdHTA+Fakl1Hgtn7HqhfGO5O0Rjt8yGN3mY4os7AvKGg77sPsXpq
	 qApjuIxNJ/ZZOWCiUkA6HW9CMuwoU19LsO1xVInYaCUG+ryGfnTG+mps0UrIdoqzcD
	 zitfaB+NUsfq8JtP5IKi9gEfqy9ZRIQ8YfyWSX7tr8eMi+DlHc+zgH74hI8xtEO4CS
	 4vZaUbe0olfkw==
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
Date: Tue, 15 Sep 2026 01:02:38 +0000
Message-ID: <178943401819.3674983.18276114310523066796.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
References: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Sep 2026 21:29:08 +0800, Troy Mitchell wrote:
> Add myself as a reviewer to help review patches for SpacemiT RISC-V SoC
> support.

Applied, thanks!

[1/1] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=3215a35fac45165506e86de212306c5d0e73eaf9

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
