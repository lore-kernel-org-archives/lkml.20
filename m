Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257966;
	b=CEqrUr9XuMG6PLgYVY9WJmgrV8ki1cblJtOhaF41QBz61/s9itUuIfTPVWn84a0NP0Mq
	 hxVVuL1eZfhNXEfAL/L82P6bP+cdUki4XhwZy61qQPJS2VM4VLjPosemHxKFoHQuyZiZQ
	 YG7NNW4OE2vdoAelJgzUkdF12K/eCCwxFuw5cZ5T9NkpUGZg6/jfTCNkgkSnQv4md9jSz
	 /3+QssC30ZtFC+D1K9qGEsxONIKuwwJ+Lwig7+RikjIug/QPVLGH/NBHDp87zKOIzhzlO
	 Qi4Bk2pc54cu3t0jJQiQSorcm72wepFyNqaiLb8EJyaSQ9QmBf13Li5P5cTihlH43pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
	b=2Gnn8E31FXJh+mHm8Xny7zrlsNxx2ySJlW43Kf/B0Fhs2D2WzbBVGB2Ry1+jt9Do84Bz
	 5NUJeACM+qEzMqn/FbFN27LxAMbBJU0i3wlda9rEjAe+dO1Gig40UnHDwzQNVtyrpj7dP
	 PPC6WafBTsgcym9DLZr58T3qaZekSh+0vXkPZGK6c1hRzYY97JXeBxwUIDL+5PC9C6jJE
	 BivxUEI6enMfc2EfPXCF2MP3H36CU/W9DLWjitD9jHdK/TuIlQvH+pUqz9uxmxH325Ny2
	 6WeTe3D2+5dUw8G1KA1xg+5lw6J2I1GUNMvbxIhhxggBC4gaYE3zmriGwxWYIWrrfLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="HrReEgn/";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA6606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACA6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HrReEgn/
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1166094f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794257964; x=1794862764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=HrReEgn/ryRpnI97jiAPLAbpUyzbD8Nu1QgEKRMLKm3Qb9ghk0pVkvKJqnZjkoU/Mo
         pI7B2kT8G+t2yqczEFjSQH5wI4AQmm/2b2SNkvpGI7f+Cw/e/8BJpkvzYyqvHpwENrVL
         54vgxTEAAHwMYbYL6qJ4Jvl2336kdXAhch1ZkHpOto59XHgBphOWxjXbsQcNCfMkSNJq
         KD5v3wggFRgjUPe7ETFdhPD7+9/HwZ/UWBZDABdnZIJlrbvUB1eNJuaNGnpOHhEygA/z
         A/eN0sdKmk+xmiRSg7aikhyolCtQwuYCFPruQWa1BsXuFjh3k3DVwQ7lRewSIiFiAP4A
         Y2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257964; x=1794862764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=CTxiNl/SeeB1xQvRETxXfQVY2CPsCuMXrpre8Aa3hTpKpklZCZjjhXogucYjJJD90N
         4R62i6zQqTLPFLOFgFH1xQuHer1hhqwwtQN+Wu6bxlj5zVqY12zCQ3ospLWM6q2fDBJK
         Ta8Ep/mFWCR8zrmdAeqhtK7OtIlkOMYhm/7O1eNItcaUrVKXyslRCrvEgefocYc5KI1N
         Djjyf0yPpu4g00LmJo0wz/iq/LhMZc817oPfc58FscmcBDReg890uveJQuGM9A71XeAM
         HRVDDq27jXv1PhkMzQkfBaIYDgIFASS2bo9F1JF8VJ9SZoQQcc9GcMU0ZpDKlsrqHetv
         k47w==
X-Forwarded-Encrypted: i=1; AL+hErHgqQ2nCrKCy69wQjUDCF1ufXbO0XCxerFro9qaB6D4BGtMXVsHL2/xC8ZRh8p7mD7Bg+l/IzXOMgkYTyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ei/UKS7493KZPfLg2SXBlKlTPw6iIrQhee2xqDiejEwn5fKtg
	2cDr7FGFgyf1KTLy27D0EYbrFS7zqauAtAea1ilarbLe+Fn6r6Kkp2X7WsmlU6VoS1Y=
X-Gm-Gg: AYBFou3wUjUZ93h53YYU4zSCscK8Z2Rq+ZBjQCu6uKR1DzHxsP214yb2dZU5S05F2lT
	SDCJrWxGkio4tLNjWPIDxvyVR8yWl4FCto4SNU7sC2RjKxmxzyoFnGDKjEQKGBy+Sz4k517PMSM
	E/3n/3KBn8IHrzqhjk1Ob5+MSo/Y6dqyPrGJqBubgqNySCM1krcN9QGeo5JC0xdUpO0ZmGImcW+
	ll0ZdIcVwG48JvM/1A4VA7ySvs+811sJjLvQnuXoxmCvMjDQRkM+AI36RfYkW8u6O3cxnDN8PX9
	IadN8UMobhJpXfHNS33qpe1DbnZhDZyD6qrufIEw0C0v5HvPCI1Pez3Jh2iUi7CzO4d118N4w90
	kKhz2kQauT2gqCDhP3RlpcOyRBoFsDg9v3TB5RY+oLszcQiTTIN3c0f9I3nmhkVCfuJGp7UxwJC
	Yvo4GoqsKx894RVfewxgxdy4CUWWe3Q9e7k3hEPGO3OS57bCFbuiV3F3HbzxeizNTZ/NlLjRDhR
	LnpSke0DB0h4SxO7cwwVd2udE6I3E4mWtGGCr05Bm23x3U09VYTrGpSSzKENxb7ibcpzXsBmsmi
	EV9594anlUMYiysfmRnWFwsv6m1pybJTJf/8tacRCzUKq+wy/rGAyP9utidC13FjaQAO6Hra3m2
	RfBRtY7Wh2aRL8mUS+1o1Ms3BoXRP4zpu1xDijyXF+l31tA==
X-Received: by 2002:a05:600c:3d96:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ba02347dc6mr6849605e9.17.1794257964075;
        Mon, 09 Nov 2026 12:59:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c99bsm1081150f8f.7.2026.11.09.12.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:59:23 -0800 (PST)
Date: Mon, 9 Nov 2026 21:59:22 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avIv2GfXHuOPWJzC@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
 <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
 <20261109-stature-splicing-a146b4cfaad4@spud>
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
In-Reply-To: <20261109-stature-splicing-a146b4cfaad4@spud>

On Mon, Nov 09, 2026 at 20:00:56 +0100, Conor Dooley wrote:

> The "document" in this case is the source code of the firmware then.
> The info might not be printed in the TRM, but it is determined by
> something, Carlo had to get the numbers from somewhere?

Yes, I got the IDs by enumerating the clocks exposed by the running
S7 firmware, logging their IDs and names through the Linux SCMI clock
driver (using a vendor provided firmware and kernel of course).

And yes, the DT cell is the firmware's SCMI ID, passed through
without translation. Renumbering these definitions would break that
correspondence indeed.

Cheers,

--
Carlo Caione
