Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E123531F984
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404990; cv=none; b=bi4snlJlAFH2UbgLfiE1akF14Rz1wMclzAa16eZ3aTrolRvHsXUqcmenK4S/gIHiF1riy9TmYraJZtJYQVNv7E142fofdDQKAgeyHIde64M9THtcnQZjRrBReXwrkzP8Xi2D0l722FPt556a8g/Wp5nfLrlzEL6ieDO6rdY21t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404990; c=relaxed/simple;
	bh=tXFiPnQ+N9diyHbtBwSGJbqgrfZShFLSp8E13vrYZgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5YiMGfs17AXiIMuOQYAdo9+zOP2f6vvHwgjZSWibarTNKqGYO8+PkPHD/ZHKFn+GduroDHXvLn5YPJ+WQ+ZVuDpoOg7Y7F6ncooqpl56oHiVnPhY7QdIJdeVx6mO0Y/ZH4avtFHJpZQAerMHYfpYQwpOWvL5QCfArGsJmMDTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0ZVxdq0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0ZVxdq0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2813068a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404988; x=1789009788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tVEuaDvVYMx3YWb3gYXxXJkBsoqezd6deCcOB4T/m8=;
        b=Y0ZVxdq0eWOEQTM8c6C98J7VoKaJ3dmh0FgGGA1QHFrwswmy4/FDgQHBu3mUHg8+kd
         Wx+HPXemAMJ2rbqxwEfWgwJIlFCdeFFJSrZ4I19hPL3lHvGjBgZhNF4yuhZUJOvKsPiM
         MXQixiMwx2JcxNM8yzkjEq+bl673gL5IKdERlEN5wp9IGBuWOktR+cejNEfwkaT2WFb5
         3PKsLjJSP2ki7EH0bfM/RyMyTXMElVRUE4e89VI5sw3ZrMkqNy7OmOB0JJ4/fD+LClVO
         OqOmjcHSF8Fhuo0Fr/R843OlAbRMBFYZ0xLp0bxRA020kVW6nKi0rZN9tNO7jkiuiY2m
         pJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404988; x=1789009788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tVEuaDvVYMx3YWb3gYXxXJkBsoqezd6deCcOB4T/m8=;
        b=KmBQGXWYzB1qGKeIfSmyusOuBlnGhpW2OWiGiwGorLuBaVIHYpCeUZX22v0BzKhx+9
         4m9IAIg3BTOTgvVa6G1xexAS6SRpMefRU5Ng8h8z+g45V9uQz78sCAtQtxL+IDANE2+M
         On0n11q/KxEqQVspSZk9d5gcm0iIdygkKv7VXITHFkosfeZpp0mcnS+HP1zLQuEWEcyj
         SC4sDUNmnv+/fFf525H572BC0SLKc6HRZCcE2iVSHFde/+4ILdu1DVZJlm3vhPnuHgGS
         WZMh4GPtZrp6yF5lQS3Y87bgEokX2rKLV7wXF7HG7pZ/kBJKqnT0MAK60ZS2PEii/hh7
         nurA==
X-Forwarded-Encrypted: i=1; AKwUvByhNYJ/kOcoME+nt9uPeEYFOpHnvMoYbpZA5Bqt+N9TqEG+we7krElArPWM6vAoAmR4fzKhQuvHkPkb39w=@vger.kernel.org
X-Gm-Message-State: AFuF++lkIHWJK8irqGeMuZexhhS3IoWD3NI9a2IX6C2xz2xWEuRGwaCC
	aHH5Z5ke+xfouZrN0tcOh9UvSboIKPnMXcEgelc9kuqfQte94W/58Qmh
X-Gm-Gg: AYBFou0RviUYdJV0Am3rZ8QgNvQoEOUExgu1UqJjcCLyqVzU0OJfyoApiXacYZgFY1J
	6PZms9Ur1492hCl3DxH6PqPr6SzYSv0+ubBlUQduxsm/NJ63dP3SMdIHgGTrL+i0xI/+Q1WdrHv
	dl/ljLsGl4F7ZSlNTqRzidtUaWD1YgwFlQeIAHCtp5dfYAkQIXjW2o0ND8URi+IyFhZ/7+cj/3Y
	t6zPxmRVBWgP89vUfiamIVbviJ8alhV1ehXY/9OsNCgKOafrBdQvz9mWtqoVTJCmeraYqPiUHhG
	qIFRo3P1Exy7+srA3FGt3Bvfhz7Ng7yLBgK+fdvjh8QuEgTQED/F7fciKnZa1Su3Bnk4VgTp5nB
	0ro/pM9upxRGwTqykHJZvJNNfV3JL5NQjX32/1Q+W9vsxbKxIhq6swL34CcthH/UOT7DeiaguF9
	emBPNFZsyJendWvN9g3KX6ekuH7h/qIvMjMzg54rp8DI3dvDIHMYPUtlNBdWw=
X-Received: by 2002:a17:90b:2cc8:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39aedf8b4f9mr15154792a91.2.1788404988029;
        Wed, 02 Sep 2026 20:09:48 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm2266519a91.5.2026.09.02.20.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:09:47 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 12/12] Docs/ABI/damon: recommend subsystem doc instead of admin-guide
Date: Thu,  3 Sep 2026 11:09:34 +0800
Message-ID: <20260903030939.336002-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-13-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:45 -0700 SJ Park <sj@kernel.org> wrote:

> DAMON ABI doc is recommending DAMON admin-guide for people who are
> willing to know further about DAMON.  Nowadays the subsystem doc
> (Documentation/mm/damon) is a more recommended place for even beginners.
> Recommend the subsystem doc over admin-guide.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  Documentation/ABI/testing/sysfs-kernel-mm-damon | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-damon b/Documentation/ABI/testing/sysfs-kernel-mm-damon
> index f8d2601e82904..ad21f58f3c912 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-mm-damon
> +++ b/Documentation/ABI/testing/sysfs-kernel-mm-damon
> @@ -3,7 +3,7 @@ Date:		Mar 2022
>  Contact:	SJ Park <sj@kernel.org>
>  Description:	Interface for Data Access MONitoring (DAMON).  Contains files
>  		for controlling DAMON.  For more details on DAMON itself,
> -		please refer to Documentation/admin-guide/mm/damon/index.rst.
> +		please refer to Documentation/mm/damon/index.rst.
>  
>  What:		/sys/kernel/mm/damon/admin/
>  Date:		Mar 2022
> -- 
> 2.47.3
> 

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

Sent using hkml (https://github.com/sjp38/hackermail)
