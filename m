Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9426E33C198;
	Mon, 14 Sep 2026 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422743; cv=none; b=rI18ZU0GjhPCzec6i9FvTm5A3T7e4wjyEVt9Dw5jfVv0SL1oWlhxwrh2VF8NBskRHqArkHilFFonLHClAmxQ67+uH4BgriPfb6Ua2JSA/pOpWsjejJC5m9Bf5Jqk0M71Ig/cFu1dlPXXGapTgERMcX5j65w5MGvYJa2qOL+FNbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422743; c=relaxed/simple;
	bh=34WPh/3CCGvp3nPFV0fVfqQXxFd9cXZbTeY/heNUnMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sgvw51Evu2VZ4fwt7B9wpetyjC0De2un4DxpekoHiDLqdSplma1ekQ6A+9E+Aw48QwBhQ5coP+Lu6nqCKg2NinK+X2mnsnMHsVAQyayK76qA2mT/RHU+vMJ3fckTTfIE/fRg+b9P3vFuePHxk3nrTNfSYV+pFAFsLYmeGpB4sFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LC/NrdwZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LC/NrdwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D88F1F000FF;
	Mon, 14 Sep 2026 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789422742;
	bh=l35PSRApsaTGs+mJ1KLuOuYsuZ+qz+hDK5/Ju9T4UMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LC/NrdwZNGK+ASmYkJR2z60jZ7Owx89/VUiiZt45znb3bTs4aHAawUWaTW7N20eqR
	 G5Ee2xcJlPR5N++ZOs4KchoQGKFqQ300fnDp2lVdfHbX6aj5GIcXjVvljNRbpHSxCm
	 tlYIfcWn+1USATM0xT8r+Z8+hiIl9SvkOWTpU6h/O85luo36C6eE5eg8cY0Tg/yTX1
	 JVdPEEqTOA3OCy0DRt423oNM4+J8tCZ4/JOW+rdFEgHSRuTyJxVs+9Ob/Jp39BfQ5r
	 xxXwCo2VjpvpHfLXEKrU6zV3JDtR701+E/lEHFrMzlJWil/L8TQYX/Kil5nO9mfl9E
	 so3OaeKRZzuqQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Judith Mendez <jm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910155509.1425682-1-jm@ti.com>
References: <20260910155509.1425682-1-jm@ti.com>
Subject: Re: (subset) [PATCH v3 0/3] Support AM62P silicon revision
 detection via uniphier-efuse
Message-Id: <178942274041.683176.599438200260103620.b4-ty@kernel.org>
Date: Mon, 14 Sep 2026 22:52:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 10:55:06 -0500, Judith Mendez wrote:
> This series adds support for reading AM62P silicon revision from the
> efuse GP_SW register. The solution reuses the  existing uniphier-efuse
> driver by adding ti,am62p-efuse as a compatible string. The three patches
> update the devicetree binding to document the new compatible, configure
> the driver as mandatory builtin for K3 architectures, and extend the driver
> to support AM62P devices. The uniphier-efuse driver is simple enough to be
> reused for efuse register reads on the AM62P SoC.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
      commit: c66d971968218d7f746e85701d4c226746654690
[2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
      commit: 0bf05ce85c82783c103a3beb28fa6607dae8ea79

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

