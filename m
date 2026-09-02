Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7F421A459
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338205; cv=none; b=UHHeRAbdDmAE9Q3EswFq7ouBZ43n3p/E4ooBjAeAaHAKmG6a4Xbe1h0x0aGBqLr0jHpiqooxTBJWcnZofCExaGSrSxBSZE8m7g5CNmoKyeTqDE09Yy8cDZONIwX358lq4SfM4nZ/d0yIoAZS4BnqU0FPWAlqu6MrRvuxT5OrYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338205; c=relaxed/simple;
	bh=02EI6HCMYuFfEvtH1B2XBsVYe2pFlXC7sNxDCyAFmaM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XDVc4okfiV/IbcKU6WKvOUHYElrlCNWdi6t76z/yaFJUNHbFcH5fLLuu2tvBN+GybS3tUTZr8wnT18XQlzjJkKqDphhPI71k1vGCR/KYinxX3JhtSbz0wnPwKHY46mQUE201tyXiUCofPVgedsaW4u8WBUM3o1ksGxq1xLZbRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCpRUK6h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCpRUK6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481BC1F000E9;
	Wed,  2 Sep 2026 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788338204;
	bh=f5eOwn4JdKEKwT71A+VnTtLOHomJI4yFlxDqRGgYf30=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=oCpRUK6hGZAnNe/9VlvqRRERWIDNWVEVVKtudzWuJTP+1lLIJf1/MnQHhrdxtDdK/
	 Ih5bJU5HOALojvj6Uox6o1Ogt94tLUfYRBNJNK/oz7G4dEuyyXPHMoNZVA7OFgEL11
	 TIu2JbQOe4moDI3WLEdlZYgYA88XrzQOpgbXXiW7D4VJUDR4p8x+WJbank/5WRUoFB
	 JhzbUyV1OZH34fPVogFzyrupaEyAroLhZPrMu6KspLP6+t2nqBcEM4qpdj2USOpxxb
	 h7CnBz/xWjvN7fkoBh4RXuWMxNb0TfXzJBX239GVhnBD5+B5z+VHqcX3nsSwEOBeUq
	 bvd0bnhxWl9Tw==
Message-ID: <38c7a280-fb53-4b84-ba5f-9656c2121f3a@kernel.org>
Date: Wed, 2 Sep 2026 16:36:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, daeho43@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 qiwenjie@xiaomi.com
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: wait for inode record work before
 clearing ino bitmaps
To: Wenjie Qi <qwjhust@gmail.com>
References: <20260901140849.3405971-1-qiwenjie@xiaomi.com>
 <afbed6d5-0c11-4041-ab8a-68f0264dceda@kernel.org>
 <20260902081633.520538-1-qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260902081633.520538-1-qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 16:16, Wenjie Qi wrote:
> Hi Chao,
> 
> It does not miss UPDATE_INO. The mode argument only selects whether to
> wait: both APPEND_INO and UPDATE_INO call
> flush_workqueue(sbi->evict_wq), and both updates are queued on the same
> eviction workqueue. Therefore, one call with APPEND_INO also drains
> pending UPDATE_INO work. A second call with UPDATE_INO would flush the
> same queue again.

Alright, how about call flush_workqueue(sbi->evict_wq) directly and drop
f2fs_wait_for_inode_record()?

Thanks,

> 
> Thanks,
> Wenjie

