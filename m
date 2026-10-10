Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612FD381EBE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601567; cv=none; b=RYiNkAhPwk7/HBniNw6BdIUoxWhJ5Bp690ogSEB9LOykFJW7ewpgOXInF2c1DR88sAV2QZzB+slt1DB0GiT1DP87aF2NSHxOT4u4whlmkjc0Zy4M5relI1DaDePsxSXTY3dwKeST/xngiAu3Lsc4OUGTZXXCU4KEJqb6vKiXh3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601567; c=relaxed/simple;
	bh=SQm2L1WnAvOzt9czOf54PXiFLVwKkZpDA3uUyWtGD70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSldkfGQvcXY7H008CJPyHNqk24k836Z50t62II21BgHkrE+zjeERFzmg/VyGkx48SsSb1LYKvCNEH5//a4jaSE7dULzgBh4K19SPp3qxMntwbM3QeYi04J7ErNGRTNboAdBGKZXn6nh5fUbfiLn8lWK69OFiUQsnQtR0iInmPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0eWvc5M; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0eWvc5M"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49de8ea072cso188797fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791601565; x=1792206365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUIEYGnE8BKwPbIYe8Tft2q9XP8PDGs7PYIrSC6//ig=;
        b=Z0eWvc5MzULkJiu7IRQIU/mzKL8sBS2sGrTf//tWJndgChQ0T72jdw36CdnS9Dj5cZ
         8pNDgrCDqXjTHqiLhk9uqe8hG46vgrNXu7k5zSlN7fSSFFUV9PFos9zQE/H7Y5Dd3LrR
         lUdEBuNet5v3P0/NS926bCn430i99IsP+yy7vg4NQzN0bh5juVVbQyEu1RwlE7FKRvbY
         LQUmn2asMlg7NamK/Q95FKcgIE5owtlUdLtJ2Av+Ns6kBemzzcOMoAtppXrKxRvudLp9
         sGHZ3yDQXNcfF37bs46eByLxqyrtiITAnGwAxtyBBomJknTsFwCnGZcDKXyvU6YxtWcX
         b+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791601565; x=1792206365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUIEYGnE8BKwPbIYe8Tft2q9XP8PDGs7PYIrSC6//ig=;
        b=iH4uN/q8CQpIeiwlNJJdsP7UCOgCQrWwvKVB57zlW9o+UkFDLWef7uly4QLgWHchai
         12Qj4W/+xuXywmxDhYJJSMwM703/yMr6MLZ/kH7kQhnC8GMiAiU4uUSwzNFny4StJtMK
         4zzWaKT8Uemlnu1UtcOC3jvE4gEhnfG9QbwHItwDbku3RdyE8lIjYlmsZRHGE2iWfp3X
         KVGS/83oDUonqRMuZH3/JqOzabb0AJ6mrn5Fy6QI4PZwBfZTCn7B6Y5GmeQq0ciacNHH
         EjnywEMKOq9hnPfy8SGFOanQGu3fbiCroE2V0lNLRAnrJ3Aava6YEEmxzOKg21DojER7
         ff7w==
X-Forwarded-Encrypted: i=1; AKwUvBzbxFHV/ilwzeHq4Va4/gh9hsGisKunm3aokY2EUDFB7+AHlOsIw7X12RmI+vApp/mxuVdyqcgdUOnWdPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf+4QXRPQgKbgrjV6nbDPLb60FuYH4a4xyEJSmAB+16je+HEAD
	Pt7q9SCrXYLHrpYyOGllM/LRTg0Rq3Gs11rM1rMIz2SGhx+l9mLs06Gf
X-Gm-Gg: AYBFou3BGDpYqLpPZFcza+17mw32qh7c6RpxAp2nMO7vqawDGQODtyOY0F0Bf5h/KDO
	5tS32ZUG5mwSl0OB4b/IPoawJoiZlVbmQLIzImcugsJwOruNNdbgtoqsKAwNTFLPxhynSVlM785
	T2lqk2CbGhVs4mJE4SJ7IBar3iQyw2IvO4thyU319ATTHPN/NdF6vVNhUT5WU7IIXx9E9j5AGXh
	xH7Q50lqyTxvqMLUaWvR+H27r6Xb1ifVyOcVaasZmYS7objwUq191tCvvZt0GB8Ne0Ch7PLitf+
	s/5w+Z68jh34UjvtgQA2n1+jlZzGHnl1eoUUkM5NB0MIWhq/o9hbVOtNQdfnRtufAQVaXT+NkSc
	83Bk7CwPXrnnASrHSQXIvhevQVDGxlK/2khY/SZDG/DPkVLd61IljI5au1X3u4ZYTegjwHQ31in
	qp0R6dPCayLcymB+yKu0R+aP+QLZDKE0WDX/MaZJhVhCrQ9iN5OxALykm+6oO+GacdiCurQYXym
	Kqew0wcICS6oEkQFLPtZsLHX2Ln46azj7bUSxwXv6qmOHShBq55SGKgJKfhmhYnYhywH6HJpknF
	Rn2S
X-Received: by 2002:a05:6870:e08f:b0:491:47e1:6280 with SMTP id 586e51a60fabf-4a2a8938915mr3416608fac.15.1791601564761;
        Fri, 09 Oct 2026 20:06:04 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a85edf81sm3689450fac.15.2026.10.09.20.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:06:04 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:05:59 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Wen Xiong <wenxiong@linux.ibm.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] blk-mq: run the hw queue synchronously for unplugged
 scheduler inserts
Message-ID: <asmrlzbmQ0TU3rO6@fedora-laptop>
References: <20260930-bug-blk-mq-noplug-sched-dispatch-v1-1-ff1e49e52b00@gmail.com>
 <20261010023548.3666200-1-odys.yuan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010023548.3666200-1-odys.yuan@gmail.com>

On Sat, Oct 10, 2026 at 10:35:47AM +0800, Qiliang Yuan wrote:
> Hi Jens, Ming,
> 
> Gentle ping on this one. It fixes a v7.2 regression from 9cbbac29d752
> ("block: Remove redundant plug in __submit_bio()"): unplugged I/O to a

It is hard to say it is one regression cause 9cbbac29d752 is doing correct
thing, and single request isn't supposed to dispatch via plug list, and it
only recovers to previous behavior before 060406c61c7c 
("block: add plug while submitting IO").

> device with an I/O scheduler is now run from kblockd, and the kworker
> preempts the submitter once per I/O. A single-queue null_blk device with
> mq-deadline drops from 289K to 193K IOPS, and a single-queue ublk device
> from 265K to 113K.

For both SQ null & ublk, you can switch to none for better performance.

> 
> Every single-queue device that defaults to mq-deadline is affected, so it
> would be good to get this fixed in 7.3. Any comments are welcome.

Not sure you can observe big difference for other real SQ device.


Thanks,
Ming
