Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DA83DE430
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891734; cv=none; b=kmgTHUGA0R7mF2qqAo/QxMTAMYyEAYeYLEJfGftn7AqHD5VWDhVmNqCfaaIZ+A+U5qnl9Pc8pxXHmhElYUlszbGZlGqv26D5QiWwqhNXxrRcwfHxI2eV0rNVih5qbIP2rcd9GGxZoaotXnAwqSZw+FVODabdB1xslrgW/GZg47c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891734; c=relaxed/simple;
	bh=LRnpiDdCwPVUv6E32t3wFhociHyoISEzKZ7dorbh3Ak=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWvjJsg/S6do4fhadTWHD7RPet+ZNSZXKH8LG7PD+qM19tir0bmO1aSvIX9DBOam/r3OHmaun+E6/CtOL1JXZ7PlsvU+tBdcxeco57B6wlZIzgihiqQ7n7M6tUWF7+oS01RsVQYawG3xN6DBcLfkvxwBL2bEF0rd1aWSM3gyqSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISiV+R7r; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISiV+R7r"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce98cb8165so47388775ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788891733; x=1789496533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+BxcL09W5glUQ1sDY66ek8nAca5eaYWCK6VFgLXdB3U=;
        b=ISiV+R7r6mjxpraQNItNUW8Psrp87j9X17mx89D4T9zGexdq4K8WMiZxUMILHDz9oX
         /VTWl08Af4RolgJ6hLBnusZ5iYAKSCJ9sP2zcUR82a/IR0tHN0TBb0GAbQnLoI1X/J6q
         tSt0eHMcN0Y3eNtKkfZy4Z3+ar0OWi2lx4X9xPu6sKJkKddM5CL+rYEhfOStFLItq4SK
         ZGVh0oIE8pkDxkFnt8lVo1X1FLubL0oz/fOCXg9SOHBMiztBqhGCv0pdzDjD4D5XvX3A
         MTry5BNXQWPaf3wy6vqJER6+fM1x0blH6ldjjJKcXIMCfSuTzCd4Y/qXABfWFdDc+Bqo
         mH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891733; x=1789496533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BxcL09W5glUQ1sDY66ek8nAca5eaYWCK6VFgLXdB3U=;
        b=gfunGXPiF0FhusSF8YHcivC2vTjSSO2FNtZLr4bQ1AQ+cLiDHtxoKgKgD8QMGJp51o
         h59Kilu9OMrY8SV4WzxQAsNZckhFTltCHJJPmMXeouYL93L1y0HpdHN3XHTLE7FrwKBo
         u9LsVf/pFDR24BVrQxlIC7Kz2toHIhErTGHwzu37osNXMkW6XJKK6MYXOdYuy55DOfx6
         imOSvjnuWt2Dlw+26RgSFHmMXmngI72A0af2cVeagN9LNgrUY5vjRIrrxuTHRXHLURkg
         q06XmoD0BwZNGCSoRQb2MZRd1h0BzFMHTXM0tiItkPHN7G3HO91Ey6BgBjnABIe8ir/F
         d7Fw==
X-Forwarded-Encrypted: i=1; AKwUvBypbRNAM7IyY6GKlC/gOmHmIFDLGt1l3CNkkLqlYyd+6pVuau3boZuM25+U2lNbQcyYNyyFnUPM3iUgxFA=@vger.kernel.org
X-Gm-Message-State: AFuF++n6IHxrWOvLobvGuxqIQ+s63BgLjEVEXJd/YF2YRtfixqWt4ULO
	TSbsvRpSD0qHGkXJXYcXjzfYa9HNPlajzHI1fNJqKXGz/1MZjuDINea0
X-Gm-Gg: AYBFou3XD+EBQ6m8MRPIlMRVV2iqmqG3jiz2d4NKe0WHKdW0AW4PaeDagNkTvO8QXq0
	NkHP0hTbRFo7a0P3/K2avzoEy27cDpUl9HuyC0RcvQMS/Axg/wgwfvQrIeKH1S/+1A+09At6NU2
	bmThWfkHhlU36NKfMJY+B7OxpsI5km9esdNlFphZW7SGF1faRoRwVBdi6pCSIfeCsqLWZisxjHc
	XEYrgtGmtN2EJNLO+UzFwFvXlnAnA9+xBzQd1+KIvnq0J/ZrxGqP2RaIKtbKLXAH44nBIiKoYep
	YKqXT1cbEw+MitCB1xGdKzZSc1k5iXbLi5R+5lnbq1idJ/4rv6rZ0jqUxVJAM+u4PFiBgSTrveM
	+a6AwufsKS5rn7aDREDCxwThzvO7Lnx0ruJk7kaWuA2ibM9Au3/UvYaknudNdFO3BLZpdPxtSHb
	+bihkW+PbAK92Yo041lSmy4i8gz9rZh5spLrDyQtCQb/Z0152ELoCELzIKOHj7tpq8FVOEGLb4Y
	Nm3PHHil/pzzIp+dAFNBpY+pP9TUw97zijvL2s1KmMhklpL
X-Received: by 2002:a17:902:ce8e:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dafb136d0emr325992585ad.20.1788891732704;
        Tue, 08 Sep 2026 11:22:12 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm36546691eec.10.2026.09.08.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:22:12 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Tue, 8 Sep 2026 11:22:09 -0700
To: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cxl/events: Return IRQ_NONE when no event is pending
Message-ID: <aqBSUSJWVA8JfCvX@4470NRD-ASU.ssi.samsung.com>
References: <20260906155705.13252-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906155705.13252-1-shaikhkamal2012@gmail.com>

On Sun, Sep 06, 2026 at 09:27:05PM +0530, Shaikh Kamaluddin wrote:
> CXL event interrupts may share an MSI/MSI-X vector with other event
> logs or device features. Consequently, cxl_event_thread() is registered
> with IRQF_SHARED and must determine whether an interrupt belongs to the
> event-log facility.
> 
> The handler masks the Device Event Status register to the event logs
> supported by the driver. However, when no supported status bit is set,
> it exits the processing loop and still returns IRQ_HANDLED.
> 
> Track whether at least one supported event status bit was observed.
> Return IRQ_NONE when there was no event to service, while continuing to
> return IRQ_HANDLED after processing one or more event logs.
> 
> Fixes: a49aa8141b65 ("cxl/mem: Wire up event interrupts")
> 
> Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Hello,

This looks similar to a patch I sent last week:
[PATCH v2 4/4] cxl/events: Return IRQ_NONE when no events were processed
https://lore.kernel.org/linux-cxl/8e22c1c2-8098-492a-8162-3dd27507c853@amd.com/T/#ma4cf2b2dddaeebc06cb73f81647817bdbb51963c

It was dropped because I received the feedback that in general, the driver does
not need to handle device-side errors/spec-violating behaviors. I believe it
would apply here as well. But if I misunderstood the intent of this patch,
let me know.

Thanks,
Anisa
> ---
>  drivers/cxl/pci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> index c7c91e8dc51d..8b560cae91f2 100644
> --- a/drivers/cxl/pci.c
> +++ b/drivers/cxl/pci.c
> @@ -515,6 +515,7 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
>  	struct cxl_dev_id *dev_id = id;
>  	struct cxl_dev_state *cxlds = dev_id->cxlds;
>  	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
> +	bool handled = false;
>  	u32 status;
>  
>  	do {
> @@ -527,11 +528,13 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
>  		status &= CXLDEV_EVENT_STATUS_ALL;
>  		if (!status)
>  			break;
> +
> +		handled = true;
>  		cxl_mem_get_event_records(mds, status);
>  		cond_resched();
>  	} while (status);
>  
> -	return IRQ_HANDLED;
> +	return handled ? IRQ_HANDLED : IRQ_NONE;
>  }
>  
>  static int cxl_event_req_irq(struct cxl_dev_state *cxlds, u8 setting)
> 
> base-commit: 7098e9cd98a05c0c5de2fae0c2465f9d966fdd07
> prerequisite-patch-id: 92e40cd60a697020faac475dcc77ba63b33434ea
> prerequisite-patch-id: 10027ad5d9aed85806047f807b3a76273b6c4a77
> -- 
> 2.43.0
> 
