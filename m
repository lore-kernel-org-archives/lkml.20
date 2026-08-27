Received: from mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8088282F14
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809747; cv=none; b=e3TnYVECVLAKlIWmFRrkLBqFMf5WsA6Rjp6zmeP8IzSPwUJqvhvPN2IdOkWwD8WyL9i5a5rq3n3HO46zVlPGfXBkKtIFBCLRb1+G83d1QrU7C9RNothOUhzXELL6afeSrXIAr3+nV89PzVt6kjwNRUy59jdiqQxLGrLBjhZE2FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809747; c=relaxed/simple;
	bh=+1OhXnMnwwDvgi4ARLOO+9uV9JOBKjpKwK9eU+fiAVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEYz4tCdx9tQkq+cL2nQr8sWkY9cjWydGZL3K9iypKChillnGKwnP2vgjwHdBf+u60QuPdObD/LNsMmQMJalfx0Yuot/Lmrzy0fh+eQC7Ox0By6bqCNHlvRijP0iiCo98WFjWgdRlvTd66geKy3UV3B7ycCXXgtq6j+Rs5iO3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com; spf=pass smtp.mailfrom=chenxiaosong.com; dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b=WfhIt5Pf; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b="WfhIt5Pf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+1OhXnMnwwDvgi4ARLOO+9uV9JOBKjpKwK9eU+fiAVI=;
 c=simple/simple; d=chenxiaosong.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787809740; v=1; x=1788414540;
 b=WfhIt5PfnviNxRiY0LhDWVNsHrU3VhnwArctR8WcdVKaYYMrvhGDJG5588gooojRHR7NzIPu
 2nj2KJvA1ZTRmPO1fac/EtzOoeSil7XMQ8G1U9vKcC5tBeKHa6ptNS0XpcgHWboMYQ1Tt3+NJcb
 rLHvCgGo9cVhuQq0CUcIUbGd1Inoe4JW8uYov9m9btTjyIXyn+YeQGHGwIkPP/rPRI9SzqmeO4p
 iXkuhiG8ayocLdhL0kjoChkH8qi8HfDvzMUF9akhodTmE+w7+0MSbDrvNqxVcMSNb4c9eFobuPn
 250GwVZQPz4CLebuWQMQo6QVlDyYN6yIO32ykV4JzkQcg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from [172.21.20.206] (116.128.244.171)
	by smtp.migadu.com with ESMTPS id 3d5685e8fb282bad;
	Thu, 27 Aug 2026 05:48:50 +0000
X-Mizu-Trace-ID: 3d5685e8fb282bad
X-Migadu-Flow: FLOW_OUT
Message-ID: <36c6751a-a491-4c61-947d-205a70bd39ef@chenxiaosong.com>
Date: Thu, 27 Aug 2026 13:48:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Paulo Alcantara as an SMBDIRECT
 co-maintainer
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: metze@samba.org, tom@talpey.com, Paulo Alcantara <pc@manguebit.org>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826150106.15352-1-linkinjeon@kernel.org>
Content-Language: en-US
From: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
In-Reply-To: <20260826150106.15352-1-linkinjeon@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Should we add a repository URL for SMBDIRECT?

On 8/26/26 23:01, Namjae Jeon wrote:
> Steve French passed away recently. He was a long-time maintainer
> of Linux's SMB support and will be greatly missed.
> 
> Add Paulo Alcantara as a co-maintainer of SMBDIRECT alongside
> Namjae Jeon.
> 
> Acked-by: Paulo Alcantara <pc@manguebit.org>
> Signed-off-by: Paulo Alcantara <pc@manguebit.org>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e05570c393c5..7e1d14406619 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25105,10 +25105,9 @@ F:	Documentation/admin-guide/LSM/Smack.rst
>   F:	security/smack/
>   
>   SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
> -M:	Steve French <smfrench@gmail.com>
> -M:	Steve French <sfrench@samba.org>
>   M:	Namjae Jeon <linkinjeon@kernel.org>
>   M:	Namjae Jeon <linkinjeon@samba.org>
> +M:	Paulo Alcantara <pc@manguebit.org>
>   R:	Stefan Metzmacher <metze@samba.org>
>   R:	Tom Talpey <tom@talpey.com>
>   L:	linux-cifs@vger.kernel.org

-- 
ChenXiaoSong <chenxiaosong@chenxiaosong.com>
Chinese Homepage: https://chenxiaosong.com
English Homepage: https://chenxiaosong.com/en

