Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C67431BCAE;
	Wed, 30 Sep 2026 03:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738634; cv=pass; b=OUWIZv9eE1kM90zRLn2TOdHV7mAd61D8+GzOaZmyTBGMtJPBdlJccIyyVv+LKrjCyQgOUSc2UTVKjZUvg1AFp/AgZfem3vCEsMxacWud8VE9Nppa8988bLKrOLvu4UrStpxc9LIBG/VfS20QjFqt/QDWUwSTY02VuKat1OF3U+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738634; c=relaxed/simple;
	bh=d4MJ41s1A142NA0JHBZhNkRWVOos7geyDm2w5okD2k8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=FG6mohlOWxM86IoPNrpu1zG3kX3Oq2wEITtlWdSSi14+KGSRmYUgZRoTZmUyA0t7dEZEHG1XFRrof4EV2FyDBcSqO4++FXQoEKyYu+qpqeF8U/g679UIyVyfmPdNX7exVejSmkRPHQIPm+UN5JpHiX2Z+URbWlbUyg4zsvYyktk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=gLRaCq6w; arc=pass smtp.client-ip=136.143.169.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="gLRaCq6w"
ARC-Seal: i=1; a=rsa-sha256; t=1790738601; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DLxbt0wzBdA7oOsZJe0gxhRtNExKFJvKWAR8wQ0uevpTE6+eCwkZS1dA/lRfCMfDk0qbBbdBCkR5C+1IphIWvOlCDeldToVlNVBSC9QP5dPvQgAlKUjCWxg0YkNj/jrsX7lK9w9/TdyTya3aj4duc9SoZqq7BqRYpI2rIXnkH/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1790738601; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d4MJ41s1A142NA0JHBZhNkRWVOos7geyDm2w5okD2k8=; 
	b=KzvEnW766lvKM/XqFTKKqGW/xb5K841xy3JlB9uq1LmOeu7d2KvG4gmMjTk8x4P637eHGEuZ4QpL8LHxno/PGXJMOfsHzHPDx1IJW2jrvnIk/T4Kl5z2Ti0YJrh85NvEoX7JKnMFWy+lunjEGYNt0/u1gqUKjq4tlGd7G4o5Xxs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790738601;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Message-ID:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=d4MJ41s1A142NA0JHBZhNkRWVOos7geyDm2w5okD2k8=;
	b=gLRaCq6w5Gt+xZSsaClLFHv5BSKqYRyajYle0VtjET/aZA0YwGKWDmCSYP5/mjmT
	Nho3bp0c+oZ/zey6lbezpwdmX54/fw09BqpBM6zj4qjmAkNrOx2mRJZ+8tm4YdHfhIr
	/0DRzwOuCJzx0MNedjqJeTXxqX3E+e2D52+rEhCQ=
Received: by smtp.zoho.eu with SMTPS id 1790738597782290.93273657147404;
	Wed, 30 Sep 2026 05:23:17 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: sashiko-reviews@lists.linux.dev
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add buttons to Kobol Helios64
In-Reply-To: <20260930030034.3099C1F000FF@smtp.kernel.org>
References: <20260930-helios64-buttons-v1-1-d76249064003@iav.lv>
 <20260930030034.3099C1F000FF@smtp.kernel.org>
Message-ID: <20260930032307.4ab95783e5ff@iav.lv>
Date: Wed, 30 Sep 2026 03:23:07 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Wed, Sep 30, 2026 at 03:00:34AM +0000, sashiko-bot@kernel.org wrote:
> Since the user1 button GPIO (RK_PA3) is registered in gpio-keys as
> GPIO_ACTIVE_LOW to generate edge interrupts, does disabling the internal pull-up
> with &pcfg_pull_none leave the pin floating?

Not floating: GPIO0_A3 (USR1_SWITCH#) has an external 4.75k pull-up
(R9) to 1V8_S3 on the SoC side of D11, sheet 29 of
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
Armbian ships the same pinctrl; with no User1 button attached the
IRQ count stays 0 after 29 minutes of uptime.
