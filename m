Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135324;
	b=iuAvxbmRKYnmFw5jcsylfwQxXGqFp2rTCyIiHS/mrvpSOfWGIrG8RYQenJpslpXfathW
	 WeNSZoI3lHMmkaBZWve1CeRad1fMXLn0I5Qn1nJO7lkkeAxQDQxA4NHAya3OC8riL9YK/
	 15bRKRw0wJPm6E9IFnOKOY3wTpbOMX5rV3Sf14GvUJicwjm1fN/Vi+V06xSawhYrtCCGE
	 MQur8cwRf2+l83RZINW/i1qazaHtKmx6DAXrp85zYtwhGTiJAq4BjKf/RW7Z8UMZPLEId
	 wof/d9BLtHWRWPcXf/fdaQSFPJqqU9AVSDyNPdVEvefWWIeHqFpFl+u4/C2w6CqM4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wBbCfwwWjZkUqDc8LVdfW0e57s/UTOwtgRob+ow3T68=;
	b=Ah/BNp4xoy6FKas6/r7rm87XOXlet6GZbGThZA4qiK0XlspZch9jNTqr+oOkefh9jSu9
	 Wu719puKpHsBLIE9iCHreEedCAzT8vl82jdbsiC5h/qUo9+9W7Iwms8dpY0g2h7JEcymP
	 2N2Dd7+TkEmzwIXybNqpXDZ7dczWt1L1VsH6AWK8RvPxH+GAci4c5lYSLvEIxZ1j6zoVI
	 t8OGU3aS9koUCoy28z/VDYmeSfFvGKo1XdDJ3bVpQxuCXozeEqveZEk0OlFpKtvAvsVTk
	 ZDWJAk64ToWoGjhIef9txZgX3FG4bnncveu3QGDyB+xf4Ku63stR56baDBd2J2t7bAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=Eg7+23UP;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C46606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C46606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=Eg7+23UP
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-499f20c7054so193465fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1793135322; x=1793740122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBbCfwwWjZkUqDc8LVdfW0e57s/UTOwtgRob+ow3T68=;
        b=Eg7+23UP50mz1Qlv4ERIvfc7AXiy6cSmsmUGcfTJxfGQjKjyzdsj8D6fw3s4xmZDnI
         VP91qMb1ybsGj6pD9yNkNTp6cBc9/dVmfSHxwMAL7PpucHcjT+fOv1FCL6CDq7R7m4SH
         mFY4vqFg3cSfRLV8ET4CFNxDmM9jkUZiTOrzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135322; x=1793740122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBbCfwwWjZkUqDc8LVdfW0e57s/UTOwtgRob+ow3T68=;
        b=Ye5HcTQqbk4tTSOPCsrEGgs/Rz9zAL6cKUPreom9mnFAAqSTuLQmjHHGa+N40U4UBG
         TipWfxDZYXBbM/khHI8vwIU4YzdcDdTacqRDX0Tx5rEngmiLy5O+QTH3Hs0JmQYoZ9Ia
         3QZh4+2qo6g48JpSs4pzxcBEmyb7EVw6OwoTDQdFOD96U+v0B+hW30HN1RtWYQGF6cSN
         i1COrbPzygovllgEfqNE83tSYkbyszfJXf21th4zVoYXQfJ6flkW5NmmNgj0XKA7Jk0U
         LfzBYKf7+gSj7AfLElcaIYY9/R6a4nauX5zZAH48BMX2TD0dAn6++RoFYSYMBX1EasIz
         Q+Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxhm2u7O6d/54ic+7qi+Zb+/4uPE/5Dia5UsvYgVfbwc7WwQEoQLKhbN2eHzK7SJ7YC2taDaC/MpxIFAEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/6+JXw/fiDFw24/k7FtVufQFKj3dEI2fqEY92idWKsnq7RhqV
	z4kTBj2SGshP0Yf4FtQzCYV/Z1TLh7SRsdfNHkX4SEeNT+Ah/y8L3tcl8A7Nnxa8pQ==
X-Gm-Gg: AYBFou3WCqFIEwiJ7c3+7qmz/k5ReHa6GTOKO6E5uSzxNxml6OAIv77XwPdEuP2MqCF
	9QDv5C/1IooHvI1yAe+kSUReHttXOiPeMHH7ZJU4+iIpgu6IoLbIVeR/BiAEHLKj238pH5KvCjI
	hfJ7v7BTutxBWSJDNGEoFQs2PfnssLBXxj7Ke7qU+AQlxAl2/GVo4RH6nm61WIgJJmxaaQjm++C
	X+J4m7AN+cZTzhcZHhS/qM0jKS1Qme57MWkBwO/pz9ZSKBHa/6LvXsGT85FZohuEacQLD54GIn6
	9F0PA5K7D/Aa9/xqhmGDDKIdzxS3iky8kqvZeBK4Qq0NfPYYTXqW5RvtBKiER3GUsnMn86YGQSK
	+RM7ukhTCI35i8m59Hh6xCep9w1EsWp9qa2d5DLo7pD19y+aZHA4txCCoP04uVa6/XRyQ2MG/QZ
	P97mmSv26tOrIuZHSccrtVuNP+HLZ6lsHMwlLYZbAUgKtEMKHhhsdsK+kOklsrp+aFxyOilszYR
	0BD57oaWCfpfk+/0orYTiOlkwQXZ+pee75/3gVNg6nkkdjXkdA6xkj4+Aye88SNfPyzkzsdrMrb
	yCtBs8j4+LuVXmikhxfN4KaRNVSsunf44poYvqxtlgyT88urK1eQo5Bd4yd1gBlSgT3oBQAVSmF
	EJo0CneUEDiB+PVKh0PMXod0xvSlWk/qpv+X1BPUJr8wokRWxTboeVDfR21QBnx2B1i6SI3R3eM
	o+tUietmR1OgPSTm8P9rFUQcDeXUzwCwCjMw==
X-Received: by 2002:a05:6870:1410:b0:49e:4ed0:11ca with SMTP id 586e51a60fabf-4a8bbd30979mr536120fac.53.1793135322487;
        Tue, 27 Oct 2026 14:08:42 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.252.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm970446fac.2.2026.10.27.14.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 14:08:41 -0700 (PDT)
Message-ID: <111a2ccc-a1d3-4516-89d3-897823e05331@nilk.net>
Date: Tue, 27 Oct 2026 15:08:41 -0600
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
Subject: Re: [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and
 autosuspend
To: rylos78@gmail.com, Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Simon Kruse <simon0x+git@proton.me>,
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tested on a Surface Pro 9 (Intel Alder Lake-U, i7-1255U, IPU6, front
OV5693) in a 7.3-based kernel, with the series applied to an ov5693.c
that matches the base-commit (d7e7bca71698) apart from the pad ops'
client_info argument, against the same file unpatched, using raw
captures from the ISYS video node:

- Patch 1: with the sensor held powered between streams, OUTPUT_SIZE
  (read over I2C during each stream) matched the requested size in
  32 of 32 streams requesting 2592x1944 or 1296x972, and every
  stream delivered image data. Unpatched, it stayed at 2592x1944 in all
  32 and the binned streams gave no image.
- Patch 2: raw 2592x1944 frames are BGGR at all four hflip/vflip
  settings. Unpatched, the order is GBRG with exactly one flip on.
- Patch 3: with autosuspend_delay_ms at 3000, the sensor suspended
  3.4-3.7 s after stream stop (the delay plus the 25% timer slack),
  after both 1 s and 5 s streams. Unpatched, 1-2 ms after a 5 s stream.

The test scripts, the analysis of their output and this summary were
prepared with an AI coding assistant (Claude); I ran the tests on my
Surface Pro 9.

Tested-by: Chris Simpson <chris@nilk.net>
