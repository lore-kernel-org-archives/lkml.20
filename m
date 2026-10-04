Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B143BDA3
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791121521; cv=none; b=WNHrcjTN1Tda2xLbJoBEVXLGE5+/nmEaUJOYyK1SFWErYdQ6GrI5ywY83ZgncSPxg4rz5zY0rTulQf75HagtOdSIQlKK4zW9V5jf9JFd9Gcthl+S4x47ojFK9jBLuFIE1fIS5BIn2terepKXU/fO0Xv/1UHgCA8BliYVJPMpLDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791121521; c=relaxed/simple;
	bh=tMTb7Karh9S5Lq40UvzI8IWKL7MeHRjTsuMfdAYZVLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQaN89fEFM8bx7Huo6iTfjuaTlZ1mWIeXaqzj+9ivTgQJ8qhYM7ytdfAfIrYiX3yex2msyXZH5JeT4zwPZ8nTFJjU/iDn0YzQXeAoGdYvVCxkvnKyEcPbTuY77Gt7b7Ly+jwLMIJDNifH8msYPOovI6D9FVijgsHkGvewewxhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHhgjsSk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHhgjsSk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21251F000FF;
	Sun,  4 Oct 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791121520;
	bh=k/vAQUfV1EADDz4LiFjiP3OcoJ/N2nDTx8as6hP3BxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GHhgjsSk4yc2AUUSJIvjoqqsOB0F5ajlbn65/iukMchAREmGgoF9y8aIwLFkXw3YA
	 19BfCp4djDUGT6YrOHMfDdJXfKb1igcOqEpeOViu1Z4zOEmteBxUy5n5atoxr9VARQ
	 obhbGXSnwfW4byCTI4FWSrOd7R6ZkDmao6jGrD2BzyoAjgJKoIS9lsPYJOLdaYbQI5
	 YV4y2YndXVs4weCqzAVsXxrKP2sHPe2AEgPED/ZGjS+5IfR2OB8wd8hHr/JAwj+XsA
	 oGh9TAPZyOXXH3y4g3oVZhV0BRi8sZ77R+Wy12WlGsRSDiJ0fqa13GFOihCi2zppkB
	 Y5Bu6elxCv5eQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Date: Sun,  4 Oct 2026 14:45:13 +0100
Message-ID: <179110526060.2155747.11837902937011925576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 13:12:12 +0100, Fuad Tabba wrote:
> On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
> __init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
> which are RES0 there. The macro only checks that PMUVer is at least
> PMUv3p9, and 0b1111 passes.
> 
> Exclude 0b1111 before the compare, as __init_el2_debug does.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
      https://git.kernel.org/arm64/c/b52ef450139f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
