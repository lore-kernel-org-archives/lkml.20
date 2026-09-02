Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE464CCDFD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341574; cv=none; b=ONLXyrlk0oVWcnj2l1P9AWGbddz7Jf2PtnclwTH0GjoLfN8ptCnxMcuWzuwDeIx3WBzi35UCuLJA44WpS5TMbNDZBJl5EGfIs2fU0m9IOUZU+qHgTGq4FoMPuqp2d0nv8JnXsrFx9w4oTESa6EPgSaLbxIMSgqK3yisweQENfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341574; c=relaxed/simple;
	bh=EtnF13mkWXI2uMzqS0Z/k99ahoChEW95XIt9ojgLlsc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WiXgSMaWdakLT4+bJ7j4Sq0Ov8uVDLojejLaoNThNjY47M1mOrHeRXiQHqQ8WaiZLz3XLXQRLcTKCJmWnrJE+IU1UnabT+LFAFwexr5XYyWX1DYx1Cvvgh5+wi6mRg+aLHbDihApdGIxjqhETCsklGnit18JvFe4qv6QdLxQoyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DS9oslsq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DS9oslsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1891F000E9;
	Wed,  2 Sep 2026 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341572;
	bh=sLNkN45zgCTnCwe7uN6wLY+RNmxWk6frEwpG0oaL1aU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=DS9oslsq7i1jpGVXJ0KnNOxZQkn9Uk/+7eR3lYTrD6crgklC+XzVtiPCaxsi7eWxv
	 afk+WuI78ObkOCdSh4sZ5FpscfFKd4lbJ5cDYOVyFKkC8SpRN8HB2ljwa0+qzTv+Gl
	 d5e7O91XRNefR3KrrMlLz3iqu7kjcAonL4XUboexYMmW3JxZ4p8Z8bR4Xn5h7RVAG+
	 HoCSTrnFyUZSMWn6Hr92AREnbWcrHh34jp0AwIm3gpCEF5ENzY36cDqhJbqUiqaihA
	 FC98JQ3QPhK9nfP5aEl2+pFnDD9T3uCybV5d8WI14lcYKnTamCgxYRH/U1roN/4R0R
	 0KK94W4n/rADA==
Message-ID: <2c4fedee-7cd8-4377-803d-a3b5406bd003@kernel.org>
Date: Wed, 2 Sep 2026 17:32:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Subject: Re: [PATCH v3] f2fs: wait for inode record work before clearing ino
 bitmaps
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260902090611.564876-1-qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260902090611.564876-1-qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 17:06, Wenjie Qi wrote:
> APPEND/UPDATE inode state recording was moved to the inode eviction
> workqueue. These entries were later converted to bitmap values stored in
> XArrays, but the workqueue drain was left behind in the list cleanup loop
> where it is now a no-op.
> 
> During unmount, inode eviction work can therefore remain queued when
> f2fs_release_ino_entry() destroys the bitmap XArrays. A delayed worker can
> repopulate them before the workqueue is finally destroyed, leaking newly
> allocated XArray nodes when the F2FS superblock is freed.
> 
> Wait for APPEND/UPDATE inode record work before destroying each bitmap
> XArray, restoring the required ordering.
> 
> Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
