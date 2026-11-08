Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174676;
	b=AyXtV2BWVS8dkBggDLrvuDSC8LTGm5b6XjZNHfkb4suzy4lCTJlD30QfodNXXyWq13t5
	 DmVIGWfjPo3AHeDfYm7QfoekggxPF1yVY7lV/d3Y7h1SrjDqOMJZ2sLUAeAhrsPQJMbES
	 BH5ZQSMaFl3akF6jd6g0QvW5uYYs5lMbdBG+e67DbsJtqwQhrUxg4n2HMf3slD+lIXmth
	 B55CVeuXyEqEKj65LbB7orEVN3aEpR69NSAXAZaK/inZR6wSHxTOkwDYc/CE5aswX6nuj
	 P40cCFtD3Oa/O+03464TQQQ7bTP5vpTyolHJRutePqi59J4ziseOoKJkM6zKVbbelrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174676;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kpUONmbT7hWv2Y7CdQy5xxfROFTeKUAU2jyoeqsZvoo=;
	b=hgl0NBsylpWwylwviFm5pxCVK6ai9jHDblXfCFOWy/GQI7pw8Msh646AKr5eMERjbhDs
	 krD8fw6M8YxFik3i7wC+iIAqfMvla7XWU0dUs8yPvaYLR8T4QE9mJOaVMMtVq2wqUFZQi
	 TjkKlTm3IIUvAqSWzLIh2JJXj6WbbgKJju/dw4V5tQSpzk8XSEI5wl/k4x196IKJJMzCR
	 Ts+EcL7qTZdB2b4bQHGmLCqT7Xv173nEovCfkHVtPWXXyInjj4T0kp18Vg4JCFiAphGP6
	 KMs4SINW6VV+hIw7gJO9IJrcsBOvdKN8EF47Vfek1MpSs6aKXnD1gMkMX60+E4RwGpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=rhS9qumP;
	arc=none smtp.remote-ip=95.215.58.195
Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5502E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5502E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=rhS9qumP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zn5fPGHHigpvJLucCOlqEpjKvVEKZ9N35Myfk0UnTS4=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174673; v=1; x=1794779473;
 b=rhS9qumPmAGrvfxmodyYdbUMW6q8h/Jgz3LA+O6NOoGWfHCWW5/dtSjtMisFwWTIjYKb7Y8d
 nnqNuG/Y0XB7OP5rfd0+GLHJ47RMOxS3uuGWjpEPsgXvc7LAKrFAji4/NLa2EEf7BLBoqgvTPAN
 zJoFeKtzdf9SgQQgkXMQRsDkdRkI2NCPA7lONapwYdHmbz5XblqDNIsSrZaTyKL9wxBGlRz37cO
 0BeL8nuAFlh1x+ZBmsThWnuGNzNoE1XHovVkYpNt/AS5NRN4wpap8jC3J6wkY7Zq4pYy6rL5bYQ
 VTQ1DtocTdr3PVOmpjJZr5oizyypR6LAq7VRNUQslf5Fw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb03e027439b5384;
	Sun, 08 Nov 2026 21:51:12 +0000
X-Mizu-Trace-ID: cb03e027439b5384
X-Migadu-Flow: FLOW_OUT
Message-ID: <6f59d8b7-a4d4-4cf6-a6e8-0cd1542c44e1@postmarketos.org>
Date: Sun, 8 Nov 2026 14:51:09 -0700
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
Subject: Re: [PATCH v4 2/4] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>,
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
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
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-08 2:49 p.m., Paul Sajna wrote:
> +#define AW2016_23_27_33_CHIPID 0x09 /* vendor shared same chipid between several chips */

I'm not sure if I should add compatibles for all of these variants.
I would only be able to test 2027, but they should in theory all be 
software compatible if they have the same chipid.

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
