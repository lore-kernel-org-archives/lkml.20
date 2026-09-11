Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70689265629
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121320; cv=none; b=Py7Lsr3rsl+rbt0gk+dOIBqPvEXyP/Xy5VKAzFUWQAsO4KLsjVsCqtLkmx71sPslvNNFEITPLkalWjcxkw1brut+oIViapSwE1HeM/KWiluJa3DPjd0M9SxzRVhUjt7NqZp9SLfSRHNl6ktqN/K0ikF0v412GEOCUZ6HqNfm3MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121320; c=relaxed/simple;
	bh=7lapMK+ICofvcNyuBgdGPlAYgWGY5O2Q6OavTKNf+fE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwTw5j6GvO9eRsh51/O2FjtySP65FS1VCQTM38AIIcss6byXp8ZNbTwDOsL03AA1fzRrNmCV0poR4Ttvv3ChIlUfyt2UQUNmZXMIo5/hsDsNVo7S7QZLL8LJ41Kxum9rfI8rHVzmEIGjqUfNFGAoPVc7Fv3RSHa8tDw005/fVvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9W1nO0c; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9W1nO0c"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso9666645e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789121318; x=1789726118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lapMK+ICofvcNyuBgdGPlAYgWGY5O2Q6OavTKNf+fE=;
        b=R9W1nO0cv6pINtjvrxaI7+UeTvJpZEbo7TYeDjfc70N3sV3nEb6lGmDEFV0kvZVl5J
         0Tp/831Bbe/McRZckIZsfD1bc1DhARbcUEInvtdQawag19NcQVyZb1wTjaSX4foimRNR
         MXMKWE1tJHq/49mbND1p0QshgHeVFGxv2ZAyQ05T7WqDqxCbvrQqhXC8fHaRIXF0/Qym
         yrIIXNSyvU+VjceFanK6IrC16cRRKgaVoRdnAeCCj4nuxWvBOWl07DJ/9PIDS8Mh4VzE
         6hODI4RdfdEBgdoWmX8s5FXISMnWkGESvkq0YBvjCExP/grL7JtWVRCY6aHGME3JEPDE
         IJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121318; x=1789726118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lapMK+ICofvcNyuBgdGPlAYgWGY5O2Q6OavTKNf+fE=;
        b=EnHfp8D7F4xFbksR0+iNrKrXMW8/3axv0z6q+4AOEBv3bgTAvag/yqU7DhocVai+th
         raj5K12ehg/nhFfyeCJKCvsM6QZ4fwfFYswT+J74jeicFRgE42gpDYklR34xnYEIA+dC
         z9/l+XEdVXF3OxndZ3Fa6HTG5oYMqIz0eRJcCjEvWtUBrvtNqYTD+bjk98j4FCFiys10
         yPnzbd4Q3hjz1q3yzRTLGc8aC4FMrWGC2OdcDxl6yDvOGnHnRCzAgVhyOboUw1YeoNTS
         fIcAnK4DpgGOv/zeasaegTzLDbsCUrqimZqjq2alfpx/aEA76+QpLX3uGJ+puZRyus1k
         zN5g==
X-Forwarded-Encrypted: i=1; AKwUvBw/m6iEJKWcmaB0c+PJfkWQ9WiLKfZj7w1wP1K1ystoqc/+/kZ8GG0iKPfCr1Ehas6SakkDpghEmZs7tpg=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Qa3tyTFlnxYQCt/GnJJVUBhkeU2e1DlqyIDEON6r7lbRUwQD
	E0D81d7VhOoCowuLxBmP3v3mzMZoRbgbIa88hPFbcznNPGpgTKRZp/53
X-Gm-Gg: AYBFou2o3IpnvvQh3H/i7M4iHJ6KkFI+zq4Uw2mAtNFRtwRt+om41GtAjfjSWfBGvi9
	NGKHZooUgfrOBPexKfCg1G6Yuvx1W9sTG11LrkzGgNp6Y2j0fhFbEA2fnNz2ekjwxSZl1vc8kGt
	EaK316J2RMOjttTQl89EB0e0gbHMRH7Bh1gmupWGVhx+Y8uYn1GUqgdSQBzWfcQkLG24ZDfoGFK
	txQDzW/bEHPO9LlwcKKZ/1qCrXHoqH/CHaiUGB7C696X4DknamlCG3aEFfZ08y7UGnyK3Rq7Pzo
	+Owa6wXyti7aSNapywDNsRTDY+L6wiyo5jPjqi8FK0ejOUszYqKbC6Ko4Q/muhGvZeXgUlZXcCI
	wNohH9jI/7TI8mja4nKTGtcq5I8y2bSl0g1jDsQp4LOH6txEvmqf8elo5uzUN9R1X2MArK8Pug8
	4Aci/4QwZXHw7YLNqOlJCRKBKtQKZAVfiReNKtgvoa3BFNySEik0pZPYH1wDjPHw1pJyOBFkfEh
	iyq+A1jsTaoItf9Y8zsT5kX2iMvah7vzLwf
X-Received: by 2002:a05:600c:4fd4:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49e619d1ff0mr34081255e9.28.1789121312936;
        Fri, 11 Sep 2026 03:08:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm4672568f8f.10.2026.09.11.03.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:08:32 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:08:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Waiman Long <longman@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Message-ID: <20260911110831.5e53cb57@pumpkin>
In-Reply-To: <C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
	<20260907182705.54585f73@pumpkin>
	<89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
	<44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
	<dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
	<0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
	<20260910120016.04ba8ae1@pumpkin>
	<C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 11:31:19 +0000
Haakon Bugge <haakon.bugge@oracle.com> wrote:

...
> What concerns me is that I am unable to observe this bug testing
> mutexes or rwlocks.

That might be because there is only one osq_lock so you always get
contention - whereas the other cases have separate locks.
You do still need to hit the same array element for it to matter.

I'm not sure is makes much sense to have a lot of locks/counters.

David
