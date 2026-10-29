Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243379;
	b=d3ueBUTNss4bJn21MrINJxX9NmA+7IcWQh9dpknwCzVz6WpSpbOD9HuRF5vQlnnkmlq9
	 LbDQijYVr+2fyluS8nOq+93TZKBTz8iX5xlVhGsbEmbQxURAH7SN5yr7neT4Vt0asFgRX
	 9wwZkCPU1oXiD4BgGmkW2Na0iR7AeH29iMYhHPD5LpkFsOLI5NIXZDUWTGnGpMTVEo/Ti
	 AHeAv5frPxMqsLnNrbWr25uSvblEITqxVNLIz52i9/A4aTzo8hX4oFFPwWweZr+msCv50
	 9ztF6ONm41ZAcP2kNOpYsQ6pJ0infmfeIvHZZDRW9ylnt0m2SwcBr9TzRT25qVv7FGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CQ7TFwD1Lpl02yitbOOr/2bELAH5EFoPsdJfpMGK2e0=;
	b=JgxI13Gj6xSjYlq7mLrTgwaU1hvI/+H8TOLUjtfMhWhV2MQTwM9AWzkGW41rLNsVCHs8
	 BZARZD28bB/P43ogOMct9OZ1N0UBIsSQc8I3LkZLBNymADR5j6HNashglWadp07HGi3TO
	 VuboKvb9YgUdSER4+9Sig0/wCJwvBP2WEOUFBvamegiNPJyVBvsndOIWVQEpiXUp0XmYP
	 sLsQD8XkZyXaiClj8X43T9EkgUZmZOjnXuJiQtN7hejbNf5rBYXvrDa/Le8Z2xTL2h8GL
	 +n78r7der+/rw80i86l5bYbBpBw+SYnyAR26F2hiKhwFRV4fOBENyRd3V8iH3y/lMaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=WCIHzagR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9962606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9962606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=WCIHzagR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so12975865e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793243377; x=1793848177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQ7TFwD1Lpl02yitbOOr/2bELAH5EFoPsdJfpMGK2e0=;
        b=WCIHzagRdXZz36qzOOdHC78QWIYmoApPl1K6zO61+aVSLCtImrkPJEZWgTzvkRLkCV
         dsVu3YIh9u9NYrx5uA8L9BuorUIs3YuImeBXBzMxA/7bf/Av4zakwzr0Ig9vlE6+7pJL
         S6oi7tiOtbNC2FTLJ7GA29Z4g8bzPSEkmKuBKDrJt/yPtuNCxlrIm1NonxSGJORFr2St
         EOuPyLmPVgB5gg1AqWH1LYXrJFAOsId0v8ZRnQVZ5p5dNGySYCCHUHOXvn04K9a4lOe5
         055Wt/mrqlFDvfk+a/I6nXhU9OOx6+Ri1HG38/OcbshKObZuhLwjCFcI9sIorGzfBVu2
         AQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243377; x=1793848177;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ7TFwD1Lpl02yitbOOr/2bELAH5EFoPsdJfpMGK2e0=;
        b=z2aDlS0eRfOV5Z1HOuBtpK+cHRba0fc76pID8qJsDkpvwG/g7oMwEEGr2lMMAgYNbP
         +fIsn/eyph/+LV/1FRba0w81QVoFnlzHLkwURK1HdrbwQ+qIKLzqHwq6lHEf/egICjTq
         uNBUWhG8rdH1aYZwan3Xi2/FiAv1zEQ5yoR94cPEZDtEasBZC9Xsr8lyEsMAtxrhuXd0
         vURK+MCSPktSb+CNBvv8JMyn0YTjgyMTxEhAzgiYq0+N2Jwcm+w1yRP1q8yEGuwTO7tn
         Y8xngAe/zuiBTe1c2LZSX0FD8bBlBVRP6beI1eo5qJFknVKlnntzlRLSnTOFufI8+rpa
         5aEA==
X-Forwarded-Encrypted: i=1; AKwUvBzO0TRtqOdzY6ApO5M6AaFE2rqpTqrBOrTGjaSAGLnpGKBBTJvQ9GlyifQ+EvTGy1/bbhI5cjoYboOOLFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXrwxSj/HX2sYsvIJTm1yOahe6rlctQ18jNRRuaBX72ZXPaZPe
	inlru9wQOrKg1udsZUAPt+sejuAiHZe6npkHxT7VoLEg3YParmdTPBM=
X-Gm-Gg: AYBFou2Idlpkgkw/iv+QcuWT4fiw2F1fqhSEcIOsY/pkfhKSFjg4qOWw444ZsY9twOP
	84ecHAlTEsMc25R6w2Yht5M+9bUKgV6UJDOocXepXIkaHzhV8kjjRiGZF2RsLEwJaO7oZDpAI4y
	FTnkc/l42jm4SJPB2aVIzIs32k+31x35zZBo0tNMRw9OtxM8yP9gjyTUtJN8lGBBob43pFW9zlF
	Ju06WsaK0xQ7TCbrtl9DCRZo8OL3I4N62nuHzgZ0kibjQ2MlPWPeD7xmeS2TIQEGvaMruF1HWPM
	QXKyUiwdp/eKzr/YmAFQMkrhjomO0C7qDGv/Sd0Bw/hiiR7mXH/WbCOZxli87bKBATuOqCM/znh
	5d4G6hyxdnA7s+XhXqcMkPjL6sHWgjNHzMHk0KqoqD/7XnV6p8AIZiT8Q13aj1jH2FePeBU2c6D
	LdprxTN7FYjwfpvChlFMyScoc6oNMQR0Ugelpeku1ZC9gglmxi/KF0dt+n4gmOZ0jRRaHqNRljH
	bIr5asdWmlHxMU6kHPkjwGoraIjstCHe1FTk/BC3TswN+agoES3slo4onfNiThTfn4C0N7DYab8
	AYA1dJzHs4bdq+Cod6lQow949PNAhanJGtouX30aDE8+tyod2MpR44535vlBF9cWXiE2CouBilN
	AljNao1YBIG6VOzXarcCPPFRB3AQ=
X-Received: by 2002:a05:600c:4593:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4a966d361dcmr93441975e9.21.1793243377152;
        Wed, 28 Oct 2026 20:09:37 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac3f1.dip0.t-ipconnect.de. [91.42.195.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm31916595e9.3.2026.10.28.20.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 20:09:36 -0700 (PDT)
Message-ID: <fc3f6065-a3f8-4a4f-a7af-4c46ab58072d@googlemail.com>
Date: Thu, 29 Oct 2026 04:09:35 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/109] 6.18.60-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028165942.357251485@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261028165942.357251485@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.10.2026 um 17:59 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.60 release.
> There are 109 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
