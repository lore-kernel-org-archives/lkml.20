Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268803;
	b=u24R/nAU4DtawTZdTmWzp4MFb13EdJCyQAIQxV1Ki4TgJXu10xVjvmujtUIuly4YttOH
	 8MrIWrOKuLiuk/1Hq6fD8iYzPfGtt4fJffWhqkjBtYs40xdQtNdQViy/NJ+YNGDYMZk7y
	 kiAjsB3Dav5NYEPE5HpuTUvmX+M4mrx0kx0hTwiwhcjBktNBMmzh6cjTkxYe7+lW2pnCb
	 gdFBZZ75Vw74LHyDEc0TAq3yBFa1PEFqQ84db4sDaUUvsxu33o3AHJ3f3DjWSxXWa17yc
	 g2uYCFeu9tusF7adN8y1bVMeWIjIfn7IoWTDSQHpN7EkJqwYmAX95oee5a4hAK2PD+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268803;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
	b=wBimb3XpP6czuN7di8zPrfNaSepTkaeQySMgSySc+UbrWJqFX4vkT0bam9oz4ypd26WP
	 jcbtpSVtnSvu37kxSYOPJgOzTUbp73DVZ5rxX6NhT/UseedKR1DThnxS9qE/nCiwNaeMP
	 utu7ztDLorAHd6VbtJWa8bXBRcYvkXfneP93YeiDQglQl5gW/1Cuh0eOv1WDkFQURtpTC
	 fguWlOsBsZ3H5xlDS77Nw1leEtr2/OnNLRt8iWuIhXspZUxW4JzyzyhmitN/X9hQKf4MO
	 fLhX9EySvGC4TCmhTWXkBDwhPUIxsLaxMqHySOPmrqa+q+Kb7U0fuvenTZ9umPaWa0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0kycOww;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jQQz7AJu;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E80606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E80606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0kycOww;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jQQz7AJu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793268801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
	b=N0kycOww9AfmFgcuzUOzX7aHLJt/C1PPWenP9oIdrrkEcL1AMFK6EfkUURnFzkcegdbu4o
	mwZzG7Dau6/scAS7MWZA+UY1YmbRwfqsslY1CJuZH9yb8sXea4yZC09NlNwrYoH+UyE/1g
	rkCQs/llEv0V7vE/noS1H9g9yliK1cI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-sxrSNNreNMuCmHuPMwhrMg-1; Thu, 29 Oct 2026 06:13:18 -0400
X-MC-Unique: sxrSNNreNMuCmHuPMwhrMg-1
X-Mimecast-MFC-AGG-ID: sxrSNNreNMuCmHuPMwhrMg_1793268797
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c430f0f01so1617491f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793268797; x=1793873597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
        b=jQQz7AJuwneaMydjQepZ+AHismEwv7Pmg8ok18y4ZZaoeokVRSSmNF763OwPuQs0O3
         4P4x22zkUsR8FMMSKHO7IxjUdXDnXwn06/WgPPJCGiVC1zfTeAD5MtMRUhVYgsvAmbnF
         gKMAFj62dRhNDQBZZAMmzd4/8YzjbBcbFQIq0NRgshHIxN+5Y7aEghDouaO6VL7/kWNM
         sKP5zQJXMW2wkSiG+NRUfM1QVjutHGv6Pisn9hPNgP2qpe52095oU0tdMIDN6uhK2sjm
         kG98JIrSqmHSsgkepntpH0lR/Z6yKZJ8rUiyh+Zqcu00HTEniHanje2FlyaTqiVXILma
         9BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268797; x=1793873597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
        b=gDxHt4dOySpge9Ew4dFJMpAdGqu2xeH5n5TKS9Jss6jAEzrm1mud4q0u4uQgGxJ4P9
         udhEYylbuGIXd6LAGAd5E/IFl5qz2qhMuDroAgwy+RYjfHaHLv7MVjIUhbYujd2PfjR+
         R0RyxZMjcip5K9FDAMU7INS2vhsutuhGpubc6LIGQphc8WdUi3u714ketT9uI3hbRj3X
         AJbR50K57OQ5nm7Fdmr6HDF7FArGpb5Zd500giZipl0RcZ7rfK9KK/CeRt6xxNCLI2SF
         3HvLLguWC4MM7dt5POY47zYX1M+DaE5CiRjG5CwhxvQkPCtR0RdDLfirIIldltKYOJQA
         a67Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXoqyjQOLhz4PsZU+qR9bGh+A2vCGN0NglA2QSEjZXj8EYqldznfrmBVBnwZJgqeQJKyXiClSAdIx7Xps=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsa0tWS4mxA2T5vJv9ikkEDAvmvoEOETQKiWjIB2EU/tw1cAZT
	oMXKK1WN0JYxi1Du3sFQNYFWFCSDLhBK5B93cqIuCjCdT45EQshGr7Y6zES0pO2TS/BzMXDqAJP
	m33Gsq021AfmtDTUu6GyX1csZ6+yF7/dNhh1EXZJKg8XTHgkaDzIMeTf+RW8TIY9qsQ==
X-Gm-Gg: AYBFou2xN9soDt9cPgk8Y9ZzId/wv9YbtiRDC2u+aQ4P0IwCUHKfRLp5OE4DPkQNfXE
	NkUE50KdlZUZRPRHOeaXMkSg3mYD2t5JjJtA2btzax3PHGsL9hn3LOmxdGIzwrnkdzei9QTZbYP
	KrzHY9TMGPL/kLtuX5eGWkWn2Cd3aKN8/BU2mBGY7HOo1tjjrz6PtLxpE31ejkERmpX9s8p7GEH
	hiTOEmX//8Ce4vHCSI3eOCEFdndSLbXrRiUuYup/Q2wDwZqGulVM0d1m2tfo3HkDrK9zm/Dcdup
	dpf3KLL+87C1q5yac+f7v57BEEzzoeDG/LOdU1Puk4fv73TF2kMa3C97hnfu+YFIEhdYRmbjy4W
	0EXwNAdLT3yPlxfuppeC2dK5rPjO1hriJC4dfAEsHVrg=
X-Received: by 2002:a5d:64ee:0:b0:48e:6309:cefd with SMTP id ffacd0b85a97d-48e6309d0fbmr6302512f8f.46.1793268796721;
        Thu, 29 Oct 2026 03:13:16 -0700 (PDT)
X-Received: by 2002:a5d:64ee:0:b0:48e:6309:cefd with SMTP id ffacd0b85a97d-48e6309d0fbmr6302426f8f.46.1793268795997;
        Thu, 29 Oct 2026 03:13:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm33021365f8f.42.2026.10.29.03.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:13:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:13:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Francesco Valla <francesco@valla.it>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Jason Wang <jasowangio@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 2/2] MAINTAINERS: add Francesco as spi-virtio reviewer
Message-ID: <20261029061258-mutt-send-email-mst@kernel.org>
References: <20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it>
 <20261027-spi-virtio-bindings-v2-2-67927b24b9d4@valla.it>
 <20261029-lucky-vanilla-spider-f9cefd@quoll>
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
In-Reply-To: <20261029-lucky-vanilla-spider-f9cefd@quoll>

On Thu, Oct 29, 2026 at 09:26:00AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 08:26:34AM +0100, Francesco Valla wrote:
> > Add myself as reviewer for spi-virtio, following the introduction of the
> > devicetree bindings for it.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5724645bf703..45a29ad08096 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29673,6 +29673,7 @@ F:	sound/virtio/*
> >  
> >  VIRTIO SPI DRIVER
> >  M:	Haixu Cui <quic_haixcui@quicinc.com>
> 
> Please drop this email with reasoning:
> Email bounces and maintainer did not update it after changing
> employerment.
> 
> Best regards,
> Krzysztof

Makes sense, ack that.

