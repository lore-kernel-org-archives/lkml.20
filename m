Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DF4D9F97
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616166; cv=none; b=NeikHlZwOWHz1pqi3J2hcZgRpNG83ZYT2kSgHUCPlNElbyzP+iPC8Vfjn1r33rmaD1AfYL3hCz1WhIrbNgvKmYN8rBSPQ8JekzEwnjRb59eUXUbYC7jPrMdujg0zRYKTKxSAH/LRh5nxp1Lc6RD+C615mgy/QIVeeXbQ4fm9vDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616166; c=relaxed/simple;
	bh=aFMfaH6d6ztAWlQ8q+PUXMM2O0fyd35CtVolrzNO5xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uaqjf++dvbs5VJFxOhpiKC8wqXpEfVXm2tADxq9YhBEUNkg3h/2UYOdA6uKyzqfzYeBbNy/xtNFuEcCfmCAvRZPMYHDfsZeNXsb/TKNj8UeC45dNHu7+cGM+2TT2Q7We6NCDROkwgFWr7XETmm4LlYYieb+P6VYJmthXNJCRSRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=SKkx534T; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="SKkx534T"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 34B0432C;
	Mon, 28 Sep 2026 17:23:21 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=SKkx534T;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id B35092187;
	Mon, 28 Sep 2026 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1790616145;
	bh=H6cyMGNTJFp3lBHiFqO3xBiinUFY36xNMuVGWAIa8vU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SKkx534TplLnTyulBawIKJ7oc4uiz9Vy/CHUVN6gFu5DIrdLWhFFQamGoKZ4/MIR2
	 2nZrKVHE2ftx/HrmBmtNB+yUngDS1vfP4iBXTSt7wqMO1I1DeO+Esrp3f/EGMwxpVk
	 2TLT1Fc05znAlRhsfNvF5gS4+WjRs4NVYfT6uxYw=
Received: from [192.168.95.128] (172.30.20.196) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 28 Sep 2026 20:22:24 +0300
Message-ID: <1955ce73-6994-4e53-bf3e-020953555de6@paragon-software.com>
Date: Mon, 28 Sep 2026 19:22:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ntfs] fs/ntfs3: fix slab-out-of-bounds write in
 attr_insert_range()
To: "Xiang Mei (Microsoft)" <xmei5@asu.edu>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<AutonomousCodeSecurity@microsoft.com>, <tgopinath@linux.microsoft.com>,
	<kys@microsoft.com>
References: <20260709220501.395659-1-xmei5@asu.edu>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260709220501.395659-1-xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/10/26 00:05, Xiang Mei (Microsoft) wrote:

> When fallocate(FALLOC_FL_INSERT_RANGE) grows a still-resident ntfs3
> attribute, attr_insert_range() shifts the inline data using the insert
> length 'bytes' as both the destination offset and the copy size:
>
>    memmove(data + bytes, data, bytes);
>
> Both are wrong: the shift must start at the insertion point 'vbo' and
> move only the data past it (data_size - vbo). When bytes > data_size the
> memmove runs off the end of the data_size + bytes buffer and overflows
> the adjacent slab object.
>
> Since vbo < data_size is already enforced above, the reworked offsets stay
> within the data_size + bytes buffer and cannot under/overflow.
>
>    BUG: KASAN: slab-out-of-bounds in attr_insert_range (fs/ntfs3/attrib.c:2581)
>    Write of size 512 at addr ffff8880135e8b10 by task exploit/142
>     ...
>     __asan_memmove (mm/kasan/shadow.c:95)
>     attr_insert_range (fs/ntfs3/attrib.c:2581)
>     ntfs_fallocate (fs/ntfs3/file.c:618)
>     vfs_fallocate (fs/open.c:338)
>     __x64_sys_fallocate (fs/open.c:362)
>     ...
>
> Fixes: 9256ec35359f ("fs/ntfs3: Refactoring attr_insert_range to restore after errors")
> Reported-by: AutonomousCodeSecurity@microsoft.com
> Signed-off-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> ---
>   fs/ntfs3/attrib.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index c621a4c582f9..a9a2c2104fd6 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -2578,8 +2578,8 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
>   			char *data = Add2Ptr(attr_b,
>   					     le16_to_cpu(attr_b->res.data_off));
>   
> -			memmove(data + bytes, data, bytes);
> -			memset(data, 0, bytes);
> +			memmove(data + vbo + bytes, data + vbo, data_size - vbo);
> +			memset(data + vbo, 0, bytes);
>   			goto done;
>   		}
>   

Hello,

The patch was applied, thank you.

Regards,
Konstantin

