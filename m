Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175703;
	b=CUvGJF6SeJ+nwcBNsip3T4NDd8IyKASKyGrAy0YL6v3kCiqygyHHBqo4dlmcACFnMc+J
	 hb+PkshxTw9xyHg5yFVoRwgmyDK2aFwTdotriHAe1ep3QUQkMZRju9jUCmrUSSpEEp5iX
	 4zHbsmL6uO4ZlRIpAE9JhTk1SC5n7AUnBSgYVhb/TFGIJLQx2Li6gYBNplKY0IbgEqIKP
	 7cEwmWawYkbqLPjfLoJ3pJgIebxfA+/Y7wCUMfOq695JVN1FU8ndb+rW8FkM39VQCjfHW
	 Vr/ftyexk17kfs2jE1DUPBH9CUoEqOqJIiCQgzdgkazBigKFgRqhnw+1v14ydzApzRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175703;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mP+RLv7YA3xoEcSdhiubfekWgYbf7a4Mqt1EnFS2l2E=;
	b=tQTiyWeABEwmaJA/RjnLyNRqYyMd1OICUX3BKR7IRxygenF1TKub0B9k2mzf0tliFaKA
	 KqNREEgKD8YsqslisM9QKsmsTBvMUDF+dLjP1FLOE1nZRPQ2cw8jQ44qAgzwtMEBenXwC
	 AU07v77niH/WtF7c75sZxmcKXpxG17yko0m/DkYsDEF615Ly4kTwh0J6laVf+FFxxSXhl
	 OM0lYpT9xJndVnlhCUqWWQI1OBaiSxYw5O6DWerIm2eI/AIuu/PLo7Qb/Wp8DEln1CKNc
	 gxpPBjGGOsm+W2iOrhAmS/GpPa26jjVnfKPBVbpJtT3pWsuUsZDLEs22lGt4yD64asQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=I59MaAEe;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435CD606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=I59MaAEe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E9GlFD/nkAV+QrkBwclW4eEowvk8rBIRknJho/hf9L8=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794175700; v=1; x=1794780500;
 b=I59MaAEeCdaKCfMuUTHPbIyVzbfz3Pm73y6uowmDLnatoZBgMnAoNKXERlrLKeNuoF6PAiaa
 gOWLTe5to8441RYieziKGyelF0YQZom3ZvDGCv+pkIdn8Nb15XvmMENYaWnWYTyesATF97ejHwH
 iXXLkBh/ErBvRteDdtryUUWVITO3GowgFIKGpEN7DtgdW10I5ZeY8+HwDFt3cV5vX4ol2kZ8iZ/
 /4gCPoSX3mKUghd2jKKcwZgViMqDFf37cg3amH63iwaTbP0/XL9EElS6bbVqrFuJTvhHkxDhzQW
 WSCvT1EVtMvY1Mm7Ur/iqO2PvZQ10BO741gMI0kbQTgXA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7b8502a391023e8f;
	Sun, 08 Nov 2026 22:08:20 +0000
X-Mizu-Trace-ID: 7b8502a391023e8f
X-Migadu-Flow: FLOW_OUT
Message-ID: <ea9edcdb-cecb-4fe8-97d5-1dead1ea8fd1@postmarketos.org>
Date: Sun, 8 Nov 2026 15:08:16 -0700
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
Subject: Re: [PATCH v4 0/4] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>,
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
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
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-08 2:49 p.m., Paul Sajna wrote:
> I'll do my best to address all of Sashiko's comments, but it might take
> me some time to circle back, don't bother reviewing until I've done
> this.

Hello Lee, I believe I have addressed all the robot's comments, and this 
is now ready for a proper review.

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
