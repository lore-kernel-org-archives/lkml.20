Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C53D9020;
	Tue, 29 Sep 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721583; cv=none; b=ZRO3kWyjJRMDEug50fnNVYc1XKqftk7ueyPV+/iUug1mS7pVtolFHv26dd5pPA4nutVdb87nScAbY2gnkvaImUTXDChjde4xoogSx7NcZWU/4njgw5glxm1EO7JYs3elsUtGAdYg1/SRcLls6cX40vItkU1g+Z+fGsJlE0SYo2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721583; c=relaxed/simple;
	bh=xyLRHi505v2pwIciUzJOO79KL+Hvd5T2X59MmY3SfGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IApf3nlRWUiLH0mQTf03BpFah4rTkhSFQu5uTWkYBbU6+W1zOZ9tl4mvyAq1/H0DfLauTB4d0xyJB8QaOGEjhZUMa4EM+o8ubMo8C8h87qhXVOPufNLLUOalupCJo/XIeS1ESdPsZeiYkVBaZAghvWfEcTL0zdUNkRFVJkfSGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjDXrUz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjDXrUz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723381F000FF;
	Tue, 29 Sep 2026 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790721581;
	bh=mFtGGCLVV5rmv+Xh2UYKAbY9gvj9cxkqM2U8a49A7Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NjDXrUz+ThTSNc1oh9hWIDJ96fDUWXY8RGjqUOdMQAXf7a4aUwkz3lro9Khz9cgip
	 tWd5txGT2XmH4QgyboWgW+//Ur/RvS02deKzWgEi/jJriepGgNnYsAXtVXHyWLC82+
	 AhFXoPlCtp0zZtajUYZenccXut8Il5lgpbTFKV0yq6exjVb59yxhJALdR/ohGaMwIO
	 qoXK5EVR9HRFbkqmzWU2c9AOJaYnjTOLVofJpBcydR5qSXe3iariOxYaI3fTBZcHSJ
	 vc5nD3+O580iVkFYIEIgFCpMgV995vEumIBKnP1ryynNKqDIOuOJ/6Wp5fITtDBzvy
	 exwFK/5XzBkmw==
Date: Tue, 29 Sep 2026 15:39:40 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
Message-ID: <arw-LGxaHEYnBeCH@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-4-effdd14a76e8@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-4-effdd14a76e8@iscas.ac.cn>

On Tue, Sep 29, 2026 at 06:22:48PM +0800, Han Gao wrote:
> Enable the DC8200 display controller and DW-HDMI transmitter. Connect
> the transmitter to the board Type-A HDMI connector with reciprocal graph
> endpoints.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>
