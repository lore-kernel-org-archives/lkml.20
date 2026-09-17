Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0C4D17B6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672272; cv=none; b=KxFtm3szpHiAp6G3I5xawrc96sx3kPRrpV9Y0apPTZuM5rhBJZ/n41D6J8rFauEGF3HpfyzYj39uNpb0FM8pK7RXKQhd4vAH1kIF9EFD56CLCXap2QEU8DHtes7zjYCxOSHUgy5PTQpfqbKTf5l+Jgm650HUalghHSnsOIcD5vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672272; c=relaxed/simple;
	bh=l7nRAvELSQ7CH4sn1sUKhn7MjAfp8cFsE6F+w5LoQAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ganNmrXX8Drb8rCb1foxmDuQHkDCpIEVM/97W6RwF1lXORGX1Gk0JnocNNgF1FuEH//4/pIqoJmT0g6Ky/WqJmgr1HAVZWw+z6cf4uzgS6MtafvhaF3tq7KIC0SnstZzSA3PxxLDzSUtKe390VUWWAtHjH9eWlcEHvg+2cNrBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Z8iRZy1F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Z8iRZy1F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso8980235e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789672269; x=1790277069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFtQ+/AhNQvesI5lh5NjwE0BPDgyrgIywXw9qcn7r/I=;
        b=Z8iRZy1FdP+6U3OfundcG3BaclniCSExaK4+AHN38Grgmi/ZEEDurpuuUsRWg/HnAs
         SQL8xyKnYPs5ukrIQ90CTmGA3GRjVOmynJV6wzFbKGoe3OeP1FNzY2pt/MaG9YLzpR/X
         GxSAlytesyjc7QoI0pfnVUUPM5j1mxWeD60DpElTyaPxLI92jjaRTRGCoRLi/KSoEsf6
         FUwzoKwFC51gir9co1GeZEqkzM5y1t+NS3KLpDEGh3R8uFB9ffKx7Nc4H1UIEbdd+5Yw
         f9yUeqW4/MqsNUd8Rz8+xO4LPfp9rnLtn6oW201NTj93QlBufAHV9JHkNnNzRdg8a+Ih
         RILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672269; x=1790277069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFtQ+/AhNQvesI5lh5NjwE0BPDgyrgIywXw9qcn7r/I=;
        b=GjBa0Cl9SDmi/QKGIhXgFthXqG/lJITuD7rup1002MXuvRT5lDHl6YQo8QamJYrExp
         cM0ACbHrsnaGlIi4k2r71X0XpmXOq+zdZutSxFKLiYBxjPD1+zbjwC/jL8CfBa2m8THT
         h0Qhv9vgHVkR9OFfXgDH+FIF4ou2T0yY0j+4fLfXlagIzpuGgfsJPJyOvJlDuntqFRv5
         YKPl0YHSGtpbHXaB7D2A1sA2OjbGYhL7OtP2NMPsnKjiCl6wHJ+r8XgfMLdqbQg7NNSx
         66m5DLka4UEzq5VXjk6t5ZjIS85/7zrrv6yKggL+WHmvzUlGRjdcUw3TqJJCRtE73fiO
         TMYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9RChTqnR62cH59EkbSYHoGdgeZQUZlMvcDl5rqWk39Xl7xeN/ehivsQNyuGdHS54bVrFOe4Svqy8XbRc=@vger.kernel.org
X-Gm-Message-State: AFuF++la9NqSkwSTKnKjk15j+bJJraqWfILasIiR/RolkpH7KUqYmhHV
	xTAiJSo/bj+Y4VJ9fr8fzetsQ3LmrEsmrAhnC0mSebqBYLqIl6xjzDI=
X-Gm-Gg: AYBFou17MVLYs9p6AeBK06TjbzFAk3B5nYONezBi+YPuvxF+aUHB7QhEjNeESD3mddU
	EpH9D/Lf1bw3hV0MUQ3zmHUjrXJEJ45zfb+Z6gD0iWGIqyFN3yi+0pbzyJNt5B4FWItPpZBXzaZ
	LFK5m426KcOWG6SoJpvOWc0TBslt8S/bMQvQLf+ca7vkHkCC0nufcZmYbSWv+o6F8Jz2WJZsV7n
	TyGwyQZZ1tpGHXRiZA4fCbSaopTElvEyrkbyJXueL5L02eABN6410PDG3kHZlxsLE7+FwS2npxS
	oEHSLNNLaR4Gsk1iTQsnQqQzvwzgTCI6dpFoSKSRrDlg62fJpCw67Np6r8y3g+r8SxxDcdHxVAt
	rjFRJ7R18hfS6ZiIdTSNx+pS15rcUZCwgM0irk0wgL2Qhc7wYp6Jib2Hq9hpSvwFqnJ6VRjLhAq
	6lvbt2KjSRinNrcxUoAZAcXEUTVaagtsy/ZVNgT0bORjYh3TTf8B/Dg68xPnc6KWwL4pXPseHLC
	GZABScA7qFd66Q6oGJHHsiSAR9wlWB32lwt82CUcuONdoE=
X-Received: by 2002:a05:600c:1986:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49ea528e2f5mr105489295e9.0.1789672268824;
        Thu, 17 Sep 2026 12:11:08 -0700 (PDT)
Received: from [192.168.1.3] (p5b057001.dip0.t-ipconnect.de. [91.5.112.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm117665585e9.8.2026.09.17.12.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:11:08 -0700 (PDT)
Message-ID: <dda6b1b0-5c9c-4417-976a-e20c4ee59ef4@googlemail.com>
Date: Thu, 17 Sep 2026 21:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 0000/1102] 6.12.111-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260917151539.408551884@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260917151539.408551884@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

Am 17.09.2026 um 16:59 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.111 release.
> There are 1102 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

This rc1 kernel crashes on my 2-socket Ivy Bridge Xeon E5-2697v2 server when booting into it. Unfortunately, it does not 
seem to get to the point where it leaves something useful in the ERST, i.e. in /var/lib/systemd/pstore - nothing there...

So the only info I've got is a cell phone photo of the crash screen. I have put it here, in case anybody wants to have a 
look:

https://www.peters-netzplatz.de/download/IMG_20260917_204118_HDR.jpg

I have started to bisect between this rc1 and 6.12.110, which was fine. That might take me a day, though, so don't hold 
your breath.


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
