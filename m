Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260956;
	b=Ga1Uxw6K1UpuFtBG+1/yR+gxcAV6+1JkWNdzRKU6w6uudgt9fi+qUAOiLOPiq58Pm7b7
	 9eZAZnXdTQLgZGFctVrVtUlj0QP94MGx3li1fjM9C7Kc9Xg2jkMFqrtLKCJrDMmNroBjq
	 L98NDqRTwg/UFVjdhbUmdw3hvcud8Fxk3eoL9LifN9D7Ox9iTzeqpUwXwwLRl0CZzGHcJ
	 9E+hMx2tjzoQAVpnBrgU27OJ+sVr4eXq6CqjdqQXrVFWlWZvgfe3kFq9JXyiqJQVmToG8
	 wsnFS8sAVBbdM3WPIGDfqRqeA6sS/0vAO+BCkdpW8ls1OnK1+yNtlQ9VilKzDG9MlLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260956;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hD4/rOBor8vuXy7+FBslFmkGihyycuVPMTbcjvsGkCs=;
	b=TVL9R3M0EF1q0825Y08zCwfVEs0Ff1ZNXb1yoYF/QOAjIX8I2Z49xxo1Ifj02WKv7SsC
	 LSZyR2qiFyrzV+1nsIUMiroFQPvgF7XpaxLTuzGY4Ia3PMtjNOWgZ9YuXiup9JQnNTzCa
	 TbuxI2PG2XUA+yH9bMvtpioY0zRoFUjnqYA+o2hQMXXv5fbeB3DokMOgIge+QGZJ9Fi2p
	 JCO+AfKG5TkzJBUlS5CEg76M++nS5K2kHkjpqWRrY3Tmiq4Wu0Zxt/dctaYHPQSVbzTH6
	 XDXDtwFyuZYs9BCfp5lRErCgF+anIRFQ6oDt1uoFsoXYKb35GCnxY7z7u6lRwswxwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IwAHBzog;
	arc=none smtp.remote-ip=95.215.58.101
Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A4A606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IwAHBzog
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nOiQEYuSoNBv1LoQFek3ZETD1fxVkZfpV6TKA1yBp1c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794260952; v=1; x=1794865752;
 b=IwAHBzog+whtqfF3z2P7E5B0HdrMiktrlXFGvgiNL/MhO1f3H5FrF1rWSFrmGCFYunIq+Bij
 BlyAusF21I1a5dqJHHnnHAx+OdHyJiSxYAgHPzOgeFcXzZdYChml06mclSY9cQDJWmH8iWMX/Ek
 hd3OON6X9y0nY6uL0Tas4/eQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e82d086895ec596b;
	Mon, 09 Nov 2026 21:49:12 +0000
X-Mizu-Trace-ID: e82d086895ec596b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 22:49:06 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Alastair D'Silva <alastair@d-silva.org>, Ping-Ke Shih <pkshih@realtek.com>,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v9_0/4=5D_wifi=3A_rtw88=3A_sd?=
 =?US-ASCII?Q?io=3A_Fix_unhandled_RX_request_interrupt_storm?=
In-Reply-To: <23518740c620e5575d5ca5f46aa99f1dbb7e1172.camel@d-silva.org>
References: <20261107035321.1210303-1-alastair@d-silva.org> <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev> <f2784538533947a38e9d03af7bc7fce8@realtek.com> <162821b6cf0e6d17aa33c81d55a716b553e70579@linux.dev> <23518740c620e5575d5ca5f46aa99f1dbb7e1172.camel@d-silva.org>
Message-ID: <DE52F1F4-9DBC-4627-BB76-90A2727345F8@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 9, 2026 9:29:38 PM GMT+01:00, Alastair D'Silva
<alastair@d-silva.org> wrote:
>
>On Sun, 2026-11-08 at 06:06 +0000, Luka Gejak wrote:
>> 
>> > Please take Luka's Reviewed-by for each patch, and send v10.
>> > 
>> > [1] https://patchwork.kernel.org/project/linux-
>> >
>wireless/list/?series=&submitter=Alastair&state=*&q=&archive=&delegate=
>> > 
>> 
>> It might be the same issue lore is experiencing. Nothing newer than
>> November 6th is appearing, maybe it's related?
>> 
>> 
>
>Looks like it's still stuck on 6th of November - is there someone we can
>poke?
>
>-- 
>Alastair D'Silva
>0493 18 5566
>
Maybe helpdesk, or Konstantin? I'm not sure, I will see what I can do.
Best regards,
Luka Gejak
