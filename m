Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8143E55C1D0;
	Tue,  8 Sep 2026 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875934; cv=none; b=CoaWQinAsDSfu7lvUVikgoFdAEnbzZAidZlUsdrLQuxt/W+8pHk2k2xtelQ/talUmYiOCJAqfxvd12bBkLFzO51MnYHH74Yon9alpC8tXEqlOsoKN1Kei4ZLZXrWgiBgVSSTvOH9MkA7axbBOkQBSBjux+My7OTzo62ubj+DqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875934; c=relaxed/simple;
	bh=Wu4wDdKNW+kp+CivPHhEcRt18ON3+W/0d9KGmFL6px4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lRZyxzhrbkStvKcwV7/0cuxyE/UIOreY8RUvvRd7AEiG91Jh5TIKQVPPb47qEzQkGD9Pk838W913Y5wnCOmJ3AuBAifBccv2Ynl+DzBhKo+QW7z7m2KqlBRYE65OZWBXLOp44416bsT8xhZeBUPTOnjOB1fmuvB21r+ZRv2tm6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB741F00A3F;
	Tue,  8 Sep 2026 13:58:36 +0000 (UTC)
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260903102743.3782541-1-ckeepax@opensource.cirrus.com>
References: <20260903102743.3782541-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Lenovo
 Pro 9
Message-Id: <178887591587.2104350.11351102545933398133.b4-ty@kernel.org>
Date: Tue, 08 Sep 2026 19:28:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 03 Sep 2026 11:27:43 +0100, Charles Keepax wrote:
> The Lenovo Pro 9 also has a Realtek device in the ACPI that
> doesn't exist in the physical hardware. This confuses the machine
> driver into attempting to create DAI links for the device. Add a
> quirk to remove this device.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Pro 9
      commit: a6a867552a36e647cbd35aceae24754c9bcd3661

Best regards,
-- 
~Vinod


