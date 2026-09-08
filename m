Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06D348C5D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889853; cv=none; b=byNUz/LJesPV1dg7MSQsYNh0dkXiMnHL5rrOLh3mkd5EeMZdL4j0ZwXLYH7F0KvFctiUOuiUMUH7XY4dw6dUdG+T3JMdX6boIqrKd43VYSu6XOOIjY7ZumcD7LEF9MdqlZHzwa6ewkaASLGcE7dJnZN1Vm+LKuJDoXU3Vsu3Uss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889853; c=relaxed/simple;
	bh=5fVqqdPTWUjqRNwOypnkQIbUTq+zpnxZIaYivJYLEes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBH0xrK+bEk46VnHjkqM5UGxwWF+T6bu1VmYVwXPQF9OpZSYggWYYFq/qBzx1h0kwXsI26NfhN3O7EQ0VZllKESR27T4B1ycZ44HGZgHfNxYV55PJjY9txF6zv1LJel1VFg/JMGaFbe/Mtgjnpc3bTU5dYLEBeD3c0xjZfGUlSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TzKsEcf8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hlgAsNej; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TzKsEcf8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hlgAsNej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TXOnU8sIgJJ+Z2KqtqOzBqbOvUiDLN1HzyPE3TMJBew=;
	b=TzKsEcf8dbF2pGJODpl2M7+sVhz2tSkzMbYEmpuWhuJM2vutpsUylWnFJqrNL6H9waN5ea
	NYQyJgz+g8N4arBHMQc5CtE0W9CXfKy9h+kybdMVREJPH1qoTs+mE3IsJ2axmC5iXaCOuS
	trKwGok0wMLjXASd1XXlLidtenRhcU4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-6GotmCChPvO-jHcigTvKVw-1; Tue, 08 Sep 2026 13:50:47 -0400
X-MC-Unique: 6GotmCChPvO-jHcigTvKVw-1
X-Mimecast-MFC-AGG-ID: 6GotmCChPvO-jHcigTvKVw_1788889847
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc16ac179so89456831cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889847; x=1789494647; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TXOnU8sIgJJ+Z2KqtqOzBqbOvUiDLN1HzyPE3TMJBew=;
        b=hlgAsNejEynDpHxFo58pqvl+FR1sgvy6DLuZcCcC4sUeU/wT1JqIYKKVvLXHEvcqyi
         9z6amcnpSttndmvSX4u1/WoQnKDuw1Ka4DaOgjzEZ00FL6Z8LKNWi5eBXmiRmHfet2h0
         2fbqk5nU2d0xvA/IelXHsk4QHS+Wk8Dz0wvyZJuzYr5xm0tOq/cVgGl+Sw5Ea/gpmmS4
         duCjVm5+VWFRfqURULsA6mYXCEMwo25bUUpk0AeBEdj9TRTUUsZ8x7YyhZyb8s2fDv1D
         n3XuryrpNx5W1Y1uvTVYJWWpHcb3A/G2C7PBZMMaUuCIKk/TykSCQAZbK/vmYsoEGfHt
         1uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889847; x=1789494647;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXOnU8sIgJJ+Z2KqtqOzBqbOvUiDLN1HzyPE3TMJBew=;
        b=D5Jkbj88YTaatmuhH4PvIBla8nwx4D4OnGAHeGWOl2V++5ohFDrsh9mvFkDDgq7KfT
         ZmWKFRmLI/orf9u21pVgi4fH3+WdONZLOh4EC3w7COh7EtOxRX1eesH1Dbar8qWNzfa6
         2Cgu8Rc38FMtDIgpJuN4iNGo5NM5A+AXUfhvSxL/NmiG8Hj2CzV8cjnPTyxRNlgvshcL
         VbDoUR6NnwmhIaI9J3Lr5NLfnHPcamAzHCPAohIAUzSiUQsQlIVAiHMHezg2bD/V3fMm
         iEwmFfFkQvzjeUk9enM6lSfhO6KJ/Lq5niZmXqE8y1fmJVlb1OrtqzfOEG7H+LEbFucl
         f1CQ==
X-Forwarded-Encrypted: i=1; AKwUvByz80gAOK+Jm0+ARbku5rT6/Z0Z8+VbLEEGOarJzPNIL6ZB5Ft+7PRh29SLqfhWo8LdusrOK/fncxgfPyE=@vger.kernel.org
X-Gm-Message-State: AFuF++ms7ZDAXnWKbPu02QlRAyn+5yMke3Tc0p0jYOJXoL2SBkvxuKz9
	yF/Kdr4Nyb23umGJUnr1wXNvGg0Je/+gEEYopJi985WJrAXaO7pmTrPNXssb1GMOODifXfa2/7P
	MzRLxIqLNt6wHi/ZOgOh6PIq/lmQoMeJX+ZqEsNWFNd3gtaYuTQeoHxWOLeQ+Le47/A==
X-Gm-Gg: AYBFou3bdXQ39kf2EcQbAeW/lwBIv5MTAMW3JdG5bNIXjS16O+OQ9HNZ6oteSw+SRxH
	TX63vYckiWlmXukzYjQKTFkpLMmp+V9AxLagzpUChHwcMUoAynUtd57ozkxAMaZqvwG32Gechsq
	2JgPsJF0ZQazE0xWtWlrbZ3kbizAyua/Xx4V/pw0MrZEc3Q2M93PB8RS1+3oEikKJZe/Edb7/GL
	0lExFmyqEOxeuoB+2fZgoC3xoqnHMEp5AMc0DfurCppX9rF34kh6oY/fdMl8BBcU4MyDr3gzbFH
	3dUiFnvuND9QnvLMMZkjyyUDfQLdIw2F0f8k8INLERs0ubpouGHo8zuLyq3KYXmoaADWk/3DN6B
	f192o/zrNmYlOljEUj4FVnw8icd8X2p8igV8=
X-Received: by 2002:a05:622a:1791:b0:517:c582:9161 with SMTP id d75a77b69052e-530430a7f66mr339307751cf.7.1788889846947;
        Tue, 08 Sep 2026 10:50:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:517:c582:9161 with SMTP id d75a77b69052e-530430a7f66mr339307191cf.7.1788889846385;
        Tue, 08 Sep 2026 10:50:46 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541ba2d2sm121111241cf.22.2026.09.08.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:50:45 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:50:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: ultrarisc: Register DP1000 clock provider earlier
Message-ID: <aqBK9J1ZTJAGgxCu@redhat.com>
References: <20260820-ultrarisc-clock-fix-v1-1-f27c6a980b42@ultrarisc.com>
 <aoxzTneslr61sZmd@redhat.com>
 <178876250098.2581040.1337852022443550878.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178876250098.2581040.1337852022443550878.b4-reply@b4>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Jia,

On Mon, Sep 07, 2026 at 02:28:20PM +0800, Jia Wang wrote:
> On 2026-08-24 12:37 -0400, Brian Masney wrote:
> > On Thu, Aug 20, 2026 at 10:50:47AM +0800, Jia Wang wrote:
> > > The DP1000 PCIe and clock drivers both register at the device initcall
> > > level. Since the PCIe driver is linked first, its probe runs before the
> > > clock provider is available and defers.
> > > 
> > > sysfb_init() runs at the same initcall level before deferred probes are
> > > retried. It claims the firmware framebuffer aperture, so the later PCIe
> > > host probe cannot allocate the overlapping prefetchable window and the
> > > GPU is not enumerated.
> > > 
> > > Register the clock provider with subsys_initcall() when built in so PCIe
> > > host probing completes before sysfb_init(). Keep module builds using the
> > > normal module init and exit paths.
> > > 
> > > Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
> > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> > 
> > I see this same pattern is also used by lots of qcom gcc drivers, 4
> > Renesas drivers, and a few other drivers.
> > 
> 
> A gentle ping on this fix.
> 
> Please let me know if any changes or a resend are needed.

I just posted this series to reduce some boilerplate code across all of
the clk drivers:

https://lore.kernel.org/linux-clk/20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com/T/#t

Let's see what people think about this.

Brian

