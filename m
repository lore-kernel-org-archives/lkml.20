Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.181.117.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569654;
	b=xxbuWY8gYIKwjaZ0/0pebhE1B5ohvicCgUfWWp/hM3z5SVyfen0GG9ldlhrqkmI2Mrtr
	 RIUTJ0TH7l90B4WgtsU4HPLxcNP4w6hnAH/xL1Zh5iPaGI+wBIQMeMgIbLsVCmT5X7lpa
	 qUY1ZzDB6aaXPPLWgAlQWinuKR7hs55kpoDeBpYn4wr+gHAjrJIBhYzLoL9kX+sVsXkn1
	 hFm9xzcW0WlQBqI1ar4vjs05FMmYd/xNBjVa+aMEn3A4Sgh/nW+zfg8k/oRtK4CyLIM0+
	 ne8Ezu7wswZRpKom7cJAzUcP0gZmvAXr5UMFW3MpHjE2RYc7DkGdQb1ihzcNX2AkDMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569654;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy:X-EsetResult:X-EsetId;
	bh=JduQsiuIo7fQeNqJMaHKGouUARax9SQ+78nz0vImNQQ=;
	b=ivwWptaf17NYgkL7riCIw3nu1HAE2fAVCpwh2Ii5lIRUDXYZcBQut0GDdP3UhhrJ9jt9
	 swdHBqEayVRR+UCa2QAe1dV3VE/EtV3xr0MdpEW5qSJBrMOcH/AJEemDIjbJjDVtW1SZM
	 p/Ye4W9he3oxsipsJ3i1cgo/+G92koYu6K99kyyXiB9KHk69IpY5rajn1SmFpAQv871gY
	 WUvK31+QkMNZRmI5596sSDVS913XB1KIrsVnFokN+Ns565I2dAwYFNdGVRZyqL0XFLF2j
	 zc2T+S4n6mhi9rWw0lDnV1Thc/RWyDBfZnGtMtlnqJgVdMnsJPoJNQDLFlkWNniB6og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=actia.se;
	spf=pass smtp.mailfrom=actia.se;
	arc=none smtp.remote-ip=212.181.117.226
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4075D606A33E;
	Fri, 13 Nov 2026 11:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4075D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from [10.12.12.95] (10.12.12.95) by S185ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 12:34:06 +0100
Message-ID: <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
Date: Fri, 13 Nov 2026 12:34:06 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] usbip: stability changes
To: Shuah Khan <skhan@linuxfoundation.org>, Michael Grzeschik
	<grzeschik@puzzle.ch>, Valentina Manea <valentina.manea.m@gmail.com>, "Shuah
 Khan" <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
Content-Language: en-US
From: John Ernberg <john.ernberg@actia.se>
In-Reply-To: <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: S185ANL.actianordic.se (10.12.31.116) To
 S185ANL.actianordic.se (10.12.31.116)
X-EsetResult: clean, is OK
X-EsetId: 37303A29379CA95B667261

Hi Shuah,

On 12/11/2026 23:46, Shuah Khan wrote:
> On 11/11/26 04:34, Michael Grzeschik wrote:
>> While using usbip on kirkwood embedded machine, I came accross
>> some stability issues. This series is addressing the reference counting
>> on and usage of the event handler itself.
> 
> Tell me more about the stability issues? What doesn't work
> without these patches? Do you have reproducers for these
> problems?
> 

Since we also had the issue that 2/2 solves: The issue we have is that 
we see occasional CI failures with ghost USB devices remaining on the 
client side after our system (server side) had been suspended, even if 
the device was removed from the server.

Applying a patch 2/2 (or our version of it sent earlier) solved the issue.

Best regards // John Ernberg
