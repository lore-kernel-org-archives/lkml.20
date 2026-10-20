Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476451;
	b=qN6BkfkcLxJkjhFYxSwwdJcxGEcYH/6oTDUR4cjvZEbUCInRk0c+DEDBUrDIc9s+pl9k
	 VlmLxY7uWMOYK8iRkPSLV7JcYIUemnv0wFQsqvaTkniXLoYjJoyl5Kt2IbcXcMUQ23D8e
	 a4zdNspkWZL37JBqfjVYbf8ldoq6/8LKbTnfOOqZBi/928gKj1cJltXxDLF4VWVxZygui
	 RpnsUYrCkq2IJBce8yoPrC2+Sp1nmCcaytSChJ2zukekcXrMZjCz4mnxrz57E0vNLjttM
	 J2ZtOfGmnT/j8jH4Gk8JJUZd+awnXrocCBZSGqPepHgA1Z8AKHwEOYB7NrgUKBOAOFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rCbcFIxLvGfqWgZkhTuDnJ8f03/sdMJUAO5PDOg4kQE=;
	b=39UD5F9Knv4cqhCECkLLkBDRW6s8mpGux8iWnaCRokl8nbHOpOR17DAS+vR3/7i/RjX4
	 N6LFOu/fWqeUznf/Wft2L142nu98ez9TBtnMGa/kno70nqF+IJ931la6btO5iiLP0Nzd5
	 0tVcU8vnFLGiwuUXZCc5O2ziha1EmD4heWkjFCXvNYzxzqlFmVgVfHVxcLRw824tLh9ki
	 raGOiYhzqPeksi5lL9FwvonibH5s6be5DNfA7RB3A6MOK+kJyHv/Qj+SywZX/2/wKY+a/
	 Wz1EuMFCTam2nO+eUePh9XE7qZ3PxlEKhwb+iSeSVwpYMl9Zru2ne0Ls40YFOXJ7Weg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mJUtzaa4;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA731606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA731606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mJUtzaa4
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccca948203aso1046485a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792476450; x=1793081250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCbcFIxLvGfqWgZkhTuDnJ8f03/sdMJUAO5PDOg4kQE=;
        b=mJUtzaa4w+PsaSbNaM1SzB6s19lqWDHSzDM94DcxWV2NP3SF7SAG/2PA5m9UXjcV+w
         9Tre6vsCrWawEnCFZRMGfZ1xsspnDsHdAMdTLMVhO80+zl4W9R6VUkcu5kT0KEGN5kHm
         0P4Xy12ANRHJkMj9BeoZQXikSlH3qUdS6EsWatqYjbGqzdKfuqJLtcScdeYgpHaixD0m
         xRuG5i0jafJbWDU8xTnx1nZ5WrPrM3763LS8u0UDbUVlv0cpiJPFMA+ohl9P2MR/sTnq
         BG6YMTJqOpA9eAE67zD9to5GLyXzdejWm8hh7KixVWbB967dZYT//PEaByxL7iwnu+fI
         4uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476450; x=1793081250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCbcFIxLvGfqWgZkhTuDnJ8f03/sdMJUAO5PDOg4kQE=;
        b=kk9zLhgrpKGK8iysbhp/v0CfnYD48wX1w1+5aCaDijAE7rFLiW4ezebhjHjGqztOy3
         Lt6wA5ZEDrXIfQK6J+0qpQ2Iwd5n4Mb3fmQrRSQL4bRMlwSyqd7329RCXdIB9M4uxo9M
         7ge/HhDsc2rh4EXZluL/dlL5BrUmDOuP0XosA0WaKcaOrJHaL7ZWH9udy41uu1QPLljs
         YqCaZSVvyuy5E3WaXn4gCM5cOmEgPqQH2Us79ftGoXfqm4Q+x159Rxr6d0ycpnnZo4Ar
         /dxyh5bp7aDEzBzTRrhN5w8YzqKIATUN5ySm05oImyHM2pMeSJzhNDjDhFDumd+rgwG4
         kXug==
X-Forwarded-Encrypted: i=1; AKwUvBzopCJelxDmsm85ypk4/sOHIeXqGVdNpa0BHQLf/vEQpFvglU4KSgTQS8miJT/GZTK6Dki/sLtPRsKBlLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3dA8+3ewTiheNXVM5+/IC1pHN/sJqUAG1SLSUijvXzEualtuO
	N8PRtKaP1jp0N9zRq7N7qugfvzZJdkaeOFCaPKdogRQwtrIPG8aJ4L5m
X-Gm-Gg: AYBFou1jQ6psdL6A/Wz5Nr7itcTe5STvd88YyslY227DWabT7D1hm4o+T2VUq6Nfvem
	uU617lMA9r8U4Ut65bjX/Tsta4/0W0rVzsDVeAmtAIrQkxIFQ/HnCsKxeLpI1Dwm8XOxqv9oFAn
	vplfzkscEQhAlQkzMzE4WiHLzk0TbBc0EKQ0NUgvxSq1Dv8NBUv+A/ZB9ACVT8cjCbj3eIPVtG9
	V8W+YCXaltpS1hlgS5yQiGDeRevDnDJLO7Odsv13V3M883ln2/fcJT7I4UvacK0LwPIGMwlUP+7
	9YUibLpDG7rhoVmhmljeF29LiqzOSTfAO+Mp2MHmhni2ahceWMMOTLjvy1dNxl87UDEWSNgtdhp
	Uy2k6OKJ2SqkyuakYcsH8uUrsfxFvVqgxiMraBaKQa4/d5N/IXcnJO12a/RRXqWeKWnJcUhnRbo
	aQsp+KSc6yvRPSoKF1dVZLC+qboGYCXIBCA6L4kczaLIk41iroSTH1CDMoo6gq
X-Received: by 2002:a17:90b:4b0c:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3aceebb67d8mr8705885a91.8.1792476449824;
        Mon, 19 Oct 2026 23:07:29 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d400505sm2501874a91.4.2026.10.19.23.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:07:29 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:07:26 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v3] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atcFHqawwvhBIZzc@hyunchul-PC02>
References: <20261020025308.664764-1-zenghongling@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020025308.664764-1-zenghongling@kylinos.cn>

>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_truncate(ni, old_data_size);
> +			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
> +					old_data_size);

The shrink can clamp `initialized_size` to `old_data_size`, and this can
expose the uninitialized data in the read path.

-- 
Thanks,
Hyunchul
