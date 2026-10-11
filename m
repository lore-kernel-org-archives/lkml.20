Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3880432E83
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791715061; cv=none; b=To4gCR6pNHoWl3gURDH4CVt0tD7af/eDG0pnJPv/TeBY82FNPSJGzRuB4brlitR3KIclzNJ/TwL1KHddkoCBcmXWqOBKDT4nNkDB38kdd8oTrmQBwt3F5ZcsmEC7FAv2cBBl3ywLEE+t92pP8mikom9BOZ14Q0zTuYI//UlfeJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791715061; c=relaxed/simple;
	bh=BoaNOUFYgICQRllLO79jKfrefZDe5Md6IqO9u7ZM2S0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RQTLtgsVwfC1wfFbVEpeUGxSgj4YrIoIOyqkpA/YahjQHL78MUmEjte3t7ZQFVqeKPn+ZM0GERcRR9Q/Ui/QWghd9YrUzkWOKX8AFKfaOSt9sv+X6jlmT+V49cKVHUJbs0w9YB+XNMnfD3mBNP8KJZK11VDRyv/CoaVhBhs9bro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aciRz+b3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aciRz+b3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488671F0089B;
	Sun, 11 Oct 2026 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791715058;
	bh=aN1XZ4lOE8V26VbbVSWEWoGRS0e1EVgJSZ/u1bHCotY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=aciRz+b3zZ+Si/gIdLVMQHRh+GFtNhhs8SvCoODTog5yKOUGvu7yWr1KeR6frCw0Q
	 EK5Hln2Hd+e9PhaposO2AglYSV3/sV680n3KuQnVMHNcKYYhw11CO11mRtBNujK/yi
	 dRR1tW5mWaswX6OaM9gYJ7njaclg+VrELMijjNGSeSVFwIAy8XwX6yMj0gujT9p/3l
	 kxpD969xT3IjSv8gAetDLBOmjUCXKlp8o7gjMEiKRn0KHZmpgybSRHxU3vBAO/tibN
	 /dXhZ5POW2oJWsSwrezJdCxW47djk08Q7IC0cSQ1U7Ttqtgb/NMKAHLEYtrN/wB9bz
	 vK47A6VFGYWFA==
Message-ID: <73918f53-cf62-4a0f-a28f-a34dfd7de2de@kernel.org>
Date: Sun, 11 Oct 2026 18:37:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chao Yu <chao@kernel.org>
Subject: Re: [PATCH] f2fs: fix termination of f2fs_sync_meta_caches()
To: Seongjae Jeong <jsjlee1020@gmail.com>, jaegeuk@kernel.org
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20261010074912.114840-1-jsjlee1020@gmail.com>
Content-Language: en-US
In-Reply-To: <20261010074912.114840-1-jsjlee1020@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 15:49, Seongjae Jeong wrote:
> When __f2fs_write_meta_cache() returns false in f2fs_sync_meta_caches(),
> the function only exits the inner loop instead of the entire
> while loop. This leads to an unnecessary lookup of the next batch.
> 
> Also, when nwritten >= nr_to_write, only the inner loop terminates.
> This allows the function to continue processing subsequent batches
> after the writeback budget has been reached.
> 
> Terminate the entire while loop in both cases to avoid unnecessary
> batch lookups and respect the writeback budget.
> 
> Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
