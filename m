Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7510136B90A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333869; cv=none; b=NhoDKV/D3U8WohcY5gReHomB6Kw2aCr2OkTwIvxzhObuTzhl/S0Wl2y6NUkavc/4wvqicGVKG8RPQDJAzd3I8g88lMykg0riTIHe0328EK+b81KKBzx0VjDv/0uWjKLeppfgJdJ2Zk6TwoX0ORyXfyk4Krja3KDREOthHYQ5+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333869; c=relaxed/simple;
	bh=urv7gNU4rMqIGs9dySg6bFvzRzhcyyCAG61WjyGKDP8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fuLVFEGSCVX03uyF7KpKdpqT4scsqpiDcE2UicPH8tVNLyAeFza/u7QnfwbNGb6K5QsYq+mkZ/2T4BHtCs6OrzA7JHT33uotEqhNYFG/c3rS8pQzgcN4cdUU/ZM9lOun4Gp4wVBWZhqrGU+w6cMxkuAEkI9IvKtw6pKh/cqCVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=S+XxbRPI; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="S+XxbRPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789333866; x=1789593066;
	bh=4QqbSeBPmm8lMoL7JHWy3GTtUucpWDvdZsY6f979N4c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S+XxbRPIuSp2M859GTmhy9q+eLpbK9C1Vn4IQS52J6iAZjdIkXiX4CXKw6+6gWBnx
	 ZOLnIAtq86ga76o2znYBOTL93j9R6/sUPHaGpop4vAADx0si3GRlHgnv2vBeJ/AEXd
	 Fszoy5+dhEGCsqVOd+uh/38W8ceKKiTgJ7mYubClE4nQVffrNjAc5RbhA5CjAu+hwz
	 +prgk6xv57ugAmz68S5w7ul8TJKjRn9bwLP9M+R/XlXC7ONhh57FGk9CNO25Xz8n2Z
	 az+lJEr5obZVat75kk1WUmz+gS3jI8689wbY882XO57BAiMo1OIskyYyyQ8vLTMc5Z
	 K27lUqbLIxOag==
Date: Sun, 13 Sep 2026 21:11:01 +0000
To: Vinod Koul <vkoul@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] ASoC: fix audio on the Microsoft Surface Pro 11 (Intel)
Message-ID: <20260913211045.6604-1-lsa.uz@pm.me>
In-Reply-To: <20260830151516.44629-1-lsa.uz@pm.me>
References: <20260830151516.44629-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 948baaac9bea0c6e267ae4fb398a4cdf441c6c04
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

For anyone finding this series later: it is finished, and not in the way th=
e
subject line suggests.

1/2, the rt1320 preset fix, is in v7.2 and needs nothing further. It was
already upstream when this series went out.

2/2, the dmi-quirks change that drops the ghost RT1320, is superseded. It h=
as
been resent on its own as

  [PATCH v4] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pr=
o 11 (Intel)
  https://lore.kernel.org/linux-sound/20260913210849.6446-1-lsa.uz@pm.me/

separately because it belongs to soundwire rather than ASoC, and because
carrying it as 2/2 of a series whose 1/2 has landed left it looking like pa=
rt
of something already done.

Nothing here needs a reply. This note exists so the thread does not read as
open work.

Sergey

