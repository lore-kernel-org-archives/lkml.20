Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321E5262FD0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909979; cv=none; b=IGLDaYGaAQzJHoKLhzn8+NtPOa3XtT74CMj7jkNwdXlMT0h+l/pLUA054Z+PatmaxxlAsFb5u8+iZUjcU3zbjSD3G/c9e1og1EoIcbvTctbBFEePFaraEtQJ7OQZXkYAqu8ioOJ4VbGQ58W2ARuBlIAEQMhdSpEtryX9zFDhUUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909979; c=relaxed/simple;
	bh=QoW+zTpFe/hAimq+Yvo2aGAQOgYJWR0s6ZvGeaJGaRc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JRJbv70Qf9O8u4m+bPGj5IRqzTTSrcIIgxZZM6VQj9QcOJzqDiD4VxQNuFqz3YKQykHzmgyvxEplxAK/G8isjIxT9Fa2eroI0SAB15XlBIGkWrksxUR5F3o2GNFDy1AxN1f4SautnADv+Yk9dsv45R7XokTcEaX1Ujyd/hThqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=G3uXNT1k; arc=none smtp.client-ip=79.135.106.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="G3uXNT1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789909971; x=1790169171;
	bh=QoW+zTpFe/hAimq+Yvo2aGAQOgYJWR0s6ZvGeaJGaRc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G3uXNT1kYEm94xraSWzckEela216RdStJaqZT6vQK/Ol0svOc91mGemgX1qiySh1y
	 iKhGHwdnOn//clS/JKeMR+nG3yQklgktCs1h4p+k3gAM436Q92e6FocGTfDWXPKFN3
	 KFkyVZs3khIsdYX1drKCkO+jvbvazrPgy2RZzUyVnwM9j8kXq4cGV80qcsGNms/Bbr
	 h9kdyq1C3TiAilNEIw7W4RFsuRnMy+7eG1jb1wgdfBwUpqjst1UpuiLmuKIMocWWeP
	 tfrdBn/A/ALMgZhWn6Ge27NslVxGHc3V0HO/of6Do3fuLnuihWBpPm1HWOX3ztIQbR
	 T9CL9QUdc/JtA==
Date: Sun, 20 Sep 2026 13:12:47 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: CISA Flags Three Linux Kernel Vulnerabilities Exploited in the Wild
Message-ID: <gqrUYA2c4s1H71Vwz26ua_al_No7q6A93kFDxfgK9Mfpjvm2DEKc-UClyceXpg38E0Je1QkqRfeylHCYOjWL_cte52kfwcpqEOk11gw2N5w=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: b474eb4fe8ede1918c6ab51094ea59f8c16f803c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: CISA Flags Three Linux Kernel Vulnerabilities Exploited in the Wil=
d

Good day from Singapore,

Here is an article which I would like to share.

Article: CISA Flags Three Linux Kernel Vulnerabilities Exploited in the Wil=
d
Link: https://thehackernews.com/2026/09/cisa-flags-three-linux-kernel.html?=
m=3D1
Date of article: 19 Sep 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
20th September 2026 Sunday 9.12 pm Singapore Time





