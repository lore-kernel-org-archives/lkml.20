Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB65437D7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956656; cv=none; b=NlK/6MI617ozsTJpoacqNoeXfV6XvxZ7yYtSl0TqMnR23VI/+WV+nZD++Qv/SEunGLQttwrbXw7Xl7KNej1ug/IE0U5vVhsvIwxC7DWI/8s8QR5lFd+bmC0us578Yh4QDv2QyydZH+RPR2bGpb0CB3vHC8kyBVDDXUcI9jzmIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956656; c=relaxed/simple;
	bh=Ha+Y47SLxC2CDpyrlClJR3ci7qeqfTbwuzWfF18a+0I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JpCQ0ItaJpHcUCFR8N3qKAKTFqgW7B5gebyKGM5YqQJiCHZtaIsFWK1knFbTKJIp76rhHTV28hJdhsCqJQxVYG2zgpQxKWrHwuhgm6vNLMsy6bZ1w8i9L23a0LsWtQjSvR4yn7/9BoY8pbTZdRyK/ne1uliPU3vin47HxWBFdZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA8quWIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA8quWIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918EF1F00A3A;
	Wed,  9 Sep 2026 12:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956655;
	bh=cBzhxQxiITnYJOzsVsN3hQMa5zYjZWLywNfvsBGbMl0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=DA8quWIZKD2QNv7LTGnTOsIRNKzpwuZ4ISU90P1n+X2eidA/Gdfeznj0eWfqndKIW
	 xFocVm1IaceDKaLVF4QXdKHQiYuMX/Tj/i5hmlKoCMoCXT4evHaY7oHezy6JjVYWt+
	 q69QIR5e+xOGrHhj8qQH0ARcmHJsdkWFnsE7cpPMfaiiR8VSrACC8CNqWh0H46psmE
	 OJ3Qj+LBvW8ZdYQCDVC5Ihf1qr//Gwt/mZDbolt0t7vZLYUhQjcoLyREzCftBubmc6
	 91L3TJpxKOMmMDndGmQPqg2tOrMkkVFzTb5fGpqBcfc5NbnAY3OMTqtzBQxw0nPxT/
	 3KxN+mG4IdH8w==
Message-ID: <572c036a-cedf-4ed6-9814-b821626d56a6@kernel.org>
Date: Wed, 9 Sep 2026 20:24:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: skip node_change lock for inline data writes
To: Seongjae Jeong <jsjlee1020@gmail.com>, jaegeuk@kernel.org
References: <20260906145614.2749-1-jsjlee1020@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260906145614.2749-1-jsjlee1020@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/26 22:56, Seongjae Jeong wrote:
> The node_change lock serializes block reservation in the PRE_AIO path
> against checkpoint preparation, since block reservation can create
> dirty node pages and update checkpoint accounting.
> 
> However, writes that remain within the inline data area return before
> the block reservation path. Thus, they do not call
> inc_valid_block_count(), change a node mapping from NULL_ADDR to
> NEW_ADDR, or create a dirty node page as a result of block reservation.
> They also do not update total_valid_block_count or
> alloc_valid_block_count.
> 
> The inline path only copies the existing inline data to the data folio,
> sets FI_DATA_EXIST, and marks the inode folio for deferred inline data
> flushing. FI_DATA_EXIST can dirty inode metadata, but it does not
> reserve a block or update the node mapping and checkpoint accounting
> that node_change is intended to serialize.
> 
> Skip f2fs_map_lock() for writes that fit within MAX_INLINE_DATA. Keep
> the existing locking for inline conversion, which can update filesystem
> metadata and requires checkpoint serialization.
> 
> Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
