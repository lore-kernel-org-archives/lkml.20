Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792454440;
	b=QVK4J/WTuly7f+g9ByunKW5k/pkTqMlyRjkolAIQMmPKyr/GAq6Iypx+y+N6VjxsPW7Q
	 utMGA3z26al84vTIFqARQ+p4WV2V/XyZp00COWHrgcp2qTd7JH2HDu4ntp2nhlnLmE3pK
	 jmR8fLHtmp1sCcYhfOcrxdUE0NemIsHB0vKHYBJhT8P1hQA1YRy+b1W0LZXq5EKuh0au1
	 W2ltxopzf+ECNpHxeguTPf8rTvxF57Bc/NofqoPXRSLM/r2/DMMn2cG4m/S9QwVIND5rv
	 nvdPqtqJRe4mfJJPu56ROXncVfjmK+buOKwAI6YO47MlvrLgnez6vydP9cOlx9ns5+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7fUTkugE/ubN8HZ5/yUbmpM3BNuYlbvQ/qB5I5NZYCU=;
	b=Si3uCbN0gyxc6iK702cw0jgOitMMhRAjxeFofOPuHZYhhu/IkQG/MzElV04sHPtEZ1ZG
	 +SFa8P6gSa3TaI113tBmhiKxrpa4z0CfKS3vLeztiyEV+AnKEEYil8wX5IFzhSXpD33Rv
	 H3sM0QkzjIiEtEvKRr7ufVSfNCP6c0si1d3tEk44b8B0NoZNj0eLxNxNIfL7nSHGSvtKQ
	 0/v00ep6P/WtY5+1SSzdPFqjaZnA/TylELJH/t8+FL6xioYtht0MfchI2MYVlQm7AAl1G
	 7jahPNou/Cwr4wBUBZ3YEiF6042juH7Z1cD0uHd4RNt5Qnz4WTFBCgYMoAY0QHuygGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6oKOtnP;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B15F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6oKOtnP
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5724315eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792454439; x=1793059239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fUTkugE/ubN8HZ5/yUbmpM3BNuYlbvQ/qB5I5NZYCU=;
        b=m6oKOtnPo/2I5um0OGZ5G646AR42YdurL++ZVPDQDojft320mn3aJyVyh3u5bBBnmU
         kItDysR60NNVcj8YojuiQJwIr+506+OxCKCD8z9IW/9/C4IzKMyzES8tyspw7slaGup9
         VnDglr8JS7MzWc6t0gslon1wFa9+cThJO+RH/DZxtCrfMpbGy7MoecQUh5tQ1CQgWRgM
         C1ko12o1URbMQedFODTVXx0KrdztUN1b+ZGRtzziomp8FtWj9OXJpxaNDSEyOgf6Ogvo
         jvOVwEtP/0HITVOBBfjJAgQij5tnGpMpqdl1+0tjBRGFiM1uXG/e/CfQD4oXE2UAW0Zu
         vKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792454439; x=1793059239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fUTkugE/ubN8HZ5/yUbmpM3BNuYlbvQ/qB5I5NZYCU=;
        b=QtUSjhrh6Iq4b+Td1wD7i9sJ8hyBZEFBrt1J8n4d0NWblTI5FVQxELG4sY88Plpyto
         MVDTt6behaCWddLzLVD2VNADKwLvmsjx9nimPy60YnlB3oYCpYPIMiTXCyEP7/3jwycU
         feJ/WgMrOQ4QeJEgHnkmoDxGv+gft6iXQzGyOviphjslrWm/eY+y27I/vZQ9TtDUh/JT
         bIu2TnOQq9/XsQASa96+e8AlAvRw6YU6pZqXZySxgt8a/7d7UWIAiFIxNCkx1757V+m9
         +nZwcgww8KyMgZa+KlHjmf7MNHAbnJvUR+G8KgteBzw+3+p4+7EJ51577sQrIpTvIO3H
         hofQ==
X-Forwarded-Encrypted: i=1; AKwUvBygEfp89/Xn/D1CEY0c8Mr1xavrmfrExMhQ5HCthubUJTTOtuyqVlsdbY2g3xyQlvXn/ru8bNYLMaOhVTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNq44UVzA97KYb0ypKXWsW6lgJM7ddoaA2PO3hOc6GQ1wmNTVk
	VgyYB+88ljFuUKq3ykMwMhEKdO6TghT5QPnbZ2N7C3h97qHR/nJi9+sLCTyUPIkI
X-Gm-Gg: AYBFou1uPMUbuCbR7dBh8jyIlVuWxXBa46g76APo4Dvh9sh1se+1c19r3PWXH55Flwu
	sO5xL3ZW+Gdf1yrQQ01EluY2dVMl1Zv5AEZJon9Bg0FzHj2mejxbw4+lHyBJ25P9EUNpNo30KPj
	2RDebUo0W7wntEt11j+pv3onv6iGRUuJSDMFpiew7Jh4e8XHatTS7WqL84gqZxOV5f0GZqjFt2w
	YbjF5897BiKwj9cg4BSngcJe10bJ6ALxbSqPI08LJP7ZliePCSf0RWoFV58slnOyCiLP9hmLw48
	jKLlaBQgKJb/y2beriE+BUsaDfUBo45Guh8bslU+S4uuY0LAACib/nT6uuNzrt5UjmpZUfK6lCc
	MjkpgNczOzPRSEV5iwz17b73GqDl3wrUue73cpnPOhR4b8ZOPciaas9f5PWD0PYIECLGiceSlBp
	mFiW723yclT7KDoWYPK1rLAYQEDYSaQmztGGHdLTZzCzstiNWUg3D8alLDtSg6aOIwcAhRC9gVM
	K+6K7jEqWjVTTvstvFKVq3FO4Z2I5JgPQ==
X-Received: by 2002:a05:7301:f0f:b0:35c:6268:8127 with SMTP id 5a478bee46e88-361a146ee08mr11221357eec.13.1792454438391;
        Mon, 19 Oct 2026 17:00:38 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:dfce:4d9d:7f44:24e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm36155038eec.4.2026.10.19.17.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:00:37 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: Re: [PATCH 0/2] iio: adc: add TI ADS1299
Date: Mon, 19 Oct 2026 21:00:31 -0300
Message-ID: <20261020000031.14522-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atXuGv3esexdRJ4e@ashevche-desk.local>
References: <20261019001247.483005-1-stephanbrrs8@gmail.com> <atXuGv3esexdRJ4e@ashevche-desk.local>
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

On Mon, Oct 19, 2026 at 01:16:58PM +0300, Andy Shevchenko wrote:
> On Sun, Oct 18, 2026 at 09:12:45PM -0300, Stephan Costa Barros wrote:

[...]

> > A question on structure. The driver started from ti-ads1298.c, and in
> > this subset the two are close.

[...]

> Okay, I think you can try to rework this as a series on top of the existing
> code. I can't easily see if the above difference warrants a brand new driver.

Thanks, Andy. I'll do that for v2: first prepare ti-ads1298 for more
than one family (chip info for the gain table, the data rates and the
reference), then add the ADS1299 to it, with its compatibles in
ti,ads1298.yaml instead of a new binding.

Some background: this comes from my undergraduate thesis. The project
first planned a driver written from scratch; I then found ti-ads1298 and
built on it instead. Beyond what ti-ads1298 does today, the out-of-tree
driver that came out of it sets the gain of each channel, timestamps
each buffered sample, reports lead-off as IIO_EV_TYPE_FAULT /
IIO_EV_DIR_FAULT_OPENWIRE events, routes the internal test signal and
shorted inputs, reads the supply monitors and the temperature sensor,
switches SRB1 and SRB2, and runs a self test at probe; all of that is
tested on an ADS1299. The bias drive, GPIO1-4 as a gpiochip, the CLK
output, PWDN and suspend are written but not tested yet.

For mainline I cut this down to the generic ABI. The rest can follow as
separate series on top of ti-ads1298, where most of it applies to the
ADS1298 as well; only SRB1 and SRB2 are ADS1299-specific.

The automated review of this version also pointed at issues that the
new driver inherited from ti-ads1298 too.

I had missed Md Shofiqul Islam's series when I sent this one, and found
it only now: "[PATCH v2 0/2] iio: adc: ti-ads1298: add ADS1298/ADS1299
driver", sent on 6 July 2026 and reviewed by Jonathan on 11 July. Md,
are you still working on it? If not, I would like to take it on,
following Jonathan's review there (per-chip match data, the reference
voltage and the ID register), and I can test it on hardware: an ADS1299
with DRDY as an interrupt.

Jonathan, if you would rather keep a separate driver, please let me
know before I start.

Stephan
