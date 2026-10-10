Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CA342AA9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616742; cv=none; b=PYm0/y6Nofd/CyeBKnxdAVrE8ZP03T/NOzes5Aa4QpByHHfMP/4CKj8iQBvgkxwotgG6QwohPxobTP4FvKAled+Ik2VTeZZmm6UBaAwDhQueCY4Zxjw4X6D6dHpZeSmIVGGLLtXUA69HTPCEkTgcMgM0t3GAMv7gMRp47CXCy7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616742; c=relaxed/simple;
	bh=2BZRkuLwp5P1FyE+6NTLgV3qMLJVb1Zh99/0+TmFsVA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pmaEeZXEvGNIGCyfTfy7fPlMAd0kWox26Tk7P/FfXbkANeALDQSi3+kKiIVLtUF7MERxFz22D//Zzw73Ts/aOruN0KcUVEdh/gOth2fyDNUhqPCENuV8Sib7OQRGpz9fwg6hA03FsDY2domIk/afgnXafddnd4DoDNibpNKBz/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAYDOZsB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAYDOZsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A9C1F000FF;
	Sat, 10 Oct 2026 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791616741;
	bh=7e3wJo05pIykdcj39kHBCTmS82u9k8Ir/4Ic+j2EQXw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=jAYDOZsBqnRBv7vaRoK/JW4BSXAsvIHCsLTWCr23KdNitOB79MZRLva7d2mIawlcQ
	 cMY78frNbxEpLaSZW7p6a6g0pEdPKwFe1IDtG0OyBCaPRlk4Fn/D6xzwxztUuwaavn
	 Jr9ytCa6lO9VzJ4HoJDCqDKjmy+zSeu/YXTUWeQ7e3gNPxJfA+Chgl07VUD5+ltnoK
	 TR07mCLKbVofxhe/AoG51CVcJksJEqgaLeHVAhGvQ6gPW3btH/nZvklvnncfEpMekv
	 HSFsmdnb+RGL2eFO0lC4s76/ze4VxgxIyiY10pIqok3WOuWPpls4i2Ca0p/+YY0E/j
	 oOWkKGCj3dpGw==
Message-ID: <1aaa8a8f-1604-4fb8-8245-609258ac97be@kernel.org>
Date: Sat, 10 Oct 2026 15:18:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Bo Liu (OpenAnolis)" <liubo03@inspur.com>
Subject: Re: [PATCH v2] erofs: fix folio reuse from a different address_space
 in erofs_bread()
To: Binglei Wang <l3b2w1@gmail.com>, xiang@kernel.org
References: <ar1GgGSIZ1h0bBip@MacBookPro>
 <20260930191905.539-1-l3b2w1@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260930191905.539-1-l3b2w1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 03:19, Binglei Wang wrote:
> erofs_bread() reuses a cached folio on page index match without
> checking folio->mapping.
> 
> xattr.c calls erofs_init_metabuf() twice on the same buffer without
> erofs_put_metabuf(); the two in_metabox sources differ, so buf->mapping
> can switch while buf->page still belongs to the old address_space.
> The next erofs_bread() then reads the wrong mapping, dropping shared
> xattrs with METABOX.
> 
> We require folio->mapping == buf->mapping in the reuse check; otherwise
> drop the cached folio and re-read via the slow path.
> 
> Fixes: 414091322c63 ("erofs: implement metadata compression")
> Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
