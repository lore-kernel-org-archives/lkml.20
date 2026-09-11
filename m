Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCE5486409
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162849; cv=none; b=Js9l+4X2cuis6Lmn8VTB1HAvAr0FFu557vPADfxTsh17h9pVR2myAS4X2P+TD+/6G9Fe7Hqq+vLgpJBZUrgr+Fl0N2xn749wp0KotQ99UwFj2GGuDrPviWwfthobebtYWQZcOPoOA9gUgm9EmXI0+KJuNt1n+lwwRY3FZsxoqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162849; c=relaxed/simple;
	bh=ni1yH8hDgYu98Vo71GwCwrOcLuLqmuZR0ZNUMb+H2YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufSnr2JPlT6hCpgkrn4h8v3e8ljD8Cotgst2ZPXiDcFvLGuaC3NI7k+v0+oLZC1p7eJYLLDVRjopzxB2dkcN08iS4JmsBH7Ddmd6t7CtjaOxMBdK0M+aL3dHlUI2cHPg+YNx5ThxTOpVdMmz53toYgXV3pT8A1UivcbV0+kyq9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so181795e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162846; x=1789767646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scQWPxTX6leGCHoMVtk1H+uYIxgRXtieeMFrI4vjiow=;
        b=WWIAxsoW5Sh6QBgsAlqHeBYgFTyE0mk89XPrDhpskAANq0+a+sN42l8Ys+ARQEJFqv
         W84ImWCnLBvYsk7iytWVifVPj6RZ54BspGfJzl50XRfkpHcHV6gCWyRLF9oHhk893ijA
         ivvKRVcoqeaduuQK7UPvhxgpSD9b2gRZuRvMh+pxzJYzgDeRBYrtigVmQRSTm3DIFU1+
         bTlYLe5+KGLGJF7kUug/TxDN5JpKBqTUNQviAwcj3q/xrUQDNmWhcCsrX4aPJhHE0zaj
         rRpHl+gwC/rYgNZN5bYYMkQrO2UAKp5hGYgDegtSpR1D/I6+ykPElMhjMRnh1xG0so8+
         NXFA==
X-Forwarded-Encrypted: i=1; AKwUvBwGfP9DJBJPu18i9AGU5D+oTxgffRWkWznv5MPnsJTNz+vQpKsOQ2CzIx/UVEMcrEE3bSiUfZ+IY6Wx43g=@vger.kernel.org
X-Gm-Message-State: AFuF++m8LTcTbxl+OF2wjF6PJmrGZSB1pCeBswC7FIX0mGr4ZmH95cXx
	lttJ41R2Hp0ctbKf3lbXNGqciI5AU5kO5dGGrWRLzJpYcW6/AowHwqjX
X-Gm-Gg: AYBFou0Pn7L5Zj+hhzHBdUPGEcA8iJ6RowubPpLPWajwlVDFQYGUeX4/9oYcJvM+j9B
	A619u45J8N7A0givQaHJ5TfQY06Z9C09AM2Dllr2HDBWg7Zvzrf4Pbx2DfOsoN9e/GdRScY4Owk
	vLp1YJ+p107KFkQRUEdDedbxtdp7RjeAwa5fJgD+oBnYkpYaXZB9+/iCYcEZGSksa/2DNUbaHLO
	8+H4WctDHHbjPCRJ/2xznHEdSNw4VuTNyBgownxWYS7dgyfAKaDm9RgAE93YupdX2NDe7URKSv7
	KlYhhn1IiHsATuXUbRi3rTxwY70mdkfKkXDoD5JioZwLQrEHYR5bkp0Oj2Uy+4j9APwrbpe/ozD
	Li9CNcVirZhEtmuQVAp5ZA8af7TBboy3nQj3A4yFCiTFJqjtW/CYDIGJT+wT+rkrywKQ+PU6974
	753Usu9HdL/ihp2UQldTKoWpExBfrnJuo59qSQm4YPeXuxk+fCvGdHtKmk3eIJRL+adtLSHF21b
	uHTpyvLfBcoCYdpHiXP1dMuFLyOZpEFcA==
X-Received: by 2002:a05:600c:5394:b0:49c:fa20:cbff with SMTP id 5b1f17b1804b1-49e6cbfeefemr345985e9.22.1789162845841;
        Fri, 11 Sep 2026 14:40:45 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm196305985e9.5.2026.09.11.14.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 14:40:45 -0700 (PDT)
Message-ID: <3a06fc29-4364-4573-b12c-39b42d95a4b3@grimberg.me>
Date: Sat, 12 Sep 2026 00:40:44 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: accept ANA group ID NVMET_MAX_ANAGRPS in configfs
To: Andrew Stellman <astellman@stellman-greene.com>,
 Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260910154849.66095-1-astellman@stellman-greene.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260910154849.66095-1-astellman@stellman-greene.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/09/2026 18:48, Andrew Stellman wrote:
> nvmet_ns_ana_grpid_store() and nvmet_ana_groups_make_group() accept an
> ANA group ID in the closed range 1..NVMET_MAX_ANAGRPS, but then pass it
> through array_index_nospec() with NVMET_MAX_ANAGRPS as the size.  That
> helper treats the size as a half-open bound, so the maximum valid ID,
> 128, is rewritten to 0.
>
> nvmet_ana_group_enabled[] is NVMET_MAX_ANAGRPS + 1 entries wide, so
> index 128 is a valid slot, and the controller advertises ANAGRPMAX =
> NVMET_MAX_ANAGRPS.  NVMe Base Specification 2.4, section 8.1.1
> (Asymmetric Namespace Access Reporting), "ANA Groups", defines a valid
> ANA Group Identifier as "a non-zero value that is less than or equal to
> ANAGRPMAX".
>
> Two visible effects.  Writing 128 to a namespace's ana_grpid succeeds
> but the namespace lands in the reserved group 0, which Identify
> Namespace then reports.  Creating and removing ports/N/ana_groups/128
> increments slot 0 on create but decrements slot 128 on release, leaving
> nvmet_ana_group_enabled[128] at 0xffffffff, so every subsequent ANA log
> page reports a group 128 with no namespaces in the Inaccessible state.
>
> Use NVMET_MAX_ANAGRPS + 1 as the array_index_nospec() bound at both
> sites, matching the array's actual size.  A namespace assigned to group
> 128 now follows the same path as any other group: its ANA state is
> Inaccessible until ports/N/ana_groups/128 is created and configured,
> where before it sat in group 0 with an uninitialized state and I/O was
> allowed.
>
> Tested on 7.3.0-rc1-qpb-cc-base+ (unpatched) and 7.3.0-rc1-qpb-cc-anagrpid+
> (patched) in an arm64 QEMU guest with nvmet over NVMe/TCP to
> 127.0.0.1.  Before: ana_grpid written as 128 reads back 0, and the ANA
> log after mkdir+rmdir of ana_groups/128 lists group 128 with nnsids 0,
> state inaccessible.  After: ana_grpid reads back 128 and the ANA log
> lists only group 1.
>
> The issue was found by Claude Opus 5 running Quality Playbook, an
> LLM-driven code review tool:
> https://github.com/andrewstellman/quality-playbook
>
> Fixes: 20dc66f2d76b ("nvme: prevent potential spectre v1 gadget")
> Assisted-by: Claude:claude-opus-5 [Quality Playbook]
> Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
> ---
>   drivers/nvme/target/configfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
> index 413ee2d16d29..0d4c69c4697a 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -698,7 +698,7 @@ static ssize_t nvmet_ns_ana_grpid_store(struct config_item *item,
>   
>   	down_write(&nvmet_ana_sem);
>   	oldgrpid = ns->anagrpid;
> -	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS);
> +	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS + 1);

There is a condition above:

>   	nvmet_ana_group_enabled[newgrpid]++;
>   	ns->anagrpid = newgrpid;
>   	nvmet_ana_group_enabled[oldgrpid]--;
> @@ -1976,7 +1976,7 @@ static struct config_group *nvmet_ana_groups_make_group(
>   	grp->grpid = grpid;
>   
>   	down_write(&nvmet_ana_sem);
> -	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS);
> +	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS + 1);
>   	nvmet_ana_group_enabled[grpid]++;
>   	up_write(&nvmet_ana_sem);
>   
>
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c

