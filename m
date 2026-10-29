Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267838;
	b=GcqYyiV6gjjnlA8Os7cQF/ho9odXkSytNyCytnMuiIc2cPOlZnM3O+Rwdbn2G2KZDKI3
	 ZyOyFT06Xmky0ZDimp7FrcdMKhCJHfGCrv4rP/5psXV+FzI5OCc47yT8KlfDXNF2eBU+a
	 wn8JVhx5BHVegjOORV9zOvLHsotixGvgPk4zBg4gMJdBiFFOw7gXfunnuhoPhbYLog3F2
	 JXkZPD1i6A0RQ3+4tT1qV0lybZtVIchXWaGH8uHRzRZsd6ivLkA7fOUh+hviqpBCb5b+A
	 hJKOHAC0fCiMPHZlbtrP3MbxP7PgAevXycXvt3J0nqKOwJUGwy/tGsTHgonG2b1mtOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267838;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hWaXPrGDhyWCEUeKdoM63o7PKlFaYUkm9xCkqBAxeQ8=;
	b=U5TzrgPiAspyn9/WUY9y9I4vla9Hyg9CkKuPfJLjec8Obs+aA/A7b98RhqOogl+My8f6
	 FlzWU3PS5mJB58j2Yw6GVU3DApg6C2ImBVbn8VAiW8atwz+khwACvHpKbjzMi6p+6ussG
	 Jnj7mFYnU9u8MyA6fPK2AMd6ut8/D5kO2gDrFVjB0IdmW+UHxHCg1OUra8rwXM7c/YlMp
	 DwpJPusQXF7j8Ly9vAIx9LVC/hx+ppIp00CrXdnevl1DFD1JWUHU0nlDDkJKa4Pi2eIBa
	 l93lWInY0JIV2Cp2vY4Egt79r3fK+KK6Y4Hkt0i9tfAIPa0eh3ASImdfMhUBCjkVVdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W+8t3+4h;
	arc=none smtp.remote-ip=91.218.175.23
Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E68C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E68C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W+8t3+4h
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Io8Za75LZDFiHR23Q0ReXlDPmUPWVZA1pjzJJhGltWs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793267835; v=1; x=1793872635;
 b=W+8t3+4hzBuvDinHlL4/EKDxfKXJ4cubc1EvEM0vXLoktC0n9sSWJmPduSJC7rgYYU5smwZQ
 cSW/Bh7BxQrBADVQivNj+JWahrOFiESZrj9Jr4N8UEwkwbshany87jIUJB9D8FfYbLD5aTZGoO+
 WzvPqaCenb7HrvGiHq/D6bi0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1cb8ab88aefdeb15;
	Thu, 29 Oct 2026 09:57:15 +0000
X-Mizu-Trace-ID: 1cb8ab88aefdeb15
X-Migadu-Flow: FLOW_OUT
Message-ID: <9145109e-0030-451b-9cca-d23eab30a826@linux.dev>
Date: Thu, 29 Oct 2026 17:57:05 +0800
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
Cc: cui.tao@linux.dev, josef@toxicopanda.com, axboe@kernel.dk,
 cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 linux-kselftest@vger.kernel.org, cuitao@kylinos.cn, ameryhung@gmail.com,
 alexei.starovoitov@gmail.com
Subject: Re: [RFC PATCH v11 0/5] blk-iocost: BPF struct_ops cost model
To: Tejun Heo <tj@kernel.org>
References: <20261028143534.135968-1-cui.tao@linux.dev>
 <07deddf44be391f58d6c3f2e4843582b@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <07deddf44be391f58d6c3f2e4843582b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tejun,

Thank you for the review.

在 2026/10/29 04:09, Tejun Heo 写道:
> Hello, Tao.
> 
> Besides the restructuring agreed in my reply to Alexei, dropping
> iocg_init()/iocg_free() and moving everything into blk-iocost.c, the
> series still has problems, which I replied to on the patches. 
I'll rework the series accordingly: drop iocg_init()/iocg_free(),
remove the detach freeze, fold everything back into blk-iocost.c and
drop patch 1, reducing the series to four patches.

The cover
> letter is still long and narrates mechanics, and it still carries the
> v9 and v10 changelogs.
> 
I'll shorten it, focus on the motivation, and drop the v9/v10
changelogs.

Thanks,
Tao

> Thanks.
> 
> --
> tejun

