Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E718C4E433A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554910; cv=none; b=PTXhsrOFe5ki9dJouFAQguZh9nGayb1ezM0HDkQE8WgNT9YEXKLyNbF1ffvSUDPKFSmRZLyMfFPXsAkd4VdMM5VKOVPchtLaRUPeYljixmZ2rGF6/f2zFxnJLoY2fbLheG9cB3L5TILm95nN+2O+WysCcIr7oSYkBYkC1z/2GVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554910; c=relaxed/simple;
	bh=5mSG/NBC8w5GCzj2/vawyONk6X286OkVdeh9HuVTQqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYcNPuRrPCxXbC/VcxYWkfLerTEMmSXeA+9P097HW4WlaUnaReVHYlYVZ0pflY3Ojzv+swrlNkgWkI60K6xaLq9KwxuLQWTg5DCs5u/mouk8gzsPDCUv1rg4JtLKMWaHRTv1tZnRgKnQYQt2tJ59b2Nh5jPxKqQDs1xfvUfUxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHC0hauX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHC0hauX"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso881866466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791554901; x=1792159701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UHiu5xDsf5v+fCY0BZIG/GtuTiSDrErnjbooFDt37U8=;
        b=UHC0hauXuv8K6JL3Cz1iG7f5QfHzerrC4XvyKd072iRfK8eq0qziwY1MOZzR3tw50z
         YdFgd457fuZU2Xeo5vVMTB72OKdnHPYKdj+qr93S+P0dZQrciVFVN8CRANIhWyd2grXd
         EEZvkNXPm2GY1Idn2bp4p2VzZStusXv3UQ3ytkAqq/NfZWx9xrRyY1eJet/4q5ikiU04
         9qS8S+P6cPXJYpDtFeTzdETV1+triRbv+esdAZPkVjgNUYeQsli17opltLDDXIfF6Z6k
         acNKGy0dWUEMXlsYu6YdVKivyxCsU9aCj1TLHzO4mWgd4zFi+7NJDJB22pLIr07xJh6N
         /u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554901; x=1792159701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHiu5xDsf5v+fCY0BZIG/GtuTiSDrErnjbooFDt37U8=;
        b=iKeCCtMb8tEqpWld7WfVqOfO8hWr3l/NnuyKxjjEr4pO+QcilZIPX09O1j/VlHiviQ
         JJnZ0ICN5A3DBe338uk2Dz8wA4fcnAA2mxAZ+e96p5v8fnrrQoMRvywD0zfzGVCsV6qm
         uq9qlqSDhyL5SadHlC6Bd4UXoidcJ/yxyXEXWLa1qtrwSv4dQGKlit73/Hn7ZW56uWeB
         2v1mclGM0pt2BM7TxDsWy3Ou1NZMT96e178bWhrDA68FbpxQfCndqBsDbAfy+pYSHD9b
         TgTO1jAJPhQiMXkXYe/sqeNTwg/GuGE33ryWwJ08oudVAdCXNEg1A0TUWbRmX62rn0Iy
         MyBA==
X-Forwarded-Encrypted: i=1; AKwUvBxh6ZzKgkFWUCxoKQbEf//HNHBa7MZjlYdN7WrH2h9LeEiJmtGWHTN4r28CByTygnbiujOQhPtOp38iF8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcB4wUTNajq4sNaP90rew1CEjn3JMbV2+Mt2d7lcJ8onpbxoQw
	h44Jo0VgmxY8a5af5OY4+Vh2xEbTNxX6DKry3ngTWAnSeofKykUP18l4OLAKPS7o
X-Gm-Gg: AYBFou0t1mOIRpHGnJPU8k5ZN9sR0qcUODsg0DXNxDqhDAMDTK0Cq0J3frrdOgatanf
	Ur+mAKIixrUfieTWzstjhg5kunc+ipo8JIrGrkZuN2CVcv99h0b3+5OBTUNSWZKZYog4dyWJ+cb
	lJchcOPyuMUFsk34Xmd+HHlp4XfQzKOFeFKfSnXypsBmoKHE/UlXULLrhOoMANMw6w6PptEOEO+
	e0rIKb/oKPQR8/OysgvNvGmWOC7xGchFBUE33qtwqN3+mvIV6yg/tvjF4opN8oSErmTfghhUsTo
	KYjt9nVzQCDj88RnXUKljmcS+9I/PPJncnUVatbubVx/DRWFW07nieZ1sQ9AJhJIJHvSpQst0DJ
	muToWz1HXYpMklW/m5ZXwRFkvMfG8DzUErAwnydvMMpU/kOfq7gDxssTc//DoqQ1WCodqVZlSPO
	/06Yybcp4C4rFE8bJzbpRlXGL5ltR3DnFwgNV3BqfVXp7jUIRRwExgbKCEipRKg8qysMZoth+DG
	LADv+o0GISiMdefLhl3cx9FagV5b4ipVTh/svRgyw6MAR/mjJdWpaW5YUTT720uc1YYKTWL57fG
	Tjo=
X-Received: by 2002:a17:906:c110:b0:c2e:32d3:1b5 with SMTP id a640c23a62f3a-c31aa079e98mr201069166b.32.1791554900723;
        Fri, 09 Oct 2026 07:08:20 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm97535866b.20.2026.10.09.07.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:08:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:08:12 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests: ublk: make the fault_inject delay a pure
 timeout
Message-ID: <asj1TNs1XLIAzUQ6@fedora-laptop>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
 <20261008-bug-ublk-selftest-fault-inject-delay-v1-2-a96af7ead06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-2-a96af7ead06e@gmail.com>

On Thu, Oct 08, 2026 at 10:45:40PM +0800, Qiliang Yuan wrote:
> ublk_fault_inject_queue_io() queues the delay of each I/O as an
> IORING_OP_TIMEOUT with a completion count of 1. Such a timeout also
> completes as soon as any other CQE is posted on the ring.
> 
> With more than one I/O in flight, the completion of one I/O ends the
> delay of the others, and ublk_fault_inject_tgt_io_done() reports every
> early completion as "unexpected cqe res 0".
> 
> Pass a count of 0 so that only the expiry of the timer completes the
> timeout.
> 
> fio 4k random reads for 10 s at queue depth 4 on a fault_inject device
> with --delay_us 1000000:
> 
>                             before      after   expected
>   I/Os                     2263170         40         40
>   mean latency             16.3 us    1.000 s        1 s
>   "unexpected cqe res 0"   2263169          0          0
> 
> Fixes: 81586652bb1f ("selftests: ublk: add generic_06 for covering fault inject")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
