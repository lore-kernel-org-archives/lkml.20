Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0853739734B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138999; cv=none; b=rvLoh4UZRaORpM/aI60214CXK0qPQfx0cZFIFEAgNgQsj+EYOA6Uy24B7xz4chpoNZGTIbVkhyQ58dxDYSQqgv6HpoPHAZfVuCmVRJd1aFQ8qGSOXCOWKPRa04mMoHGSrFB7V6+BygORzI2XPFNbbhSpl3Lq6RcENAxPM5dHf1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138999; c=relaxed/simple;
	bh=DZv6DDtHGtCUMGuVyLhN4xONwNMm186CTnQ12diII60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+UK3c79bgJm70vJ3VnXkWJv/wRi/lWi3qcU97X9xj+z8JgWjziNUjIKmec9yllAt6CItoSMaTh5Prqad9mlG+x2iy6Yxy5zvbgQUlaI3WkBLYEUKxGtmMsH1kQDqeFsLXRkqrsG0TTcc78YXHoFK/e9w8t7zJ3wg6fqu9BmBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnESjGE4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnESjGE4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso3127685f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792138996; x=1792743796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TWEwY0SXVP+rEBDt82SB2uJBfpkWKtnhEnFx3Zi2u8=;
        b=DnESjGE48aWRZ/HrQOU7SQxoqNMoZM+JlcWJ0Yt4C5NIUyD7rlJRwMW2Im9m78aXkV
         kSG4Qc3bwQp0AB62nkwICxGEQwZ8ECWc/7Nl+MeSbE1660aetRFE1YOvmF1bHHcS6lWc
         gicG3tFQ04SX3eSzIXNKzLQjsxb3PVRqdygyDTsQelud4Tcq/+HJGKEFZ8/fPG7BIgxl
         p6XE37x3ayunbogz2WQGaDanOHhLElF7pQbaX5bRX/XlfqV/FGrrtb+1awKq8DI6FLMb
         fcciJFAbjzP9AGzse3zlDRuciyW+byCfYahXg/5jcEYpFyAu12NhTkbq7ev+l5kMv8+N
         Jb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138996; x=1792743796;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TWEwY0SXVP+rEBDt82SB2uJBfpkWKtnhEnFx3Zi2u8=;
        b=YAZ/Z8oS7H2eTMT/TSr0BfJmjHar71mI35G42sC7cCRPYOHrImJ7ha1Pe6AJwmsAyh
         L5PwlI9JHYvh5Sl2NamlJFWxJLPCuSO1BPL8PKqb16b2ab55Hf0Tgz6aCSsOnSlAM0eT
         0cbh2WLPgnxR2v3kcWJdsZEnhOez70NyiaX9ESnCAIsM9YJzB19xhJbhKsOl7K7iBzW7
         NLn426lHzPR1j00pEuyapJU+G9aV379Atx9HWA/mKQxauCj/td+HR/RHOWIX160WUAaG
         zN1UPYQTa3xdb254AcE/Bq41MBRfIee+9eyg4/P+aqlFciHslWXym76woLXRSBHtucrq
         JaVA==
X-Forwarded-Encrypted: i=1; AKwUvBwl8H5wXIjX15BR33v6Lr+pAfrH/oi7QeQOUdEsipdYMFtaOsvKXqs04WUyzrXpQT3OxArNtiNe3HyzYvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRTVfPN+PXvxRtBrfX6Sm7lhevD9SKfUSBex0P7jERVTFRLWuB
	nkiWZoUcjjP+xAhldxIHT/y0dOwYkBfSNp/8+A4zqlKxNDKTnd1A1VUz
X-Gm-Gg: AYBFou1zF136T0JIwUHsU/jP7PCBjyB90cQg/jujluMV5IfSoEVsdtuD1wGHiY47R6k
	TVMCNcqLyYG7pQYzj2be5JbFti10UwWO0SY5CVNUk93XqV9c3dMcXHVWwj66sx7qoLX4ATRAUeM
	YLe4poXMZVgcyGfAAcp4XAk47LAXS8w3T5jG9DFHxKEsQpc2eGl/ujPEMhY7TfsDH7Uah/rpsZF
	3hkKpI5klYIRpWsIpC9No9och2Xcu8bPV/EHbpW97Tiw8eOz923mDeZDytkT1ippNA9NKb8y5qQ
	xmFH+GZ9TPqTIHlDj3YIXV63Y1y0Rr/FAzHmuLl2FJLbkDDEy1VdmKZG5NFG6AnMXqoXfrY9Pwp
	XGvjRgphONqNWVVDcqKwsNNiwgG33db28JM3EkCOyudgULJ++MfFiKXOMzxPiXokATsSGYN1AB6
	y7EoLvGR1glv2QoMWjGw4HPJUELVyUda+hPTVWg2KiYKggBu9zfJKQCc2SiTT+RTPBarat
X-Received: by 2002:a05:6000:611:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48df1b3c101mr11816607f8f.25.1792138995988;
        Fri, 16 Oct 2026 01:23:15 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm3918895f8f.4.2026.10.16.01.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:23:14 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:23:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	"pavankumaryalagada@gmail.com" <pavankumaryalagada@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	"dennylin0707@gmail.com" <dennylin0707@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atHe7m57n3zINclK@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <atEtUV5q9MHRSTJb@stanley.mountain>
 <672f78b36290a4021d3f94d9ec401d23420febbc@linux.dev>
 <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>
 <atHcT5GG8zzoH7kk@stanley.mountain>
 <78e3ad912e994e77813cba1af461c7c1@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e3ad912e994e77813cba1af461c7c1@realtek.com>

On Fri, Oct 16, 2026 at 08:21:34AM +0000, Ping-Ke Shih wrote:
> Dan Carpenter <error27@gmail.com> wrote:
> > Ah...  I didn't realize this patch was applied to a different tree.
> > #Unexpected.
> > 
> > https://lore.kernel.org/all/7e53bd59b7b146caabebeca4347674c7@realtek.com/
> > 
> > That's a mistake.  Staging patches should go through the staging tree
> > or atleast they should be Acked by the staging maintainer.
> 
> Sorry. I forgot to pick the ack [1] to the thread.
> 
> [1] https://lore.kernel.org/linux-wireless/cbf165fa6213c22e88559081ca1c160375c9009c@linux.dev/T/#m6311fc160b8c020f7f87a3d9435ce02d69d07e4d
> 

Ah, great.  Sorry for the noise then.

regards,
dan carpenter
