Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576429;
	b=w35jpcShUEZWb8vdEMZIZFYTa1u1F3zSMFRePk+8vluLuGqvOl00ChFE5oSE4xWTM1/Y
	 KXWgpcmds3j2ZQD7/PzH51dCBjw02eUsIyo3x+/Lge2V/Muvr+szoS3fiqyuVYwpj7L2b
	 ufzNkvLCMHNjJlcLiiG5cc6q9sUFJktedqU6H91XHzzY/m+xzu3Pv4PqnaLDc6v6s0t94
	 3Z0n7SxJzhlqRXidb3etNdMX+D3gdIKdBJDw88mrMERUTj9+mr1dE7h/0CQprjzFs27wq
	 rHsdzFXcUg5J4GaWYfD3MAo8l4UBaOqCevhoZReJ0aZ5tK6+/8OA1ICjU+4mpGgD3Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
	b=xmbq+FjZA1t2h+7mCtLJygBWsGcp6+bFtzmxWNtRwwmC/S5QTtrFazi3Ao62joI7yVr3
	 5n8ZJs56Qs+XVhPhALvmrgZRgNvabWc0cv+LW90Ywq2wTaqGYBatbue3tN/D6AHCnZuAA
	 yW/Y/BQ6xSruNtOs1JozZIAtzY7tgyyRqOqstlPx+rTzfrV4TpdG1C6CHwYz2fktlTfLB
	 sK5jtc1InEkCMGTCOgPoS+S5xFq0cDqvzJPZXMlEYmhbylhazP0E1wk26S5yRSTPuqgp3
	 2jwwnFPS8T4qijmgdN/PlQpIDnTPI27KQcfVRSz/7sI8vPxeGOctgV00kpeGo9qm/HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM;
	arc=none smtp.remote-ip=74.125.228.70
Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08E606ABA1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE08E606ABA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6a5d790cce1so593579a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794576427; x=1795181227; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=F1yZ87jMnXnJnLHZNPOxMjDFrraMurLQnwrX1PMENdMZOVISppTaVGBEAtXvSg6sOz
         i9eAuh6Cgy71jZrixdwAxgT137uU60LKBjJZoecYrDmBY17aqhX0CQK53z3/DFHzp3OS
         HO8pY1ChVVmzaURKpqR/0uDaIqzBpuWsL7pNlWQv+WWGPTGnGiWVhc+sH9t3ocCdIsk/
         1gaPJkUFZkhMnE29cSX/5rSBAPg25LLQMAhR455VagPty+KLpeKraqzH7YhZa0gufVVd
         L0RdUdI/LMnKL55WBR+7ihZnx6jRxbWPHl6iZ6QPdbO9T4NB5waWuYKHll7qFbYZnn1L
         5Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576427; x=1795181227;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=d3nKKklLtEuGIKoy85LHCT24R7AScpvVMRZtBq5/GIacQWfXqYvB9i5jS4o4FYuKm5
         tf1wMrpNwnDmOO8tBiNY1lEiPAUoU2g/NywrdFPdnosgIDEONIxXFqA2ezSvAB0JU27n
         jnyFbWM+K5bVCg5SB+YW7EgXf5ejhLwr1vQJFbkkbdUcxzaubDmzloiCHUb1zk385MOe
         8q483OyTx7F5JNoGv//hlUkyVJl90TCIirI4ZjzbA/zQjhc6khCVqlJy8UdGqCMLvTdg
         4C0aHCB510RQIe7eytmby7PpTNpGifdvV1IK/FqImKRYhg8nsL9sOpSdZb1HdYuw7I7+
         5nzQ==
X-Forwarded-Encrypted: i=1; AL+hErGAUEexD/X5vlETcFoC7UvHw3AOYePnCkOdYYOJwSC0EjQ1vLfCA7daZUSctx46OJMkp361DjNa6se1LSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2yMPTV455Q0SkyTuO0xoZEie+v6x6ocGoedPk3yeS49g0/1r0
	87akSxc5cISR82yYqIIBUFTXGB+gINbX3Hz35x46D+8+RG5tudJZh2NKBNrImpKytQs=
X-Gm-Gg: AYBFou1LZHoGWKw+iLj8U79k8YbzdCmmuzwpujXRFWmLPiQq6YfaF7QlaiNJq2EGk4r
	/5T9hPjamID0YjDAWrDCw/axKlFmu086hOenj93165nDjHpqiTHl0+ceou2KiAB5HzMGmJADg/a
	2a803g7kF7nGND1Sm6V0Qf2AjFCBKWKi8U1vNwRLqBUBDRnKgto1nliccxTk0TF7L7csWXUJjrt
	uvs7Ke4Q90nfZcFcr7I45AvcSs0tWjDAIIuqh8wBr5vn9S8oQAxC0HRrRtsnkcaITvknoVAm10z
	nVUo4LX6zXIiMjiqqnsPv1/W74BX/hZLOX/4KMlFJcWwBU0dJJC9v3ajl8I8xKuLbSc5WAgkL2m
	wELFl0ZW4YEvnf12CAq+d8aQd5/Cvndom3oiE1pRbSq+TeWQWpHQ9hYj6HfjDeSOgbE4lgH63Gj
	3E9pBGekQxtBf5jHtwDtO+zthxE2y4XXgznZYM+IPCQ2TrUxvuE/LOjDPL5OLq9QeJ4m7SrsfNk
	vdNrdwgKwm5gqkyts5GDBW3BIzjlCMiQpuPzgjmScFytEwu2NThty4jNBdPxTqxcYrDT8C8x3K6
	hBdKhwJWfjYkDtZV5SlSfw6sowNY7LW2VV9unfl0MkFHGzMkJIcqzzdsSxi5dTjtBlzHlNshpQ=
	=
X-Received: by 2002:a05:6402:280e:b0:6b6:f22a:8def with SMTP id 4fb4d7f45d1cf-6b7c0ccec63mr2358666a12.34.1794576426950;
        Fri, 13 Nov 2026 05:27:06 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c1e49be0sm968246a12.0.2026.11.13.05.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:27:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 14:27:01 +0100
Message-Id: <DMU48Z0SWPHQ.1HRZYE04S91HX@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa"
 <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
 <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
 <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>
In-Reply-To: <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>

On Fri Nov 13, 2026 at 2:09 PM CET, Val Packett wrote:
>
> On 11/13/26 9:59 AM, Luca Weiss wrote:
>> On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
>>> Since Linux has gained LCDB support now, wire up the LCDB regulators so
>>> we can turn them off and on as desired.
>> Actually after some more testing with extra patches, it seems that on
>> FP4 the touchscreen stays dead after toggling the lcdb regulator, while
>> on FP3 it works perfectly fine.
>>
>> So please ignore this specific patch for now, I will figure out what the
>> problem is and re-submit. All the other patches in the series are still
>> good to go in!
>
> Your touchscreen needs to be a drm panel follower and/or reference the=20
> same supplies as well :) Most modern touch controllers are part of the=20
> same physical DDIC as the actual display side

Yep, I assumed the same. Probably need to resend the init sequence [0]
after power cycle, when the panel is back on again, to get everything
running again.

[0] https://lore.kernel.org/linux-arm-msm/20260821-fp4-hx83112a-v1-2-474941=
bd8860@fairphone.com/ hx83112a_init()

Fairphone 3 should be a similar setup (FP3: hx83112b, FP4: hx83112a) but
apparently the hx83112b doesn't need any sort of init to start sending
touch inputs compared to hx83112a.

Regards
Luca
