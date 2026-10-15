Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45115304C9;
	Thu, 15 Oct 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077030; cv=none; b=Fl3Hw3kpIil47lr2lVkRj3+fcz+QvBQeaXuYB76dtzbhsRKL4lVBJgE+DjJlRLBzg6ilqOBuldJsA1r+o0bn5K/4o7eCTVl3NVTzafJ1/T1hLyenyXgrsVxiqDFMIzAmCo5xVkswjVkYHVAI4Ii99xnCoK8fMEWy1IXGGlGZVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077030; c=relaxed/simple;
	bh=qm8r7yGiAraDfTLx2VdY1amcGOfsJVu4zgu/olOb/4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDQjXl0SOn2Wi8FaAvg1CAAev9jXSoFXJI+aDl3v79yVx4fuWnzNl4Z0WRVRN+p5+EZ7EnIPCjB20orNeuuY6YOI/NEHAeS0gzY+zAPFTzeWr4NBuM45pCsdIniXhQJtvotP0WehCefCa1bIduB6+h7N56zQ+EapvlmuZ/pxHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0SiRam/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0SiRam/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC3A1F000C5;
	Thu, 15 Oct 2026 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792077029;
	bh=bjuxcVNkrpGx/wj0HdomDPX683PeD8aNSzaXEvZNzqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C0SiRam/v5sF8z2A7JVUrDJQeex3O3UCt8+Te1bdfLjW5z0az5Y7Aonu723Xb5Jzx
	 f2y/evPdcMvF6XSZ9OoXagy6JOyW2hx7VQYx+yEnMZeR4EWtKtwZ8DKeS1ZV306DCa
	 BLMGmH9YuSHKPxtxWESzgShD94o3yTCcM/K75SJK8F4gJ6uZvj10Qo85FVJOzfDfcI
	 Z754EzS0emuAdR1JWWppEp0BubbQdL/ux2YQqUw8y7JLzC/C2DgGZz+4je573kR8U/
	 a1arCEq+7kD5m/F547xVUXNS3tPP83MuG4/cgDcqkg9Gu3MdbyyuVyDrCL3CyieQ+5
	 PqzOHVMEYK5PQ==
Date: Thu, 15 Oct 2026 10:10:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: power: Convert mediatek,mt2701-scpsys to
 DT schema
Message-ID: <179207702584.621839.15589697887509592009.robh@kernel.org>
References: <20260928222552.1118609-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928222552.1118609-1-robh@kernel.org>


On Mon, 28 Sep 2026 17:25:51 -0500, Rob Herring (Arm) wrote:
> Convert the mediatek,mt2701-scpsys binding to DT schema. The mt6735 and
> mt6765 don't exist anywhere. The mt8183 is covered by
> mediatek,mt8195-scpsys.yaml schema. With those dropped, the clock-names
> are trimmed to drop mm-*, isp-*, cam-*, and venc_lt. The venc_lt and
> mfg_2d supplies are dropped as well.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Add per compatible clocks/clock-names constraints
> ---
>  .../power/mediatek,mt2701-scpsys.yaml         | 184 ++++++++++++++++++
>  .../bindings/soc/mediatek/scpsys.txt          |  79 --------
>  2 files changed, 184 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> 

Applied, thanks!

