Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.158.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211069;
	b=F72rKhGUO3ymgKgOMjD6VNWa9Ru6xuTeHVbhoD8qGD8v7lbZTocSvcAQyC+U7l3tLq5u
	 EGj/0Fuh9VO2OhnB3OJWbH6iZrSAAnlwkbtYERCwiL9wweuLcA8ogqqET8x/jEldG3obM
	 TDSynZ43SPXzHuWx0OPnflUuy17QTWwZ6U7n/yS0lQ7ozPKOsqjwmi8XSC0uAI3gUD+uY
	 KsSRCQzBWzWzpzeuizk+NJWiEvZONaMZKDxvhvthaoRIsk/b5JN/aEEdkdsOpEXxu+XQc
	 Xm/hI2L6ZeJ4UhA3/1Hf+ipsYk4Yz1+eDatC35mVPCpHlYsIWd7mthrJ0WxloCdhZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211069;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=VDbNamPJns8sLjPAs6c7PGvkCbm6g9zSLY0qHhUmb2I=;
	b=qFoQ4tHkG0ESLcdFuFizmSNvhqJcnwCv8S7Cu9Io/wtc7uIOp7GT7ZFXjZTvGH2hJ/Wn
	 p5idqwJp1BZlpiM4Q0EATfYChadh+MotM404iISasJRf5VY6FrKnRCffDKgMgwW5t6bNH
	 ULkpGz3N+evOMTUdB8u2fBgMf5Slmaw/LWGMXT3ugGEbFOpmTZDAjdKymLFLdagz1homP
	 Dcgvn8eZAw6OSWMR4SZSL87vEyKPp4oDgUNmt0rXxb/c502/h0n/cWkPL6v/cCuMtgDZn
	 JH6J5Tjug8rA82uAXoWxPZZIuJ2O0Ju2F50lXJ5jpnj+npktrsu2/W5nTXs8G6N+kHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=gaIXEMaX;
	arc=none smtp.remote-ip=62.149.158.146
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F375606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F375606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=gaIXEMaX
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id QKG2xp0aRyeI3QKG2xJar5; Mon, 09 Nov 2026 08:57:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1794211058; bh=QWsFI0XajbVghJcbJXTi3SjMRQ1Pa1LpIBxvVcOzV4M=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=gaIXEMaXu5xoxPvdjkyJS9sazagMDEiMWwIbjfczd0NCW3RWmxrXZxqi9RWcQjxMT
	 SKIJv3Cy2zDlflhQoxilWZhkUQzlExSxnesVynIqvqjyeNxiK5Lmz8Aqohn6Uc7KlE
	 5Xp189ItbRRKwC/+N37CaIctHIBhfzhN0v3xdxDv+fnxZDFixjGJS5t/HUQfr/zvdN
	 EZ+RrbjoA8VGN04vPXYFbS0e3wr4PSaRwyR64bNghZsXf8Uwen6losonsnHrQfn7Vo
	 iD59xHUePORltY++hPrjVZV6TXBM80sTKCDaMO8WWc2mLY+DvBSl2gDbHLAqpVOMSD
	 /NWZDAU8TgyKg==
Message-ID: <6f78a7dd-132e-4eb6-8f31-5fb506508f20@enneenne.com>
Date: Mon, 9 Nov 2026 08:57:37 +0100
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
Subject: Re: [PATCH v2 0/6] timekeeping: Reduce magnitude of ntp_error
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, Jie Wang <jie.wang@intel.com>,
 Yuan Wang <yuan1.wang@intel.com>, Ryan Luu <rluu@amazon.com>,
 Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org,
 nh-open-source@amazon.com
References: <20261106030856.2538039-1-dwmw2@infradead.org>
 <a5c57e49001c9777d8b6fdce71ffa743004908c9.camel@infradead.org>
 <fd554169-8870-40d9-83a7-fdcd838aaa8e@enneenne.com>
 <d57aacb77f84c7187a228a8f9af5264c3d6cffa1.camel@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
Content-Language: en-US
In-Reply-To: <d57aacb77f84c7187a228a8f9af5264c3d6cffa1.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKo9BFxi/RQBjIOfJGZEZ0QiEECwxTj01jWYSJlXANakHpBoi7hXrtnIowS+fmQmZuOaDSc1Spy/1YscOuavnvqt2ggUAyX+RKqq8qkXz+rr5DRamDxw
 9zRqG8SFB/k7HEXYnAi3prhBtC1TM2obx7Mnf21lCOrG8gbxxRhU6MuRe+QlC0ZMcZdPm6MbwKGP7QMqyGrWeZp+n1bxacpSzAX5+vWEN0uyjxAQqzNH46jp
 xmL+2VEyu1LSfRxHGCzYhWT3JRenmvbjTcOiSgJQFwUorGMWgi73z4x5okpznpx27mnEiPexragq6RASQSmkN3orunBMRA/POiBWDG1w0sGhOoqnhtDVBRWd
 QFc7EqzZWYlgRuqcouNn2/0UfwX7sjsgvndx71IBp1TgVLsxULtu7XKQ2cp5nbdtrwVV7EgXvuhGbvPLYEOjFS5HMc4v5zCY8usdDm4PnpDRnH94NGWVSy54
 kbnuIIVZA0W5hMmRhKmzWbb91xDIftbfK+B0gvMjlodFWFyY08lmXUCpeZMP0SHDhZkQ5q6VS9mJz5O9

On 06/11/2026 19:05, David Woodhouse wrote:
> Ack, thanks. Do you know who we should talk to? Should we be adding
> them to MAINTAINERS to be Cc'd, like we did Miroslav?

Honestly, I don't know who is active on the ntpd side these days. Your
post on hackers@ looks like the right place to ask; whoever answers
there could be added to MAINTAINERS as we did for Miroslav, if they
agree.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
