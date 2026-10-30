Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367383;
	b=NLTSDNqOhXIrEURTuQckzWkQkF+8jQ1AKphxWxE7ilKGMKxEn/6R4K/hL4O5Ay8OvaxE
	 WfycApjw/fTMEj8OfbIIYVy32mOIGzDom9oH9S4fFAvt9TKSPZRhuRs1RzCnuvIg0iN1U
	 3GIbyqVAC2jjGYckV6vVJFRw7dYq90ueh7UK8SsaJrhGTeUdnh8lUZtBs7kK/w69TBIi0
	 BdbJFbgNOe9QY+4Jkvo6I0ftYnFPAyKhtgyJAhTjowVvk4EfYYdcoBykq/vFOnbsrTsIh
	 45dybSZVXrpn1dg7lXB9PW9UMQvannRRPSAuD4ANuwZvZlArl7X6ealsyHga5wpIorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367383;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cpffohKLuv36UmVbfHA97m52TAwDv1Wbcfu5/pTTMlA=;
	b=GOQ4xlOUPv+Mj9bbr32EyI5Rsx2ELvcy+AtAPnJuh6/JF+jEBZMD6q4hZ41HJqg4DuiC
	 cagwilfH2ZkZeE02nIjdDHTJkG7NKdtIkcMzR7wPs1jfpf2b/Aecelvx3Svdzdy26yzJ7
	 qf7vqaXklYvcsq/yqksumOzXN7HFDFwRdPo3+eY0lGCwkABi5CZo5J0S0U3z4KeIQeNm5
	 AR8ePfCdT0nor1Ggi5+2DI8ZiYf3YPxL5O7Q6G/Gl/BPLK8cXvND1uTq0pBtJLVQpBbrU
	 dhQ57suUB45v3rj1v+6IBGfoAz7W6FuxzLK3pX/s1XcB7fhEOCtDqdSCRV4nuw6hrJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=OlCRu9y3;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DCE606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0DCE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=OlCRu9y3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793367381; x=1793626581;
	bh=cpffohKLuv36UmVbfHA97m52TAwDv1Wbcfu5/pTTMlA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OlCRu9y3ohB39uW1cyRI9d7TO+hdKEaTtkI4D1k2iV7dlQ9jk3AoknOadq0l0rW9N
	 ZWam0D69NSMTzrHP7rAOjFOlpoJTTnQI3G+R3Wyem56aBPZ9m/yWlg7cbm5twnFqjU
	 v/XBhV/uyZq3ii9bkORd9qeJ1tKWM7Qt5VSga6z0gESnEGXkSbc1ll0KYI0QFD//AY
	 n74Aqccp3p5LFH0PbNdbxcov6FwmKO3fzD4JL3oOAdYgsOcHCKEtAI26TyLsk+FDrq
	 YAw2zIS58pkLvL7Mnw5ALhRhq1aqaWW7k9DuBHEuOq1rBgED2oiXXcwFj+bB+XpoeN
	 tSoxxQnLL9pEg==
Date: Fri, 30 Oct 2026 13:36:17 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Linux Kernel TCP Flaw With 9.8 CVSS Score Affects Ubuntu, Red Hat and Other Distributions
Message-ID: <iDl3H6luC9kFpl5o67GXY-nezXRU-BHSPQjUlh6EbPff8ZumhzIIfH0cyd9BEbWc2Cb9owUW7eu94dqdwChS8jWfEQP0FksNBnokK91abRQ=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 85f4b08ad9ed1114a943b56f9578ed82b64a8952
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

Subject: Linux Kernel TCP Flaw With 9.8 CVSS Score Affects Ubuntu, Red Hat =
and Other Distributions

Good day from Singapore,

Here is an article which I would like to share.

Article: Linux Kernel TCP Flaw With 9.8 CVSS Score Affects Ubuntu, Red Hat =
and Other Distributions
Link: https://thehackernews.com/2026/10/linux-kernel-tcp-flaw-with-98-cvss.=
html?m=3D1
Date of article: 29 Oct 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
Why is the Government SOOO ADAMANT, INSISTENT AND PERSISTENT about maintain=
ing Absolute and Total CONTROL over all of my Android (Linux) phones for th=
e past 20 years???
30 Oct 2026 Friday 9.32 pm Singapore Time





