Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519102;
	b=QXjqmM3nhb06fWd7rtg8IbbmZQQHtHKUsDJElNR3uV7cymMMVE/xAM/YTpv1V+Rzb7kT
	 e4FLz3yYQTRAp4pzQdy39gMwfEKQTRvHdbnNR4xphEyZd5AXM3LvP/0JKJSM1jY7+dZcu
	 3mSawEdXrOK8WQbKdgOkW8H+NtQcKgpC9W9zcS2wDc8dJaDaroF40WmZDeAT3c8LppLhq
	 0CJReXQWmweUX9TZCvfu+AtfxjQQsQ1M2/GmEwtORCD6vty5C6ufpfiJkiITuo1vlEOLV
	 8mbYuboLlwHTa3r7xqOaUad8HPuqWjuf5POhogDIfeenQznOkM4j5W1kV3Oa/cqkOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
	b=kBAl+MNDvYaHJN4PwXZmp+Pcg/QYzbNFyizZNOYllGB3bEjZ9T0TLikTe9ZmVsBJ5S8R
	 uzKYAbB7q290G5jgHLNLkckzlB/w8NOu4otV9Vu7NQ3BdjqqyAxanaYHK+G4WnVhyIOJg
	 7ypm7Au3lvofmugQPapkv5NjRPizXwUfHOjpU8QedpL2P5vRnROL2BHa8WhGEKdrV0Y5f
	 UxbSfS29QhcrTMLjFv70JDKvCFQuCNr0uUgojf1M/8sZWSDCBD/z5sHvFgeX4hVsb6Keu
	 9+DFJFxnMD0y8t7HsIXAz5e/KKwroSp+IGRuYYuqVPuIMugQpiCavDBdQOF/R7vpNRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hk7DKm8/";
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCDA606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCDA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hk7DKm8/
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad211ad92bso798472a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519102; x=1793123902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
        b=hk7DKm8/HVQtDM7SfuNCgwbY6d9oYkVDTzKvh3xFFVJcjWgeTit4nQ3APKC6JcXMvs
         5b1sQ076nR/cD60jiZzZnASVUl2A1IZZGCAtZTv89HFO9xMKTFkmD6zhLqjP8L3wg7YT
         EZ+XvNHUBXYD7s1wo8gn6iYgnI1fN0liSodgV4PIsesSa9bemHyZzT4hLir3wzeKGmpn
         2cfYdmBPyJQrErJTZ2N9KyeYzowC/aQbw4VYo0vWXFp7rwMFbz2ltIGvlLTQQcEQD2Dv
         OdgjfMkoZTll+JU+ZxsujBTKAj8fDZLFfw03WYAg+wLvoNDOd2pzWmEdC15h4Plr2owA
         0SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519102; x=1793123902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
        b=pZNGPtFcTBSy2O7hw6cscQcfEzlZJ5hP56ZMdcIE6oBJnQncYAxHO1pafFggF4voj6
         1B75hZykWASRwpwOav6csQD15HJqFGxFB3KRMcM1FORmQSLk127B+M4SVnfX49BFmoyy
         qSUAEH/OjWpeZTvi/LnhqSBIPxX+P2ij4rwti7Utt/k6lrJ1zWlil+YZ/3Qy3MKGe38f
         tZ71kyw1gi2654fOcYxJjfepKK46ePDh/H6QBkcwNnxtsVue++MiwwsUGcwXzB1ezlX1
         +2FHvWC88l7jw7UXxTqjffQtT/KoCuQ+Fp9DcRZGKattJzv+PL9ShDAyPhdMMVfRVhJL
         rSOA==
X-Forwarded-Encrypted: i=1; AKwUvByyEFQ1nZT4lD6uWjeDHjeLbAO/XJ9kRBpjMb6K5G/W6JawIW7ykdwDaZOnN5NvFDPj5GXfW1WOaqlIKLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBHQBZqUAIhlIxwyxyvPilo9KwcEg6m867KVRmSo4MNWjhf7bv
	jg9MwwKA/4CnP6mUrKiqZypgzNYvkXDJ08XFFa+lWigK8zO4BUDOyPn5
X-Gm-Gg: AYBFou3npR5W0Rxkh7vLD6V8hkV244jbGbrFpB3zQDuyPIEJ8b8mGKu3rw/p8od4o3A
	oXqx/7DwyxDMltKjXi9D1sGwtrNU9m95b8jhQPb1MlMYte3wOhOTqNGMtIVc9EV/Qe5UYnS7Dim
	rfIdKDVlzHZ4ORrEFfGlkRAj6qK8fDmQM+9+OUCBdnHfPX9WDSxoMBKrXNp0OYs7z6UI21mxzKw
	7OXbxC0OnGiSPujB20L7+M2CcvP6pDHoZdoDPdwduDM5Gk7oSh5/5vZaJxt5vxN4hZL1GzW0DaE
	mEya39glFrEIOCIGG3ST76JW+HZO1ECDbn4Gr7UgAzdYD8ixsGS8qaMmk3+EKMKb1uc4+y7p35L
	aFVh+gdH3ceihayo0Vlac0vVmFkrEqyCnQDZTbtpDnRHUHFvLrPpJeFto1unihpleDt0maqkO8A
	VHOLQOU8Vm28v3te2SCDSEjeXusK0lO8er1igOeTnWz0MX20dboJ/9kY9yCbj0kO6fdX09M/84H
	a2SSVJ5T6ntxnG8fQdqsZUycxG+q1R8pmaWF1LL/oHqPjhF
X-Received: by 2002:a17:90b:4b09:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3aceebb4bb9mr10542274a91.14.1792519101713;
        Tue, 20 Oct 2026 10:58:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm133581a91.0.2026.10.20.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:58:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:58:13 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>, netdev@vger.kernel.org, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	ncardwell@google.com, bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [RFC PATCH net-next 0/4] tcp: carry a BPF-chosen identifier in
 TSval low bits
Message-ID: <atekzexnMd27Kctl@devvm7509.cco0.facebook.com>
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
 <atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com>
 <87a4oaf3mv.fsf@cloudflare.com>
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
In-Reply-To: <87a4oaf3mv.fsf@cloudflare.com>

On 10/19, Jakub Sitnicki wrote:
> Hey Stan,
> 
> On Thu, Oct 15, 2026 at 02:45 PM -07, Stanislav Fomichev wrote:
> > On 10/13, Willem Ferguson wrote:
> 
> [...]
> 
> >> Questions for reviewers:
> >> 
> >>  1. Is encoding an identifier in the low bits of TSval acceptable in
> >>     principle, given the trade-offs above?
> >>  2. If so, what feedback do you have on the implementation?
> >
> > Don't see any feedback yet, so from the top of my head: looks like you
> > control two sides of the communication, so why not a custom (bpf) tcp option?
> > Would you need that on every packet and it makes it expensive?
> >
> > Or any other field you can abuse maybe? IPv6 Flow label?
> 
> Nah, we don't control the client unfortunately.
> 
> Client here is any device that connects to our edge PoP.

I see, so you rely on the fact that it gets mirrored back.. Btw, looks like
there is already some similar tsoffset/ts_off infra? Have you considered
plugging into that?
