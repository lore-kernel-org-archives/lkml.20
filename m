Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0C4BFE8F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589105; cv=none; b=HRU8BX+4VGvG0Qb5D4Zl12dIxCAq1eqynXaIc2Bb2PNnzl5CCsRrv4jbot9vksV/39c/wjM1EWxVM8ObFaVXvq6KfCFVrqFP6qlNzq4n9EnQs5nipJX2BMHTKxHwcWHkamMGM+tEKjCpnhU0uqeV8ITLNe9AU9f+pPtpcQwf20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589105; c=relaxed/simple;
	bh=ihZ35iU0VI/7mp+EmY0VgHI5ZWg7b+/5sEh2IzhBvNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSLnqa+xWSxj1xQTz+px1O5RpqJ77qy7TPqF0UWZKbjAc6ZX2pZmV56978z05i7I19a+t/h5L/3KUUcIJZptY98V4KdDvYWtgyVjmSWlqpqIyzmFENuCu/PwwCIBzIoNTE2L96ZUzsf0Ov8JFoxvo/zeTkh7tjkNm8PZXOiMhoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=AniVZPYl; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="AniVZPYl"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910531ea7feso531796d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1789589079; x=1790193879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYBE6fjhCC90VNWvARTLSCkVoVvNv7gfJ6w8/9LQtiY=;
        b=AniVZPYlfP+Vq/g9a5qel0llK4FnJ/QoYiF5jhEig1PN1JchyCwapQJV8gaaAjeuto
         Q0xCSqjxYCoi7+doIYvHs1rn/zCZRkZAZjN3aNfH+S11nud0kC0ejile9YlGQy9UGu9j
         BpQroyO8mzr/0BPHIgUFhQoa63i7CcZOg4C2iaNBmhyyIfCEsuVO8ljGDqctz2dNbPsw
         OqYxg6+FQ+VxnHvWWZm9J0fE/fzMMFxPx3qozKzETT4R8xnJspFbAAixThGpPh/r/jGu
         C3b9OMMmVs3q7SqxN8DkYMbWoi5vF3surSSa7tH3qRBm2vASQL7X1M4q6WexUkkx1weN
         qX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789589079; x=1790193879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYBE6fjhCC90VNWvARTLSCkVoVvNv7gfJ6w8/9LQtiY=;
        b=rx2ic0ZMa8wrqc6aHqfn7yCWm4eAbLpQFekfQPUqmtC4G49QdM2US39A5uYf+JDBi8
         72KG1w73CroySNc8+e2LQC7J9h7VjKB0OumEZXAnXlV78zJOd7ObeoZmdESi1rWm0OIc
         x0k4qfa4Pk9NW1VMizHniTy46HDsN/U/h+v/YGupR42ggGkOwHEayKJ92oGvhagugrvY
         3emDFfEjH+D67buHNVez4FtkfJD0dBF2cwjWrdVsCYYVBWlrsXyh0vkNGj4KGamV/BRS
         OffJKgdc4sm7QfthpWotDaABbYYzgh95IGtwP5r8Tdl0xvfPmoudT8EDzyMkdxfCek/n
         aNPw==
X-Forwarded-Encrypted: i=1; AKwUvBxLdwu9xZH4L/byUTRfrC6q7pHdpBmQkKX8FdN7z/4VftNwJLxcW5O87Jllw9t4jTxnHnNqdWEaWcP3HzA=@vger.kernel.org
X-Gm-Message-State: AFuF++m22OcJd43ehTuSQoMRZVNr8sJrrKeRePSOsH3wMObSfk+y6/AO
	4Q0EPaOuMAT5QEX+I8sEas2IJT8wg0+m4Lw3wBvqbFWyfj5z9dCtmee23v2QOCLQRKE=
X-Gm-Gg: AYBFou3CsRT4HAPg+IRQiFu+18BrkZ2svEI9zXFECjL3lvz81MjPklDZeK5+W32USV5
	vkFMCJAQrnvW6GzX8O9nMhT+s434mzy6ldLaea4N+mSCy6CRKav75a/w/wIqoAMXsbSwxLyexQo
	N4X/gKtdB0cFJZ3LVN2iqLDXyl97sC65fl7eYgcql/Z3J68vWQbA5vV/gj12lShN6skLid8rtod
	bARi70Sz2H89AVwkIPTvI2/uLKbbq8kmP1eOV1jwQJBbIJo4MbDmrQNbXQMK1vQRCeWPcAOdnRf
	4MHqsuQVJ0dI1VqAy2yuUWzaYeiTZdQ5h4IyXXqMqOCBlSWp4M7L1tbnuTIxP9LS0sspwaO2mzw
	i06GaQw2bJcDj2Xb9GYTom9aaOWjNblXHHV63PFBF7l4ykki8X6zXxSJxzS20CA5C95YjNTBj6a
	1vU+lJnPcT2BusTvRnzFULTx8jAj/h/03AufW44FGfSwTEhh18RTa91OYOZTTDC8LqvB77Tw==
X-Received: by 2002:a05:6214:404:b0:8fd:d5a7:f970 with SMTP id 6a1803df08f44-9123d754226mr75992146d6.11.1789589079282;
        Wed, 16 Sep 2026 13:04:39 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:1f35:22b6:fe30:2a34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be946f0sm33219756d6.27.2026.09.16.13.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:04:38 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:04:34 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Youngjun Park <youngjun.park@lge.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasong@tencent.com, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org,
	yosry@kernel.org, joshua.hahnjy@gmail.com, taejoon.song@lge.com,
	her0gyugyu@gmail.com, lianux.mm@gmail.com
Subject: Re: [RFC PATCH v11 0/4] mm/swap: priority-based swap tiers with
 per-cgroup selection
Message-ID: <20260916200434.GA5784@cmpxchg.org>
References: <20260916183437.2946306-1-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916183437.2946306-1-youngjun.park@lge.com>

On Thu, Sep 17, 2026 at 03:34:33AM +0900, Youngjun Park wrote:
> Per-cgroup swap in debugfs
> ==========================
> 
> Patches 3 and 4 let a memory cgroup choose its tiers through debugfs.
> 
>   # swapon -p 100 /dev/nvme0n1p2
>   # swapon -p 50 /dev/sdb2
>   # cat /sys/kernel/debug/swap/tiers
>   Idx   Prio
>   0     100
>   1     50
>   # echo "/batch 0x2" > /sys/kernel/debug/swap/memcg_tiers
> 
> Bit i of the mask is tier i, so /batch swaps only to sdb2. A tier keeps
> its index for its lifetime, so the mask keeps selecting the same tier
> across swapon and swapoff.

Can the cgroup be given a priority limit? That would have pretty
obvious inheritance semantics:

root
`- batch (memory.swap.prio.max = 20)
   `- task (memory.swap.prio.max = max)
   `- logs (memory.swap.prio.max = 10)
`- interactive (memory.swap.prio.max = max)
   `- task (memory.swap.prio.max)
