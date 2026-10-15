Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B28D3E9C05;
	Thu, 15 Oct 2026 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078494; cv=none; b=OoWLv9vngoflX6x74Zw2X3Re5AnCOHsx7JiMqek1Ukovp/tfRBwSj4qnnKZurc/PGd452gph9X5lc88jN6zz9AlntyNyNPX8hdtGhHBF+wPWl6pHjZ/FtCeXLOkIZsGOswX/b69FbTLgIvvCN8zgSBJX+3+s5993jtt4AAPq8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078494; c=relaxed/simple;
	bh=qGWfG3smDCffb/1kC2SHw6xzfsK2o+zRukC76FDBnBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=quIkkzNrqKFzpZLk6QpisGaS16M/YITtbQIlrjVrKps0ggMnEYdn71fDDIi1Tkv4YJZ6T1u7sTIFxtMUZwxVuFyxv+eSCg+/TjmpahELIWjws4AqUACEITXUeyo+Pqx+SHtIq528nDnXJ4Seuibkcu89sqouuE2eOljutaevjE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iLP68Tj5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iLP68Tj5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 02DF74091F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792078482; bh=qGWfG3smDCffb/1kC2SHw6xzfsK2o+zRukC76FDBnBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iLP68Tj5wvqf3a4K4p1jRwe/HRs9JM+347fXqBiwdhMing3M9equUC3lwug1g+bAQ
	 k0GDTBQ2Jh93C/CQPGYhSKhoj5B8nr+PogJ5Yu1TFhkaJu+eEr44Dp6Z6Jf56xs4l5
	 SCS0TDKCEd+RkztxGT/IzcOZm3slpEVhiq13Lsg1ZkMG2AnS5dvW+z+t6SJm4qStol
	 d0l+ezIRpiIdDBl/0T4fFb1KuEJxjPD1wZoHKJ4h0RSLTabfK4GXBV4VlYfYTM2c/m
	 fgIpdWJr3qzVx5rRbT553VvzbSzkjB5B7WdmyzxoTtoaCLiIDyuiT3Bn6v1haYt80Y
	 Hjd4h2Sm4XawA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 02DF74091F;
	Thu, 15 Oct 2026 15:34:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, broonie@kernel.org, ksummit@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, skhan@linuxfoundation.org, tytso@mit.edu,
 workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
In-Reply-To: <atDnmZ_AGg6PnyRW@laps>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261014174838.114990-1-ojeda@kernel.org> <as_Cr4FhzyAh-kC4@laps>
 <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps>
 <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net> <atDnmZ_AGg6PnyRW@laps>
Date: Thu, 15 Oct 2026 09:34:41 -0600
Message-ID: <87y0bzq8oe.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> I'll send the v3 later today, which does a better job at having very little
> information in the SKILL.md files themselves, and just points to our existing
> documentation. Would it make sense to keep it in the agents/ dir rather than
> mixing it with Documentation?

If you're asking me ... dunno, I guess I'd say put it wherever makes the
most sense to you... :)

jon
