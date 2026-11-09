Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248649;
	b=me+wJjy3dSuRIm8z8+eMdCijg2t1RVPPf0Img1suIwJNKIn318DViEsEVBS4aVR6WYYh
	 3WVYdRZo8xgTBkGanCtN8YpNKVjbJsXNcJ/0ddaTytk1nrvD88wcZsEeHD7LrHbfsTGBz
	 cR9LidEZS+xsWNTbzA3uWg9kHa6Pq0cEX57r32LgiKM5isuSO5wVHxHFo4Od/2botwkDK
	 J9beGswWIQUm6W31WiT7GkJCfAETcPmQl1zl/IqEzW6ttWne8FEqCsN46eeSREdEpHgs9
	 dDeBZQRCyARo/WWiED/xKrT5f4C/Ei0uj9DvR3ng6vMt9/KoIL1yuvAn5aTc/wSz6ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248649;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=2on6NAAeJnGt6PhGZ9n3PfZK1f7XLylalu+gyTUqy4A=;
	b=JUx/cMVXn+UYG2JY0k4YswtDASFtFCbbpTn65PmL8nuSxlWV7BrOVIF1GUPeLmYqPi6h
	 kUqT5aOfX92/xfjKMpJ4n7NWd+gRlmIM8rt7DltJ215hPBSmWgs5v6UaSH2YOAO+gbMPG
	 0z3kVQOhAnbqGYODbudFGOcDANGT/bAiQtQpa7RDOyEnV+jx5R6ltDaK2s4dYZW1Bfk8u
	 y5Kkd7DZ9f1w8KM8J8uoT0JKYbaHEOgoiNoD0XQw2zJxOa5EQSKY67mDMXfdlDYm1uJ8O
	 Avai61v809NQroqSdP5UVxPBAYHR3i7T2pAn41E5NJnnGFQDBCLK3JlRGFzqhm7AogQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=NyN6JifT;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58104606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58104606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=NyN6JifT
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id QRmsx5hmfOOJnQU2Kx4tK7; Mon, 09 Nov 2026 18:24:08 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QU2Jx9DNNlaNKQU2JxwL5e; Mon, 09 Nov 2026 18:24:07 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af20fc7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=Jq-I66J_MKUZ35_zl-cA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2on6NAAeJnGt6PhGZ9n3PfZK1f7XLylalu+gyTUqy4A=; b=NyN6JifTlmYheLF7E8OMfiPDBU
	2T1yiEzv50PfQCF/qan3S7EG55bxRhOF9IPeqIobY+QfXjry62rKWy+SVHr6Txba2shiMfMdP4WSs
	6yREgqB31YKtARvqnIuz4MYPfV+vFgbXFC3hMiJ2JXWI+cNtEq6kemNleVv6SMTAZzwUq7LLmA7QF
	C5nFvDs9+cVPUcU4L7zu+3Ug2B70Snw3jcWnbm68686KEQOdvIGr4qjf8uDeJwKlci2GceZhHpQSm
	B7qxxh7ixbmsFb1hEqcbLjbM6H8jyeWORFE7ERwGsaL6K3Q7/ISDfhJrK2yPlo384fSVh/mmmgXHd
	ZhOauxKA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38696 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQU2J-00000002o1z-0S7y;
	Mon, 09 Nov 2026 23:54:07 +0530
Date: Mon, 9 Nov 2026 10:24:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Report the fan curves of MSI boards
 with NCT6687D-R
Message-ID: <3ebb15c8-cef3-41a9-a603-335a9dcf4d86@roeck-us.net>
References: <20261109015759.24284-1-tomasz@bojanowski.me>
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
In-Reply-To: <20261109015759.24284-1-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQU2J-00000002o1z-0S7y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38696
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO/x0/hJ7DxLp9a2osucWEFrN3YoS4RkT9B237G2kxB7MeE1F65IFTkOWWLuh06BBXq5I5/4wssZ7K3weU5qb0kioSUV4Y5DCMOpnNQofPGjUiFbLEFq
 UiJCPipShTtAg/sizBLiynwT7FEUPLQsx2h6sxajuLTYobspPUVC2xZT2R+EziZdR7VjyZ+YNHaDJt8/U5qCcflzcrqsuwzsadC36eFhbFjfhAdKgdAHZ5+Z

On Mon, Nov 09, 2026 at 02:57:59AM +0100, Tomasz Bojanowski wrote:
> In automatic mode, the fans of MSI boards with an NCT6687D-R (customer
> ID 0x20d) follow the fan curve configured in the BIOS setup. Report
> these curves with the standard pwmN_auto_point[1-7]_temp,
> pwmN_auto_point[1-7]_pwm and pwmN_auto_channels_temp attributes,
> so that users can see what automatic mode does.
> 
> The register layout comes from reverse engineering of the vendor's
> Windows software and was confirmed by reading the EC of an MSI MAG
> B850M MORTAR WIFI (MS-7E61, BIOS 1.A68, EC firmware build 03/10/25):
> for all six controlled fans, the curves match the settings in the BIOS
> setup, also after changing them and after a power cycle. Other boards
> with customer ID 0x20d have not been checked.
> 
> The curve of fan channel n is stored at 0xb00 + 0x18 * n: seven
> temperatures in degrees Celsius, followed by seven outputs of two bytes
> each. On the test board, the high byte of each output is zero and the
> low byte holds the duty cycle (0-255). Register 0xa08 + n (channels
> 0-7) or 0x240 + n - 10 (channels 10-15) is 0x40 on the test board for
> all channels with a fan header. The temperature source of the curve
> appears to be a bitmap of monitoring channels at 0x910 + 4 * n. The
> driver assumes that bit k of this 32-bit big-endian value selects
> monitoring channel k; on the test board, all curves use bit 0, which is
> temp1.
> 
> The attributes are created for the channels which support fan control,
> if the mode register of their curve is 0x40 and the high byte of each
> output is zero when the driver is probed. They are read-only and read
> from the EC on each access. If a curve uses a temperature source which
> the driver does not report, reading pwmN_auto_channels_temp returns
> -ENODATA. The new code only reads EC registers.
> 
> Tested on the same board with kernel 7.2.15 and the driver built as an
> out-of-tree module: all attributes show the values read from the EC
> with a separate read-only tool, and pwm4, which does not support fan
> control, gets no fan curve attributes.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

This also seems to work with B650 boards, even though those use a different
manufacturer ID (NCT6683_CUSTOMER_ID_MSI3). When adding that manufacturer ID,
I get:

pwm1:94
pwm1_auto_channels_temp:1
pwm1_auto_point1_pwm:51
pwm1_auto_point1_temp:0
pwm1_auto_point2_pwm:89
pwm1_auto_point2_temp:45000
pwm1_auto_point3_pwm:178
pwm1_auto_point3_temp:65000
pwm1_auto_point4_pwm:255
pwm1_auto_point4_temp:80000
pwm1_auto_point5_pwm:255
pwm1_auto_point5_temp:80000
pwm1_auto_point6_pwm:255
pwm1_auto_point6_temp:80000
pwm1_auto_point7_pwm:255
pwm1_auto_point7_temp:80000
pwm1_enable:2
pwm2:82
pwm2_auto_channels_temp:1
pwm2_auto_point1_pwm:56
pwm2_auto_point1_temp:0
pwm2_auto_point2_pwm:76
pwm2_auto_point2_temp:40000
pwm2_auto_point3_pwm:102
pwm2_auto_point3_temp:70000
pwm2_auto_point4_pwm:204
pwm2_auto_point4_temp:90000
pwm2_auto_point5_pwm:204
pwm2_auto_point5_temp:90000
pwm2_auto_point6_pwm:204
pwm2_auto_point6_temp:90000
pwm2_auto_point7_pwm:204
pwm2_auto_point7_temp:90000
pwm2_enable:2
pwm3:82
pwm4:82
pwm5:82
pwm6:255
pwm7:255
pwm8:128

I don't feel comfortable enough to enable it for good on those boards (I don't know
why pwm3..8 are skipped), but it is good enough for testing.

Applied.

Thanks,
Guenter
