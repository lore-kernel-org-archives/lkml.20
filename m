Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649825;
	b=mbzrXbyRtY6yn/ih5Cq4bDdYXyWVRX25uhHOQSATm4oa6pZ0fh+XTSsOtyeHZ0PbAa/t
	 TvpMk87hegQS8/8uwRm1mDR+097ae1D/aRkTUDBTAo5Q/aHhfLg+IKtQeHCEvtflUqXhP
	 rASgFixjXilmuuIiIAL9TSW6F6fL+d4HfxlcW4rpFft7T1NPgr2n/zeLyzbkBF0GI57zQ
	 Prb91R0u3qwl+2uvWZTodNr/qZuwY75F5yRawC+fVvEO+HlENWToomQHBz9r6/QZGK6Xa
	 F/kpaMimU+D70D3HJTIlwcuIcHTu/FNr5ZUy8QzLTRVq5f7znMs884YSMfx0WNRYXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jA2sADdkR8l/KpxMWwZUfijC8Wp/cwKXJFqTWTFWy8A=;
	b=EQ827kAV7sHe+IsnDzLeafdQLJaKRkZimqaiYhQiiC1WECE84J1Ipnm9HfG/s/Jn03o3
	 VsefVNHKOM4hiRobkLY5Y6Ef7V6g2Qihdd9KLgdHhjuhAhqTGvrbBIn7eOtVm5sdURl05
	 rYLGk9/SK1gThpoGvyi9JsVuj89ndhmdWTPAiD/H5O/G78Ue+aRTG61Zzwi0E0OsxqVd0
	 c5BezpVh7Jq9lGEDqMaRX/QvE+cHSZfPYmikGMlk1JrJoxtyX3MUbbKmYsmc82380v0uQ
	 7+VNNB/uTLM2MLNXxpN2s7m0sV5FbaZd7KysoAFSZU4h5DsEnzmb7xllTdBnoSZY0tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=truenas.com;
	spf=pass smtp.mailfrom=truenas.com;
	dkim=pass header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=Apxxx8zK;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D3606D811
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 136D3606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=Apxxx8zK
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1776827f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1793649822; x=1794254622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jA2sADdkR8l/KpxMWwZUfijC8Wp/cwKXJFqTWTFWy8A=;
        b=Apxxx8zKxFDzBkYay1wGzLQsyDxaStJSLBbpryNn8OrNN+J8DJyhzHl4sy0xoxDwCU
         bozSc3vN4U+wHtKFwvq0m9lYKx1ckOQksGSXprHfSsrcpQqhQgqyyJcKBymca6Ee3b56
         yN4aOIAQFQZH3QW+fq93mBHTKas8l/AmvJUefw39czhK5KXaDDg6j9hWSBfdwOpV31/P
         NpGNae6HPNdlfMeOsMlLGIzZ+/9HcHlDGtDfoYzqfardiPfz8kq+sHTsD1Fdsy++QIit
         5A7lZsoh60HHGf28RuHy9GuxNGKovRAfy8z+d3L+DQfTVxueipgWafPMCEUSLTvwHK34
         MO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649822; x=1794254622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jA2sADdkR8l/KpxMWwZUfijC8Wp/cwKXJFqTWTFWy8A=;
        b=Caj/zqkjMxX9Rekp4neipMh1ofJ4k8re2eBsUpK0N9n+McA0wr5cCHyWBs/xKN3kz9
         ulZZ/OX/C00xKZZI0m3hUNQ7RmjVUTPVqQwHENGLTfbl4xjiqEyxHT8xM4MbheF9fhMz
         lyvS/9M4ceX1cwrSWcCMYc4oWLRGt7H4dold0Heh1MZQlHw//jRN5Z09E0hoRj12E1ZL
         5jKTRlOfyIlR088ZVHymPTOIEGYxxxHzxJNsyV0wk/9QJnKePlUSUc/GpSRJCPvCF43/
         UDycbV0jsbBqnk97l5HwWLvan9Xr7pH+2aeSxi+4Dt3H+R3YL3qnx8qg8jAOO3xCUF72
         Xp9w==
X-Forwarded-Encrypted: i=1; AKwUvBzM+4Q/B7P1deY/t3jz1dh+j71Y8p44wwSx6OM+E9XBc+pmq5e8uBCjSIHij7oVfC0wpRHLppBzucIXMN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Or1Lt6JcpQln4RnzQ3qocI9zYK8X5Um9dKuqAxjorcwCphorv
	B4OEOIaxBlJl4fITnZffNX3cYV+mebhmc3Y/FC/nNjahwE+yiJc5Rhqk2BxRUq7ihQ==
X-Gm-Gg: AYBFou37AdWlOJ9uQb5xJfrRTcT/3pGNcHwEXPYitapTRn/Azut++e8g22IxZ+xjF+H
	bqtPhHfQVGJAJykkvH87um+LDCr0LlBxnpW8OtOTJC8oitX6GMpepCN4flR7JQ/dKJG3Yk1cXeI
	OJcCUqVCAaRk7OvMLzgGTf2A3RhnCqyUzSv4WtJXPZjagDf9U+55cme+6KPoNNsgPtCla0T/8nt
	DMVUwUF6jLhuz8cGwziAqH/xOqzggXBRtECThEdajuGVG+rwdfTxcyKxUTk7uAymuPFiOjjWAZw
	5G9LemNrxM69CSTyyxq96pnECEjUflImrdKc9fSfdSOMc3FJgCBkpDpMgvVvDJcp2BIhMhcN12a
	57FS7mU1L9LiFXHwn8Tt6UKlJwgWLhBiwpaaR/GK/GsWW1TcxrYGafBTJUUrouU0qISJKFZXeXW
	O2Lkg9o3g9rPqL1xt7L1r0Ll32MCWVXHo+1jo2o7P4TaHmVNXyXBrc5zY0uEajTbnvxIAMrSp4N
	j0XV6tZvJA9og02+Cqt3pyaDUyFcprO0517B4PSUrBHXOAH33c622T35KKztqBVfhD/MgrGTHHZ
	FYhPdsjE
X-Received: by 2002:a05:6000:184b:b0:48e:7026:5243 with SMTP id ffacd0b85a97d-48e702652d7mr24934699f8f.20.1793649822375;
        Mon, 02 Nov 2026 12:03:42 -0800 (PST)
Received: from hamza-PC ([2400:adc1:158:c700::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm21400319f8f.23.2026.11.02.12.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:03:41 -0800 (PST)
Date: Tue, 3 Nov 2026 01:03:38 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org, caleb.stjohn@truenas.com
Subject: Re: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
Message-ID: <aujr6x9t2gXbXfFw@hamza-PC>
References: <20261019151627.3324886-1-ameer.hamza@truenas.com>
 <CAK-6q+j64=mSzuufOaSGjsC2aSwhb0hs9MKxxaAhbwugdztHZw@mail.gmail.com>
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
In-Reply-To: <CAK-6q+j64=mSzuufOaSGjsC2aSwhb0hs9MKxxaAhbwugdztHZw@mail.gmail.com>

On Mon, Nov 02, 2026 at 02:49:04PM -0500, Alexander Aring wrote:
> question:
> 
> how do you "pause" anything in DLM?

The nodes are VMs, so I freeze the dir node from the QEMU monitor. It
stays a member but never answers the lookup, and after the cancel I
evict it through configfs. That is what happens on our HA systems when
the peer reboots without leaving the lockspace and a pending request
gets cancelled before the peer is evicted.

> Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks for testing and the ack.

Best Regards,
Ameer Hamza
