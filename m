Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A82848BE;
	Tue, 29 Sep 2026 22:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721125; cv=none; b=kEajjO5iCZS/Wl6taYpaiyCSzXXUtpDMtpCRnxQ1f1hIdf3foYE7jVRIp6zXlLZdKOTE8HPW7KYf3osiYoL5Dea4DIylHDlxgpz7sV1H+iTPtYYoVN8syppSFrLdMVW4CCHSuPKOmiJy8v93dvCluURGTPvWml2xrUOzN8UmRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721125; c=relaxed/simple;
	bh=xOPv9oW62dw2XhOZas9+iFh6fKANXnXE63dJ9SjmCro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXLYxtUHwH5tGUHPWlP9q9cSN/7AmdqZxT/B5Nkzn2x8Ovo88yr5wxKjcPjQQ77mALnF3qlKNwKWYJC88UE42HZ3LI5pXCu0Ft193gLV5p7YuSrwzm4kf1VkwP0XS4e8N4DDe9S44nA/jeJkbOjNxc5kavIMB2v098q9h5z0DPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4kEz2tL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4kEz2tL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE67F1F000FF;
	Tue, 29 Sep 2026 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790721124;
	bh=I/bcaEhgzy8e0pCQC+W8nr2IsiEI3TWrwkfuxgDwJMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F4kEz2tL1xOIKRb8jVYGqmJR36e6uSsK7t1tz0FlMLlS8gQQJHzEQIdNP3dSG76wg
	 gw8fQa092r1x74CGmtqfvqnXNzxaq/t3U7AtZhN1ARJCkTcLkncKyZpzB79uXfLcJH
	 m6id/fhxlDA3pLkNAaAv/ow6d5izHL4mNiu/QXHUnay120ps+SGgjgVVUNEXUuHXzg
	 EztHMtkJv1BU+lZfqmUdA0yVUk5Q0VEgyU/kVIveAdVm6nqPpCbgnpySU/AuQCxeE4
	 qECwgoTqlKdvotyeYvTiJhuUkJfskZFdSviljSigbb1kgrMMkEm73XAWY+ctpxP8MC
	 imVMBO+8r57AA==
Date: Tue, 29 Sep 2026 15:32:02 -0700
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
Subject: Re: [PATCH 2/4] riscv: dts: thead: add Milk-V Meles
Message-ID: <arw8Ymd-vks6oxi2@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-2-effdd14a76e8@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-2-effdd14a76e8@iscas.ac.cn>

On Tue, Sep 29, 2026 at 06:22:46PM +0800, Han Gao wrote:
> Add the Milk-V Meles board with UART0, eMMC, SD, Ethernet and the PWM2
> fan. Describe the board pin assignments and the PHY on the GMAC0 MDIO
> bus. Give GPIO banks aliases and name the exposed 40-pin header lines.
> 
> The eMMC I/O supply is fixed at 1.8 V. Enable DDR52 at that voltage and
> retain the 52 MHz board limit. Describe 8 GiB as the default memory
> size; firmware updates it to match the detected RAM capacity.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/Makefile               |   1 +
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 227 +++++++++++++++++++++++
>  2 files changed, 228 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>
