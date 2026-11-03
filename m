Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715522;
	b=eHLL0er6kA4467bji8DnPsK3PtPf/G6m+z//K7OVm6bhmMkrX6zruDOhQevv7dAGHskn
	 4fOlzeDdqRGgwX16HrkfF6xPEN/fWkeb2+9QkRZUPm7OBQ4sv65Kd7BA1IsC+9r2sDgdl
	 RUhy+RGznPgbj5+jV9AIgZa14wD2MGYg7+FE0F23/cvd5o6BGdLBSXlm0RRpMI5Axt0Re
	 T+LqCnsXDANrhpldwZP8LzymC2dpB6IgkN88ex2ntJNGkuS5/FiURxli2ESrFmALqf6Js
	 SWlYSfAqCCi9JxXICbdGtOx6lEVxHa3+pgCEVVCTKu3vdv1qUgIQlZgEMkOGGmsKHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715522;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=87L8NH0chbxJMXxlwkxaucZepbhcei/lYwpnUvY2jS4=;
	b=s5kGnzwkUiGVgMsHs4BKRhFVk5/odznJ1NRRDKZ69IBKAvvye6fa7P5hVxa9X6Ildioq
	 WYIwH+QJyDhTmiS6Q4/qr3OOHaS/ZiUoNta0Eiolg2uTmHhdN5WXLVhpmdZeyufJCSJVN
	 /MWiIH2nCNnhIRzWUnyNaxRwziJ+3qK8yMh960qx8n+TRvlbmeCCory9Clr8ohou4d1WA
	 yOGIIE4ELwUBVbp5pUUFwv69DZwrYvuOh8xxjowYNiGWEA+CMP503S03w+cigZAAIT9/4
	 dTqq/Z28XiArh9U6XY05aDb4kzH2L37phcoLSzlCplMBAySJWD2BjLpgvvs3HEIU0ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IRHMtWVE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UgDLLBfc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44458606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44458606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IRHMtWVE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UgDLLBfc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793715521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87L8NH0chbxJMXxlwkxaucZepbhcei/lYwpnUvY2jS4=;
	b=IRHMtWVEaCXcKVrnszruv3kFHaSJccvoW+KGOCSMNJTSrjFKUSTRy1XIQfgHD2WZI2lAw+
	pluaZQCPEXoLi1/0FzdHeHUCnPkWGpCoXYkpsjlD8r742KI0NKYHI0/i/iKL6Tbpjg+Wne
	pWKvcNibOarbCy40Trkg8fJrEthcDF4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-UZz44yA_NamwJqIvyJNj-A-1; Tue, 03 Nov 2026 09:18:40 -0500
X-MC-Unique: UZz44yA_NamwJqIvyJNj-A-1
X-Mimecast-MFC-AGG-ID: UZz44yA_NamwJqIvyJNj-A_1793715519
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a4654add56so35609085e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793715519; x=1794320319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87L8NH0chbxJMXxlwkxaucZepbhcei/lYwpnUvY2jS4=;
        b=UgDLLBfc/bXJiOyeTY9h3E/2b9NcVvDXC2LHhKd1RL9yvya9KWHlPTuzXFDRw/ZYkI
         SyMPuW8h+ac1OXG31eFAmG8xUx4mrLWdqwU8VefOMWepj8xXAmYr50zgPseM24oVZBGf
         pVQwm2sgTBDxEbvuBBhORrgapJVaQMcBDxU8ILnrhmQNpHDzS9eiJOk4sX4J2gkAAuRD
         4ChNUmaElJnviB+3xvHvIp/S9vPdcGqNS19YHNj28eFbYlShAQ5dLnkz+44TX2vn1ovf
         nUPmyUsZjhbGga0wb0SxvRgRLABPX0orDHe1hm+r1Wbx9w+eU97m0oY43FVB85m4IP9Z
         17gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715519; x=1794320319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87L8NH0chbxJMXxlwkxaucZepbhcei/lYwpnUvY2jS4=;
        b=GcY7tF4JA3T84VHgtqyMXB01bTSYIh0WTo9eiMtnQz/fthUzjlSM0nmGZTw7EOkGRr
         msjewfrlU0nETpCH6kP2aFpQS89ng6IA1xsk1nDLBWl2b8bcqJkMo+OM9uWeFMWFKJMo
         j/zIc1h8huY4Usnn3d6lpVhFyEaMMM/vhq+YBQmf2up0SkbP4jBTzX1jrrTPGEbkr6gp
         mCUZMgPE7Lb8nBMeCSrWvAZUwSivwzFyANWf1AZCTMZHUCPzMMgy2536jF3oyQyxO+W2
         RGDB21P61HJ0zl2hEgIC8FG0P174G4OytJOTLl0tIqAHwP+FrAqYuU0qLkLznfA6gFvW
         HRgw==
X-Forwarded-Encrypted: i=1; AKwUvBzmiduVFuGTul6BZXnqOlmXCWm8PleFLejSAG6iAkAIn8cNhULv2lHZflnaYdfvrikkJkgEv3E64p2et5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4I/YsrUBpXSfIbCl6lDLmAOCsJFqxMsGoiBL2Rte2TuUTnvej
	mN8zyKJ+2yVZNrrk6pJsj8xpAe8M3RQkiGFEVitmUZJScIMeezClQ9NOpbOa/UTds2iITIPK/1f
	U5J/B1CpfTGveg6QlrktilIUaGT7InV7hFqEQ46kIAkcj8lQOr6zuaBY9acXoBp8Mmw==
X-Gm-Gg: AYBFou2uKxNW4NwEylJWxxq48iVfBskI6ZOcczKe1WbRSALziIPcPt4hd7SiU09i4An
	j9AQgBBYMGlRwMZ2IZ+udWSeYzpeBoe6nsQQOnTLyW7XA1rf+bq58HdPI09Vgy8E/hiG/JNicGh
	qlaf9eSc3wd/T1NuCx1QYtUB84JWqtTjV0oDEY+Ci9htd7/dFCb3szlg4K/CIs5MPNdDinri2R9
	IztIKSA9vGBqOYjwNSp/fRPTv2CdLrPky87B2LM1M4I6oKiW6N3fSv4yvHUCoU2QJ8196BQ5qFx
	5ikChUDZLnodj7bDiStEid6TBLKTBlayFr/m1qsLgjvFXCgFj9bA8lto5cLJiGDtVKBCWC1KIf0
	kU1znMHhsthNb9a22vAR0HHFuA0NNZJZ3Aix9e8nQqUTtFkpvw9kvdbxrd6gZbEWtu71cyZglFc
	Zfwt5ZL9KLppLXhXQAutTcc3Vxj3zqWMjnmm2s9J721Jg=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr160826675e9.35.1793715518727;
        Tue, 03 Nov 2026 06:18:38 -0800 (PST)
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr160826195e9.35.1793715518348;
        Tue, 03 Nov 2026 06:18:38 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm91268795e9.15.2026.11.03.06.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:18:37 -0800 (PST)
Message-ID: <4d97a782-8d88-4dd0-b819-fb704582f2ec@redhat.com>
Date: Tue, 3 Nov 2026 15:18:36 +0100
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
Subject: Re: [PATCH net v2] net/smc: don't spin in smc_rx_recvmsg() while a
 pipe holds spliced data
To: Bryam Vargas <hexlabsecurity@proton.me>,
 Dust Li <dust.li@linux.alibaba.com>, "D. Wythe" <alibuda@linux.alibaba.com>,
 Mahanta Jambigi <mjambigi@linux.ibm.com>,
 Sidraya Jayagond <sidraya@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-s390@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>,
 linux-rdma@vger.kernel.org, Tony Lu <tonylu@linux.alibaba.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>, netdev@vger.kernel.org,
 Stefan Raspl <raspl@linux.ibm.com>, Hidayath Khan <hidayath@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Ursula Braun <ubraun@linux.ibm.com>,
 linux-kernel@vger.kernel.org
References: <20261029-b4-disp-da7f8e6a-v2-1-9052904adf72@proton.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261029-b4-disp-da7f8e6a-v2-1-9052904adf72@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 09:03, Bryam Vargas wrote:
> While bytes spliced off the RMB are still in a pipe, recvmsg() waits
> for the pipe to release them before it copies the data behind them.
> The path to that wait skips the timeout and signal checks, and
> smc_rx_wait() returns at once on RCV_SHUTDOWN. With a signal pending,
> after SHUT_RD, or once the peer closes or shuts down writing,
> recvmsg() spins on a CPU until the pipe is drained, and SIGKILL cannot
> stop it. MSG_DONTWAIT and an expired SO_RCVTIMEO wait there too
> instead of returning -EAGAIN.
> 
> Check the timeout and signals before that wait, and end it when the
> pipe releases the data or the connection is killed, not on RCV_SHUTDOWN.
> A zero-length read returns 0 without waiting for the pipe; a
> non-blocking one returns -EAGAIN while poll() still reports the socket
> readable (splice() can still take those bytes).

@SMC experts, please review. IMHO the above trade-off sounds like a better
solution is needed.

/P

