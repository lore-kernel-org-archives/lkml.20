Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E44E3ECB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449861; cv=none; b=dSOeYO+GzPm3/vv5eCeYw1Z/T90wyVLqA9denkTzc+YOhBjl/OQ5300vmQ1mKDVl4RT1Z39+Oaz6eidYep3xyOBxyiVOp/qrVGznYYyKXIKVsAhS3S9oEG3LYjgkF5f4l8Nn2DCnTsxnRQ1/WxsWXMDA4wUx97l23Yv5vZY8vmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449861; c=relaxed/simple;
	bh=FJqZHBnUwF7ywu5IWsSHGCTzQfz54Nov+7cjYEyTOI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJCwcDWwZlkMonZ2ZKC+M4pWcTAUokTcGPSOeyOq1dUjgJt2H3chpi5l8QF3syv53yrJW/tHP4CoyxDtzmjJJdH7zqzgwsd9Mn9ku/qed5S14MgHhSW+qpo5eGFjwUcIR3E1IIen18EF7kuxTOQko3qbScW1E5J6MYTArau/9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFSmbP7M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmLN8x2q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFSmbP7M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmLN8x2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788449858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlh82xrPwDINnfVqunMzUUIpa/VwVqsR+3LDv7/ZZTU=;
	b=bFSmbP7Mfk2Gq8++w6um51wR9XBygGFUkk3AG4YFFvRppvcM2D1y7mICajy1aCrrrD1x0N
	2gWXIEkIYBGo/IRpqL0J/EMvf6obpn/VjiLL8yMmFxHXdaTldRNMvmOAsSAlYwtu4G6Dtj
	NSILnNQf65p1me063mlzZXc96QZRUTU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-QP3UgQ-uMO2BqnDWzC47qQ-1; Thu, 03 Sep 2026 11:37:37 -0400
X-MC-Unique: QP3UgQ-uMO2BqnDWzC47qQ-1
X-Mimecast-MFC-AGG-ID: QP3UgQ-uMO2BqnDWzC47qQ_1788449857
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b571432fso196830185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788449857; x=1789054657; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlh82xrPwDINnfVqunMzUUIpa/VwVqsR+3LDv7/ZZTU=;
        b=HmLN8x2qX3HR5qsne+SCmn8zXjlor5euy9UCKmJS+CQ5Dod3yh0Hjw7nPcCGbAJ2WL
         5nG4CpzKcPNNeQ//F9nTNl/idb2Dj47XXTnYCNVDbkRfhTjDdOfoE34WmhQEVlEMmR0J
         8GJB90BVun3N2SWiTWbHLeCdNDwg8i1m2UdjH2NGHDiyBdHiFCCSjRlkro7k/OzAMtAy
         NLmieWNicyj9ptee9ju8tPAp4HLJmcRR4Nsd0zjyr+rMnN0q2ogoF2NeLeomAmEkFC5o
         YCF0yM+ID/hO4UqoTuKL66IlcqlOYoQWYnocC7nCX1JTz4HdiOax4XXXHtP8rhPjmAaZ
         hUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449857; x=1789054657;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tlh82xrPwDINnfVqunMzUUIpa/VwVqsR+3LDv7/ZZTU=;
        b=SwXNSnIDewDmDUI5WZuCj+7E7nuKPcxEat9ockQC3HaQVvZj5Af/EQC+FKScZlp9FQ
         jp0Cuggx4Rj1as+gpmwSWabMWuOQ0ZyU69IbOZwWMBTsivRg8NZIhIA2NDLsyiZ+weGK
         LcOXdVboYAx2J3E4VnQA3TeCcHslKWicrQGpa0rfVkFACjMs19e5TJ2fj3i1ShxhqKE6
         DPAXXYfjRofjo/W7qoiOV6PVoGhuM0jXFkii6SLPD8UsMWTS16GqnpIXkKhDLcklLYit
         pAkSWvIPc3VjzVVoirHCOMrb09jfCMkvzppXMbDztiokt7GUR98FkXibzYqrvARScTor
         u1Pw==
X-Forwarded-Encrypted: i=1; AKwUvBwOwcZf8DpTkvw6Og8/Epm85I0lOZsVIfvzoha7s4Gvyb7X9+ukSYDQpFYDEN8pmpN0kgX4F+ZQSgmQNMY=@vger.kernel.org
X-Gm-Message-State: AFuF++mmJCktqc0TOKE5ubv1XyR0cKUEVkq28FKsL6erjKqvrE9SS+Ma
	oGxbRhFeDl0uRpxZoj33t881iJ1Yjv8dFaO5DUofQshfu/xrcU1Ffvu0IMzCJZvENpc2y8wfupp
	/kbWEBDevyjr9pnP37Gnzyvya/i/f+nwRr5rCzRjUa8B970YxZESKphV6M0B/WZ/eBA==
X-Gm-Gg: AYBFou0Chjq+xocsEJFO3qo5ZAIfE1FUjj4rbwUieoT8OlMv2Y1GKZe7qQQ78Zp5eEd
	V20yHmKkFEAR8e1TcfBbUh0ou3trnbkcTuSuCiGkGldctIZuTf61mXvdS7Nq8WWKS66pgCD3Q8l
	EG1nTT9h6BaiPSVJ3X5wlUdHCPpeP+cWwCSPHCJqKW2XZ40xGYkgncPF9amGyD8c8RUQ1oFjoCP
	wWnOjOlA6Hguv4nVbW3m4Ylt3BiPMYNwDNT2RiURLjVQ1If53F1ygr7iJMYxp2rG1cgJbJIFgEg
	zu5MdCEUSvqewAHND1Vl3yXfF2TWQto6dxMHs7g+t505caGx2y7aZIA1wjuk/Aqw2JsLbbMQXcV
	fwreMiM+0Uyw9ZiC7tbFdOiQ2mNuGHKb5MPA=
X-Received: by 2002:a05:620a:469f:b0:939:6c9d:5270 with SMTP id af79cd13be357-93972ef3d3amr342317085a.8.1788449857015;
        Thu, 03 Sep 2026 08:37:37 -0700 (PDT)
X-Received: by 2002:a05:620a:469f:b0:939:6c9d:5270 with SMTP id af79cd13be357-93972ef3d3amr342310585a.8.1788449856415;
        Thu, 03 Sep 2026 08:37:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm536836385a.16.2026.09.03.08.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:37:35 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:37:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v2] clk: devres: fix cleanup in
 devm_clk_get_optional_enabled_with_rate()
Message-ID: <apmUPdYtdIM0dQbF@redhat.com>
References: <20260809095413.150069-1-work@onurozkan.dev>
 <apib9XCsTNGA3-u3@redhat.com>
 <20260903074110.101285-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903074110.101285-1-work@onurozkan.dev>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Onur,

On Thu, Sep 03, 2026 at 10:41:08AM +0300, Onur Özkan wrote:
> It seems that the fix has already been applied, but v1 was picked instead of v2.
> I sent v2 the next day after receiving warnings from the kernel bot [1], at
> which point v1 had not yet been applied anywhere.
> 
> [1]: https://lore.kernel.org/all/202608090025.dwxdfqFr-lkp@intel.com
> 
> So this patch itself is no longer necessary since the fix is already there. If
> you still want to get rid of the warnings I can send another patch for it.

Please submit a separate patch to get rid of the warnings.

Thanks,
Brian

