Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440B5414DFA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386311; cv=none; b=J8u5QXLGrAjTGkKJqyoMPCwFKbcXwVbswU12scSMyvNJlRxiZhZ6zE/WqDfLVHJ7u6T6fKp5wSnMKeiaBVJlqaM3ujTOq36WlgRRPS+XGowwoUoOFsCJ1S5rGy1jikLIkAVV1H8sdOe1+Y5/xcoBFD9494ddHD26L7Dd7T2s+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386311; c=relaxed/simple;
	bh=nJEF77PfpRRAbuTXXrd04BQsuaZIOXXtm5YKYD1IaeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfVkcgcWUXq5RsOWmdvN40XqU+ZMuVxVJFI1pe+zc44YgtmbOQ6EiJzOyiw/+QFulmAIAoFD35kAfEImzvGg6FmcZMbgvkOVIB/LAQktoNyZV+RILOx/VC7AUl99i5tQkjifkZfc00lOXR0bZdEQcUlLsixQEUJP27gcbLYEEiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gdUfba+E; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sTr8l4I6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gdUfba+E";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sTr8l4I6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788386297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UHAUQm0rMnrWekinL4jFBl0Som7I+/lS1kJQKXSMwbg=;
	b=gdUfba+EBT1nmdbmiSWAHUySuFFjQosGSvvZXwNpkAkh0dg2gk2CWu2tDs3TWTflO4Q5za
	naSEzJWD516lnYE033xZEn3Zg9uXGC8dljYsPNk4431E6dJe7JPlXupxMJ602z1mxl+m4Y
	f20rjCyMO4veOJQp7560AJ22YG8brns=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-urE00k2zOLytYVuLnO2RGg-1; Wed, 02 Sep 2026 17:58:15 -0400
X-MC-Unique: urE00k2zOLytYVuLnO2RGg-1
X-Mimecast-MFC-AGG-ID: urE00k2zOLytYVuLnO2RGg_1788386295
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9102f07f2fdso6556906d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788386295; x=1788991095; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHAUQm0rMnrWekinL4jFBl0Som7I+/lS1kJQKXSMwbg=;
        b=sTr8l4I67pOrnPfC4365mSKmkCafrtNCUNW89tyOe/6XlhaOxGnpSKrvOvrTViUpHU
         aY0K95BK4Y9dhcqAKo03Is481EGE3cCSs71gyHVinUjJdJkLbF0KBuCpcyYqVHIWYcGd
         DNcrxWoCRwehUmQBA3QrnKzz4x5HR+9nqZfzIRn/LnaorAgFNekpEbT+keKh9Ae4iGGC
         8fsT1glTG57bi/PVfHF2M2e4gteBQMa9m0RAI46LWeUNkro1PBuAfNr4zugo+x0y2wB+
         WMDyxseFBmnfKr3K+47WJAGIFGGWWxNJVZdpim+uaB4zVBhGRFfyXWcSdtFl1xgvlI0B
         cbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386295; x=1788991095;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UHAUQm0rMnrWekinL4jFBl0Som7I+/lS1kJQKXSMwbg=;
        b=iFiMq1yGUx5mwShPfSxLfI2BHSqhh1UtMvjkBdzxHpL5951QSVTC+TvFQpuBzXp0Qt
         HowFyvc+wVWbPLB1IcemQDJij8otG0iZT8tDBi6VoG8xrG4Z2g0e3nOeKf8dbOq8aOTs
         g+Bvmp8u/SDBdDAD3CAMNXcfSbBTOwK8qJyNu/9W8vVZ/27Fp0zEBwYqPGSieJvW9cPZ
         91TSDfPEOMhvRDElp1b4nicTqpljOOiIGfRD0/Fuxu4+P5LFQAV2mA/h1mqrEMEGqtJl
         EM1FysmPa+dP98Lk5qP+rhBn0xHSPBp4/52RoB7tGhQL5XStAHfMlXnoLAxa7WB05/NX
         O1CA==
X-Forwarded-Encrypted: i=1; AKwUvBxLir4Eg5y9KwgS/9h9ujd3AgWOU7jV16IEf1xvlIMLh3ji11WGQvU1QfiLocorglBepapoVtVKRQfGKjw=@vger.kernel.org
X-Gm-Message-State: AFuF++nPaQqSsneW2ObqAKF+YQxOZ/Z80akkWFFhVv5+2Le/9xaXVIks
	PKdSFVJaZRuHlYjIfGKbYxY5LXmHnoyNCwYGIzln5cYF90j1Oqg8MHccNkaj68ilnuaStBX9LYE
	+bq/c4MJrUo9oWKVnIdh+qKmn0eV4D5Y/7xISFztSh4Ul2rDd0YznF4oavEwCOiVJKiXxVTgTqg
	==
X-Gm-Gg: AYBFou3xIXDzg0pFv4Pb+U0DvBMdDMPwrdNC1to+/X224dKHYHOHCWzOaG3nMxXZaHU
	frG+FmEYX63dkCLXjfoSD4XdOUxS04DdUvvtdbOmEnvegN3xkGVYokp+hQv4TjfMGZ2C9hqD6A4
	RgkDPgaAsAD3e4y92VtuKGmgRKHT0bthzl0vscmPfEPhb50gj9XCQ6jIxEjgvt9A+eZYTV+vBUj
	niSnMoI2lCKEXrkVxDxL1U3cq8rm9Z/zeWcLB+PYTKHZvtflnTmJFmvdGoSWqWGXD7KOz79F41m
	QdK1rliyjtNyPqsZoPv/Mw9AjRMia/Hqd2x8JSG070vGH8jyPKPnjRD9zCmi4m449fJEl7M=
X-Received: by 2002:a05:6214:4a05:b0:8f1:617b:2692 with SMTP id 6a1803df08f44-910346df863mr31472866d6.10.1788386295280;
        Wed, 02 Sep 2026 14:58:15 -0700 (PDT)
X-Received: by 2002:a05:6214:4a05:b0:8f1:617b:2692 with SMTP id 6a1803df08f44-910346df863mr31472586d6.10.1788386294831;
        Wed, 02 Sep 2026 14:58:14 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef5067sm28016056d6.34.2026.09.02.14.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:58:14 -0700 (PDT)
Date: Wed, 2 Sep 2026 17:58:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v2] clk: devres: fix cleanup in
 devm_clk_get_optional_enabled_with_rate()
Message-ID: <apib9XCsTNGA3-u3@redhat.com>
References: <20260809095413.150069-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260809095413.150069-1-work@onurozkan.dev>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Onur,

On Sun, Aug 09, 2026 at 12:54:04PM +0300, Onur Özkan wrote:
> devm_clk_get_optional_enabled_with_rate() registers its cleanup action
> before setting the clock rate. If setting the rate fails, it attempts to
> disable and unprepare a clock that was never enabled. This issue was
> spotted while reviewing "rust: clk: add devres-managed clks" [1].
> 
> Register the cleanup action only after successfully preparing and enabling
> the clock.
> 
> [1]: https://lore.kernel.org/rust-for-linux/20260706-clk-type-state-v5-3-67c5f326a16c@collabora.com
> 
> Fixes: 9934a1bd45b2 ("clk: provide devm_clk_get_optional_enabled_with_rate()")
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Onur Özkan <work@onurozkan.dev>

This series no longer applies against the latest clk-next branch. Can you
rebase this, and submit a new version? I'll be able to pick it up quickly.

Thanks,

Brian

