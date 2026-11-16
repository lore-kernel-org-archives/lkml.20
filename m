Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839499;
	b=LPzPfsr9kKf/v9WEo/eQU1Xn13a/LfRvH2xZWKtUTWD6TPdZmAnNep/h3fEcvI2oIyaa
	 xljVOZgWInkUOUA0deO7qC68WfH0vhlqy+SywyT4DJI4wcZAiMMliVRnaXy70M8Nlq+zx
	 Bwd1qmbhBgwH8lzPDwM6NBtRRQzkpSoDaJg3zKtRelj4wEwaeZM1GK5a12RvjWmKgILbe
	 sYRDT177ua0jgipWxZXGaZUs1TmBHrcid4xBwTkC60NGY8d6viLYjwIibRKlkJtltCmhv
	 1ZdI6CxFh5IfxSeL4jbreCurzJrrCpZ+1a9HvwiqHwfs8Qt17sg7Li82AcHwNYolL1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839499;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=T1O7v35TChmwhRKGhPjyiN2A1oz8HwzgsinjPccWIAc=;
	b=pV5hTj6EoF3h14EA3VHXlqztT5kU+1lbOkUVvAZCfkccy0+kD0+g9huESzpf02PEiLUC
	 Ky5JLGxhDkEUkAFPOwAxANRJp8HU50N9NrUWLoVcWrIPPkSJx2/Umrf6dtnqf40VKV1IP
	 PtY42HRFpl/jKHJQtsMlLPwC5yh9JK1hEGwEufLV5j8WSt61y1wc2txSemyPWrIqTqmOm
	 5nKrKhlcTP5rlMD41tbjYmXe18mH/gJjffl9icrBg+EBfCJzHwFNlwfD823Kc+4Z866PM
	 OnDup1aqlXCCGCJA6QZFc9wT27TODU2kkul+uvs7G4LJaZZW815mDt43LaPBHcHZdIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjA6Uila;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819E9606A334;
	Mon, 16 Nov 2026 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjA6Uila
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DC91F000C9;
	Mon, 16 Nov 2026 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839499;
	bh=T1O7v35TChmwhRKGhPjyiN2A1oz8HwzgsinjPccWIAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjA6UilaDIq+zLRAmGiCH/sMvtw92IAzOkASfl1b4GVdBwKL02nyMSHJxW0SZrsOg
	 FYCaBDgqP+wUUb/n3RtnveKV/PSjlvF/jaz9r5ML6Sl7IKd1r1diMyd8UhSKrJeTfM
	 LoULTqBYmazEPARSgxPzG4adhRHrD9w2bHXg11S684RkYgF8Kvxg5Y5nJNsx5JPydD
	 982kIq9USJQXJ26Qmbj8EXuuG/E8iqDULPrrHcKL7Oz/jwEq4HTKXO8P0JBokuqyHh
	 vdegczXTGpMRvWJ1/mQgWPdSAVDf2d8U+W1R8nVk9GQtFj/dg+NHkDxGIyX72voO8g
	 ZZFtlgJsYOsTA==
Date: Mon, 16 Nov 2026 08:31:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: Remove orphan mt6765-power.h include
Message-ID: <179483949592.1142978.1015321511255077149.robh@kernel.org>
References: <20261105143647.2727937-1-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105143647.2727937-1-robh@kernel.org>


On Thu, 05 Nov 2026 08:36:47 -0600, Rob Herring (Arm) wrote:
> Commit 22a77ae9bae2 ("dt-bindings: power: Convert mediatek,mt2701-scpsys
> to DT schema") dropped support for MT6765, but missed removing the
> include.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/power/mt6765-power.h | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 include/dt-bindings/power/mt6765-power.h
> 

Applied, thanks!

