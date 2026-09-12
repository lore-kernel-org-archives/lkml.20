Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044774078CE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205587; cv=none; b=gzr7p2R7q9DHYkQD9ELBMPz3Avdwk9t9kY6QxsLm4jWmoidEnYQuOr9bZ9bcaUzZh2cdXAFTvbeCqEZA5miTP9Op96V+XcypLQiP8xuv9pzIpgPrTgOz+sW+EWxJ0QEKGb+AX7/tXmUaJ4l9O8fczc9gVw/axLa85/+23rte+/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205587; c=relaxed/simple;
	bh=tAqpRW5ptikvGBLcXEfBJ381reEYmJjIKCPS65RMqec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRD5mp37EwpZjsk0kUDNeIS8j+gHAevO6Z96tlGME9LdC4pRJqok8Amo0WjTt1Tlm3S/sibzbtMToySOU+t/8BCUaIYfYa9+J6e7NmAM64NlMGo5QAwMe+b9hhbbigKfoq5T+qFSc5o/sdWkWAq8+IMxifKuDrsfNUGkwFQupEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXSNKW+k; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXSNKW+k"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482ea739de2so1100358f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789205584; x=1789810384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QTMJitCjsStUznpilHnMjzfzNZTGItPoTsN7Y7b7W8=;
        b=WXSNKW+kqFBOOK2mukoSgfBIFTs2tXGPghl0SF4J1FUfkr2zB8LNWft9EY8Nzo1Bkw
         pIkZJborAfBJoDpRiuKXdAgzMoAojQSBj4rfr2pE5S/ibYGkeN98WyiC71ug3NLQZWGN
         b7/wk7KFJkUn757reyJKeycPIG7XthkrcGxPRowVC9+15QzlZctnCmHlFm6UMVLXA4qm
         bkt9PgfIfpGSq0lCqpoOwB+a3N/tuQAgpeb1zsY3s0Szbr4xY5eZWgV7sDpLc9ZAXDFJ
         7P2gx89cmaWI197+E8YsoDFrVqxSuNqwdX9qhRft7PZx3mATB284Dows+Ofkd2XdDlTB
         VRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789205584; x=1789810384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QTMJitCjsStUznpilHnMjzfzNZTGItPoTsN7Y7b7W8=;
        b=O2QSAftyG0+EfLO0iKXqNaWRMcQTIYRY/4zVrGr+sYZS+SJNGxqWBbqnPMicbrXedd
         UIVHI17mfne0P5QUlRvRANBkvoZV6/s+x05SUoEQpUGVoU+zvetCjuX4dUP7cxqsHkeB
         azPHyzdmnNxX9z0ylIyeeerI+3Yzu7QYBEjnz9oUYmfHZVcCLPYLLqDD2k8GOBWhLHgI
         WtTx9HiILjffum7mx6MAgJZlXLStL3wY6xhqkk3s87HPMj98J3ar8wmaYD3SxBfHBMCc
         A7q+ouhHVeJ0vnjlCK8FlmTEqY0ZE+QHJRMs6ujwEmpQx6vAwj2WYYu0tzJqj+40n5j7
         ujsA==
X-Forwarded-Encrypted: i=1; AKwUvBySTmrB9ii3eyBETYOAE+HqDTJvGUebHT8EEvbgTGliCW8Zbt+o/A/6pyMkVmfGnPQ6FVApRF0KpGmzrlE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1UFcJrInW0ARn4shyfveK2OjHpbR2pZkMxgQkcXjvrFRyJmpf
	Q0SHL1t3oc2MLq9/Mzflft5felXQIm7ffUUrj9AwhIy3QzB6jlxsKKaX
X-Gm-Gg: AYBFou2pDEyMFruESoUdrQ04XETiSaNyNlmdLEQvcqHrowJ7mZPLK/RnRx+8r4FvVrQ
	q41wM1NDX25Dp5EW003l7auJ9Xh3iDVxmSzE124YvR7KEocwwt1P1gxXcbC6VmxQvfrOnKnPWjX
	GQZPiBLpnsUgKaaAXJa11aZpc/o37VskLKkfA0wwJFggTDIDyCB7kI6zR9hh/pA/uxoIZPcBUn1
	pJ1ouXKYhrMXO3IxtL7k8ZJBMiB0FVbKXEjGPIJBlUu7z5aZ7yZVjYiQu9Fus+b/z3KnhVv0u90
	AuR8VG5xBGbU42o5ub+cJtAqXZDTKbUaM7/EHXLK1HoX3QXlJ0l5LKdL9PDkaPJg3mn7GcYXEHV
	j3WJ5qROdw1DPHFftZQN/IdLkU/s0SUVYnI6mpGB0KTtn3Y89TuXhtbz6H9K54+oeLw/dl5V86U
	4VDb2HoUUGiW7upqSZjduLQ1ve6rhLPNJ7I77gnQg0vfrDNbGNryVT/9JtpZ1iKhTZ20JH4bpMl
	Ek0zAYlaBw6hoxkIH4SEzkg23dOvN3Vr8hjB7AxIQPO5oPkzjiH6+EsygkAMuBtAwDtJGf5ivf2
	z26TPY95BZc9GNHnlUmcNvIfd1ZJ5JDZAYia3PgFz9Be3GgK/zKyeSM3VexE5QMjObPkQZoRZCo
	=
X-Received: by 2002:a05:6000:2410:b0:484:3fce:6ad2 with SMTP id ffacd0b85a97d-486eb2fa66dmr10406865f8f.15.1789205583738;
        Sat, 12 Sep 2026 02:33:03 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e74esm11895369f8f.25.2026.09.12.02.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:33:03 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:33:02 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Denis Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>
Cc: Jiri Kosina <jikos@kernel.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] floppy: flush pending work before releasing resources on
 init failure
Message-ID: <aqUcNyP9DooWW9kf@gmail.com>
References: <20260722034435.13432-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722034435.13432-1-kmehltretter@gmail.com>

On Wed, Jul 22, 2026 at 05:44:35AM +0100, Karl Mehltretter wrote:
> The flush used to be here. Commit 070ad7e793dc ("floppy: convert to
> delayed work and single-thread wq") renamed the label out_flush_work to
> out_release_dma and dropped it. Restore it so the work drains before the
> IRQ and DMA are released, as floppy_module_exit() already does.
> 
> Fixes: 070ad7e793dc ("floppy: convert to delayed work and single-thread wq")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this patch. It already has a Reviewed-by.

Thanks,
Karl
