Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD7239A4A4;
	Tue,  8 Sep 2026 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851617; cv=none; b=g05XsB8MirfIp2zaIPxyJ8E9EuCFfsjlUjxdcr2qohT3ZRkedAvB8tOaiHQFFfLZCjJrkNLgg0NZghxoRe1XSqjbc2nJsUg01ClV/tQcz8fqyLgSp1xGu9wHOlA+fN0QRBnFJWQho6xvhG+rAWqZZ3evUG3AJ9XzvXZDtRjRDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851617; c=relaxed/simple;
	bh=zYAMTrpmB79eDKEpuzAOGO0Qsb9ZWnKNvKjg0/EuCFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mon/DLkFpkmTQOL9eBy4W2Ol9IGTqB7QmKFZpkkFacqFKoKnxwWXmxUGHlRpP8lDWoAq74j0F/Gpqzmh1/ueIOXt1LFYlXA8oUvbgxV6/KFuL9bZLx9XoGn78vYyGzW3WQ3uGz1SfQ5Cw8/shefjuQ/XwEEaOKgce6VZZkYFUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ALH9SJ0j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ALH9SJ0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851614;
	bh=zYAMTrpmB79eDKEpuzAOGO0Qsb9ZWnKNvKjg0/EuCFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ALH9SJ0jinSKd4Ci3eZMQGHwITa7Cffz4IxB7Xl6YQmP9ylGvyGYlUH3bR7kXGlxc
	 eHihk9DqTZf1nEj1UzVQKsutYbI6R38u5UcVCWX4W7lz8iX5yhRJOnFc48YQhRhGOw
	 vIOwKGQ2n94FvW7QW/RMarCTBwYrRBHASSxxjpb9DlbKaQtBLnoGvEni2kin+9Icpo
	 7t77OVLJ5pdd+mihxyFwIG5oh5/eWr9hbqm0CptrPKPekHUWe61FdLn3vahPFciGOT
	 kv0roYmJdhoysTzvpZKPYPpSSaRf1mHXh7CRaQpup2HEdQwNNejog2D+xsirs0PM/m
	 zziChqWojwc+g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D473217E027D;
	Tue, 08 Sep 2026 09:13:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
References: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
Subject: Re: [PATCH 0/2] arm64: dts: mediatek: Fix pinfunc headers of two
 SoCs
Message-Id: <178885161378.9958.4593363688774333553.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 28 Aug 2026 15:52:45 +0200, Igor Belwon wrote:
> these pinfunc headers were including a header ('mt65xx.h') which is
> outside of the search path (it's in dt-bindings), thus causing a
> build failure (CI couldn't catch this since 6878/6893 don't have DTs
> merged in yet). Use the correct path, following other SoC pinfunc
> headers.
> 
> Best regards,
> Igor
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl header path
      commit: 9b9c33336d2c25b6ef8758af3ce3c1802d26ca25
[2/2] arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl header path
      commit: 863d48714194bfcdb917b2ec35531e40df40cb87

Cheers,
Angelo


