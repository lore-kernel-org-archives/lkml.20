Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166875;
	b=hHIN6i7ufjqrem64/xi/T6Fl/wsuQ6P8TDT8iJVlvDtgsxT7tT9QChlosgoEZFBvWN6Q
	 AQuNqbDS+EkvG2zz6n21SFxfQNwIUnylVm7AGhLnBUr2BOv5D6o1XWtu0U/AAHjv75p/u
	 ADl5CUJFRA2r+PoCT79bFzFEsG3MSDMRJvX2gJ2rPjGBJxep9cPbSrBxESr6ispVxAqKb
	 hw79JwEr0nVHKN9wPoyYmHszUWvdQ2/WVJVZu3F1OtKWgxOMbUbr/LLj312rXcorVQCC1
	 19KDfiZRh1+XGzocHpM2LtTfDCGKTL51ysBBATTmAznmrrO1nGpPul1TlMYFvC55rfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166875;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=804cY5dj+EYM+fofEMnwIGoD9r1pDnjArHDnR2JIvus=;
	b=1Cm7QodJJpqW0SxLiwmoAEuP2MNIyirAJoEeY89v+9iArtcT0UY9mkfqrIDQxgV85Mpo
	 c1QnO3zEqVUkPPWtDi/Z7Zuz/k9hguinbETgCuf+umugcxiPMT5IcL2nkkR4LEIdvKlFo
	 UMLI2Ln9dweBGIpOIp6FVlv4+jd1oubJVu6DtlBvDUH5e20b08RolvaMQq99Btu8yBenf
	 I2VBVdm+2XBVDSDlT1Z3qDR90L8BbtwBqFnmd6nMNK48Tc9b9sR/BO/P0OdAxtsh5KW95
	 gcrczT9mRNYk8jXZxwP6gu1wwVaaynKh/FkCw0gDjqQqHVLQkY/TV69JutEYKOf2dmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b="PL/7JyOs";
	arc=none smtp.remote-ip=91.218.175.186
Received: from mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC84606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=PL/7JyOs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ibChZZZc2dZaS9VYrz9L6vfKqhjux9y1wuYa7AtP0NE=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794166872; v=1; x=1794771672;
 b=PL/7JyOsezqgVF3IwQ+pitRowrrjp7bIiXxmfbo3ggV0lk1tDprpELaC4nvK6MbCZCCisEPX
 M1oB4JScqze2diY9VMCkczfYiaCjqFP+5L77MUNFid+TBGph5nALekK66WwMOC8XL+uE7yInklf
 C6FChInWBUvoxlBm0g2wN2YomUCfwVgjYdVKorTgpfPrERrozzH17fdQ9U+lqcUubg20xKu36mn
 SL7VGvwebvoc541BdaCcy7qg3MblaQ3iEl0z8CO0dLeXamoSzAN8WfSq4P0CngjEPjVlPKrlk7I
 nr9GbV4x0WNpt+z0KumjjM0t7Z5Gj0aZDO3LgSIRp/+8w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 565880af2e2fdaa3;
	Sun, 08 Nov 2026 19:41:12 +0000
X-Mizu-Trace-ID: 565880af2e2fdaa3
X-Migadu-Flow: FLOW_OUT
Message-ID: <5b965360-7121-41ab-94f6-d23b3eace32f@postmarketos.org>
Date: Sun, 8 Nov 2026 12:41:09 -0700
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
Subject: Re: [PATCH v3 2/6] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, Nikita Travkin <nikita@trvn.ru>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-2-cab1fdd050b6@postmarketos.org>
 <179198402838.839288.17911568760182808689@kernel.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <179198402838.839288.17911568760182808689@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-20 3:16 a.m., Lee Jones wrote:
> This is hard to read, I think we can do better.
> 
> Also, does it need to be a separate helper function when it only has a
> single call site?

The function is marked inline, so there shouldn't be any performance 
penalty, and I gave it it's own helper function specifically because 
it's hard to read, and giving it a name helps make clearer what it's 
doing. Do you have any suggestions to make it better?

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
