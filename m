Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C673B2D0B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492445; cv=pass; b=ZTZaBo6qEogZtlC1LlqIFqDg88UTiTJFCiTnq1YJKukRvMft1KrClFoDt3wU//VLG7E+IJ7nZuMqUtz098kiiwCxbyLysjPRPZxujCXYBnpWFc9FNOzlWz+yhzlaqXzOY9IYUMEoOwhvV55fPDnXrWSWMicHJCIyYHFt1GKkY9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492445; c=relaxed/simple;
	bh=M6la/mD+eygG8ELo1BUmipPEPW5si8u2ruSr2nLvsHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iO/C/ByNXVmWdCRMEZHCh7gR8X3StrEPEXQKYh3/XbWmOLCCNZzUpcNG+4WJjYgOKLiwMuQiOe4baQJ7YZUfSBqi1JUTF2MnY7TaazGPJjs0fsytfEsl6MBRZ1C452sMcuf60ZWr411ctuH4sEwe2wzfwm+MKCfqtjU9NQAWjdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWc8RAUq; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWc8RAUq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484392b791dso58741f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788492441; cv=none;
        d=google.com; s=arc-20260327;
        b=T+HlZI2m47cI8xsTpsa/L+VqvvYmhSEf/dnP9HxUv5NoYKWaXXgLjBMZ6MVpBCTkkG
         HckPlW8F0Dm1vkZLTmUrqELyHG+2dN1g4+GKlP4DhLpJKAnam2HQ7O5Af4zOoH0KsGxz
         Du3mShyWx49gy73ZUc6HEMxe6lA0824jAU3jh8/IbvPhpNZprtcWQ2dDJHG0zTjhDy3q
         BPwCKsYwAOnacOgaf9M/jHijCXyzQc+55Kczq8arm8JADw23Wwu+aJ7yGKoDiWv/tMUP
         p7enCbqwmqqunh5srd/NSqVlWLJY5w2OlRf4JTSMG1FdqfrmgQjWDqz2vTC5k0KtMNAt
         hZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YpaNCdk8qOT4pxEFWnuB/KdAsmJR7/mT/BqEQpedxvE=;
        fh=W2HPuZ9Uv9jETmlhxAgro/EUXJ4bAtlq/mvMLqF22LQ=;
        b=m+uluHluP95GSJbBvcj+d/Lv5zvLz6e1qadqQQx6wY/S1nTfeN/HXHJVByKdWZNJ8j
         2NoT7VFnrNyVwE3+5pLrBrbWrZ+rnne3xL1BZw3hzKqwHWjfqGiYr5xWBPsm6fR0qCsQ
         6UonoIUhbHfb+KOVN+2TGKVX1bE9c1y57o3htNweUIgCa55DzjZNVxERa0n+OlIug/6v
         b12nOyvyYWRWNAi/3svjbz23FOj7ytcgbO93YXZldXoouhTKV3jKOvfemVxwk/38GZJG
         T5xq/Cc4jLbgxGrX6mvtapWYeLuXRgcqxiL19aq3Imn7jjGf8JDBH0uZ98TO1RMfmgZN
         O9dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788492441; x=1789097241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YpaNCdk8qOT4pxEFWnuB/KdAsmJR7/mT/BqEQpedxvE=;
        b=hWc8RAUqA50m38vayrJYtRY3gg1ysQhkWV597th1uwUctdHqVR0Dpzkd+0pzDDHXcV
         p3z3Nta26ci9LNbwf8rwixM/dsZzhL8DOkIA/Wch0HwiwDGf1ykmG89p8nYUQSsH1NY+
         JPooKNCz1cC61jYGHOciw0kZUvEgB0/xrXMI2/r66oy8/hU/qM/OUhG42XjQGkkbi3Z+
         tnXBrLFbeDc+yO2K6lVdxOK9tgxjca+ihciYhaUNZoa+hLP7Ym8pwj4U3P+uWf8G52n4
         tA69yTR6Ek7IpMwBM4/TAeeXjrCMHnJdnFI6I4Nz0kSEpZCASWi72pgQzp4/1EfHtAfs
         bt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788492441; x=1789097241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpaNCdk8qOT4pxEFWnuB/KdAsmJR7/mT/BqEQpedxvE=;
        b=QJq/nzgAJRjaqbYM0eOP2cU4lsZ84Ps8WUX4XDxlWp+J2qrhAYYHB9MTe5ePbhlL9j
         uYY+uSIXfcZ51bafOsj5DNPWaqoFKSfEhlEYwNib1h/lhyKj7jG1mAwp/r6WOrhNSjOz
         tAgbRDBRUvmcj4LJtq0yU4CbxsIBfMMx4yI647Z+NTMNfnTj6YzY/b8/wQA01kA56X4x
         GaGDCnskI88ymta04irpIEN51Tv/fDRMUQhj/7pxxLog74Qkkh8tAzgzmlSFC237FGnU
         ubVONNzCw6bRVUGBlwbDcSkMbWjZwWScuc3y5ssy2Mx5VKFkUKxLKNdym9EAubLV4kSK
         6e7g==
X-Forwarded-Encrypted: i=1; AKwUvBwk0FtJl0q6cHtRNSzrtgUnfOcQCnKxU1orOtmgkmWI+BEP89azywL9NYnmyJHA7dnhREBmx9R8iAC8hTo=@vger.kernel.org
X-Gm-Message-State: AFuF++nE2TsWJnX+7n8gw5PCS1HOX9t7JQDiYc6GBPsBEPgBPf5g1UlQ
	ZJBMWs4PNu/s3oF8D5PbdWnNQFGzUv/nO9mBDfkB936Cxw+9CFpO0D0K5Yh9s3rFzcNNK5POkWI
	4CiPHfFH8+XX1ijCXUe3UGcdPEq53oHg=
X-Gm-Gg: AYBFou3pAVP3sD9nQ0pnnSjHshLTie2YlnV9I6ImPtX929YJreB/QskTQa82Meh7Ruc
	fyH1lSb+2mrzEUrqD6CHjswYv9YhJmNLFXd1BUJ4cJN+QhcYdM8p2rjWWKiTxVQcbOza5TS7ayt
	U/6ffYMsUOqgLT0hAgOm3pTADnWefGjPT62B34fTwL2acTkYEiaLSDTRLw9g2fAec0MV91ALZab
	Btfkh4qWb3a7lOw7YCfKOU+tj4/NxjVv0KhPy64fpXs0iEswqqB9DlIkV2uafMVebg3xeBmBp1u
	ECBv4uuGrGFrhuTO5kGMSsBPD/XsSsQgzUXi3XCGzo3C8vVkTXSWMppqKFIOJIsd9FpZkoiL8kv
	NYAYkpVSKtTzcj7FDrymazsqeiBeiEqIt7dFOT00=
X-Received: by 2002:a05:600c:a40e:b0:49c:f9b8:bae0 with SMTP id
 5b1f17b1804b1-49cf9b8baffmr9477045e9.2.1788492441090; Thu, 03 Sep 2026
 20:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <5026dbec-0b71-4408-a78a-484a4b8e77dd@intel.com>
 <apk775HfHg_DXpiW@kernel.org> <1aa2b2a6-b068-4856-97ef-91ab848f01c3@intel.com>
In-Reply-To: <1aa2b2a6-b068-4856-97ef-91ab848f01c3@intel.com>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Fri, 4 Sep 2026 11:27:10 +0800
X-Gm-Features: AcwNN1VvYizDBaPoshS173cq9tRkFRCRmLlnTgzXTNcKAb5wasusdZ9mZR0gx2s
Message-ID: <CA+qSx6wrfKJ+KuRkU_gLwjN+tS3+yv1VqXpsnZk86m2PZg--8A@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: Dave Hansen <dave.hansen@intel.com>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org, david@kernel.org, 
	ljs@kernel.org, usama.arif@linux.dev, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, kas@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:09=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 9/3/26 02:20, Mike Rapoport wrote:
> > On Wed, Sep 02, 2026 at 01:59:15PM -0700, Dave Hansen wrote:
> >> On 9/1/26 08:18, Xueyuan Chen wrote:
> >>> +static inline int set_direct_map_ro(struct page *page, unsigned int =
nr)
> >>> +{
> >>> +   return 0;
> >>> +}
> >> I still really think the stub here needs to return an error *or* the
> >> thing needs to just be void and tell folks that they can't know whethe=
r
> >> it worked or not.
> > All other stubs return 0 here when an arch does not support set_direct_=
map.
> > I'm for keeping them all consistent and fixing that technical debt as a
> > whole rather than creating a one-off here.
>
> Oof. I didn't realize the set_direct_map_*() functions all did this.
>
> I do think it's generally a bad idea, and I'm also OK if it is not fixed
> up here.

OK, I'll leave it as-is then.

Thanks,
Xueyuan
