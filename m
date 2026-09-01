Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ECF43E484;
	Tue,  1 Sep 2026 15:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277193; cv=none; b=ggYYSxEmjPAZJFmBZE5afUZhlE+EZssXFJ1Re90Uan7X5TVMY1VO6mYSqiJZ1H2ej+rXMxIvqF4UNnKQ0ID2PLeP6OtEkZdQQ2/Mzqud0nqszhd/hedXk53ifAHqBBxfHp8qfVT2cmUiBeqSUUuabNWCEf1TwbX1jBn++MrXz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277193; c=relaxed/simple;
	bh=lrWmZL72GmvhugOO8uGv0mnxTxG6g5Zg0BQEkuwNBPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Oxktx1vRhW9tZXaR7YiNqY2yYZhjRJIBjX5RaK+3O4KVP0WTXN/DuNj2jC/hyQ8NzUaXhCgWvuVOGG+Cr4UCL8heAGRhnhSdkQ7YdIFaOsx60xH5gNNyAjdjuqKymMKq4KA8wrMQhk4o4Vl+obqmw4RGqpSMAEUKwJksLi0f914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhqy86fz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhqy86fz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914561F00A3F;
	Tue,  1 Sep 2026 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788277189;
	bh=Vkzm23XZb1nm7zaiPRh9JCxjCTM2MUDJBKmDJ0Mc5xo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bhqy86fzWfDYcMCVeGO5yhtcoE7oryg23Pz3D4hVNBuOWVZW0XPMeXid2E9gqEeAX
	 vp4mTiD0s5pFT1WlFw5x64WfYjMNeJIsN5rtYySvQtuG+Q77c3eBQpTKmqKGBsyhKv
	 IKbSyinH7z5YCvcervA/VxYqjsxEjQw9Rr3JafVbxN7bQkk4qXFwxdKd4ssHXbp9ue
	 4RqCwCFCnxg5EGmkl4UmevAscYbN2HbBLDVvyDqS/uXMT1HL79TiLMGs5uUdlltDBW
	 wjkdSbQknyE+Zw+gId5wDkTG4XENjkRxjlYeNQ5jaQOA4iBV+4p1CFYNoeh1P1vGrW
	 t+RmARIvDSysg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Optimize transfer
 overhead and implement runtime PM autosuspend
Message-Id: <178827718732.210805.10365332138527413363.b4-ty@b4>
Date: Tue, 01 Sep 2026 17:39:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 27 Jul 2026 11:34:43 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This patch series optimizes the Renesas RPC-IF driver by significantly
> reducing software overhead in both the direct memory-mapped (dirmap) and
> manual transfer paths, maximizing transaction throughput, and introducing
> runtime PM autosuspend to prevent aggressive power gating during
> consecutive flash operations.
> 
> [...]

Applied, thanks!

[1/6] memory: renesas-rpc-if: Mark XSPI_CDD1BUF0 as volatile
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3db1fb5e1bb4c9eefc554f985f6f3316fa1292e5
[2/6] memory: renesas-rpc-if: Move static bridge configurations out of dirmap hot paths
      https://git.kernel.org/krzk/linux-mem-ctrl/c/12e44bfc2a0e97f139c37b33925cd49d1621fa91
[3/6] memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in write path
      https://git.kernel.org/krzk/linux-mem-ctrl/c/008a7b9631864b708ffc06d42264aeef09f09800
[4/6] memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in read path
      https://git.kernel.org/krzk/linux-mem-ctrl/c/26883f764dd66d0c82f258a12a2f0f769e6fc68e
[5/6] memory: renesas-rpc-if: Consolidate command setup register programming
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0c49783b0ed5c3d27efb2d0d91a3272db154458d
[6/6] memory: renesas-rpc-if: Use runtime PM autosuspend after transfers
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c8d0e87bc2413c6a3f92c7130a4cbad51f8703da

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

