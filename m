Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773324;
	b=w/RjapbN7obvGlxAxffwhOtxvMZ0kagG27BKowG2KpQrDmjF93WnWbVZ2zeRWKWIUOsd
	 ZiAaAlg3j81EHEnhiX02Q43IV8a/tg0TMVQSiXGjzyWKCx1jghF93RkRKUM3oD50t2JHy
	 KAreHacNdirL77S70zXnX9z0Bw3W9AD5s0yvxfB11DdjzYJPPK8LTQ4hqI2gSiKiW5+a3
	 ZdORDS/cNOnpocPR/vmQJKp9tKOH7qANzL/17c7i7KO5F/IPeFkaSdOEZnUNSZtUv5MpE
	 AnWqPo7ZElLpCDODOmS3eXJh3Sn7gYE8MhAW9PUauvvxRFrm3YH47lqJvwQMTHMJaqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AqcQe7O5wAeagY/E7/oDRIMbBP90oX0eJ6ciW8cwB1M=;
	b=spPvpkn77bEa+yDlBh5YXR0+NXAFmNe53Rw71hiwjd0gzLpNagMJLqqD/IOhbEJYl5oG
	 zOya21IhNttzgB9H6PrP4+PiuNeUKNEu6ZOz8iH24cRPlByqBiSPhZ/XfEbWVcGI872yJ
	 PXJqWHK8JUFx+tYZwEGEdZQ3tC1FnG8qYmQtP1kKwN/FdmwxBXFsK2DK19MNofrqm0gP/
	 ptFEX9csT8N4a1G+wuxSkL4+LVINn+xf1PSiK6eq1EpchQo7qrqkH1LTfkzmsUmbxW7hc
	 HcAon/kvJO3UG1sYG69knIdwcg34oVRl864fnVyyd2LlG54VP33qcvo4n2rYf9dnomg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=l+fhr4Di;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CAD606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CAD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=l+fhr4Di
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso633282eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793773323; x=1794378123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqcQe7O5wAeagY/E7/oDRIMbBP90oX0eJ6ciW8cwB1M=;
        b=l+fhr4DiGZDbmsbfHLl3m+wgauKtSWLKqV98f5SAW9wGnlDpA696MhJJNK6jVrGMxv
         HlGN9KAghZRQFwzkCd/sE09qxydIdJ5aVE/4M3r3I6Q2WtsvDgKLnsS35PPdj+WU0mJr
         /oEKimB8lihZnytn/TScXu1mnHXUX72pRuGJs/ldnN/GkB8hWMzlpjhyI13h/+eh+f9x
         1deNaLhHBmbFVB1IuVF0RQVCcXVzOc29nn5xQnGC/FCPZ6NRWoGeRBWeWxedByzBxao8
         VmKsfpdQbUnMeeZ56CEQ1QfAVcp41CABRLFe3Q1h2vcX/72iFXk6vPnLmJaOgBxAQOzq
         niyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773323; x=1794378123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqcQe7O5wAeagY/E7/oDRIMbBP90oX0eJ6ciW8cwB1M=;
        b=vI1v85pbszySqqACpVwis+fDDNxc53XY98vnbBjWHV8PsGoX8ZOtnyU36Ae+M76IQU
         Bly3GG6wqxoEwdegkwF5ZziYfpMvFvcFygsH0TXNoIkOVEPqzoYoyhI695j7z9aHwNQQ
         RykaO5f9Nesc+wcjAMwCqeplWomnOMPCbp41BuiDUjnHnJyKKrge6vJfdd6iYbHIGRb4
         GZIyQpirI2sd7ZZCcY8QhXbCb2XEo7L/09iYAciJIjKB8/cnNVE87CNNyIXG0mWMEdjx
         SZOdl4imOpCRRtAHg1IbArOkFyAXi6n28iNJwWUVmt7f6ZVD+hrNAck3nXZUomaIIUSF
         bDVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6GOOM8Eh9akJ5YSKWmhjra/wcWj2PW+zMBwkht+lxXImhDJ0s5RqHoJuDd8TpnC9whbkBlLBlOc0PkuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z95WxrBvjxZuWvC2QzN0j1kbPIYoukBzVWdBL9/Q/ct82p5mtdX
	UtQGuW9V8LDQCrjrqZFlA7d527jxWLoKqSPu/LqGsfZ1zz5EIDN+ba0+sf+wha9oqiU=
X-Gm-Gg: AYBFou0uLiNFCEIs+rZpOm/6HGI/KqjvKK3qIcpQ0HBLrTxcczsuZz5ePQhQuPXubqt
	mAUGYCZFoJiwpeb2nG9enzaLeycFgvRVIyAZ6WKf0c9YpKDYN8GWli0ahNYyRIaM6xboTf/LZRS
	lxpnhrZDhwPG/AAacjLRJnW95Vxc0e/AJEwUVHF19ZCPn+77EG4HntVd2VaJcgEQp0Qhf8PJt+f
	6E4UKQD3llBqBQp4ptNfvJE1rB56LpzbsDyHHDFYoqO50p/oI5ikNlbRCo8arLaSr+YRmFk9tvu
	TOvnH+b1U5UmjoPZUbI7KgL1cFftYKHI9c49VcxBP788+B3G/k2lP9l+OFREMI8P8y8w8OsS13i
	QuzR9IoRiRMQrvv4/Op8bOSF46OL4unXKTZZViKymQKjS9WD5IEcLQkZdi34WF+kK1HzCnWg1Zh
	L0me4HnzBns+wxAYROJI3lC1EngUgNDkCL+lBzmxBB8vq1+HjfO5CptKHNFBSi/dYkz4vUigduG
	eWXrviy5/zIjEANlM8KQxhrCoz2abR5TPMszrumTEnkU6LFIkYEdnwaSk4Am+wlk+pO3cxm1V8V
	lcAN+PVdADZeW+LY27zPAhz5dBEl1yYHfalmGfltkcZ3pn+o649ALODBqx0=
X-Received: by 2002:a05:7300:ce97:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-36a42437327mr20872358eec.39.1793773322655;
        Tue, 03 Nov 2026 22:22:02 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F ([61.251.99.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm6173162eec.3.2026.11.03.22.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:22:02 -0800 (PST)
Date: Wed, 4 Nov 2026 01:21:43 -0500
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Bharata B Rao <bharata@amd.com>, akpm@linux-foundation.org,
	bsegall@google.com, david@kernel.org, dietmar.eggemann@arm.com,
	joshua.hahnjy@gmail.com, juri.lelli@redhat.com,
	kprateek.nayak@amd.com, ljs@kernel.org, mgorman@suse.de,
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com, ziy@nvidia.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion
 bypass configurable
Message-ID: <aurO98PC4TTweJs0@gourry-fedora-PF4VCD3F>
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
 <20261028041253.74839-2-lizhe.67@bytedance.com>
 <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com>
 <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com>
 <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com>
 <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com>
 <c9cf96bf-f3b1-47da-b22a-9600b5fb01be@amd.com>
 <3318a7f7-4dec-431b-9284-ec7c2807151c@bytedance.com>
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
In-Reply-To: <3318a7f7-4dec-431b-9284-ec7c2807151c@bytedance.com>

On Mon, Nov 02, 2026 at 10:56:27AM +0800, Li Zhe wrote:
> On 10/30/26 11:44 AM, Bharata B Rao wrote:
> Thanks, Bharata.
> 
> I would appreciate further maintainer feedback on whether this series
> looks acceptable.
>

I will give it some additional time when I get back to normal next week.

~Gregory
