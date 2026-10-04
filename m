Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EE3F1066;
	Sun,  4 Oct 2026 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791152349; cv=none; b=YA+G6zfnWLkbP92ima7mONDnJZYiWQXxqWZjyPF12uTsA5Khi/MAmgHfqfw4QBiv/AXiVaByyMjqovEfm/b9NshT6uH99BoG6du7Tnpcye42+THkTHLaWqvLYcaDP8ugsHaT8WhVt1dzPcLEgYHsA2zhnDavtzG2qHcLBIYCoNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791152349; c=relaxed/simple;
	bh=RxNcKAB8SvMkqnVPpgj0k88smJb9Gh96uC74XZfwj9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=axmGnxiAHdJyzdeVYgnmQBXFoStkY75WKh1To6/O3bnXmBL5Et6Lh2bDGxgKDG9m2oVfc4KBoozOZdxt7DPZubV1eCvelvted8bYs65vItBN8EX9Zi2QaSzh7P3vrY42Ta0UsBCXCr1LX1nwt+P+u6QXQt7mR57FBM/+C0xwxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDm1e+CH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDm1e+CH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9121F000FF;
	Sun,  4 Oct 2026 22:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791152347;
	bh=PNlHckDVB3UJnF38286FOTpbN1b0G4Fb+9LoeBWWWhs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IDm1e+CHNEXwbh85NPbU3/qnXBhRjzF0RZIkzKYBLMmchnyg0t7Uz3OnHmT82aeH6
	 BA2SniiHk5k40gdgoqX1+ylXVTysM9t4lnj0tZh/dhDHz1HlUpP/gtHN3LFzrXZrcA
	 BNuZv7SPl2ZjVekJvkX5Vqsb5exDr/VuURjTdLw3xhvAT59wZii/+m9mQQ6gRHUlcp
	 h1jdXrg070kROCef8itfyUQo2aeN+TAE1enqcyaFUII0x9Z3Qu4+Pb1mgpieQyD7BN
	 VsR+AaPoBmf0VK7s83hRQ2dVxY2lLVxCmLMnrir+BcARV/0TkTYGRwqUO91dNbWyUG
	 xH+i/TmBzUtGA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002171455.2719968-1-robh@kernel.org>
References: <20261002171455.2719968-1-robh@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Drop obsolete MAX8925 .txt
 binding
Message-Id: <179113138499.150114.17978379373123195435.b4-ty@b4>
Date: Sun, 04 Oct 2026 18:29:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RxNcKAB8SvMkqnVPpgj0k88smJb9Gh96uC74XZfwj9Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqwtDTbhRGX2Vf2VQ3WmxZ4F0znpik24196c4Tc
 pC9qMaH3EqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasLQ0wAKCRAk1otyXVSH
 0EOrB/wIVQJ8cksB7F3nLU2bftk/en3VnUbX4qqaXvfpyhu/0fC5H8dw2WB1e4gBjSbYs3IwNv8
 5rBrxJQgcEGXluwpP47UAJOWdwsjKkecOr6Yc2Ir1P+zA6V2tHHrpNYWVl917hSy9N0AOcdIkFI
 PTSf4EHAaKIjGPxpu4ATSF6tevRK/laNKCCPhFEfBwJr6LuYjzUTwtS/cG8C4xqIGnoOiap5QuD
 Kb/xkD0u5k4wYuRSKBlP1+z77IxE4NyYOwVkRO40KQNJzzsPdAK3pKR50REFW46e+GYHntW60xN
 0dr9FTV/YkUDYOAW/kltiEFvrypjRc21VMqENGNcuwN4dQCx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 12:14:54 -0500, Rob Herring (Arm) wrote:
> regulator: dt-bindings: Drop obsolete MAX8925 .txt binding

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: dt-bindings: Drop obsolete MAX8925 .txt binding
      https://git.kernel.org/broonie/regulator/c/77a89ad04892

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

