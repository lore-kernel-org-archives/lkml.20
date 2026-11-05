Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901355;
	b=GzBgCzfAIhNECMdo+QK4jl1ffdgDO9zggSRZVsfMcvXV5YYdex49a1pnsfEMq45VF7A8
	 K5q1D0yi0CFOBHl/V793GEjIEClhgiyJ65bHUqYcgLZGIlDJ6DvPdI48/l8XFpQusYrwa
	 JC5YOYu9C1O1AhHwRrLHCesfpTDzGt19m6f8CKAjbLknHG0wJBU3JZbN4CRdS2oDAcfDo
	 ReEOWqAdtHQvzEfdjmIyMpMv0ijkLTQy7f0iNPOlqv942xcs3NaC6NqG4latK6MumpYn6
	 mNdWmbzvKhvsD+DDenGEt9fCZD+lNFySyXuRDB2HyExZ519gEyH0mrerL6Hm7teRJ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
	b=48ZmapP6hMshj20kT9nefI8VG33F+U/N2x7vDBjW4yoLWjlMiPdZR1KXMHT+B8cKAcgf
	 Le4i2jRqY55zgIewCj6a/gnfSzioCWbo1fZFeForoL7GrlXmJJO5e3x1K6s50vxFPVCAT
	 kAxxs7Ewxcru4vL0IZXC2tzHR2CBCCPFXVI3tf45h7TRfvTmS9ocvqkHT/zW7cnSuDRd7
	 kr2sr+CoN8kjrskXrBGJKCLMl+OChnWbjXXwUZcDl31nhsfGHbvWuxGxFzWBUCeGmMPQy
	 Gct1aH+cxeQd0Ki+or0LJ2oJJHyqROGfgZWs+FCZ3Yzm2eJxFhfUG1mSPvC81kfFz/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi5uigdr;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5357606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5357606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi5uigdr
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36c9919c659so2738758eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901354; x=1794506154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
        b=Gi5uigdrYHN5rA77ayiD0aV/+kPtnwiZq2VcYinUAKrMWWhGMwvJ6ckGfGqs7dqoVZ
         MAT3/y0LALIyPtT+pg52bJpy5nsZWY8qLzhr07n9YhDsldJWyg0P3rjaNjZCc9ntZXKp
         34qXrp713xEK2H8v9TuNgqRXM7yDR/D96VFWca1T7zJG2qMPy39TUHfTmv0XoiM9c1U9
         CtFy4S3TEYUOUcjK3kwOTfiTW4C3iuJgStNLb53U3kvm/1muJi1picQ9Vh+pUU03akr6
         HtSDoYxKdM2TYf9Ar95rPWT93gStbVqFrdPX9Z0a9aj6WJxEqzmbkdbqjkFBiQE9KpoH
         qyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901354; x=1794506154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
        b=r0zCqK12l/nNaqKlQ1EOBZwtOXfGxTsdhjiGHyDpmYMJNIfxtbYhU6ksexXk0TOrVl
         Fb9+6Te5sckw9RbZ2f4YDWJKkyCm8qTrzSRs/IDV963jmLF7RU4FL7M1WTlHR2WICjWj
         VBQ+b6u1searsDuUeGeib7x69HJYt+VBMsFkSIc1pgFy9DQQfv6UPenPdBqzS3mvX/Dq
         hzQY6bSRQjzUbYqmVN2Av51mjVKT77mwIg4KfFl6ITbP/M9l5cxJGQ8bIKfRWhqY3Ypp
         PpvPy83VxzGfcEK2I+li20EBafzuKNJV5hNqo+vRqhJepArnwgdDLnp1X1C/SKJ4d1XC
         LDRA==
X-Forwarded-Encrypted: i=1; AKwUvBz4EMR1WE6FyeUzwSoT1JFp9Fg17wohDRUkb+Aw6TvJaCBL2eWiFSi0vWQdxKAQsPafwAR5atxwM5T+i/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QDOf9DAncWgtiaIcdDdlg6mZI5ji3lBevnlB/N1/mBkdYQNXb
	TTqubGMtmZ21oO3a1ZpfUa7EwU/dXrfQ0RWVsFm/N0Gc1n2WsPgpzXEQ
X-Gm-Gg: AYBFou3VHLbPfw0Mw0NsP/JMno68QAr3iLGn1/p2WqhK0MTy6QOc27+68WPtUNwgkSb
	2cQnkfoGvEdQ1D9znICdSUx9VEqnDBbSAeBz0q+QOQybq/rry/H+InK0nn3MQJFLwey1IOZotHA
	3U0qzXHntyoGmH77r/4I9/BhHtySYbZuVlGNUrY9OISmIAmc/z97suu7i9+h7o3GK8wD/rJOh7E
	ImBW2tMog/oQeFaofj+XDqBhF+1wTnrSanH3ifh6KwTtQYjQ4m/X09ivqoEMM5ZPj4WoJsjDaCZ
	OAqbsZnInu1LCzU6etcvE+W+BTmuQIRGL/ysoEeK1u5Cujc5hnpoEr2AJeqS5uPlIeBfZaQxCol
	h1BI+cQF1jDaLbEkTFQ0z6aVGV0BbQmIOO7xJyUhr/VnHn7vyflvJ2SJ68DQQ73A6lyK5pszRrE
	slk/RKk2yZv5l+YY2I2Ij/6EUNr5aD6RNCDqcm+6/JOUyBYxwe/D4UPfoMqWp+KX59j3s4FmDbB
	bHjlDanTjdcdPoWALMMaiFf+cWGrPXc4nB8+7W96/BpCC7MIqwT3IjnL6SwYQuku7wF49sk4PvL
	WumCR8TDCl1Whs8m1ANR0w==
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr35929255c88.1.1793901353699;
        Thu, 05 Nov 2026 09:55:53 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25100667esm9741999c88.19.2026.11.05.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:55:53 -0800 (PST)
Date: Thu, 5 Nov 2026 09:50:21 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	almasrymina@google.com, bobbyeshleman@meta.com, asml.silence@gmail.com, 
	razor@blackwall.org, daniel@iogearbox.net, leitao@debian.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 7/7] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
Message-ID: <auzBkdVHfk33JlF4@devvm16445.scu0.facebook.com>
References: <20261103235152.1904727-1-sdf@fomichev.me>
 <20261103235152.1904727-8-sdf@fomichev.me>
 <51381a84-de40-4d4f-982d-9585a2344119@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51381a84-de40-4d4f-982d-9585a2344119@nvidia.com>

On 11/04, Dragos Tatulea wrote:
> On 04.11.26 00:51, Stanislav Fomichev wrote:
> > TX net_iovs are now sized from the dmabuf layout, but the TX tests
> > use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> > to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> > buffer from it, so that frags end at and continue past the 2MB net_iov
> > boundary. The payload has a 7 byte period to catch offset errors.
> >
> Why not add a test with a BIG TCP GSO test as well?

I hope we eventually will have all this tested on NIPA with a "perfect"
config. Here I did not do big tcp because I wanted apples to apples.

 
> Nice improvement btw. FWIW for the series:
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Ty for the review!
