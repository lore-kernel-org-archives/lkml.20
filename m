Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786171;
	b=h/uzRzZmDh2XoiInauVp+cFtv8+U4COyaVQT3cOV4oA7Jkl8+0xypMW9HL6v836bJjZ/
	 0vipqifqKNMafA6bKOaKIvNm29SPQ5deCt/P0cLnfxKM3Br9HI+GCFH+e/aLaEHU8uV/U
	 fGdHtiUjqUbKe6T+0FbE5ZFHx7IEC0vC8m5LzxzD/hAc80W5cbiENT0qTRNLv65P15mYu
	 w4TIyED+P6JYQQYA0RS+LDBQtHtEQJwcqiK7cC5Nvzz4/taQluzqvXG1Af9suFMVVrcZ+
	 aLuX8YY0w7Y2L9qZ31DoGK1wwaK6vWoTkir5rj/Y/in7GNJJByw5BQh3cm2ImFv5Ocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786171;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lL9qicufT73zVNYG6EGMOjl4Jj5VLL/pZOSn5pB20Ww=;
	b=xcvGDq30quO7ljVg69AOw+7iRHG2Af0ioEwba3u4C7TiZpyrYpRFPt4Bz5r6F6kZzwXD
	 YTxyogOWl6RQ3PofkevZbv3cBIqzMAOevnTNFyWAZqvimWWAWoFQJyQK0IR2VL8O+hitJ
	 YgxejQimYqUOpQqNc/+fQhHztsnP3cf6yjKIcQKKvg+Bs/OjcdLoxfbg2/tW3gYG/ZP3Y
	 lAtO4LaNshcQSohwjehyRXP7Gc8avcXv8P8eHwHrHbHquEPgzZpzzBHxOY4YEWHUp4Y4v
	 aPIBntuHbtzAf/8OHk4ENen+KUOwkuUd3uvv5xZOq/exIj2WvYrO0wNs18m17Jy5fSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYIN5SYK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409D4606A326;
	Wed,  4 Nov 2026 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYIN5SYK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4211E1F00A18;
	Wed,  4 Nov 2026 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786171;
	bh=lL9qicufT73zVNYG6EGMOjl4Jj5VLL/pZOSn5pB20Ww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LYIN5SYKVnPEy9D9mVufbbtTbT40tA4eH4/wzRigY7RvSrohXXvsJMI3eNg2Rr9kN
	 zfSlzULsmZWY/qV7pHwn21i8C6uIqFRZfiw+CYh2ojuQhrvamykDCWOIHvXMninTt1
	 l14MN3hPpuoBGqjaKn+nKeRMhgNlsqdKyNT+6Hp/arhpwxZgGUN2UsG9rkN7EKNTrR
	 h+dGInSnQGmE8sjrHzim+ZxbuXx0GLRj0GX13mruUXyw/tDv1Oq4MGucD8AVm4Vnet
	 Jcx25sRQhTs5gN7lPlvNEjDwoTDa8eNNz/hOjF6MuZIPQ9+IwaX7MVnN+NCiViqD7e
	 UaOKrlTwztvoA==
Message-ID: <df1d398c-549f-4556-b683-53fefeaf358c@kernel.org>
Date: Wed, 4 Nov 2026 10:56:04 +0100
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
Subject: Re: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wei Fu <wefu@redhat.com>, Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Han Gao <rabenda.cn@gmail.com>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <ee28bd16-11fc-4b78-b1ee-e0e20bb0cfdb@kernel.org>
 <73fd01b87381e2ed33d52edc4f4bb7ee9ba578d1.camel@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <73fd01b87381e2ed33d52edc4f4bb7ee9ba578d1.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/11/2026 10:01, Icenowy Zheng wrote:
> 在 2026-11-04三的 09:26 +0100，Krzysztof Kozlowski写道：
>> On 03/11/2026 09:14, Icenowy Zheng wrote:
>>> This patchset is split from the "Add TH1520 USB support" patchset,
>>> with only the PHY binding/driver part.
>>>
>>> Icenowy Zheng (2):
>>>   dt-bindings: phy: add binding for T-Head TH1520 USB PHY
>>>   phy: add a driver for T-Head TH1520 USB PHY
>>
>>
>> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and
>> spams
>> with a lot of unthreaded emails, completely disregarding any tries of
>> contact over last 1.5 months, shall we ignore all contributions from
>> @iscas.ac.cn?
>>
>> Maybe this will be the only way to actually be heard?
>>
>> Icenowy, do you have any possibility to reach to bot spammers from
>> vulab?
> 
> Unfortunately as I am not in Beijing, I am not able to physically reach
> the persons; I have reported this incident to my supervisor and I am
> also feeling quite bad on this.
> 

Thanks for passing the message further.

Best regards,
Krzysztof
