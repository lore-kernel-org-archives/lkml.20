Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610857;
	b=EqwNUe3kuiNwh8fyk5rgJm8qDdh5c1/w728lndk1krLULdV3NDVHh97BboZwUQjfCPvM
	 +lSoRjng6K1XaaHVcxd0iW7n+0OY79He8q08FU6aPInT9mbYnP0PTsNZVXPUc2M28G4sT
	 o4ao1G6CSkh7rP8u35C4PboolYUqkyXlGzZdL07kSduRWlOLJrbMADLb1JYmi4B2x/96h
	 gNrk5h1oloymp9di0P/CK18NxeTGPisioKNg/yqTcTSNC2/LUHXTRjnFAuK2T42ofD9F/
	 I2UX5kl+tg2X63FaIRgBcnKmW+LeZ4jkMcYev0NRD5hJQ8uy10TVx4aK22CvK9f7ksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9l2X88+Cluso3aHhPPG2aCJ5eE8RQhXDwPSZjiqGEds=;
	b=TTS9dwXLzty+XtvBckZSqpsI89fGZBpZ+qUvjCnbyIDGup7iok6xSo7Os6eLGzwyxFr3
	 sqNRZtL5jAdRRbB7ZHcN0j7Sogv2zrgZuxTlQwuh0A3GW+lbQTRb+akOhQJHS1642uipQ
	 I/Q3dYdhGfFJMV2YoJMTMzy8KanO/JhSXsD8J6CEZzgQkyE7+zpIFe89fORVhAWs2o0Hn
	 XqJS1CyYjbCrzTbc001FpTsaQyOhmM/wIMCWttyKDzzbUH/e7g2QYf9IHn6OWrDhcFdpF
	 i1rlTJJBuFOxhH7kkhA+/0B8srWX3vlDkKa9Ji1Vo3SpIoaCREOJZGQ5gw6LRPb+/pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0oM6kP4;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB9606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EACB9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0oM6kP4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so4197020eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610856; x=1794215656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9l2X88+Cluso3aHhPPG2aCJ5eE8RQhXDwPSZjiqGEds=;
        b=f0oM6kP46WR4dmdZu0WgAUymTn0f6gib7tq7NgaNKpL1x0Ew3T/uU7llBroJvV+Yqp
         y9gsrGBzR3LkTSLRZp46b8lxFfMlMOAKf/ikLXnN66MyNxKes3Ib9LG0MaFOEHmIqMLL
         jcIuhkf6+bP2mMn71EwG9UxoY8z8eFMvLsjKzZ7F/uUBGZAvqdc1tJn4wRXfGS8iuVf6
         FHz3yQ080CjY6zSiAJlgzJ31TMCBWKgmsOUOAQBC3DIaPjlpT21EKOQKJeeq4OV2ViCJ
         9dZmIBxc+L4u2wvrHmf0J/f7k0tquIUphnL0xZrN0tr5yNNRJM48bFmq6yvFjIBYQnqV
         M7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610856; x=1794215656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l2X88+Cluso3aHhPPG2aCJ5eE8RQhXDwPSZjiqGEds=;
        b=tG1r8kO5PeERNXbz0Z1Ay/8V/f24x8tBp/L4PthvV9tzeX/yORTFbAAsVdMdfsruNJ
         vDiOsCOSI42tVahL2ib4LHp63K9ivg1x4qORr5CAg2EIwJUa3zgRdhmaWX8wq4Io9sWi
         lwunN43Eq3UiRTILc6LoVCVU4qO43KyB2BWGgo6ZJ4ujPLkYV6dLT4PPhOxEdUN/D+YH
         MC4qkrPZlLBSRb+cMsHJTIGrAyBV0IcBanaS45SdvFMJ8OTjniwDm8oNuciP6TZAzKXi
         nEFll7u0kiqLrqeSILct+7eD3tVExBNwW0nDzX1o+SuTuk1csQAvWFTiQjkqtWYwZn2E
         nm0w==
X-Forwarded-Encrypted: i=1; AKwUvByrWUv6n1jZP1wcuWALU3JI2lVdxEDWut+jNevKuJGyEUYdbzCgqj4n6GX4qHCkhabYPLYZVL98KmR57eY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wx2YekTw+AOdnK2UDLVS+Xr7PhBdADcRK/NWA4LKZgfbRYhaz
	19CzvMQboqriGqCp475X4tRsGwbeMhWLx4ZMwHzCPkHK+Ltvr9Pyjr9L
X-Gm-Gg: AYBFou2V8kfaruNaFxOFALLjVDRIkrMPZHYO4hcuHxGD+x2Uw6IN6tk2A181ZbDAEFg
	BO7di2GjTQMG6kjCpRxKFFxRuRCyAjTr5U6YtJZOaJ4D6dImVWIkxH8qBHhAJ7Ngjk5wcCJU71Q
	uNMMNZ2uxexRFxGhV2M37kny8kZHEakSo8sHOKoghUaBt46A7MY/QbvNIqukRU/ajb5O3OlWDj4
	PNkWYE/+TeCevkC3S7vv9i69qtwRZYdHiLgwY+Bss1NLZojKhp66N3Xh/zSPihWC80/fjGmvSjF
	ZAEh7STUn5sQ5Z/oKBeVoVaRRRVxzLK4CqJOcEcewdOMyxBDiwLAh+HP686JpkcWQSlZndnBW1x
	zztaqSDKavJATxUEJ+omf/SzoeBSR7XjUvnIQL0wkHgWstDZVOkGunvqn1xEPdrojMMUFyorq+t
	hltSyCWj28JPNllHYoTeo6v0rnP3Es4tu+sn+cvI0HExmhLjjCxJiJJQyRaYXymWeLyDxYGjc1E
	ty0rRHFnAnoZSz+5UQqzg5cYP+I5jsu/nrAlENCO6Vyym3vHJpPJR2r3YbTkDVs6jJhBIKyRe26
	XHuS5RQ94gDkSJzsJYo5kV7OEBy8C+I6reqF8DLhJeDk+XDQomkJwiL0FexutDSwH3s4RlW6ND5
	xhS/x0npRctOi0l8utNKx1sgTXXmReFcO9MT93kN8pnApSG59/aTHKOVNhvm80NOj4gt6eZXc6U
	RbbeDNYGY0QlNIcHKNPHDMkf2UGN2X7CwlJboSJEYPMA==
X-Received: by 2002:a05:7301:d198:b0:360:db68:3264 with SMTP id 5a478bee46e88-36a42340756mr15320792eec.6.1793610855684;
        Mon, 02 Nov 2026 01:14:15 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm41886949eec.25.2026.11.02.01.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:14:15 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Mon,  2 Nov 2026 14:44:08 +0530
Message-ID: <20261102091408.246416-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <108cf042-5f7f-4b1e-9656-3193744e8043@amd.com>
References: <20261023185652.195025-1-kapoorarnav43@gmail.com> <108cf042-5f7f-4b1e-9656-3193744e8043@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 12:41:59PM +0530, Sai Krishna Potthuri wrote:
> ams_init_module() already copies ams_pl_channels[0..9] as the 10 fixed
> channels. Inside ams_get_ext_chan(), since ext_chan = reg - 20, DT
> entries with reg = 20..29 map to the same entries and it create
> duplicates.
>
> DT binding requires update to allow 30..50 for external channels. This
> gives a maximum of 10 fixed + 21 external = 31 PL channels, matching
> ARRAY_SIZE(ams_pl_channels).
> Please let us know if you plan to include the binding change, otherwise,
> we can handle it separately.

Thanks for the review, you're right. Channels 20 to 29 are the fixed
ones in the binding's own table, so a node for any of them only adds a
duplicate, and that is also where the extra 10 channels in my overflow
came from.

I'll include the binding change. v3 will be a two-patch series: the
binding limited to channel@30..50 with your Suggested-by, and the driver
only accepting 30 to 50, keeping the capacity checks from v2 so a device
tree that repeats a reg value can't overflow the buffer either.

Thanks,
Arnav
