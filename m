Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891448;
	b=TNkvKBh/44FgWAjvfk+M88eXL53MiVuTkUuoSK86odenDoENGfOR9T1wTsnh5MEBITv4
	 KZSbH3ajh14EIq/4V/cEEjXu3XiWKXhpJlmNquZiZxTgndCpd/9N5dl+AlEfmIlbh9WGZ
	 4tOjEQ3Lll9hpW/HNJ1fZS7oKgoLMMsuav2m2WFqDUwjdGzsyBG+DqFNq7XVFZXQmh0Xc
	 Za8GfDT8i26UlrdIX7Vb+iHft/o55uTGFjJFHXc7tYTLO2wh6Qg07+UBLC7O6XZaT7ch0
	 cqEYwYJ8jjAwHpN5Og2Xc+2131fm7G52BGfp50wfaOdC2fiq++/5HWVUYsdmNSRUsKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l2BdX2PM3MjAERLH3HIGzaP0PYsAb/KFTZPWDyI6fB8=;
	b=fR3v9espIxNv0gEjKvfbfFprJpU7assKYXsIIY25iud0OcDkJYTrKE4BGLgTj7e8w2lP
	 4kWFDnOjO2SalWXcebc20k/+/SvZ/ErNFym+BNfdlUJlCRN3Wq/fyhm9jp3l7LLmdzBL6
	 Kg43bb/epWHnrhstxhqlVqx+xNk+94RvLIZL8I0X9KpRbTpcvRnGKCKCDpMdKT2BwP7nh
	 I3cGE6YFnN3aRi8A9jfnRHYLoBfjQfqiVlqAaS7P1t6J4Gu3ntl+bWEWUlHiVkJrLjwNS
	 5w/a0eRT6KQ1zZBOZarl1GV+VzG2hTu8W4S/irlq/D/MPSX3k00MbnrxrydRjzj20Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O376a9Kk;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E185F606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E185F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O376a9Kk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so41332355e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794891446; x=1795496246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l2BdX2PM3MjAERLH3HIGzaP0PYsAb/KFTZPWDyI6fB8=;
        b=O376a9KkcJ8lT0WSJfqS75ZNGqxnxHKAy2VstZxnkkGwLNvyMvs5vDlVbSG7Ke0EcV
         OTBDZSvKV+4vYq3RTpDNCn2yvj6ae5WA4qjPJmKE/TMo5hDNekqcZ6slvvHcFD91hhvv
         FMqhxGY/1cpqGZC0QT6js9q+7EWtgubc4zhNhwzHDPRFw4B9KDbXaTz0muK3X8k9/oUK
         OU4N2pL17a/jCGA3Kt5WAWHJdBDtZlZDOiRdP+YA2ed1bk/BpDFBnDJwYXrh4kyHanul
         OfaExsXX0X5cykyStRAISVWaXzK83KGt+c6W5pJoCwWImMampe/IRd06Pqd/LbTNmAlw
         YpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891446; x=1795496246;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2BdX2PM3MjAERLH3HIGzaP0PYsAb/KFTZPWDyI6fB8=;
        b=vQlcLOeY2/Ti/BZ/UPjKrLjjvJC+3Tk5yuj7Yg8X13moqt4uymZ8D+m2EC2JBWMTQu
         oNx38rMOuscDau4G1pK7gw+ve5+0DjuRbkafSHOUmz3EE1FyvZv1n8b1bDcKeEwBt4SJ
         vE4gpaxBC3lf52d7RhGfJ/Amz9u10Cuc9XKDdls3UFhG+/i0mMxdvW2qBvH7arPbVYW8
         Qp/4U2CtMBwQdRE5rMifUctWB2RgkPsgBsJtSRE/IcbhXp522ZrymfLuLwZXuf8lCxaW
         wkjhe8JjvYtthg6msoIGOX92AVIotQSiRB1wNlqtPttSvlImmVVGNmodvDjwT38MWSIQ
         Odcw==
X-Forwarded-Encrypted: i=1; AL+hErGmXt/OTtvKG8z5oc+LZ1+HSJFZDi+LAEWLwmois7qnHszCK3zkBGsAeQLYLQW4tSSvWZEoQjd7BWuqj1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IiFdnyOWmYaDcBcrlWw2hCL+5IFxcN4DvUpbb343is7Vi8fhr
	bwXxxvvCaSCjDboJDuMf3qhqIbMLAzLYVeI9gnIIaPxDUinNbctKxX7d
X-Gm-Gg: AYBFou3LAZZJAFKHwHEZO3FkbxuRHK5ICQxBn69J0+PnA9T6eEwCaSGTTe2kY2gKyqo
	B3rhUI6FEiBcGMHKgklFx3yNE6v4oTMu0y9WDCSwqdeN5Vm5H2wMv1Omk+rBlMAVQXbNyWJ57ey
	Dqzj2UOjb+FM+ItRwf2LruYz6SXbB6MU9vtt8WjijDXkyUAHCjpO1yhbiLuc8XoLrrrLVojmbu9
	f295erNykcT2J7Hb9GhqcBkhGqkqOqOzhcNXRClarcmgHA1z5SAGogW/EU5wRxsJGs5UDPYGSgR
	3N+3FtWWh1M70B8I6CWGblireSCjxt7e/FCp3utEAolmLii1ONJZ6l67OWpw44l8NznHDPh0Gsw
	UdzrxAHCqlA5FmtK6WvLqyaksJA8SygpaNOOhNNkaLgO/tWZFJwkRGhK2a9WFMRV9wjEOmt3VSa
	J+0zCe5dtpB9w+I6y8uqTYII/cLRHAV7BwJmj47Z0krK9oqp7Dz+bW/fYYJ2QoOEL9HXwQf2qcx
	+I+k2kF3fMG0KNAKo0Ls8doOFz70xAA+J82ZspmiIh2ano4n8kEpnP4bfxziXrcZT6KhBBFXV16
	PUxeRO0MsZBVQXQqIaNPu8dBL347D4LCDW0=
X-Received: by 2002:a05:600c:5250:b0:4bb:60da:56af with SMTP id 5b1f17b1804b1-4bb60da5884mr188575835e9.25.1794891445966;
        Mon, 16 Nov 2026 20:57:25 -0800 (PST)
Received: from killingmachine ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm40571525e9.4.2026.11.16.20.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:57:25 -0800 (PST)
Date: Tue, 17 Nov 2026 07:57:23 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, lars@metafoo.de, vkoul@kernel.org,
	Frank.Li@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Message-ID: <avves747CCfiG2s6@killingmachine>
References: <20261105134040.315317-1-s.matsievskiy@yadro.com>
 <auy6rdWmOnxahhB7@SMW015318>
 <au1W-ig2v0WKezj_@killingmachine>
 <avtkQuwVAsN8uhW6@SMW015318>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avtkQuwVAsN8uhW6@SMW015318>

> Do you have actual SoC, which use this reset?
No, actually I have an FPGA prototype, which uses it.
