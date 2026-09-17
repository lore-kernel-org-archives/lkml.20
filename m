Received: from mta0.migadu.com (out-90.mta0.migadu.com [91.218.175.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594E3B83FB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632117; cv=none; b=LTVUDWRVvNFYJidx7q1JEE4VFWJXWWqtWcr0QuA/0LPL24SusoETewTTs4A2bYu8cAGA+9lrEaXbCREEpXRYbGK8ccc8R7UEtr5r+4Ud9fT1A7YyGfFJi6u8BbWLSHzhuIve23WDV97pHip/7Hm/MEu/xWLnEtdZLxguTnILUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632117; c=relaxed/simple;
	bh=qg2ugQF6emIDBkiYN6wSYozKB/xd4uS0K25DPIiJOvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoTBBTWT9oWDgAA4aY3dkQqiHkdTk9TK0y3uIMwuolNbgS0MFN7xjVwLa2htNKVg6h+rSKS+DQZHSPpog1ogJuj+XWJNAAjahmHBtmv3XaP5XVfyhuTh7x0WOWV6xmv6ZbTfDEFei0Yk7O+FvM5HsrG+4d1Tk4BFC3MhnEyRs68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VA/5CN33; arc=none smtp.client-ip=91.218.175.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VA/5CN33"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qg2ugQF6emIDBkiYN6wSYozKB/xd4uS0K25DPIiJOvI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789632112; v=1; x=1790236912;
 b=VA/5CN33gLrn2T7iFeask5EIEi0umUdAzm27vnWLuqKnG525NA8Nsy34n9IcLGAYUL+2A+bn
 mior3VKn4hHLA7XYMkq77WikoQi3K8qDRza7o0qrfhgrNc++WEpOs/OjqzGDS3zA3anu59glqIp
 mY+/mVJ1R2sZRqI+mSkryT8s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id bcfab2cc7206916a;
	Thu, 17 Sep 2026 08:01:52 +0000
X-Mizu-Trace-ID: bcfab2cc7206916a
X-Migadu-Flow: FLOW_OUT
Message-ID: <e1ae8618-bfe1-481d-993e-7c7b909899af@linux.dev>
Date: Thu, 17 Sep 2026 09:01:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: work around -Wformat-security warning
To: Arnd Bergmann <arnd@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Maurizio Lombardi <mlombard@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hannes Reinecke <hare@kernel.org>,
 Nilay Shroff <nilay@linux.ibm.com>, John Garry <john.g.garry@oracle.com>,
 "Martin K. Petersen" <mkp@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260916114533.237863-1-arnd@kernel.org>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20260916114533.237863-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 12:44, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> Passing a string variable into dev_set_name() causes a warning
> when building with -Wformat-security enabled:
> 
> drivers/nvme/host/core.c: In function 'nvme_cdev_add':
> drivers/nvme/host/core.c:3911:9: error: format not a string literal and no format arguments [-Werror=format-security]
>   3911 |         ret = dev_set_name(cdev_device, name);
> 
> Remove the temporary strings and let dev_set_name() do the
> same thing internally.
> 

Prior to 26acdaa357cd, we had the caller of nvme_cdev_add() also calling 
dev_set_name(). Maybe it is better to revert to that (but keep the 
functionality to set NVME_NSHEAD_CDEV_LIVE). But then put_device() call 
for errors becomes a bit messy.

...

>   	}
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index 2cff9fcbf740..e0260f4d24fd 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -1013,9 +1013,9 @@ int nvme_get_log(struct nvme_ctrl *ctrl, u32 nsid, u8 log_page, u8 lsp, u8 csi,
>   void nvme_get_ns_head(struct nvme_ns_head *head);
>   bool nvme_tryget_ns_head(struct nvme_ns_head *head);
>   void nvme_put_ns_head(struct nvme_ns_head *head);
> -int nvme_cdev_add(const char *name, struct cdev *cdev,
> -		struct device *cdev_device,
> -		const struct file_operations *fops, struct module *owner);
> +int nvme_cdev_add(struct cdev *cdev, struct device *cdev_device,
> +		const struct file_operations *fops, struct module *owner,
> +		int ctrl, int head);


nit: maybe @head arg would be better called "ns", as it is the "ns" index.

>   void nvme_cdev_del(struct cdev *cdev, struct device *cdev_device);
>   int nvme_ioctl(struct block_device *bdev, blk_mode_t mode,
>   		unsigned int cmd, unsigned long arg);
> -- 2.53.0

Regardless of comments:
Reviewed-by: John Garry <john.garry@linux.dev>
