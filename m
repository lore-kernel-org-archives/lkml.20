Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783325;
	b=DuLm9mm9C5ygat7fKEDbQJQfIxnQHcY31MXjBD1Q15at6Xm/MzFzf7vYWVVW3+KkZ+CG
	 7cIsMoKCCwM7puRFdlxFt9YWnez1l3mpqTEvS8wSZTdOPQgaFMRi+WsU6EAI9dNB/0IyC
	 nOSmxQVVdhzFCRTL+56EDDSZ4YZapH6KlhDmcOHx94mH8NDjeOWm782kZ2t5T3wW9ead0
	 qc2MLk4B3EIrp7U0gEhWIBfH6ZY19DMl00Sf3xcbe4F+mlYSkI7BgYY8v0xSvW9+tlHT2
	 1Nvmltgd0s+SbKpd4M1tSJw0qmi0p2KtFG+tOo0DL+tPUILBNznEk/gIdQ9h25XFAQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=X8md4aIOlBkmqH24qYW8JCIeNhHECyEQ12dw77+1DrU=;
	b=3lsqCHjmf4nFJs5xqdaObREE38kHvQxQUeitAJeYbfQFze/NUV+KlB26ry7yOlOta/vW
	 ownJgj7AfrlQE6ZW9eH3i0Ors2V9bIAT7Tv913Hltjs9NWiITYt+BqiAAppNsrmNSF9Bj
	 J1o/InFR8zFMPEH77Lzjm1iRAqcbYcmCvJPBS1njqBsqbPLKJHkx+3oDalZKDM6qF6UKJ
	 E4CP7650FyDCgTYZAO0XiGdoQbZ3r2Yvq942BdDscG6ULDqFFEMKOd50YVaLjeihvx2ju
	 Oi6xXhU13xj9Qgpuem0YDullRjkfF8z/Rb/MzhgK09Qqc321YPP9SLKbNlKR0c4tAhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y+XSboLv;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E143B606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E143B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y+XSboLv
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d68de53053so655018eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792783324; x=1793388124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8md4aIOlBkmqH24qYW8JCIeNhHECyEQ12dw77+1DrU=;
        b=y+XSboLvXqMt5nQ+AIFuokPobL4LkcbVHjbQr5cyCqjSTy6p1dE1uWZboKKKrxpgyG
         7GNN8mNzaUS6VD7MAmcQogyctAAZQBdtdgV40OUvqvHA0QhtLVq+MFvUBxnlQgI3gQbp
         82HCSo8DP66GWta4Pi4xSkzG8NWnil1/tlbMc/Toj2QOypIOdDXSO7T/ykmKbWMe3brY
         wIA3CjBGaQ00f+EdHlO+zluPbRu+Nf7WV+dEDZ/0JqQkQuojs41tNnL4iLes6+v5HzPt
         Javcl4XmKoInKUhJBHerqt6X2yWzbDuzp661Us917gNhwya3BOL2+WB7iT4rZIgsYIaD
         0mIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783324; x=1793388124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8md4aIOlBkmqH24qYW8JCIeNhHECyEQ12dw77+1DrU=;
        b=mBASS+EG4kl8R+Z0CefM8rv3WuVbehXdYMJvrwGfeFUwi9ryuMO77ka497wTEjEKdj
         uKHVeLLVFRiSGsLFZURCBt2UpqoVmdsaZhIHNQwYWx4yoP8RetfnVD1FnMEdV3nVzflw
         6JYkRtiHGd/DoG4Bx5uyX2kn/vnDkcC3qnlQB9bsypQ07W4b+lymKOA+5sqorLSawbOV
         MwQzvkghYAaXNSpxCt/+S4ZnkCWJKrffA9vBN36bpmmYVfBDwUEH/9pMVTuQAPb02k3H
         4Qf1nzhB2XqB9jwCYdww9EIHYHke7Jjv9ZihLRj2Dmi8XmuutUQghsdFn3uXJNgtjWWK
         P9Bg==
X-Forwarded-Encrypted: i=1; AKwUvByEN3ZQ59Fu5rQIfg3IeF4wtO2JVioNEydxVuFhgtShrYq+TQCKAzPr5P3NMVyWpjY1Rcoc4EOTAWAGuQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIewgvSypxhrmN+HLVECnHRE02vGErfgC5ucns0ZRlIi/Qkm41g
	jyD9VnmMapzAJHgxdX6GrPynODfv/sg83zQK7FG3ZIs+82ly0ENo6/q/9oV56nQUcMU=
X-Gm-Gg: AYBFou0t7yf+vUgQ5oQ4n/iwtezlBFGP6gk1eC1at2fOpTyezBVWGsvpXDisHBP6ItZ
	aNEVl2Nx7Z27xgo53bTu+nwgBd6xSekWN6h+AZNJhoEN+r8dlmvUX652hsdIMob/HjFQuwNy4p+
	GIL3MQDrfCoc5N4MfxvRlKAloEFH4conXGObt5B7njLLgNy3fXlmb0pca8rxqlD0VUn1H9ZCQT2
	ZInAqsJgRkiT8zre9yJWAnDyyZ7zJG/9jFBiPyFqlAI/xUe3yp4gIXAYNiddqwkCVH0HI/RgxxP
	ePKIyoIupreml9MHYHNzBg0qDXHxof7QZ1N3/Ao7a3SliShVdB2om8fEh/pHv4eCMWq+FMDwuQJ
	h+XbmxOx/cmVbVtEcCwTQhVgkSzTSgdMNxAmToyVMHFDuy1GYGs4l1Urj2rNzBjzDh6LAlH8/Fa
	Lej8A298OPb3uakiM1xrmSqsOhgbiulMXpB0eZP2Sm7w7EVbmexW9QIeXduWFOBTOOG/D9woDSp
	zJWoKkMwF7kIeQY87Xf+sYAaFP71SNgimAtX9Z/smg+MUBtgr3lJC8I
X-Received: by 2002:a05:6820:3404:10b0:70a:df8e:8f56 with SMTP id 006d021491bc7-70b88aae418mr1419523eaf.78.1792783323778;
        Fri, 23 Oct 2026 12:22:03 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb649b53sm326403a34.16.2026.10.23.12.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:22:03 -0700 (PDT)
Message-ID: <cab7475e-8151-4843-855a-5aa47f75272f@riscstar.com>
Date: Fri, 23 Oct 2026 14:22:02 -0500
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
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
To: Conor Dooley <conor@kernel.org>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
 <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
 <20261013-stump-reactor-055d05dc5b3a@spud>
 <b904f4ea-e198-488e-a6dd-476d744593da@riscstar.com>
 <20261022-clench-drum-5907c17cb8d2@spud>
 <638e0f29-1ec9-4a6a-8777-fecef1bff409@riscstar.com>
 <20261023-bok-thong-0181aa7f3867@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261023-bok-thong-0181aa7f3867@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 1:00 PM, Conor Dooley wrote:
> On Thu, Oct 22, 2026 at 02:05:12PM -0500, Alex Elder wrote:
>> On 10/22/26 1:34 PM, Conor Dooley wrote:
>>> On Wed, Oct 21, 2026 at 02:50:41PM -0500, Alex Elder wrote:
>>
>> This syscon driver and "sg2044-topsys.c" are awfully trivial,
>> and they seem like they could be wrapped in something along
>> the lines of "simple-mfd-i2c.c".
> 
> Yea, I guess there could be some sort of trivial driver that covers
> these syscons with match data that contains the mfd cells and is
> effectively just a probe function that looks like:
> static int _probe(struct platform_device *pdev)
> {
> 
> 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> 				   match_data.devs,
> 				   ARRAY_SIZE(match_data.devs), NULL,
> 				   0, NULL);
> 	if (ret)
> 		return ret;
> 
> 	return devm_of_platform_populate(dev);
> }
> 
> The devm_of_platform_populate() you don't need, but there's other
> syscons that could use this that contain subnodes too so might as well
> accommodate them.

I'll add this to an eventual TODO list for myself.  I won't
get to it right away but I'd like to see this improved.
We're left with a little duplication of some extremely
simple boilerplate code.

					-Alex
