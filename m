Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710978;
	b=SEUYH10RmmywVU1GHC09hBqsGpmSkUQ8mg+qUxp37d18ToKgZ+ehxqOpEg6JLIVE07rl
	 WH+JbJAAdb4+Y/HbTwHfeI1DBNirExdYIrrutJ9EgMGJ80WTYy3iYovuQFsidDwS+AYRY
	 4cnf9z8H04t7ohL7is4akkgWZ+0+6tymuPXHmdhOQuGECoAMdPLfz+Q1SQTE5woiItfPC
	 c6Dnuu4P0TNjwdwaooiMIekrJhalz2N0rVn2pvUP2JblIaCote0D7JMPyN5v+xVWkGodp
	 ensTi6CYNgCOx0KCFcZwHkh7dTQs1X/H0/57G55POk4cynUkwrXSPyF/1fs5sLFKp4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
	b=DH/LQglCHyh9ELXK0EQcpDhW7x4SYhqz7SRlmXtoZX2aInzoj9NeaQuLxZ97X0HsXU2G
	 /y0lDoCtkY6kARudrAmSpeE4AmOh/uzA0pFsn509KgripZZxcF0DMOgIljC6JhflWwz2g
	 4EZ3678Vq7RN03AXf4GllK7SbbRRWBYVTOT8LRUm11jHxBNVd/nAkbTXbKK3Yazvqi6vx
	 u8/Zny6ZEFDTBgPRkUIoCjm4TuOoNm6oWgErLilHXkV4oogOiJcbyUP5jdCPjWJwzpjTk
	 jBHLs5VbfWzb+yMKbCyYPoWpNkgLk0n6nCRIpffg4pL3CK8p2D2vJla2H/VMxojhwVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0J1OrXe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25428606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25428606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0J1OrXe
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91befe703c4so39807796d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:02:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793710977; cv=none;
        d=google.com; s=arc-20260327;
        b=gYzSc1+Egn5iB7VBy4pSa4WpbLZn7F+7FE48C+iqiAumvKqtUM4vqHTaddJNZWIBo2
         MQoCbnRIREAmzXVkIlVaHVn4MOgDXmJ6xIgrWmVY1Mf0FdqILlqJCP+jaBaOpcHJOdV/
         ydDCVKeBOBWgbroOa4vGVpvV4z6mflPvcQcW4WfgF3F7Oj+dh5yZqlmlmc4PAz1YDbJm
         Slng1mXR9oBFqmYmaMZ29s1QFYltN7NVGkaFX5gJGV2qiqb7SnSRIeRL9Y/GQCY/Tk9K
         kguzWHUoyFV/3X5v02cknsqpm4S3JfOrag3XKuZmRGjGDnYmsw40eEq08pzvhMTpjJLt
         LHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        fh=Qyk07H/5/Cx82L0ccIWbEwqdj22LCNGuIfn5P4Jr13g=;
        b=clIUOMknLIAkhLDB8nlcSNFL477lUq1cgOV/eb6vI5uCcKKMgbGgV8x7unSuWYYv74
         M7Miylphttff9frO5bjTz48IPn873rY4rPvTNLBZPmWPatzIZ1d6aYHSsGC74W/0P60c
         /sWVHtNh/2z1jbcMfaeu1At56vaQPpQBfiGmyrF245UNP5XjSDEEpyTbCPMy6ckbhSYL
         fY2gKI3MM6mCl6y8ohf8tPEE79p8qXeuj6k/CNaAIX9z9qYBwQJ+sptb5a4kAlvetYv2
         NGyPh1NCRz1kengAv2VXE8+qZzIGA8dxNA18qqNGF95a5q/uEaffBhsHO/TaYqS21/3i
         kSzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710977; x=1794315777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        b=v0J1OrXeUMPEmEEhT62ssZ3ErEq4u9Fiey81vE5lfj9wYme9hgrRMzBDKfKooflQgS
         eZdeGpcj4iTjypeLMMbRFaCyvNzimAA43o2YWCrUDXmOy/uycVDcOiQfDTHF0QK7HrOS
         djEB0ujJ5N+KMcZkV/NBlWQEj3Svm9CAadJvAqlkER1rmRsjH4fDc+yZ99JTr3xiF7aL
         Ik7C0GrsEywAJcI4vzpqmn4duAKSCbpBxYWZmvPv3bSd1gmE6FuSFd3+dsOETkmXYcDb
         jWFakBYUVgLmKIVcx+o3d2c1qaXlQ53LfuvK81EDJ8MP77oBRb5w9tKYMyfega1yQF1T
         WfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710977; x=1794315777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        b=lVrPJ6Z/82dtjPpmPd11B3epaoa8nn+LskKeM14pSwKVEnWILc4KRnXOVdwsJ03L6x
         uG9NXJlkpjKY+sPrpbcwuz+rQiq5qr010aC6iLfNjmFQBIIYkfDwerT9+3AHjKVgalIB
         5EMJ/z+5QNIplLNcPQ0n7OOggBv/Uhausyuh9omDhPG5yOtNzI8JkI+ZhgKKO4hqAHxy
         WcQ5JJT0rO8+MSp6+rKbDFMhyYsI8zxuJPi/M3XUppCeDczepG2hTJnTxFg5LiSl69d6
         TzDtNc1uILAnZ4JT7yTUeLki0YjZYNxyFgcT4j5mSrLab2Ff/Vrp4F11RA0CBifo1irT
         VAJA==
X-Forwarded-Encrypted: i=1; AKwUvBx6jMzM99/FaFIWcoZGZll6zejAOcE2TpUu3HF7W7AzFA9CSKv+DNC1SEAgP94KQh0X8BpF9lRgm2p6XFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b0ZSd4y01AgAwTFVJmFCFSprz7JXTt4bjOlyh+Q+YMrIsrY3j
	DdJdGws9FGpnOoy2q3BeN6zfYnxj26cLBuUD2/Gpg/99qONJUGrp0yQLnBkWW4eYR6cTQLaUys8
	qyIOpyOSUaBY09O44I8tzqLxLTMbWLpg=
X-Gm-Gg: AYBFou2qtr/jMJRsf9oaZBGoaPkll7DAolHoz/KQ6lddKIbqy+BVtfQpMAf18rcJ5uS
	Q4EhbSGPcQzDPUX7uuNrlKGD9AWsrFfEnfpCbc9vtZg7VOkRy2o0K2jmQI4kACwGIojvNhpIvh+
	xai7eAfbe3U7J/NU6Xpg/rSh0gTGexjoylVmLQ+ycG2bUXBTtMkZHWFg2i2uhxstkIvvHdk5HVh
	MEpQ/zA0vVPAAZTh2VN/87+UtQQWTakA3iGBrqwJ4JjgyLRRb+Pdnhe3Mpdycyckh/zIFj17TT1
	qjo1Z7klaPfz2zbXGuYHZhCiy/aQ8S+6wjK4PuMd0aVi8zOmIhXS/nGB1qrkr3Z9KmU7EHTWl2p
	gdIGOKXtgawpqT6ER6pgcYWDL1XhRMZ1h0BrYhDFUUrGUnY2erE4aVlHrWdnnEsFmv/CpqLgVQ8
	5h/wXBwzxLuWQjNgRQBR+GCtzSlTJzQG6tHNmjLYnkVbt245zrRzPcchRwNbY8WFGpuMi+0dfer
	U/c9a1v7Q3EXP81w3yXNbA=
X-Received: by 2002:a05:6214:4a89:b0:91b:9352:15d0 with SMTP id
 6a1803df08f44-91ca4bad090mr196643286d6.35.1793710976699; Tue, 03 Nov 2026
 05:02:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-20-ruanjinjie@huawei.com> <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
 <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
In-Reply-To: <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:02:45 -0300
X-Gm-Features: AclHuK9p5bXr6svQ6FTPGus5f_ZqQ_8eDBEs8TppHm5Lc6glYTBwkJFMiYpPjIg
Message-ID: <CAMAsx6fCiTLSPpbOPW9nh1rmqLEzy6i-YjK5BzhtmRq4nBykjA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: ruanjinjie@huawei.com
Cc: reinette.chatre@intel.com, james.morse@arm.com, ben.horgan@arm.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 05:59 AM, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
Hi Jinjie,

> This is an outdated message leftover by mistake; please ignore it.

Thanks for clarifying. Will the commit message be fixed in the next
version, or will the patch go forward as it is? I ask because the stale
sentence ("Say why a bandwidth counter is assigned for the life of the
monitoring group...") would otherwise end up in the git history.


Thanks,
Daniel
