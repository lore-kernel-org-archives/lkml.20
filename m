Received: from mta1.migadu.com (out-143.mta1.migadu.com [95.215.58.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85340B0E7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355580; cv=none; b=KLp6l/elOA0YZOem0nYGgGZPaEhZf66nAEuvVhj31TN/JO/2jLJRgepSb04YE2Bb4PuxKdhba0bNbm7ikm0+x8rWBxeFnwzgVtBim5Y9y3F3K2z476UG94Y6PG2Ka0Gzw4LqZ+4QDle3o68oJl9zhgEIVrpSX2TOiEqh537Hsnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355580; c=relaxed/simple;
	bh=kEx5juAaGMpPT9V4dZHafbCN0tHJgI/vgPamOMCAtmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVi3tQC1wXZinM15XCiiYeTeyA7vxEiIziJVZdFeq4CREFa3SaY76y9FFtdMivkBL7AodbS4JLATeyvS7wV1KKiFBptEYDFeIAWc+YHdA4BUfCFdHUffvIhEbuucYf+dUSv/Q21fEXSjflXlbDE0Yjj18A8eils5QwGuXyHNLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FM+hO15Z; arc=none smtp.client-ip=95.215.58.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FM+hO15Z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kEx5juAaGMpPT9V4dZHafbCN0tHJgI/vgPamOMCAtmE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355577; v=1; x=1791960377;
 b=FM+hO15Z/gTSjADhAx3IZDIOGO5pi1zLVJyRJV2DBVZr4AyG2v7qA6E6DR3xH3FjjBTjb77i
 gpI7LA/cqz5ikxYXLRIaiNDHxBA+/mNeLHWIbYhjrbt8fdeLZXp+4hAYAOjNRU6p595nh+00Rw9
 eVNpLsidUJzCXzgppV8V+bBE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 13f4a42033bafd8c;
	Wed, 07 Oct 2026 03:24:03 +0000
X-Mizu-Trace-ID: 13f4a42033bafd8c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba40832934so2850e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxXt3b2rMaAPj7p6dbbNIKzII1GoGtOdDrg5zcXVSiA5guIs6jvf/ZdDzLxTxHM48eU8wgWmMZ70fHaYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpaMRn1kW66Ubh1HX5zdsbPMLWTYivmoufb0QbTvsjup7hCYJf
	lC9Mvy+yhh/sVZ7glwcSFYRvchVIQJWDvGYb+yey4QijtU67uhhua171o6T4crvUHInxTKN1O3v
	qMrdm+ptHcx7GTnF3OVZPtCeDAQBMx0iMJapkWrml
X-Received: by 2002:a05:6512:6289:b0:5ba:3602:4343 with SMTP id
 2adb3069b0e04-5bcca678614mr260864e87.16.1791343437807; Tue, 06 Oct 2026
 20:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923180749.3906547-1-fuad.tabba@linux.dev>
In-Reply-To: <20260923180749.3906547-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:23:21 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwPsMqjBgfqAWHxwp1Ujpk7b_BCu_u8WcOekfczFXAMHQ@mail.gmail.com>
X-Gm-Features: AclHuK_rKcz2_xdGb_jpyCXvstLTuyZHAt_pcvOQTxgAvV4JtvZe-_kS7YT5K2Q
Message-ID: <CA+EHjTwPsMqjBgfqAWHxwp1Ujpk7b_BCu_u8WcOekfczFXAMHQ@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rcar-gen4: Fix device_node leak in rcar_gen4_pcie_host_msi_addr()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping on this fix.

Cheers,
/fuad
