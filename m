Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793233549;
	b=yr/D6033WR2Zb3YLgN+cOXGUhhvUMALdjgku8OOnpAEM+gOhzp02uOAXQoutD2vrespD
	 Ji2h1iln9OzvwAx1vPGfuNtgcMctFtlpKvD8vUTZ4IcwQOG0LfoKuiZ6FgSUj4sz6kfS1
	 WlH1nXtOeF/vczFae7JBC5UsXB6cmXWl+t/mmWCu9m9SmjFsIJ5cA15kUIrdJUE7lFD9C
	 DQBpoEQ3GcT5/N7m3fVzQoLjU8oZgbWYLyc2+jREt2tCNLh4VgDo2i0i/V3r8Elwa7Wqe
	 5pm/mRUxGwFkzWlklnLsb550lg9yf0Emso+9854Q8zOj7BaW/97Yu8PaXA5xjgE8eXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793233549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/jZ0or5mPuMmlK3Yd/rWF09QUTFe+FBPEVbKQ0lAhZk=;
	b=GoXB/948eaSSCAcIibtgOf57TrKMC3iCTHE+YthliN5MYbHKJCqABuyoVrjSlS9APMjO
	 fVaXc0G258fdMDKIKo58cY4PtOozpDVuyTknqxwQi2Groy1qQTXhSRp6SPRzWhLhqxrtm
	 YdanutCK2PJP3EJpYUAmQDWYSpt9L3hTzwOllPtZJk19+3vquFN/Fh/xzEwtXhBOdpPRt
	 A94NDcYlT6skVlDwWNJ5sArA86MAcJv9IVLemrlLL8eVF5mci5EhL2nbQEPBMIxmN02py
	 iswtEZdvA0i+s+jHompJYeEPIHy8PRiZa/6RF7x/nUwZycbttRoyl1+q+kfJ6vgE46A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=O3DjAwXv;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939CD606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939CD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=O3DjAwXv
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so12755635e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793233547; x=1793838347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jZ0or5mPuMmlK3Yd/rWF09QUTFe+FBPEVbKQ0lAhZk=;
        b=O3DjAwXvcmfr5kDYFnc/K/mxGrf8eceZg7mSTbfJyZidNOSerC1PBaqSrnEOjMtuJm
         +8+Og/+ZSKxUpclDaY1QPS3enX/prf+R2uSdPWdZRBXfjVLjOfinhjmdpWiAsGk4YrSp
         z1viV4MXRkXqoxWbd9n/3s52flD0t+kvLgMrUZr0GpV768drO+GT5GtXKLF/dvZ2Opb6
         +5BfqtWJvmmRN0oV9YVrn489nxzecTs/tgFRjt2fCRSIYy7OwIYcnPwJ2HN2+eS4jQeq
         BjfqmNaoAEVUAc2TTmYHO3gfhNh89/abpHWzK6avJyNQpZmW19jUgoaRI+8o0WeSfrTj
         DbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793233547; x=1793838347;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jZ0or5mPuMmlK3Yd/rWF09QUTFe+FBPEVbKQ0lAhZk=;
        b=o55qdS6C7mv6qKtSYF/sb4CpYh5F2buoIs1dK4nTho5P0jSHM6VLavO3hQjU2OQIT1
         V3auA2H5AsqRA45l7pKRHnlwNNO2/9lQkMoRTLfGusQve8hOLL7p5Q/fPHnP2WPEIiNS
         9s+eyA3WT67TT4J0OgCTdAVWrNhT4aQGbZQXTv1ml6ewg0j0hbJMaKVdpixHMOouzd5k
         RHKKytZ28FaWF7t27Id9GTLtAjxbpfSsL9UwEdqP681gMJT0HZRqj44zxFRZ2AtljJx6
         EOwJNLbFGUWrI0L+K9Nz9Rb5WXB2OFZIDQ+h7EKj91yESIL7+EoiqHzrGOns/h/Gu/8P
         PaNw==
X-Forwarded-Encrypted: i=1; AKwUvBxdwEdUJUv7Xwfo4XAZ0uS7XBLr0sSNJCO6tOYsUXfIVqPgJGgr4UkyPOgZnNTWcxAqSIAt1mweqlYxuBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRDvoHxb0VBPkv4zLCZ/jEPChaskElCcFdJiniUzwjp6dPdYg1
	lww/SgbtJX3RKUTYmZeX9qUwB3YNnAAPFuMg/UQiYxvbby4RhS7e0O8=
X-Gm-Gg: AYBFou3BaXOFMrNWKTMD1zPvmQIfqKDviuhyie5P9JZsyuKptHH6wADmCglOe7z6/da
	pmsKzDbVaOP1Jz2CuJSRaDUUBg0GDGbrYDL/pva6Jatjs3b167RRYKP3Z3RtnXWNZeDZSPLGNHt
	hrL2lRB4VohOeXFjZrMWGLZNIrFmI3fvI6+wV83llzX71R+zwzRS+yFGikJMGRU6ulm5bh7AyXR
	Yx00qbsIc5yjf/uW/JiXNnrXmeVz0Edwv7n2W+63jtyG9QRKNfzwnfPISgtTDS3eludrrXsWUP2
	/VJNxZMt2dxgXpC8XoIBge8sTjHpGR4jpakEtH9mq84P8HLZ9lSU9pR8WfiaTZWd/kO8kXtfe1r
	vGjyf83bYCfRCR29olj2QXolO2wCcRmsN1hl7xtRwYhh23UUYb1oHz1ZtfA/X4vCVAeScCaHomP
	fglktSZ4baqm/HrIoOLcSBV2Xw3FaqUmpd7HMo5YPR55GYNFVYuicX81xtqg2chDvTwhgRVmv4c
	efq/tGZ5LZnwdBYeT8yNkiM1xliOLCXGpVjbR5GRgyis2TBIh5upxflR2o9Gyvc3jZ8klj1/Fr8
	USC+rKjjt/+KcHjDyCCCs2h/fq8RPOTl10CVF7s9V2FoewQR6Ym7oLfU9Q7GdVepPUUiP24T4rC
	l7G5E0Uk=
X-Received: by 2002:a05:600c:1987:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a9656224e0mr93824485e9.4.1793233546791;
        Wed, 28 Oct 2026 17:25:46 -0700 (PDT)
Received: from [192.168.1.3] (p5b2acd9f.dip0.t-ipconnect.de. [91.42.205.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c1302f6sm29180125e9.0.2026.10.28.17.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 17:25:46 -0700 (PDT)
Message-ID: <3965e950-1e5c-4b52-82f0-9fe92806654f@googlemail.com>
Date: Thu, 29 Oct 2026 01:25:45 +0100
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
Subject: Re: [PATCH 6.1 0000/1887] 6.1.191-rc1 review
Content-Language: de-DE
To: Brett A C Sheffield <bacs@librecast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
 patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com,
 jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028170459.200466217@linuxfoundation.org>
 <auJTCcqMDEmAS7Q_@karahi.librecast.net>
 <auJem0IIOw9Ibiw-@karahi.librecast.net>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <auJem0IIOw9Ibiw-@karahi.librecast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.10.2026 um 21:44 schrieb Brett A C Sheffield:
> On 2026-10-28 20:54, Brett A C Sheffield wrote:
>> On 2026-10-28 17:34, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 6.1.191 release.
>>> There are 1887 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>
>> Build failure on amd64 with amdgpu:
>>
>>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn315.o
>>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn316.o
>>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn32.o
>>    LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
>>    AR      drivers/gpu/built-in.a
>>    AR      drivers/built-in.a
>> make: *** [Makefile:2040: .] Error 2
>>
>> No time to bisect just now but will try to have a look tomorrow.
> 
> Fortunately it was a build failure, so I just left that running:
> 
> git bisect start
> # status: waiting for both 'good' and 'bad' commits
> # bad: [adc8e434cf08c73b0f02dab2c15319315f07172f] Linux 6.12.115-rc1
> git bisect bad adc8e434cf08c73b0f02dab2c15319315f07172f
> # status: waiting for 'good' commit(s), 'bad' commit known
> # good: [85d82e0d7c2dfd3e75d34f35b7ebbf41f45c9c4e] Linux 6.12.114
> git bisect good 85d82e0d7c2dfd3e75d34f35b7ebbf41f45c9c4e
> # good: [0e1dbd1409918dbd331cd9c382ce64736dcf3272] ksmbd: fill in FileSysIdentifier in FS_POSIX_INFORMATION
> git bisect good 0e1dbd1409918dbd331cd9c382ce64736dcf3272
> # good: [617f27c3fa85742e9d468a2145e3676af6b2498d] Bluetooth: L2CAP: refuse __l2cap_chan_add if chan already has conn
> git bisect good 617f27c3fa85742e9d468a2145e3676af6b2498d
> # good: [1476a3a7d286ad7763025337f20bb841b24c72ea] io_uring: don't pass restart error codes to userspace
> git bisect good 1476a3a7d286ad7763025337f20bb841b24c72ea
> # good: [be00113e49ff42c2c007993dd05cf4bdd1c2bfeb] keys: Protect the type name while describing a key
> git bisect good be00113e49ff42c2c007993dd05cf4bdd1c2bfeb
> # good: [6270098a65994bdf26b736b2ad6614e5b9078ad6] coredump: hold RCU while releasing parked threads
> git bisect good 6270098a65994bdf26b736b2ad6614e5b9078ad6
> # good: [41af0a793777ede3f1839bcd8abae92a5c901fe4] fork: release the files of a failed fork after sched_cancel_fork()
> git bisect good 41af0a793777ede3f1839bcd8abae92a5c901fe4
> # good: [6da107042aaa43b05f4c16bee65afc2e9b5f7561] signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
> git bisect good 6da107042aaa43b05f4c16bee65afc2e9b5f7561
> # good: [da1419eb5d34caf39c1f3abad5b95a601a35114f] fanotify: Fix crash in fanotify_init(2)
> git bisect good da1419eb5d34caf39c1f3abad5b95a601a35114f
> # first 'bad' commit: [adc8e434cf08c73b0f02dab2c15319315f07172f] Linux 6.12.115-rc1


Brett, you are reporting against 6.1.191-rc1. Are you on the wrong branch?

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
