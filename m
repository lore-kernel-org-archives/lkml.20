Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815150;
	b=nqsEWXKCId4KxfA4GagagX8Dk6G78BtVNjMe9yGijepPba8Ju3dbZoFSdN+gf+WPQcgy
	 Hb+atJY0BOYQHEb4pterGDayD+tRam7NzZemm2gD1dIoAwynF4ESIWcd+5Exa/W3QHoI/
	 DLwlTI7LOs989hfkp3cDt61aMc0XupYMICY0st8MUloy1Rak8ZJiOdcqBzUrJgHEA0Qi1
	 ZeI7Aqx4/ay1JbxtoOvNS2jZCZbOQ0fCQbcPCxu/lrktnmbbjOLcR5EW3Q7VD3fCVu6P5
	 UTXxQeeo9YsOp0ePQcOApHE/JQGoif5WTscpNKwfgBf/I+ct6hZ/R+h92Fuvw0CNFYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=zmgK2rZQB0Zps7NPdGicEsUeC+FDAzmra5NHyyX5KYA=;
	b=3ycaInzcD27tS/0sGpPTIhjrQQF1WCUFXOwlDLxD6kSCEzDczFoqND2bTtb7bC+fXdvK
	 WgtThlSi1JFmPkJkRs93Li3s9GMa58qG5gVZJGLl9NGMUhqjkbCUgHq1ze2Coj89ETWtu
	 J0jZmSHImMKhVBxVMdiwWlEJXHu1MiB9Ww/ak7tWDGfb7RpJef9vXLK8VgM0EuFKHGL1U
	 v1VBXBt/yQFmkFkp3OYF11qDaq28JfptJ/nTc2K3avUHW9v/OW9hSOngnxfAH+r0xiOBu
	 U8w66pu3T0FxngUo+ioC4tJpNvqxBj2pr0EIBD28lQn8xR4PsYepJyhg5reIHxjkTzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eon5LALw;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D69606A8A6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D69606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eon5LALw
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9779aac8so728779a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815150; x=1795419950; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zmgK2rZQB0Zps7NPdGicEsUeC+FDAzmra5NHyyX5KYA=;
        b=Eon5LALwWF4LfJWvx0rLOJ9Wff3uR4DX5Txpe2eizNWBt3ur8KVEqMi91StWp45DCr
         Mi71YFPmCOnv0q61HIbvZ4ll3HPTeHNIBX97NrQJ5yDvFxOL4oCj4dGzOhzxIPu2qwCP
         YQw4OAfxQnEtNQ/mucdSD9lJSkhjFulTJGCjzJi8SRU44gwNVVnBwZNrxNT+L+5/iNyc
         v+b20fC4LL/221FzeGOxIn577wfLvrmdl5MMaNLWRmSIgwOsbnvM8QXhrYA6HVT3QlLf
         6qcbtdXc+SAhKilXtFIj8AHgRqi9Mvko7rMScwhHnzlsFERXbdtecyRoBc61SUXEZ2B2
         W61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815150; x=1795419950;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmgK2rZQB0Zps7NPdGicEsUeC+FDAzmra5NHyyX5KYA=;
        b=EwMg9C+JC3B63MDbmsZWWP1FecWEltgOyl+RgQup7F8exVSpmaEkM9R1aK2xgcO/9p
         3ZxFtU2gaOtptJIG/Id7Nj5+PWzhxgNeRwqX/g0QRQf2SKm5/qy4HLHyAJzY37zdC+EV
         TPLmnQ4ZbKPrjyIwZtgT1AUIFOyA61nwz7w9H/zdPg8QquAKWtEAR30MKWvdx8KebQfa
         d1mSgr6VuWbqdn2GGCN16wJaOVV5Iml9tzLKjGrFnUQwOLtmZjPwAYz1neALDXAeh69b
         DJZI13xvqqJvFYQklQ14J4fbswXni654VfV+YRzajWvBgStE12Wz6w9iDSHL+rUp4Mds
         2wOQ==
X-Forwarded-Encrypted: i=1; AL+hErFGIcmMWYVNFb8udcGQnut55huB+EzS4d+gmvU3/nnMrpk4ZfQl+gkkaPWOQvlCZfkoZIk4bDQIRGulQnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QAaoZt7IU/gf5dfCiYOl7z9qPV9J9gomrwVcjt8GDCezbglfd
	w+r4v2N8NygUTnIu7x8tw4N6307+Ee6f8/c/AZGtG7yCWG8xOycDrLg63oLbbfxv17oW322s
X-Gm-Gg: AYBFou07YSbUZNQVbn1ibhqo9aWY4QJfuPvkh1qNnkP15tlYboz/e0VQDh4oiaXD+8Y
	DwNEkiFXwK93Yt9s3N/OW10uH6VKj8oEgPafoIMZ0CSZEwQARJyHibyvlyUOZJdvKDEavBqbipn
	82MwATcaIDuA5yLja86sWuBTc3bY/ZC1oVZITf9XzMpWn+ltmhV5DtUTcquLcTrL9zC/aZ1y7aq
	+cTxsMi5peZ27ueDgB6Eva/eueFIMY4LxGq0hNHmojncweLlRqQGYJcbAFOBpuYhR2Nk/YO6TDp
	CLnSYuC3+pfd0DonGPlRvdK9rG+i+MLh8ZD7uDg86gwb9lquc81/TVR6mL+okKCpbNbv/c+3GY9
	5cTDEUX3B9exYEr3lEbAqHu+jOFcjiBYofo2tDX3VDRc48RIT2Q3Nz52Qv93uIcDe0/JQCpopWl
	/3L2TbEaO/p7CD0jCghMPicMmkWlXP1mTjMVH5ssNF72rZY/Qt71OtTldppAZs1xhTAmtf7NeuI
	4afJGlq5stYL6rYYdnTwJP7vXTNBe5loLtJefh+YseUGt1vSu9UrzHc3q34gvRwh/EjBALxZMi6
	Wgw3PuwkB84ZZ2p8MhGiL25HIxsE4k/It9WR9mQYirrzHeh3y0pysdEr9curZTt2hKhQKY7Dtur
	JIApnuZyjlr/IPw03l36nO5QMuPZiVJtxe/8Xnq5CpmKDIuczfGC8i0RiGqu2jWk=
X-Received: by 2002:a05:6a00:181b:b0:8a0:7677:c8c9 with SMTP id d2e1a72fcca58-8beb7c21179mr8733834b3a.51.1794815149534;
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6dbd9sm3244287b3a.27.2026.11.15.23.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:45:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 14/27] mm/damon/paddr: support REPORT_MADE type
 probe filter
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 16 Nov 2026 18:43:36 +1100
Message-Id: <179481501691.2405628.8067144236288202449.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261115202849.99134-15-sj@kernel.org>
References: <20261115202849.99134-1-sj@kernel.org>
 <20261115202849.99134-15-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sun, 15 Nov 2026 12:28:32 -0800 SJ Park wrote:

> +	case DAMON_FILTER_TYPE_REPORT_MADE:
> +		addr_range.start = pa;
> +		addr_range.end = pa + 1;
> +		matched = damon_report_exist(filter->report_type, &addr_range,
> +				jiffies -
> +				usecs_to_jiffies(ctx->attrs.sample_interval));

Since the window is counted in jiffies and rounded up, how many samples
see a given report depends on HZ.  With the default 5 ms sampling
interval, the window is 2 jiffies at HZ=250, i.e. 8 to 12 ms, so a
report is usually seen by two consecutive samples.  At HZ=1000 the
window is 5 jiffies, but kdamond_usleep() sleeps via
schedule_timeout_idle() there, and samples end up about 6 ms apart, so
a report made right after a sample can fall out of the window before
the next one.

With the queue indexing fixed, user reports submitted every 50 or
250 ms and covering the whole physical address range were counted
about 2.0 times each on an x86_64 guest at HZ=250, and about 0.84
times at HZ=1000.

Is this approximation intended?  If each report is meant to be counted
once, maybe we could keep a per-context report sequence cursor and
check only the reports enqueued since the previous probe run.  A quick
local hack of that counted each report once on both HZ values.  If
reports are rather meant to stay valid for a while, like a user saying
a range is hot, a validity period separate from the sampling interval
might fit better.

Thanks,
Aveline Noir
