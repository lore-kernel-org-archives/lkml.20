Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01846475343
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530614; cv=none; b=puVSeIUBiIjGqWPiYPOKk30dpjVI5vPj88EXGWxiVpic1pXvOvL4qok/Qjfw8dKl9j9F+twSYSAojTadXfca8ZpyrKNAk6xKY1jWXbf0BrsBeNt4pBJVX94oyle7M7jUw9BeXvKVPfYkUovsT/OhjaD64vJFsirwPeI0w/LHMc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530614; c=relaxed/simple;
	bh=PqYGu07d2BCiRv1ksbG2AIQgXBphnYNq5DVmbY0f+fI=;
	h=Date:Message-Id:References:From:In-Reply-To:Mime-Version:
	 Content-Type:Cc:Subject:To; b=JK6GsIt5igYgyqCvoH3i245K9o2/4wEXYeL/I6fvjz0iAixE/XTWH/amvYWF13RtUkuEvgMCMkrvpeOLwfLD4xgtIKpK5hIyTCNugZI7K+IumezrOnZ524YKl2QkLJz1cNdzAV4g9HrvNl/qKAlUq4kK5OYwRez9VrCRFo6UoZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aqrBXgtH; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aqrBXgtH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791530597; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=/doUctIfkSGS90lIdJrmo07RoArVdYQ8CzTh6bmXhO0=;
 b=aqrBXgtHu7DfO7vMaYTKzS4T83cAdkbODyDTrOqA6VYN2PmV06psMr+NeDojSSn3/OKzcu
 vmsJRIYRRm7UP22Quny8z63NX/f7i5zqVClbqKZaKXD8MgsrUjYnW+Psmbmx7m5DUPeNKy
 Amp971PYSCpibQ9GV7so91xsQa7d89keGopTajp2bYhuj3s5jOWac56qJv+etjnvvRaL2c
 WDZkedA9830MXIG8EISHJCqJIa/kSEC6uHz/wHYsGSZInA7YTJmD7P8zwKgrbtREKV133M
 7O1MoG5i6dEOFb/YMXZGXXd57LQsTuyyohFhhfsxjqHGmxIvpukrW+r5Aujlrg==
Date: Fri,  9 Oct 2026 15:23:02 +0800
Message-Id: <179153056321.2.12008170766154560402.ping@bytedance.com>
References: <20260626100740.52455-1-zhujia.zj@bytedance.com>
From: "Jia Zhu" <zhujia.zj@bytedance.com>
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <20260626100740.52455-1-zhujia.zj@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Jia Zhu" <zhujia.zj@bytedance.com>, 
	"Andreas Dilger" <adilger.kernel@dilger.ca>, "Jan Kara" <jack@suse.cz>, 
	"Zhang Yi" <yizhang089@gmail.com>, <linux-ext4@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] ext4: cancel dirty accounting for folios without buffers
X-Lms-Return-Path: <lba+26ac89663+3a2298+vger.kernel.org+zhujia.zj@bytedance.com>
Content-Transfer-Encoding: 7bit
To: "Theodore Ts'o" <tytso@mit.edu>

Hi Ted,

Gentle ping again on this ext4 fix:

  https://lore.kernel.org/all/20260626100740.52455-1-zhujia.zj@bytedance.com/

It has Reviewed-by tags from Jan Kara and Zhang Yi. Could you please
consider picking it up for the ext4 tree, or let me know if anything
else is needed?

Thanks,
Jia
