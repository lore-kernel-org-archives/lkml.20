Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249014;
	b=Vbhk2QEflaU5ozt0U2Te2KijM14jApM+P7stLIjyBrmEeHzNKM7E/UL2ynQURZMOHFPL
	 YUhqvlp/Y/lrNZb2jQA6Gf/6ZFJwDPBpxb4wLH6Aj8iZD8AhWFCmhtMHBYKgCYSkCr0tq
	 ImWANoakJFz7XpeanQAD9XhKgZTdIsM93i8llUULT9sivCsEPCrVIJtPjloBn4iAeYXVA
	 pm/rSgj0R5nlfQLoSMBlyBZiVCFKyg1BKH0wTH2BX20K/fCHu5wxZPSsalv4hg3y0kYaH
	 GCIanu7wZz/W+NRVnx6hkeqJjY+TiNWoP2gmwVRWitK8uDqqh1IDLolDHJEMQ3HCJsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249014;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=JO7i2PbvJxkMBIYytW43lBbqQOqbXp9HMNMYIEmTY34=;
	b=B3j9nuVdJPqzgOkyb3wJFSleH+xF9DaPO8E+1y8pEgr87lLkyqv0dfjWUcb0hkOz9F7A
	 5XoDxP1eO1Nt09GbvR7hyyplpwvCTS/YI3RQ8zrjf0CtxHN2o5qhKcR3IYuWtXWaUVbmx
	 EO/bd6n/uPLrP1/OD8MznLA2lSwra1A6Jb8sYbUQJrCjWIWesmK/i3zxcQE1QeGO2uUPd
	 oUWi0+9gYQVWo/BZzDqJCpw1/B1dJ7ek97jotdv344JneGddh0EALuxg6cf9JhFWYLF5k
	 wiWaMw4q1YTAmKmwTtaxbZkPoJYoxygOkt/pEcGr6TjckhOQ+dyvSg1rAANXMupTHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=T5XNXGIn;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B8606E12A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D66B8606E12A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=T5XNXGIn
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id Q9zfxLMYRAR1iQU8DxXk9Q; Mon, 09 Nov 2026 18:30:13 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QU8Cxeq6JYskhQU8Dxct9M; Mon, 09 Nov 2026 18:30:13 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af21135
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=vQ2Orosr4Im1LJnRkBgA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JO7i2PbvJxkMBIYytW43lBbqQOqbXp9HMNMYIEmTY34=; b=T5XNXGInbjcJ0sMEsiLiHSXCc6
	YEUuIIETs63w++wr9RPCW6k6UZ8XZds36fWdd/chQkjyO+V+UZxcxNliJJT3umNmi0+aLCfpDGblB
	uRJv9Tk1WEJRNm20TiJZ+QXgrj+xQ3UudgrKIbuI5PbgVgtztGvRzRCG+GGzUWHndmlczTvuDBfz1
	0LSYX5mzUUF1TbMqe9N7VcKvYoh//n9m2F3I8zfStmR4PxDu3UM6oufH//79dnLmK1d5XZLcR317p
	z0nx3/s4OUZ73Z6KtKJdqFMBc6COklnmcdYZ5uS7nJXhvevAEJ8XmNaGABcrxJA9//Nv1zXVe5wQH
	pqReo8Ng==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33840 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQU8C-00000002stQ-1d8y;
	Tue, 10 Nov 2026 00:00:12 +0530
Date: Mon, 9 Nov 2026 10:30:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: "Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aht10) Fix update_interval overflow on 64-bit
Message-ID: <c77461f5-5d19-4482-9c6d-da6b3d52b69b@roeck-us.net>
References: <20261108172651.220121-1-zoone.rupert@gmail.com>
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
In-Reply-To: <20261108172651.220121-1-zoone.rupert@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQU8C-00000002stQ-1d8y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33840
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEZnkTgYpmGbnqHnHQTPi+ImaHC1c3wDthtEH/qnk236Jmj7xd5hh0yW+iZcneGo8LolUBGXwHahxc0IkKQapHDkr9URVsGkcpmAptr1EcG6WQU/lRoA
 BzkyO1X7oTXSMx/F5N25zYAeg6sMxiPpWsW/o0k0Ka2zn+VqJlkG4z49F1D6sUG72BrK3bOvvh7HHmcCV2033k2eBE1FC9q2QZ8eM3HoSw6oCcEXpB62INVs

On Sun, Nov 08, 2026 at 07:26:51PM +0200, Rupesh Majhi wrote:
> On 64-bit, update_interval writes are clamped to LONG_MAX ms, but
> ms_to_ktime() overflows above 9223372036854 ms and the interval wraps.
> LONG_MAX becomes -1 ms, so every read starts a new measurement and
> update_interval reads back -1.
> 
> Clamp to INT_MAX like sht4x, so the limit is the same on all platforms.
> 
> Fixes: 8c78f0dee437 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Applied.

Thanks,
Guenter
