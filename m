Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62684284B4F;
	Thu,  3 Sep 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430024; cv=none; b=WfidhdttoI4AjgId1qaFtcEpNgbpsZZEh4slyZXheowW70EtirjUHWU76gHsgBDqSfYvgirY5TMFGo1atPpkgw5aHVd6Z9Pbm/7f+fOht8KTRvOJU4WiZxA2C2BmEHlPhZWJUakJ1ZdgiBZbqyD8shr3j/7qJ+eaJQ1BHYVZNfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430024; c=relaxed/simple;
	bh=nfCzOlDS+3B0VW8zbgDzS8Q9UcgElT++HejU5agw3FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKr9W3hGjczKGJbOsg80dTDG2jJ7YOI8pgx9TJaCRcl5pO17LeErVeRjw74GY3Wrd73e0S8ektVhSHBICoOiORGUP0dnGtLqki4mh0SoYDlVwH0IlJu5btbhz8tVb/KI6DGIXYRb5Eg2OlckKZNoo1lTH23oFeb4GPoYnug+cKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 03 Sep 2026 19:06:52 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 65C3520914A3;
	Thu,  3 Sep 2026 19:06:52 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 3 Sep 2026 19:06:52 +0900
Received: from [10.212.247.149] (unknown [10.212.247.149])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 6510A10A004;
	Thu,  3 Sep 2026 19:06:51 +0900 (JST)
Message-ID: <a08151f3-3f3c-45ec-b21e-4bfab0eacee5@socionext.com>
Date: Thu, 3 Sep 2026 19:06:54 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Support AM62P silicon revision detection via
 uniphier-efuse
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260902222759.736124-1-jm@ti.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260902222759.736124-1-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Judith,

On 2026/09/03 7:27, Judith Mendez wrote:
> This series adds support for reading AM62P silicon revision from the
> efuse GP_SW register. The solution reuses the  existing uniphier-efuse
> driver by adding ti,am62p-efuse as a compatible string. The three patches
> update the devicetree binding to document the new compatible, configure
> the driver as mandatory builtin for K3 architectures, and extend the
> driver
> to support AM62P devices. The uniphier-efuse driver is simple enough to be
> reused for efuse register reads on the AM62P SoC.
> 
> Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and SR1.2
> silicon.
> 
> Changes since rfc:
> - rebase against next
> - update cover letter
> 
> Link to rfc:
> https://lore.kernel.org/all/20260812154442.3379851-1-jm@ti.com/
> 
> Judith Mendez (3):
>    dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
>    nvmem: uniphier-efuse: Enable for K3 SoCs
>    nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
> 
>   .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
>   drivers/nvmem/Kconfig                                         | 3 ++-
>   drivers/nvmem/uniphier-efuse.c                                | 1 +
>   3 files changed, 6 insertions(+), 2 deletions(-)
Looks good to me.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi
