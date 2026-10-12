Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD635950
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811940; cv=none; b=QRQCuVGlNmNWwdhUYSLf7T1FMhEP2JdsDEP7lJ2Jade4Ft5klwoPnrXufJeD3/Qm8/tZQ02rmY2vDfDu51msfSXejCnFt2RynwxSTHyJtD6360x3M/g3ml4kaEKMIRxwpUM9zxKHZwLdNAGT9/APqRNsdDTgS6mTsEbHJ2lPE8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811940; c=relaxed/simple;
	bh=ctjQYQUEIzsi8x1eYJbaUFp+XddDMILXLXiBmoaLnYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwCVsmZ+MwC5BOJIduWQIOHRfQjPz6+dsdAp9yBhAQrKLhV26Dc8ZZ/0EoWUPfXCEkV3fOV+mtO1HzW4JW/RMVzAlkAYMWWh3fgNXbfal3njdOce/ckHRbQ1+dO3uVjFKWhyiHZ/8AiyhmObg+66hZVVjzD6UWBQfuYhN22EBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NO5q2Ek1; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NO5q2Ek1"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b8b456dbeso5456316d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791811937; x=1792416737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ebo7h2rv1x/rY0djKxZTjNeMWLNeozXbpIKqXCRxYak=;
        b=NO5q2Ek14hBzb69e1xXiQY7RzB5FsVTcoOLclQpJyFbB0hO/1eQt4++mrrdoMIMLel
         HGmyxxDUJnAndz0/N4ygqryzDrHOzk3oJESXR6sSgue+kEHX/JCzwuh4QN5+Iv0ymLBE
         4geag4ayyVYnM071CNTEOmPH3dT9uIZLaeYv9hyE9wzXbp9ayJu3WZAjoIepmQMytDG7
         zanyXKjlSCX+w3NpEoygiN3H2rkOAObEbv7+MnPidhI25Zla6XwU1g8j92E7bSCh2aYx
         Rk7vuUhQr5dr93UmCcQ8ITh90lnd40sYBDCnfeyhI7DOPDdcrqVilpO+uCpm0n7ZWYt4
         irgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811937; x=1792416737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ebo7h2rv1x/rY0djKxZTjNeMWLNeozXbpIKqXCRxYak=;
        b=D+upH7hT1bn3Sxk/soWNnepdqerYbZvkVZPhf9Zn6FGR2jvLX7aA3OOPspEWl+W81q
         2a832IBv/9iMEH6dapR6pkwiOG6qqekds/MVH//S59QINZAdaqtv7RcHtuoxci8Y5ofS
         9Nl97hihwyeEWRYTkzNzsSeyQlAhUTQd/k9U22LSqSTWdl8h+Ds8l+RadI7hOycCL4un
         hP+YMvk9y7x2Ugg/BN1bygmzlhQFUtwbYddw9Kp76AzoFJ3eaMowtDro92fm15uWMMAc
         thFPER3PhSVRYk5jae7tw/ZdsmXL+M6eLwFT1W7TXKfmuvJZB4ootVO3K/YRo+KCYoiK
         3FKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1V67CYZIIqE+aSGHk9q/mNg938O856u3JMtNkgsYtBRe6qdskKnwEzZmHInA4sVGACzaf/qt9XcYMqWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA+NZHsN2SXNzyPwlDgGfOF5VE0gb88tAI0oVcXlOI1OJs/V0s
	jqaAVbzvHfib/YDPzJUnZvg/cKtTs40qIqrQ4LLGt0CUNgAEcOLRZJFUDJtGYISlUo0=
X-Gm-Gg: AYBFou0HsNLsDbOllFKHg+LYLmY67TRN8urIP8yQRTC2HzLMtp+GefinRkvyT6YkfYP
	G7oqEM/d684xqQr8RGtVF4lJAfwgUXekRN/Q2TnaufT/ZC0DnIQvi/PNPmiS/J5O1rztkGqqSTg
	I978zsj0EhssSNjlnq11tM60/yI/VsCXVvewlD9q9Pd/ESCR3UK0jDxZNHQHx/RG7ojfBZru3oO
	PGVkal7nkwZJNKwHjyrh5xNpp/u3S16bKaeTiUZVHvwG5yWxQ5nMe8nDAW/ua9r8nbVj50qYnfa
	wbNcup7EwbfuGDIF4b4njhpCsK3Jo/23emf38eyCQAeEu2w52znF/OONP6RfV1wkOpeEBY8nLgt
	/hCcq7tGzmn1IFd8/slgmEiTcTgEaoN99LEiCXIk5EoCkpGclk9QAdtjnOuZCpc7Q86PL5Nc1yc
	KsKKdb5VPWqomMwwcMz8DySObpPopBgDjgNkDIHbJF5brkIc7CxRJbcJiyaU2HYaa0vsQvyRqRf
	zJjqL5JfwbLkX2p8HwTUDCgG+rkr6oH09VPLQlw/BzKgepNo2QhkanfGkYHQiqQyw==
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:43f6 with SMTP id af79cd13be357-93ec12c490cmr1574730085a.67.1791811937008;
        Mon, 12 Oct 2026 06:32:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9897647sm860981485a.27.2026.10.12.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:32:16 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:32:14 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: albin_yang@163.com, akpm@linux-foundation.org, liam@infradead.org, 
	david@kernel.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] mm/madvise: add cond_resched() in THP branch of
 madvise_cold_or_pageout_pte_range()
Message-ID: <aszhNc-Lrw7BgCT0@gourry-fedora-PF4VCD3F>
References: <20261010024042.4070048-1-albin_yang@163.com>
 <aspKmWIrOzNjiP-t@gourry-fedora-PF4VCD3F>
 <aszZPq92qX3jpsNE@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aszZPq92qX3jpsNE@gremlin>

On Mon, Oct 12, 2026 at 01:58:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Sat, Oct 10, 2026 at 10:26:33AM -0400, Gregory Price wrote:
> > On Sat, Oct 10, 2026 at 10:40:42AM +0800, albin_yang@163.com wrote:
> >
> > This same improvement came naturally from refactoring the entire
> > function into a proper pagewalk structure:
> >
> > https://lore.kernel.org/linux-mm/20260922235830.2350770-10-gourry@gourry.net/
> >
> > this function is really nasty.
> 
> Nice!
> 
> And thank you for looking at this horror show of a function.
> 
> But yeah as Andrew said, need something for the backport, then your work can
> help eliminate the source of such things! :)
> 

Oh yeah totally reasonable, just pointing out that two separate efforts
came to the same conclusion.

~Gregory
