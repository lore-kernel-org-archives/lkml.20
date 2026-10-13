Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0265353A63
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919010; cv=none; b=YDo8t0R11l9tO2XdYh5ppwv0WSE4zI0ScU7BLBnH78iG0m/NmaQnoRtbmrsYWtw8BEw2ggf5ra4NVnk9AfnIuv1yS+Jtm5eN9wNTxEXMa1Nf+RNZu3TTubxJ4IEpN+2w0ukF4Tvv9yOxVexcLflTPMNVH0E/L2BO9WYEn7wqCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919010; c=relaxed/simple;
	bh=NZKCsIl+eMG9fGsQjejtk9lf0m8MqeFHKmqySR38f9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AR88rFnKXOxnfr6bH+5rFKj3FE+azpViiHkHbSIJSkhuM2hCkE6uxXf4/MnltRzJeRymQHshehtoM6Y8og04MRGPI3VmQ1bFihOd5GlhW/h9RXe5GP6ofFXPD1qoLs0bWb5kbG4laXLjDwpAhXMXw1zXLfu1XF3dPsaSL6h82AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=tLLiJs/f; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="tLLiJs/f"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6cfed5dd083so192081eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791919007; x=1792523807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LMVzPqyuXj5ApWA2StVi76ci1CLBOXVU23pBi3Y7Tc=;
        b=tLLiJs/fgjv16ZNdmzoHeA22l8fBTqjwKXQSZAxFHG0QrydUpQBIParCFiBt38o5bi
         avBRxV7jzLlj1drEnH/C3aXXSrHbUvPukcZ0And3v0BpdgM2GhAoN/0UrJ0pxULVV/4R
         0XJQckApncG0TFCW/WEefYFgNlswkWIv3OcnZxOph1q6iMbTiH1LettNuCThs+CovbvD
         VDZs5MkJF2NF1h3FCJCmQ5ZqLfHKpHq71NftsCusCH5YgvB9EHiwuTPFaJ42dGJJjVwe
         ALp1pTu1Zln74/r2cr1RCK4vy3EAGIG43BlFHNUY3zZYK32SrDiZAqpgCXr3kjiglDRT
         jh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919007; x=1792523807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LMVzPqyuXj5ApWA2StVi76ci1CLBOXVU23pBi3Y7Tc=;
        b=03R55VINp974PmNlT1hPVCCAkaLCZKg3VBxh5fVyvzTNZTlCoJWZBZHEXSf1tfufm7
         RgtqruBVW1/vw1ssJhNCGtnTT4EE+U+EcvLQ/AkuysqkNC5WYsYhr8jl3mPgc0oqNeqE
         +28Xw5S88UnoK55lpYN8ZPgXuS1Z18yNGOxUzTi0hqri9d9Pj8SaeQX4EqWeqjemrTSl
         Tu03gF9MaL1WxrQ3oVwmidhUDgFvuQMZw426ywX1oYA9OOATqPBq332gvYXa3D9UujIa
         CME1fP4U1JYSIunXEHYn1R+FFa8vulq+YdmJuN5Cf8sZ1G7/ivdiIuyPuLl2EGvtN2po
         SZnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsPIXBGE99tK18TsRkkk3/8y7ACrIm/yMaQ1vzCe71K38SrbVd7pikGMg0jt/pVQ1qn3QnVWdSbxMAJcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbZCo2Mr+VcRY4uL3vVDoufv/cWmM01k3WWrubeBlhxo3hT2SG
	PSydDo4sYiuTwetHJwaAfjG5IDOy2nI0hRW7Ks9iODGSsjYW8zPdmb9eZh9kPl8AgLc=
X-Gm-Gg: AYBFou2zLNvs2N/hmRiBEOTCchs4qQIdDDjifdYoc6RzJGNd8crHDpuvHPtAj+v2MTA
	0Lwp5UJmVBLuq75AOdzBm5t2LorvOsKY0eqeSyCne0vq20Tja3a4YSWuZDa0CP0er6VSohV9ysn
	8+SY/YA52ZWx19O8hvWWNQkwzlU0jJWRRTNDQJ+jladB57g/SivDty3IvxJCWDItqw4FYeIqpVd
	Xypw4CpoEoNrtLhJXvIxV52YrxUTC0pqPEh6RLhcoVFZg7mjwYXYX3GpQRoM5Gk0hfQVOsR04Cm
	tsPPuF0Zm8PTP/xKpz3661I0wPlBONOfVjJRDHiH1bsumlX/zItSHTm34fCwgGCBE/06kTmOrb5
	igxpUIzSURG4m+Jzsv4NTdv8OW9ZEHnXOcsBQyjWRY4xW9w0h1HaGVNEvi5zrRDp8SGGi+gihN2
	3+hhUP2B3coX2aVirOv2NqWu56sQ55Awt2iEVA0oUz7k+9ybqi5GIzw4Mk30tZBFL+272JZl91f
	0VD0ZH1/zMLxbILIk784Fmc1ZMHqLh7Il2OPs/rYUTtCWw97NPzCLMrFA==
X-Received: by 2002:a05:6820:c8f:b0:6e2:2dcf:2cd4 with SMTP id 006d021491bc7-6ef0eec73fdmr9825677eaf.16.1791919007140;
        Tue, 13 Oct 2026 12:16:47 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ef023a1c1dsm12597782eaf.10.2026.10.13.12.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:16:46 -0700 (PDT)
Message-ID: <baae166a-4464-4065-a642-348034cda28a@kernel.dk>
Date: Tue, 13 Oct 2026 13:16:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Add dmabuf read/write via io_uring
To: Christoph Hellwig <hch@lst.de>
Cc: Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <d00e43fa-8f5b-4a8b-8b83-421d637ba519@kernel.dk>
 <20261013141046.GA12680@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261013141046.GA12680@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 8:10 AM, Christoph Hellwig wrote:
> On Mon, Oct 12, 2026 at 02:21:41PM -0600, Jens Axboe wrote:
>> I've queued this series up for some testing, in a separate branch. JFYI.
> 
> More testing it obviously good.  I've been waiting for addressing
> of the Sashiko comments on the nvme patches before doing more ACKs,
> and while I can't really judge the code those in the dma-buf code
> also look somewhat serious.  So it would be useful to get them addressed
> and the series reposted.  Same for folding in the PI vs dmabuf fix
> from Anuj, although making the combination work would of course be
> even better.

Agree on both of those (sashiko and folding the PI fix), but it's been
forever and let's at least get some testing done. As mentioned, it's in
a separate branch, easy to update. But if we were to have any hope of
making 7.4 and also not missing yet another release, then it would
basically have to happen asap.

-- 
Jens Axboe
