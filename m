Received: from mta0.migadu.com (out-127.mta0.migadu.com [91.218.175.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05FD26CE2C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790823100; cv=none; b=QgL34D56CDRv43HitaVXnRdc3N77ORzEflCKj5ElJTixsoi4B7i/oJGaygVSZpl+39u82ltLFzks51wcLdK69+FIJn4SnrdrldcL/hIvfZrfCupH/0H7BXGPpByJYn0vHmjQHWTS9hHVMZzhqNmZ50EaHoEjYIVF5NURj+mdDus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790823100; c=relaxed/simple;
	bh=jeSj2deFRKgsRDPJJJ4y2YKe6wuxSS/dZR8no12kX1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jezZxA0BpJX2K1rhGgKCTLNf7fyslbWoGbr5lbsXivEcHTwKFLklfZtDByF4hR9zLA+/tf0idaF2mv3ZChAAKegls7FZFVTQOUntGuH5t9RQ3DBpqxVa+KndqzOj6Rhi3xpRu/zZVU9Hh595WY6SMQGr+HqWg81hadBDqWoeo6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com; spf=pass smtp.mailfrom=chenxiaosong.com; dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b=bUEzLCeY; arc=none smtp.client-ip=91.218.175.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b="bUEzLCeY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jeSj2deFRKgsRDPJJJ4y2YKe6wuxSS/dZR8no12kX1Y=;
 c=simple/simple; d=chenxiaosong.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790823095; v=1; x=1791427895;
 b=bUEzLCeY1eAnb6EDWpyj8otGLUaapztXn/Czy8SJcnV0jpFKpLf8vb2Ksraa4OBvXWXh7YP2
 eamqqe95f8SHt+/ZzkxAUhvU37JlGyIhhnXhdpb2ouwqXbkClJJEET1n++3YRGX5cj/bhUE1DVv
 tSy8pV0WjGNxtZ7OEH9DqUtj7hvyrNcqeeZqTpjqIEHUOc6yeG9i5mj5DeS28QWA0TF+iRApXiS
 sy/gH21hUBPAq1FTAIYq94EQOTruq0WGKUMaXPKfFDtbLCqgnzV36bEud61WHhgDvKdSj6Rdi/6
 ol/vEbUUXuShJlI47A2HjLusca6rPPWTSmO3lFqn0xIRA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae8e3eae607186db;
	Thu, 01 Oct 2026 02:51:25 +0000
X-Mizu-Trace-ID: ae8e3eae607186db
X-Migadu-Flow: FLOW_OUT
Message-ID: <1b73e6c1-5e35-4e03-8310-892efdfd77e5@chenxiaosong.com>
Date: Thu, 1 Oct 2026 10:51:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ksmbd: use clear_and_wake_up_bit() in
 wake_up_oplock_break()
To: Daijiamu <3058704216@qq.com>, linkinjeon@kernel.org,
 sergey.senozhatsky@gmail.com, tom@talpey.com
Cc: linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_238A42C6350C25F55AFAA340BCE35A0D3B08@qq.com>
Content-Language: en-US
From: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
In-Reply-To: <tencent_238A42C6350C25F55AFAA340BCE35A0D3B08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

We can remove wake_up_oplock_break() now as well, call 
clear_and_wake_up_bit() directly.

On 10/1/26 02:37, Daijiamu wrote:
>   static void wake_up_oplock_break(struct oplock_info *opinfo)
>   {
> -	clear_bit_unlock(0, &opinfo->pending_break);
> -	/* memory barrier is needed for wake_up_bit() */
> -	smp_mb__after_atomic();
> -	wake_up_bit(&opinfo->pending_break, 0);
> +	clear_and_wake_up_bit(0, &opinfo->pending_break);
>   }

-- 
ChenXiaoSong <chenxiaosong@chenxiaosong.com>
Chinese Homepage: https://chenxiaosong.com
English Homepage: https://chenxiaosong.com/en

