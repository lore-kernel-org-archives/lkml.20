Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672815;
	b=FPHgq3E2SWswEMsJxlTayxZ8AcMq07wdRIFHD+cWOar1I0QFDbcTv0GKHEqn1RLkUDtp
	 py4Lu6egt/vJUqYqFCPgLQtjKZWjzpj+v9XVOg0dafgMG6TTMD5gxE3jZ4e1IlY9KkKWd
	 /kkhvMnCN2EaT6r+VPJTfCS8eA93aHiQrhAI6P4v0UhB6PWLz0HOwNdmPEZn0+Qmcou3H
	 rjIW9IeSZmMfuQaah7dBqehgJH5gvaWA3EaK+BulwaT6FNbF6CxpyFroewsdyi/QIv4tE
	 4G6skuo4HJzD7UfUZVEbyR6QzQnmvsIk9Ua5EUBxBuQRDcYiYRFHxTI8quAg8VIR4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672815;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=mbytoUa3tRKFqWhM1UcVL4cxUggurP+uHf5s9LyN1+8=;
	b=Ivb30PLrnhTUjQXrhHSjwxFPaAycNsO/e1yU2n0b4XcSbu0C43F7PzY6S5KRjcVpkPLj
	 L4Erm819dUK82QdxA89nUynkuz+ibYZ9XfDjXJ4XoJDiDCVrXdcdZJw1VaKPeid/JGhhj
	 q7Tju4ir/B334+O1H9CQ2uo9bITtfNyOGnhTNdkWuYuLaXGn5dNa+hwZvYHDzz0tW48+r
	 4VL5tMEgeHeNzIcCr9YJoC4UzkDYqUnheyQYmkEJue8+WQRaSTVylIetuN8CLcnUExnAF
	 V3lF041Yp0PPiY7ASH3LQMQiyTkJ6EPpJhTgBufyWsKqAbIFp0dEnKqST+DwYlZVOxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="idl/s72I";
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD8606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BD8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=idl/s72I
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id SEIVxfN7lyb4YSGNjxgAzS; Sat, 14 Nov 2026 16:13:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGNixk0GWGh2BSGNixpCAa; Sat, 14 Nov 2026 16:13:34 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6af888ae
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=0nlnqQntNI7bdpd6a1oA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mbytoUa3tRKFqWhM1UcVL4cxUggurP+uHf5s9LyN1+8=; b=idl/s72Ih7T5blQkDjxSONfflW
	V7NAGQOQ8VFhC36M+LC1EkC+GYOF6JK3WVp7gJl83Jry/XsnFZY0tGeBK48s54xM5K2DbEmzA/SBv
	d4o9KE1EPiumNOi0kNdw7FxraKIoznfm2/BY7Flko6HZzDF5acymV8tElLqPdHj+QYq/WEZ4AsaW7
	Sdc5UV2Ba0aMMAngewRn9HK+GZjXWW9PMDGklyaMH+RnyevJGd9i0oMFr03ArmbZzgaxdjlPPfz8O
	NLDlKOiQ/oDH8uFyp8yUYeC2uDDznN/5GvxUray86HM2vGY/Fct2BdR9ivu2lYynwj3SDrzSQzNdl
	MmjlsRrw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35394 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGNi-000000006CK-0Ui3;
	Sat, 14 Nov 2026 21:43:34 +0530
Date: Sat, 14 Nov 2026 08:13:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock
 BC-250
Message-ID: <9e51a722-b1eb-43f3-8fcc-358811ec7fd2@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-5-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-5-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGNi-000000006CK-0Ui3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35394
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 44
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNgJVYOsK1Yvd8D/BWn2hM5AcW7eyufJFILqteOU+G2JiAH+6NbVFv8htlvXfWIeYkuMJOej4lfr3HDwCVJHGpF384HFDUZD8hIGLWq/mOMVxbYoIDjS
 tUN47RWHJ8/9SjDanNLCuMwBITZuv+KnvmWJmUmIDOHi7o3qeqXjoa+MOVOyChGIRXIzg/bp4KMdDdYGtQ95G6ePtTZet8uBTZujQZK0S/HemzESHy6goXJW

On Wed, Nov 11, 2026 at 09:28:35AM +0100, Johan Dahlin wrote:
> The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
> control registers as the B850 Steel Legend WiFi, and manual fan control
> was reported to work there.
> 
> Enable fan control for channels 0 to 7 on this board as well.
> 
> Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Applied.

Thanks,
Guenter
