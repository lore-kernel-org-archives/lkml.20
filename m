Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716286;
	b=j/J3dVhr2lm+8z/ACv1wKXD3UKz7JWvGOg8hAvX/BzTbvNiRz32ZmWbgYShFDZ3gbJVe
	 87LnZaG88q2BQzzHIlXFFW2vYoaeqaRHdxY8m96DytycqvhR8fPZ3vuT7G9MUlcMd7pzK
	 8SiNL9aYlHoM2j6z5JGOS6TgiUcmcPRgP3iL9zquE38UvKbgJ03NG9H2Inp5JmgQrBPK3
	 DY+3gAz1/F2A/88sd8YFL7K09MbHePLxNbgTvpYMHcob1LU5bTQxLBQFjajgc41SvFlrL
	 oCG8yLS1DZF7IMmbiICqi+GaD1HcI3Q/KRsIrtmHUmR6cdMCPPu6/kELGuI5u47dP3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=8V8dKjtxkMWSm2f6XmuG8tj/FFGpuDNeGHGqW2z0R08=;
	b=fycEuAmOsXNvjMxWw5WOiSIvyCz8dTfzdIAOQiHIdjdRhId/YdQIe2zkq9Al/R+pwN3N
	 WQpoqpkYfep7pvdvQwpwowsVMZWpbTxkJPicv2HEPh/Q7DD6fkfFQmt5HvRWcJMLS8MIZ
	 6n4UT6dp3lp3I2yTABKLQNeAi6yMeWu5pgrOguwkX4TmzPUgE6bNWH0Xna6l+nMinUSz1
	 SudE60tcc1Rc2CUkbkrr5CjEyIpWRJFBCCTGXbuf51zOk9b+oMP9DYsUEdu5k5XKYe6aI
	 ZchANk1LXFRzvKdx5XTYtgG2K3UAKQKPB6dhUamLvtvFV3JrcIvbRqwI0UODlxpra5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WfglxMrn;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EF606D819
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2EF606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WfglxMrn
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9b69so3127139c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716285; x=1794321085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8V8dKjtxkMWSm2f6XmuG8tj/FFGpuDNeGHGqW2z0R08=;
        b=WfglxMrnCCCQb6+e0ckLHUVEr533fxpsv00mzMsO0IkgVt455m0b7O62nVRLnxMckA
         hEWGyq+lsykATqEe6fcewAUP5E1+TLanMfCYb0NqK6u4TPRXy+/7dFDj5kD8iA9uzNeu
         3fjcOtX0aqx85pB1cM7kRQI+H6rnMtODVYfcpnNM4gYwD2QyHc1zRMMcQAit8CxmksFY
         4Mt4F19J8D9T7xJCD73O2A2f0qC7yFEHvXxkK4CPjJQJ9YzH2IJMLl+jWHzeXP8cfReF
         fgnZ07lEuIPueJbSHC66bBE4MdOdfZQRRvDfOHoqqAyh0vkgihszXpglBlebIEpjfN9R
         Ux+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716285; x=1794321085;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V8dKjtxkMWSm2f6XmuG8tj/FFGpuDNeGHGqW2z0R08=;
        b=izNR2hvLTQvWwLUgGIP/ZufMtnv4U7ZkU7tOBRW5xvB06yLlNWf6ctl7sTYnZxlZ0S
         fHKMHJf5h+BPQJbmhPX1401v3o7VWAsHAniFmrtN5aA8MVDvcdzV5MMm9dKX0H2B6L+7
         ItVFUue7A3aogU7Zi5QlXEdH/PLOq7FwPHzEzEny2tHqCNEhJnMJyo6aTuYAMdI9tRVm
         64F6JScMDhJF6VqBkAe4xomxNTXMJKwSrnDhefFDn8VJybHgag3KeS+XArYehZqHGSeN
         MAShb4t1lTpF9ET+FqfjyhkTdB5lWCNErHGc5lsJAZt4AIfouKwuIvkgMp6JWG3Dswhf
         Q4yw==
X-Forwarded-Encrypted: i=1; AKwUvBxyOxFyvZ4kIZm0vOxsb1/yI6Nrl416u3EMO/4FrAflIX3G6lydvcDOpxRwzJSCt3Dte1c7FEY7VpOi5Dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vMRWZegw05s37FY2cN+mseonHecHqHzvjmbaH+ZsF4ZpoKwjY
	fD7NtsvDMyzH+MG+w4FticT/oP5Ng1Bvxhwjc3NKGShJr6+5Ri1Qgl9CPZ5SAFRisew=
X-Gm-Gg: AYBFou2tJSet7QAyTi6xZRjs8A9YOqoqMqEVxWXWVUXm1NmIpCOPXU9o3AjKyGXcXWS
	A8xKmf5HCKycnTK6+9V50HRmztKHdOFdsn11nWw9XZRBvRhkX8nTKUQrd/5D3l7yPNHZM+04iff
	uchz3O9wiUxlFjP6shddV2j7JNaMiK9Ndu660QfWBbIbMKtJ8EylVUcWkE6WW28zkgv8/oR7rNX
	X/oDmCHmvb1VbBPbf0X68ZXmT00b7IKJcUvl2FyzktyrlsCwsI36A9UMAp1m2o5ZA/i8jgCYz6s
	iBMHYws7fO42hW2qU0bcslWNPUn5czolEy89b9PQWj0Rr0arcEK4KenBx08Qnmw/hP512FYpWw3
	x/VNfDEM1lZq0vIpdgg7AINR+pq7/TxF9a6oLbpbtxuTAd06B98Uq5M706xiCACQyrniaO6R/JY
	RrV8h5JoBzqd5VSS76ga1ZNeQCfzXwkUHKDazQj4GbimNdCr6dxE7OVtcFkuk5pUTT6a1/S/M/X
	z5FrmX7dIck+EIKmynp03eeLNrhQAm6Cp22Q2h1DjO6HDrs6hvYV1s2U3YRYA25DBVeTq1Ef1MS
	eQvX8KAdKZwFLX9g9eTOzC8A5kuodgxZF5BBg+e58yfr3Cd1AOVbtNtALT73i99hi2Rg5kPuz1n
	T5gN8vziULPOt5qpTS0YF5MSBklmVevzNMA==
X-Received: by 2002:a05:7022:88:b0:144:fb31:a597 with SMTP id a92af1059eb24-1ac6069cebdmr18479029c88.47.1793716277896;
        Tue, 03 Nov 2026 06:31:17 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:16 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Laveesh Bansal <laveeshb@laveeshbansal.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, Ming Lei <tom.leiming@gmail.com>, 
 Christoph Hellwig <hch@lst.de>, Yu Kuai <yukuai@fygo.io>, 
 Reindl Harald <h.reindl@thelounge.net>, regressions@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261031044141.5569-1-laveeshb@laveeshbansal.com>
References: <20261031044141.5569-1-laveeshb@laveeshbansal.com>
Subject: Re: [PATCH v2] block: only serialize elevator switches of the same
 queue
Message-Id: <179371627639.3691261.7215818828022045102.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:16 -0700
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


On Fri, 30 Oct 2026 21:41:41 -0700, Laveesh Bansal wrote:
> Since commit 4ff58d6bc9dd ("block: serialize elevator changes for the
> same queue using a writer lock"), a write to queue/scheduler fails with
> -EBUSY whenever something else holds set->update_nr_hwq_lock. That
> commit takes the lock for write, and it has to be a trylock because of
> commit ce8ee8583ed8 ("block: use trylock to avoid lockdep circular
> dependency in sysfs").
> 
> [...]

Applied, thanks!

[1/1] block: only serialize elevator switches of the same queue
      commit: 603523fd54664f17630f742229166278568c3ce8

Best regards,
-- 
Jens Axboe



