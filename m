Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120024A9D78
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531062; cv=none; b=t1aH4QriV0ahPfUpGBoH5XC7OO8/WKwWyjN6f4XvjS7BP54MpqtORxLojIF9ykksqIxROy9BVn5Jpd0ILlXDNJ9vzdcLB+jUdvxSqJ93G+42SVGcB0NrCL19balrLKeDDBOq8qWwiA2ytfWpHrqlNtvyJpXXMQXEstlulCSTA4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531062; c=relaxed/simple;
	bh=h2GQNrd+Wb3X1gmoFScoZcZpHOMFIq6b7InsZTKzX5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jlMchaKWSdR8wopaCnyaZk3fNWrr13D3NUIji72eg+ez1tp2rd9Xja4VwEp1thE4AM8bEAt+vLwes1pNW+rJ39rtjd39TLyPCD00JLlaPK4jqS+Dkq1SZcvJU3Ilwm6WV8XIt45o+tDIvjIN6uk0XUfeB69FchDIC3DLyBz3GP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7LGBkmS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7LGBkmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723281F00A3D;
	Fri,  4 Sep 2026 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788531060;
	bh=hJn0G5rVw8+6TGKf9+xcvczb1UCts1VNVL61KiX+icA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e7LGBkmSkbFeu5w2Cm5mixCM8oPzig/LsBWXVQgKqF/86UCXvMaDvpwq6E+X42pWo
	 rfzLBxGELEDOu4oa7a++gmkR27ukJ63DasJ/0WQvdGQcgdFcKSSSHa1bAaajc1mh8B
	 oLgtv2dOKjdgV7EvBSRW9H++LcW4NMZz/fIEs0vxkTyfsiJmRxo31Ucg9UfjTqat8f
	 RG5/aXXNZ31Mf+Dpj5JuMk9/S5mOgnQF2kJYW84W6YWKnHZqt+8BOsUIqGhld0O3T0
	 ypAnLKLnTNJekOGnxRUjtleo+WPaK2OqYFrNvDMSTibrAlNkFpC8GOSm1A/Keyd1SZ
	 8tz90MzhsISZQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, Thomas Huth <thuth@redhat.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260821074412.144248-1-thuth@redhat.com>
References: <20260821074412.144248-1-thuth@redhat.com>
Subject: Re: [PATCH] memory: emif: Replace __ASSEMBLY__ with __ASSEMBLER__
 in non-uapi headers
Message-Id: <178853105875.35800.15616374950984177576.b4-ty@b4>
Date: Fri, 04 Sep 2026 16:10:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 21 Aug 2026 09:44:12 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> [...]

Applied, thanks!

[1/1] memory: emif: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8676f8e6dc8da769d5192135992a78853f9ea048

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

