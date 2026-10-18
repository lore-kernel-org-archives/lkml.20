Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447AD41836C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792358062; cv=none; b=uZdv4Lcd4CfGISSHqx2/6nICAdBh08Nlc9C83wAMJr8il0ofNphlMvfkpgg20sDjkm9mrkhZHL5Yk7RJlG5rhgeRW2Ac6O46PmaoD7YRiVzZNzG1xQhLtY+XpyhsEzW1z0cBJwg3LyzKUU+Sh4xojOHRuLALotOqgvztAQJ7OPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792358062; c=relaxed/simple;
	bh=ELsTm3j7AhO/Y219Lftj+MonZ2lkR1m0RK4B8AueOsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxv5UoEMffCHCA1wpAHyh7JCw/RRJ19pIxd3bfD0b6t9maVYDeZ3HAuXtgXth2krm6OHYZL/QacrhIBbjnDA/h0DHC2b/aua09gMtYm+yrcsft/zKi7aPwVHPLJmdvURr0wmcYd3XdMfqmeXXgoxnANPfHZFdyhc7OkQtpUVTsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DnvH0YsM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DnvH0YsM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso805881f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792358058; x=1792962858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFmT0VCL/Q/dgan6nnGoPiwft7ERrnmKegD898CfuBQ=;
        b=DnvH0YsMiLc9ovWZPMzdj5+v0lNHZKf6BAfSmSpS5YQK38dsO5n5c5E31d0GGCe1Od
         Gpr5LP8fv5zK/MxH1cuTU/042qOf6pJ6M2LkdGaDDv/wiGe8CvCMgf8lOr4d38jn9n7K
         fSf0ExDk1N5nb4hRx/e/6SxtVl92FufH2Dkwddu93gKAQA67obhZ/C/NeiA0Xq89UwWy
         SOyckmDfLrpxix3cAQGfDjbvRXQjGmG+GPksCc8fVKPtad8zBvi5N3wL5m2j9A0fc3wJ
         OBYVbQHO4NfBxEj1iBSCeax+GFY3xFitoFZaiO42OMKS9v9iLSDhbJ2z7tYmcm6U4vqZ
         Tw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792358058; x=1792962858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFmT0VCL/Q/dgan6nnGoPiwft7ERrnmKegD898CfuBQ=;
        b=stbztN6euVKKFZFP3CuOljgJSzNzDXNA/sUzOKmPD+ZXVYeY8Dw4OIVwwWtTAyK0EB
         0ikqFqjNwOFq4QCWr24Gj/NkFLWvWnG8smuGdnX5xwkbsNAoNs3jG1hN36nf8LNTO/XA
         rF7V/jJWUovpbDVR1smaaJWPtlJv14RMjS4jCm43qx26p/+rx91o31zCJx7noWb2+iQo
         5G0znNElELKsfoOoCYgkNMjdgbO/v8g7mqWyct52yMaJoEWfQZhVm2OPYqG0kc/nMUCj
         JjEQJWy5E+NzEHNe8Qq47Vjvwizcmfj4DhoFd54YTFdCDp7A78jZ3s0TXGQ3pLfo83Pg
         psHg==
X-Forwarded-Encrypted: i=1; AKwUvByxTE48cSEmDvYn5Zx+DLU14NYTQ0HOeQyGGu0iYblbtg6iNgK3VJStVzbDpEIFhJljL581zG/tPEfQs/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfTKqeh9a/UPSffA+y/zqGWV7/9qedIv4Wttc9dvITnO/FTiK0
	XqcSA0UJZ29YwHNzAimCfkfrzONcCRgUttG1guyN3J2BgjeAI80XVRL/MFIJdCPjMk73PBJKtWo
	4y63FteOb2g==
X-Gm-Gg: AYBFou1N44aXn0DIysySjj3FfT53nN8sBEQ+n0usVK2eNUGqEegTk8rv/I97qeS8vzY
	ZhYlMpFtn5VnzhbCAp6WiPZvarbU14LeVL3E3cHUrcftSGoBOsXKwWYzoz1guq8JewxF/tfEmSn
	e1wlMAUX/bDLWSLQ0Shp4Li0qaDqQvcI91BMQLjHjsI1EIGvwiARyLmUYDVLnOcOrNawspmodbl
	oYldrgbFVewtueaRpVgnNHjVTR1IvM8FiA8k1aY9z+zFF3l14soZoVynqZistgF3PPsBaLbRpS8
	cD4m7K1YrllR2E0qh952k+SRv29Qt6f5jOIW1ZltE0OxWvjoDrFmBt4EA2DlYu+iqIM/BwDF8cn
	Wd5vhKr9BtPcZj8nBAvA8jZO4tGv3MH+URRqXV3+EWLg+2oGolM312kMJhNXXVRh/n/CmQoOF8g
	Ocmz7ywoV6Rgp+2qrUe3F7oeZD0imQwh1Gwcnj/47BK+BLyfom/4HO23Hgp40ABqY=
X-Received: by 2002:a05:600c:4503:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1d75acb11mr135826505e9.4.1792358058435;
        Sun, 18 Oct 2026 14:14:18 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8aad3dsm30778145ad.64.2026.10.18.14.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 14:14:16 -0700 (PDT)
Message-ID: <e6e38b8b-130b-40d4-b4aa-30e9bdc79618@suse.com>
Date: Mon, 19 Oct 2026 07:44:10 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] btrfs: prevent deleting the wrong subvolume by ID
To: guolingxing <guolingxing@tju.edu.cn>, David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, Marcos Paulo de Souza
 <mpdesouza@suse.com>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261018073709.1586733-1-guolingxing@tju.edu.cn>
 <20261018153810.2692021-1-guolingxing@tju.edu.cn>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
In-Reply-To: <20261018153810.2692021-1-guolingxing@tju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/19 02:08, guolingxing 写道:
> When deleting a subvolume by ID, btrfs_ioctl_snap_destroy() first
> resolves the requested ID to a name, then looks up that name again
> under the parent directory lock.
> 
> A concurrent rename can change which subvolume is associated with
> the name between these operations. Since the deletion path does not
> verify the ID of the resolved subvolume, it can delete a different
> subvolume while leaving the requested one intact.
> 
> This was reproduced by repeatedly exchanging the names of two
> subvolumes using renameat2(RENAME_EXCHANGE) while deleting one of
> them by ID. The wrong subvolume was deleted in 9 out of 14 independent
> tests.
> 
> Fix this by checking that the resolved subvolume ID matches the
> requested ID while holding the parent directory lock. Return -EAGAIN
> on a mismatch so that userspace can retry the operation instead of
> being told that the requested subvolume does not exist.
> 
> Fixes: 949964c92843 ("btrfs: add new BTRFS_IOC_SNAP_DESTROY_V2 ioctl")
> Cc: stable@vger.kernel.org
> Signed-off-by: guolingxing <guolingxing@tju.edu.cn>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu

> ---
> Changes since v1:
> - Return -EAGAIN instead of -ENOENT on a subvolume ID mismatch,
>    as suggested by Qu Wenruo.
> 
> 
> Testing:
> - Unpatched kernel: 9 wrong deletions in 14 independent runs.
> - v2 patched kernel: 0 wrong deletions in 30 independent runs.
> - EAGAIN was observed in 14 runs; all 30 runs successfully deleted
>    the requested subvolume while preserving the other one.
> 
>   fs/btrfs/ioctl.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index 576cd76ca0bf..d82a7f3f3d14 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -2380,6 +2380,17 @@ static noinline int btrfs_ioctl_snap_destroy(struct file *file,
>   
>   	inode = d_inode(dentry);
>   	dest = BTRFS_I(inode)->root;
> +
> +	/*
> +	 * A concurrent rename may have changed which subvolume the name
> +	 * refers to. Verify that the resolved ID still matches the requested ID.
> +	 */
> +	if (destroy_v2 && (vol_args2->flags & BTRFS_SUBVOL_SPEC_BY_ID) &&
> +	    btrfs_root_id(dest) != vol_args2->subvolid) {
> +		ret = -EAGAIN;
> +		goto out_end_removing;
> +	}
> +
>   	if (!capable(CAP_SYS_ADMIN)) {
>   		/*
>   		 * Regular user.  Only allow this with a special mount

