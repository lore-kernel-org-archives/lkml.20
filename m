Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48673247291;
	Tue,  1 Sep 2026 04:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788235778; cv=none; b=kaw/04wh6nnlx97SSU6oAamBn3dFBEJTOYWB+oJ+wFFWIwH8jPntRbwjR47VuN12VGG00ktpSMCUJ19Z8IP7DsIjsVQWANicxBr/lu+cafhz+0IXKWhGwYPI6QlB/4C/PhyAj1gYK5aQX26MREgQc0mHagXdhGLmFUP4gUcmIck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788235778; c=relaxed/simple;
	bh=57Vs4+Y0gimbBGxNnnZGl0I0B1uD2oX9HuIyRrJdO5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E48X5SC6jYHLEoYYLq7bshjmllpU8LwBmppZhOWUiqjus0bJjOQLT/plq2PJUsAbquumGwQ5NaANJHJ2Ajfg5JS9oqn/wiRBTStKnl+awJ1f/GZbuRlcb/iaPdTr8tgH0vMWiU/cQof3vUjR9xiDV85IZCg6an61vGctDyZaP44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 01 Sep 2026 13:08:26 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 0D0CA2068E57;
	Tue,  1 Sep 2026 13:08:26 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 1 Sep 2026 13:08:26 +0900
Received: from [10.212.247.149] (unknown [10.212.247.149])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 7469E10A006;
	Tue,  1 Sep 2026 13:08:25 +0900 (JST)
Message-ID: <5b147a60-4d4d-4048-ab52-b5d956b68881@socionext.com>
Date: Tue, 1 Sep 2026 13:08:29 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Support AM62P silicon revision detection via
 uniphier-efuse
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260812154442.3379851-1-jm@ti.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260812154442.3379851-1-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Judith,

Sorry for late.

On 2026/08/13 0:44, Judith Mendez wrote:
> This series adds support for reading AM62P silicon revision from the
> efuse GP_SW register. The solution reuses the  existing uniphier-efuse
> driver by adding ti,am62p-efuse as a compatible string. The three patches
> update the devicetree binding to document the new compatible, configure
> the driver as mandatory builtin for K3 architectures, and extend the
> driver
> to support AM62P devices. The uniphier-efuse driver is simple enough to be
> reused for efuse register reads on the AM62P SoC.

Reusing the uniphier-efuse driver seems reasonable to me.

The driver is already fairly generic, and contains no arch-specific elements
that would justify introducing a dedicated driver at this point.

> Feedback is welcome on whether reusing the uniphier-efuse driver is the
> preferred solution or if a dedicated AM62P efuse driver would be more
> appropriate.
> 
> Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and SR1.2
> silicon.

Provided the functionality has been validated on the target hardware,
I would prefer to reuse the driver rather than write another similar driver.

Thank you,

---
Best Regards
Kunihiko Hayashi
