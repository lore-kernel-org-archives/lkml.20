Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033313783AD;
	Sat, 19 Sep 2026 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800251; cv=none; b=X4lMtm5/x56EWeUzSp+FcW9sYyAfpVNfKvBNRAu1FIVmbibk5/znCbI0phNuI+d33ivGIy0aAmfsOSbH24D3Cchq3o0VQrj6R/F4265VV2gAtpc4DyD4ABAM9ARv3U/HFh9xoAnm+62woy068H7kU+25EURZHbHmY7Xfn0myv6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800251; c=relaxed/simple;
	bh=p/C+J7yhGDKYFq0d7s2pnF2W1nXTpozgrFZwDiWq4Io=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=giBvW7jTISRHOX3OKTrM7u4GB1WerYH6UD0ErSjfhFYucXTuJXviz4I3KnVE/FnoHdx8VzPceHdR9K4E6Z6x9yn+XWq8dT1adXT4MvdbNHYAjCptb4zltxMr701CN6muI632sKb+jFNVuWvMzGAyGAn6T+3rIn7boVkF0vy0yn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFKLIB+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFKLIB+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B7E1F00898;
	Sat, 19 Sep 2026 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800249;
	bh=7Yw21yZ8D/9ecQCkrAtDEhtb41K+5SSxoiOSXowuv4g=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=gFKLIB+irqMjLjlmfa8rzqJxJssGG1LQ9ighYsOpL57ot8FVVd5KKoqyjVT17DNXY
	 VtYfIKDz46SwvLEjZf2FSmeKEJxpPR0XqdwHKRA5StkovQm9q1VidEdyNgy6Vu1vgd
	 aXpzb/nbBQstiyiHdGnVmo3mcXyxLNw2V23RQy12St9FmIFAGTeU6vTgRfaKuqSo4j
	 GfJT25MAvbUDillf+YxCS9GXGdsN8UwNzHFNhPSSZU8JOVKWN+CMyY6Du3RY3tUvsI
	 jMbXRq7euyt5b0SDUTu+b/BxVOj/fam7i8wTovCPdncs3W5kopl4+pznri+10+sxkx
	 kGwrE3dtbmBeA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: vexpress-v2p-ca5s: Replace spaces
 indentation with tabs
Message-Id: <178980024687.89886.10945292395712232240.b4-ty@b4>
Date: Sat, 19 Sep 2026 08:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sat, 29 Aug 2026 21:41:22 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/cbdbed966ca04daa3ce50a629711660bd451ee2e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

