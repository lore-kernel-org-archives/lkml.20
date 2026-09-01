Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6511E411661;
	Tue,  1 Sep 2026 02:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228592; cv=none; b=VeHP06vtebq/OrDLfYVwU7cZMZB0at5c9MNt037kS90VSY9VUxNvU+xjBAG1hspZlsJ4taTyhbpxqExtAnSp8MpDEJb9f5vTM/UL9Buc/1qmiGCJNw38MtLTQH6LknM91VDRohUwnq2cr2GH31pWhn//IY3KqwgvLNr9aNSw9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228592; c=relaxed/simple;
	bh=WsDrjGT4cG1a6t5f5KrqRW4LXNt3VqPAt1EZOGCeCGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYEmbFPjXpIh6eXRElC0qHRl9FSvz0/sdN9U9/exG6Af9TMvE1E0X2NOLibOwxRosRXVccogQVBmolOKa77Tb6oHXjuchklZf2dI4/h5rg4pj7ubYbofkEJcy3KEn7ANwzSF8jEio/78M0E+iBLIjRKrJMIn39LYmg9Ucqr0mcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+G9R0Qx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+G9R0Qx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2E61F00A3D;
	Tue,  1 Sep 2026 02:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228582;
	bh=h/pInpbdC57iv3v+TZYzCPsHAvjHz93T6GB5y4GdRig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V+G9R0Qx+Pqd2ZUx79MgGl78clGcN94PFw3Iju3PNhFwsTsOLAsMJHOtLHgjbLGhC
	 fXe/QH7qF0yMW3NEvSpHJuWOTdWGGslDRBlvREYB2uPrsvTGr96qDt8j9xI/szY3Ki
	 ld8h/b55Hnug2jOUVtxkaAAXf9CuxJGtLZPdZUhSJ0RHE2Aa9PRZWAJmq5M6eM+/Yx
	 bdLBND8AcMZjN/dzkBhIScdPF4Tv7eBlY+aVFMdQwJ9E8EFMcxDY93D2CR2MvifUP4
	 YSzVZy8dWrx7Z4WZb4fs7W3tVu/qvMgRRKm+d/VCF43kDWjwaQ+2WjNFulpYVLxuX5
	 k3Wj7TtT+Q84g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add audio playback over DisplayPort
Date: Mon, 31 Aug 2026 21:09:19 -0500
Message-ID: <178822856234.1835959.5281479761335285842.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-surface-pro-11-dp-audio-v1-1-fb9c0d3216b7@gmail.com>
References: <20260831-surface-pro-11-dp-audio-v1-1-fb9c0d3216b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 19:20:48 +0100, Dale Whinham wrote:
> Add the DAI links needed to enable audio playback over the two
> USB/DisplayPort outputs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1-denali: Add audio playback over DisplayPort
      commit: 420a70ddaf299dadab1fb50492b275c8b54e9c4a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
