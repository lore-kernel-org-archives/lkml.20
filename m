Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271427;
	b=zJm3ePZqScME3TL4ZEgmFi49a0DHuFip3L/s/DxmRam4IRjxM7ucg3Kgfn101AT+XQ3v
	 E+pIduXi6QkYCHNozwvdNuw2omEnWBV7emE4y19oDeiM71opFcwik4P35Tl0pxtPqcy39
	 oAjhk3+tT16XHo6Pbyzau/VrICHIMVZq7AGhilpA+lTL9SppjGTyCvzEmEAc7zi2b4HLq
	 jnkyfNaJAp/VCdDULHECy75SlRREhWn8ypov9U2Q00b4qVw64HzBPEU6EIHChlLPUR6Ge
	 M2DFbq9HJCOaxEHE3DE5C3lhWz2SCdXL6y/ftg1AT7TTs/Ir8qmh7ZYRLTvGvalaqxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271427;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DnucIcTgSgzN80YineL0Zf+mFJUStd1WsSHGkjriBFk=;
	b=EEJmgwyQFY1eO/dHNmdXTknlNsZk9AZZZviP6gXecimrFGgfadEm9JeQJC9WTvVNQORV
	 Sfq9Xy99iGnSBslYX/58OXqGHWK0f6KmJnDHpAROWV3GCuPURNkenoGQA9pj21s2Cwl/E
	 IV1Lex30vX3/On1HdvVo7RiSv/8Y1f9XB4dnHVm6aB/oeBaJ/q/sqmBPtop/dekNzaARy
	 PfV+t/mF1mGoqqWEjsRRDb0ZvkdY407ETFnGFsRSXuIxK2O1uNMja6NI9sRMIx5HfIZNl
	 TgsP5JWdXqkj2NHhNeZ0KMKE6uTU4FOBntmoIZ5Sbd5J30iM85pkMVp9TLpjOgW9Cow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rjgM45yS;
	arc=none smtp.remote-ip=95.215.58.252
Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A9A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rjgM45yS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fsMw4fyQIfLqOhX7sbVZ6x0ogMaS6OrkFY10Wfy6qT0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794271423; v=1; x=1794876223;
 b=rjgM45yS5eI8TWT7mf5lTB27TmHGl6IjJQGfUWLtijawcXdkYhe4iIYERHCwl8ROJp57NVRE
 1bJs9AjUvl6ASykZ5cd2fsEz5s4gQhG3E/rzT4hxx+B+YjbZIy/voQmZ6JyHDTeYvxDHVvaAZYL
 J7EN17vxMD4Knfda5pDR/N9A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e92493251cf79fa7;
	Tue, 10 Nov 2026 00:43:43 +0000
X-Mizu-Trace-ID: e92493251cf79fa7
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 01:43:38 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Alastair D'Silva <alastair@d-silva.org>, Ping-Ke Shih <pkshih@realtek.com>,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v9_0/4=5D_wifi=3A_rtw88=3A_sd?=
 =?US-ASCII?Q?io=3A_Fix_unhandled_RX_request_interrupt_storm?=
In-Reply-To: <DE52F1F4-9DBC-4627-BB76-90A2727345F8@linux.dev>
References: <20261107035321.1210303-1-alastair@d-silva.org> <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev> <f2784538533947a38e9d03af7bc7fce8@realtek.com> <162821b6cf0e6d17aa33c81d55a716b553e70579@linux.dev> <23518740c620e5575d5ca5f46aa99f1dbb7e1172.camel@d-silva.org> <DE52F1F4-9DBC-4627-BB76-90A2727345F8@linux.dev>
Message-ID: <C4EFEB7A-39A9-4F35-8531-0F6FAB04DF4C@linux.dev>
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

On November 9, 2026 10:49:06 PM GMT+01:00, Luka Gejak
<luka.gejak@linux.dev> wrote:
>On November 9, 2026 9:29:38 PM GMT+01:00, Alastair D'Silva
><alastair@d-silva.org> wrote:
>>
>>On Sun, 2026-11-08 at 06:06 +0000, Luka Gejak wrote:
>>> 
>>> > Please take Luka's Reviewed-by for each patch, and send v10.
>>> > 
>>> > [1] https://patchwork.kernel.org/project/linux-
>>> >
>>wireless/list/?series=&submitter=Alastair&state=*&q=&archive=&delegate=
>>> > 
>>> 
>>> It might be the same issue lore is experiencing. Nothing newer than
>>> November 6th is appearing, maybe it's related?
>>> 
>>> 
>>
>>Looks like it's still stuck on 6th of November - is there someone we can
>>poke?
>>
>>-- 
>>Alastair D'Silva
>>0493 18 5566
>>
>Maybe helpdesk, or Konstantin? I'm not sure, I will see what I can do.
>Best regards,
>Luka Gejak

The issue has been resolved.

Best regards,
Luka Gejak
