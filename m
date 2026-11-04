Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792000;
	b=mYj354TCvWR35+M3gke/8Dij4q+nsVtkAcnQ0IYJ984IUwuT3LOKP1xhOkwqmp/w8OC4
	 ORoHFD5kCeeomZowrxJhN7QwfWb/eK8jLKCqJ6XihjDwVa7uFJpRprDQm49P5bEeLM+zz
	 ZffkR89pbkibVSg3prlv3zGetLAGA6Dqdn9LLILd1vHU+PuB9hJFTZ9ZXmIr+N2gAQ26z
	 ujLrtAYg9FOkCIUR4MY7hwA6jc0sIDDSr003rILeBoPYvJd8y7+iaYnhMBo/rTfSKh742
	 OpApzvxY3oCMek978WOxUxwSDUnhzPD3oEAe4bdWLBc00V/aZxzujFkmWx6IZAdGUNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8rhGEQa9xaIZEf6U7gJZbtVGjC0KSaXMvun2v2qd0Z4=;
	b=nlDfjyLha7VjqLpwQuSuxIhVeFAeNwsQEFf+OaGGJxizTNQ9eCNBJt6vBpuF8ViB9SDA
	 VMwK3ZdZo5orLRWDauw0F5tnm7p+TfJa1/ev+QjzWz1vcYxZvw0thR5m23krqOq6Pw+wO
	 YlNOMiMNWIX6dUK9X40gwyx3wgZATq2zYnLmu0EE6U6hGPupd2nSprZQNlrnsJB5/N5Sb
	 fUm7ndMDmSpiwV/078jhawiRXeUpsAH2Qp6I1C/P/sx5sxU9cTvZ+o9fPdBBZAOzePfG/
	 FX4hgKlNPFEhMhA2DVFpzXNYJcgJnPvbqCH1nGvZVvugVQRcOY2wR6Y7lhmCidi2mMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KOlkAnkN;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2F606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA2F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KOlkAnkN
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c5358fc28so518763f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791998; x=1794396798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rhGEQa9xaIZEf6U7gJZbtVGjC0KSaXMvun2v2qd0Z4=;
        b=KOlkAnkNigdTdThArflofqaZ8p/tKVPp2LZ/kM0Fsp/1xAKmB5HskiZAv8U4QyQ5v5
         iBJVVBpg1XFGQt5xmq3Z6pFRH1vdTOKjWpKwQuHy+iHR49B1omBV76XDiqDX+wEo7r/4
         a4cO0CW5rufsg2iLob9B9MUQwqkCs4/a4VQIZgFIrSWJ2T2NsHglYFzcmRSRAnJeayjp
         irp9pE9EO8ZEpleRQC2hdCdfk1wFgBlll5ZbicT6+1bCH1bJsoLmPDaHLAZtC3ETMUK+
         6Vljf+yIwa6pVQptxbtoSGMqLrUyetjFlNH4nCYrMOPIitprJbxvRNH92uGnNwrEmHzi
         GylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791998; x=1794396798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rhGEQa9xaIZEf6U7gJZbtVGjC0KSaXMvun2v2qd0Z4=;
        b=xVJgLcQR81B87+wTLh9VlMguwPWho282SoKeQLkpGx1sWARDCAAAj2qIGjE0iFg1No
         /A0/6M1LLX3zweBPZc4eLo40jx26Fhiv/qPfpcjV4MQWHPLlB0KHYUNWqhSyssHkVEK/
         mXzh2qLfVnSYo851kpLuItdvBhBYaJmmJl+wGGzRCBDSWnG73IlBN3x+mK2TL7CLhYw5
         gcu+ZwIyO66qFBJauB319MNiXSXTnyvw2C8qZ7jabN+XV/BSrK7jcYj4XD09gv/g3T/W
         DEE24jr7vbp5GwUsUrB7mUzD+Jm3OmlMxIhO+pvGLjMjAAOiciCayZ2vZTKjV551c2El
         A23Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2aaFaTLKMwJlIw7TXq8x6JnZkefONcWVREJhtFdRPdSa+YZ+AgWti7Wwh/j9eo3xTPkeATZGBFM1BTFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bfps0XgSTpmCmBPh89BJX/2pR7VXdaLFKi0NFeVZqaH/6YrKj
	lUGJRtzFZXwLJyHYRFy7oYr+XihYa2xKYIxhTkOX1FmyKsCJTYqLUMH+
X-Gm-Gg: AYBFou2oHqqceLd5oKboEOD0fcvNM2g+B2peqG0XRQPeuDSa/kNWVDfEntf8Y4hHfUx
	h0iAZWKx8UwqK5Q1FzxNKGzzdqRfsdqX8USvaAGWJC7A+syHw6WUtYJQ6VYQLBzap6j9gv15D+Z
	vajv7p4oz02bGYUdPgh2A1Ve6/rKaPLjqHzx6Oewe5WhqpU1LgjywxXbhd7E1eoffyIapn9gh79
	TZwhpr+56C3V+mVb0AuLenTkeV8ngP+OSx0slaoDSIuVk2TG95CNRaqhHwXPM1uPyl/LWTw0YYH
	536W7y4tZU0RewotcVWEBUOIob5B1lcoN9ASDdnAnK/l8+nZVvfr/ReGYQj0JXnxf46xSuKDZyP
	pE2P20WdfFJZbMHgGTSaStxfHIW23drlHgmRrAIhHRcoVPfGPj1dAZIWQs8+1AsAQN9AtgywDeV
	g8AVugnp0tLSELaECcg0FuYS1ZiBi8ub0doqRHPI7S5pI5UfO2gFBe4uq4Vq38B70rNL0QuqdIH
	RUrEY0XS84iaAuBy7/f8asFihJ2Euguqi4ISq5mxYkMiAi/YjSSkdcL8m95QbF1+27ks9rEiZGT
	FfgI4lDHvpI8Dnmlk4kvSrRFq0xATWkjOMPUd9CAbvCaa2LbULiF1nnH+FStzYzKlmQ5GQb3MHI
	ZZTEEl+y5aVezZZJXv6YmTTIYAwDkAsIdLC06eMeHCiDrtTRDuoeD0QxixcsYJIrpRqDqAjgDH1
	fz3jQCtVlnfvXOWDy7jvPmetydGxR7KGk75TwZON1GZBWJss361zQe8Zg=
X-Received: by 2002:a05:6000:4559:b0:48e:752b:9f90 with SMTP id ffacd0b85a97d-48e752ba019mr21401003f8f.38.1793791997784;
        Wed, 04 Nov 2026 03:33:17 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feea5d4e4sm3319889f8f.57.2026.11.04.03.33.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 03:33:17 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org,
	marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/5] net: mvneta: fix the TX queue arbitration and the mqprio offload
Date: Wed,  4 Nov 2026 12:33:10 +0100
Message-ID: <20261104113310.90408-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <862976ab-e80e-4d6b-9657-ad9bba2d020b@bootlin.com>
References: <20261103125021.70845-1-pepe.schlehofer@gmail.com> <862976ab-e80e-4d6b-9657-ad9bba2d020b@bootlin.com>
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

Hi Maxime,

On 11/3/26 19:56, Maxime Chevallier wrote:
> Wouldn't this break mqprio offload ? It's no longer priorising then ?
>
> That behaviour of the high-prio queue potentially starving the other
> is likely what mqprio users actually need, so maybe we need to setup
> prio-based queue selection when adding an mqprio qdisc, and switch back
> to WRR when its removed ?

You're right, it does. In v3 I switch the queues back to fixed priority
while an mqprio offload is set up, and to WRR when it is removed, as
you suggest.

I tested it on the Omnia. With the offload, the higher traffic class
still takes the whole link (94 vs 0.2 Mbit/s). Without it, the busy
queues share the link equally.

For patch 2 I added one thing to the commit message: if taprio replaces
the offload under a new handle, it ends up without traffic classes and
sends nothing, like after a software mqprio. The code is the same, so I
kept your Reviewed-by. Hope that's OK.

I'd like to send v3 later today. Thanks for the reviews!

Josef

pw-bot: cr
