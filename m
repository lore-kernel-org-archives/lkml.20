Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9B439351;
	Tue, 29 Sep 2026 03:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651775; cv=none; b=e76K4pKh+nnkqstxRznuVrxGmo31wy+8cdR8AfF6EvjT4CP0QA5LVynFvwyf6zrqwI6Jl61UklW7DwZlLNnuttSTsRq4my1JEg8re47+pWbNzKgmwS36xlrc3ae7DaWqT5BvQCFFzexhYn52K96k09UqaTCt9jnraaExZT4Tu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651775; c=relaxed/simple;
	bh=BJc/YxdYCyotbfwriRpcpylvaPg1cMaBsyVlUZ8plfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/sedeoWyOzHgxbDqzchpJVFeb87WqhPkG70IGV53uH9kM1gL/6RS1iGw/wkAk85OuctAUPNxskycrESb3sgniUTx027hhipuPgIzUTe/1e3POYNjrGuqDSzh8MVG3AuYfkmdWlOZr3cW12u5Nv7kpXz/JM4I4hiAzwv/uZQCQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oowM13dg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oowM13dg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA2E1F00893;
	Tue, 29 Sep 2026 03:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651769;
	bh=gg3aBBfEcK/nyaczZkB5x4PV1iemV2YK7rLvy6L1j24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oowM13dgJs/rEtGQfx3gYJOIezEOZdK/hGdm1gv56QmyBkAkhloV6dPRlKDFWvNwe
	 UW8ru6kBc4BM/tnSGgS153uGmRZo1DgAFs5sQCI9oq/uPxYBLv7/f0VS4YpEgeyVKU
	 x8bTtZ6K5uSVgcku7kReKXhh7rRKltdBvDnS7qS9Ay5ufafMWJe9V9FbIgYHexcgWE
	 MtuvGZzb6bCZ/jLrQuLSJSGPrf4M5lBvdQfB83T1AmFKdmIpFxkkwpYSO8bGczRQuF
	 3Hwvb7HZvA8UkOB0/yqfjMQ6fJC3zYILKzLwVt7Fdv0x1S99B9g/GZJyRa2+0IOFbq
	 OZflU3g7pPbsA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Rework fan cooling map
Date: Mon, 28 Sep 2026 22:15:03 -0500
Message-ID: <179065170892.2673486.12612519104927393729.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803-fix-fan-monza-v2-1-c10af16c552c@oss.qualcomm.com>
References: <20260803-fix-fan-monza-v2-1-c10af16c552c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Aug 2026 13:55:57 +0200, Loic Poulain wrote:
> The fan thermal zone previously had a single "active" trip at 32C mapped
> to the fan over the full cooling range (<&fan 0 THERMAL_NO_LIMIT>). With
> the default step_wise governor this only ramps the fan one step per poll
> according to the thermal trend, so the fan speed tracked whether the
> temperature was rising or falling rather than the temperature itself.
> 
> A visible consequence is at boot/reboot: if the board comes up already
> hot but thermally stable (temperature above the trip but not rising),
> step_wise sees no upward trend and leaves the fan at a low or zero
> cooling state, so the fan stays slow despite the high temperature.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-arduino-monza: Rework fan cooling map
      commit: 4e7a6ce7925c463f9e888c87a1a40e68db8a32a9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
