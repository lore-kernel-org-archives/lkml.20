Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C413AC0C7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787959209; cv=none; b=dbU3DF8IEM3s425tFpessaC8TIWtGV93ctYHqfd0614g/Awp6B8lHa/M4xnEwuuWud6NT2LnBtvQgw1R+zio97e5dlQ+fAswyjPfT4PLfiCjHXSx4d1KChDrWzBT3Bjq9Gvqb/TCcP+oqQ7Xk9s2BaEX2bnDLA98p8FWXzql4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787959209; c=relaxed/simple;
	bh=Dsr8qBZLgil/7Jhc9mZG6IoOdofcq7dtRdjka7YmlGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P+cxaXmIgA4vb1JVlph8cv6Z15X53qf7AffI2r8EpDUlGF08pJ6kaJqvMNFsct85wmm6+60NKlDJYVTPTjhlve501WWbnNkH/uKfw4gctVWxStd8rhTT/Cj/WGzEj3pTj7G7w11v0zf0Or9Qpn7x1yWBU4gRZrnvKRKAJgGhma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB4+0lYf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB4+0lYf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so12026805e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787959196; x=1788563996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dsr8qBZLgil/7Jhc9mZG6IoOdofcq7dtRdjka7YmlGM=;
        b=SB4+0lYfaaqVlq59q+XtB+rJWmIK7SxZ90qQvWK8dyJLLpmedBdH4mym0F8cBj1OS7
         dgNY2V5oFOgm7QPkk6r7iX//mNvGtkkAcgElof0etrKPdK+1eSG0dML78a3jKVhxE0bs
         i/qwmiq+ADsph8hJ06dyZBIyQ4U5IXnMxTa0b564GbEDhpc3ADX7To4/em93IY/8HBAQ
         8mFp+7lKSjABm2MEfUDciu0USesNJlmDkoz4/W1S07pYUuf8SzCm+q1EO4qe/iczTT49
         ChkcA4MRiRNkJlNkiW2UFMlHouR2N2Vzj5Uf1a6r/lJhJbE6DED2uIs2P3eNB5E6aksC
         f1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787959196; x=1788563996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dsr8qBZLgil/7Jhc9mZG6IoOdofcq7dtRdjka7YmlGM=;
        b=eHZo3DSNzcaj5awWPFqeje4iWvV7REhkvezUiC5VwzWpVDERbOMM34fyDd44prwsCX
         5UE87Nh7+OkgcTCVJu7474+4FqyAgL3tOnyZTaz00MPZ1bkww69K++t2JInvMtiquLao
         8GZQBMFHjvcFv2EYajXn02yvwzSvVPcKM8KIGUKoK46Yns2Hxt2qGiZEfED7HMTPIivv
         ePAAvgbI1LyTxn8OxEn6Tqr1m3lCqF9475zOZ7xoHWPetL7Gp78FLZVn5Nmo+GVY7FnW
         XvGD9h5GyH99o1qrp6JrQ63SKXroXz7yaYIkeSd2Gzd39Syi26hkD7oVRo1r2mIfyld5
         OKvA==
X-Forwarded-Encrypted: i=1; AHgh+RqeHGcuM52m3XoTou0a3u1LLXY7YySR11ekEKvuJuQgaZnHBYeEDct3Cropff/FNgvNR7MNEwPpomsi3/A=@vger.kernel.org
X-Gm-Message-State: AFuF++lLLxDYLo3eaQwD2nZ8/3dfzUgmJody+dbcG77P4791qc6SRguB
	jujzb5mLgD7OMMxMKLZf2Kp6BHSxC8OoztgOteFqC/d5n6iQCq2ET/+Y
X-Gm-Gg: AR+sD10ylWvGgGdqe38k6ngnRyuCoCKKarC1QmIN6jvBKjVb+VGCvgsbAMQX2GsfFHi
	sD5FBlm/nyXmosInsY9covOB/M+leVpqI2AyTD4w0tcKSD2ATLkpxUYP8J0QQGU8zDVI/kXIA3u
	oY9dyc/iR7AaPvqhe1YqGiDspk5TqEopBtTPg4D4iQy+MpwroHAeq7Dy76ZIxlWEwvToThWP02C
	pi4Sm+OokdQFsQUNW1xSEFwtTrKQ2SDRI4Efg0ej/nuWfyqk8dxMC+gIMNZf0XTom4XcbtrdMsM
	5gvhMdyzFm0P6yJuPBrdRWjrUJDiZGKmPSY65zSP6ZIJrgNlhuMB2zr4xveEROdIvJ1IAwPPD9D
	SG2c7C0UIFAjcbWCO/zAp1sEVgjnJeiuqztuJXdnivG6GVxGvfc3s1MBVNzTG7FCVbO6mZSWL+H
	vod8RzQ+V/J0aN6xigN0zRKz61n4lESpIwmXyyblBbxFEiroOYloXjXlkcSZnCm1ISpSikU1/Pq
	FXuR47RthD5F73nbdXIFtTpksWvBFDqdedBpYq5IH9gVs0N3X+VwjX+
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr110929705e9.13.1787959195990;
        Fri, 28 Aug 2026 16:19:55 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca1ed292sm33018995e9.8.2026.08.28.16.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 16:19:55 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9de2f5e7-079b-472f-9d98-91d878dcefd3@gmail.com>
Date: Sat, 29 Aug 2026 00:19:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default
 logic
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale
 <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>,
 Chunhai Guo <guochunhai@vivo.com>,
 Michael Bommarito <michael.bommarito@gmail.com>,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kbuild <linux-kbuild@vger.kernel.org>
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
 <apGqg5a5I9g1CoF_@levanger>
 <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
 <apHfhILRL0-lFOEh@levanger>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <apHfhILRL0-lFOEh@levanger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/26 20:20, Nicolas Schier wrote:
> Cc: Julian

Thanks for looping me in.

So it's not great usage of the Kconfig language to have the 'range 1 1'
and the 'default 16' here contradicting each other. But, it's currently
legal.

I would prefer to disallow this, but a proper check would actually
require SAT solving (or similar) in the general case, so it's unlikely
to become an error in the near future.

Anyway, as long as we're continuing to allow it, savedefconfig should be
considered bugged for not handling it accordingly.

Let me see if I can send something out this weekend.

- Julian Braha
