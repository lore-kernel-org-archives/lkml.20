Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664FF45D91C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541906; cv=none; b=GgiHoeczNnm1eh2Qx0HhBMAiDfSFwAW3FEhZ0xTU5tQvCzoRj8PkC4moPHJnqutwje/wC7jZyGO7MeioyNgp6P48xLv8BdYgaFCjedpDEtp0k1WcTuwcYlnJPVjnDJHbi6Kumq+qxs/DaSQ+r866WQIwsED64Hw8BiYBz0V425E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541906; c=relaxed/simple;
	bh=fCn6GGG09orHL9tSGfJaYcZKEKdOcNu7j1Fq1v7EutU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdehSmzQ2OiqrUG6rD+k9MoKI3wiQ08+RV3U8kQjKoVoPiNKO7+7dE/WN35XtvxyWhssIxenr9xFsBTB+sgFeuHjwy2rOs5fz/YWW5YaK25yiH6nfa+UncTyPvXAWgJcOpNOilBnlkCcjFpkH+RrB4qow0/NIaz1XyUPcDO1UMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga+2rltW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga+2rltW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so2572254a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791541905; x=1792146705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXpd0O7nNhh5SkXMzzZNxeerXfjgoe/yo+e/IHXCxgo=;
        b=ga+2rltW9EyIFIc4TL548Yb69dbstYOoInpjfJqZQ/4sZJEvHNyBa4ppe4W+VQphVv
         300SHrhzJ6+2hVmS2JqA5dOK9Wu8NQuBWI30tU//Nd1xdCAlldrS+FAw+fTQOECZl6VF
         IhfdOOH1QjS3xzSmKc7A0C0Q1uw7gTZB5aWvoHx6VBBfBLwYwXPU/dG0FT0S+OthR2QV
         QC752+J8s6If1FSLJyR+eJILaX/DkpP88/FRnJ+/rveto8KVeBdHUAz5gTj0RieEYpe7
         v0yCUiiMuIXCgwISP7bfOok1dUbs6rv594b+Fx2O6W0InAP5IQDwzu7blW4xhkjPQMVS
         hlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541905; x=1792146705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXpd0O7nNhh5SkXMzzZNxeerXfjgoe/yo+e/IHXCxgo=;
        b=DBVGkoculaqd1+mp4wJrUWPuwm3cI9R16b8NjTUnhs7Gjv1xgBb+RiWNIj6a/sk04S
         5ItsQXhSPVi7DuV1GfoCL2QNj4Hs/I+yVqgLNO173VrW+RyxqWGtqmhMROS+t9eSWRB1
         v6wEOF/iv/e6hv58M4/MkejKm8yBGHUsTIq4/QJ9CHvToW6kCDugyGKKsjZnEd6J0OXi
         SqOxzO4Kg6O2zT99nWuQeg3fn9kWhquRXytPDC+mfC766M2bXV3ijeLOo82zc4vn4Ey/
         dlZtFVQyIPWCjf5QmuACIAP6vitF80cofFlpalcNS1mhw0kIS6nnjg2XBsRFUQr8rAMd
         MjZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjJEgyMQAboFQeLikPVy0sCHaswSI2zWGVafTXPXt7/tn3o3IjWpt+6yut+KBFiCuAjAuE1F4nzN/hPew=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJwsyD6pOgqZBIbn65ZRmwHEtMP+10YSuHwNol2xoi9Lc1WkAD
	nTDIu+/b8FZwCMvoBCl2EJSJDVsqBa5cJMooIISZhvUGIKFWgyngmJdP
X-Gm-Gg: AYBFou3w7f7SF5dycrqxAEvCRFpUn+6QplFKeyX7WbWIIp4Gi7PgyA/+PIkLGISDMgV
	cD2/pfaM5/F8lEMmBRt3TOn+WWlYLRfJLvEJ/MWHKfvE/txygeIlAjjgz8Hbn6G9lnOEbZM8y68
	GUA5LSVEm3tZyQNFIhJo8TrCEu4eQ+r720ln2m9dVP3Z37IMn+gY5D4QEcvoltQWE/QeKmNCezm
	74nZ8SXKYE7wDAFR0qWBt53N7GQTBzl+3C+QyXDvscbNbOf/oTuoe2OdQNu+UrZ+9ARuWYRNPd6
	8xzcUD9NfKENBbpADIGybGE5O/jf2JxzdT8i/8U6fZnkPcmivQpS2bjZVwfHytfqk1Dn3xkFEgt
	otUegxro+9r6YIhCM7d1hLYdbG2QPJs0RJFWgYL+Uk9lWLeW/dhIxkvSGa2MD964SNpmh6W9vP2
	MrJ68Yc8dxNLya+1Hi2lzAdMgmTstsdI7JuEe+vy2zfoBlCK0CTkL+1UfO0uUpQtNe0L29IrwVP
	jPcYwtpgcU3m85SdsVJzQJP5mabRde9LBj8+WCUay7WJiRwJ0ObAw==
X-Received: by 2002:a17:90b:2886:b0:3ab:22fe:b142 with SMTP id 98e67ed59e1d1-3ab3a47f4f4mr1354600a91.1.1791541904771;
        Fri, 09 Oct 2026 03:31:44 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37163e21sm3372026a91.14.2026.10.09.03.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:31:44 -0700 (PDT)
Message-ID: <70d8df5e-5bb6-4cc8-ab8d-8ae36bbbcd30@gmail.com>
Date: Fri, 9 Oct 2026 19:31:40 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/ja_JP: translate submitting-patches.rst (review
 and report tags)
To: Akiyoshi Kurita <weibu@redadmin.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007004715.107860-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261007004715.107860-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Wed,  7 Oct 2026 09:47:15 +0900, Akiyoshi Kurita wrote:
> Translate the section describing Reported-by, Tested-by, Reviewed-by,
> Suggested-by, and Fixes tags into Japanese.
> 
> This includes the Reviewer's Statement and the guidance on adding or
> removing review and testing tags in subsequent patch versions.
> 
> Keep the Reviewer's Statement in English and add a Japanese tentative
> translation in a formal style.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v3:
> 
>  - Use the current Reviewer's Statement structure from the English
>    documentation.
>  - Make the Japanese tentative translation a literal block.
>  - Remove reST markup from the Japanese literal block.
>  - Translate "statement of oversight" as "監督声明".

Looks good to me!

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thanks.

> 
>  .../ja_JP/process/submitting-patches.rst      | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 

[...]
