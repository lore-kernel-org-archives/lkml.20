Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56012FB97B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659612; cv=none; b=pr/djx8rtIg3+EU+YUTyskehK33CX1n7Voj2vycT0b4ttA98TnwuaUn7lGiV/YyALg1xgHA0ncq3NKCDocsmoVAsc+5+YcWo+D4vOZcy9mwkx0rKchEPvwADdpU3iQ4tgq3uUiVy6miJ+xgtA16yOcxZrVwHyD5z/Ha1Zmvevkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659612; c=relaxed/simple;
	bh=ZEPRZWQSbrRLK6spoQmF7XlsJWpr55fNU8xc6W79Ubc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ6if5IJmW+e44M3tYSW4pc1OULfGgEn1OsBFAfRfcQycxW2Bva1uLyl1p/7FpuEOEAnOY7qsOCf9H43zI5KOkQZavVXhHIIvzYiiNhdnGpXYsYNgI5pahIVb52CM6u4hRl61PZhoK7yGVrU/z9pvAg2oaVQHYxof7Ip/if+RZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/lqqinQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WMahKYlr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/lqqinQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WMahKYlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789659599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ksHKsD+rPQygiKBYrLWLevL1zmQIyZm3/sEyFnk8qqU=;
	b=P/lqqinQB/+sHNvl+gnRhvJXUes9iW077hg+KLl6g+alq5xcM9cxy3P2YkfjftOn4a5Kht
	ZmZctHLHf/ys0CEh8nxOkYD4Pp2girOk4JD+vnqG9I7VIgXIhvxjkD7+JZhdXK3CHVCByK
	RcTAHYcqpo2ZJRDl7ydvo2cb+kuAr+M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-wpz76tmvM46fe2csRAjGCg-1; Thu, 17 Sep 2026 11:39:56 -0400
X-MC-Unique: wpz76tmvM46fe2csRAjGCg-1
X-Mimecast-MFC-AGG-ID: wpz76tmvM46fe2csRAjGCg_1789659595
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490a767b782so8395505e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789659595; x=1790264395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksHKsD+rPQygiKBYrLWLevL1zmQIyZm3/sEyFnk8qqU=;
        b=WMahKYlr8SHBNP9db6ucA3iSYIUTZ4J4k1H0JUESmdhX8B8hYBwYp7sFxgG+Y9hW7q
         g0TFR5wwYNP3Xj8EOPljrdx662E4aFX4Wed23IKjfm1Sj59HprszncIuvdii9eILKHsp
         FIT7PlS7yI8aRvUsJt3nF5SpBG8smY1E7TvchLOazrsOZiqT+plwA2dUsx3PbpISsDY7
         ULUg998+mA38mas80VN/BUBJ8JOPDaY1+Af2whpv5BH3/5mZTQM29WOquyFqrmJZcC0s
         RvIayahvrCQBGVG8RV92Cok1EHt7KSXdZzFTC7SXfVqTpc4GDWJXtIXfpml6idvd6vS/
         ouCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659595; x=1790264395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksHKsD+rPQygiKBYrLWLevL1zmQIyZm3/sEyFnk8qqU=;
        b=oUUnEZp1gxoqoCYsZExpyIf31onAMriXnhixfABFmq/6w7etcFhsyg/D+cHChDWBlN
         wABciklVMDqqwgwV1xemiqzRMZzkimeKXaTBDQ4rnKPSFqqEV6+jz3ClTCwcCufChlUZ
         o/13UeKWCqkcIVPeuKQynku0NJB/lKEZ4qYdMpOBjOIxb1W6qUyrRGhnCd88coWfPRGY
         depBrxJjXu3s81Wm0GKubKUFIKcr0xwZcbq6JKcyMFBo9skEbZichPEWxx0DlYCBV7m5
         FU8/qvq4bkehxpdD5xZ1r6/BUoqqQj1xcw4VADdDIjbCRP/Jf1IWQfWMUN64f8GEpzBy
         aOdQ==
X-Gm-Message-State: AFuF++mNoWppBjwy1LfSSDACkjtrJpZviQru8OVzqqUBehlr7wqUpNcN
	hMwDoc1vuL0grFAZq2HLnbbL6QUAkqtYopJvCJ9o9Rj+dG+iu4wf961IkcfskEC6VBG8GMACOtS
	q5It364Ebij9XnGL72rYEhhHR+Pqstd4bB23Sz257CcbhqQlnc2/3hLobpZcyVCZSvA==
X-Gm-Gg: AYBFou0pUsu1IpX+H1OFylFrbCQ0pgGEZsyBKfQTwwO0RZZz6T16+eSKotN30YDej1k
	XmcgFY7kNXsbyCTudl1JrH+WItMbqHN6Clp+Jcof207CnGjNC2JuKB8jI1Lfa/o8CE+z3Yp1SfO
	RvboP+4NGdT5PfaCmPF8PNhFQTe2f4CQhaqX7+7Ra7maDpsTaKGklRs+y4GVqU5K1TjHN3xa/bG
	5+HUq44J2d9xqqfYB62L+SLFdm1qc744+kEdDDXOsOLmNONxlMajjdycPzZbFfcuf/zraheosH4
	TycbGSNgokgy+C0KcSmrz4HpGM9ysXKhgKwn1zweLXUtzzCwQx4AemPzD8JlHWDpin8PLKmLrdI
	mfIITjJ8IrWdNW/CoifblCUI=
X-Received: by 2002:a05:600c:4e86:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49eb72f3d08mr88668505e9.10.1789659595163;
        Thu, 17 Sep 2026 08:39:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4e86:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49eb72f3d08mr88668225e9.10.1789659594734;
        Thu, 17 Sep 2026 08:39:54 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm16364931f8f.24.2026.09.17.08.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:39:53 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:39:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	sgarzare@redhat.com, stefanha@redhat.com, dongli.zhang@oracle.com,
	maciej.szmigiero@oracle.com, bchaney@akamai.com,
	mark.kanda@oracle.com, ptikhomirov@virtuozzo.com, den@openvz.org
Subject: Re: [PATCH v6 0/5] vhost/vsock: add support for VHOST_RESET_OWNER
 and CPR migration
Message-ID: <20260917113941-mutt-send-email-mst@kernel.org>
References: <20260724114542.734623-1-andrey.drobyshev@virtuozzo.com>
 <20260730194858-mutt-send-email-mst@kernel.org>
 <f8646e25-7e81-4f19-aecc-a040caac1103@virtuozzo.com>
 <ea805767-9e3f-455a-a4d6-828063aaf2f4@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea805767-9e3f-455a-a4d6-828063aaf2f4@virtuozzo.com>

On Mon, Sep 14, 2026 at 12:09:35PM +0300, Andrey Drobyshev wrote:
> On 7/31/26 11:31 AM, Andrey Drobyshev wrote:
> > On 7/31/26 2:49 AM, Michael S. Tsirkin wrote:
> >> On Fri, Jul 24, 2026 at 02:45:37PM +0300, Andrey Drobyshev wrote:
> >>> v5 -> v6:
> >>>
> >>>   * Patch 4:
> >>>     - make sync+flush conditional by adding a bool 'sync' param to the
> >>>       chain, as suggested by Michael:
> >>>         vhost_dev_reset_owner()
> >>>           vhost_dev_cleanup()
> >>>             vhost_workers_free()
> >>>
> >>>     - reword commit message and comment;
> >>>     - drop Fixes;
> >>>
> >>>   * Patch 5:
> >>>     - add 'sync' param to vhost_dev_reset_owner() call.
> >>>
> >>> v5: https://lore.kernel.org/virtualization/20260720102241.371610-1-andrey.drobyshev@virtuozzo.com
> >>
> >> does not apply for me is this for net next?
> >> in that case
> >>
> >> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> > 
> > The series is based on tag v7.2-rc1.  However I think the reason it
> > doesn't apply is you already have v5 of this series queued in
> > mst/linux-next, commits ddb0918e36c4^..ad5b642c84d0, with your S-o-b.
> > 
> > So you might roll it back and take v6 instead (only commits 4 and 5
> > differ), or leave v5 in the tree, or I can send you v5->v6 difference
> > separately.  Whichever you prefer.
> 
> Friendly ping.
> 
> I noticed that these patches were queued in your linux-next tree, but
> got dropped afterwards and never made it to your last PR (used to be
> ddb0918e36c4^..ad5b642c84d0).  To be clear: the series targets your
> vhost tree, not net-next tree.  Since it applies cleanly on your current
> vhost branch - please let me know if it's ready or there's smth else
> that should be fixed.
> 
> Thanks,
> Andrey

I'll put this in next, thanks!

