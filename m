Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854389;
	b=MCMdBN6NrUTC2NigzSfW9FcEEOhv5LVWtL8qjV1mYylc+Q3Za6gFWePtccUrClRSKucT
	 ZPfPTgK4u/WSa78C5c0tEwqI82CfN284u+4FGpj8w8u00kc3GjT/0Iy/NcWJ8F1k3dvvG
	 RNOxlmMkcB8JX2r442i45CbHLCd9EonKeJFoCbLQIr6jgwVk829VQpFom2BVprHMg7b7Z
	 xBb3AHbLNY0vejNzoVim+8iRkO4+4/ND2kEBL9gVyMFo01KAiICcmVK7il8hRDAFKUAdl
	 Y9hos4w6hDo06+/w8e4wNlPgulQ2TJauPRrHDhnVzRUGwl7ZLyfHBGMw9XYsMB8dAKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iEJ8Vsur5VkO8QT2c30olgm3N6esX9fQIbded5RAIic=;
	b=HFDV1gfy4IYVFIK/V2zlMHTEDr632w6n6/68BF7vYP92fyfeITWTyIXG/Wc+wlCJr+in
	 7TOScUAUXJEB02NRctpQphkCJwtPHDiYCL1ur/5mnW5Of1Od0dDNJm+ylSLawg3LymfuX
	 XZ5EK8LlF766WQ30woDkMUxKhjqUy5CFl1F68bCifki1P0klOMNXsVRY8Vehj8wi/UYrj
	 rHYuVv6hffJOu9yWkLY/hCehNv9O2LmoQCEqZipZ2aTBQhxvtUdRFzdRo+vlgN/lFoDGI
	 pCMk03V2iqxnV5QNO/BGRdDt1SUwZ4zZMfcenvYXN74stqvXoniicSHCEEYBKo7+2YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=TH1m0vuJ;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA9606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DA9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=TH1m0vuJ
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-945e6d9ceeaso399716085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794854388; x=1795459188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEJ8Vsur5VkO8QT2c30olgm3N6esX9fQIbded5RAIic=;
        b=TH1m0vuJccTqmdU3PT3n1mdfI7HFuF62hxpy0vA2BsVWNZetFtshwN6jrDZg1Yl6mI
         1rvTUutxNaLtBV44vEH0YXMpZ3xaUmIN2MzVHqlrj7kgA9xnAxiyeQpK2QqYTc2UrmhW
         jpmzbzG8mN6nSfdH9uCRyTWn0/Y7PJLjKjOobvMDHfVN0x7iQKk8OGNp27jekWN6Ve3B
         pE2+DYe8PBGloVou5x0p5rKrpHyLpTuOViqnUFn8gL1vLQdmcmDbJnE54Hh+Zx2CtQlR
         4ux9HA8rvZeZ39MILQcajDRSUjTksAqxEJo1/YYmJ3N2D058dfPeX6n5SHnxUPRjyCnS
         GFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854388; x=1795459188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEJ8Vsur5VkO8QT2c30olgm3N6esX9fQIbded5RAIic=;
        b=HqKM8OgeyXZPM5+ZpcxPfudcl23G3tCubAuakCy9lzuWCdC3g4AYaznpwiGQWV+T7X
         fv8H7dpoJdt9zz6nKGB78nBFBSEQgc8HSuRFDJFhNOUMQFsxeHL4UyzACMBuN/46EIWU
         ic9k3QChF56ldgOEpSZ/YbTTTGni7MFEUE3O47srIHvXi+YhQCpavXlU1sl3J8WLmbz0
         7EXLAAFD4Cdiq+jJtPNcD+z81EQniL/u3uF0Yf9Tnr1kDc8zsUhGt+miR1OHFkVsNIGA
         NFBzNZ36CIywKtKbiRm6oFLVTL/gzQ8VLlV50d5+kecx0yhEc7MKp3AFOJFeR2Xd7s9K
         iXVw==
X-Forwarded-Encrypted: i=1; AL+hErFSaA/JmYjYrNddTIIKmv0RGZ9SExcoETASk+UrvqMbEox/XAT1GicCUHMTW0UEH0duNYXSj9ZZzwIk0nQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yJMyr7h/hTclnIORWyg9FAooBB0pR/ixvL1nHWMen9cf/cJe2
	5AsPGY/aqE9toTS4cfpDMJxqWswxD1dGvOLNO60OqZmo9PpxyTJkCWqOx1BBNTaigw==
X-Gm-Gg: AYBFou2jRuLN3h1pTGwNf8DFV+wOriXynsrIb/lM0fwuzNoGkjChNeHBiOPjBzLei3n
	8Vx+6OyP8Kg1cpQbekM4l0pHuZ1kl0pMA9CgBQcNL8GsvLWJEUohLGMyPDKnIZ3L+NktouqqiCS
	UJywSxayQWIL+DHerVmaKUszKgxlCOzUzferBjKV0knEE7U58VMFAxjVHqd2vfFnlZuVA1HHs1d
	xy8V72s1WG//+VirTr0ZFQwClBhpWhPr/K089q8F1HXTvm1ErsgfVwIZtyV8uI5DUXPMqaGhXuJ
	14m2MSFQRjiBwPR3m3jKO5rQ/I3j4ncMs1BI+G8kDI4NjqBl27qq+nIl6fJ59lsBzCe93ScRkpI
	8hIogEd44Nls88SAbRLgwMoy5Eh3MxAMf5MpWGJNjP7D3J5XHH3HdCn7sCoMdkbQL8baQJ8iq2T
	rF+SSc2I/3ZnztpT3WfJ/0OY7ALmUoh5Mtp7XsAogb5RvbtXVzH16Cch9qgNt6544g96aXouOCw
	INsQ0xjTms4Gmn6/oUdvlItyl1yvT5n/yRcXRlSKdPFxWdXIpC3WFe3skaW8XRzjMT8SbCfKnAR
	euT74kvwgOfeTlga8Dqz881Ix87w5dDb6iIdZksjX2rKz2L4Gu4=
X-Received: by 2002:a05:620a:2b99:b0:93e:e376:9b1d with SMTP id af79cd13be357-9494ba53a16mr1920666185a.9.1794854387842;
        Mon, 16 Nov 2026 10:39:47 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803b15sm906677185a.14.2026.11.16.10.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:39:45 -0800 (PST)
Date: Mon, 16 Nov 2026 13:39:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [usb-storage] [PATCH v2] usb-storage: reject too small values in
 max_sectors_store()
Message-ID: <5a202c7e-f7c2-44cb-8bf4-0673ba7ee9a1@rowland.harvard.edu>
References: <20261116163946.2502-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116163946.2502-1-25031212351@stu.xidian.edu.cn>

On Tue, Nov 17, 2026 at 12:39:46AM +0800, 'YuanZhe Liu' via USB Mass Storage on Linux wrote:
> Writing a value that is smaller than a page worth of sectors, or
> smaller than one logical block, to
> /sys/class/scsi_device/.../device/max_sectors passes an invalid
> max_hw_sectors to queue_limits_commit_update_frozen().  The block layer
> requires max_hw_sectors to cover at least one page and at least one
> logical block, and treats a smaller value as a driver bug:
> 
>  WARNING: block/blk-settings.c:389 at blk_validate_limits+0xeb9/0x14b0
>  Call Trace:
>   queue_limits_commit_update
>   queue_limits_commit_update_frozen
>   max_sectors_store
>   dev_attr_store
>   sysfs_kf_write
> 
> Before commit 70a7949335e5 ("scsi: usb-storage: Switch to using
> ->device_configure") the store called blk_queue_max_hw_sectors(), which
> silently raised values below PAGE_SECTORS to that minimum.  The
> conversion to the queue_limits API lost the clamping, so a single sysfs
> write from user space can now trigger the warning.
> 
> Reject such values with -EINVAL on the limits snapshot returned by
> queue_limits_start_update(), cancelling the update.  This keeps the
> return value for values below a page unchanged, as the block layer
> already returned -EINVAL for them, and also rejects zero, which
> blk_validate_limits() would otherwise replace with BLK_SAFE_MAX_SECTORS
> without the user asking for it.  Checking the logical block size as
> well covers devices that report a block size larger than a page, where
> a value above PAGE_SECTORS can still be smaller than one logical block.
> 
> Fixes: 70a7949335e5 ("scsi: usb-storage: Switch to using ->device_configure")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
> Changes in v2:
>  - Also reject values below one logical block and cancel the limits
>    update; with a device reporting a logical block size larger than a
>    page, such a value reaches the second WARN_ON_ONCE() in
>    blk_validate_limits().
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/scsiglue.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index 97de28e85562..7a55cfc18236 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -593,6 +593,10 @@ static ssize_t max_sectors_store(struct device *dev, struct device_attribute *at
>  		return -EINVAL;
>  
>  	lim = queue_limits_start_update(sdev->request_queue);
> +	if (ms < PAGE_SECTORS || ms < lim.logical_block_size >> SECTOR_SHIFT) {
> +		queue_limits_cancel_update(sdev->request_queue);
> +		return -EINVAL;
> +	}
>  	lim.max_hw_sectors = ms;
>  	ret = queue_limits_commit_update_frozen(sdev->request_queue, &lim);
>  	if (ret)
> -- 
> 2.34.1
