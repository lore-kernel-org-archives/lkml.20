Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57677471258
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393470; cv=none; b=LJRJJmJp6l2qScot9dTFZ9qmk1x0xC7oTjMgBBAZCZFRXoVfG+5kVUaqJzqdM6PHipDVcaNDXt2DmCzrWSR13qlTQad5ihkqBHWkIhuhd1Qq0s26nAXgm/Gk5MmFZEVzHY2nAGCCjTMLoXsCN4fIMi4Wn2gsJFB6j18lNPX/V/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393470; c=relaxed/simple;
	bh=0iMtyUqd3qePGX0foMGvwlEfIHFwid3TU59h38RyA0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmwWA50iuu6uIt0MQqUwiUHQyx5v2beP1igQXXhrxw07A/hUYWRcNzXbaDf+t9hxBjeJ+z/YaOgiN9OTW8wgPNiw5Fido/yk+JOIyeXPDLetqFbhlIPMeaQJSO30GxK6OSUhVd/EgQpePkzGIdPSnKOri2J/y6Z8hO2o6u7kdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J9kkwdfB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KwH+6iNY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J9kkwdfB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KwH+6iNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789393467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
	b=J9kkwdfBEJlTC4N/deyDkg/G6X57HIVH0BNYZwuHU8qgx+q4gydEatFoaUuSHk/7uv5bA1
	W4Qyvgl+DDRy+qKPCcslhiq3LuqlPO3BUl3lTkPqTp9qL3w0vnU7DsKuQ9qv0dNyvNR5Xi
	p9o05gFnxonWDqLyvOaP66cEt/PY0NE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-dXC1ZowePWiQ5Nti8NzuqA-1; Mon, 14 Sep 2026 09:44:25 -0400
X-MC-Unique: dXC1ZowePWiQ5Nti8NzuqA-1
X-Mimecast-MFC-AGG-ID: dXC1ZowePWiQ5Nti8NzuqA_1789393464
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530256c61b4so69774341cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789393464; x=1789998264; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=KwH+6iNYAoHdlx4EFtHQNjJWw+3RjIpHP/uZHKE0t9cKc9P46KReWho7kuibHgO2hY
         XuZnXZBkP69liEpvRRAOJu7tXPMmX7trSdaucF0iD/H8RQnSXoR8AXbsv5vxaJHAJwSF
         fLoYiHOaa8Pyu97ehElXBCZEiuENG8Xza/b4vZ/tyrhoJWNYjr4dJ3wkqvoJLJvytXgT
         yV7WCJjRD2ZC3pnp1w5qBL9xVdWH9bCNyHFOiHWt9BS46YMpFQBkfwCL69RRKiQd4c8b
         zJ47iW76Hcex7MQ43Mj+BU+080alwlxKJmN+yi4LNLlNYk/KmjBcMzAUAMxz7IIGWR0Q
         ps5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393464; x=1789998264;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=kQIRqqhLldUL3k/11eaiZzRry4mPwBGC60rZs/CtTxO36fwdfsTiW99mTyegADbSCg
         HtUQRuz/+lF9v3olfH+FffdNtEfd4JWanYak88fG81+j5kDFYIUksJwuhK1zXQOwwpj9
         +ZzjTCq+P9K6dn5V94HlnLSyKJC0RWrRbSSVKf+Wj8EvYV+PNonssS1QFS7559iuwHbY
         5DzzSKXfHjzgFPxAxqxyClVl0Ugf7AKb94llZy7ELthNuWUoaDg1quIm9n6Nrd1GAmCi
         6iC51DPzm0/5YgKy7u7Lt7QG9nSc1E9MWCKd4zJ4mxFhXkqduVzo/dsZB+DPxknmvOwp
         ldww==
X-Forwarded-Encrypted: i=1; AKwUvBzETvKn3eOxYMW7l87N19evxEHt95wfmafNI8R1fAgg/nbxIpicPpgR40xfMPy+pWWYwHLZOLpqTcKVJZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kcvpv/wKwt1SWPbkhGeyOEHJeWJ12VKTpb4y8sqORkydB2xDmC
	FPzh6Y8mLO/urfeaWCjF0AComix7rEUviF+FLgFWEDw5eWE6VeNJ3874eLM3r8Acjr0jNfOw4LT
	f+IIr5613H7sTIgEZ2iek8BPy2sHnc9yp1lCtxCw8OAPE76WiRm30rPA0WfKJf1ZBzw==
X-Gm-Gg: AYBFou3LaSK0t2cc0iAhS7l+GLSLQOFxhn8VvicZO/Nu8rvWECTa7v0j485D76l0nIk
	aY79jfE8LM9gQT4kg4sCuNkqeiM+Bdnlo4E43RbAPwE6ksshrHt+P5Uu92s3+oo+LEv38EomBOi
	XKf/Gl3bFX3+mQXjg96nJQgT0iZvAhcwnjVJKYrHEW1nUPo/qMusqLk+qYvLTdK5Tv9MheamxdK
	xW/XXfevLHQPT0NjfnWWTudYCdYibnN98d/xV1/aWjkZyRTRhhOCUfSz18A6+ykIVpKmcRE1dbM
	fqUOS6Oze2NcBn+eglNWmV8FK0cPxbB8o709I6wEXQKnI+ayPCM2BNR/vzsFZmEHWYbYShogkqu
	irE1ew8yuXedV6cH8nUbWuMs535MmlvVmlcc=
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35836301cf.56.1789393464245;
        Mon, 14 Sep 2026 06:44:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35835751cf.56.1789393463669;
        Mon, 14 Sep 2026 06:44:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca309989sm100594471cf.4.2026.09.14.06.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:44:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:44:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf6NH-xrMtCQppv@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Angelo,

On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/30/26 20:22, Brian Masney wrote:
> > Should there be a new MAINTAINERS entry added? There's currently 221
> > files under drivers/clk/mediatek/ and there's currently only one
> > mediatek maintainer entry:
> > 
> >      MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > 
> > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > subsystem maintainer similar to what the other SoC vendors do? Help with
> > reviews, send in pulls, etc?
> > 
> 
> I may be able to step in, but I have to check if it's feasible, time-wise, on
> my side.
> 
> Though, that won't happen until mid-September... because, well, I'm about to go
> on holiday (in a few days from now).

I'm checking in to see if you would be willing to be clk submaintainer
for the MediaTek clk drivers?

Brian

