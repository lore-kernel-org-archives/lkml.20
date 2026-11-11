Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386891;
	b=a87EK4/zvYIka4jzTK6zO/eC8BgJoIzSi+fnHrMGCVT9d26UvFMTXiQYSo5IdhJkfrJ9
	 quwSlSpdld7WCXBa4qgQOottedriI/fpvLymzr7KlVmew9hm/TTJVCN5APTBuLMNBmN+I
	 R9la0PUYJmqe5hOHptR3AMq8WVBo90LVD3pfT2gADNJS7y+zXWKH39yf+wwI9iylLvZCF
	 kjscocUlfi5lAa4UZ/won7I7oeGj2aGsV5fdwOOOxzECEADXYYMUWStK2jprCxNZNj6o4
	 SU9MQnsIIPCkAqQFsenIuEai7Ig5kvqsellNf83GETz1ZAlIl/MNCQxhEicdbr8Mb7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386891;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=u3gjj22FEU/NRDk8rlpoyAVMb8UJArISed9hypSimJQ=;
	b=GekHcc8VD+u52x1VmMJWZzDSvbZmuPovewjEzfkzwk0BRKe82vpGvkJxyNVoKwHVOvGH
	 3x8kXODwmFN376bA8cI//KPZ3+Yz8Ywndy48GsqVD7ISC0WZf/5DueF5YXh2UFSL1oV03
	 rYrdAGL5EJ2XJgviwHYot1Pv1aNm23KVebU12KyR30fh7PnsOKAuuMchzMU3hankcScUI
	 lMxo0TKVrdr9NSSIce0BisVMMVhXQ+/D93P21G8L9NfyQbRWSyvkqzRQ8ChEk8oZHk0oO
	 WWR1vJmJBdqfBzzgLfBm4mkQK7ISIRH6zJMlDyzrAUzWn9+yytuDYTEqJRJ2qeevRYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=Fn8UA6AI;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26068606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26068606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=Fn8UA6AI
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 08BE01D28;
	Wed, 11 Nov 2026 08:48:53 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Fn8UA6AI;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 367162389;
	Wed, 11 Nov 2026 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1794386888;
	bh=u3gjj22FEU/NRDk8rlpoyAVMb8UJArISed9hypSimJQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fn8UA6AI8qsCqYt3O3nFJkGFB4KnINVl/ZKF2fjOLAPlEvrrBvFYeaFt3BDZnqgwA
	 cKWUE/LlEUskUh5kv2qO/llpTr3sZOIXnqbGj7h1EAaoZoFuVjQQN8fY6yCw8Srn5j
	 7nBOFCf3Y2QGROuDOQXASFNmoU9qPfyYzC6Ep2gY=
Received: from [192.168.95.128] (172.30.20.190) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 11 Nov 2026 11:48:05 +0300
Message-ID: <d0647e5c-0b78-4ca3-8ab2-8ff0ab6ab7e7@paragon-software.com>
Date: Wed, 11 Nov 2026 09:48:03 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: check wnd_set_used() in ntfs_look_free_mft()
To: Baolin Liu <liubaolin12138@163.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<liubaolin12138@gmail.com>, Baolin Liu <liubaolin@kylinos.cn>
References: <20260805073615.2044614-1-liubaolin12138@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260805073615.2044614-1-liubaolin12138@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/5/26 09:36, Baolin Liu wrote:

> From: Baolin Liu <liubaolin@kylinos.cn>
>
> wnd_set_used() can fail, but ntfs_look_free_mft() ignored
> the error and could return success after leaving the MFT
> bitmap unmarked.
>
> Check the return value and unwind the new subrecord on failure.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/ntfs3/fsntfs.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index d0434756029b..ab9e03156cce 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -741,10 +741,19 @@ int ntfs_look_free_mft(struct ntfs_sb_info *sbi, CLST *rno, bool mft,
>   	}
>   
>   	/* We have found a record that are not reserved for next MFT. */
> -	if (*rno >= MFT_REC_FREE)
> -		wnd_set_used(wnd, *rno, 1);
> -	else if (*rno >= MFT_REC_RESERVED && sbi->mft.reserved_bitmap_inited)
> +	if (*rno >= MFT_REC_FREE) {
> +		err = wnd_set_used(wnd, *rno, 1);
> +		if (err) {
> +			if (ni) {
> +				ni_remove_mi(ni, *mi);
> +				mi_put(*mi);
> +				*mi = NULL;
> +			}
> +			goto out;
> +		}
> +	} else if (*rno >= MFT_REC_RESERVED && sbi->mft.reserved_bitmap_inited) {
>   		__set_bit(*rno - MFT_REC_RESERVED, &sbi->mft.reserved_bitmap);
> +	}
>   
>   out:
>   	if (!mft)

Hello,

Sorry for the delay.
Your patch is applied, thank you.

Regards,
Konstantin

