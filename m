Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819048;
	b=oMwIEOVi5Lfm1tmG6Gdz723xwqtXHhnNGhSkD1jfgNjtabDdysCldMju6ybmayPiED5D
	 bguerUQp0bYxYTBRvAnzRkzBZITY2VJycD1O7nXDpOBur5tlpyrFgoNyWDWKosjmQpplV
	 nseB4xyMWquGBtdlBBRv2iCZnEPYTXmxrhtpAsTzzsGvpyQjAcXBcVmHJtyUEQTFsdKE1
	 Ce3Eh8IHysMAfUhG9imGYMaqqyg/oJ6ITXpsNVKZMOMg3Yy8hRfUpTUSL7dw07bKiQ+4x
	 gsJAjNSw0cmwtO7pSO1EMom1DN3fTubmZ1l6kA3PvKx80lD6AravFdhWHv4n5ofnZTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819048;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ykhww1nthW6bqToDe0TC5bF8+P4T9qm24ET3jJfkL3k=;
	b=J+Ck/TYqA4vwsVbVE2ci6jCe7P05gaRm97f5Mfd45GIkIXavugLRNDmVtuqtZa2Bh4Ta
	 N/3GZ4qvS3oinOuEsmNv5VyjQzF3rkWoCFVpPv4Sga03oDspyT4u8WQZPrSd3B9u4MVsp
	 hkJ6fyJCDIRtUIrpJn7ANdm6E988AGeGFXpv4KmFrCSN//fAetQf4tWcurCrnvQe71vhD
	 i1g0nKQol0QOcmeeAjiusRtZWnIqIGlxh/CYmdpHmK674a8PVRdEukhofwkXpynM0FwHe
	 u/Wk78blUMvOY/AVnLjgiv4VKNm4bgL51JE8VF36g0TuNtFgb9jWMG0WtS0KAx5zlfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lY2PMZul;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C6606A31C;
	Mon, 16 Nov 2026 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lY2PMZul
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DE81F000C4;
	Mon, 16 Nov 2026 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794819048;
	bh=Ykhww1nthW6bqToDe0TC5bF8+P4T9qm24ET3jJfkL3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lY2PMZulIl+be9JXXzRvm0PpoVSaC93EFGrSXbgwHyNUdUszeC7SgtDNKhyDaXDHT
	 mNjdrLNc/Hp00Zva4kuGX5O/teLRU2/lIKx17PdGidPS6g9EiSyFkmIy/Dw5s2qa1N
	 hzLGZSADHPWOO3zvIKVTWa31qZcgiUs4l1SMcWVVYaQg7T9gLqdjyb56PH4yZ7MSQL
	 pApLjBFC83+yhyrAVtxyZAMPhdFLz5RkriALOIPEuIpFFqQC2gi+rrJfQ7aSMyotKd
	 5Q2NiqWN4zWSLOTg5GYrfyBBfBdTW2pCIAnO1p8Dy2idehILizntZDu4ut/wxUFowx
	 KO95kGi6TEXjg==
Message-ID: <3ef6096a-45f8-4c78-8ca1-ac354a1fc131@kernel.org>
Date: Mon, 16 Nov 2026 08:50:44 +0000
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
Subject: Re: [PATCH v3] misc: fastrpc: Fix double free and races in
 fastrpc_req_mmap() error path
To: Yao Yiqi <yaoyiqi3@huawei.com>, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/30/26 8:13 AM, Yao Yiqi wrote:
> fastrpc_req_mmap() links the newly allocated buffer into fl->mmaps before
> copying the response back to userspace. If copy_to_user() fails, the
> err_assign path calls fastrpc_req_munmap_impl() to unmap the buffer from
> the DSP and, on success, to free it.
> 
> Since commit 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior
> to unmap operation"), fastrpc_req_munmap_impl() no longer removes the
> buffer from fl->mmaps, as that is now the responsibility of the caller.
> fastrpc_req_mmap() was not updated accordingly, so the buffer is freed
> while still linked in the list. The fl->mmaps cleanup in
> fastrpc_user_free() then calls list_del() and fastrpc_buf_free() on the
> already freed buffer, resulting in a use-after-free and a double free.
> 
> Publishing the buffer before copy_to_user() returns is also racy:
> another thread of the same process can read the DSP address from the
> partially written user buffer (or via userfaultfd) and issue
> FASTRPC_IOCTL_MUNMAP, which unlinks and frees the buffer while
> fastrpc_req_mmap() is still using it.
> 
> Fix this by adding the buffer to fl->mmaps only after copy_to_user() has
> succeeded, so the buffer is not visible to a concurrent unmap while the
> response is still being copied. If unmapping the buffer fails on the
> error path, fastrpc_buf_free() is not called, so re-add the buffer to
> fl->mmaps to keep it tracked and let fastrpc_user_free() reclaim it on
> release instead of leaking the DMA allocation.
> 
> Fixes: 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior to unmap operation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
> ---

This does not apply!, can you rebase on latest branch and send


--srini

> Changes in v3:
>  - Re-add the buffer to fl->mmaps if unmapping it on the error path
>    fails, since fastrpc_buf_free() is not called in that case and the
>    DMA allocation would otherwise be leaked.
> 
> Changes in v2:
>  - Link the buffer into fl->mmaps only after copy_to_user() succeeds.
>    Besides fixing the double free, this also closes the concurrent
>    FASTRPC_IOCTL_MUNMAP race, where a partially written user buffer let
>    another thread unmap and free the buffer while fastrpc_req_mmap() was
>    still using it.
> 
>  drivers/misc/fastrpc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4fac2caca86..917a5dfe3774 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2153,22 +2153,26 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		}
>  	}
>  
> -	spin_lock(&fl->lock);
> -	list_add_tail(&buf->node, &fl->mmaps);
> -	spin_unlock(&fl->lock);
> -
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
>  		goto err_assign;
>  	}
>  
> +	spin_lock(&fl->lock);
> +	list_add_tail(&buf->node, &fl->mmaps);
> +	spin_unlock(&fl->lock);
> +
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
>  	return 0;
>  
>  err_assign:
> -	fastrpc_req_munmap_impl(fl, buf);
> +	if (fastrpc_req_munmap_impl(fl, buf)) {
> +		spin_lock(&fl->lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(&fl->lock);
> +	}
>  
>  	return err;
>  }

