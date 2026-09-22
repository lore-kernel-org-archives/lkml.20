Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1FE54938C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088248; cv=none; b=KPInfltnqdHmNF+GFdVd6bGyTe8Lx/G3/asVzRFwpzztT6yFHdhDUKNMo9J9HHq96iCHf/wLAS8AzTIdvs4eaPZ6b9jlRz4NPjpdiCwIPEp/deo/4hKxKMsXK2UK/zY3WPV3w5HeWRhgW1QZV854Hhhog8uaouR2/kDe49hx/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088248; c=relaxed/simple;
	bh=SCANmlijJoE4v2B6DWNSsRxY0ITJRVA2y+vlm7to5XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7HswEjfTeD7zx2BiswZhdcjdiD+uoyAZhjqKdyHsGMedwwMkkD87z7L4cz7TAlLCrGAKGym0079I81EzO8vhwuicU5y55Mp1UCYPh8qczNlKTWcVBCEAPmnRYtpwfnfqjZGlzVyqBuHX4CBa9hTeOEinKN8JKxi6ndgl+kYPzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvmnMaA/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvmnMaA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043081F00898
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088247;
	bh=bSZ2l69C13YURC2F+Y4cEwIP1ktKgtxKCfV8IODRQwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UvmnMaA/HU6AyVV3T/pncaqPJOzBfcxleJq7jbV6OZGcWKNuGpOGaBOPRLJwx1YSD
	 01a6ilHpEUGh8XIGkXC7ZtLmIqLmGKUrmwoQAFZfX6p09Gx6ZRWtVlSB7xBeMtQVTF
	 fovsLmp3aE89eUmEA747q3EBD4iR1nIgmo6F5O/48Aqy/xrFMT8jEzWJ7Dvgx0vjss
	 G6/7K66iJsLTSLhMZyM/3nfrsI0wVzWbaqhXlBjz981OKKyOssN3vJEm/1WzHzSlKE
	 wsHuyK8K5SQUgVUOc3IJO/DcoX5KXGixqFyZeD4NW5/ddi7PEt9fpOBVyxSZH9CwW1
	 Ew1yQ+yJj2RXQ==
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8716a5baf64so40179357b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:44:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxATw3qJKzL09WYberXUAnGSXcjEZZ/kVOSmuPwB8qL1KtwBY5XE14qoyJPjiH0Z1iH7T/8uyDR5MJbdcM=@vger.kernel.org
X-Gm-Message-State: AFuF++kAP1w9p4wrND2irs7bvbsRmZaSyZlaHngLc1OPH++EIHMTe3dD
	MGmVavZ7a4kdrYccoy8gJRr1DnbcqR1mLbiSD3CDuKRg5FOzrHjxvzpMfY+WQhTiO+GOnyBUgX0
	K78848JCTzGVR3TUVf/0t+bI4SWMSi4g=
X-Received: by 2002:a05:690c:dc7:b0:858:452a:3a92 with SMTP id
 00721157ae682-897308fdc31mr46827077b3.9.1790088246304; Tue, 22 Sep 2026
 07:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919152240.1507914-1-anmuxixixi@gmail.com> <20260919152240.1507914-3-anmuxixixi@gmail.com>
In-Reply-To: <20260919152240.1507914-3-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 22 Sep 2026 23:43:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
X-Gm-Features: AcwNN1VbLLPsV5lOKFwU7yVmxVYAIzMTj5mEWuJYxp70mFyn5tER_B8dYFqZd1Y
Message-ID: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] exfat: retain the next empty directory entry hint
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -516,6 +571,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
>                                                    dentry, ES_ALL_ENTRIES);
Should we invalidate the name filter when exfat_put_dentry_set() fails ?
        ret = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
        if (ret) {
                int cleanup_ret;

+              exfat_name_filter_free(inode);
                cleanup_ret = exfat_get_dentry_set(&es, sb, &info->dir,
                                                   dentry, ES_ALL_ENTRIES);

>                 if (!cleanup_ret) {
>                         exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
> +                       exfat_invalidate_empty_hint(inode);
>                         cleanup_ret = exfat_put_dentry_set(&es,
>                                                            IS_DIRSYNC(inode));
>                 }
