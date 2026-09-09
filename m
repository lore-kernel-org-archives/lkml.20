Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E11286417
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914737; cv=none; b=BPkkj+ot9JxY/+BeiJ0R2vjJlLcWhL1JkuOe5rlV/nvQynbOt45+7jPicgOs/IJRsdvP7gvtwUiynWleBGHDcgcctIa1GTQ6fnEppE0IWmRsq0+37hKk+nar47ED/u7rdOGbG95lxbT3NJpxBVhzFZggmxZwnrwUhqsDIVQSTUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914737; c=relaxed/simple;
	bh=+VBg2IN2qSXlarE9uNbpaxLn3/2ArYefp+j2t7jfMxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZgPHElaiRkeMwuxcVzcl88HWUrdny+iWG7SDjeVsJT41N86VbSCsMiHbgFiI7Y+1bWxGEbnzUnIWU46BN8Yf+hzKYO5XsXBJBDlzWQxSRVCJynZt4NPYRic2IK+KgrBW1MlSvTiMvdt2Qndd8TPPHUYRVQ8ZalUw4yZdh3+dMbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ/EKFl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ/EKFl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2660B1F00A3A;
	Wed,  9 Sep 2026 00:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788914735;
	bh=oI9yUTRZpy5Q5+OvZos8ZCyIS7fJ/x1ZjGcs3opQbDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mJ/EKFl5RuO6OP8Tmk56KeDA+Z91o4v5KrM4HsNxMvRftsKt2BnPwNG5b4LAhr2zP
	 nj0/EN3N4DYwNZlgcwsrwNzzsGg2J/7Ef6idz7nONGKxegPCQREbl8N7MEEptB0B8p
	 Ptf3i+4g+i85xX7IYa3Y+PWwJIpA/UUY6Tk73GIcQLBFGvSsa5vCgznum0kOBnkn2W
	 tI31l7xj9CVjuBQ2VpduiRM7LelpeiqGupeWMORun4rlPBn1qFTp1iUTKViL0d1PYv
	 A789LVjBYtA4K4XwmoX06F8bxehEhGOozzrq0BcaveeiWXdGaZu6brpl8zWiCCXR6p
	 W8omxwWHNyHBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] crash_dump: Improve readability of
 config_keys_restore_store
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coiby Xu" <coiby.xu@gmail.com>
Cc: "Dave Young" <ruirui.yang@linux.dev>, "Mike Rapoport" <rppt@kernel.org>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, "Sourabh
 Jain" <sourabhjain@linux.ibm.com>, "Baoquan He" <baoquan.he@linux.dev>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "open
 list" <linux-kernel@vger.kernel.org>, "Will Deacon" <will@kernel.org>
In-Reply-To: <20260909003657.1570544-7-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-7-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 00:45:34 +0000
Message-Id: <20260909004535.2660B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The local variable `r` is returned uninitialized when the user wri=
tes a value evaluating to false.
--

commit 22a99a886bc0e01618cd42c5f2b503de86fa5a10
Author: Coiby Xu <coiby.xu@gmail.com>

crash_dump: Improve readability of config_keys_restore_store

This commit introduces user input validation to config_keys_restore_store
before restoring dm-crypt keys. It ensures the restore function's return
code is verified and improves overall code readability.

> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index 9ad50ac54866a..b8fe630462cfa 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -371,13 +371,25 @@ static ssize_t config_keys_restore_show(struct conf=
ig_item *item, char *page)
>  static ssize_t config_keys_restore_store(struct config_item *item,
>  					  const char *page, size_t count)
>  {
> -	if (!restore)
> -		restore_dm_crypt_keys_to_thread_keyring();
> +	bool val;
> +	int r;
> =20
> -	if (kstrtobool(page, &restore))
> +	if (kstrtobool(page, &val))
>  		return -EINVAL;
> =20
> -	return count;
> +	if (val) {
> +		if (restore) {
> +			pr_warn("dm-crypt keys already restored!\n");
> +			return count;
> +		}
> +		r =3D restore_dm_crypt_keys_to_thread_keyring();
> +		if (!r) {
> +			restore =3D true;
> +			r =3D count;
> +		}
> +	}
> +

[Severity: High]
If a user writes a value evaluating to false (e.g., '0' or 'n') to this
configfs attribute, kstrtobool() will succeed and set val to false.

This causes the if (val) block to be bypassed entirely, resulting in the
uninitialized variable r being returned here. Could this leak uninitialized
kernel stack memory to userspace or cause undefined behavior?

> +	return r;
>  }
> =20
>  CONFIGFS_ATTR(config_keys_, restore);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909003657.1570=
544-1-coiby.xu@gmail.com?part=3D6
