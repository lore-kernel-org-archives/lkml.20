Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE931B130;
	Wed, 16 Sep 2026 19:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588638; cv=none; b=Is3TUhnC/VDpuj9fEUZpAL6jBt31YLMQMNLYY3fwZLXwvjgnb97Y6xIer0LGqJ4C/7lEaAyoa5AM8q/Hqg4ptZec2bjAbMGUDo8hRL7AK9un7A0oKhavky3wQM1wrZ96cvdOlf2YZVBeyjSNUU61y2MAmMo2cm0AAu2DTH+9R1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588638; c=relaxed/simple;
	bh=mtuXYiEl7jQvFAplUH6eG/P7WXrWkrNgtwK6E2LZQa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkCmszPqwFf8ym0w98Z91DMUbq2GMUbLQkZh9nnGcd3ZiEim5UTkftLjPILEj/D3Wu86RY2J2huxdm67UVmW1oCDB8Z2YWuPhl2P2PmZ0ZWqy3Qj7/TrF0A6ndtV02Di2KPy4l9jHJT1Qrspfzihh3xOi+zH0nCa43VcxNQif4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fa61XX/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fa61XX/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A31D1F000FF;
	Wed, 16 Sep 2026 19:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789588624;
	bh=y4NSJ3muM9pW+APDoR/7C/7ePJDKryD+BOMDYLBwb4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fa61XX/f3c2DcH30+gynVEqUEVSnwf3P6jqIIoMSvx+Uy1h1IImPwq0sl/B6OLnZf
	 evrY8T+lEwpPu75+9Ec4gTQNr2Jt3phEJ4MuEBO2qSUG/e3d9elcwmjNDu0A1ecrCh
	 Eq+PSbS0NrCqmbzhsYQGtxblrksT+EAPuanDfgNl2G0/1rGxYcvmIv9Fnu6IhmrFTn
	 dZI997GNCz0t3oJdP8CPTK5oClFYCBMWokw4PsiY16f6mhQMJvq2pURLZzA4DhNcGq
	 79kgudedDVY5i6Ja2mc5XJZ/eX6kC3A1zQWgKzJbbbSiOtOVqazlNOEktKxcl03cgZ
	 qeOvkV/9npfIw==
Date: Wed, 16 Sep 2026 14:57:03 -0500
From: Rob Herring <robh@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Fix CoreSight CTI Kconfig symbol
Message-ID: <20260916195703.GA1353861-robh@kernel.org>
References: <20260822081912.88774-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822081912.88774-1-kmehltretter@gmail.com>

On Sat, Aug 22, 2026 at 10:19:12AM +0200, Karl Mehltretter wrote:
> The option exposing CoreSight CTI integration registers is
> CONFIG_CORESIGHT_CTI_INTEGRATION_REGS, not
> CONFIG_CORESIGHT_CTI_INTEGRATION_TEST.

DT bindings should not be referring to kernel kconfig symbols (or 
anything else in the kernel) in the first place.

Rob
