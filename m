Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792538363;
	b=LZF3oWgIPDVMI1Bzb6C80vPlZrsVZHoqrz4YK8u1GH1HY3q16ztwjbCiKbbwBESEHM9K
	 Ufx5/nmE4A8hIQE/Mp7dT2+ybrZ68jvRV1GYq7Lm9gh+Lie3fl5qhuGYFc31WBikqNNSv
	 W3Sx9HntFIN1E7hKffH3C+VrFHZ2OTUiuGxFx90KuQWLiEsvsjX3rlod1gP2Co8WAfLFZ
	 q222QSBLdMjEaF9Gz7NQZiUuGSun6CuC0VXpEVL2kVjvCVoi3R/CRIlDYqL04YVse2Ohh
	 O9Rm5bGzxqn9rc131Vqzp0HZhCzt8xjxYULqwOfwxKxHZnE2x3ciAOMehleXsIzS1uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3uU5xVP514mUbrG42KDIZyHj9BphlxVL4c20+8k4/iw=;
	b=B/s/HgAvgnUztp9plaNcCH63zblKV51Cffszch2WAEqRrHjB42JAqN3TnDF6dJ5RbPnh
	 3ObhLrzTZzzOzHfMLl+BoyXWyMd7WDwmq8kkWKb22cxplXQ2bT2xAPG9aNwwTSNE2bKao
	 34pwAC8vSyqgGZtmdVGqwuTucgkJaLbwceupjXuhG3KB+7SWXHY7ukMVBIC562rNtP0re
	 bR62ZkEDHCe8mXlAk7UuNUjRyr7alHxmjYzlrg05N3xkUoApObyEnm8RGZ81z7tl8Yv45
	 2FZN3aaIDDHw/E3w2/qst3/Oh14MXenfv3qWQEbP63AJvpu76RfQlV3WHohL0unJdoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="o/mCkYbj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388EC606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o/mCkYbj
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso23303e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792538362; cv=none;
        d=google.com; s=arc-20260327;
        b=ifv6reIt0VoJvOPJ0PBpXfHFcSShg2y8nGH8ZogQNRZHKC7ylfsRXjQdA7Pg8zRfrP
         I2Iy+u8NGAPzJyKlJGLs76884wi7BjOPm8l85r7Zh+MdRNNKMu8YY1L4eDfRSLzEYIlH
         qejVqobty0b7jtboFs/RR74EZrHLpXib0PplTSMbWuS/LzsYoa8RO1Fk3dmUdEaYDFDo
         Wbk8h4UZnfvO1AyLJUslbZ2q7vBjyhu3rtq4MB7Cq5qgQ4h46UVfrJ6pz/0NuPjXpEok
         upPzr0ipDWfr1XxRbqzMHKeKAwUFnuh9Ak4IxLC+ihA0dgCLLwjmLiuBy+VBb5vyV41Z
         t38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3uU5xVP514mUbrG42KDIZyHj9BphlxVL4c20+8k4/iw=;
        fh=mJbLpy11ATWnYlaTs8gomGGaZQbykWi4pcVf0oqnNc0=;
        b=oYgyjcEFliocGaBX/3tFVnaO7DJS1sUgd9djebCckcF195/A1RnQ4gyFa1x91VGbrP
         pjLtln8IWygnFmk5wZ8of5nYGS6e3pJCMGGOPBswv72Yi8AjqjR0o3cNDmSMOGaz5Voc
         8oj6l6JSA45DvpEejsZpgARv8Ba5d2KTdgbqV+WMO8CQJSt5sEP1cFfd2FJnmGpEZjc9
         kpOLPpDMqRXOGQb6CYih3WRSqISKOZ347DNKziVzkf8k6uAWsWh0188TbPXpOKPemhLc
         4fLrKuaKk7xhlGcKsyj2IZhHFSg0kAJ/bjRtiV2tHTIIpJPvvqdZ3OmavJ1UyjSHjQA9
         YtAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792538362; x=1793143162; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uU5xVP514mUbrG42KDIZyHj9BphlxVL4c20+8k4/iw=;
        b=o/mCkYbjeY34X13UKJqUfc1LQSsmKds7DQlCX8Xv/aDnCKR/rijpjytefciSov8WXn
         7I+TplU1+FTIj5BY2L9SuUgrdP8zwvkNoFJNGWBrMe5zk6FUKTSktKtX6S7P5pt2HEDh
         4ZLwCsSC7622r/kwX7/0yND+BKIr2xwjAbHg67PhzeOfpjYONYl2bHJSSsG8j0moGUO9
         SJsuO2K6/Ll34vjm5vG0xf0OmefKbCCTurKvnAT5UXHR6vChEPnxIhXl+FQof/gIWxie
         kD7hx8Z0e6/EZEwo6QhOfRG3nR9A5PT2bXfFa0vK2NN7IPjhBr9DMuTH7q8Vo4pQFFge
         8LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538362; x=1793143162;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3uU5xVP514mUbrG42KDIZyHj9BphlxVL4c20+8k4/iw=;
        b=o4O1pBiPnlINkX4K03Swl7uGoJh8OV/RMhe5Ktv7j3daW/KpqCYBifbijUaDfuswFs
         Rjyx3P8QZ6jhYMs/KnUi88dUhTfT3Cr5pLJEKkqZWXKFfXuiihKrO8/OF1M2hg8kZDw0
         jGS051Z1My1u3OdnWZJyC6sjkyS62etjqwwb53OIkz5pWrhueHYPa6p5Bd2EXEMJ5Prv
         fV51K/TErd3TNLmXtdOOYfuXUkymiIoRwarbg1XOhAmL38sou52YuwV9wNjVXe+v+i4t
         WIGioGcpfgLsWBCmmko2fkjy+lZxMGkxLcwB00jv91+fUrvLZ1Ef/KsvgNNjdSse7kUG
         BOQw==
X-Forwarded-Encrypted: i=1; AKwUvBw+tqDh8D0z1KA02LrR8qKBbvoeExSWYe0ayYDfsPyKH1uktP+82AimEVNF4+Z1TfTBJGOX1tIn/GC4yaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1HPrQEXHHNg0w53UbVHZOw3hTEX2mh874LLylxtU8nw1+3Gq1
	dsgcJOFdb0uQkKy7581H301LIQLJMxFb3IFkrDev4TCUTo4MTVcshqotf4IumphH/adN6XJ9mzS
	5LZDOPSLdmM4kZICcetNf6gzEYvuGDv4=
X-Gm-Gg: AYBFou1u3Y/GVhkFbB2RdvtxGI4FBfMpUH8J5ezerTI3ubB0ZEcST+lW4oNETlohNyW
	BQFUsvHDfaloTqoErHmux13zaFF+SsM5NTCHJVOKC+m933xCCjqZunWsnJbRuWABvNit0Qe8748
	/kk8f/ms5MSdv9cbf00WMIoPN4BYZV/yde/GZnL4glH8dzlFmesHD6/EGsN5YlMp8tjCV97IgY6
	YDgU1Y7lDPyltoQyut/wJ4n5WUAKGLM7I77HVu6HVUzx7YsyOiPFcmQcx23xt/1uguKIJMcIcJy
	2kXfsP64KLcTIRrrB6jMIqFPpa/jHVR6G/6YKZb4CU5eq3nCWoekeR5sX1ASGps4po6c1mIaYPh
	GbVjZleIZ0ainuy9fvnC2
X-Received: by 2002:a05:6122:3c41:b0:5ea:a173:65f4 with SMTP id
 71dfb90a1353d-5eaebdbde23mr117013e0c.11.1792538362059; Tue, 20 Oct 2026
 16:19:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020152412.95560-1-mike.michalo@gmail.com> <20261020224644.3858280-1-mehmet.fide@gmail.com>
In-Reply-To: <20261020224644.3858280-1-mehmet.fide@gmail.com>
From: mixalhs <mike.michalo@gmail.com>
Date: Wed, 21 Oct 2026 01:19:09 +0200
X-Gm-Features: AclHuK-7YZ-INOiAiQfigqH4orU9yhv8_40k6xqUsVQsalHOxRswe7LmiUqLmVw
Message-ID: <CAO+rqLgp8ZfogBbOu4rD9N9w9=FdNO+wXca4SR77NV73EGpOmA@mail.gmail.com>
Subject: Re: [PATCH 0/2] wifi: ath9k: fix WMI command response handling
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mehmet.fide@screeningeagle.com
Content-Type: text/plain; charset="UTF-8"

On 2026-10-21, Mehmet Fide wrote:
> Tested on an AR9271 with firmware 1.4 as an AP, on 6.12.113 with the
> revert of 93ce8ea70451.

Thanks a lot for testing this on real hardware so fast, Mehmet, and for
covering the duplicate-response and sequence-wrap cases too. :D

Michalis
