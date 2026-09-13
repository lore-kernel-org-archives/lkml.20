Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416B53E51FE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297014; cv=none; b=tqkCTdF5TEMXJkAKfpsKQhpUb04DitOg1qtvNPYEbQi5TPRnjfau5RPjfrCkkQve2eIjSPu3s/313rFgqSJs5B7LvpZC082IsyMUW3c5MNjrZWtORDB3L4EhUqKQ8KrYmvGbMEa5NkBVpwpZVPAzzUvQtp1dMckoCEFZKfWA0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297014; c=relaxed/simple;
	bh=EGayqkIix5LKeN3xdem+/alyl88oef+NgrZLHAb5eE8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gWWEpfIgLrKI9Fjdj+EtwWBlU19cawnHl6f/7eB0aWV+U+XAlUFksys9qd7T7hT2u7STYYelPKgfUfxaJlkmMsxWD34VYlypAG+rct4QrcGmbm5pq0yV18Lcg771kVMmP1BKQMs9Ditv+D4xmTgR+mMy6RB7QuRZsWC6LeQbRGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoQKW3rA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoQKW3rA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B101F00893;
	Sun, 13 Sep 2026 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297012;
	bh=2XT2LnixGn91Xc3D4NtPTJkbbuH+9TERLl4v5tZDuRs=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=DoQKW3rAxl3ptgln3nNYHwqpIlQtrFhu+gLrbOo4mMnzktLwakAYrMT52bjhKD5wj
	 L2HJMuQUr6MSc2ppPPCCvINyInmKUs8VWviMV2A1kgwN0WFO1c7Hy5Tk8pJ1mLMaZr
	 9XsDNBTQOO6GWpZtbTD+L7A4A9WVpIGDmA/7Z+aPp2kaA0+0PW4oxC8hjOa3rUcFGp
	 YBb4RJbmL8WM46xr3Y4qF3EulBlqRJXvVSSKbEJddZ0ZsvwWNhsJAxsMLg3NXiGTHy
	 jfFr3aptjLIPufN/Qhlxouwj3DDxHhHXBmuXTrlzPt7DGToKHaobGo6sCf+pDbKLCM
	 7fL5rRW3HSWlw==
From: Vinod Koul <vkoul@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615070123.51155-1-pengpeng@iscas.ac.cn>
References: <20260615070123.51155-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] phy: broadcom: brcm-usb: unwind late probe failures
Message-Id: <178929701019.215437.9872353420312468460.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 15 Jun 2026 15:01:23 +0800, Pengpeng Hou wrote:
> brcm_usb_phy_probe() registers a PM notifier and may create a sysfs group
> before registering the OF PHY provider. If provider registration fails,
> probe returns the error with those resources still active.
> 
> Track which optional resources were installed and remove them on the late
> provider-registration failure path. Use the same state in remove() so
> cleanup matches probe progress.
> 
> [...]

Applied, thanks!

[1/1] phy: broadcom: brcm-usb: unwind late probe failures
      commit: 402266bacb70263d4ba2a1f0a615210c9c4cbdd8

Best regards,
-- 
~Vinod


