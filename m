Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479778;
	b=mQwUS0w7nhdjKZbfT4u46/5FDqFrzhFbhQi6fpLMl8t41lfCatGLtYx3g2UgjZeEGZdt
	 fxFw6tWWUVTriqAAy5bHDenSt/Z88E/KZ2jFlPKkejCxloBJxh/Rtvt6ZU/kuc5QWxp7v
	 TP8Zxq+7yoC0hJAKxzzk4yqtPZUbg0QTzPHxOiN/XhpbTeAh3f+dG5ft6i70q34MGG1wF
	 cDtGgKBR2kvQRI+j5J9TbF2/X1Uvnwa8LhIPXAjD0Ob7fwPgFPneIaffz2JYF46VstkXH
	 zc9mBI1Alh3OUIIVUs8AfRJWLQc5CScgPXdPY3C8nleuXBlotiaxr/be2UphtepeypA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=q8Jfz/ddD1SYFlgT+G+O9OvMpjqgt/EDuLVrSss95/g=;
	b=RHM2a2e434S3m0hKi/8k5j7Napbu1974oDgNdpAgkw5XxiZa5dKbPbB63QkNK5cNPYbc
	 48qFmPc4gw8VglhTYHxZlOuVd7MWnyf4TQK+5FBlMdEupsejThpxlvTZWymLzLdiwEd2m
	 r5GJTRPexb8wWWyEeG1wlWVH7d5RRVS6HkkeOMaBxl/Phf3NqN3QDDVOq5vbZXIe2/4mA
	 MzBgjogV/pwhTHhRRP7+cbTgRmZb9m3+WS82h68Zw16JVizMAR07xfXAHY/6VI9oHQTbJ
	 wwNBx6wo05RxL1RHz5JIrjhJXUquwC9HLs+O3YEndbLETuz74uh5Qfz/Md+qRCY+C/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4TbkA1D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8398A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4TbkA1D
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be6030c9fso3648611d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794479777; cv=none;
        d=google.com; s=arc-20260327;
        b=nrKEnhul9vkjbnY3KpQB81grMsLYmYp63aolljyW/07qEAQtgYl2vWRJoTY4r68RCt
         r1YpX6BTkLwh6nhNxSQf++QnCYusO9oY7Fxxx24+JlodXb2189q+n+sVoFgKnjH2NQT0
         fVIvi9fjJ6GVgctJyhiDoH5RUodPOMOm54I/o2U5QLFg7MSEUGuQt8L5+wC28+UW0YKl
         1kjw3Epkd1ZVF6I35NjXXSaJeqzKrRQ4rDDwLbI53DHftVGnsqemGFlEQxEAaor1F4YS
         QWFAjV4XLXZyYsfp7Ud8YN58s11aGjp6n/KzpGUZIbdTtWZU2uo98oWZg2mmoaAb5bFh
         0DwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q8Jfz/ddD1SYFlgT+G+O9OvMpjqgt/EDuLVrSss95/g=;
        fh=V92VJndVgp7bxVPTWmQ3yo7MfEQ+BiBm5n20hzzJ1y8=;
        b=P58pMX2/3YevbQ3fYg7QsxmqzOhwQQ91EG/qcq4SNARk8PgcRPIGvBKEMgZqrhROfO
         cnP1NFnAGycJbCjBHgLq20xhJJsua0UmQURw56PpBfsOlyJ6G49iH9HLbJE6g7YHuigm
         xnMbj7HIM2FX11IBsHx+NTfC/GuFew7EJoiraAq3wDJHYMNqPkXh+719VtuQ/bdvafRK
         GjTrcRNld3bE7n0WC8cg1sfQTnAusmMuAoe3byDo886WKajb+dfURHT5XAPuJFID8QQ7
         acXaIIiUALqHSDVfV9CA2sqGxHlZirtky4Y4c9E/M/cIETD9l58DryITzSHFks2Yd2CM
         zKZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794479777; x=1795084577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8Jfz/ddD1SYFlgT+G+O9OvMpjqgt/EDuLVrSss95/g=;
        b=v4TbkA1DfHEruYCNNgw3VdUCs0e7t5hU87NLFTk7KQauwQ0W1zuNL+5IM5L6gpXaOw
         sktSyKcThh5ZN9fHltq9svn7spmesVtx942t0NfcjG7riRX81dUfDXcm0ZM/AUOMkoad
         62pKDfJ+0KWWNt/JeGmYeU0IcIysfI2j7wobDumN4ANWFzFp+hh1pXK92geZJCIvCmy8
         TufbU5E1TonFQmEr//YvzzCnEUaDuO7RGiLPm8WoVow24uYqjFFnobuiwPdbWdnF5bnN
         k0P0m15xIzFT8FMUzC4EOccalk6r620yblhtha64TNXWf1LbPNY/hEzmTLNihyv7Z3QV
         lCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479777; x=1795084577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8Jfz/ddD1SYFlgT+G+O9OvMpjqgt/EDuLVrSss95/g=;
        b=2T5ePMp8Krh9AVHrscuyuk6uL2NFRfzl3Z9EfixU6QmEzwivFWRF+7SoWEWjB+irr8
         V2/M4ynrC/8nAAgV37EAiylFlqB3TGnnZETh1mSZPhNtXqfdzfwC91gtvl6E6h9M4TbH
         JxwemiR3/htwt/f7St5ceJQ5XL3QaoAQMEn30iBHbHlSqzb6dJNxRb5kjPyd6xQ5OVrH
         r0S4bYJypkXSgtH+7ti4Wv3/WTIsw0L//1RnfS5HAwhJ2/74EA1W4hNfZ3Z5J3hnTxbD
         GiC/7cIfsbJcC/jT3qppLsWKhtl8mmpeTl7J9dqUQqoHyRvI2RR3ubLHT9XqFpaD3Qgz
         vSkQ==
X-Forwarded-Encrypted: i=1; AL+hErH8T8RwucgAVMOZLc5zPPW04m0sgQK36M9jtUBAAcGz752+RilfwstYUQ6UKzrv0Us0CmNhclModO+qn6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kBBJ8X6IEItX9suzVGM65Qt7WTtlvPvvbQFlm6q6GMjvqvcU7
	GVSAVUTF9kKx1QaHUHu1TjB8ukVVYOpSlQgCGmpdwZtVQINPv1py+0KA3oCr+rD5l2tEA3Alrcm
	BrkVVhk7s9JFe1u6GLoP2Xf6KwJOWUCc=
X-Gm-Gg: AYBFou3ZgnKK0GvW0jyhOs7PywX9Ury3RhQeTKaBDLcRiRNZlLlzwKdKFQqweN/4883
	v3iI8wIJz8To6mhEFmSHKYBuAFpc9ckzJVWH8Cytmx6XGo+PIWsFZK9FXsrmNBq8oIwYMdSu+wr
	ffXrXQZwSy4TBmgV+MCXAT6oxlUr3hlfNSbPGc/yERjOGXgYOXv4rchPfR4Fp/lKPQewAhLiwdo
	3F7l6/2OiblIdxICoLhtHQpZwfBJzL1uwYuhv1Q6YF31wbsZxXTuS+xDR5oFmUWahOLZt3mzOEb
	wHUYp1HT2h4/g/HwC48y4RL0jIp7Y0wOfZYdQk3UvzDm+I87FVvw5UUx4f2oL1U45NpQg4kBF4G
	/ZdfP1rv2A+EoPBwC8FhQL0bkGjKT9K4v2KpmVQ==
X-Received: by 2002:a05:690e:16a1:b0:67c:2421:f2b2 with SMTP id
 956f58d0204a3-67c67c92edamr4061527d50.6.1794479777495; Thu, 12 Nov 2026
 02:36:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004061007.7433-1-jsjlee1020@gmail.com> <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
 <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com>
 <102da404-ab62-4ba6-b46a-1846ca64c72b@kernel.org> <CAPHXVry2O-AYxTvGdzu+m6b3Q=ho=xL0kpWWqCn0vjj-gOe0ZQ@mail.gmail.com>
 <0e156b8a-2876-4bbe-b16c-55c70b3201b3@kernel.org>
In-Reply-To: <0e156b8a-2876-4bbe-b16c-55c70b3201b3@kernel.org>
From: Seongjae Jeong <jsjlee1020@gmail.com>
Date: Thu, 12 Nov 2026 19:36:05 +0900
X-Gm-Features: AclHuK_U1Zhy7LuQUoOjDMhB6pf8bp-c3uFcEEp6iWNjkxPJQT3FnxQehFW7JdY
Message-ID: <CAPHXVrxHvXChxiBxCcHWLaFwvatnDVhSu7wdvPWiBDYaUSOQJg@mail.gmail.com>
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated blocks
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, yi.sun@unisoc.com, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I don't see how commit a66cdd985532 ("f2fs: introduce discard_map for f2fs_trim_fs")
> introduce the bug? from the timeline, at that point there is no error handling in
> update_sit_entries() if sit bitmap is inconsistent, right?
>

Hi Chao,

Commit a66cdd985532 added the following two lines:

   if (!f2fs_test_and_clear_bit(offset, se->cur_valid_map))
       f2fs_bug_on(sbi, 1);
+ if (f2fs_test_and_clear_bit(offset, se->discard_map))
+     sbi->discard_blks++;

Even if the cur_valid_map bit was already clear, the added code
could still clear the discard bit and increment discard_blks if the
discard bit was set.

Since my patch skips that update for an already invalidated block,
I thought a66cdd985532 was an appropriate Fixes tag for the discard
bitmap part of the change.

Thanks,
Seongjae
