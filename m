Received: from mail-dy2-f37.google.com (mail-dy2-f37.google.com [74.125.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78A34ACC6A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286308; cv=none; b=J99gbVl4L79v/pypLN4mbIG8goJUAcropJ4kgMtX9GYvw6NCaFPibmOl0NrZxRY7RIPNppxHcnLajQBYUaGGTqwkLiGRzycei99bS1p8KKklaDB8Fx9V5z79l5l/hIiZpuEs6eVwSSTHy5yPh9is6MDy5u+ow3y4Sps8Z87aSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286308; c=relaxed/simple;
	bh=sR/3LZABr9dEE/A3u+cDtehoGgAdOlE37mBarHxqdb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iih5x8PliBAmfJB8xP7UICgbe5jsVmgO3VQju4CV/jD7t4Wlt/fPOW/8A6h2MplpsxQP1zf6psFrxIW1HTvBRzmrBWN0be9VvXkWV2D36XkPBiBhLuViFZI7U8ZMHd+dXKYxhpIk5otLIcf7h0hrk5e6A2zHOS2iQiqkXQ7Y6Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=cuDsKJAk; arc=none smtp.client-ip=74.125.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="cuDsKJAk"
Received: by mail-dy2-f37.google.com with SMTP id 5a478bee46e88-328664b752eso126009eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790286306; x=1790891106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sR/3LZABr9dEE/A3u+cDtehoGgAdOlE37mBarHxqdb4=;
        b=cuDsKJAkfb4nsTPi+BsJGJ4DnuIO+8dAjCAaX8VXNt/bxM4xQ7ydXtp6oLmUSta/pL
         r4BDeyQyvIs9PTuPSBKLllDbIFyp3M0+Tg4iXcGj+BdqbY9fniZA/VETvtQ6Bf9kOk8R
         +/BqpPCqw+R4kgPS4tEavfn/9gUxoUzSqLCs+UT87mUdiXpiWTofYh9X76C2OaaimN8I
         oA4ILdfk+oN+x9KYyfkFFn5ueK6590apRAIYm1kcDkulPqNyoSgcQ8rnLlsYKq8Yrym9
         WzlTscOx1C8eZ6dySzqsOKinK+qeXYaXT2EEK7sP7zxVary8r2/Sm0FdTUDw+8/Bzh3B
         WkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286306; x=1790891106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sR/3LZABr9dEE/A3u+cDtehoGgAdOlE37mBarHxqdb4=;
        b=bqqC0x+iK9eKUoM8xJEPbAlGVbaZA8lXnS+lRVtwe9WVWsvJt5jBvV4qlO4Ctcy2P6
         9vS2gSkTSOvNtr/tq+PeZ0BXEG3UDImsCdWFmoKNPtsh3OFOiO0abRH/fbFdVCl0AMaZ
         xtgS1eyUCXFkAsisT09rmPpyRX9XP2RLM0i3wUkpwgXT2de/YHT0TsSfOJtJNqKxx3Qm
         z2D/FghFvPkYfu9U9KJ9enACpyLpz+FgEG13OcNtamUoRvFjUgyx3alH4uPZV+TYN1KX
         BSI8B7CHLlboJoCMhs55FVHNWSAhFYLtHPuGIXUNoBdETrbb0mu2GB6YW2b1D5+UylMg
         tgGA==
X-Forwarded-Encrypted: i=1; AKwUvBxI0+V7pts9NiZ6rPhkWmhwQw7a9xoJJMB7/9EzNNDlmDO/hk1Kn9Vy0EKyKHglg5Yk79gQq+xg0vMfmOo=@vger.kernel.org
X-Gm-Message-State: AFuF++ljORcj9uKATRM/7b93cQN99BCAgDYp/ntJYygZ6khNWrUZEcfA
	RtbNOVUIjJhQk4VQkfrlesGKgxujgjvBTm3k+nLuf56yM9BYiGzKwfvYL5XypWWGyso=
X-Gm-Gg: AYBFou2ME/KyWMVXuMsWzlVoRdtqnC+E+Bu5M/zOzL4weGjZymXXR7lC4t7TRSpeBqF
	Mj48phX8tzKzTZlnvTDv9ZRlTYQTe2pt5gJ/IoUa1bCPiemIcY9HbXPkcQovp+YOjvxW/HnfQvf
	Uc+bGkTxYkeCcRNMpTvkHPMWR5cwhlAftks1nmwYJDko8KUAAEPqGkhuhkyzfxzy8nQc+H2adEW
	52AJqIra3ltDl7G+Use95/PuHgNiJ0CGDXnqhj8LbN652N1uX6rp4dsVV9p2/6WxoF1Izpl9Xh/
	vVrf17sSI/n7O1fblnPC5KkdM4cU2e4qiObq0ZaTkm6OxWkM5Jitk+AT6U6AaS1DrfauCFznaK/
	DI/VW4nV8Bb9Z2wCs/S9+smyc20rtQpQnCEf1IvcaB7prxdkS03fNHE5vzDUWfTeqY/zsSmwvxw
	5bLtg5KOUW1+zOnhd4Rt3jHCtH48dd/Y4E1siNb4svQPvEuHzC8+URO5Yfz287yq+5TrlB6JEr0
	v83DEezQjs2VVBgvH9IXz9UJJLQ0e6lbA==
X-Received: by 2002:a05:7301:4307:b0:328:3542:b73e with SMTP id 5a478bee46e88-341978b5979mr27940eec.15.1790286305564;
        Thu, 24 Sep 2026 14:45:05 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([4.7.95.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3416e4c2f50sm863013eec.27.2026.09.24.14.45.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 14:45:05 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org
Cc: hare@suse.de,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	sjpark@crusoe.ai,
	saravanand@crusoe.ai
Subject: Re: [PATCH v3] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Thu, 24 Sep 2026 14:45:03 -0700
Message-ID: <20260924214503.82963-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <arVFPIKeT-HoYF2K@kbusch-mbp>
References: <20260923004959.88440-1-kiyer@crusoe.ai> <arRJLL4ki-sVQnHf@kbusch-mbp> <20260923225753.49224-1-kiyer@crusoe.ai> <arR3zlpx3Xm2mRt-@kbusch-mbp> <arVFPIKeT-HoYF2K@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/24/26 8:43 AM, Keith Busch wrote:
> Okay, I see. Pehaps instead of having one controller export all the
> namespaces, why not configure your target to have multiple subsystems
> the client makes independent connections to for each namespace?

That would contain the failure to one volume, but two constraints
rule it out for us. With nvme/tcp a subsystem per volume gives every
volume its own controllers, so TCP connections, keep alives, and
reconnect work all grow with the number of attached volumes instead
of staying fixed per portal, on the host and on the array. And the
subsystem layout is the array vendor's design. As a fleet operator we
attach to what the array exports and have no say in how it is
configured.

Thanks,
Krishna
