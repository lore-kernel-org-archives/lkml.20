Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB623E49C8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184295; cv=none; b=Ap1SDAsrjtGxFsBw+ZLmISjX/b5duIVn0KdSPiIIN2zObem79BUMRC4wXjFF/X9R6dcikb7w+czpzfrUI+YwnKPPYysfKycYI8whr9ScoLYkBbMdE7q4sCLVmUlFMPD39IbFRuzsZuoVK1FplOQNqSyp+olVwKLBDpmAvnW3Uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184295; c=relaxed/simple;
	bh=zPbFyXkGlwjReheq7U40lvUG8BvJVpBYL3Kcj7fW/JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzDl2yd2t4Bz/ZEKuaX0GhV12ATTZ7j0eNoQZ3NIWf5/PwSwQknMzQ93yPE/94mEywVHZsilpFTCSVcS9MwdwW1d4wDqQ0KnECby32fzNsvwuALjhyMHTcRa8YcahlWw9oTM2EO/HnTWTT3/6aN4cAcZTLF0/LrOX9/3UW1qHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jtZszmne; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jtZszmne"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f1354074so303669a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790184293; x=1790789093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPbFyXkGlwjReheq7U40lvUG8BvJVpBYL3Kcj7fW/JI=;
        b=jtZszmne4Dr5BZS8qz9ANzQ8ZQfaw/bMRnlQDr24kHGVEegMTDP5bALXDuYwmM5rRP
         aOJAfXeAHjm0z9J4sexizav3ScpKB7DWq/+4UbUR9HWGHp21ZtDJ+bPZ+Rep37BBTG95
         oA9BEz+SnQgmaJ6sRJq97SeMGyTYpH2tv+SeO1REyRRPpopm8Wf+AeMPQlCHDT4HgqF2
         gU+t7hDLyrS9bQjI7pA2Mdywe9wHUtEFS/7FbCYwDLpoBLmvcsSBORMyWstX+eNsIJ/X
         FofJI/eCRd54RYYuwz70swMM8WOJxGtX3JmOOCnQea7r4NLbK4AvG7/dl9dnoVlEzTqb
         rCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184293; x=1790789093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPbFyXkGlwjReheq7U40lvUG8BvJVpBYL3Kcj7fW/JI=;
        b=VuUyub2zOIpIElufJJRZXkWkO4c8qman6/b6pg0oGEiB4GnVdjesvpTV0kJoQ9qaW4
         9Ildiksm8CN8QhZ9rVRGJXPFW+CqeqKZF/73te83jpvZ6RuQ+vw6RgfUnUsiIVi6nUJM
         ZSVFCyjM/u0DI6UG3sMr4edoX+pUyX137jBETVYUWC8Qfmdl87oxmP5+MKhxJX1p/fxu
         O5Y7H2+vZx89vKpJdGnB4BaEZtVFIMRx/NXXbu/9JQz9iz+eVNdO7NeeqW4wv9kxAukE
         pEMkgwjOlZTBBqt7eB+FNGVE5HHOGlkh6VjPGFYvTxEdDOHRGBu1SFVhqKAlQ8dpuJ8p
         wEDg==
X-Forwarded-Encrypted: i=1; AKwUvBzHR6D6M5G74weZLXl10pDYa1o1udXJ/6ec03/E0unoyAAKaukusejdbwjY3XtnGxmThJsQDylbRP82qho=@vger.kernel.org
X-Gm-Message-State: AFuF++kXVHv2PDNhyB7owkhkMzgAoXjD/lMC96v8noVKUKcsmLfQcSQX
	aF4TeIzqfJY6c+GgAkYgvuQiyNvaJmrdfW/4d2bqioMIK4RMqSAZYi8/6/UxwSvp8ko=
X-Gm-Gg: AYBFou3+EqoSn09DWB8JCVar3X4GGU6fMEV/Z+gQw/uwN3TGiD5WghajAdC248lFaBC
	tH4h3FdqsO8OY+sXP6hlRaXgX7YdtI+T5XFhgD07Qm/4wiz9Z9TY4RA/BIy8xYdM4jb4TujaLfU
	hdPMVRT9COCYtQdLjcb0fIWpVaEAf8iv6tMfn5mwlDWDB77OOQYLIcSl6PxCQi0xDgm96EEMGt9
	G0ydSQzASnUlNOXlYElDhzVYqc/DIYfldvHb8EIXUwVyNdkL6Fp5u2n+im5wApeJVfADL5h37WE
	7glHIwr29XCxufGG0tWy1po3h+921jekDna8NjDQ2NBTkDBC6oJtwCzOUQ3wjbCfTVKJDEFE7JF
	7PDDsr2XCS3u25m9tafo6Z1jy0ZRc4xTbfJSkipukGurmwemQAbfyaR2QXKEMvhYjfiQc0hJSK1
	eTuSAqhrZk6EOVIWi8bXQ+3Z338iCk9gMFrIF8eVQCntwy3k/iqG1iZDQ=
X-Received: by 2002:a05:6820:820:b0:6b5:ec3f:4985 with SMTP id 006d021491bc7-6d2cb7abb15mr2482311eaf.32.1790184292712;
        Wed, 23 Sep 2026 10:24:52 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce25c058sm2994831eaf.5.2026.09.23.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:24:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9QiB-0000000EA0Z-20hw;
	Wed, 23 Sep 2026 14:24:51 -0300
Date: Wed, 23 Sep 2026 14:24:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Morse <james.morse@arm.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, alex@ghiti.fr,
	aou@eecs.berkeley.edu, babu.moger@amd.com,
	baolin.wang@linux.alibaba.com, ben.horgan@arm.com, corbet@lwn.net,
	cuiyunhui@bytedance.com, Dave.Martin@arm.com, fustini@kernel.org,
	joro@8bytes.org, kevin.tian@intel.com, palmer@dabbelt.com,
	pjw@kernel.org, reinette.chatre@intel.com, robin.murphy@arm.com,
	shuah@kernel.org, tomasz.jeznach@linux.dev, wangzhou1@hisilicon.com,
	will@kernel.org, xiaqinxin@huawei.com, yuanzhu@bytedance.com,
	zengheng4@huawei.com, zhangzhanpeng.jasper@bytedance.com,
	x86@kernel.org, iommu@lists.linux.dev, linuxarm@huawei.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: Resctrl and I/O
Message-ID: <20260923172451.GN1540250@ziepe.ca>
References: <arKx__kOPe4B5gDW@agluck-desk3>
 <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>

On Wed, Sep 23, 2026 at 06:13:27PM +0100, James Morse wrote:

> Using iommu_group like this may need a bit more thinking....
> If we can fall back to using a device as seen by sysfs, then the arch differences
> here could be invisible to user-space.

Please don't codify iommu_groups in any new uAPI, that has proven to
be a problematic choice for VFIO. We undid it.. Lets not repeat it.

Jason
