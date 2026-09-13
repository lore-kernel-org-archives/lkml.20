Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A612348C7C;
	Sun, 13 Sep 2026 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290138; cv=none; b=ntIt/G1SNvTSrWzdUUS6IvIR8YoDTx5ZIWF4E9RttBwafKIfKYY4NtIHNz8umfPTJZ0CpYz5f8heW4HIlllUjOSQmEEdKYh3KdthE4UyuJNKQF72vT6AOo3qeaAYmLgafB1z7BT6kTg3AViwhSwHaGwEulBGs39UniwPr8YnHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290138; c=relaxed/simple;
	bh=nXv6ndA7zeGK+jZSLxvfpzCe+24JiYV5mTMN5XXMlmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFpY7n3io8QK6OK47MazQFOqsqPu7Q1Nbz1F6r7e+oJFlXQLNzX2Da5fO5KiYBFoBtyRj8O+QWkmMwG1JiAexsPrVrs0Ryi7GPIO7lmec+r91dZJPzxSYNkhkXSn+Xy6GdzVSzexZVWgZ3VuJxB8YgVbsVN/S4r9J4OrfWsXFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqGlnhW5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqGlnhW5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989E31F00893;
	Sun, 13 Sep 2026 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789290137;
	bh=+QgNccPks/y5EiUIaW30j5t0+tXeWFsnPvbGtZbENV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SqGlnhW5et2E74vIhmPM8wAsQ3mBbGzl12yVa0lpWYSM03XO26ERPdeYvcg4C6u51
	 DBzPjVne51Rj21eL3qrVxlGUSVakh9ozHXr2ndeW3jhglB5g/4QihRIlJc9zAf+Ioe
	 RynUuR9tn9INyJgpv4khUwMb+1IjaT9ZImnnJn5vmlUK2QFvuN+hyx3XxMgQwZKjOg
	 YQD1VyQmey39ZN3r3yGQGRr9eC/JQt2boly6YoAgai1OpGyGifuOmS3SLwgzPFr6KT
	 IWKwqnulOD99EgD1jbF4FO20ZJlDTUqF/5CbXuYi9A91zoKoPg8VJLzWjBTQ8aCutb
	 Nfw6IPfTUF8HQ==
Date: Sun, 13 Sep 2026 11:02:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Paul Sajna <sajattack@postmarketos.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] Revert "dt-bindings: display: panel: panel-simple: Add
 lg,sw49410 compatible"
Message-ID: <20260913-succinct-spiffy-chimera-32b06b@quoll>
References: <20260911-topic-lg_sw49410_revert-v1-1-c9385a9e1926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-topic-lg_sw49410_revert-v1-1-c9385a9e1926@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 09:36:48AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This patch had been applied before the review has concluded. The panel

"Commit foo bar had been applied..."

> needs more specific handling than the one provided by panel-simple and
> the intended compatible was supposed to contain both the display panel
> name and the driver IC model number.

You miss subject prefixes. It is "dt-bindings: dispaly: panel-simple:
Revert something".

> 
> Moreover, the other compatible that didn't make it in the end landed in
> the Qualcomm tree some time ago, instead of the one this revert
> removes, so it's not even used.
> 
> See the link for reference.
> 
> This reverts commit a74c2e55ab66519ffa2069ac9ae83cd937bff4c4.
> 
> Link: https://lore.kernel.org/all/20260614-judyln-panel-v3-2-07f4134441bd@postmarketos.org/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Paul, please resubmit your bindings patch with the proper compatible
> and let's get it merged.

lg,sw49410 is already used, so instead new binding should be posted
moving this one from panel-simple.  Revert does not solve anything -
changes one warning into other one.

Best regards,
Krzysztof

