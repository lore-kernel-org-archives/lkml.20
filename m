Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794186441;
	b=oN0v4JFe6pmPYM0br0wFW593YY3MsHZxFEtPVg/LQoiG1FkbEtbOyuowRVEF2IPYFKZW
	 ICJsfIAyGgimcmLgdPQsdc7UzPePqFsFCnWwW6Y1h9SsDjgdDzETM76VUBADXMa9p6M0/
	 ebJDcQrcrIlm+sp7jYqCjsvpl3uIMUwDNvpLfuUP03l31WwtYFcMCNjwwI6XrkNB9iRqD
	 Unn95t+OD25uhQ5SYPMAGLf8Nk3novRhclJV1iC6x3RLmEpsrtPys3pDrmHKzmDVSv48n
	 sanoBRb2UV3ojCh+YFdKGjgBpA3NcfkxVfxnsr/8Gydu/Qps6iGkIQqhoU7YSB1aCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794186441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=H8LL4QavzVaz8U86ha91aoM/kohbLJcMtYgGD3jemMM=;
	b=XYZnm98TZGCmMjPWYoMzQlw+zlHbWnOY46u4KHCzzgHXspxpSswN+6XD/v++R2HOXcXF
	 sAVhHmDfxL12xoSenIInWBgNdLQ6+S0Wy9nfOyLXVZFN/sxvsOZX2+eg0Uy4zOYlT9rHR
	 oaGiax4bdxy4Ay2zodqzdeQYnIGpahDhUp2wxAnsUNcddA46sjL51nlEMDmFXoo6IzubV
	 PInjdluNt+qJgGxM/ftiFZr9GSTiQZ+Dec2uatSxxf+OnMyq+kZkoMnRicqbEfdT63sGy
	 HAsi2SHYMJknRTISI6JFO0NpUeYnKj7zieYfJaY4nW35GFLiy4YwluvYXgUmGUyZTAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMw1bSYd;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281DE606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281DE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMw1bSYd
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6774639a8a4so280051d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794186440; x=1794791240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H8LL4QavzVaz8U86ha91aoM/kohbLJcMtYgGD3jemMM=;
        b=qMw1bSYdA2G4Ithpx0ZGJFx93ETFKzisXZ2X4c8mjE2FWRjXSvf5mc6udtFkC33REk
         8hHVm/RzeleJFxt1kVDP/AkmIDGZzySGZmvpqjOMTVksT62q/RLPvnITrD92RKLmIHof
         2NO1TDeVh9W9CFbOcR+Ky+dSeOBGWvrib+FpwYmnXEk7nRIs3kjYTy/XQpif9G4jp0xr
         mHCNZ+aWbxhskpiAZPqW04geXtQTVYjioEFWnx+6lZiEiXKktwBOVg35z3bJZMBf9e4i
         jXpMpLFk28+wCCxjoxtFKrJr9JRBNZuKbSyanY96M5oZ2oi8Edkxg1w81boUEh9jFqMn
         y0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794186440; x=1794791240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8LL4QavzVaz8U86ha91aoM/kohbLJcMtYgGD3jemMM=;
        b=FnU33prlw2t3mqSf+dbq11UvnrbUvNciAO462z7V8gHv0FlZb3tvY957DY1k06iMlv
         mSo+Xo5sEvtZm8l9eMaMw6U1o204N1nYXmYkMfiSu8mUijA9y1+/LdGkvxnp1B8XBtl9
         lwrCMF+HzmT0nGqApVh5vBvVZyFTI0c4K71Irpm99p3EYL55zD+Nbcg0MYG3iaUnedb4
         Nc5FR/nfsAa/ic9KCn1ozOfuH1aWTzlHW40J56dmDy7L1qP9Bw0Qv8tC7NIoIVJnrh74
         bvGXicEcUo6WzC1udWE6eoHeXszqyny0mpubAs9ME2wDAmeIOvVsKeUgegP3OoIFQYCP
         fuPw==
X-Forwarded-Encrypted: i=1; AL+hErFJxB7BadoJJj63p+1ojB3H1giulQ3vcl7UGqai8MT/zPfRNQmD1vGnV3UPOF8NPrWsCjadT4EKPCcZ5Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KzeVlKJHPiNQxgRDPZpB36yRMSOFYWCrXm3wo/LMsQC2SbXJx
	eRlbC1O0sRtQb3SXROjWMZBit8p6HqyUL3NmZ3raJCIL2xF3Dxp2G6Xk
X-Gm-Gg: AYBFou09uuw5QCAw7sI+JBVV2jLM5syXCZ2KChzCfz6z5G+O/vUqfUnd6FBQ+Cm4h6Q
	knWQzgRx+ztVVR92BhPcH5a6/SRwEPb9Jw0/bJHNwfIsZIF5St+dQibdo2s5TCz/fPd7BevkomG
	RBFpE6Jlhrg6QvsLYakLn25Bzauzyr2jELS1F8uAt2hh9c7nXqY7UcGkFiRvvj4CgMYrge6DIPZ
	/Z1BMkoAGll++MTqSMC5NYmNyuCwuPm+BtrVxtJAQcSin6RkmjX+UT1ZyTn2OP71so/8gi5Dva6
	TLTc1ZbaWbaKN7p3BzE0WlASzLk5heM5rp2NnGZqx/bAakIWN75IiGAT3fso7YwtA0Qpc6gl+JO
	VjGaKG4uVRFpJAaDIvT9YaUpn5qwf1yJT/Pr1GoZ3m6Nr0TXdGG8BWhuPB23fO0L67dsPzenC6j
	kTCj1wHw4lKxEHuOW/0qG6WhIc1WjYNIXbAwFMJfPoTtLcDJ5jgmQVxjDr2ozZkiFaW/lWng24l
	PoANsr6QmmOx+pSfgPTKz/MHWBU8GPwNhcG2y/rOmYBgLBcHoJpXuK49wv+h8PG2DFz0/xFLjjS
	MFUUlSiaF0joKNCX681tTfxfGoHS3sjJA/A=
X-Received: by 2002:a53:ed43:0:b0:67b:ff6c:bfd7 with SMTP id 956f58d0204a3-67c3da5d148mr1145159d50.73.1794186440116;
        Sun, 08 Nov 2026 17:07:20 -0800 (PST)
Received: from localhost ([2804:30c:2705:e00:f991:19e0:eea3:4f90])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b83d780sm2931938d50.3.2026.11.08.17.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:07:19 -0800 (PST)
Date: Sun, 8 Nov 2026 22:08:37 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>, linux@analog.com,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joshua Crofts <crofts@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] iio: adc: ad4134: Fix duplicate data_read mux state
 request
Message-ID: <avEdFaY6xtzGaGTu@debian-BULLSEYE-live-builder-AMD64>
References: <20261105033120.387616-1-nichen@iscas.ac.cn>
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
In-Reply-To: <20261105033120.387616-1-nichen@iscas.ac.cn>

On 11/05, Chen Ni wrote:
> devm_mux_state_get() is called twice in a row. The second call's result
> is stored directly into st->mux_st[AD4134_DOUT0_INPUT] without error
> checking, and then immediately overwritten by the first call's result.
> 
> Remove the duplicate call and check the return value before saving the
> state.
> 
> Fixes: f12ecb3e147b ("iio: adc: ad4134: Support SPI 4-wire mode")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> Reviewed-by: Joshua Crofts <crofts@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
LGTM
If still worth anything,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Thanks,
Marcelo
