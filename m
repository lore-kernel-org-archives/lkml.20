Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487177;
	b=wvf2HmuNH6wtyFhmr1xGtBo0f0fo4CB6aZh11T/816zpMkKC4d3ds1+CGS01I51+pTbZ
	 dkkq9owMdJsso6mSqoPacjshuC3cmwcImQJ7dJ2hlLl+a8A4ccLb5Qm0Ub9xWX5u1oQV4
	 jYeqIkwOUcxpMOSDMCCYqUTzKpPwIvQpH4yxReq6NXhnGHWfWeKfIdwUx/cxQR/1v4R+x
	 oHkTpWdwUPB01+gBCqz4JVGjXZMMevVm/XFz7H1EvsUBJM4WhTJWK3PUAophhIbQ2B55E
	 /v2N0MKmRdWZGIr+OVIWaSnNfKxuScZet+bvs2lb9mLKTst/muPAXwRMMNvV/Lc/EYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487177;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=yMmxarvKuWiv+WJ1CqNuRGI1KSUa+Lm1q8SmhMUX8lU=;
	b=UAKDL+lQNUr1nqlWXhzaPtoxlmBXl9Kb9h2aXhjMfvXUeQ4sbaM/oqjjRUhwj26S0Cbj
	 QZaKhEOItVdB1T5G6q2WsnmMhqX5YoOHSJTVkd8zxLfgfM44tK4VTitYOEBJBzM2lolsf
	 KZBpavMQYgNsSXAl1FVzlwX7gkgzAyAwvvcFGRjoutIA5WPAF/UhBd8iYNZIm/u93+289
	 KldlI1OYDsXJH2AvW3IFMef//gk6wk/c6pjgqwjTDxseH4l0qy7CUC1nawSlLCC5jO5mD
	 kt0RrtXvSapY9awLOD7v2ZzTrkErBYk7sNUz13TDS5sJXH5t3iBd3O9t7hfwuAwg/dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=vJR3YkF5;
	arc=none smtp.remote-ip=198.54.127.151
Received: from out-2z4y-a151.jellyfish.systems (out-2z4y-a151.jellyfish.systems [198.54.127.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C237C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=vJR3YkF5
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jQKhP0k4Cz2x9D;
	Thu, 12 Nov 2026 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794487159;
	bh=yMmxarvKuWiv+WJ1CqNuRGI1KSUa+Lm1q8SmhMUX8lU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vJR3YkF5bhk0HfnpjN4X1uIyuXHSY59/DLOW+M/p6YCYDKOFtxd2Tr1K8C45fRlWD
	 WlsCkxdSwsCpTS51SWkMKbA4rEpu2vW4HYraaaf66N47zHOQ4KhkRy7fhkEFKoiJuA
	 N/MKlbpmY8QN9yPoLVPIJILGewvzcDUPUwHmABNowHeFktDoq2G29w2lbeOABz+Y3P
	 JCVfNHEnDMkeiFCcS7iw1MVF9zb1MquYMfv14VIKZE0UBX38L9qsqU11dEiy1vuMRh
	 KI9kaXU4K2T8g+M3l135BMmf9pXEIz/Z9d3jOSGHkYd9awNPYfVPVUEuOzt7dd6Rar
	 8hvjqUcfQKf4w==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: francesco@valla.it
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: k3: Report a remote crash to the remoteproc core
Date: Thu, 12 Nov 2026 15:39:05 +0300
Message-ID: <20261112123905.2877732-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avTnp6EDSU-0BL_u@bywater>
References: <avTnp6EDSU-0BL_u@bywater>
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
X-Envelope-From: dev@chrispinetinega.com

Hi Francesco,

On Wed, Nov 11, 2026 at 11:21:58PM +0100, Francesco Valla wrote:
> Since rproc_report_crash() is already logging the crash detection (also
> printing the name of the rproc), maybe this print can be removed?

Agreed, I will drop it in v2. I will send v2 once you have finished
testing.

Thanks,
Chrispine
