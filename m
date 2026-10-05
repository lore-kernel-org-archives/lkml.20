Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3690C3E0C4A;
	Mon,  5 Oct 2026 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237272; cv=none; b=JJVvUYLWrSfduT//BHYZKDaHP7SviZYyuORZpKx2B4sdmsRsgPfV+lW+L346qGKKSuyn9XrQf3XLh81qtA8gUC2hk7046yxdywfjN4wUiaYPAI0Km/t1iga5fUHIKkirqSx+tzNaf5zmIwDDVCU4a5WFJ9W6cbgeiDo9qskjowI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237272; c=relaxed/simple;
	bh=0GoCDQxk+MK/a/Y0Cm/d/dW90szQsP1QF0JC95gXcU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t+nOIbUJNFdUxmbY2Dqjm0m3Uo5ng0jz5PYIu3lgP9ikxb8elRiTkmzCanoxfLV/b3bpQWOxCqeh0Is+koKdW2G7+GWr2k2lay3YGEiFvUnrGOsrw3tKdBmabYROZ09STwJ2xmDH9553vSCwQ37wQbThirYY6SGPBlx0kKK37jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISVZ0fMQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISVZ0fMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2A81F00893;
	Mon,  5 Oct 2026 21:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791237271;
	bh=KWApHxVAycrmj9U4cHRketIuFvl3SRCgeaBmnuVaOMM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ISVZ0fMQqwu28M13Kg5taiF5LoBT9WqHlagxrbLdj2WfeAp0CvhlBesVncVaADjA8
	 ZaTgICt8QR6QCvZgstzgzioAVjW4NcachkBCpAMtqA3jZGgpRuyH2vY+pubYnlMG0F
	 zwoHGd2TMK7JutXs/QjSSTlQ/T7kmwyoURfwzAwpeU/UD+DTNqU0o0PSZsmrDLnyoq
	 eY5hAnNyLri8mE93Vx+plEbxAizP17WrVY3ssAqfzeZTdK2dNWdSMC3kMaGn0QC+Bo
	 rf38wzNqlXIPLz8/cR/QshlveR8WwRSrrrzU/BJwI9HdNHRCyIWrDJU3nSM/+gon+J
	 zXjsmLzH6JEeg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
Subject: Re: (subset) [PATCH v3 0/7] arm64: allwinner: h616: Support Video
 Engine
Message-Id: <179123726826.376978.5395078957108502245.b4-ty@kernel.org>
Date: Tue, 06 Oct 2026 05:54:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 12 Jul 2026 11:00:03 +0800, Chen-Yu Tsai wrote:
> This is v3 of my Allwinner H616 Cedrus series. The series is ready to be
> merged.
> 
> Changes since v2:
> - Dropped "drivers:" from cedrus driver patch subject
> 
> Changes since v1:
> - Fixed IOMMU ports on H616 (patch 7)
> - Updated comment about VP9 on H616
> 
> [...]

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
      https://git.kernel.org/sunxi/linux/c/d7287d940f3c
[6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
      https://git.kernel.org/sunxi/linux/c/965a49fc413d
[7/7] arm64: dts: allwinner: sun50i-h616: Add video engine
      https://git.kernel.org/sunxi/linux/c/eabc3c090e81

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

