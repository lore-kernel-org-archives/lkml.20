Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743257;
	b=1jrHNwZi/ttFSQ+fmspNg/5Z3z3sghrYNRrGG2RNomyNx0oNKMF7ZqXccSmt6x6dhvYm
	 2wZmji2qxSjEjNRP48BFLTaqr8UNgTAtFsdFrrzCbjsarulQJ5K0PptyDJ+hortKJoqmA
	 ZO3yz6NzmLmPe2240Jh+9/IzpjKlNjbhFNwNZCZUjTQ9oN1iMRAvCBW2pnxs26mowCzvo
	 OeyWT06IZJxLK6Vz2LJ7lnRDeltHFmvwz89bkcKIDxwLSaITAjvPKFHH793QmEwzjyW9Y
	 p2Wr+VrbLs1qVvIUX61nKuRKUJ7mKUg+FlrD52tlXrVdbKIsTqbXrmNXibJMBCAWivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743257;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iqt8eQFqVEEI514bNV5Wj3zV7T1kpDBpS1aHQ38Y4PA=;
	b=ASeRfmuiWOhxh82L1GPJUYZaPr8aK2oEklEYymWY2NYCI3WvrPBLbki7xJjdrw4qctKa
	 mVCPbJfss4AxbzK+8WXQGuXp57t58S24H4kY65n8s1qHWO7vPjf7kqyzUfkt8O0WuhJJO
	 5ZpVDuvv8SR2EdGEQPSs9iPC4rzhPaBA0YJmCY5E0z3UjtKshueBbz44k4ukBqiryOEo4
	 gzZCF8qTawRKWxB0qOYjaBtl1LqzMB1tEy62WfZFrlG0+h/ku0BfFdZiuVqIwQMXVeNze
	 R1NkQ8aRClOc+692Kz/6n7Vg/hsRTNU/eXsUtkxh73F+gMgH5RCXrY/mHy3FVYmJYDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8B4jGpK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE9606A31B;
	Tue,  3 Nov 2026 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8B4jGpK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B025D1F000C1;
	Tue,  3 Nov 2026 22:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793743256;
	bh=iqt8eQFqVEEI514bNV5Wj3zV7T1kpDBpS1aHQ38Y4PA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P8B4jGpKVsh5eG6l4k8xnVZFCp6dpM28q0OokIR5nCLgUz98gOOIvl3UxdMpn8pNk
	 Psa0gSFEf/FgKZllYexAYTGxo0R9fg2o21dB2gFcS7s/OUaOxBLWrgmrVy33qKNpr8
	 I/lBGlroSV4iPB/SEReop9uNCdzfcPlNKfYh4i5h7wtDZAysQ+aC5hgIxoyEyFzxqy
	 HLlLvcIOp5iDXKWRRbXKjQ825/kIK5LVr9RZy0vRcsWc8qmCU5bcWy80roTE7GStJ+
	 sblRznKypGj4mkPGi18a5GD6+I/Oemo8o9vpmJEPJdwTC7clkgxfTu691uJsCr5YIf
	 haP8uj7jhvBuA==
Message-ID: <e0911e13-65d5-45df-9e31-7f99e5600a50@kernel.org>
Date: Tue, 3 Nov 2026 23:00:51 +0100
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
Subject: Re: [PATCH 0/5] media: iris: HFI gen2 features and fixes for VA-API
To: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>,
 Deepak Sikri <sikrid@qti.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Minier <loic.minier@oss.qualcomm.com>,
 Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <2a2gB7bYZ9q2UTG-mF855lyJvWdn3Ba6jqrFTEVO1EAjAIXMh7_-65v4XlrZmljww-5ozkNYL2-lWKTIH4oqOw==@protonmail.internalid>
 <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 04:58, Xilin Wu wrote:
> This series adds features and fixes to Iris HFI gen2 to support
> qcom-va-driver [1], a userspace VA-API backend for the V4L2 stateful codec
> interface.
> 
> It enables decode-order output and larger CAPTURE buffer pools for VA-API
> clients, and exposes encoder deblocking controls. It also fixes
> error-buffer timestamps and handling of non-display AV1 and VP9 pictures,
> which affect both VA-API and direct V4L2 clients.
> 
> [1]https://github.com/radxa-pkg/qcom-va-driver

Is this code based on https://github.com/intel/libva and is there a 
route to getting it into the upstream of that repository ?

---
bod
