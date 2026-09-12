Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA2192D8A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172723; cv=none; b=DVCtbW17XJ9eNOyXpjwfJB0sZFo5IRlx5TOC2Wjhyn1G+l7XV1peBYVWj1LAa+Hw6B8Xfcpk6w0TIZPelwMQENVjlBKDUe3iHLtm5yxEDVHj5Dx+1kzKOh/Z55/gROU8f+F3ZzdjY/PAeYgYdsm+medxvqrBujh1YPdrJUEVkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172723; c=relaxed/simple;
	bh=1a3ZwnBwa1HzobSQmbsDSE0ulkRMx2KM84AVAdNHEiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWuWpbHZp3KCrbuBb6QKjrd9CCTWnaZzItKJP8C724BZnQQ8aMXAme/ycxg+NRcYmIe2bAdcyBR6vS6LdNPj6hGXiFu4M2G1UuTmSaHKx186BZ6oUO2WPsfmU+HX7op8Vpnpp3YTpJ4zq1cncaGXDnOkObrYhjxm/LnLwwdfb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqFq1vtz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JxXZvxF6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqFq1vtz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JxXZvxF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789172721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKGFm6G/TNMn0NvYxTUs0YYbh7R2/WV2gMX4ZNmGb2I=;
	b=cqFq1vtzE1654P04M+7Sluje9VlF1Mbw7CVxNpXDq7u1eLUHioVW+ejBi2nsc/q80qTLK2
	FivlBvPT4VMdWmFHPsxxs5PxP7kPkl4q0IQ4fJzFkLIdtulloBYLG6ZwnjsWLp53QWyPLf
	R/kuTm0JIxZrZaITDur91TmPNeHvTeI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-h2NtCdjyMuCWsrczL1bT4g-1; Fri, 11 Sep 2026 20:25:19 -0400
X-MC-Unique: h2NtCdjyMuCWsrczL1bT4g-1
X-Mimecast-MFC-AGG-ID: h2NtCdjyMuCWsrczL1bT4g_1789172719
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so312120785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789172719; x=1789777519; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DKGFm6G/TNMn0NvYxTUs0YYbh7R2/WV2gMX4ZNmGb2I=;
        b=JxXZvxF6tAz7RbNwXnokRBO56YkjuVydSP6Cm4g3N7wmsyGJtbubKT4nYQg32aue/M
         gnzn5eJjvaHAm0wI16ZJDzr+xtW7NiLG9LUsXYTY9v5Jppv3HsZ4/cLtXIrrZGQ01Ibk
         7XhgbxjWZYgLzeMfphlqBJIurCN+H/oftR0zUVKLPHgXHGcDH3iadaotQfWBtCTw/uGW
         yEqgpl/8UKEpuPaGtAVI7wJ67oFLbWfdhrXLzCanOldPfu3DaYreSvb+CG7RxhLxUQe5
         tjuOLb218Re2MTbAm8bTQQlQJBd1h9j6JRgJzAwvymuL3OfLOvCyt1O1+/8KSp4OhMbV
         mc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172719; x=1789777519;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKGFm6G/TNMn0NvYxTUs0YYbh7R2/WV2gMX4ZNmGb2I=;
        b=rnC0xAyhHCXdK6gieHQV5a/A85/AueJdy6aaDq1DGVr0h+HaUYWWQwQ2f7dEXqJEjc
         tJjCYYn8PH0L/vH2IDu/cgP2lybvb5opAtnAtbG1v35YcFHqeUiLQm5H/yc3lIDUqG2G
         kFD4/As2IDIDJ0Twkt5W0L/ypO/v4JOMAyeFNhVSVBwMQcaocdBOGGyzbt5KnKqnwRlv
         uRXDLQI3F1E63Mn1miXZa6MYehoXRVkvWkCcQhYXrF6SMByoTVYlLvvFSi5pNvECg/I8
         OXc3s6OeL5AwresWT/FZi8kwfhK3V8wELehqR/oSvEHuPQr3YYl6dUYpF4dAaa/4Xj5j
         mLzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNTbFAiMJC4qJPM+xlat/Ij2hr0bZAzp3czzklCCp4Hzr6VUFuU/LR7gD5I/Nis2mOFXjF0874cOsHIwE=@vger.kernel.org
X-Gm-Message-State: AFuF++kNb/B/hd4mdvv3D5n59BibvLoMBQtuzFfWa2vry5y3NOXWV+iW
	gE09Mvny75quYOL09MdilBWs+7Tb9f1bhozKsiIEAToFAiWeraP6pwGGuXToYGI3vaUlMJop6u/
	uAoTQC+xAVx+L6rh3Xp4FziTBUTTC7giWD6RqVxPmXNheEMsUca+HfKfG6wPNLKc1xGHJwyIgmg
	==
X-Gm-Gg: AYBFou1DNSDTkb8wESrtd3zJf6ZJyGwzlCPyOMsEU5ModAaFf+X4/Gekz3Xs+mvVIZW
	qwKalHFXmESlS08T/sX+avnLd3pw26cqwfSdK2Kvicj1wQM0o7VM0nx5hrwBvPL9hD4XBPJJEt+
	XIjE5CcaKMdLgrJqwJGzXaNKurrTWud4S8ARTzwCx6umWGnofB9LLAVakis5Mo+a83cby2O+tp0
	Hk2b5BKgarYC9u0PZMJEmpSYy9J+WN80UvD73eX/Yum8OXp9PjCUG4rOuZQZWOdHDKcpXgyGlMu
	2786HknU6/4OC4wbUpNoSF7u4B1cyqMXYTBQ9KwgORwlSbLTCrT8y+ObNfIOVu+yOO+3eZ4zBe8
	uAzgAFKwThQ0Qr66Rsk+CBgUhzOu+YZuv2E8=
X-Received: by 2002:a05:620a:2812:b0:939:1ad2:ce7c with SMTP id af79cd13be357-939ea16b999mr1115567485a.29.1789172719192;
        Fri, 11 Sep 2026 17:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2812:b0:939:1ad2:ce7c with SMTP id af79cd13be357-939ea16b999mr1115562385a.29.1789172718699;
        Fri, 11 Sep 2026 17:25:18 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e807eba7sm368493185a.29.2026.09.11.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:25:17 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:25:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi@etezian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: s2mps11: Propagate OF provider registration failures
Message-ID: <aqSb7O2gfU0hTuUV@redhat.com>
References: <20260906033651.84082-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906033651.84082-1-hppiscas@163.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Sep 06, 2026 at 11:36:04AM +0800, Pengpeng Hou wrote:
> s2mps11_clk_probe() ignores of_clk_add_hw_provider() failures, stores
> driver data and returns success even though DT consumers cannot acquire the
> registered clocks.
> 
> Return the provider error through the existing lookup cleanup path. Skip
> empty lookup slots while unwinding because S2MPS14 omits its CP clock.
> 
> The issue was found by our static-analysis tool and manually reviewed.
> 
> Fixes: b228fad50c00 ("clk: s2mps11: Migrate to clk_hw based OF and registration APIs")
> Assisted-by: gpt 5

Assisted-by: LLM

I'll fix this up on merge.

Brian

