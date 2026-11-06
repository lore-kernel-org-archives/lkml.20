Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941667;
	b=RIJr3DA2W1zgn16xZbONCGdxFhDp5pg66aRbw0keGkxcCneLvmMobnskWSG9pYP36E8P
	 uj7kMJSYIS+Lhyw3wRm53IwNk/zhG6E1+F0HIQXTS0u2DhS7dYqlKJrh4kL294mPY0qqS
	 wz+KLVWE/A/zBwmamFkPSSP9gBNvDBKyk+gz5nobzbKJwTDDXC29i4sf2IkD4r0LbI4tI
	 DduPSBrwgqbFt48bLyAzwX0oAx/WQ1fuL1pRfglYfc5ywpo7slsB/S53Rju1ru6fy28pi
	 M23dB0eQDZ6uiM3OQGgfgfxzgwEcmwymskpY3BsWaacTRnl5ydS+pJPPoFT7WvqXTTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941667;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:To:Cc:References:From:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VnDGrZnHXIuQPWIALbC30xntBi0NQEFposS5CBnrUiU=;
	b=M91auii4MuYpk8c7sSORgpymKZ5tIUQ12Pw8jS0NcbQ4U0Lcxzdi8MsQA5VGUtrYP7A8
	 vFEyLknYKh88ZtNoWIaq3GWNjjGCnEr2+BlLWZ/KVHhGAAy/YDyHTIRzY6IMzSecEU3ox
	 oh+IeJxCHgB0WOtlH5q2+FHMgm0GGP7XQ1HA7TQSU6p/9nEH5DlmNwISwI/uFRgeeDEFZ
	 f9qhYSCIbnZ9WOjixCP3YcYE86RQFnYCcfnR6lMixFftXMpK+zQIWlOU53qpO0N6J20z+
	 Y6PsbS4XcTlX6tbrquttu8UNUmk8wRjMsExenIvMay7tWPg/GL7Atlxiec9pzRqyg+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TMCZgtiL;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cyvhFazL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245D1606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TMCZgtiL;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cyvhFazL
ARC-Seal: i=1; a=rsa-sha256; t=1793941628; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HbeAG6ZURijBmu5YkINeO4Wvrp/9hQTan0BuL2Br5z4JmazBX3XLtsVfGcEd3hRyAf
    5hZfDUSRZNSewRPPn8N8TNXe3DPQdv07o62A8DfGGbB45MObaIV5EO8a4ou9aVihAh85
    deBw3QhMZChWyUCg8mjGxX0gW8wvOALKK2ZSEqo7YB7U0fxiDFkVTObjEZwrDzA2oh6n
    L13zBHUMOq1R15GBZNY5Wi72TOmIYP/qE+HtpcNP+ic4cTAcPHrjumJDlHa/0ta6M8Be
    kAGqYojwG0k77p7AmaU6YY71jFpV2R7sGfcvCFZ5o0bHRYUHQ7NfcWrP3Vk9tx63kxRN
    OWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793941628;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VnDGrZnHXIuQPWIALbC30xntBi0NQEFposS5CBnrUiU=;
    b=XFlhKXnZORZoo8lEn5NdfK8WqopFMfp1o+VB4zKl+5oeDCZmubSdWKHS8Kp/D+dAx5
    p4S4VD1Fqde4lJbniG2095JuTcVG+Nok73j8MeKfJrS/pyrIyjmhKQp63m0Pg+eXZaCP
    Jhp+fhVUj6OXlJvPzttmy9QPNxwTZsTsM3hemJdYP8yL2wKD6ysxOk1LqjzYGTj/kaG1
    xuIhXs1h6xZH3DtFq4rVldWyc6F5dZRgP2BCqQWwfr1urePlp0pV4LWt/roGstki4O2S
    dpPOg6Tgj7ryzNrPSJK5pk9fBERLlGYEAHrgjynf6PF6RF3vaSaZ5jqN7i9IC+UVbmke
    1Lzw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793941628;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VnDGrZnHXIuQPWIALbC30xntBi0NQEFposS5CBnrUiU=;
    b=TMCZgtiL6Kji0bq1zCy4bwcISonR3O48aqaqeWcyOu5CHC2uuCoHRQMJeAfHch19mA
    aRqnFtJ8m/nmRGBvMS/PT/amemUrzBZELf3qiIKy2mwHZuj6018rx4ja5qZufM/1M4BI
    kXzoiYoirWxHV89gpFB5kLRgWsLtvZWRHK3+OfnzsuMEczJFQrt20OujjtQ1mol76KMx
    pVT68A4LlIe9p6QarbeLQUihzbw6+6l4hsBmZupMes7SYx2KAHLplHXwBr35Fe1WQj+D
    C0FxImIGFL2Y9deFmDcrHpS/mAbqBMDA5umBEpsm47KFyHHlX3KbIzSETv3Mo/3Z+6NC
    c9XA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793941628;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VnDGrZnHXIuQPWIALbC30xntBi0NQEFposS5CBnrUiU=;
    b=cyvhFazLK15eG1ann/+L2rmmxYQOrzmW1kWiAYtVbsN3LIwILkUY1jlH9Nn97xc3S4
    YXUZN3/gKEWm2nh4oxCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+m73c="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d92A6576S88
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 6 Nov 2026 06:07:06 +0100 (CET)
Subject: [PREEMPT] Kernel panic - not syncing: stack-protector: Kernel stack
 is corrupted
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
 msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com,
 amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>
References: <c485c31c-1330-4be2-bb95-447cefa82c1e@linux.ibm.com>
 <4FED0F6E-890F-4482-99F3-39D7520C48FE@xenosoft.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <00f8e9aa-c3ec-1911-d81f-291d3c6ae8f0@xenosoft.de>
Date: Fri, 6 Nov 2026 06:07:06 +0100
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <4FED0F6E-890F-4482-99F3-39D7520C48FE@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Ever since we enabled PREEMPT on our Nemo boards [1], we have been 
experiencing occasional problems with the kernel stack.

Kernel panic - not syncing: stack-protector: Kernel stack is corrupted 
in: srcu_gp_start_if_needed+0x534/0x538
Rebooting in 180 seconds..

We are using the following patches: [2] [3]

We have disabled PREEMPT with a patch [4] again, and since then our Nemo 
boards have been running perfectly once more.

As the problem with the kernel stack only occurs sporadically, bisection 
is impossible.

I hope you can fix the kernel stack issue.

Thanks,
Christian

[1] https://en.wikipedia.org/wiki/AmigaOne_X1000

[2] 
https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/preempt_v1.patch

[3] 
https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/kvm_powerpc.patch

[4] 
https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/Kconfig.preempt.patch

[5] Kernel config: 
https://raw.githubusercontent.com/chzigotzky/kernels/31c064092e3aab0875c47d44838443c9515b2970/configs/x1000_defconfig

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

