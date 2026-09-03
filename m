Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6D3367281;
	Thu,  3 Sep 2026 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406211; cv=none; b=fuIq+NfEAQNkRo1/HpZRw0/j0wxndO6ISxS/1uLh37EEKjWY4HYJNQO/m+DrrENUtIgG1wpd+WJ1s1L+ELWwM/s7f5GYTT7iM6Z4MI7naXG4ISopNRIBXsCCMHFv66ErktvJU0StPzwxlWEpdiXJ1qmYZlDvRMLvB/Hpc7ncvyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406211; c=relaxed/simple;
	bh=WaEq0oRkEcYbCfT8ZdzPK3UROlgtnMIJUAo/u6CFD9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=aHzeYTYZj4E5cnRLftSHv6KoPMjUGXTPmJL1OYb161Z/xc8hTlN7aOOT8qy6QL+OmwEMvNTpiCIzeo7OuD3NXZAnujhQ9KXylijIsracXVf3slzuz1U+QDyKbgLdatVZawodStlhiC6vCBPUeOw+yb151xeY4emgNG6CBdOfODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=C0JwSKyC; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="C0JwSKyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788406145;
	bh=WaEq0oRkEcYbCfT8ZdzPK3UROlgtnMIJUAo/u6CFD9M=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=C0JwSKyC4SeNkwYfy4C6jHlK58HJbQhNFNc3X1F3sbnzxOejOlvF4/qtbhnHbhVfX
	 oj3WYUAb/MsXqctZ2L9xdym6bd54SSHDVXT54Ve3+fXd5gxlJauBmNxY0qvqhZ8DB4
	 9spfEqq/hf0Nu6EsJcu7XlxyqANe7pabgcYlmtRc=
X-QQ-mid: zesmtpsz4t1788406143t032f900f
X-QQ-Originating-IP: LJ5LtijfxLyByKUO0WSeF4CNc/Be8prOeq+pDULPaqQ=
Received: from = ( [183.48.246.134])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 11:29:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17379667977984956232
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 11:29:00 +0800
Message-Id: <DL5D2ETDDPX1.3QTJ53KUA3JED@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Ulf Hansson" <ulfh@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Adrian Hunter"
 <adrian.hunter@intel.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Long Wan" <long.wan@linux.spacemit.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] mmc: sdhci-of-k1: Set clock-frequency of io clock
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OdN5GnPEc47os4gKIHrz/0HHFqGuQido+5HViesow6Gy6cVF20GSt2pV
	5uuXrAZLrEDrA8o48XnnGTWlujm4/+pZqLp80MA1Tuofirkn8Pb1p84inEghzSRT55y1M1a
	HaF18NYNtY9iDK/8MVUvYvKd6Meb9D8UcgpyWF8nYT3N4C5e2o3Lh+vzgAszSIt2kCyyIM6
	HT4BuqPkeul639/tmr3BDxNVPhf8jz/A6EPtaUwpYuvyRRl5Rko5CFPgLpzdHC0Mj4LPBQw
	4ahRsUU7gh83lC8x1E57OpyUxrY+daLEneq9R5MGo2IeNpgKG89qsbdA7g/3PI/njW51u+P
	StB2Q7GN+uEJE4st0XBJ/cCLdoJLmFqMDadNCjagE6W2IZ6rjo1amhuDDyl8le4x/+otfKb
	Iaf04oM2PYFMJJ0Xz88RBblQuavWdryKbXSpvlO5JaPPYwdBr5YRLuIDwdlJnLHGmK6EUms
	C4hKlHPDVS6YCFrBA6ACYu+MoIJlG/2SADGdXcsKe+IgODemX5ANxKfrngu6b6U8lYjHm9h
	fNlrbZkuAHmspFJ3osICTqAeMjdfQUlCWxTdg5ahCSp7AZ+rjCglU3etd74/CpfQ5GcjFei
	+GCuhBIlMl3hntLhCsUzlKhM8MEsazJWiDco2U5EHgdn5VLK0RLR89Ygm15ZtddpBnxNK0g
	+1bg5GGa379o0Pmeq9/nwYjbIzZiVrkZ2r542530+OVfNeflFpxS85E4YVt5UXqfHTC6fd5
	ivfrcY7ZgjzWEATGm+l2AABLMluEdFkPxBC2S6mbrMNLWgkvHkFIU7c2m96WSRT8WKdPA25
	SWkuwkxpnkzba9sLzR6cDsL3JO8dpXf9BpUfSxZlxLc0UmfFpoTGBnOXJNUyXvvAg6DsFli
	80XFHDBxdZhSU5jvEvzk6WqYeYJ4O4OHIaAhZUvfL+M8aF2XLMXIP6cgxAYEUmVOi6k9Xet
	sTfKlQOon5W3ABKlChTFgZbfn4bpI3oJTKX+26Huu1lfotgtlLBx7jhkAUODN3S/VnbWgh7
	nI5sh0OxFQFQHrFI/J4ufoQdruWpJXNar8UextvPonSYfiL84hzbjuRtrL4CLcmBUF8iitr
	kTPOTDJUaxyQEuNeHlL0C7YnCaTpw+uJJ4juUWzxIV8hCQNGDUIdVE=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Wed Sep 2, 2026 at 3:03 PM +08, Yixun Lan wrote:
> From: Long Wan <long.wan@linux.spacemit.com>
>
> Add a clock-frequency property to set the rate of io clock, for SDIO
> case, a clock frequency need to propagate down early.
>
> Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
