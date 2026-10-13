Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947F64F4036
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892707; cv=none; b=WNRr1DxwXplu6COQa6pMaQAfltnhDiJMDAD2sK+h6lzrjf/v/zXPSmCDV9HTjMPnCAoY0bN7heIsxectzY8CE9Gw/8wculMV8q0eyisvnZfN5xAneuGZoF4QnkjcKTit2RudnkR7UIBO0Zjbit2QRkKTr2ivRuEV/9ohs1sbwuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892707; c=relaxed/simple;
	bh=JO/ZG+nTWTRzgl4o3boG0UpJElQDO1QdDyv0D4H+020=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f9OlmpxjvHajGuRmXwwSWcpJTPVVlM/b6H4IqbxXyHoBK2WLZq8dnSXOxH78qt7JBj4LN5iYv+klV2/rilsGcmsyllF7yVCVfi004ULuzHjy7c6lPxyPZc5HkxO+cE3efZSJ26lDxnV+OI2NmtEjm+88k/G4lzA9o4N3QHdm1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=pV0GK/Js; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="pV0GK/Js"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pn2Qsm4zsY9uzWdZa3WLBDivUNT/7auvUl2gEUx5vw4=; b=pV0GK/JsihznfGMDXA48qwK6YH
	vxUBjCAUFvBcjXcI9UXE+zWBYJwtuTL1BYdKsG9fjDePRihpmJFsdWiwali5GIKrG/w/OYM80mhqF
	GsnRvPlCV8e/UKl84zpPoHCueiBlgzA5ZJrcuqdm/w1OZBy2+eocHjGue6LLQmigqH9HUJEZqP/rw
	bx0inYlAtZAqrsnF6RytNcfmcb8tQFLLBizTa2HA1lJIyTtbN3YQWnX9FYL4Wjem95eOhm+UB443Q
	ZpnN6o9ey3wN8aanFsZrWvAFpBDZGlAiCRR8/XQC0jwiYpUNHMVX8MU1gSdAvcxw9q2RpXyzP/Wpz
	FaP5OoaA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] accel/rocket: clear rdev on device init failure
Date: Tue, 13 Oct 2026 13:58:07 +0200
Message-ID: <179189268360.3989522.17128985650422979074.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708062845.716487-1-lgs201920130244@gmail.com>
References: <20260708062845.716487-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Jul 2026 14:28:45 +0800, Guangshuo Li wrote:
> rocket_probe() stores the return value from rocket_device_init() in the
> file-scoped rdev pointer before checking whether it is an error pointer.
> If rocket_device_init() fails, rdev is left as an ERR_PTR.
> 
> The rdev pointer is also used as the marker for whether the shared rocket
> device has already been initialized. A later core probe can therefore see
> a non-NULL rdev, skip rocket_device_init(), and dereference the error
> pointer when reading rdev->num_cores.
> 
> [...]

Applied, thanks!

[1/1] accel/rocket: clear rdev on device init failure
      commit: 4ac852419f0d317c7bd8db5b8acb3cc78be7fe33

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
