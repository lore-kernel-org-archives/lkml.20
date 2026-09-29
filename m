Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1433F4DF8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656123; cv=none; b=RMv8fsGFxbJJvyCmA5pj7XVGLlGsreFy8ONevSD+Hw/ex/fCZsM/Ujr0MkWO2mG/zKL8C54JeU+dt/qqISKD6f42jkXzQzmQhecr3YkWQLQjbN1cvDt0b1+SaeIOHTu3U49RadxjE2u30tZmz42BWdKabj80FSZFdl6o7xx92+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656123; c=relaxed/simple;
	bh=XCJXy8mpTEA/nG0GkAEF0C7KhBtyatIGu3/yvND7nKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6qAYK2nNHebMlLCMRpt4r94JOOzEVOtHdOIyzTfB6D/hKzYMozp1kca4kkRTLxSvEPSxapuWpW+vKu8vQLEABIAoeoptgLefVDjGK4uShvZEYFEPnPvDLrNoLVFc9cCfIDHU79xJ7T+6/yK0YlYvG0Nw4A83npfINkoUAxO+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hKducV2A; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hKducV2A"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e69so1100533a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790656121; x=1791260921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1J+Crm13KpKHhtBJ6lWWXDuL/HrcWdM9aqmpruQeUk=;
        b=hKducV2AmWnS9w5G2FwLROE7fBIJ0umcUd3H6r19cZi+O4QFIMMoA8x42iQU8SWz/S
         92Mwt3BI6uWDuzNKqj0/MZoLMgkAFhMLBI8iJfmdjn70gz5J3LBfTco5nOXLCJ4fvQzC
         Ip32pSMDIcU5uWZ2qHanGzw5CbLYvCRs2N7yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656121; x=1791260921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1J+Crm13KpKHhtBJ6lWWXDuL/HrcWdM9aqmpruQeUk=;
        b=vV+CcHNHxr3VuzP9drvxUUKWlYtX17hrksxDasWcmLXCLZ9pXwj04r23L1PFT3T8nD
         1p5K/egj0YxywBycwQnhJZQwgfzHUiiTAkxGOkWdiMRF7MGYbfucOBPsDMhdx6n72iz2
         gjRPopD5FGyqci9WFZjWvjo5bRXZJOa5ZWyT3ZRqt8Tl3gw2o0JLH/3bYCgQnGrDPhPz
         LnJ3PjQN6r5C+xZiW4BYcY5Tv//h3h2v/Bf8PPwDrWamuEK7Ji0k4w8TBsBZF6QxZFpE
         IZhvq6M74TIL8DpVf7yfTk2ys/QdEmC2Knr8aYc+khfrBvGoTK4nX07WrFvjTTkY7ONZ
         269A==
X-Forwarded-Encrypted: i=1; AKwUvBzuYJRIYASRJN37rk+Y3kLE7x+udaPNL45txYWdAeGExReJ23/Ja8O0o6x5YGDRpiKZvhB7gE/I+pgoH+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+TsyDDAk6tcKvcylVRhbUxjehd9PIw2ex+QJzatr7spLRkPCl
	cjiv6EY4Jxt4P4iP3bVxCh5XyLPocNkho6j8vTpP5xk+5Ob6vx8Ep+giHQ77FRfUXb/d5x189zM
	pIio=
X-Gm-Gg: AYBFou3ETKb86Pj8rzBJNbe9HrPQtcM7ttWy0wHuGzfL2IJAVa5ebLIjjoIQJ1wJNzt
	QWLcWWPY/A/PvZ6MofvuQInxUT27fDKKLsHpDt9TLhlo9al3W56X18Hqp2oqkBiJTvXBd3QCWSr
	7WxbNSshap097YzvrrJ6I5TDMKAldqNY3ak573zsGmz3lTn5+lbpt2ZOQ6tTslCS5UsV8OfhzUy
	OMcFZrEfkj79N4lSPs+mf4oleGpNnEb7cTyr45L0+VpdJgnxhzGhqhehNwMMAj/yZMlwoHLVIQ9
	xOZUGxWF3yOgOxoGXd3Vqa/9G3tMBLQHxPM3fXxz4cYLWisycITYcDSDfQ4WtOBTR/lskvwn68O
	0i4syC8utG2E7DwxEm4/0VyrgKrf8GlSJfUkq6V5Q0BDfEdHbPAfXRz/ZzRngW6PCt3mNE5ckLH
	eRAchBAqdRvq3T22E0lZ9jKChAM4VM6YUq1Ha0uHdw1q7DZzCF/ZizewPa+ncGtjRpFL8qPCPHa
	XZy1C1R+OWq70Gr/6RzlqHLa82NKbCgcA9FIvo=
X-Received: by 2002:a17:90b:2749:b0:39e:5b3c:4633 with SMTP id 98e67ed59e1d1-3a0985be307mr11615607a91.21.1790656121490;
        Mon, 28 Sep 2026 21:28:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:5d05:485f:348c:a48b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49867a4b1sm2852928a91.11.2026.09.28.21.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 13:28:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: zram: block_state returns premature EOF with short read buffers
Message-ID: <ars-NNUnD1dc-CTR@google.com>
References: <CANC3H+LdtoydSp+o2ecErAw7k6R2+gRf9LyxcaoHv_mGhJmyQQ@mail.gmail.com>
 <ars5x7UjjU10KOjE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ars5x7UjjU10KOjE@google.com>

On (26/09/29 13:13), Sergey Senozhatsky wrote:
> > However, reading the same file with a one-byte buffer returns zero
> > bytes:
> > 
> >         # python3 - <<'PY'
> >         import os
> > 
> >         path = "/sys/kernel/debug/zram/zram0/block_state"
> >         fd = os.open(path, os.O_RDONLY)
> > 
> >         try:
> >             for attempt in range(3):
> >                 data = os.read(fd, 1)
> >                 offset = os.lseek(fd, 0, os.SEEK_CUR)
> >                 print(
> >                     f"read {attempt}: bytes={len(data)}, "
> >                     f"data={data!r}, offset={offset}"
> >                 )
> >         finally:
> >             os.close(fd)
> >         PY
> > 
> >         read 0: bytes=0, data=b'', offset=0
> >         read 1: bytes=0, data=b'', offset=0
> >         read 2: bytes=0, data=b'', offset=0
> > 
> > The file contains a valid record, but the short-buffer reads return zero
> > bytes repeatedly and the file position remains unchanged.
> > 
> > This does not appear to be a memory-safety or security issue. The
> > observed impact is that userspace readers using a short buffer receive
> > zero bytes and cannot make progress through this debugfs file.
> > 
> > Could you please confirm whether this short-read behavior is expected
> > for block_state?
> 
> I don't think I tend to see this as a problem.  Why would anyone do
> a 1-byte (or any other tiny buffer) read in a loop?  block_state holds
> a lot of data, just pass a huge buffer maybe?

If we can find a real-world library/tool (rust, go, etc.) that does those
short reads then I guess we might want to fix this.
