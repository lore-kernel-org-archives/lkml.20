Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B923BB112
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556431; cv=none; b=K6BhxbY4Rxwc4dDz/dmOoH/47z0KMLZKhDJ9HzaX1K5EJEAZd7hQmKOcCjh6+rJt2noD649Cbfeii+skyvTtYy3EPW94gx0W6zU863+2qL1cKhp3UoyygnK8Tv0WHiVUIsUux1vzQ3niQ/JAWIOfUQgwmmtS2+v/cf5uf4l1c+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556431; c=relaxed/simple;
	bh=xv6zzbRXfWNmHN3kY9ySRTd8niMhVJ+PZQRMETxvjvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lvu6+j07cZpRHvGVF1+uUHuujHjUH57xTL9t31G0PKipOkh+QVvfHbtv33a44la1q3N4s4raqAv8U8WG0Fl8gcDRGSbk5yq/W/wkNSKNV4wa4pLTLUhob8kSoaWwzywmoDQ3AhUGsnyTJoyVPVefQh2wIaJknv9lHP5mONthbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=MxvDta6J; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="MxvDta6J"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3515f9a5d25so3353581eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556429; x=1792161229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzAOi+95u4YgETIpz8cOgOaDACFlaO5G9IG8/tN+Sec=;
        b=MxvDta6JyZthODVU2DTgsdtEcL5J0yg6i3zBSPToGTf8rvilZOlffAlF9MEcK+MssX
         GPq7nhc7NPlinUsulGetb0IIi8671RGSDJDi6qzPyzGgHnHt5uJ/raB/AtnHsPMEeG20
         uwZ/fslLZ4FRlsJMwbX58PFKpyRmZPsa6b8eSMx8emUATt5/SiwgdMewCVqmFrAroewH
         7LJ3cP8EktLYUtSMrNDEUEY8mENU5E3D+1wW8MtGj1XjmcLhxLH9UceCL8c7g8Mpqse1
         d5z+9w4EiVtD2t2facH8aFPNA+M3me9CSm7Ph7W4rjV46/jrUSLnY3zqgBWAXQ/6Cxuu
         WwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556429; x=1792161229;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzAOi+95u4YgETIpz8cOgOaDACFlaO5G9IG8/tN+Sec=;
        b=bV4uvhpKYxtAIU5xI90hLp5Y8BOVIacSFNotRMYUZSqlNXiWTSoND9I0aPmTa+nnrh
         pNIzyuNgzMMvUuVLTrZ3p5WDo2FrvQ97Gx8Auj+asZmxdAYjfVFqSwo1jx/ugBwI2GHw
         VZND64HOyOvtA3/wyObZ45OjZSdiEclPgRaNCDUBvCKQbYPvxltOpI7pVk5io2f2tldQ
         tIYBuJLqN2mbqVKtblXjuv2o+lIrFPooRmTE1QDhMCmwSQ7vcfz6OQJBqPjEZJQIFfeV
         +V9GnGcIXfsCUBF1363CPi4aJ/Syh7yOS5cqe8Pt2VWWsaH5mTBB0cgayU52EPDEdHQv
         EXAA==
X-Forwarded-Encrypted: i=1; AKwUvBz+s/mL68I+6APXXp3UclnrZiXVCvn5f4kSAE4x4/S5NOd1CWrAZLK796q7Qf8XYiWYR3yKTwKyUuPnDTM=@vger.kernel.org
X-Gm-Message-State: AFuF++nQcJWYv79/44EfluGP2l7DwtylhpJvBQld5V8+GNzIklBwz8YQ
	reiYQrBpT+QOxw/FB1krKb81ml1PW/NV5WSDLniz0serqsj1WI+F7BJ9x0oGSslrz1U=
X-Gm-Gg: AYBFou2OxSLcfBlMFy1hBwUHAp/X3/o/2TbDF9cgi3TiVeKzpXGr8N3k1WZQWpUJMj+
	P0EjUuxl7DDeWg0R7shR3Q+Sy2q54vfJJK7MVvMI4YHZxpYHDP3WN3Q3juh0e8mCSvI4YRdClAG
	e1cRPsKYcYmVPuxG/+ltMpg3J7n69a1xrwvW92GIzrsyk1HkjFqslze5HAGiYDR240cMFoTQpiE
	VEoRs1I5ikEBy0OkvDGalBL8Z7vpxVRxTlGK1cWJ+U+t3UdMXMl5b1vEeacFeh42+Y22R9iXObd
	RUzlZBdorxfbHuLYoiB+2Qu08W0Ag1MkqiJMhMQP0LT08ar134Qb7t3QiJ0sZt43kEYaFarGTYI
	h+lcQ0lcQPainFyIlb7iTrwUEQAECmPTX/g4bFfsxNUjuoGTo+2sYM8GPkxjlM91gnZ6hm/vbZg
	KTAWhpYvl40RKXsASTWjKoNgsMPxti9R4aGHgChPClkZSQqvk92ueERrYntcg5lRvPq1j1AhpMm
	8l4wLnrJmDtCfs83UjKt9gxma/Tq2fpRu3amoxiGEb6zeRh31UWCyMVizkHmrznD5dY/rhmlHs=
X-Received: by 2002:a05:693c:26c7:b0:351:73cf:80d2 with SMTP id 5a478bee46e88-3537df8b001mr2961994eec.11.1791556428814;
        Fri, 09 Oct 2026 07:33:48 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm8003444eec.25.2026.10.09.07.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:33:47 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 AutonomousCodeSecurity@microsoft.com, tgopinath@linux.microsoft.com, 
 kys@microsoft.com
In-Reply-To: <20261008191602.45101-1-cenzhang@linux.microsoft.com>
References: <20261008191602.45101-1-cenzhang@linux.microsoft.com>
Subject: Re: [PATCH] io_uring/cancel: don't spin on local work the task
 can't run
Message-Id: <179155642662.219229.2527920169574410888.b4-ty@b4>
Date: Fri, 09 Oct 2026 08:33:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 08 Oct 2026 15:16:02 -0400, Cen Zhang (Microsoft) wrote:
> io_uring_cancel_generic() refuses to sleep while any ring on the exiting
> task's tctx has local work pending. It assumes the task is that ring's
> submitter and that the next io_uring_try_cancel_requests() pass will run
> the work. This does not hold for a ring that was still
> IORING_SETUP_R_DISABLED when the task got its tctx node from
> io_uring_create() or io_ringfd_register(). The submitter is set later by
> IORING_REGISTER_ENABLE_RINGS, possibly from another task, and only the
> submitter may run local work on an IORING_SETUP_DEFER_TASKRUN ring. To
> the exiting task the work stays pending forever, the loop never reaches
> schedule(), and the task trips the WARN_ON_ONCE() once and then spins in
> do_exit().
> 
> [...]

Applied, thanks!

[1/1] io_uring/cancel: don't spin on local work the task can't run
      commit: fddcf4c5321b3ea5f72166c3fd36a9d1c34f80c7

Best regards,
-- 
Jens Axboe



