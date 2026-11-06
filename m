Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793930166;
	b=B6YAx1TOqbXeEEpFLxXvTW1Z6wSbvnNSKw555+cOK584ZIu4nn3VhWH8GnM0JcPVfC/F
	 O2EyL1A5x72gPrCMhLwGX1YbUr/fj+/29hLGsA8QF7s/n+Tsm88H/JWm3vTbgLU0IvODB
	 38FTRQvWWQE92ypZqoZnCRurK/Qz5zg/8g1KeCS+LCANZrvdOP9ay7KYJioiNlddsdNox
	 mLkPnTzUZGbQFegPiEbL7N2rmFVJ4Y3uaQIqFGtbe3wUe+oEig0q2VsZFc82+CUHcvPBx
	 ZFNKlBnx/JvBzFcWZyozqCr97B+YPcYaa8L57Ns/inhwtcrdEQQG7i2KV37+DBQI5yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2IwaaquVGNd7gM6MhL4GlZ3FLZbafuQnYr1jszjtRIw=;
	b=TpU8JsGVk8UmYRRqYeTZUOR+R6HQrL+iK8jJPJLFlpnUUyq+nDAPBCGGuQ8vWqcBcnSr
	 0rqU/ePzsFC3tXh/fZQ9TZbdKOnfN3Op/uSizMqF1DyQjFG5uel7/czr4xMCCR8+jNHQI
	 5xYZqZlfKWg+9JAH1LtsuWXz0nhM6jtlOKyL8trBjFib+0xB7yeP4d1X1vuUXEHcEcljT
	 hywF2KHPXJgGLsybgilxZmP/KUeKI75GxrUtJWwDK4lrWpWqnzaEa88uLW/EQmMy8dX74
	 HsvWF5uoaAt7hExdQRgV+5g43C6z96VS8aTKsKDcyOPiQZ/+bu0xyxbUMnenSZ82Q2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Anu424r9;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Anu424r9
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so143942a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793930166; x=1794534966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IwaaquVGNd7gM6MhL4GlZ3FLZbafuQnYr1jszjtRIw=;
        b=Anu424r9svMljH5y5MvSy8eIfkZeKXitPff2rHMsTxbWq3XimrnwcSHNVn3hZYKA+w
         K1KiBRnmP1gHlbb9wbVYp5J62APYCXS6ff+e4TV55obmi94N5b7RWLP6VKnAZ2/AzuEq
         f4L2kaTPRKyzhG1KEEXinFTDVO2baVhaeGTo79MskLcoq7sY9X7WoOpVQ1jhrB3yxOiy
         9bMKjR5JEUP6O5GilVu/zraExlK6sqGe/WBHvzbDO5xy43w9sWnrQW39FRaPXDrkxKwM
         WzjsFMSSdfNYYRg22lNoznAm3l2KxKHaiCSCeGERyicnX9g5i7+5avNj2wRhwJx1fVdp
         c8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930166; x=1794534966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IwaaquVGNd7gM6MhL4GlZ3FLZbafuQnYr1jszjtRIw=;
        b=RcSXzTeKcVGButAmKdP5xgpKW1mq1ovY7h8MBzqSu4+aItAchxJsj4i2TEjww9m2u4
         DpDVFMpc/yBz1icw7QTAbKui3EGzDt0T8N90YHdIKQ/mBXdC5xQMCARXi5HtQI6JeUpC
         gwfUj90NHNBUOJ+vjwsw/LffIgGfsnOcAaj9hhm8lYo8QeOTA3z47JeFRIe6UYqBmCci
         8IAk0XSa7ucd/Kfmqk+YK4Ing2s+MbN7IXFp1tDB5DtoIt2fn9B4Js3knBi5Jf4PBI8T
         J3ZRGJm3vqdUU2eWkP2g2tcGbELuN4Cp/EtC/bZeGKDYfVE7RtRaZIhgYi/h/6GDTLMq
         SNVw==
X-Forwarded-Encrypted: i=1; AL+hErEgl1JlexbInIHwhiRrzGviK0u6yffzCCG1CbG3sv4XB8jTYcFEWVbSJY5APq2vxPD3KdK6NWQ24yaYSrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gh5qDjOboXpMFzM6L48K0FKHxP/LtPcZLjL67nnxvC0QmDpSP
	ONoObK6hL7R+mym0gx0nIRYpO4/Q8a8UKc6zazOQF1VDznJed/K+jHqI
X-Gm-Gg: AYBFou2+yD+zcNJlqLuqEe2DfWWV1JSc7tNt47YCzGCth+hAysBjg4wVnRzOL7PprkS
	8Mhbj9OGsmDICN1Wp+p328XpLlUKZ8QEQRQ4fNNs3EOPdqFhtgQr/cOgLSgmTHwKR6ro5F9wqBP
	HrfuA+DDlV7odcQ5U7tZT+RHZ2vfdu06nC27key9pOtnZmcvWaI7J4r2E4pO9bMkcJAo9gEBrY1
	2AfRL8dulyELzBBfAJCKKcDOcWhs0M3EhKu86+qBodOtOG/oDQNHqSCE+0RvAteR8SVK4GhAnyN
	dmyqWGdgUaWqvXCBQKK76JcsfoioJtFSdtBkQRjA52xMbZYgQJjDCXA9FvF2X8dgmey05X3cnoh
	FcbagdIN4RWVyvfuhE4f5tQAfViHEiqIaQH65WkxTGYapmouSEMpCKhlZQJweuaI1vLdskXYT38
	HtRDkPa7M7tVbj/+zdOs5LPNiQD5RwWedyBFlDJeZMbhCDQPqRwPUQApCON38Oq1mJr+snPgjyd
	VfV0qAf005msTIFB2aKeQZjR3VvX52l2bafNTSKolu/zK/1cV+SdSwgOrDUoPX3MfBBi5PvAQ3N
	QeuHK5VW22knZaxC6A==
X-Received: by 2002:a17:90b:2c86:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b0db70871dmr983678a91.62.1793930165680;
        Thu, 05 Nov 2026 17:56:05 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32678ecsm6138265a91.9.2026.11.05.17.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:56:04 -0800 (PST)
Date: Fri, 6 Nov 2026 10:56:02 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ntfs: don't write a compression block after a short
 copy
Message-ID: <au0zsi-oLfcprQxI@hyunchul-PC02>
References: <f385711f8772132f64462e1d6c13efadadc51bc2.1793874221.git.zhanxusheng@xiaomi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f385711f8772132f64462e1d6c13efadadc51bc2.1793874221.git.zhanxusheng@xiaomi.com>

Hi Zhan,

On Thu, Nov 05, 2026 at 09:01:58PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_compress_write() does not read in the folios of a compression
> block that the write covers completely. If the copy from user space
> then comes up short, the rest of those folios still holds whatever
> the memory held before; ntfs_write_cb() compresses that to disk and
> the folios are marked uptodate.
> 
> The copy can come up short after fault_in_iov_iter_readable() has
> succeeded if the source buffer is unmapped in between. On a volume
> with 4K clusters, writing 64K at offset 0 of a compressed file while
> another thread unmaps and remaps the last page of the buffer leaves
> 61440 new bytes followed by 4096 bytes of another process's freed
> memory in the file. The write returns -EFAULT.
> 
> Treat a short copy into a full block like a copy that made no
> progress.
> 
> Fixes: 5b676a77f3e4 ("ntfs: skip reads for full compression unit overwrites")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

This patch looks good to me. But the second patch in this series
appears to be missing.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
> Tested in QEMU on ntfs-next with KASAN, 4K clusters, page cache
> dropped and freed memory filled with 'Z' before each write:
> 
>   before: 16 of 41 writes failed, 3 of them changed the file, each
>           time bytes 61440-65535 read back as 0x5a
>   after:  286 of 731 writes failed, none changed the file
> 
> The same loop on rootfs gives short writes and no corruption. I can
> send the reproducer if it helps.
> 
>  fs/ntfs/compress.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 82c7c7d29073..287bd47282d9 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1567,6 +1567,16 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
>  			}
>  		}
>  
> +		/*
> +		 * The folios of a full compression block are not read in, so
> +		 * after a short copy the rest of the block holds whatever the
> +		 * folios contained.  Don't write that out.
> +		 */
> +		if (full_cb && copied < cb_size) {
> +			iov_iter_revert(from, copied);
> +			copied = 0;
> +		}
> +
>  		if (!copied) {
>  			err = -EFAULT;
>  			goto release_pages;
> 
> base-commit: 564c7753647731d19170914c1c637d3b33d88d3b
> -- 
> 2.43.0
> 

-- 
Thanks,
Hyunchul
