Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821840;
	b=HR35dp6Abu/2R1hyT2W1Xr30RU2XyiIEYulxSzv8NHPFhXsC/JdpsNZC5q/cMDCdsWf+
	 FhOLm9fkcdViRIqpVl6ifmueXJxCxeEppZ1WsC3lyG1YIvAM5oqC/iJ7jSB9ughC+jFMv
	 ucqBDk3E1pPOpoDbV9QZNN87bZYe1SxeJRCTIL57vjzJqCVNr0U2feHJPWSR+qgypm0vi
	 7rVm7X3mQdzwJT5aS3ARmfS8622lKblqiv8iH01o9XdFRxkmAIWVLqYfULS9wcjO7eXyN
	 eLVDPuBYFUsOMAeuMB/kfHcqeKJo4w9s7GUsWuyaaDQWBhtozsfL8zNsxbkYWthw0kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=RsYO5R8L5LVg0yubVJzT2dh49z5DZCuj8vx/6J0uBsU=;
	b=MmZHVs4EUkV9SId+CtzABnf45t1X2ACx+wNrIPQMSCjCVUmXY7Rz97f59c26roUQFhMs
	 8Ni3FIw8ge+cYtMjU+oFgmciqxEjCQxcyu6+rQXXePjM2CUI/GZzRCBBUIPxr0rBeN8tp
	 swb1bPxOFC2+ipPxn7WF3IsqCN4LgCRQs5Z/k7oshJhWqA2qAdo00V2IH9UEbjkyN2WCi
	 jQp1+LafTyPniDKWJ8Kt8I11aeygYNuGWm0RFDCdFr6Y9C6ieCxQyq/PgrL1pJgsxGIv7
	 6V74mnBTJkXqTGNyp7DyIClOEqh/+nCkkEKcNgzbiy8L0Z6JkXbYlwv7t3L284ea7ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MG27KUQM;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A860954DE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2A860954DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MG27KUQM
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490a0e72588so440776f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793821837; x=1794426637; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RsYO5R8L5LVg0yubVJzT2dh49z5DZCuj8vx/6J0uBsU=;
        b=MG27KUQM5Y/sluPIHfuwpht8hFRunYBDE5XpEKeoFZ2Nv5z/+Wf45PB2N2B0pPIr0Y
         RYsxgVA/TUTEPjsDG+8GXB/moPjPPjDuskppEqeB7UnMD1K1eqfYfcIySKOKLK5dhE4q
         BQiG/CMBw0U7V7TWpJTrL9djiOSNE/3LQdzN+8ptvWyoxzwXafj7YHBndBR2lLyyzXw3
         l9rq+3X+tSVubUlh0BsgGTc8u1HvEoL2Qvc0dZaoye17n3WHG8HJ98j+ghBGLxEzcPgC
         9dC7CzKmSyUts81qRqw2m2m6T6i1YpTAr5FALmc1Uy/FgRNDbnffQ2g1hfAszgmd2pGd
         1JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821837; x=1794426637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RsYO5R8L5LVg0yubVJzT2dh49z5DZCuj8vx/6J0uBsU=;
        b=pdQ4DKVi2Cp/cECuPCr8i7WDnddGxU6OISCj/21mHVUq3F9pFsojWnntH1nNllK/mE
         WwUXsKbHXgDsZTlacvfXWuDRe2ZbDrcH8TpsdfatYVSY5LBkWDRSkZVBko8LlrDH0k+a
         R5EbMsXXxR1wEQteTzRUYe60JLCwN72SXfmizCpynzSf6geo5zHERTtrA6+kOydDtnIl
         g5ITEYL4F58iGQAgr/HaadV6JgvAjJkZhJMX2x8JEhwTZfLEisdS+gzvsrp0VGSZ1ErF
         HzK4BFWCbiFU6vzTUy5pi5s0dmVfz51eLnenwEBb9zvA3LM777x1+QtK91VkSJhdgN8F
         QO0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlxAFFBEslL7wBlYwYD4eSv/DOmMpdMogKXo8Pks9ecbnPHze830IS4fic4CmSOSk9JiQWCN5PGxNHPtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yhl+KpZbBnytbPwzBeSNHJtx/lRM0I38LJsELTdViHvkXZj4H
	Z3YQ/+UQRUesTuuD9Ynt/LSskrbdNSFOaTFAnrlSAqpBMaxCtlCRk7VY1y09bS6Jdzc=
X-Gm-Gg: AYBFou2iTrD9RMDZgwiXnW39/nOxJIcgw5LPpWpqSXxEFJqDEv7BJsKDg2qQQCqENFL
	S0INi2TpVwLsObUmjfL/ROaUn2ei9wiMC3kzwyQiME7NCCzNtwqK7LKux3WXr6qe21K2rsuCwMW
	DlV7dxwakAQ+LTqiMBDOTt7syiHT8SBPMYtc/3LgHfERZN7XZsv1SIaLNw2aAvqTm2jC+wmNmUp
	CpdwaCXCOH0k8kj+VIvypKszrPvPIWIZRgfZk+4nM/Ez8ynKHGR0lqqVwxYm5Q8RVbJRSkb6BV6
	VH4/vsz5MdmXmlh5b6/hrrEG94LKpDRnKAhLCvSQBMfKsi6GdeEf8O5N590IU+aAtVpAKZ+XLqU
	cJpdLutvaMWZLQtX64mxnpnacTsLQpZyT29WACxSV8u7FqiN3rrDLoDeqFKv5jJNIHZepXy//ax
	KcNCY+b7Hlrbjf2wWiZ38JiZfRfiDc+i4lFaATjtWn/8bLtD6iIwXuf49S6INgqMYesoYpmmg71
	bo60Ogp7AYqomghrmNujNaBMXNgDLh0eQCoCgboqz6ufUDyq45PjvOuCaQLwWwh1ds9STl+J+Ds
	lms901ApdTnY1VJV81994VofmpcRv1moQ+UQ0Ifhn5NElnY=
X-Received: by 2002:a05:6000:4021:b0:48d:e6f6:21cf with SMTP id ffacd0b85a97d-48e6e306900mr38286580f8f.31.1793821837378;
        Wed, 04 Nov 2026 11:50:37 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:bc85:7836:468a:a1a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5538basm5325940f8f.44.2026.11.04.11.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:50:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Nov 2026 20:50:28 +0100
Message-Id: <DMMORNOEOVC1.W8WMKFFWRVGU@baylibre.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Daniel Mack" <zonque@gmail.com>,
 <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Julien Panis"
 <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, "Francis, Sebin"
 <sebin.francis@ti.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/4] dmaengine: ti: cppi41: Use td_queue to restore
 DMA_TDFDQ
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com> <20261103-v7-3-topic-am335lpm-cppi41-v1-1-d7213446c5f5@baylibre.com> <autue--8pip-cNQk@SMW015318>
In-Reply-To: <autue--8pip-cNQk@SMW015318>

--ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 6:42 PM CET, Frank Li wrote:
> On Tue, Nov 03, 2026 at 08:37:28PM +0100, Markus Schneider-Pargmann (TI) =
wrote:
>> [You don't often get email from msp@baylibre.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> In init_cppi41() td_queue.submit is used to setup DMA_TDFDQ. In
>> suspend/resume the same value is read, stored and restored.
>>
>> To get rid of the suspend register access, use td_queue.submit in resume
>> as well to restore the value.
>>
>> Cc: stable@vger.kernel.org
>
> Do you fix some problem? why only have cc stable without fixes tag?

This in itself does not fix an issue. But without removing the register
read in suspend the follow up patch would not be enough to make it work.

Best
Markus

--ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCauuMhRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOZ
tQEAk5I87cijSBP2K97rUA3N6Qdsw4NGsd6NwNNQXdTFSOEA/Ay25+LZG9HzW52x
Y0gRoHYQHeAJZpoTQz9sRHXM0LwE
=sNxU
-----END PGP SIGNATURE-----

--ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3--
