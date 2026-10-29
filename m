Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246961;
	b=cmZgrvVH3+tJYuw3m/REYop3O/FlEY0bDM8dUJ141cJyOW+KL2qJDvfETW7YfGIi9nFD
	 UIwhmoSGMqWwN4T+bGQoR2VU7g3mBsxLDIlUmgUiZJ3uRXTGW8JNMxOQFbZlQIBH+gSRH
	 eyHt+OlL/3tW9ty/0AurJTVrspi8rFiMzj/eW4pa6TSIyvzDnQ7diM94IWthzoX+v6aFA
	 rldGKzpfA00THTl02Uo3OMy0pceAVxyvGD8DLKwjG31/XTBNUh1dLXOmja6Gz8DyXtey0
	 u30DkNoE+C4RrwZ6tlTX8amVbupDqTlQlZEMnzBoNtWcDm6MYfSywvJ86FQM9xG3YpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hO5E56BpVRLZeIlxDPKo4f1e0ELUqpBl2C419IjueaI=;
	b=1BbjCnLjpf7n8IB7TvPVZUWQlyXc8d9ndYfWdKWdeUfdhp0QTK1cQHByIkSRdhXq6HhR
	 bTt2XnbN2zTRHpfKkBurG7sy6eZoVjmOAVM4MyBlgGR/HrofJ7MO4PcYHp0ddCjp08o/w
	 92eh2MnxC+WMlijVyBCsmDueCRSR2FgXRu2x+W3T/YkM845EYsinL2hvVpRglODElx2/p
	 b57frDJT32hJVhJHZYs4im8aXorEeEe1DEvapesXj1Bx0tSjUH0iBjVbjkvhCb4LHoeen
	 ad3u8ZRLZzdDtJ3r35Dmlm2TXiQVfIOTOI97dBdHeJ80sLvX5zPwUBKgXSHocoJ1pqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ywGRiHsr;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E223B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ywGRiHsr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14688075e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793246959; x=1793851759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hO5E56BpVRLZeIlxDPKo4f1e0ELUqpBl2C419IjueaI=;
        b=ywGRiHsrdDOqbAi0eoB5ZKhtCHR4Av5xyohTJaf3SAFJjcKlDTzQqsHW46/K0DSdfR
         FGTfwdRjVIGySzwQ9zZrVRTag8+0MSgOtNBkVR0zgugh+StgPcTMrkPmZjTI16wRrWHm
         S3JRBRDo645vFAFXQ4G9T2MhioPBDnUJs5ditCr5wZQZFHZIM8kDIBxVLG0lfQd7gGdE
         NrLsbW5vZeWlvGEeTARum8Gct/obGoqWyOSL7Axn4v/bV8YkWGYgoUFRsUcmxwSMsYZ1
         vaA32lIqoEX01mpaXidtSzfhLYdjqJH0nAtuj/azfB1Pcp02k/ufU2SYPdyC5INkmNxo
         e3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793246959; x=1793851759;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hO5E56BpVRLZeIlxDPKo4f1e0ELUqpBl2C419IjueaI=;
        b=F68xoPMzX5HMEk8wNPXntogIsocNrlP06DzGZ1Hw2iVmLNo13kQi3IwhcN2xm28alr
         OcqXC8AqNgzm4jkZKLa2sAC09TBiB0YpTDkUSCwpkuPWVqjaljAayvg/3Z/WiTqpb81Q
         d8t5YEHAFoVGDXUdAgaIjiK/tvzNusbHeYmroTFCz7iq8Wnsp73TTXyuLwaTg6siwhsq
         vVgziO24iyvqdEo142YrkBhq4UqBnZJrIWfr6qrgRM2nEEl251YBoUw3p8U3XqxFpPVI
         zyYEgxz6sNckSxb2T/yJWD5SYwKlnxV9cscLiB0Xg8F4EAJtLlrMjUm5NMaRQiy6f9NB
         Rc2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCpik3URPvV96XQ3uHXePx+0ByLKT/4qB3XvhLPh69RHuqw/hpRap0zoFPyOA8saijjU+lI2PAyGmRTQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuPYg083h5zPiEesNCq4zFLuTVuhRBDLE13HF3C2BE+70HkdSw
	1TrpxGkXKWn5MFfy804CuMaa+D8SZO+ebuJWofcL2n2QTcI3kOf3i3g=
X-Gm-Gg: AYBFou3kcc5cfsPUOoDYTp1wFy2GU0abmZxDuvgN3Xi3s+f5W59vDRDMQvKLalbpnOr
	EJAiese6j18oudzSru3sspJlFUosr5PCu0rIciQYsGZKx2taw5iSP0ceP0QrqsSySevEDyUx4Ti
	i6dwTNii8BX/hXBGCIelKf8eSQCjaePtZhyO+pLZyHjrv1ShDG916YVK0uci2PT1J+0eg2UOws0
	0GP3/vaH2HTPA4YQTK51YTn87UnsuHKQiU8iI6VeZDUEIzrJ50+6meOpcqcDk5BP1tGsrVJIZro
	/76nz2vxaSuz4ovqCVKcjfInV6y2xnbt7xGw7OFVLFtRoOBaK9BQgmSw3IJrHU9NiQWxqYfveb8
	s60oTbwUTKBVrOlctDoFhdE3++FM4AE41+pIszs+9BTZbMfavZLwHgVntXMvHWlRCZVmcHqacva
	3+3Q3r0kHVOaMnUCwxJduT7PnK7QCIz8M2GwDWtmF4xtrBt7gRNWDaNO0rvQZi1ub8lsPEQB6p5
	9OBtMDWAGGZoiwaQALPuGyQeVAs/hg/nKYgW3m0UNGSdAokJ27hPQbF5Wb8AVDpptv0u9GJuu/g
	80oMG7NF3kVZqOD/M+Yuy0bgWH9nXevKI4LlMsUBhJnlbQVCbrUl2SzhPzReJzHmZ4py7OsvY+d
	JvLgUjkvvj3lKJuOATecMUEzn1pk=
X-Received: by 2002:a05:600c:1f84:b0:4a2:9cda:57b6 with SMTP id 5b1f17b1804b1-4a966f20b54mr95998195e9.22.1793246959195;
        Wed, 28 Oct 2026 21:09:19 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac3f1.dip0.t-ipconnect.de. [91.42.195.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm30656919f8f.55.2026.10.28.21.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 21:09:18 -0700 (PDT)
Message-ID: <6be3fa06-c2c0-47b1-8a0c-cc96e5a38647@googlemail.com>
Date: Thu, 29 Oct 2026 05:09:17 +0100
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
Subject: Re: [PATCH 7.2 00/88] 7.2.14-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028165942.107695352@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261028165942.107695352@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.10.2026 um 17:59 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.14 release.
> There are 88 patches in this series, all will be posted as a response
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
