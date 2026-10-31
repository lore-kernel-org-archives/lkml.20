Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469916;
	b=qaL91mhPvMa40U5sGIGdjNWPOn3TfVpHkqDqey7Axb9iWVM9VAXMfPpMQRF+rL/I1xJK
	 JiHzZrxhEUG8rkQfwW1v8PFjfkOUTPspYwW1uIcymJFDtNrfINT7CNsQr7mS+rjp2Rrp/
	 UaKwXXrpWxVUuY6uShY6ALE+OeMjUy1MnX2v9eyLF7KBJrsS/WpG2WuF1/aQISs0ukxKA
	 Fy+A67lpM2QJD8CBAHvjAD9bjgogfcKzBQ4KqaGOFgOfnNup2o1ib86fIqKqwcuvOz+3N
	 ZDiEkSmGosqTgFPSnV6Rk3A8UYq/zb3Q/wuWh3en5xBGecN3eIVgpFfCQ8m9Wnkys6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469916;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=XH4PbSUddZVZXZtjZ75jfe0i+WJ14qbL21Dy3aZUb14=;
	b=VXnrm9B0PNvFKYeFjmfiuCCH3CBe+ZtB3XsxPBtnCWq/3Ro/UZFPOgLwWBUe78E5p3Dp
	 T9jHhjvRE7B7kOAc1koU4ODR80B4D+X5wslUapCowXXNh5wBkDOguCE+/YyE0K3wmLqW+
	 +bds8TDoflOMZ7UQgwLT7BYbOg3SweKyPH/WAcl7ztbcV11ADxzUOtYPW/fgxSERm7c9a
	 ZokchIJPPLesIrKP5NqRVwSy82PstoL/ktJD06Zp8kHyOHBFozEqcMEFTWf58q4iBuBUV
	 wGY3kH+iCxHhEGAhqHVXjLwdHKpUy5WfaQW3mEYPPVE/oNcajUWUeBiujej8yCxiMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ySZx4w7x;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E0606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ySZx4w7x
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id N7byx67vNusRSNDS7xeljB; Sat, 31 Oct 2026 18:05:15 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NDS6xuqgD63hBNDS6xQjwZ; Sat, 31 Oct 2026 18:05:14 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae62dda
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=PR8N35F6eJWpYSb-7tQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XH4PbSUddZVZXZtjZ75jfe0i+WJ14qbL21Dy3aZUb14=; b=ySZx4w7xmJA7U4Ymz/fdAkBCSj
	vgac4IRO30r0dfM9itNmp04EudBOnmAS80NMyDN16duvBJG59nF1WLOPfmbtQqqjdYYRurqpNWXT4
	EF8Gwu160dfK+6Qe/5kLn2SDEFL52pew52cXlrpwnBy4I5JA3WUsRNryJ2Gng5uTeOt7WjC1oWbiy
	H1kj+hB30xh/74vwkK3Df7OLS+wnSwxtqxD1DFVoadO/J/16VjzMRSZT7VuJEaX7giWvEn3vIg+2c
	KteZxtgZ3iZwLr3ddtfMhjhh+h/6YPMyls07HawUz6xwMYqvqGdMOaMw8jEyPphx0t9M/CwgHvEbg
	cXqr0tBg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36812 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNDS6-00000003Rms-1L1i;
	Sat, 31 Oct 2026 23:35:14 +0530
Date: Sat, 31 Oct 2026 11:05:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ethan Jimmy <duhxu0@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (acer-aspire14-ec) Add driver for Acer Aspire
 14 52MT and 52M fan
Message-ID: <985bd253-a9da-4b72-9348-956094625a3e@roeck-us.net>
References: <388aa474-3606-4c7f-b073-224d5e0880fd@roeck-us.net>
 <20261031174651.856627-1-duhxu0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031174651.856627-1-duhxu0@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNDS6-00000003Rms-1L1i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36812
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE5ADv92Fjna3EM3CN2A7pBlXps9dKLpRxk+6PSfOyFrWCoDVZiJjVtlfONQiN7yuomBqltxwVypMMU9VFu061S9E1ezoLvczGQ5UjmAY1KG8X0cPb3a
 fXSSOpchLN+ayvJWaIzM3EhuCpHGM0RtZxsR2lUtEASPYagMpDqXEp5zJ4UjG/ZmnvONPii/JqbQ+Z06+E/ktVKLVLrF8h7RSNJFLs9BAKIbVeFf7RHbtjlu

On Sat, Oct 31, 2026 at 10:46:51AM -0700, Ethan Jimmy wrote:
> The Aspire A14-52M and A14-52MT expose fan speed through an I2C HID
> embedded controller that also serves the keyboard. The same product id
> is used by other Acer keyboards, so the driver binds only when DMI
> matches these two models.
> 
> Signed-off-by: Ethan Jimmy <duhxu0@gmail.com>

Applied.

Thanks,
Guenter
