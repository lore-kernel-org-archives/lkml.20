Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492034;
	b=3tiQgpYC8diA5yqbeyOVtytBpgIMm0DLYzyX0Y2ydKOkd2O+E9XLJMpEsab1iYc53SGc
	 ToeAk0BBzwLbB9M3IDdty/0kZyyv+5+Nl62hg+vKi3iD6sgubE+ebQhMiRZavhmprkfhw
	 +ViZVDUwWEWk1rxfbLnp97vdH5DkCejdrxWQk/RLahq6oQ7QovT3S+I+u703YGb7miFEn
	 ex9g4GgSu10oQgcm+V5uryIw2ZSdzm4H27zvXF2pYZ9+mbleDv+7HNrCyTlmooE7bDqIK
	 egd6KahVDTb197QGCKR+t2An8kj62hqTSuXqDlJx0ZPLC7h509bK1hJktckAX/SKY9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492034;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/9SxjfkPBMGSwJHNywZJ/fVHoFLAInw0+z4Jckz+hCg=;
	b=rV5akZKW/QbUcn6n7ph8hm+cUx55l/fNDB/cEs3dUeSMzzG0Du+wQ+YUAHsfsVxHvCW9
	 mBpIfCJevMRlPjMGRDpSIzWkKgVbTksNv0trzhK2z289T+D6zhhh/EvUzH4UcRZDNtrOT
	 7bGH6YjW8F6bU3SBqI/8G6JgbCmcMJj3qvS9s28dyiKVvnWR3N8+4wQIv3zmmwB+3t8Zf
	 /98ukt7OKToAIVulx2uZo9Ag6VFgv9hX+7asTbLeNGlHGyz5Mco7nSMsz5auh4EvQvEzU
	 VIG8kD+jYJH1DH2d9k5OpnWmCuR78s5N4nkljsWK+HXAGMzGMRGkru0vcD8Bun6eJxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73B606A32A;
	Tue, 20 Oct 2026 10:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B73B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792492031; x=1792751231;
	bh=/9SxjfkPBMGSwJHNywZJ/fVHoFLAInw0+z4Jckz+hCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=df16b4rZju6WCMCD3p3UGKnP0ESVB9DEKjsYPJ2fW5bNaVzmzVYAqUwRMjQdZfcgJ
	 sq8L6UwDLGg4a27L1PeAy50+hV9SJ5Hm2cLOwOvDH5Wd9s79/NMAk6B9mLOuZEz9L6
	 LgdQ1XwyRoBuypsbtRqWrcLsBFkCnVQaJk5N5VSxs2tAk1IepZukbffrAOjalzsYxU
	 cBT90y4d190ej7DDGACf3HHKMy3sf3nj2Nz6BKXnS4AaAvw/qfkRmOWX97/VYHDhPG
	 h8NT0UBB8aFdxo5emOCcatvqzWWnDkHNkdeGxBZ/xq0/V6fHDfaYKq/WQlhBt0Wpdq
	 RLMVaWCqC0VxA==
Date: Tue, 20 Oct 2026 10:27:06 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
In-Reply-To: <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 95ccd282feead4333ddd8254b6582c6fa33f7465
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> DTS cannot depend on drivers. Please fix your code, to avoid that.
> Dropping from my queue.

What exactly do you mean by this? The DTS describes the
hardware in the system, which requires drivers to drive it.

Is it a wording issue? I don't depend on actual driver code in the DTS,
only bindings for the hardware they drive, so maybe I could make
that more clear?

Kind regards,
- Aiden Isik
