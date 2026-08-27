Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BB022F01
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838853; cv=none; b=dp5o+mBjmsp0yOhll9QchDKBuwZrcqIZnUkTFNeVqBihGnOQpQr9T6oP+AAmSjWrIlPUqsWKWUwJJEtuSmbf7Xh1xONyfRpZR1Dpxn8BEZvO94nvzeOgv/MSzbpQpgp1DAwx/YazQIeOik7LIo4KsqTmYr3q/SLR3zCu6ltgeZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838853; c=relaxed/simple;
	bh=LhwzPD0P3OjeMcJ7AtNCue92qbqUZ43pnOyWQijEXnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUIzYGH+yNQ9vP2Qpeibk9nYIT4NWAoBeg0UtDiguMOXi6vbwKIHI0qPIX6bE61FAIp6WBT3+PIyZTh3g0hpiFhmkcuS1UMuk2ntMJl/IFhlzzzHe7sOv1mizOSFYVhEDMv0/ManNkAf0xlp0HXP8E8wixCJb6rkcXHEKNHutak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjbFAojO; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjbFAojO"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso661093a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838851; x=1788443651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G2nphZWcnnMoex1B7yQ0ZRrX4XuphVKjyNPO6DvSBBE=;
        b=HjbFAojOKpeBsPIaH0GWFEgrwSd9kybN5uHf2f5dfxLf/8LDfJIMyjxikyNwTVeGhZ
         jBcoirMcM89x54okhJ0HKRbAY0m/HOfZEN1EKBVNUmZ6D2HjfZxUvZkpom7P09HBnZ7q
         VTlCG8ZXw9spZz7tp0kavT0Gj4cjXjjuEysGouu25eSvCFeu6bKlO0jYTJfvuzvrf0Oj
         AS0UGXbQepbGHZKOBcBPcSdMrE7KZf/gplxJanVinbTwhQrwTbfJnLSbQ3bEicPSBAjY
         M7dqtSd9p1iV+D4ri+XuQaWDV6xauloYXqm+vj1HPBzCEqMW+yTx6GjMM5zDMcgk9C7y
         Jjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838851; x=1788443651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2nphZWcnnMoex1B7yQ0ZRrX4XuphVKjyNPO6DvSBBE=;
        b=AwNFrRs6S3mSMndfk+RLTTgu80dzE3xHF+QfPxCo31JvQktrrz8yYNQH7UCqeFk0wC
         um5EJqAwh9vpAesrVzo+WGsnRS6vXO3+Ej605IZT/wlSSa1hox7GP+jzTrfIcLfINifT
         7dGhK477JNQ9JIetzNR5w192rxMdD+TeGLYPq9dNkYhoRwh6C/mGqqX3wRXxqoSdbaI1
         Hf71BfDvRQrOdlQ5MRrPNd9i0r+9q7VOQgDeDjcBU0ubAjK5u+S48qBW5ZT7Rv/T8a7l
         2uPjMMvZwkyAHjSjR0yX5hl3rCjSX4mpdPSmtREYSI4+SVQjPqnMC9kPAp2uDxtL37p0
         Y7pw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2mucT35qHEOZS701SXsjjUTxj4Rfc2IksTOYoFkhc1aM6ek16qQiy1suWkP6YT0l6jmhyp+tVcM1/jgc=@vger.kernel.org
X-Gm-Message-State: AFuF++l+hHE7FJqon4bSV9G8S/uqB7hHAReDyAC29fescIXBkFmxmVYA
	ofYPl3Bkr7hiqZqSg0yyIq3AedMfYpjub3fgEsbZ3+JRqXD5n7SWCrgg
X-Gm-Gg: AR+sD13ZkQWJtAcH8JfltjPHCyQN8jXmlA1j/DhRK7W/kdfwqaTpW+At0d1gW3/zFdt
	sistRKjYdM2lR/cvxzy3mmTqsd0cJLkmHc92+LBV84Je5MTxYfc7lBTPfwdVE58as511uKNLFcN
	rdLFnK+phtWurwrWsO+OLdbVXyb2iTBtQJS5+hD63qJXQmqMwUTB5IZFTwt8UC039CQ/Z5TpLwh
	zdQ7oRpuGWY92FlP5EdSPbxbcAXRnd5rfY6h4RPVt+UP77uQS0Ux4Ck8yqbkk/sWoauzUyc8bGv
	hthARCgrOQnilLUZj3+sGUdtVcm6CDAZ9dtFEMsOv2J6GAI0LHPK/LGgA12UlD1RPub5dDk/14V
	OtwLuRoI1QegsaFNuHCqwYH9Sj0EG5p1//lfQOpb7pT/YmupfsserPc5Fp3JRmAVSVusRakXgsI
	Ji56j9j+FIh4aAY49vDlnBG2jRpp8WduPzO9tbsY53EcrEdtViXm+MyN0U+33ByoTIe41WCvUoI
	Nj4mQPaUf0ira7F1pLLcq8W
X-Received: by 2002:a17:90b:5291:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-3966d45a53dmr32189396a91.6.1787838851555;
        Thu, 27 Aug 2026 06:54:11 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d3c9e4sm2935044a91.2.2026.08.27.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:54:11 -0700 (PDT)
Date: Thu, 27 Aug 2026 21:54:05 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	nphamcs@gmail.com, baoquan.he@linux.dev, youngjun.park@lge.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mm, swap: return early from
 swap_extend_table_try_free() on first non-zero entry
Message-ID: <apAsSRsJc1-pO0qK@KASONG-MC4>
References: <20260820115505.20027-1-shikemeng@huaweicloud.com>
 <20260820115505.20027-4-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820115505.20027-4-shikemeng@huaweicloud.com>

On Thu, Aug 20, 2026 at 07:55:04PM +0800, Kemeng Shi wrote:
> Return immediately when the first non-zero swap count is found as
> any non-zero swap count prevents freeing extend_table and further
> iteration is pointless.
> 
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> Reviewed-by: Youngjun Park <youngjun.park@lge.com>
> ---
>  mm/swapfile.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Looks good, nice optimization.

Acked-by: Kairui Song <kasong@tencent.com>
