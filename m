Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821246;
	b=0oJ6/9DooQEc3jM0hc3S1XixwvvvuTXMED2hqumi/++6yDZwgy25jlNhdeVThEdW3EVm
	 pqGk3iQLd/9AaMXfpv94tZ33Lak56W5zGVofKsjrtFbSuNCHwA2L+mbHWfFjhJ9dWMnKs
	 EfehedKn6HrnxfJyfWlXgTOQWo1jpt/SizY5qn+kWN7d1UIB3BbXXuu1Ow1fEnRPPfSlt
	 8Qi81pPlTyJqsDdxd1pNJX0133rkkxJkBX+6thJ9CmAq0ZNwfy/ZXRFSEN8euvEzfQ+oL
	 i+z41sUbNMFaJzU5ovx2yawRGy5lz/B0wCCVa5467KrceseGhQLtQI/skbeIjhmCPVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3RDL1fZo8aXNiQEk++kgWnQkoCZHciDwpPC04gZ5fIE=;
	b=5gh40l1vpWsFnPpM2QHPpXNrhNOavdVR8bekg6xi0QTJaLqZuwYGsMDYe/lxV6b43aQP
	 LWUAYztlw+qAogg9PpndmI/vG6/3MFEGs7m2nUK1puG0BhbZ8W306/HpjSB+7U0wDswGY
	 3vFltdY7/X/xh/2MDFiH/nB3A69cWV26gf0uEbOyeNy0oSeuuUB4LCyg1umCPmwzowBXA
	 16Cacb7dEa2gZBkHoxMxBOQFHF4/TxX28Ssx87we4GXXOXUSorAalx05zxbCRSztvy7bf
	 BiXDRwYaXLQ2PPj3NcuM/T7X//6p0ETnJkO7giR83AIE6NnM7NoKll+9iDpBN9gWn6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2dfIiJa;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B679606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B679606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2dfIiJa
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1626262a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821246; x=1795426046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RDL1fZo8aXNiQEk++kgWnQkoCZHciDwpPC04gZ5fIE=;
        b=q2dfIiJavJvuJooQljuRg9haFaPJ1+O/ROT3r9C/a93bNbvscqMVmY/d4OuCtGI50l
         Hce3rxIVETCP6IIBSJg67wxo0cQtrl6393XwBd/+NV0buV2/b4sn+3f8yx51KWoxJLdr
         vDDcdwTym9GtVCkoEyEELud3XbzJeRjUokDooN3mU87STne+uPHyZUrdk9TyrqT8htoB
         GwenKRNs4ymlbKqytmzwZNqE2FK1VC9iLrL5XuFLT5fUXIncpQnxtIEJ0AKQZWOlOfdk
         nI1ZHwe/3gEfhL78NFfRRvN/Xul2Hsibxi1z3c7eqMx4mWlZe/ZHyAQwusT8w7gyOOqu
         JTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821246; x=1795426046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RDL1fZo8aXNiQEk++kgWnQkoCZHciDwpPC04gZ5fIE=;
        b=LJ64z54PKMHCkWHc8SIcQ/5/wzbKCDin2eEnGLLp3Us4m+6Q2W8L50KJhKspQYxxIy
         AmHgt3ktkANPqAmoPVDsds5w3aT9mvMwgR1QyKCaCC72jkz/IwlsGx+N+uhIco0fmxhm
         arLLTSaNCW3cgDPSLniqGx2rGMouArUHmPUnw9vaG7LKkuV0WNqv5RaWylKSfxvgrQMw
         GQmztsG3v8p/lj0+IjNoF3l8soS+YK/ZgEltUPPdaYCU4zhWlrR9XOP7F5z6/r8DbN2H
         u7tVE6fUC7ypRidNzGlfCrEG0mRUHXbBD0cbjmIVQnxVge6zNDuxu/MjdCxWpVX0I41U
         ww8g==
X-Forwarded-Encrypted: i=1; AL+hErETunHFIMt9d55jmAEhF9UOT5lFTXKy/mdsZC1dF0FClytfwNtN+n7MHiRsKizYB+OX7hITIFeDixUNohw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xq8wE+fa7fsBf58kDdW+kZdyyAAe6wu7QnEk9XiM9kKNnzysL
	heUAlYk8PtV7p9Dk7C4DgT1Z14IgJsXfYGFvPEvE5U+DlgNUpJltwTFY
X-Gm-Gg: AZFdTZfoXAlojbIQPaI/jGowOa+sPhYTX/eIbQShDwrA5n7EQwAaMlSDwonz1J8hK6G
	kT2BY/vi++je6YFH1b4jU8K0yNkCLSDqL0JFihAsSGHLvrPpYqcOGOuLHG54kucf+HJ2Nx5Q6hE
	xfLTYgOUTslyYniqTmDBNdEqk8W1E7fXQgdEfAQvxUioBCJgGFpJBeBBqEdeQaE85HUyQnPqOFn
	JcovdzqQiHHtGca68/4P3qhXypnZW6xlKvL33nAnmHaKtmdCj+K9l3n4B5wICSrux/HhdsaXrz+
	j9BwHThYhd2KUCLWqW2vkFVmy/qoD7kkm0xbGVUu4UV4bVE26weIeT38Q/cqH6MtS04nN5uXL++
	091KG4WOt0+xdGEpff7uTWaIEIRh6KuegHmb/9Z1fhGT0IvB1so4iDHCOii4rphA45Du3ollTmp
	Kt1C/Gzx8tZxREkl7+fe4IuKtks/VLnLr1CPfu8FTPtM4Kdspsy5fppNIlxWsYeRxWLs/JwIPWj
	Umhlc++GbedAVtYb0beMuehqMd3jVhopiM7KCIgKH0Gqd9wQigrTd/qeMxKdRtrEPrlEOMIQKCd
	nCjowU0ihnNpBq/3M4WYXgqcnnb/xJRahDgFycIQv+i3IQ==
X-Received: by 2002:a17:90b:5910:b0:3b0:aaed:48d0 with SMTP id 98e67ed59e1d1-3b1b0b4d0d0mr8836956a91.37.1794821245843;
        Mon, 16 Nov 2026 01:27:25 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb18b73sm15680884a91.3.2026.11.16.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:27:25 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: rafael@kernel.org,
	thnkslprpt@gmail.com
Cc: viresh.kumar@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	zhongqiu.han@oss.qualcomm.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v2] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is inactive
Date: Mon, 16 Nov 2026 17:27:20 +0800
Message-ID: <20261116092720.2552651-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJZ5v0g-oDagp2GrZyhLmT-BYJqcm-D4s1eTrXCxB-fj5BNixw@mail.gmail.com>
References: <CAJZ5v0g-oDagp2GrZyhLmT-BYJqcm-D4s1eTrXCxB-fj5BNixw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rafael,

On Fri, Nov 13, 2026 at 07:21:00PM +0100, Rafael J. Wysocki wrote:
> I'd love to see some feedback on this from the people on the CC.

idle_calls only advances in nohz mode; with nohz=off it stays at 0 on
all CPUs, so the hold never releases.

Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Thanks,
Zhan Xusheng
