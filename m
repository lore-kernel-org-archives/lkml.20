Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F104151DB07;
	Thu, 15 Oct 2026 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066600; cv=none; b=g9ssvFZYvc9mMzcpGYk4vqilgLXeN7IJeSVGECMoi8GX3VzkCSm3zTU60Z5AsAZRMLN6y/gerJXAr3D41JNQlbkItEFTFP3S94Sa4OL8iTsDd+QN1jUoasMfC//ukPc7n2DPoQ//ddBepHJAb6p2XOT+Rj77zx/VWJ2cwozdY8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066600; c=relaxed/simple;
	bh=MP3ZswWL8Rjqe/KOswBbHEgh/aSoM/h4yrWrDf5nxk8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VHzDrXSc9QD9uQ8ccbishmj4dTaI1CIABrxmuKdkY/0yYQGmUZgddnqHso1gtfXk63R3RPd6Sc5MIsJ2Pv/qI3VtB7ZWo4rYesPVXak7JzNfwhkmlkXApdloaNMv/Dypmj7JkWVaCJTWqK2OWbqK00onc/wqWOg+ADpf3YYFSAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYEueYnD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYEueYnD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB601F000C5;
	Thu, 15 Oct 2026 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066599;
	bh=jbogJRK9lKYO3KWUwQSuCWvgaZEe9SEYiPLvSGwBTkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CYEueYnDn6D3mbh2uShifZn0rou94XaX2mvumttB6eWbHyGJ+eFYJXjU/3RqbrVdJ
	 LX8AtjDq8o50dWWXiZJLymR6AeV8lO15FU2Ue8m0bbKpm0LyzHbYBmQFniGdGckCLS
	 oplTJHlYjVGOVEkLp4E7qNQYosERtmMbUwaf1750Jntm1Z8+1X0cRwpNwBR8uS/URI
	 5h77YRtizs2s8jeGanQ39ZYYtmsRP+QS5T9YVn3maEtP3kVBD1bb5DODXOkfqgQ7m0
	 3NaKmm01CfQNedGjlbiimr5rsSLbuEt/G/IzCfy0g16tgBIVJsZkM8U5MTxKkaSU1D
	 tIXi2Kr0mpA4w==
From: Lee Jones <lee@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Denys Romaniuk <chiffathefoxx@gmail.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260928-max77705-pass2-supported-v2-1-c04f3932c182@gmail.com>
References: <20260928-max77705-pass2-supported-v2-1-c04f3932c182@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: max77705: Mark PASS2 revision as
 supported
Message-Id: <179206659818.1909554.18308426252867074815.b4-ty@b4>
Date: Thu, 15 Oct 2026 13:16:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 28 Sep 2026 22:58:07 +0300, Denys Romaniuk wrote:
> The existing driver takes a safe approach and only probes on tested
> MAX77705 revisions. The only tested revision at the time was
> PASS3. PASS2 chips are present in the Samsung Galaxy S10/S10+/S10e
> devices.
> 
> Testing on the S10 and S10+ shows the driver operates correctly on
> PASS2: interrupts are registered and fire, bind and unbind release the
> I2C device cleanly, and the charger and fuel gauge report plausible
> values, charging the battery to the same voltage as the vendor kernel,
> haptic feedback works.
> 
> [...]

Applied, thanks!

[1/1] mfd: max77705: Mark PASS2 revision as supported
      commit: 42a947779e7d04f11c61abedb25799b1366a1b9d

--
Lee Jones [李琼斯]

