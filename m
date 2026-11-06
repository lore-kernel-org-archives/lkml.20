Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952005;
	b=Sp10FT1dhuIjV/0U2CxA4iUkdUG7YN1dXAI2FJzx8m8tX/k17yxvq8a/Dlpdf0UjTlew
	 vxAtIclr5Tp4fMuprE0o0HPRrvoulMA6D2IB76F8ArZPqHHID2bxoMinELa1XBJnlT1bm
	 wTzZ/cb5kovaAINU+jGs7CVwQstzNVZFxX4X0UgPOWI3rR6qMKmtMOnprTiFSQ90OtIPA
	 oZyzKDWPDK/8+r9l2wCq+ojscd4snQc6mxR/sYyTCl0MuHLF5ZYejeY6+oOifjv98N1Z8
	 81YgqkeqTJ7oIpV/q1zklbYVsEejEPHZmRgxnISgrIKYXuZ5HsEQvyVisPMo6UI7wdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952005;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=v1nxiWNvDsl1hp8WE7cbHLaFPIl8xhWiB32WOkhgz2s=;
	b=Vg2O/J2611j3eYbWhcCJLpQL8AzS6XpQAws4SleLgWvWUP6TaE3n7vbJnpAuUe475orK
	 sTWF0cq/TnRXxDzT0CYnAX1W09DGFv0cSbALbfnfAj7jRfRSz+oLukXOdp3zQJic/FmJ+
	 UrrPoPHmvh4mgTK2gO0N2gq7eWyr2Ij8G0WNpjquldNdweaSSNhMG412dUixv3vmmRYOY
	 B0z2VENjEQL+MPo5Nzxq19yDdv+RcDIYHgf7iIr9hYaLJ9hBL9XPpwMkqVtZPidn6SMWX
	 gMLXlSjpfZDDArg7vn1fv3L9gZaheyGInCHZ0LDhhdHdd9pEh5kCpf73Xi7+0Mc8Ksw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA486083609
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA486083609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793951996; x=1794211196;
	bh=v1nxiWNvDsl1hp8WE7cbHLaFPIl8xhWiB32WOkhgz2s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=otwkvtkc3DlziLQew+IU4qO6/zBfJ5/S496aHJXavnVC+iRHIsr9Hr8BHpdr5LZ/n
	 WjThr3BrslxS6tWdDSEx9oOxLddFwf7bRoBUdM2sSNG2PD34+p4XorI33OD25mzgkd
	 hm11Ol5w1zrLfJxO7aVrmZB5wQ44skz2heMJ7FWJ9O7hfnk0fIDjmOof0C25vSdCZi
	 XNRWsT4u0dR0ZXCJ7PBl9n03GRi8cxmjcL0ZegAKk+u/UOzHU4syg0bg1J1cYf5iml
	 tfzfxP58ee125bmisrLHgLBzxSrG2fQV6bri83nWfl4b04g7+ja9Jlfe39xRZ9qlUL
	 vIKip5VSkwV8w==
Date: Fri, 06 Nov 2026 07:59:49 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Jakob Berg Jespersen <dev@berg.pm>, George Neacsu <geocausa@gmail.com>, Bryan O'Donoghue <bod@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, Simon Kruse <simon0x+git@proton.me>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Message-ID: <20261106075941.9756-1-lsa.uz@pm.me>
In-Reply-To: <20261016210246.58562-1-lsa.uz@pm.me>
References: <20261016210246.58562-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: eeb78e8150a51e158ec5410fe35eeb13bdaf97dd
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

Hi Sakari,

Is there anything you would like changed in v4? It applies to v7.4-rc1,
before or after the ov13858 analogue gain v2:
https://lore.kernel.org/all/20261002093507.43584-1-lsa.uz@pm.me/

Both carry an Assisted-by tag, which 7.4-rc1 no longer accepts; please
drop it when applying, or I will resend without it.

Sergey

