Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661A3E3C68
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297003; cv=none; b=Z4zM9EubC7mAfWYyZ1bSUNqVoaZcLq6VY0H61XmDgD/DVHwtpu5d5kobYeMk0fEK4jZ0COnkdxUGV/f2Mk8mv9hfJ4vguBf0kHBFwgUNjp2ksbQXBxzpaN3jrAU0m9Lawelt9gON6cpJYuOCOTCIkRRLE1LJvMMSK0V4/FgvGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297003; c=relaxed/simple;
	bh=FPOuWqNuTH2TVAwkGxe2VYd6RJIMhX0TzIJCMUCjLy4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F3r+vBQY/pWYc8ZEXSuV2TapNBqbAdCku9/2Id0nLHlVoljAjMujpYroHzzxFkqRqQc5XK8xtlW9l4V5ABQ5ZKfRSHoH6KJXmI5tWOuBPeRWZzb6aFO09MXzQRkGMo74egUMe3s2UDsHZGJxgKLLk0Avscou10QCCm+/yUH5Vl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSlaG9Nv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSlaG9Nv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22FA1F00898;
	Sun, 13 Sep 2026 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297002;
	bh=3swnm2ads6waESiNi1EorXP+dQ0y/SxGczDUkiwUru8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RSlaG9NvRsJEivnVKrbQT0ZibS/3tBev0grAaK1uMlK0Oyhzz2QLu83NhUau+oE4a
	 +WtVNV2lMM7scAOi8ARfS7mm+489GHD2nb3m0OwwxPDq5cERuqi0vKWLXXCBZbt2ui
	 P0wPUM1GFplE3v+bIylhSQk2W8GQZi6Lzt4PdjSRseW7e4Mism6Ynni1Q6n3u2TlCE
	 0sZaURx6AEygSaP9t27sCcou2AP1sbEZKO2/rfOypqitKsbOxTSRrYOhRdVuMOFXxu
	 tANmjRbIalLcCEwPgJvK+3/L4UtauiGaLKhWQOqyJQCjQiClG2D1p0LArNNy67uJ7l
	 TCqr3rCXjlQsg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260304041602.7539-1-rosenp@gmail.com>
References: <20260304041602.7539-1-rosenp@gmail.com>
Subject: Re: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
Message-Id: <178929699949.215437.8291797123848780958.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 03 Mar 2026 20:16:02 -0800, Rosen Penev wrote:
> There is absolutely no reason to extend the lifetime of nvmem_cell_get
> to after removal of the driver. Use and free right after use.
> 
> 

Applied, thanks!

[1/1] phy: uniphier-usb3: no devm for nvmem_cell_get
      commit: b2d5ad12d78a1070553f4cb6bf3315105a3b3da3

Best regards,
-- 
~Vinod


