Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA557C71F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887046; cv=none; b=ppBv565JKvHwNxr32QW1thp+yMzB4WPlmY1RSpML/fsXNXcJp9ybFO897WuZyesp5J/6r8WtdxFJLleS6iqraeovvkLVtKfpwuM5hKWwcyx12kGgKC0Qm0HAy7QLvvQXxMsjlGQli3LY+IJrVNZCslWeNEkDZZO4r46CoOKekvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887046; c=relaxed/simple;
	bh=NUstzROOlzd5cJ1YGQAba342BKPBETjC8P2leo0YHX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fnzcob/nVCDKeayn5QkdVejePR9/9XRsbvhHPb84aBBf0Is8OMlXv0WZadYQNq8AyY6vp6zkRzLyEo0LOI9NX9g6TRI0LXqMXzxNCPQ8eKXXS0XHwE/DZb2vZLJoUVAqP6m7wZfPWME54pEb2W9GfYy2/azJTuRoCUrn1p1LPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=eUnrGat3; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="eUnrGat3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=JkU8rFKjwuh1oubimQB+pXSYyPI3aIXqVbtZJlapYoc=; b=eUnrGat3CvODt5hvzqdcgrMTlM
	6w/EV3pPeTarHD7jhON+zaew3gBBe8I1QNpKfqpySKP92OuvPZNMiH8/WVe5aXUAz2e3LNltKq1bi
	IDzh1zEzb+YJkiUA9o8jeT1fqboyn1k1EFj1MoLEAhfr84dL+5M8ncHG820LGgpR2M6Y8FDEZBz5f
	s6nt++MwubFmtmAiYlbb96fZQsPX+coLg5r9KRvPjKgS6j7Ly41tYs+c6RJuk6d/Meqggeum75HO/
	atvDz+qzHCPpGbHvRa7VrphqEU5WutCrPC36h4RGs9gmKvaFZv2OkdczHDAXgemltB1u1JzCOENtk
	lsa0BI5g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x3zEg-002Qi1-2A;
	Tue, 08 Sep 2026 17:03:55 +0000
From: Breno Leitao <leitao@debian.org>
To: Andreas Hindborg <a.hindborg@kernel.org>, Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260904122927.34360-1-hemanth.selam@gmail.com>
References: <20260904122927.34360-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] configfs: fix typo "atleast" in comment
Message-Id: <178887539296.4090214.4881963185536964624.b4-ty@b4>
Date: Tue, 08 Sep 2026 06:49:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Debian-User: leitao


On Fri, 04 Sep 2026 17:59:25 +0530, Hemanth Selam wrote:
> Correct "atleast" to "at least", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.

Applied, thanks!

[1/1] configfs: fix typo "atleast" in comment
      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git/commit/?id=9ed3e6fb6d29

Best regards,
-- 
Breno Leitao <leitao@debian.org>
