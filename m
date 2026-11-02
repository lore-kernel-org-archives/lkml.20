Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591009;
	b=o0l7l5T9W93h+CwxhKwBeS6rRen8GXNH2VVUI+jW3dhAaiSYjsiLl9Wk+W3bXzmX7IAw
	 Zj0Ly62Z0u4TQJkZdyxOAsYsoTN3bBmICwszS6YlUxutcJ5BLoJwjE36gvKVzWgRU9AMU
	 rTZ3aNONPcZEICOHUlVfjuevRmOvkU5oI+IrMrNrjWIsPOuu9OEem6KGx9Pn+BUblME0r
	 KOAjOVyxA80PZd2aeXd5CmgK1tcOahqvxoUyeG1ChFqwU2ljCBmAIrKC7x9c48/OWUSMN
	 LAGDRy9YIcIpomDe0V5hDuMfxzzjBYiPgMKsiQJq4Bmfs/McK3Sj7GlCyeXznNGO9gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
	b=cKeouHa0gtiK+yHR8WN83toJmTj1R3H/a8T3DYPSzOcIby4Bn2+raGlE16p4rcCpyPQx
	 64k9uuJ3OE8bQAf4qPNgyYVuTJOzaxEd2M3ene/J6zSTU6FFOLu22Ew8BDulnGtcAju3h
	 pWyDKWj++Nt8YDN4FpR3FxlKruISFJZ/kBLSwjkT/xjC6rnYK2Z3SIYMvlXeDKmgQwjot
	 /9QcUM9AToNQtXZt92jXTfhtLu3CwqjjG0s6pUuDSCdw23K63fx5EIrLBzqpXRAj2gwPE
	 Jk6WjlaQCesst5DLykC70M2BHG2Er1deTQFZigfI8jHpyu/0ekziofU9E6coLVZukBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DKH9uDE7;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39795606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39795606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DKH9uDE7
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6f9b24c99b6so989872eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591003; x=1794195803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=DKH9uDE7Q9rddhrZPsvUKZGrNH65QChDq7i5j/79CM1XXs4/s8CRFyFHc2XzBCVt71
         4nqZZzL9YK1IBAX3QgK0krlyFeauysN7+E33ndqtO+Ppqf8XaGrH8/Qvt8r3UXrz7eVd
         DtfMVxP3Nc/CCRO77leMamDRyRsxm+yZUYjhSzJapwDX8nZuMkBxrQBKQytrNGTIF3TF
         yZN99t1CVO2W5zjEFoj++z46XfpbslAVaN7ShiHry/NBGHHp7pimfgSd4lRTvM48mEWY
         Z3CZrhvKlJIh57QD8rXz99Bri68a/nGyzmWUJA6l/ds0YIUoFL0yf/SPseFdWBHBmM8L
         gTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591003; x=1794195803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=mXhlTZOOPt2ZajKFR4rymMwUAEGGX3WZzDlh3a2JIvPaF266anMdHKNshTp2C/hhTK
         bOKrwzT3nmcQ1JuX4LnV9g2sQclGPI7/HLKBfMh2V6l+BpgWpuyyQ6KouDQNj/g1W8PJ
         r36G/V7/+XNarztAWvhgPrD9t2IrEd5BUzeHXmoXeK+va9A0o/QQkbP/SF10Hego+GpV
         p84HPEZKTEbQzCR6OYEUbUvf/ioAc2x9krfGHdpHqRqRntYCsMv/evd0p39S9PX3W0jj
         20040SXOjmBt9GsZWQ276WcW455kmaSn8YIw7w75ksmAXAanPJWeKZ2PzdX6+kT+65C6
         CUpA==
X-Forwarded-Encrypted: i=1; AKwUvBw+A/o/0MViKreKFePJNtFbOAFr9JjgFe6BI5a8Hs0RhlUnIuO1h9MIXPqrBS9Qrag2c35ggFxKJdWtS44=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAatZzIE2BGrgmGdHao1i+mEI8FTzbVQSc4IxZ8Xca3nEQjXA/
	bfbnkoyTUhTHpYnmEDVOtoZgMlPrxCNujSQvYU1Z4igg23HVw+d/RTPCbysOMDKHPco=
X-Gm-Gg: AYBFou2PHFtdEGbJfk0t0QtQo0d2xXpwkaUP+4Y6q6a3S/JtwTTogfSx9nYbN7E9R3N
	h9FblGl0tcXtspwhk/Rb09eX8Xn7j6siAhwXCB6iMGfRmPJhciWjrA7UvCVHU+p5MbL2W/q2imh
	wQusw1NX9xW3Z6U4fU0p/tFjB6Pm9qOyNbt/8f78hz/TPYB/FMQ3UPcqa+l/YLTNyZDqxmpBzYT
	+1NbG+aTlG3DY2/WM/fzAq1gEOayyKEll5T7N3ljzIWKAkjiNR2KTdgUjaUV2rT5raSBY7OqGOi
	0gaDabnM30Cci+PXAlUtYwalilj5KvSi2mGdTxLuedqj1VwB+PUtjTN1fLAikUYKqcAY4AkjXQm
	qAKTr/ybrL8zz9++JJu+1SsQFXVftuadr7W2BciNvqGPTX+7CGSV98T5PsonMobLpZl54aVgKsC
	0CQ7WsDikiPLsBGUgvjHHk2nFkvtbeyAou2SmRhKzxD4TL8md99GBeTqzHUBJQFNooX3rd5HmtT
	DenKf2ip1QWdOtxGXdw/+AMyxdP6oOFA2De2AspLXtSBLS8GfsdPglpdD0RH9gNSDNxtI3MxRbC
	vlHy0Tlp5u+QrqvDAHja/uVWd4g07F5gje5Gl5gurDrQ
X-Received: by 2002:a05:6820:f008:b0:6b8:ce67:77e9 with SMTP id 006d021491bc7-714f1fd628dmr4883384eaf.12.1793591003181;
        Sun, 01 Nov 2026 19:43:23 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2d16197sm7682911eaf.6.2026.11.01.19.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:43:21 -0800 (PST)
Message-ID: <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>
Date: Sun, 1 Nov 2026 21:43:20 -0600
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
Subject: Re: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

Gentle ping on this one, there hasn't been any replies since the resend 
on Sept 29. It fixes system suspend on MT8173 in gadget mode after a 
soft disconnect. I've been running it on an Amazon Fire HD 10 (2017) 
since September.

Thanks,
Ryan
