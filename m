Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155370;
	b=tsDaLv8KS5jb/wIJuPBKGbeUwBhk/zYnX40pCXIYrai17C6wKlayPV6deshNu5N8DIRb
	 CwCA823I2EKtBoSKvqminV9IYW1/fFsWXpZhtBmTArzaIDfSW9Pqk8BzEs+1zxAwHf/yl
	 kIe29DgTJLiiZgQo4pp2PMRKhE/uPAQmrLafqzKvvV8Bmo0PBUCv5kq8vh9cY4XgPH+kR
	 oWGjIOorgK/B9S4EdZfY8qtBG3Lx+PqJbFhwy08u68yxvfQZwzJwQQbS96MAhQlUJBK9x
	 ZuhqTGMzssJAY2poLwsF7/8qhM1+T7ajWiiRl3Q7mMNSM0TL3vYcbHqDcEhktaP4aXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ra/5W4A7wCVcqM3u/vPzniDQAL4TxR3LVwCVXnp5ER4=;
	b=5mS4fAGm5E7/J2h6FBVlusmsFqIGS0rVw5NKVgBSDWvPJLs5lu2JWBrgr77eg3nIr1vK
	 5Fx/XLOFMyU8MP/+hsjOnPItcqZZi7Do2ZjS9qbr7reVJQpdvrg1PYEtlCnAnM+ntpmOg
	 HNozrEXQmBK1EdgZDah5PTSFeVdCCKUsWdt537Hk/J4Zh1f9As9ovinc+Q9CH4SU/apPD
	 w8vvWpI3H5SErF0cT88oukKUD/sAw1oJYny/4fmueNPY2vmst5PlCYn4gV5dmXqPl+RKM
	 1eUt5kjXBiuccejuB/Q8VFgboZP6It0bzCYk/Cv8XYYnkF2jm2vctt4vccISLG7078w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHXB8c9j;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA87606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHXB8c9j
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae391a05so3136935ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155370; x=1793760170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra/5W4A7wCVcqM3u/vPzniDQAL4TxR3LVwCVXnp5ER4=;
        b=MHXB8c9jneQo2BiaVxQpQ4HhQdHPe6bcmkLzRssTBtxnvRvDXZwtPy1OidS1NubGFY
         Txv1X6jGCUKx+iCQgXK+izx3iTEUOcTe4YG+UrnXWVsB+WDYPEOyF9cFjG77QNmbogtb
         5dt6Z0p8dCb4deXEHQqXGDIfJ/0EGRg8juR4OUstpX4DHrwht+lSvGB82cIW8C34THNo
         0EhivxDyvYp3xG+gKyAMotdVx+DwUZ1ZvEqaeTsu8XtHNPdVRFa/A+kmUE8hDy01K9id
         ovH/sGa+jAYepclSh3iqlgOpEKZtIXnJaQqqpQ3r0M8ohe6S/KjwzjHYG0sHbGwyw4Ur
         8LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155370; x=1793760170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ra/5W4A7wCVcqM3u/vPzniDQAL4TxR3LVwCVXnp5ER4=;
        b=BuQUwI6nIFvGZlSSUn38viH2aGgzRG3NsIs8yrBEmPxmuCcyqr1KX97I3c03iIdJaW
         1z/NJc2qL2oaSmOSsITj03NhD7HL87yC6BK26BNEGIn7eLN/2qu3sXCmM+Zgs5mrPsZW
         vyUG0b6iWdvmL4Ca2it7BYzSFCZLsG5uws/BCcBWQrFZQ6C5Vbt7xDb9CnwLFMmZ+Byo
         4mzhEMLSkYy0eC4R+b5UomvVUuJIYuXzORhGt0xZ77Dt9R3slHAKIMYzgfhOPyRc/8VP
         Z3p/DcstoVz9uIhbePVVTHubMgFC+T/k9FxIfMatdTmhauSL3J072zLrgHosJzFM3XGG
         /6QA==
X-Forwarded-Encrypted: i=1; AKwUvBy9gMdNyw7AMGq1iXEh6EHvkt5qZ1XaJ1CnOKJ4LuS9SLU3A7ZvLfurifG8+X2rSM64eI7rPXjYvClZFI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKw3pg4zaw/slItUFzVUZhlTcUo+oWb58S/EZ3O8DvnfT+7nCv
	Up+Reiz01z7KblbKEN+TYOs+wuMyIbGPVnDwxA2EnObVPBA2AOH1n9Tz
X-Gm-Gg: AYBFou0TYTpaANV5op6sH7k/FzshlfuvoTDFFj2TCS7FjiXfMHN7GPsodRSJvu2QY73
	YiWyRJ27ojp2EjHT/Czur73N806Fpf7vK5MI0kBbvDwD2f0FfiNA05YFGQrkDBNuDFD22mLOfIY
	P7xRLVkVhiH76uILPp49rhlTd/WLIsfEPeqpmiltRtEJn1I/mqAApjJ+EPi3pj+yGRZtd7ApgYQ
	cgCFN5O+z2M/+xzMFhAkhZFVJxbOKTYkX12nnoJ4T3/Y63vNfAT3fE1EK3iMiX0voxnEgo45zDZ
	VXxgE/0/DRY5ekaHubYuozMTsce6dMeY6csIMFyEun7uuwqxnCO+9yAdgRATJXRV+FzWAxhTusN
	hP2doe+jjvwNHeHvby4WoneSwxS4DoAow3tHbCodo+kXjVEU+kc0dMF8f1EuXY7kN+lqsVl9X/j
	ezcAYEep2zrK14VLB4RUS82OOdPHvWF0174MYnaDqfBGQMyg3hPFzWqim1+h0WPossNSO+GPUkm
	nR6wUzv3bLZUEEtXYoMFgvKWRyN2Xt0/txY8ygOeHo8HnQeBsReJyAeiELde26lLwWqfLBYss0g
	J8M3j/rs7XtA7Q/ASiZOXKUijGK/D/sWQ5XQJWSyMjxvluw=
X-Received: by 2002:a17:902:e751:b0:2e9:6645:e9a9 with SMTP id d9443c01a7336-2eb074e7947mr280415ad.32.1793155369680;
        Tue, 27 Oct 2026 19:42:49 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a69csm15520515ad.13.2026.10.27.19.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:42:49 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: baohua@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	surenb@google.com,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	shakeel.butt@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	zhanghongru@xiaomi.com,
	willy@infradead.org,
	zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on user addresses
Date: Wed, 28 Oct 2026 10:42:42 +0800
Message-Id: <20261028024242.3394761-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260802074018.73887-2-baohua@kernel.org>
References: <20260802074018.73887-2-baohua@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 2 Aug 2026 15:40:17 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:
> Use the VMA lock for kernel faults on user addresses. This also
> makes the existing code below meaningful:
>
>   /* Quick path to respond to signals */
>   if (fault_signal_pending(fault, regs)) {
>           if (!user_mode(regs))
>                   kernelmode_fixup_or_oops(regs, error_code, address,
>                                            SIGBUS, BUS_ADRERR,
>                                            ARCH_DEFAULT_PKEY);
>           return;
>   }
>
> Right now, the code above is dead because !user_mode always
> takes the mmap_lock path.
> ---
> -       if (!(flags & FAULT_FLAG_USER))
> -               goto lock_mmap;
> -
>         vma = lock_vma_under_rcu(mm, address);
>         if (!vma)
>                 goto lock_mmap;

I ran some numbers on x86 to quantify this. Using perf I counted how
often kernel faults on user addresses still fall back to the mmap_lock
slow path (lock_mm_and_find_vma), and the total time spent there,
before and after this patch.

Test setup: x86 host, booted with mem=4G.

Workload: vm-scalability case-mmap-pread-rand-mt, a multithreaded
random mmap+pread workload.

Fallback to the mmap_lock slow path (lock_mm_and_find_vma):

  metric        before_cnt  before_ms   after_cnt  after_ms   d_cnt%   d_ms%
  fault path           416   3510.000           5    256.780   -98.8%  -92.7%

The number of kernel faults on user addresses that fall back to the
mmap_lock path drops by ~98%, and the time spent on that path drops
accordingly. So these faults are now handled under the per-VMA lock
as intended, and the corresponding mmap_lock contention goes away.

Thanks,
Bo
