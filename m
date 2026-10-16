Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D934F497
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132881; cv=none; b=BYt/Y/OfosmlVRHvB3PEM5JeVC4oJ+Kt3rGxL8ar5uX+hkQfrEu/IjxeUw+qI3XIrVehihTNwwLqxxWjfk0uy74OQSFDGx7Th0zhlvz6nsLkQZu+dx10Q/fzcodJqlZeAS6GK1y5e09gNWV4oA+Ipyo9+l80dFrqNQKioCHYUzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132881; c=relaxed/simple;
	bh=uquwue6XMvrkNm4eLUHCbGQnJxu+hxeG8rmrTD1b26U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWUo6A2JK8D7Aeup+HQOfwJw8Ydl42SlFeGanqOHiKlrb5P5h3mOOBwiqAo4xB9FKjiEJ2clNN/1icCMdQwqOHCoNX0YJvoaFhZhy536NbTOXhjncoaosItmt9skchN4lwguURMAwp0X3WOZTBcsSvDCewODcGaIOFVTmFwl4+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFMFX58Z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFMFX58Z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8897e83332fso457509b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792132879; x=1792737679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDpkaSjwddvZNua2Q0fpfEhsFLxnpvVyXp3SeATwy70=;
        b=QFMFX58ZxDugsZgFf4Z+hlz4D0BmTlqXuU1eWMzvRZhT6fTAIYrcu0E9H8UrxSaLgX
         tnQ3mCbPsvHil8zF0EOAGZRY7D86XV7mheSXjrZj+17YlS2QfWLuuc4sxL/LcUsKM0RZ
         M6lNw8S5IKk3JT9h0I/k5FkKU5rYbb97jjoJpcN6AvVS04LYG1ByTLP6lgjcJTmKUq1U
         JKLfnbCQ9qsrDJ9c+5KQrG5GdO3dl9fKe8tdJb3YWHmMSIq59k1DSV483iRq9po4Vobz
         3g9mwYZIRw+qqjdUECQBqF8S22rzCq6VcPGyToa4BAGF0+dAmKfOjjfeQ4zdTeovtix/
         p8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132879; x=1792737679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDpkaSjwddvZNua2Q0fpfEhsFLxnpvVyXp3SeATwy70=;
        b=O8Pi5GxM8AU43l1yxVWPDGXSeBgQf5k+3qT2jjfkbC0ZU00Y2vcJolLea6OeUfCcEg
         IKNhFFRK1FeuyZTvsabyndJ/sSPxfGL/DbDY6IAaA5QPRmN8RrKaGigVDT68VbWTqDUo
         FJLqIGvMHHB0ofLkc45DtLBMEzcA3UpDLS+Pkuq7G1gmVNNGlu/H4JIZv4sckDjXSVfE
         baPTN4ZrlYsxLw+kUlwHJc9FUwkhAuVW1jlLdO8t/Rda6yGRFiX6/BR8E7ZwkgQmdUx6
         pPG6tzhaJw7aYC8ZhNM8sEmTnFh0NmPYM732uR7x++47BmXCUDR0Snu/zloetwLMrA5o
         FGSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwBT7U7OdtQYFowoMrZW3vbZqACBNTC/qCY7AKUYhHjC9pr+HJmkaZePtwgyY2kKZy/5qBnq4dqcxSxqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6r4iwDHB9AnV8/2iX7rRDk03p6sBg/rtqdcO5rYqm3aNZ9FhS
	16Gm1+9Ohj8hjV041ma6avMCBzbyko12YUKzVV8bErPdijwPLYCL+3J+
X-Gm-Gg: AYBFou0e1owo//K1gVRbVKDoMBRoD1qgENH3tnArZL5797G2AsU9B7FzJLn2iuBIA8g
	gzFvxyGe8j4QkPZ6soS+jXmE+OFZB0W97KjIDSBteiHJ/4ziQ6Z89IWyp8Cznp9qMJE0tk2iTMz
	N8KWt6hGEXIVXK4YpnNyh8L25DT0rkFEZvXqpuVBbDpgKWNA6dNHYcqcvyKv99Mw4MgkrzizaKs
	xMnuM4INbia0LmFM/I67VDJskuEJaxFiPgKz5UQV2sNYnAAEj2kePFSTuoSz3CDmhytpvkj3ieo
	n2SmCkxVVhgGc5Vhc+T8wKUiAMdCEuERmKuLXmlCOn6CMeOysIgH5Pzha9KMrh04Lntqz1MONhk
	O5imNW2E+06vwDP0D1z0h1CPJK4VnFN9lv8iSaudX8288koxCKmtQTcU3KhV2SS23Nl/khWSay1
	AQ5yL/+dT3K1AR0QzG5T/fhN3RBOo9GXoO/J6toJUQWj9HqjpZbTQFRK7Grll0
X-Received: by 2002:a05:6a20:b787:b0:3e1:1b65:fff5 with SMTP id adf61e73a8af0-3e20223fa32mr1757919637.47.1792132879466;
        Thu, 15 Oct 2026 23:41:19 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65ab63cadsm231027a12.4.2026.10.15.23.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:41:18 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:41:14 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v1] ntfs: support persistent noatime attribute
Message-ID: <atHHCvRpa1cP1fRH@hyunchul-PC02>
References: <20261016030957.1053110-1-wangxuewen@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016030957.1053110-1-wangxuewen@kylinos.cn>

On Fri, Oct 16, 2026 at 11:09:57AM +0800, Xuewen Wang wrote:
> NTFS currently rejects FS_NOATIME_FL in its fileattr setter. This prevents
> users from disabling automatic access-time updates on individual files or
> directories with chattr +A.
> 
> Store noatime in bit 3 of the private $LINUXFLAGS EA and restore S_NOATIME
> when loading an inode. Report and accept FS_NOATIME_FL in the fileattr
> callbacks, updating the in-memory flag only after the EA update succeeds.
> The VFS then suppresses automatic atime updates for the inode, while
> chattr -A restores the mount's atime policy.
> 
> Document the new on-disk bit and that newly created children do not inherit
> the attribute.
> 
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
