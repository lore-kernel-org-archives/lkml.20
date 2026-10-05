Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB52E5429
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791174351; cv=none; b=YWJvNoRthRZW4ogDwEWRQYRSwuMc+RsxH0lBVyAm4m2OHS9etPl5pFkt4R+pemuEAR3rDKuh8xW8gdKJuv/Wp9xW3gBd6MmGUU9/b4w2rG5qpy2X+pTtd8CPN60B+qLcQbpBVcsTdRHTXPWgPjmeIu1s5ZfZtMQ/V855v3Z3etw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791174351; c=relaxed/simple;
	bh=fPZioazYkPzjSMjHIymVpmo3SG9e0aMYWmg3rnmT1X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mH7fkGjOPFoCgCF+JZj7X+gHn79CbKpSR872jELod1d3E9sr7s1wJPIS2gXxnMBiA7mx4O1K7omvEdcYQ/6XnkqlL1Qf6NGBF3Fq7FNqcnBY1XnfpDtFCZO7e0PQL15ZvWAJnkSUGm1QDV+ppZmiGeF2dg3sOu+2HfiEKvY6MX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfGSFTxp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfGSFTxp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so12517145e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791174348; x=1791779148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=961ay0gWzbSVe8vqtS0Eg+hS7Wb99URak0c/SwD/AlI=;
        b=TfGSFTxpjxuFoUCBe1JXlOMkq5/qSH1UgON8qN8GHPWG0CY6UOHOGzYWo0B+w6BYvp
         olxZ9GQFhFvsfd8v6WgAjUhGDaeTcmPv1jCV4+FhS7QPUk8mkUFopdgtBDJmlUSxdvGJ
         jylhTYPSv0KzZY3r7NWZYIX3EgVvUALEvkkweRvtrl97yvskyT2yTr4PVSv58amIXqPa
         0H+qAMJG51O/MFy+JyGs94fb8YEpN7lWu/Am2K1HQFepvDUtOSdC9xir4FejVO1CTcv7
         5pSjwh/1eleBsJkgB8Wsa/KpsFniOOTd9ujyWtsGoNh4es8wY+brHF1PyE53+Z0ATP8e
         6+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791174348; x=1791779148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=961ay0gWzbSVe8vqtS0Eg+hS7Wb99URak0c/SwD/AlI=;
        b=f7r5eTkRX1+j//rbXSGKROlpPi69jBSyFYljwtLNujrDjajRPzkIXoGe8cVBHOmyRD
         fYuklWk7ObF6yK5q0/X9psYgFdVUvwskLf33tok/VbfQBcymNpJ/HqLa78arCFq17inY
         QTn42JFfo2VgDtxe2T9QZYE/0giOjkEiLxoGlem1JU9A+pPGNAdY6SP3nnoTO/28u6li
         XfB8EqLzr9TyxfKApD0HfZB7cZ+eZB1uXiokDhXUItaKx/3CbTTSYVFhD11La8x5EbcJ
         5AXHChAF2uvukNyLK4Dpmc3p1ESCH8m7sH8i1d/Nml+3jm+wKh2nagDFvc7GDy2cLu5N
         48Xw==
X-Forwarded-Encrypted: i=1; AKwUvBybuVcc1l7OdPPlZr6H4cS2+ClWixCUBK8VXypsrlEvWlF5Xmeircr6NZjZLkDZT/eQRuZOz20SnlnAFG8=@vger.kernel.org
X-Gm-Message-State: AFuF++kNYE8O7lztqCJofqA0wraDjiNZXcvBXqDxFk4bjF/jdLFpp8bv
	bzCGs6dFuqMce0/KAhqgQFWsAELXiAhEgxLVBKWgvXnNZSbyl2OtaCnBKLQbp7xV
X-Gm-Gg: AYBFou07cTmrNwUscX6uZd0teali3Gvy4CBE+JNLwRm0dXMlgZ32BJx6hgU1Ah8Tv9M
	YQjyCx/JWGvmfuZ+i6J+e3VgkG0dsXpJgfrI7e8BUJuV4bKW2HFfeACtpZ5NODm92KHEztOK678
	LEzP1wQ5RI8DOzuug/hw+AOGxJNLPgNRx/efmGY+DGLDPWV6xTm3sCtvzI9Hwrd/FWRPfS4gpgM
	j4WUd1PTqjCaIVqNNifqeHYjJVCbRYNJHAc56mK6qDdKZInw7LAP+o15/BQ8Vjco/9vc7x6+cSY
	tXPortNAgn73f4I5FncQODXi8/udNWIbX2igLbMc96PUSuH/lS80wQu1IAW90c8obIS/8JkcwP9
	CNwPQD0X6wpJ/Vpj5Z0YGFp9JnjTaEv7reVw6x0wLpGGsRv8KntJFXlhtBTEIAoYsdkHCTtBtLF
	RE5y++d2hT763maTVnQgQM9pTjgfQDqPw6xjpTznYGaYfpS7d9pmKv7elcI2EZaQda6uSW16WgQ
	OgUrYWfaXAbCxn+Z+9smTXhs/PPX9/Y2VwOcSpfwX1obhi91UtrkvUnxvdCGl2FAu7cuo67u7R6
	LU+Yg2GyDUhRy7aELXhUI2q75im5ThQlzuBBWLMgQ1WixhNUIp+h2C/KsOq+XtOrvg==
X-Received: by 2002:a05:600c:b90:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1680b5402mr109857695e9.2.1791174348517;
        Sun, 04 Oct 2026 21:25:48 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6227fa65sm869179f8f.16.2026.10.04.21.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:25:47 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:25:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
Message-ID: <asMl-yIKQoAbpwzA@gmail.com>
References: <20261002213225.27834-1-kmehltretter@gmail.com>
 <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>

Hi Geert,

On Sat, Oct 03, 2026 at 02:42:48PM +0100, Geert Uytterhoeven wrote:
> > +               count = len / 2;
> > +               ioread16_rep(fifoaddr, buf, count);
> 
> Or just:
> 
>     ioread16_rep(fifoaddr, buf, len / 2);
> 
> > +
> > +               if (len & 0x00000001) {
> 
> "len & 1"?
> 

Thanks for suggesting that! I will use len / 2 and len & 1, and a
plain byte store instead of the memcpy().

> 
> Seriously: a *_rep() function for a single iteration?
> 

I'd like to keep this one. ioread16_rep() does not byte swap.
ioread16() goes through readw(), which swaps on big endian on most
architectures.

The words before the last one are read with ioread16_rep(), so reading
the last word the same way puts its first FIFO byte first in memory on
every architecture.

Thanks,
Karl
