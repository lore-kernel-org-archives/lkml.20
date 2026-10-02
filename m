Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3DB2110E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956897; cv=none; b=qvOHRFkaTg+Ctxkrz7nU4Qt8InrirykFK7FFG8xFpyI9Iawfm19Tnnp/FbHn/Wc79dwCaaTrgc3LH8NY1gX903nkLbRxXIbSFiyEwxk7x+BrgvD3Mvh1/2kyvnEI2DN+GBd1AJadGdSxiWGyveFzyofaGWxlyd4uiwZBzc5ycws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956897; c=relaxed/simple;
	bh=8SxiTyuxvaWttMtYPpkAqoW7fnH/tr+JVhXF8BjvPu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSPk5vkKQNA0hhipoHap3+GYOhYvtEKfXrSIDlZp6HrF6zo1pAInKEnBBXkjZ2ruYJvjqoDaw/3AMJFDs0AMeHbj4DwPNwNPn4fEWZ/+l5FnVQnC/wG0/WHIeUUus+p42GNv2prsj4usScFq7Azx3hL9cKuBHSPdRvuul71JVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvZ32+9j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvZ32+9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2BB1F000FF;
	Fri,  2 Oct 2026 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790956895;
	bh=3vFWWbdkuzKO84u1HS77x/+zIrXxLyxg38gNf5Y6Mhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NvZ32+9jkLbtdxnvmJ4AFYUJu+jFOA+ZCIPACpe+WiSyY8cO9EIt6jM7NC/8wl0gz
	 Yw9Cvq/FLYfsInZGBVyq4C0Y/lVR1cDQnAGIzhVogx1EFqRaJpazzL0NbGYLs58Tkn
	 D8MO9Qc03yhNxi/l+7xDKXMPQZCHnajAURww22CSHcWRyx37QbP0s7fFPA8TM5QgX4
	 6s2u/CshmpjgGQ5BV7lTDOoUKbqZA2VKbggoK6Ht/NYbQ1/QrPCmFqBqENpZ4y+tlc
	 Wp9blISLSzFCwuhwPXqundEAxUpa8AAcNMwlIEcorqU+y2C2n5CgnOeDSmGo3vgQVl
	 Akb99sZ86Pnnw==
Date: Fri, 2 Oct 2026 18:01:28 +0200
From: Gao Xiang <xiang@kernel.org>
To: Binglei Wang <l3b2w1@gmail.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"Bo Liu (OpenAnolis)" <liubo03@inspur.com>
Subject: Re: [PATCH v2] erofs: fix folio reuse from a different address_space
 in erofs_bread()
Message-ID: <ar_VWGhC1O6-4w0a@XiangdeMacBook-Pro.local>
Mail-Followup-To: Binglei Wang <l3b2w1@gmail.com>, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"Bo Liu (OpenAnolis)" <liubo03@inspur.com>
References: <ar1xOV3x9ZMGx9XY@MacBookPro>
 <20261001060131.51103-1-l3b2w1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001060131.51103-1-l3b2w1@gmail.com>

On Thu, Oct 01, 2026 at 02:01:31PM +0800, Binglei Wang wrote:
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

I applied this patch with the updated subject:

erofs: fix xattrs handling when metadata compression is used

Reviewed-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang
