Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2133515CC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789892617; cv=none; b=n60NqEFuBCx0lpxrd49589pwn5u8xzTsGcLZrO+72bAJbub5MlYL9Pmo3daYoMgCP5JXEK3wZMxmFPOR2N0IF1ILKG4izVkpLHYJOsAnkUNjRN4OjpPfL6Vim/fvgiQLB2eGgGbYZgatp8WtBvKj+ay5kKGaPgzF+dwqJBgNtA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789892617; c=relaxed/simple;
	bh=ev7PcESFwVFa9qTkRTwUckmXc+KPfrq3DAOonZwMU0U=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O0uomwkm1CK5mNd6RXvupit5rfpW9j4p/1txh2yRKGZYKJUzAhKEghUTID0g8xqaAXS/pMfmrgqJSLFaVtn/XoZR3YVO2SshRVKMjJ6wMBabLVAAW4TOwOLDiG4K9ihk5lgW/r+hAnOYVy2FWy1ZHYCe47J9DhSRdkEJ3ijPwRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssNntqBa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssNntqBa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caced6038eso17818235ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789892615; x=1790497415; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqdthH2+u7ccIC4kuTBUygyDe5dzFriIWbVHHdP//7c=;
        b=ssNntqBa0cWT+g0TUwPcCeKUhnPoRUmLuwZMKk/CW4OAgy7zidu4PLl5vHGQvxJSVz
         bBCP2vseMPR9QSkqTL+namnScCb8bZ9XHU46y2cf6sp86w3Wlt0iyJtb4O1uSqlxO2c3
         DNuOFgzbZq7FbwmG1KUQ+nh0EdzwjxroJZO6UWteCpZNCtmiBiFllupAq6Bvx9xDPTYm
         NuFihOBTLJ/6kDwNcvvdaV+ieBPcKJaS6yXWjHhToW45RY4QFWCOFY7m4XsZjCiTw404
         Uu2iR7bD4hVeZsojr9x2LKLaLkVQjSc6xSx2Vj2vNnbS+gZwjao/wti5fli2l+5uCT9l
         E9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892615; x=1790497415;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqdthH2+u7ccIC4kuTBUygyDe5dzFriIWbVHHdP//7c=;
        b=q4Q/dPGT30qkP9W3fpy1krjAYdI3oEYee2KF59ysGP8C7WogaFi1vhSdSyn3QpWIqQ
         spWudCoWf4qE/DeMrkC1NuIABeZCxK0o3mhuw+xeHaEUoBQQ6+mFhE5D+JXRbZyNZF7G
         lZp8rO+xpiqZZfCozZISLY7hl6UEkjxsDBjEx3D96MgdIFqsWfktcbxTprJ/5sPslq9U
         +kzim4WWO+CyKPGMqtq4lHoUpRjnCc+e+AmoYLcouyjwrvUOtIP2H4958pgpHPPzyOyM
         wpsNIJPvOHox9HRBBVLO0xwa5Q4sX7nfHtuPrvmEzsI/zvTx1RahjpGntPpSVvAi2IqQ
         E+YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP7txOFCr+8q31ijzE3ssTeWFqUK8LDHmFiVNDIw6r4KiaYvQZ1xxvm4XUo1emHOxk3Kua8D7HgEVulYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ltBdIE5lare+9H10MeGAEKwYUAPGaFyUwOMkMwrR5ECW1vQG2B
	HldCVLvGIyFfc3c0QHVHNUzDXcI2u7fLOSeRRgDLjLAKVhMkOrVeNpd1
X-Gm-Gg: AYBFou0CgRVURChCIIwvD5VbwQS/LzHuODoYiQybvekbEPLaamdQK3MwawCJN/ZYoKU
	PCqwsKDEQwrn89C2cJk8Z/apdJwJJMR+sFTLiI8v7FwbdAlNzEePbZ1eJz2x3FPQLCrfJ8zKbe+
	ZtSDzZ0hax5vvH3s55WLRgxgSbZFl8SSTJHrnxL5Dw0JorTqRbGd9TpYEL7ejFFOKri+77Mt949
	jJp5GKjS6r5UGZLZc+6vJw1Im3g+hax4oMHKOADsbmrbTQLvGU27zNZofnQzOWM2+O86ZhhEW86
	pbL8fXQPM2UikScc7t+qpXQ2DLEhlN4AzXeI3GTn1pjghlldKD0u9W5HHbg0bjjRd0vuhEIPBjA
	AdO+Azx29N9ywbqZs3VOHjhO1l/3Extqjt2SxxN/CWCds1Fl2BqMaBumOcefhhk9R2iz0lW16BK
	Qad7D1X/zWUuGn8FCX4Ym9Y90WzJHDgUi6LIoUZ+M5J/jw9NXaewf4NbFH0lKUK36qBnEukVzcv
	MudOrhGSoouCUzp2nirvVvWkVjbbBztnqKaNNVNlNgQutFea8EZUSoqqb3IqPCgv9C5JLEwW2W1
	U+l5
X-Received: by 2002:a17:902:f68b:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dd9c6b9174mr152954355ad.1.1789892615248;
        Sun, 20 Sep 2026 01:23:35 -0700 (PDT)
Received: from phui-2.c.googlers.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc1788890sm17346245ad.27.2026.09.20.01.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:23:34 -0700 (PDT)
Message-ID: <6aaf9806.106316eb.1c5ef5.5b58@mx.google.com>
Date: Sun, 20 Sep 2026 01:23:34 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Guopeng Zhang <guopeng.zhang@linux.dev>,
 Ridong Chen <ridong.chen@linux.dev>, Waiman Long <longman@redhat.com>,
 Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Koutny <mkoutny@suse.com>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hui Peng <benquike@gmail.com>
Subject: Re: [PATCH] cgroup/cpuset: prevent overlapping local and remote
 partition creation
In-Reply-To: <25b72fce-5354-435b-9256-482c15ae7b06@linux.dev>
References: <20260919204807.2812708-1-benquike@gmail.com>
 <139d9231-4723-4365-9af7-8142e6581ede@linux.dev>
 <20260920030458.1800040-1-benquike@gmail.com>
 <25b72fce-5354-435b-9256-482c15ae7b06@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Guopeng,

On Sun, Sep 20, 2026 at 02:30:23PM +0800, Guopeng Zhang wrote:
> Should this return PERR_NOCPUS instead?
>
> +	if (cpumask_intersects(tmp->new_cpus, subpartitions_cpus))
> +		return PERR_NOCPUS;
>
...
> Would using PERR_NOCPUS here be more appropriate? This would keep the
> initial remote-partition enable path consistent with the CPU update path
> for an existing remote partition, and it also seems to describe the
> failure more accurately: the CPU itself is not invalid, but has already
> been allocated to another partition, so the parent can no longer
> distribute it downstream.

Agreed, returning PERR_NOCPUS when tmp->new_cpus intersects
subpartitions_cpus is much more accurate and keeps remote_partition_enable()
consistent with remote_cpus_update(). I have updated this in v2.

Thanks,
Hui
