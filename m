Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AFD1C5499;
	Thu, 24 Sep 2026 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254585; cv=none; b=L1qOsfVgnSZAiuEj3UDbiBsuyY16GIktkopfdGdLrtnyLvZLsNTXO3JaG8IG9Rd7dHO0LuTE6Jl/maDAvfrmHgxm7WOGi1+NEVt6Ea/5yjA7TlryjJxRK4P6IChUVp3xhw4GaCa9LPOVNZ3MKM6vHvIFiAMit1PvY76IUR5wnJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254585; c=relaxed/simple;
	bh=O75wbtyg05DxKLL8eA2veA23+UtQ+VhJQZPoDXI3q+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxQpZJMaypkWiQZq1iAWV6m/AMM3t6x+KhdOGOBDMAc7WANPu43PoQeSfqLmKmibEjftEVt99iWeKXrRTuEVoMIUTfa6jGfhOJEWMzSsa6PvkebTVqOES/Tzpk8ns56KS1HjtfHB9/ogW/4OJbaJSp62xXrjqFfzUo/GyZ5Vt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I88jW1rS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I88jW1rS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A04D1F000FF;
	Thu, 24 Sep 2026 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790254583;
	bh=7+tkMPSWDlHQYFcrU2RO/g7XreK+HAtQ9qaL8xnkmGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I88jW1rSOoynMhq//Z5Drjd1alHjadA5ziFptEv0Lj4KevC1wmaET4oi+8g1CFK+I
	 Obziu571unpEOOQ1ukGNPpmF4duafx2CZ3Eg4OYGu29+l6OAdh4FCPjqy4qpRWflIv
	 jwkmk9AcY2lKU4XpSNYsjSG3uG9zXmuBNNhisyJ2A5aGRpEagAkjcwccuK39BPafNm
	 CHuZGkFdlKrGRV/fpNuWSME7a8hM9dPTBrjHCQ2/9va0FlqCMBAyOrfDJmlWedLXZT
	 S7bY8tPZzkuLb/kxtChyCuDySlqZcSHKQZw71ZIb8lXd2VejFQHSprugduyvgiVva0
	 UIGzmQne1wQFQ==
Date: Thu, 24 Sep 2026 14:56:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: amlogic: Reordering
 compatible of clk-measure
Message-ID: <20260924-truthful-likable-myna-c9ebac@quoll>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
 <20260920-more-socs-to-support-clk_measure-v2-1-224382a429e8@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-1-224382a429e8@amlogic.com>

On Sun, Sep 20, 2026 at 06:25:03PM +0800, Chuan Liu wrote:
> Sort the compatible properties defined by clk-measure in alphabetical
> order.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml     | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

