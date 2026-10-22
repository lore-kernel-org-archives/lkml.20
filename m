Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665044;
	b=Rj5ArDV4j74nJV50cA0nzB3aN7BO7UmB91BLS6uUmZVymyRvpUdPzvaUolAXRSrWZyun
	 UfUijQyP6ZNmH5y+mP3EhiGjctxip3v+LWls3342PCroFjWyO0v5MQkvslVK5r86R7T8b
	 aTZH1uvYwX8vsEZqYdKDmayXGSBAPH/uLghJBRh3SXKtF1AycuV/ZJfCd9pYm7/T255VQ
	 BlxTUXxsM1qLpYKOqr+gNTh780Kjy/zaxYu2WZcuzIrMVRGiOx0Ll43GXXbZ1MsmlVsc4
	 SCcQKK9TitfMW6jCW97X1r488Tm9zf0lls7zXt4FV1AywcvBk3kFldaebQmHiI91C0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665044;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Fumisp5vEG1ryYjSSDkSp8Pk1yUKnUIHvB2FA3w89W0=;
	b=ApggIlMDd/ig2V84p88yuAfz2WJTZPdgcOSv5EcrOha7i+RAiqzJcoEuVYNA0w+pgnW7
	 Bd9oqXtlFBwl+dD7E6I0IYOUrDfBZQt1yn+hBMli8/t9Ut2TO94CDJU0EZRXUtjAMz/4K
	 /nLE7dBr3N2nd/XaBd4qLHuLZtcL+wNgsfqTA5yLxv3k1V4AmdUBLULhxVr2lyCTNpLqZ
	 TqxWaznKRBiHaPboxtYsICQBQQVXRChg/vbeegJM3PDTEW/37G6jrfu4bjgGeMMYlnOXp
	 BblwqOzxsa5YLzCdW648D4StaZLifYICDy03N6uw8ysYrHMp5kKMI+5JOcwvZeFlnFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UkphuVyC;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63175606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63175606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UkphuVyC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=Fumisp5vEG1ryYjSSDkSp8Pk1yUKnUIHvB2FA3w89W0=;
	b=UkphuVyCb8PzCZyAB4JfDbi9XYRoOuTlAO12yPt/In/cba1+Znl0hGxB9ORbEt
	lmHGJoTYUzzxXegRGfiFGJJ4gNLIkMYayriOb6U1D/TlTabZlTM7unmM9rgsyYix
	ovl4sQXkTFGaKv2aEFO1rDmfnFFFl0PBJy7DPkULRZgY0=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33zCM5dlqHTJkCA--.42129S2;
	Thu, 22 Oct 2026 18:29:33 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/pelt: Fix truncation of the PELT period count
In-Reply-To: <CAKfTPtDQbNgC=gEe87v5kMnz_pB2AEU+ihp2PM5izno6pkNeZA@mail.gmail.com>
References: <20261022034930.225042-1-sh_def@163.com>
	<CAKfTPtDQbNgC=gEe87v5kMnz_pB2AEU+ihp2PM5izno6pkNeZA@mail.gmail.com>
Date: Thu, 22 Oct 2026 18:37:31 +0900
Message-ID: <20261022183731.03184d336c48-2-sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33zCM5dlqHTJkCA--.42129S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO1v3DUUUU
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6Q6tDWrZ5Y74ogAA3F

On Thu, Oct 22, 2026, Vincent Guittot wrote:

> Did you face this problem, or did you find it only during a code review?

I found it during code review, not from a production failure.

I reproduced it with a KUnit test that advances PELT by exactly 2^32 periods.
Before the fix, util_avg remained 43 instead of 1024; after the fix, the test
passed. A standalone harness confirmed the same result.

Thanks for the review.

Thanks,
Hui

