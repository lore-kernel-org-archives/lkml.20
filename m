Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117268;
	b=bIDJ2nQ38vmzS7x9TWDxqVR4qtu9XtiwDAZJkrcrgYjxbrjuoAIyW0PZBIQpA/WOlM0Y
	 XmpYNs2cotw0oFakhc0JaKyt3Xk4fjOSkDV0eAUGFgwVyepfdNOCl50RMC2awjFYKGQaF
	 yKuqWd1ws9LZScRhuJIiyEDh35Tr6Is7ftHDEcmRMY/TxBZTvt5F/XBSUxZPMzQi7RLAD
	 1CIA9A90DXboYpXH4/pJyvCKXNLA3xNCa7DCJZMGjClyOYYgGJvfzgl+Jq8z+Ojr+iyOd
	 1L5BD9dQZoNri5ZADVUdFslFk3eCLiDEO/S9wr3eNcgBqYuoW1XaS4IRVuuC9ac9sMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117268;
	h=DMARC-Filter:DKIM-Signature:X-CSA-Complaints:To:Subject:Cc:
	 Origin-messageId:Feedback-ID:From:X-Mailin-EID:Date:X-sib-id:
	 Message-Id:List-Unsubscribe-Post:List-Unsubscribe:X-Mailer:
	 In-Reply-To:Content-Transfer-Encoding:Mime-Version;
	bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
	b=E1StNVWMFFZKukCTQ2YjYvw1VzZ7ZPQXWqMnFWvt9Ej5DtI2DyZfsgEAqOrD5lG7oaUD
	 zTbUIs9E7m+unAdH6T9RLMF6ZiKEwTEEdshjBs3X0Hd+gJwi13O1Ps87nVvJpq6xige6S
	 Wm/8PmGG1QBqy0/xgEYJJd9odWUh6WNhl7IMKUPSS8r9sQuZH68ONOhpKInVccC7ybcaD
	 2gipBRtNRq3biHqQtLwfIVfFy36hI53UZimT7CrSow22Txkj6wf9q0QsdLpZIDPK4TUTs
	 OMrIaTl8dtC1zJWZsOIW1odlxHhg8AUtcNt6WoQoTNcA8t0mJTQcQsXHxazSlyyQaYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gy.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=XTLxp48l;
	arc=none smtp.remote-ip=77.32.148.25
Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1E606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=XTLxp48l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=XTLxp48lMds5dw8tmQ85UKnxNH0mxHWRDdz9YECd0M/jdyrYdluP2m4HhfSfPlbBDL5QTQpoB2PT
        sjgWK1DiibtEyzX705kY/TCwgfAQ66scfCDI1xi3m06Gk4qQg21MXnTpUuLf00YexLs/03SHJaCf
        YV0A4a1SURLZM42TuwFQhScWfHXbEZjY407KULSN8wuOBlUb8+EYh+9uvN9nHIW/66Ub8g+ENx8c
        hG8RjwjfM0mOYabEfYuJCVWxzDIEa02P3h1Gdbl++t5gDA4khkqYkGv5GlQIHCVM74gkaQUEmyfA
        O2BrbfKMX6MtDjSg2Me2KJjvBPAX1M5/ejJK+w==
X-CSA-Complaints: csa-complaints@eco.de
To: <slongerbeam@gmail.com>
Subject: Re: [PATCH] staging: media: imx: ic-prp: add FORMAT_TRY frame interval support
Cc: "DelaySystem" <delaysystem@tubot.lat>,  <linux-kernel@vger.kernel.org>,  <gregkh@linuxfoundation.org>,  <vickramk.207@gmail.com>,  <linux-staging@lists.linux.dev>,  <linux-media@vger.kernel.org>,  <mchehab@kernel.org>,  <imx@lists.linux.dev>,  <p.zabel@pengutronix.de>
Origin-messageId: <20261108055421.301762-1-DelaySystem@tubot.lat>
Feedback-ID: 77.32.148.25:11287567_-1:11287567:Sendinblue
From: "DelaySystem" <DelaySystem@tubot.lat>
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYxMTA4MDU1NDIxLjMwMTc2Mi0xLURlbGF5U3lzdGVtQHR1Ym90LmxhdD5%2BZ3kuZC5zZW5kZXItc2liLmNvbQ%3D%3D
Date: Sat,  7 Nov 2026 21:54:21 -0800
X-sib-id: LJDKSMazi-KKC0898yqjS2yvp4dU1nmlqQeG5LVSny5tj93bDcnxCn8MfCiXuRZpmqu5r8Gc_Gs7b9DgMfTUMww2W9odt3xUZHXFe4cFgs5DbJ2NPoqk8d8zaHQVXy_zTVUj0JQ8yuH7QeWDe_K4dpad_Cjm-gY2eTiG2elJIoWe6pvxOxt_efbdVQ
Message-Id: <20261108055421.301762-1-DelaySystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107-batch1-m1-prp-try-v1-1-56a08f54791b@tubot.lat>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0


Please disregard this patch.

It was sent from my relay by accident: it copies a patch I did not
write, review, or authorize, so my Signed-off-by on it is not valid,
and I have no connection to the listed author, so I cannot vouch for
this submission in any form.

Apologies for the noise. If the actual author wishes to pursue this,
it should come from them.

DelaySystem

