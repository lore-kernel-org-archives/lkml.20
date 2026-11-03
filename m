Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716273;
	b=03QBpp6lnhoc+tZ2VwF6ywi/CkLyMZlVyrhIxpu2ZSCsaP81t418psK6wWWlvpFV5BJf
	 9XT+dR9x9egMYTiKcRbWW4LVc881N55se3jCqd+DDyzmEnUr5eAnssmhikLTWU+arZrFS
	 aRDc1Xqi0lZr7vJTVQI8+PZyhkrFGziaa+vu1t+pnXqW19IbQTTWfYxypUO14LiEZF8Sq
	 tBx2gy0cbJVvn7TreWrVa58YqkbkmwMm+N/xNktO8v7u5or6qKfHumsQCkTG0wqQuwD9o
	 GDKwgny7FPW8mRFtrc204ShWAfJ8TwYqOrU/iJSR46ePJ63ojpCQ5LoekSwUpMCTfXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=DDx8Ehj1ckHKpx5GFjUEQj8Z/cmjaQtpmHixmoQXBEg=;
	b=RqmgRqFAHGMRNEc5QI8vRWPjtk9T/mrimspX7VHcdRqyhEfPG9mQPSIshWNMIxpXsqUh
	 qU/WvxnvjVO49Px409GuKnZ7xif5zMOa6Zt7emw9v8aVyaXsPBJvYCivyD8uw2D6m2sq0
	 zN3aL9dFDd6OioFyCn6my6X2slWwgMx7yg1TMsr2sXW6WV0Xw//yv7hmQTezu7ZgFFeqc
	 XBXJkaBNQkBNOLppyePeWpKYs5T7b+HWh3YRB4ZWqiSr0IXER/6c9UQk3qXyZl2SLeQjh
	 lqoAaCeFT01mDyVCzNUDhCxCE6rRMqoVg6gr9Z6MA4t6clKsAKC5abJSpCq0LTzUHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O2ZZYQ7g;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95945606EE90
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95945606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O2ZZYQ7g
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-170135e43c7so2531004c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716272; x=1794321072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDx8Ehj1ckHKpx5GFjUEQj8Z/cmjaQtpmHixmoQXBEg=;
        b=O2ZZYQ7g5x9WzmRrWKlJBZKCGUL4m3NcbK1BgXeH6hQ4g034AAF+ozXP6Vq7VFQCpo
         rD7zK58l+OmrJQdSBlzoJVtmIx37T/qwy/d8zjA5GH5Cyi3e3QZ0KCLEu//X934ut2d0
         fkGf9eQ6F8h23rwbn/xAsrrmJlYiKkw++1TKJUTEjO87ZQitjK3soLmrsyriCgiFohdm
         ZcmolbGECjOU8pIXL4qGQGUX3Yno5zuW0caZHCKFBuS85zIB7/T9KxMrVg9xg3MMc7Fk
         HYZuU9/1TVwZ6LF6H2iExDrrbn7HXug/oKjVtS7EMNTguAiBueMNaEcrIP85LkGpeiu9
         1FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716272; x=1794321072;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDx8Ehj1ckHKpx5GFjUEQj8Z/cmjaQtpmHixmoQXBEg=;
        b=bdKnTdWQqYp6+p6cJikhrksnCRUIYG9HUQI9EWBK0ySKPH5cdkJ7FJxZjbfIz4mv0z
         mwih11zhDGydvtmaS9//iaW6Hv9zEvaTLokNJPg2m8uNZgPqu1LAU+V/yJE/fRVd+0vj
         Mr4y68tkmzXg9CRMT4TGId3RZG5M8989tqYr92Vx3R++0HaTIWCeay/R4QUi3pwz73Ln
         2ft63YrXGGNhpL3bBjFPlTimggO9QZq4cJNKqnqAbLoqET64Ou4CErhpk1opAISk4EuU
         k+HUf2e4VQuPp8Va3GAzV5p3WomGTIujIQaME3nGhLIJgwMorFyG4LHtfslVzPvWh9c3
         5a+A==
X-Gm-Message-State: APuU4Z9Dri+AM9ieMu6ze4OnQU2LdVxJu4vRHBCiKvxxhWhxOzdJcuQp
	W1IlEYOKPF3n+iAajiia9cDmMr8+BFx54hrteOEMS9QvEGk0kw++yp5b6VRq/pjtrUg=
X-Gm-Gg: AYBFou1/XUE3N+NaQPXfRBKY3Ns05Si6Wv5cZIaQzoDY3iTZvGz3y6ahBT913u2fTtv
	7Nj9MhygMcF65OYYttcJfLkAs3aD9Yk0moCbMghYzjuJi4rhYMkTz8K6bhPpWz05zAjpf403+Et
	EesoSNLSeEIYWTLT2TT8eKunkT0MzXJiuIfpPganB/jqbQNBv7ZkohtF0yIGZanWU2lZyPwxyqd
	NULFt84L2FxPADq/1s0tzJ24yuRCmg40q8Ap7Bnu6nDZuOhLw3bnXmQ0AHvLlMn8RMDndMkbQN8
	fNi9BQ250gi3hkYAv3ycNySFWBI8jcdHlw6LprhWZzxXrluQFxSqCHU5d5T7uwza2ETmgReNstt
	4BJF/b+giiiOZvzcZwwOv6w8bPjVOJUVLf9m12Oums4CLpAAKJMJcq3JZnemNu/JOOUMvtcDc+v
	UeCCIAVtTrXFAsS1AKFhTP6W+rB5UrN+P5admkVoluOi05F/3Rpl+dRhUQUC+gTfGSReSbFZdIq
	1fUu8/rOx6jvACxb/n6cUUKmXkG83soHWNEYp/qb73kqSjOnckQAdKtK7SvDjbJCUZIBxpKtvHz
	LfoXWpmBCf83IQjpcjQ3/HkF2QipvKACZCBUne5OggVGDU1+Qxz/r6LKcNoqS1yrKboebpuFzVw
	xCaOY2tly3AtB
X-Received: by 2002:a05:7022:e27:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1ac5e8e1e4bmr27128472c88.41.1793716272247;
        Tue, 03 Nov 2026 06:31:12 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:11 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: bvanassche@acm.org, hch@lst.de, yukuai@fygo.io, 
 linux-block@vger.kernel.org, Zizhi Wo <wozizhi@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org, yangerkun@huawei.com, 
 chengzhihao1@huawei.com, wozizhi@huawei.com
In-Reply-To: <20261102080442.3775061-1-wozizhi@huaweicloud.com>
References: <20261102080442.3775061-1-wozizhi@huaweicloud.com>
Subject: Re: [PATCH] block: partitions: reject GPT entries with
 starting_lba > ending_lba
Message-Id: <179371627073.3691261.1371314560299241508.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:10 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 02 Nov 2026 16:04:42 +0800, Zizhi Wo wrote:
> A GPT entry whose starting_lba is greater than its ending_lba is accepted,
> and the kernel creates a partition with a bogus size. The bogus sector
> count defeats the end-of-device check, so I/O through that partition is not
> confined to it and can access sectors outside the partition on the same
> disk.
> 
> is_pte_valid() only rejects an entry when its type is NULL or when
> starting_lba or ending_lba is greater than lastlba; it never checks that
> starting_lba <= ending_lba. For a reversed entry both field checks still
> pass, but efi_partition() computes size = ending_lba - starting_lba + 1 in
> u64, which underflows to a huge value. That value also wraps in the
> end-of-device check in blk_add_partition() (from + size) and does not fit
> the signed i_size, which turns negative.
> 
> [...]

Applied, thanks!

[1/1] block: partitions: reject GPT entries with starting_lba > ending_lba
      commit: 7e3801d12ebabaa3db6e2685ccc80b6e6f6d1ff7

Best regards,
-- 
Jens Axboe



