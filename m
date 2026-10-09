Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7F26738D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584544; cv=none; b=SUcon/bCMNrV20pmmptHD44j0Mmm/vkMjAndVDw39pRpZr1Z+Vj+l1xJRby5ztJ7cn+dxRxv3Y0Y8trwwGz8BSMc0Nt6HpNWMBpQ3+e9FetRCA/1SJvnRvmSmNyzrxaJXdmeD8uvcvPuqt8WzTN5b6TBLkIqKc/FH1HXp15B6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584544; c=relaxed/simple;
	bh=T9C9Dx671FoCAaBeLOB/jLPQcri7Iav3zqe7LP8JH1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oxy5dpy8qQ1c+8Z8XiqvGTsmTAN5AhzOhoP7fFr1yggej99RAb76UaQnZHiSBJoMUQSwoRvxI7VSVCSFxtlVdEXhFE1Wle8PEaOUsyI4flBiUrXZAOjFU5cXrmPzmOZbPQbL9sFZ527DFirDF5+77INyy2nhQCtIeY0mcbByuK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=n0wFScZN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="n0wFScZN"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48bbb06e746so131007f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791584541; x=1792189341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WYypNTC65goxZZkmEPVPlFK5GKJ31X+7uhWYZx08fs=;
        b=n0wFScZNc2604jeffyB3A94pEDdmvky+6z9XbVnVas8wgD8fnSM/nt2Qiq5NG05z7k
         MhyxJrptUY4X/vsZ78PMKoyu4Z6vIP7XHaPTcx1bdeacskDDHP7t1YRMdkxWNjaT+uKW
         fhm0R+0n4NYLbzcUXda+6boygSHRjSD6BCnxWEasUOD3X6X6d2FZYqGoDzFZqDrBbo8m
         gFfw9AbQ5y1PzuVxR2l7eL2vxnl9YxFRQ2kPh7cRo1f6/y0TXDuih7MWMamGN/Bqn8D/
         CTSchEUrETGPGgA8AIMMhENZbtna+rGLjZgq2rWGHFkgmzwdBWlKjBHmrKsw4y57tFZJ
         B+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584541; x=1792189341;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WYypNTC65goxZZkmEPVPlFK5GKJ31X+7uhWYZx08fs=;
        b=2ZIccfHxyp64hjmQShe344ckku9YEfa7Te7WGK90ohZBlQ8t3ugfjozXkXeckSPJ9n
         1A6GL0cd8ip2gzx2BC68gUjNrnRhKDphE3GeCkKR6LAmFFiB1j9wqlKhK6cYnffwhyOo
         hEil8SIhin+fhDhJzQrDRqHaVP2dla2YGD7v6HRvQdiwDpdWPHjCVaUVvCOf+8r9aocq
         VB1KvyXv19gYQzOlrcXKkDsTv07VTKKjXy11xyTB5z9ayjFW+8LPYuoErKX2U49krxGH
         7W+5jAjQsUm1/Dg+1Rx/ff4fOXioSqoyexAEaBd7L7iMtqSwwLUVGzMvGhp43QbZxcIu
         UhZw==
X-Forwarded-Encrypted: i=1; AKwUvByWfJK5UySFDFcrFp2L3gtnRer3JOxzxn/MRAuE5mnahsvI5nJ6NIYauZDOBGVSvU5o9LvJdr7GylexyJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ6S3sKOFwzcwRIxB8yXo6ZmssS/FK/lYhH1bXB68sPD8r1BqJ
	dkH7nCXxoE9ohBcYcRY4hbPQQZqcE6K/qJkLxuIVspw+SafoRR8yqY0=
X-Gm-Gg: AYBFou0Xs+tas+9AOhsVpSTgAx98K9iuYjUR6JvpCB4M0MIfbmhMaKYO7kTCYyKhM14
	bSZP+6ITHetm6EbCvhWkS02sSMqhEtZQ84tOk08s55swc6QFhylefm0fMl9mGBgRxheXuk0szFV
	BsPiJTa6KQRMQ7Q5GdGx8GanSSHTMc+0goxMNlDbDw9xJ1gEoXHUb/c/8NLu3cFbCFENa1SrlL4
	DRrxt3bF4pgBo6/Dn8Z0Yz1SXRmdQBptu2TSwwhGyuUTYPKo//Qn/p90KiJMhCF0tK3Mbj2fht4
	FgzsTXK78+tEE1uDOeKhf0hlLktUV/Bz2RuVjD/57cni3cAdVZaDuqC4dfS7eq8JErWbdwZs/Rq
	rr4cMgSAohhdBrsl8p13LAGygk8uJWF6voc0rcR/XNKWtGC1ahohRmUF46TWXcsTx6psOGBeik/
	2ZPtsHmE3aJoVZ6kLLcLCO2GvMrSWHvguxPgR1pG24At24559Vo/a1p4h9v9O9ghtaSpgAAmWTr
	EjtUuJJWDQDsWJ4MeMYkmP/b66nhhagj6A0NxeziD7lyuHdqg==
X-Received: by 2002:a05:600c:609a:b0:4a1:717b:7976 with SMTP id 5b1f17b1804b1-4a18e4b15e5mr64393555e9.35.1791584541444;
        Fri, 09 Oct 2026 15:22:21 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4680.dip0.t-ipconnect.de. [91.43.70.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm93450405e9.0.2026.10.09.15.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 15:22:21 -0700 (PDT)
Message-ID: <be5d217e-ee85-4596-a8c5-30c1d3202b77@googlemail.com>
Date: Sat, 10 Oct 2026 00:22:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 000/428] 7.2.10-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261009140946.008206689@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261009140946.008206689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 09.10.2026 um 16:05 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.10 release.
> There are 428 patches in this series, all will be posted as a response
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
