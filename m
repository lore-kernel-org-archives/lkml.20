Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321C54A0121
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998248; cv=none; b=AZVOtH3SjaINW20gnMSnYLt+BoOTaifxlapzAFnUg9DSgR02nlMz6xYaOfzKWoeCXooQS5yt2LVpp4CNwG882958xNarEtq5xaK/1PJtx0NrRISBDm8jF7H/N32LFSx0lCxkpj0UvEdOZ95Coj+4RrKoMY7kdzSFhPAbqGWD/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998248; c=relaxed/simple;
	bh=Ffr27RNaF+FHzq3WbV+cwo2+VfRU0uuG7BksAI4Sf34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQ2F9vEPCgZXIM3Rso+ZM6QxmlugtAlhfvBfSp05at4XLsI/yjn5PefBFbF5G7T+SNhLfXDAcyq2W2XM4FTcD1lkoiPpKVpl5RazyjKcfvW7WVBt4b+X/ZKSJO7hbBXbmYTz9KLcldW8Y7073RjlJ9oKIdNEK79dK9gX9rs1x3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ041ULT; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ041ULT"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso3536310a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789998245; x=1790603045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkeBIcnXDbJI7xttPPj+BDZba0zlv1qCEuppUmdh2T8=;
        b=WQ041ULTmn8oIfDDAPegB0ryOuulWBW8xTH6dy/FNnuTaIROw06zad9G8VOvA9jhCO
         nGwwGrtltQ9w/VNo6HxG32lzeR/pNHGDZmggvzI8SepHxo7M0yP04joHR59rBWJCTiRH
         QkNZUxrc9lEEj16orPpUTEQ78mHZatBMM8chhmaT5E3YJogMM2ovjFz0bZXboWOE2ZIE
         Osr3I6YtCh4efQp+KJAUcs5SmZvKjdKhNwDJYwBf3JWvn22WDgG4emGeXAoCo4POf/Bz
         BiNQsLFOrAOIU/O71fdUJYRIrhmzmMfW6krL508dEfCqYqrsx93B/mV17uYZrjf+PVRS
         VfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998245; x=1790603045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkeBIcnXDbJI7xttPPj+BDZba0zlv1qCEuppUmdh2T8=;
        b=JU97WX0jX27rrOnHB9qXNfrs0V02XsbkZPXrEQKqUzITtyZ1vn1a4eiKGH44TdTanN
         ExJ6xyLfQxQtC0W83+lteRMZyvwFd+xukGtZoIRYGmhhC4y0yP3v4Wa9Kyazq439yT8L
         0FP1SAulZRZDNBwOenBrftnVLo7s/fMeQRVqyEMOO3w95BhW1D8BraruOlqaOXJdeQfh
         /1tIodzvTikA9XyobicS1GhFsOC8dkMJ+OG3T9Vo4FT/w+iU8vnfXFqFw/Q/CC87EZXz
         YPaONa+3xOTK6689FvZQJkwSgvrAJLDoQccVmuN6+Nb0k4wBcP7Y/r2M4Lvnyvg0rtjo
         MajQ==
X-Forwarded-Encrypted: i=1; AKwUvBy64wIFgxdMo/FnJfun/JD4OO5MpJyPp3YC8B58cYGkcU+EJCMUmtQ7Ab4TR3AjVq0FtRijZK1+G6mMnUA=@vger.kernel.org
X-Gm-Message-State: AFuF++l8dcsI12Siz/IYvArtpVlYTkcykmbXryd8cX0lxEgwZL5Q8SS4
	Q5NIzcRIFGTByS4yMRx9mgXWzXK4fYoT9SotW4Nx8z2W7b/bnkNGnS1W
X-Gm-Gg: AYBFou2epM1jLl4pG57aWHqOCq+Ngs+MGHDiri90UvjL6ctlZXSLQdUHCjoueBdCF9u
	Mj3Onbyc1oiXE+Zj8B3pLmXjMIzZaAlJ8WV2Fuwwhr7GvD4XhJWywvqaOW03x/yIduQnMD2J8V4
	Mgjtg9Qa0WGK7zN//r88ayvbG4K3Q5vuDdo4j6xnl8SSP8/YnBaYUAf8xZpqdl7YfhddKdjU7fB
	tZJnqjRJ6O78NtJ4JC4DbQ8oMx4d9Eh29sucN/Ndw4oT4cNYzgSs840sxRpofpfQ6K86b17i4kf
	CwjkZuFT+kmagKYRzipm/ct/lP9Yd+iYS2xA5sz/4/50iVqIKnfgsuqZEro0S++uxZ5QcyaPajC
	LQAWlKAr1gCiAveC+LwqPnrE+Fo0kLy3llRkrXaqFmiS+T/8IU2G1YyhY9RJdNigQAakBWpSzDE
	oObCR2Fsv5r5ZsrSl1qb1FYIG1Dez5L9iySOBxoCH72MgxaL90EP69bl8g/yWnfyHRQZC3GFvsW
	+U3RUWwQ0SUrYqywfVMplFj8qjoeP2vh5TTuSProcgBCEgAvvO6c7UXhASIfoPkybA9q1Vsb00p
	Uh1MDaW7Ov237wwAo/tpHDRXwsTUlGRmGe87rQ==
X-Received: by 2002:a05:6402:2355:b0:6a1:4458:7f2d with SMTP id 4fb4d7f45d1cf-6aa53104448mr8100478a12.5.1789998245342;
        Mon, 21 Sep 2026 06:44:05 -0700 (PDT)
Received: from [10.54.182.141] (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e0d3c5sm4417232a12.22.2026.09.21.06.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:44:04 -0700 (PDT)
Message-ID: <b3e1db34-45c8-4723-8d09-eabc28bb0988@gmail.com>
Date: Mon, 21 Sep 2026 14:44:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] dma-buf: introduce initial file I/O
 infrastructure
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org, akpm@linux-foundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, nj.shetty@samsung.com,
 joshi.k@samsung.com, anuj20.g@samsung.com, tushar.gohad@intel.com,
 william.power@intel.com, phil.cayton@intel.com, jgg@nvidia.com
References: <cover.1785596451.git.asml.silence@gmail.com>
 <ff5dccf71e8c03d62797352c4bb5fbb7c6c759c8.1785596451.git.asml.silence@gmail.com>
 <20260808074245.85757-1-sidong.yang@furiosa.ai>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260808074245.85757-1-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/26 08:42, Sidong Yang wrote:
> On 8/1/26 16:46, Pavel Begunkov wrote:
>> +	if (dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_KERNEL,
>> +				  true, 0) < 0) {
>> +		dma_resv_unlock(dmabuf->resv);
>> +		goto retry;
>> +	}
> 
> Shouldn't this be <= 0? With a zero timeout dma_resv_wait_timeout()
> returns 0 for a still pending fence; only -ERESTARTSYS is negative.

You're right, and this chunk is gone in v6

-- 
Pavel Begunkov

