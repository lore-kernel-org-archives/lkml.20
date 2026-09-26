Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A95838A73F;
	Sat, 26 Sep 2026 04:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790398577; cv=none; b=kxjUbKtN/MRiMOQpfsNy2GynhYcatzM247qdNrhOZz1tua74LwvyFxeqKvYvKMofkM6GrkJ5rk98iCuq7UMzAjMxOSmeAsn56WFnzMHlHA58/6i2gqqO3XiRxCUfN/B504vpdhf1gcc3sWueEe13SG5+Qus7Nxi0Zqsk6APUqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790398577; c=relaxed/simple;
	bh=p4KdaGxI+q98fRUhOSbswKUhRtHyJGKs/Z1S0pSaWJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYlgNfrEaNPkEq32DiTE93QeMYms17gAqrJRjUHEkilIi0Y/Yp1i0H/eCKuLR8AGJzDLP/xyjFI1EWDLy66ochZ/LP43uIcYJRgTmecAeiauDJN1anMjTSzVbEHT8+VZg5I5TZ+zJ3E+kuNJYC/91WjPqdZM2AkovgquqWZpL8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Gaw04ooD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Gaw04ooD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gKn8yqYBMBlCSxF1m1hyDM3YJRV14SVM+xv/Zr4cNfk=; b=Gaw04ooDn1nxRH/Idvma992U7P
	1Tn6lv+icVXDj5nwxGkEJvALR8qmgPyuiqe8+EKBYs3dxsSM20V5HoNVQjm72KjBAhBkSBAokQQEi
	IzHhyh8P/gGsy+SEb9mm5wSvvBxFRZTwFr2PNsdnLt0BkEBur8T3MxGY4wPTwPz30rrDgldzeYg5k
	z/Ux+4pymZO2XQs3TyICjhhQWbn5a17m2Sgq1QMPtmmY0TIHA94RxHTJ5WB6KhChRoF+0tCvgZHl+
	NvymotHV2TTAESj5IEOsCGjLmiM0Uvdg70OCxwTvOmv4gNK/UpGevmmpHOqFpn3E02n9eRI5wHj72
	joSYz4iA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKSH-0000000Ez1o-1ZTO;
	Sat, 26 Sep 2026 04:56:09 +0000
Message-ID: <c8e90d92-7a1e-4a43-ac8a-4f570a47c353@infradead.org>
Date: Fri, 25 Sep 2026 21:56:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
To: Bart Van Assche <bvanassche@acm.org>,
 Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>, peterz@infradead.org,
 elver@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, kees@kernel.org, tudor.ambarus@linaro.org
References: <20260925234054.128477-1-emmaonana18@gmail.com>
 <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/25/26 5:14 PM, Bart Van Assche wrote:
> On 9/25/26 4:40 PM, Omokefe Emmanuel Onanaroghene wrote:
>> kernel-doc fails to parse struct declarations wrapped in
>> context_lock_struct(), e.g. struct debugfs_cancellation:
> 
> Has this alternative been considered: instead of modifying
> tools/lib/python/kdoc/kdoc_parser.py, apply the following change:

I don't think that has been tried/considered.
I'm OK with it if Marco & Peter are.

> diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
> index 4177c4738282..aa591f0b0920 100644
> --- a/include/linux/debugfs.h
> +++ b/include/linux/debugfs.h
> @@ -233,13 +233,14 @@ ssize_t debugfs_write_file_bool(struct file *file, const char __user *user_buf,
>  ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
>                    size_t count, loff_t *ppos);
> 
> +context_lock_struct(debugfs_cancellation);
>  /**
>   * struct debugfs_cancellation - cancellation data
>   * @list: internal, for keeping track
>   * @cancel: callback to call
>   * @cancel_data: extra data for the callback to call
>   */
> -context_lock_struct(debugfs_cancellation) {
> +struct debugfs_cancellation {
>      struct list_head list;
>      void (*cancel)(struct dentry *, void *);
>      void *cancel_data;
> 
> Thanks,
> 
> Bart.

thanks.
-- 
~Randy

