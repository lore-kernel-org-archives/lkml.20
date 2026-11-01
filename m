Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571410;
	b=0W0S+S/CyIrk3kCd/BKbbWURskfFyjHloGIl949SRCWO2EB/YgYafKTDZu+gkIIxPyp7
	 BwYbq7tAI+A1QbX4Vl253oIyGLNNzxeJ1uKFqIgbm5zbDX9AWTM5NBEJ+IOLyRF0zmalI
	 m6hBRjxpyCMfQ8RkiSJpPQsjt9SyGiTf4w40sHr4Wx/d05sY4CBE9V19DZg4qH7AhKfRg
	 EZqbnpr0VrXbPO3aVEBerJNxRVzJS9BD2aflvydXYX4AwQ7+GXVXIdbueLglpFm59z3xR
	 BKXLqiPmqFJZAHkf02n3rjI1PK4L9MC28AH7W7X+i4RWZfXeTbKgninR/fOKb+8Rp5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571410;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=qT2GUUvMsvsdxjeGOlN5O8jOvRC8RtpY6AMZ++u4SV4=;
	b=QE+kc7OM0yJdZOd3+u9HRKh09+j7sShrYThFVQjBmscmQO6mvXCKKzZ/mFK5/g2ndbdc
	 FHWVES26RkAFVzYpca564y0BCM+nF8HK8UiDx61NPul/k9OhjgcBU1EV1h2qJZlCxnUAa
	 IITb82hZipIiEArIg2+uszh2VBvOuyJ0mdCWEIdaAO5Ho3RisGE9Fb36KwD/cmImDPVn+
	 CdxPDqMVs+LmiWKDGtCs1OwtlawPUfjKH4i0flMpqNJGXKLgiD04mwFohjPuDaX2Rf68Q
	 gKE0SK+DGFkM7zG3d817SorW7pg0ilgBgdjkupKvCwXbF6U754WrS46m050SQpZnvXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/3BEpcj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD9607184F;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/3BEpcj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1C81F000C1;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571409;
	bh=qT2GUUvMsvsdxjeGOlN5O8jOvRC8RtpY6AMZ++u4SV4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=a/3BEpcjERRS1qf1ykCRoCBxX8UxmcohB0yzmRvJnU2+gY5IhSpHZmpTJX7wZsWZx
	 zNBg6DhehxxNhO40NOIsNPit4E75mWQMiEKi0py+NsH8Q7orlj2SbdYEJ7e8BuDQ2X
	 2cB642WkEvvWfUEs8DYYeb2CIQawi2EDq+2UOAlDTFqFxZgGAqiHvAYf4efzlAoYQm
	 3fHE42xKId9UvA1/Nb2UhG2VAg4/UPvGOYqLITZc7MqlWTAvP2xk87F35Zstthi/d5
	 7Eg4txIqXtU/k2xtW1/pP9mPw1G8TyDhFGzXJd7A4EtREYqtpO6+0+2eiTXeTre+WZ
	 GbhPPxXET+0Ag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401AD38003B8;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu
 and spacemit,k3-gpu
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357140787.2624073.18323938412420431030.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:47 +0000
References: 
 <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
In-Reply-To: 
 <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, alessio.belle@imgtec.com,
 luigi.santivetti@imgtec.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@kernel.org,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Rob Herring (Arm) <robh@kernel.org>:

On Thu, 15 Oct 2026 15:00:48 +0800 you wrote:
> Add compatible strings for the IMG GPUs in SpacemiT K1 and K3 SoCs:
> - K1: IMG BXE-2-32 (adds a dedicated entry for a single core
>   clock and power domain).
> - K3: IMG BXM-4-64 (shares the same configuration and entry as
>   the T-Head TH1520).
> 
> Both SoCs require a single power domain provided by the APMU driver
> (currently pending mainline):
> Link: https://lore.kernel.org/all/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
> 
> [...]

Here is the summary with links:
  - dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu and spacemit,k3-gpu
    https://git.kernel.org/riscv/c/16f30811a935

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


