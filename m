Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244435;
	b=Foj+EoIpE8Oz5Uve4PmNgRjHh5iNL65+fL+KB2VySwMfj9vE3kEUjvJrIghpRQ1sICCP
	 3UYlG12HIFNvFrYaSkdu0Px52IuCxuYtvSiYU7hRPJRadaVkN0o0DBvDdOX4KzpgtkZ9N
	 Wb+R3IlS2O+hG1PSuKfSsUmMAxeOtf5oUef6t4f9TqwK6H6fMwntk2HbWnuGTumQDxoK3
	 wEes8j9XeLVY9gFwDu0Rldh9W2Z1mLUNE3E3zsooreV166yl8bsmyAM28DrwD+0Y23eVr
	 u65hmXFFnpUdHbWmYfGjsVgpVPI6vfUwWaq9ZS94YtYjGxbzK2eawLwZdx3soA//1Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244435;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=LUi5S3TExYT+fKA6nyYWe9RLlbolnfUl69avGF7yzSc=;
	b=wQlJRmfsI68mPWTZwos6aspEPRMobOisWmQ0h1F912MBU8NZcm0QynXoB8gB43Trd6si
	 jZ5s865DRaTM/Rp3PvUI09dGIhLwSguGlXCmjUBN733eQSgSkR03vHktuPKEhyO8O5h9D
	 HwBck6QdPcsn9itSgYwQNmXAgIooIEsl5bV11vtxBp/CDIs6nZgEsXSeC4eb6E+ay6a7R
	 yOGFABiu5Tfxmq643hQzOhPHnDqkEI++rqwLOSZbJx2/65PlpJQJaFp8zIgeYXQ7C4qzh
	 krxoNDBFDDCOFMt27U3UhWZfJnXFs92FoW9o5sbhl8QIHpz9hnoFzsZ188I7HOqk7KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SL9coC7X;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B0606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5B0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SL9coC7X
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id QPeAxnu6IRiNxQSwMxL683; Mon, 09 Nov 2026 17:13:54 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QSwLx6t9IlaNKQSwMxuWmc; Mon, 09 Nov 2026 17:13:54 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af1ff52
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=RKWXfmB6k3OvuUuLRrUA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LUi5S3TExYT+fKA6nyYWe9RLlbolnfUl69avGF7yzSc=; b=SL9coC7XO+Wt4q9A24N7Ryi5WA
	902LaFEVdDkTGUHliCCdJI200tcz3v1oMo3EJUWmI4LukqCwtNfm3S8o6IHLr5SVRl/6jbDE7Gy6N
	GfnsqMZXHAKjzSWieaKTqYWDS/s9+17Y8GE4ew73nHeUmyWP23o8iuA1BUaFWCZj1wcrXr/UViAj/
	zogsbiBzQyq5bV9C+nlqfJNHfWyTmiRZY3geU8vKf+iqtc229gcgYmYqjv2NAlUkmneSZJVdIEaOA
	nXyRSWUqNmIdx9FXm4/PNKcHWWDoGxPMAmoR4x71BVPUUrA5r0fHdTLVuVagSHbxx0+wKGb9dqOvX
	a1Al68HQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48712 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQSwL-00000002B35-2D1O;
	Mon, 09 Nov 2026 22:43:53 +0530
Date: Mon, 9 Nov 2026 09:13:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: Hamza Mahfooz <someguy@effective-light.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Restore manual fan control after resume
Message-ID: <5a1c2efa-648c-4282-b641-4d9cbeb0e012@roeck-us.net>
References: <20261109163328.61787-1-tomasz@bojanowski.me>
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
In-Reply-To: <20261109163328.61787-1-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQSwL-00000002B35-2D1O
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48712
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOnujw4rPce4O2qHLZ2Qp6u6yfSHo3tCQzqIyCdUl/3zDXjnzfjAMCmmPLI/aa6Z7aCScjjw7Jq1lSGkEypRbufdu9sVBxB6Nyfx2Q9owRC/U5nWAw/f
 im04wIrpZproIcy9nGVEEsblfbnxUO/pSBfK2MvYLE0ljy0SbwM1xsbg6W83jlGd7K7vi0Dm3ehROxVZikQok2KKk1dNoQmWfX2+c85bH9aZHGncSYTpo1PI

On Mon, Nov 09, 2026 at 05:33:28PM +0100, Tomasz Bojanowski wrote:
> On MSI boards with NCT6687D-R, the BIOS restores automatic fan control
> on resume from S3. The manual mode and duty cycle set through
> pwmN_enable and pwmN are lost, and pwmN_enable reports 2.
> 
> Remember the channels switched to manual mode through sysfs and their
> duty cycle, and restore them on resume if the EC switched them back to
> automatic mode. Other channels are not touched.
> 
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61): with pwm16_enable set
> to 1 and pwm16 to 153, pwm16_enable reads 2 after resume from S3 without
> this patch. With this patch it stays 1 and the fan returns to the manual
> duty cycle.
> 
> Fixes: 5410a1257e26 ("hwmon: (nct6683) Add fan control support for MSI boards with NCT6687D-R")
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Thanks,
Guenter
