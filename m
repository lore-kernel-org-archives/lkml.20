Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674663;
	b=5e35h8vf+1DPjGbCu9iBeZ6sSmJGRKpNfzH8p5Z1askj/wt759Qp71nrMBrdd9zaxvy1
	 4iTzQU0C8KAZrtCNyHmekrBTx5GS78Swfm/yMq+FhNCmNX8gNbCLL3ccsMhyAIwMpilo1
	 +hQb78vdgkSjVLh+i1IOQPlkYxjTo54yiuss9GGuyzT7KfDosMf9K4YUsBv+K1pFlIZTg
	 lIRLsRiD8M1BKJzRxYUVvt4wagEFGyaiiRDIeqEc3PP0xVuHXKJkqKQmNPOigzHlmOQXq
	 kSIF6JFMvcFGLPDd+q0uL5AkdZsZD7bUZ0+OYZA2hd8B7dj+/fRPvzmjG3QxNuChE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674663;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=B0OC0ZuonTQMXGfSxyDCyL/1ZM45W9+oO4OKZDmsoH0=;
	b=T4LklembWOab0gqCiUfrmJM4GnVzbdF/EDkPjgM6SKU7sjWFWa9jWhgO7oRqM7jIywDJ
	 +790VzQj+gvvmHfW9owedkfzxW9BpWic4FZGYWC9A8EBAmo7NY3yDHmCfdBePgb4LqgW2
	 QxS1w4dIp6wG2euGRA9+kcQuQWb7UcMi0DortTWAEawFdZIsuJtc7hawNoL1WAvYa9Onk
	 uIXiExyY06TAe5TsjmUhfTLJbLCVNNfuPrGgeXG3XehgMO+SCxtL8sf1GCYhOyD77lFJ/
	 0J9TECCCRBu5ubpvyLhpGWIOzfZnhpOq3JvZrIvuvG7PW3U1YUHL1X+1qz5+FBU1flQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gj8hRzTn;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C60606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C60606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gj8hRzTn
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id SDgWxfHTXyb4YSGrXxgIoe; Sat, 14 Nov 2026 16:44:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGrVxbOCDdRrRSGrWxlk0R; Sat, 14 Nov 2026 16:44:23 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af88fe7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=XYAwZIGsAAAA:8
 a=VwQbUJbxAAAA:8 a=kXeqfPWSxjI9BzV32rYA:9 a=CjuIK1q_8ugA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B0OC0ZuonTQMXGfSxyDCyL/1ZM45W9+oO4OKZDmsoH0=; b=Gj8hRzTn1Qv0Tn1Cegteb7ykRg
	3Hr2Vfh7fpwxl20G5C4GVXr8t+0XKtiV7ZqbCd2yHexKZzfWUZYM3R5hHl5XrOW5G9oak497GShdn
	BBYXj/2UERRK5fN4T8CaUVeZ4++MBC+gttXXZyDqHbjQ7WEQqFhpz7d8NCI1VaYO843flyVufD+xS
	4HjIoqy84YJX7r4sxJb2ShtqSgnPYLOpZiyaxjnJBuv5T/9/FWDxM46FWzVN0bxaiLjFPBIYPmfj+
	gVh4BAT53kfZnql1hENZ3zYXsA5OHF/dcat9cJEeMKmLay68bzxmJfUAq9ThWq38wkXQ9e0VJxN3P
	6ZTS4Rcg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48162 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGrV-00000000Kmi-1jrj;
	Sat, 14 Nov 2026 22:14:21 +0530
Date: Sat, 14 Nov 2026 08:44:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <db9e90e3-9d06-4b23-b373-9a78e2598ea5@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-2-robert.marko@sartura.hr>
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
In-Reply-To: <20261111161619.232141-2-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGrV-00000000Kmi-1jrj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48162
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 103
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJVVYHIOYvhs0gB5z67MQZ56UIyKGIo62qCBAkb1TUXgvNj/CJPPeMQmO5/wmGIkipOhx9JHoK7kI9eA4Bjh+I6SAC7HU3XIvyqJnzueATF+5GrC7YOJ
 a+gycfzWVWLacwyMpGHUtV/OqHyrGD8XlBHSWVEzumoM49J/yISvpw092dRRER27NHFQBW1I07tM8dal++Nwc28ify2ETE3D7tckVZ5hIhNlpWXiwDqZfkZH

On Wed, Nov 11, 2026 at 05:12:46PM +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
> 
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
