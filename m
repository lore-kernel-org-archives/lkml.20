Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587687;
	b=WKqv2chxUQRCO5Uc0Y/Fcr0Iuo+JtaIjPnC6z1J49Gehr7PwL6K52XahFCBVJFBsWF8R
	 CKWPkMlDGePYb7p2OO7mJaUI2QyZ61VhKG5hFx3OjBDdRoJpH5Zz971v91AYqXZQZdCzq
	 tTU+MVdHNXhl0T0ohvMAak+IDKWPZ715d3j0GxxrY5TePfhBVwjK5MimVb19FRLxi8YZA
	 V8ppT2+jUvQQWWoAjTteQK821XN2sRyAoatEPvB1ezUZ2/FHUY9SN6UDD3bcIagDrUfTP
	 R7+9z4zgmWhgpQxwnDjc3bX+X5NINK1Gof29A4GnWTV5zDUiyir3IgrrjaD2qB/40ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=w1+5c8C1xq1TCM6+VN7HYSpe5Ow4+lDbWLAwXyYguHc=;
	b=s/QHdEJbIEtdGJQAd9Qv4J7olCbLtwd8gs8saDW681SEGOGyiagDd2ZpeAH2Z4t5OWPt
	 gAfEYLKJQ8vrtTXTuHG7a3713OU8qCafBiZkSPSy8RvXb+e5ow80iQofETjI4yrIaJZNO
	 obVscGyaDHPANA4wI4Rc8Xii5a8HShhKPLultdOcz38rBcB5iBs2MtOCgXow5mKBAyvCA
	 OT2/u5I5vAD6qvsarr26OMppapzgPI1m2dMbhT6DWziGxnbvDRjgeXVMH9FtlRRKcJjJs
	 KvIosybozX4qeShZAhinOEBnMHmV57XrHONREnGaEr0j8LKoqTsae1aFTp3i3OM1zDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0gCaiJFR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87403606A324;
	Mon,  2 Nov 2026 02:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0gCaiJFR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8351F000C1;
	Mon,  2 Nov 2026 02:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793587687;
	bh=w1+5c8C1xq1TCM6+VN7HYSpe5Ow4+lDbWLAwXyYguHc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=0gCaiJFRchag8lncHYQ97CPrMHrNHPTd69ki7sOjMgdapdgwqSChOcfNXPkkt1RbF
	 t1t8eb8vFFUfcQwIzLYR/NAQWMWq8g4VAwy7CciEW6e9ndM1khKXb+H1lj2m580sl6
	 j2jsRi/uopyVZeeryUuYoocjwZCiTRX+c3DwwmR0=
Date: Sun, 1 Nov 2026 18:48:06 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org>
Cc: corbet@lwn.net, danielmaraboo@gmail.com, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Avadhut Naik
 <avanaik92@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove bouncing reviewer for Spanish
 documentation
Message-Id: <20261101184806.11850a34e2dcfae9c3f55af9@linux-foundation.org>
In-Reply-To: <20261102022923.686974-1-carlos.bilbao@kernel.org>
References: <20261102022923.686974-1-carlos.bilbao@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  1 Nov 2026 18:29:22 -0800 "Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org> wrote:

> Remove Avadhut Naik as reviewer for Spanish documentation. Mail to
> avadhut.naik@amd.com bounces with "address not found". Translator credits
> in the .rst files are left intact as historical attribution.
> 

Thanks.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24843,7 +24843,6 @@ F:	drivers/i2c/busses/i2c-k1.c
>  
>  SPANISH DOCUMENTATION
>  M:	Carlos Bilbao <carlos.bilbao@kernel.org>
> -R:	Avadhut Naik <avadhut.naik@amd.com>
>  S:	Maintained
>  F:	Documentation/translations/sp_SP/

https://lore.kernel.org/all/20260316125324.396889-1-yazen.ghannam@amd.com/

suggests a better patch.

Avadhut, a .mailmap patch would be appropriate, if you wish to remain
involved.
