Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118067;
	b=J2jPW1gcQukPT0M14oVPpNG3x8S9hfoyy4MQ00MUWWYikJ3qYNGNBhbXlmnoDcb9d3WK
	 +F6BbBc2yV6fkghSZuhwot4g/kaZU1+DTBqmdoNg55lj3LyTYozuj2gr3TEsZ+SzjO3Dj
	 w/TnRIuVozTwJouu/mV+PXCtAoTtlGinWjCl9fO5XYziyjGGXRv7EQzsd5zayP7y+sI9I
	 31nG9fT8IOJQUcSaURDC3V08IkqVpD4P04MiCzDepNl5az67S+kZEmLruQ3+JgPVDSL0v
	 lAqtdK8P6Ry82P7mEtTYr66tBoZKvqnGhqiUWnlcVmZvTP9HaFEZyQ4/CoIGRE0I5KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118067;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=/EJgt032IdKFtV9uvcwyjszAG6BEFtwyoI2Bq1VEXIs=;
	b=uhLsFWyDAVvKhBbG85I78K6KwykKcEqElw0plk9kYBAQOA7pBgbgP2bn04jCj7xEygaK
	 mt9GiRTseOEqFb2rYoMWLuc8y4w8mbI0Z725mXqPZMVMtlnkTZzshgubaM+GzzBJGgGXp
	 wtzEarWg8j7VR1c+augRGI6v6mN83M8odENOC+3TvRXfTHb5vRog5RlFQbyrR2qgX1t7f
	 +CS/1F+0UAZhR/72x9hIovH5u3/BYDjlvDAT7DHyv2Fzg/v1pLicj+Snsf+O82EXMQoTv
	 aP/wO0XqDaVsPd7Qc9GR3syoH3weSe/4BjD+v+Me82KB15+Op8fYnLKKEOiTkRgXOJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="Q+/9W7sV";
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADE606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11ADE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Q+/9W7sV
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id Lhnvxny6YusRSLjv8x392G; Tue, 27 Oct 2026 16:21:06 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Ljv7xxZeD7CfWLjv7xIHhH; Tue, 27 Oct 2026 16:21:06 +0000
X-Authority-Analysis: v=2.4 cv=Z8HsHGRA c=1 sm=1 tr=0 ts=6ae0cf72
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=QDHc5EiPAAAA:8 a=cFugUJLFjlu1G8EhGgcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=59RwALqDKVzMjVMkmKwL:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/EJgt032IdKFtV9uvcwyjszAG6BEFtwyoI2Bq1VEXIs=; b=Q+/9W7sVWOL7f94vaxUWWWnKuw
	/eS72wD3OA7M7OAmX+n98fIkwLOQ+u3kytxX9w2qqJWmJ2jBX4ZX3mncaSCNcMtdga1RjjBeR9C3r
	3h3R+f7HVI/nIgVrGTcTs2nV/tLtsj3iYFaYBAXOxw4M4X34EvQOzBfIEnKuirwapyb0ZxaErHDIN
	XAe0Iw/6AJSrQv3DI12/LAOQPuzNnYSobXDtOsx+b4/BV7jJTNXX49DDgAvOVCRrmSOpCtC7aClo8
	7Rmvdqp8DENvcoqHQs34Z69zJi9HiMFeRVNHFY1WTuy+/urM6kxp7AXmSxVRdyWpzFGFXiHd+t2WF
	pjghLRrA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38130 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLjv7-00000000nU6-1WJd;
	Tue, 27 Oct 2026 21:51:05 +0530
Date: Tue, 27 Oct 2026 09:21:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: remy@demangeot.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
Message-ID: <1fcc110e-7269-44de-a415-1848922f75f6@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
 <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com>
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
In-Reply-To: <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLjv7-00000000nU6-1WJd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38130
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 50
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDuhGwcX0oySES/c1rHz6A47L54McnqLVX5pdrl8G+5MyV0/7J+F9cxZUaiZqDFNKub+KRLFOQIwjUFq7f3R4Lb3YS997eF2YRHIY9N+tXYNXOtejTgL
 8BNWDnkJcxXhVTXMvVuS4pSi4HwoLoUcFAa/YOYtzgbtQH38lw3B/ALqzzUIW8bxyiYok4vUuzjWaRs/szOXVTh0NXuTrijLUZ4tmGf/lmBSTG7YaQKpPiNU

On Tue, Oct 27, 2026 at 10:23:33AM +0100, Eugene Shalygin wrote:
> Hi,
> 
> On Mon, 26 Oct 2026 at 09:57, Remy Demangeot via B4 Relay
> <devnull+remy.demangeot.net@kernel.org> wrote:
> >
> > From: Remy Demangeot <remy@demangeot.net>
> >
> > The MAXIMUS IX EXTREME has a second EC (firmware ID "RGE2-Z270-0109"),
> > not handled by the ACPI EC driver, at I/O ports 0x68 (data) and 0x6c
> > (command/status). It uses the standard EC protocol (0x80 read, 0x81
> > write) and the same bank register (0xff).
> 
> I'm not fond of re-implementing EC access logic in this driver. I
> believe the ec.c driver needs to be changed to allow us to simply
> create another acpi_ec structure to operate the second EC.
> 
Me not either, but that would (should ?) be a separate effort and might
take a substantial amount of time to get accepted upstream.

Guenter
