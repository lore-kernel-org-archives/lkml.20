Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.181.117.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411340;
	b=EYCjc//KsmSytTlia6KHcfhZLaDq+AFcn6832a1+jeWnLaFnIguTm8v07L4f6Ds1MtJz
	 cv8dFN350BJI/Bq3Hx9LZfq13lf1iFCVH0H+autFWhGsAEdiAwTACf1bDIATToVfd9T9M
	 HZSvBqT/V4jPieDqFz7HZz8u7ObdY25jCeiaaEGT+x/n/ClHs4DuMlPpnaPtcgymS1dem
	 dlqh3wv5y9FoqmgFz7RGuaxSBIWJszBL0e+j7n4ReNwXYUvBb3CaOlY4Ga+GrvFrwfUwb
	 LUvIc/vf/nAhCJqkA01ojcqgESfLL4w/Arw2nKwaCjXqGcv8eB7b805GT6ICs+Mthcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411340;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy:X-EsetResult:X-EsetId;
	bh=mn38Zl0I5ijetFhWRJtk/mApFNozzi2IHfkiTDeT1UA=;
	b=jCKfLthyu3p19m6vu6d4+2zWYtpTHetjWP5rQr63MWpxIOSBbeFABeaVPny3qfnGoDp+
	 DKIySVhwrnJtvW3EK+GQAQCTNMKbXeUsRgcvnta7jYiZUP7zGVfYaXKj/K5nfzAjz4+eH
	 nBxacV3P/R6JVe0n3R78/NbbjtBlTe/+Erohu9g+I/QJwCSoGZDASjqlcOXcCb+0jbGpQ
	 i2EEx4KXfpUHf59Ux16D0MPMbsOq7BJ2J65tm7tgn8hcBmDXBrJfkPFq3X6WCiHvuovG9
	 7qGJxTkbZY4dkWyaUtrMOEEzf+6SiP755PzkSqWf+ea4lolbuzINJEfHE5xaHM2tO3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=actia.se;
	spf=pass smtp.mailfrom=actia.se;
	arc=none smtp.remote-ip=212.181.117.226
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6465E606A336;
	Wed, 11 Nov 2026 15:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6465E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from [10.12.12.95] (10.12.12.95) by S185ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 16:35:31 +0100
Message-ID: <427d908d-1fa2-442c-ac91-b3e925e5c7bb@actia.se>
Date: Wed, 11 Nov 2026 16:35:31 +0100
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
Subject: Re: [PATCH 2/2] usbip: identify the event handler with current_work()
To: Michael Grzeschik <grzeschik@puzzle.ch>, Valentina Manea
	<valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, Hongren Zheng
	<i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <20261111-usbip-v1-2-da5217ac71d7@puzzle.ch>
Content-Language: en-US
From: John Ernberg <john.ernberg@actia.se>
In-Reply-To: <20261111-usbip-v1-2-da5217ac71d7@puzzle.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: S185ANL.actianordic.se (10.12.31.116) To
 S185ANL.actianordic.se (10.12.31.116)
X-EsetResult: clean, is OK
X-EsetId: 37303A29379CA95B667063

Hi Michael,

On 11/11/2026 12:34, Michael Grzeschik wrote:
> usbip_in_eh() compares the task with worker_context, the first worker
> that ever ran the event handler. Workers of the unbound usbip_event
> workqueue are reaped when idle and new ones run the handler later, so the
> check fails inside the event handler, and the remembered task_struct may
> be reused by any other task, which then wrongly counts as the event
> handler. stub_disconnect() relies on it to skip the shutdown of a device
> reset from the event handler.
> 
> Ask the workqueue which work item the current task executes instead.
> 
> Signed-off-by: Michael Grzeschik <grzeschik@puzzle.ch>

We sent a similar patch back in August that we forgot to follow up on. [1]

Reviewed-by: John Ernberg <john.ernberg@actia.se>

[1]: 
https://lore.kernel.org/linux-usb/20260803104342.2790105-1-john.ernberg@actia.se/

Thanks! // John Ernberg
