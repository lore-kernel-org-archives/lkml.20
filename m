Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274740;
	b=YIclw190JeFMCX1LFDKdjz/7Ma47qf3wJEWAMUPjPjKutrEPCiGq9wPxFLahQ5MZ8lv/
	 9Yopyy538orDAxkRrTnfchgMz9cecb9UfLQrZbXu9BIT00ZkWzRkQ2gyL8ZSoLlUmYdiY
	 U57IzFzE7RNa/Zg1oPY+VqgGAbTGNqX5aiMc//xZKo+upS82QDaTNYBR6/8f8f5g9hK3Y
	 LwJcnaNohMBXIAQ1ewA4Jk5XKiADK1cYccILPIlPwcwff5Z0I17l6P8N7wx1eXMhJ8XkR
	 BnmUc+Tm+XMemPBBGRf+lcVguLPiIroYsRCHW1SUycEs9DcsTSRlFenI006vcGBDC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274740;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hc905M9q4LEkI5HIdNGySZNyIziGO7ISCoqRtqFWyCE=;
	b=3ac3E92BS3czrH2gw/OX8W8slu7VtbpoX+e2G5tD95BwVw9/jYZh9bvMauOiGE+UPJjd
	 obnQGIQ/sHYyBkgCV9tIRgRyRm9aJ/txOmrGLkoNX78fqcoP1pvBfLTzRgs8h+qYGO4Ai
	 MSvsAMyOY6dCKx4PHavFhVl2GIJfEttqD9ERGFVnkP3fd/S0O7WGVnIF/3KzZBAzARH4c
	 a5OaWAqDfssxIeRVa7QnGl4aOVUZv1Mw24XWZrdfJGI8m/6FtHGrKvNC9FkBOsGTkYKPx
	 FBQG8f0rYjDqCV5ys3PvcgKjV8BQyrSdhB0jC9yRid5j+h26y7MVXhXVvlmH3Ehqh5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VQ6HLXwt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nH9A4HUf;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VQ6HLXwt;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nH9A4HUf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793274739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc905M9q4LEkI5HIdNGySZNyIziGO7ISCoqRtqFWyCE=;
	b=VQ6HLXwtnNGWou0kG5Z2UF1UA8o9FFMias2ZOl/hEET5jU3x/E5+SEwNoeX1nka0jhyiWy
	dBbvqup6fIZrOkCsvgEZvEzHj+olIs88EghojLzV7WpG6mTduV5arW+wyDp/0s2G/YgL87
	soLbmW5EaKP2lSEu090xtR0lmyw+Jqk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-Gwf27oR-NEyMb9-8xS596g-1; Thu, 29 Oct 2026 07:52:17 -0400
X-MC-Unique: Gwf27oR-NEyMb9-8xS596g-1
X-Mimecast-MFC-AGG-ID: Gwf27oR-NEyMb9-8xS596g_1793274736
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e00f3929bso417089f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793274736; x=1793879536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hc905M9q4LEkI5HIdNGySZNyIziGO7ISCoqRtqFWyCE=;
        b=nH9A4HUfPNbHXYmr/mskVwAc2jYfk2GWFOZyvt+VdhPZcMomuWJxuR/BJU+LA/N7au
         0I6wXoIBY8vqenSBfNadJffASNTwtfawEgRvIXyolNXu3XZ4pKY3A8flWvhUllEI92t5
         KwxeDh0EKH2+3LvrJX1I9tCYzedkGyjm4zvCYmNXyWgTMtya6iPclP54fOh60lqSShb2
         rfEbHvlSvjpmtfJ4dCvVdWb1MV+oGqB9aEw75wQEC8wg67B7tnCuMnVrpnPHnuFMBMAJ
         d0yMmBW9lLh6P3D4KDP9aeqHiespHVxLnTikUlQaXUf2e6A7L08bClpJQ7eYOT9aN1wZ
         yF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274736; x=1793879536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hc905M9q4LEkI5HIdNGySZNyIziGO7ISCoqRtqFWyCE=;
        b=1fNuKG+uq/MIIQXAMI0AcuZiYMF02wsOqBYAKbj83L/u0i0n8fPTauL6wVdu6FnXtv
         vf7cMxhNKMDmJBvRTaJezsefTD0WQ5EHY2HKPMReI4x24N8K6WHGKHGt0k1asl/zOSZe
         frCAcEOiZo2SJzxuruapDmwxqFvb9X1uZpQtxA0Jg+z/aw0aW5JYRvhnJVdoUnMVoaX/
         1hcCk2MlGO24reVSIREutdMUVbz47NZbyT+dIkoEvAHq9b7JPlQ9ughlDbu+xcaWCIhG
         9+ZKxd0pP8fddpA7pAATr4EAd9WXXvVU0Im+hx2Mju8Nn1q2Q9rSAB/9rPLz1ZX5zuU/
         YfPA==
X-Forwarded-Encrypted: i=1; AKwUvBywfmbbBeiRHP3qvefk8kzVvkPn1POpSJTSG3xX6uNa4HwBVYj+U+Vo72KInyMbQyUxIZB/X+spdr9EyeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIroGFrLsKghWx1wCSdPOmSPCD8K725xyNDA7FUIh6Atum18JYW
	63VelAjCSCThjDPIJE3Grv+LjPCqq9FwO/pTvG7+gX6Sh59FOv6YD3ACtM/GJkPuqupHwMiQrEP
	dO2fCaqN13WuZ0gWY5be8b8O/1L28IypsuYzIXkZWZDoL1XtpHb13RtL7kwGO64Y5rg==
X-Gm-Gg: AYBFou0sdyh59aRUu+toXn5gXusLd51vYztLrQjDJ32l037zaEstdKFjIprpWmvOJ21
	ovyCkT4K1RXushpHyoRA1mtReDXg/VHTDBaiSRQtix/1nfdoSl2iNPqj5M0YD+zkxRiwqu1XHFP
	dNQXiB/lDD5VP711xdntVOL3yKGwTtUUPm3L0BZkx/4TK6/GvwXByp4MsUph8w2m0wFmXcQ1QpJ
	1A1irMYfYKFRWJKdkau2frkUQ9Isvy1ghx4nb4qhZQ5cO1DKATr4cONHuAd+GFuWdJh70aO6DwL
	Y8V/0jHMVNWh8vpQEYPA/47uv7BLKU0vJmTr4QZHOFJTO9hzTNnwPLmy40ayR5Lv2q34feiHR29
	PrBNkqxYg1faBnmu4m5tisJtgGhPOT2z+v7jf47CNyarzSnCX8qrm2LnrJycx5gHnog8wFak9Xs
	skHVdkzoMcpfAoVi3sIae7+IW3p5XLz7Ib/t+AjCmLX7FqXlQ=
X-Received: by 2002:a5d:540c:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e64ba60d3mr4693980f8f.23.1793274736367;
        Thu, 29 Oct 2026 04:52:16 -0700 (PDT)
X-Received: by 2002:a5d:540c:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e64ba60d3mr4693928f8f.23.1793274735834;
        Thu, 29 Oct 2026 04:52:15 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm32615874f8f.56.2026.10.29.04.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:52:15 -0700 (PDT)
Message-ID: <bb202893-9fd5-4dad-ad69-9f86dfd91cc3@redhat.com>
Date: Thu, 29 Oct 2026 12:52:13 +0100
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
Subject: Re: [PATCH v2] net/sched: sch_cake: skip redundant cake_mq rate
 updates
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 =?UTF-8?Q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
 Shubhang Kaushik <shubhang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 cake@lists.bufferbloat.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026-net_sched_sch_cake-v2-1-cb1d4e6ed990@gentwo.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261026-net_sched_sch_cake-v2-1-cb1d4e6ed990@gentwo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 05:32, Shubhang Kaushik (Ampere) wrote:
> cake_mq periodically counts active child qdiscs in cake_dequeue() and
> derives an effective per-child shaper rate. cake_dequeue() currently
> reconfigures every tin after each scan, even when that effective rate
> is unchanged.
> 
> The dequeue-time call chain is:
> 
>    cake_dequeue()
>      -> cake_configure_rates(..., true)
>        -> cake_config_*()
>          -> cake_set_rate()
> 
> With rate_adjust=true, cake_set_rate() only refreshes rate-derived
> state. Tin 0 records the unscaled rate argument in every supported
> CAKE tin mode, so its installed rate identifies whether this call chain
> would change any state.
> 
> Skip the reconfiguration when the effective rate is already installed,
> while continuing to update the activity-sampling timestamp and
> active-queue statistic.
> 
> Fixes: 1bddd758bac2 ("net/sched: sch_cake: share shaper state across sub-instances of cake_mq")
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
IMHO this is borderline material for 'net'. Was any regression visible on
top of 1bddd758bac2, e.g. in term of CPU usage?

/P

