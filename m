Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82430567F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374512; cv=none; b=kelg1ivuRmGVc+wCKQp1pAppfUyky/h/2bsT5OurMqdedVFHM8QIY0gos+/d1lPlVlqyaJDYIc7pLL4OYVYZfFiE/c/eBMAGG9fBnOdlR8BW2Tva+zZSKNwCaizmBMC7uP4gxB/WYXRFFtGrYqHAS3lzKRB84/8Z55DeYBH7xjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374512; c=relaxed/simple;
	bh=Dg24M9sxnMJ/wUGWVVDf13sGMFUGXnh0PB+6Ot0Ycw4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=FNbXROI11lbXFKAz1UNwavAP29igXlhskBLD0s8Q3OMp7/rbiaMmUMm+SOfnl2QqpqRL9vI0BDY76PYisWD5W6YEIyFCzE84XpH9HuY9DteeMDr6RllaMlFBfbRtW67N+/vbEZhns1wwY3w5X/i6e1trVRR6ZZPvK3gzCGnSnLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8oxU5RD; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8oxU5RD"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6798c4b882eso1126072d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792374510; x=1792979310; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dg24M9sxnMJ/wUGWVVDf13sGMFUGXnh0PB+6Ot0Ycw4=;
        b=O8oxU5RD3wwD/W2Xmdir/hdUnzBx057GkK6Wi43gT/9/JFROvhWK4TsL0ffsCFFsTI
         i7Zbvl67fIYMj/d2/fs8AyGh5Eu6QWntibwq9tmN9GFyc/uiCUORCGoENA8KM+A4RB7Z
         MkhZ56lI0KYwxJcz0SA0ToVxodT4dskDV2dpqqMbcst+V8aNAyrJtoGtH5SEvuezbyzr
         wx8kBQis5sQT0LN3t5tSRwjo4/PGddjL5uPMMjpIxnOSnmly5l6tSNbp4DPTN1fpKhMa
         cvg32Inqa5ppoMtoPJfVdtcbftVwBrfn4/1pjZs68AmZhMt2sSQGVREDeFtDx8LR/jtP
         H5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792374510; x=1792979310;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dg24M9sxnMJ/wUGWVVDf13sGMFUGXnh0PB+6Ot0Ycw4=;
        b=AbsD9RJpHSFrruYykX+ziNUeN5gfPL3CTxaylIixe7XsDcl0fSts8AkUJLcMi1sNSY
         uFOluLxBS8A2YH/29pBAe+bH2Cpj/hYf9kRTlZVT/7s4jqokZijyi4TdYVE/INl+qN1/
         aXS4Egs67lOk27AWE1LGTucYpwiWA5w/EPuNm1nJPJt/CKlIGvMF/+n37OP2C5zotWZs
         glqMzG7NUeaAfN6B+XX0Muh6t7EfLBnCEQxjqPdSJKIvdisvUwPpDzONNPNVi7LrrRuw
         qZEIhBXlcKnOUxnZH1sGy9kvyu+658D31BFGnloPmzAsWOPZsmK/3W9/Cqj7/quFQ5sy
         aqJg==
X-Forwarded-Encrypted: i=1; AKwUvBw+KqPoUq14LXkwo0XcoLfuYUBeUlGrS0btH/4BMVz8Hjl9WMtbPgxKUcxeO+/qHbaC7u+bSdOe6mqtVs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4H4AifAHHvK5IF5+/qyvVmwyqW0lBvhDT2PQ6GXDmOUC3mWaT
	790kWjEu++nFG3aCLmtk+oI/dSZarPK7y+9uDFy2VSp2D2JtuKMtxzhDLO5UUg==
X-Gm-Gg: AYBFou1smy5/Rsh1oInUmS/I5GFK0d3jO5YoiLghlCy2plP+uRLI0C9TJ8lHY4U6rRx
	7VW0FzGfJ0PjbR9mGgVBkstwbhG3mcSvcjstNrixpNHtpPEx5oH1V1Xrck/idm8mtdw/BHFNfO4
	AYR1zB9FP04SXje7/7IuMcw5zAtC7tYz+0L9CxoAin5ec5x/NjRmFzr1rQiBY3g6ZF6DpkIHhDg
	BGuX89io7TRRimkKGXBhn7V7QzXXyP30EsukDUCqD8yjsUwCpATL1X+NXWUr29YU0+kxBx2IbKQ
	ZR8SNoJp0lQ/XPm9wE/DGxktUcCp3tltd4KJsh3yy0FRQs0i+ldchy1yhG/S8xXiG05ZpZ6Zexr
	BX7BmHQy3AZ2Maxh+64O2zFFGxqtORQkjqOR8Z8qTuH4rZ+R/qSThmu+lv01Pqr262t2FkcU/Jr
	c+cc/FRV3qjwwtgLAQJlgEd4ZR2hzWc2QCsMPOMmz1nginaPCi5cpulJiNMLdkD3yFtYM1awzXo
	tcIsella593l8lGCSfacHBMMPZaCnwqxQbSaWTgwBD7s1Rf6qRSNUjjcM9OYz/1Ih6esc8rESDc
	/nc=
X-Received: by 2002:a05:690e:86:b0:679:5bea:d3fb with SMTP id 956f58d0204a3-679ca8db8d8mr1463133d50.98.1792374509799;
        Sun, 18 Oct 2026 18:48:29 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e09d42sm3675608d50.4.2026.10.18.18.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 20:47:52 -0500
Message-Id: <DM8FQ18QVN8K.1FEXMHE3XEVYT@gmail.com>
Subject: Re: [PATCH] staging: greybus: fw-management: fix argument alignment
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Okhuomon Ajayi" <okhuomonajayi54@gmail.com>,
 <outreachy@lists.linux.dev>
Cc: "Viresh Kumar" <vireshk@kernel.org>, "Johan Hovold" <johan@kernel.org>,
 "Alex Elder" <elder@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <greybus-dev@lists.linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
In-Reply-To: <20261018224241.46011-1-okhuomonajayi54@gmail.com>

On Sun Oct 18, 2026 at 5:42 PM CDT, Okhuomon Ajayi wrote:
> Align the arguments of the fw_mgmt_load_and_validate_operation()
> call with the opening parenthesis and split them across separate
> lines to avoid an overly long line.
>
> CHECK: Alignment should match open parenthesis
>
> Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,
ET
