Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E48B374721
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160784; cv=none; b=Tys0fvO7gGan2s9PFYa10wsY6rDReiZW2GbXm6OaUbCXaDeLqQzi5orqMRpLnaG1ahjxg1+h7c0OkPF0SLPpXHHV9wili24UoH8M/ROLOxvvKJvw89Sp4ZzbjtoBQolOptzbDA2CFLSJDw8suzTnrFQWmYJISphkeU40XmfzQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160784; c=relaxed/simple;
	bh=lXVHjPCAYcLXVIhcGLWvijxrbTsyM32zfBe8H9DOsBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnmRVeA8QSDaCgKNJJ87tExsPJIITjr1AS7F3kEwkKoBChD5L+sw5iP+YLoVj4SLKHp4A1ZVHCeCT6MKQLWom70lXCxrJ9hf5xsTWrZ+b6Ly2I40Uoks6EYCxYgwzLXNyPjN0Krz9gXCF9xcOLqwRyrPGsU04V78AkxYK8W9N/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=doY0uyg5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qdY7PaDR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="doY0uyg5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qdY7PaDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792160781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uv7dkC3MPmwvohP9wCGMJdv25KGLHW3gqkljVo/xMA8=;
	b=doY0uyg5tI/G8PIsqoVkdL7J4hzukC80vQV28sjBS8bN9YU0+HnLQxOTV5Pob6UjVBA+X7
	4LlwWmjpMpxeIWlodCgBT876ypmgYMeQ6pPfQYF0eKYL46xGqJpNTeS28LUMEbjLOpXqnn
	zVPN8j53dFhCspU6QZ7FKqVnlcKV9WA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-GiuGxM-VOMqX4OkQ6f9MPg-1; Fri, 16 Oct 2026 14:26:20 +0000
X-MC-Unique: GiuGxM-VOMqX4OkQ6f9MPg-1
X-Mimecast-MFC-AGG-ID: GiuGxM-VOMqX4OkQ6f9MPg_1792160780
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b937ecbb4so614316d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792160780; x=1792765580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uv7dkC3MPmwvohP9wCGMJdv25KGLHW3gqkljVo/xMA8=;
        b=qdY7PaDRaiIpkYOE6lgO0XdV6p+uFIEpClv/ersLgUgWj0hukZ83aZDFQ7lzI8Srn/
         wEXQ5l4ekJ6k6SSfsek+UYuzX7AMLcL7gKIgJwDkLtqdWfmx/rcxtXEuKJ0wnPywFl2m
         sCVyb2FRmGr9+WTaY/OQKTlQAPQ07//j5YMHY8zBhlcbF+2+BIfMBlnUYui+ZhFAUkcZ
         /QU0l9pYowiEoLVbrdSf9P+3JQrsk0e+dUvL2zyBTxq4LOrGkgAc7YZnvhgYzGrr9cLT
         eES+CyjvwCU+H0fnmcXAlPydoQAjidYDalj7cYdqHh4qKVZzghEYZN6OrQUSpM3KgMey
         JffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160780; x=1792765580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uv7dkC3MPmwvohP9wCGMJdv25KGLHW3gqkljVo/xMA8=;
        b=ioKcLnrwx4e6Zxa5q0nN91FYWjk5mWBiy6M3s4n/fk7sEUjbu/78ofQfaxzuOq00ba
         RkAcoO2c7v5x5dhku2SDWoxqrKCQTz1fnmrAhjh1w1GbM19fMsWd2VWCGzJu9ZHIVvuj
         xlZvR2iP33CC5ECh0PSnyDafohBb8s1kKSHg8spYyJKSw52/0HEYE+o+JVmwslASjo8m
         rToESOGF86JNMC/OeEoDBJNzKFV4GZLSWm0iQxNqYOZBiodCFi9ctaXgLy4uPkQAbTvz
         Vho+kk4i/V0WTPo0HMkUdNk3HeygKCuAXA5nLb2NOWclgb3TbyL1/MR2IFYD1c8UTxiQ
         lPGQ==
X-Forwarded-Encrypted: i=1; AKwUvBynbo22yXJ0U679RQHXm1eEfFARgCuYtiftDiZKJmKQBJhb+q9J2f8yQAd+lWJrvo0rK1ExYPxg0g0WexI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqmy00VDEPgow2UCbvxDlGE+R9UHxTKRu2xJW00BuyEJ55nL/7
	h6dWINAluBmyTW5ZlpVm6mHpuFhwiab7VN6/D9/37CiC1TXGAVP/SaArmlksAurFir1nAo/6GZk
	UztVBKdFDyYI/fhaJaLl+hPVDnO9gSgChC4po3hYLnbUNsvw6hIj11Qpnywik5NjVUw==
X-Gm-Gg: AYBFou2+DgJ9z6glwZq0z+BKvxwR0VSvTRg99ug7Vu/HSKwQMVsQFIq302i6HMMZjQK
	IrUN9opKKDnwaqBXLCRkKhiXnjjg3j7glmHPQ2PBTdFRDsNm/yOHe6BNONgzRW+jLtADJ/mYarA
	UL1rJaqjET6DOhr8OYdyZFSnRClOYtWZm/foeWHjtTSRuxFNQkKyBrwwRSUFszlsh8hDJ8Id1ig
	PGDxJvGQcyr6FWg7VlKXXu2KP+5ODQ0u+xutjK/fzd1Erplz0rVytr328QfsqO11/UwzeqzEFkj
	zd0LmBKCr0WWQYBkXhqux6ciEbpIv9cPb0cN7soHCKvr9oOC3lIRt70ack5MF3yaisCeIqBIaMz
	tH1OavxTzZU1FDb6gW/rAfrcrJVLiuqxl48/hdUAWb5XTRQ==
X-Received: by 2002:ad4:5f4a:0:b0:915:e85d:882c with SMTP id 6a1803df08f44-91bde91a642mr3866586d6.0.1792160779756;
        Fri, 16 Oct 2026 07:26:19 -0700 (PDT)
X-Received: by 2002:ad4:5f4a:0:b0:915:e85d:882c with SMTP id 6a1803df08f44-91bde91a642mr3865886d6.0.1792160779143;
        Fri, 16 Oct 2026 07:26:19 -0700 (PDT)
Received: from [192.168.29.231] (97-116-156-223.mpls.qwest.net. [97.116.156.223])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbae22d0sm24249606d6.28.2026.10.16.07.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:26:18 -0700 (PDT)
Message-ID: <a785481f-74a4-468a-b164-0b7a55c04246@redhat.com>
Date: Fri, 16 Oct 2026 10:26:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xfs: fix bs_xflags copied from wrong compat field
To: "Darrick J. Wong" <djwong@kernel.org>, Reid D <skibletz@gmail.com>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, sandeen@sandeen.net
References: <CAGNJ+_2p_qyY2xx0b7wgHg+PJWLSQzYmfRqk3UCpue2f6GchVQ@mail.gmail.com>
 <20261016050847.GT2705364@frogsfrogsfrogs>
Content-Language: en-US
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <20261016050847.GT2705364@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 1:08 AM, Darrick J. Wong wrote:
> On Thu, Oct 15, 2026 at 10:11:57PM -0400, Reid D wrote:
>> From: Reid Downing (b1nv0id) <skibletz@gmail.com>
>> Subject: [PATCH] xfs: fix bs_xflags copied from wrong compat field
>>
>> Read bs_xflags from the correct compat field in
>> xfs_ioctl32_bstat_copyin().
>>
>> Signed-off-by: Reid Downing (b1nv0id) <skibletz@gmail.com>
> 
> Yikes.  Good thing we don't actually /use/ bs_xflags in swapext.

Oh good grief!

Reviewed-by: Eric Sandeen <sandeen@redhat.com>
Brown-paper-bag-on: Eric Sandeen <sandeen@redhat.com>

> Cc: <stable@vger.kernel.org> # v2.6.29
> Fixes: e94fc4a43e5c39 ("[XFS] Add compat handlers for swapext ioctl")
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> 
> --D
> 
>> ---
>>  fs/xfs/xfs_ioctl32.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- a/fs/xfs/xfs_ioctl32.c
>> +++ b/fs/xfs/xfs_ioctl32.c
>> @@ -124,7 +124,7 @@
>>             xfs_ioctl32_bstime_copyin(&bstat->bs_mtime, &bstat32->bs_mtime) ||
>>             xfs_ioctl32_bstime_copyin(&bstat->bs_ctime, &bstat32->bs_ctime) ||
>>             get_user(bstat->bs_blocks,  &bstat32->bs_size)      ||
>> -           get_user(bstat->bs_xflags,  &bstat32->bs_size)      ||
>> +           get_user(bstat->bs_xflags,  &bstat32->bs_xflags)    ||
>>             get_user(bstat->bs_extsize, &bstat32->bs_extsize)   ||
>>             get_user(bstat->bs_extents, &bstat32->bs_extents)   ||
>>             get_user(bstat->bs_gen,     &bstat32->bs_gen)       ||
>>
> 

