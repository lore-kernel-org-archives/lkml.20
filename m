Received: from mta1.migadu.com (out-197.mta1.migadu.com [95.215.58.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08936154425
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791166808; cv=none; b=tr/EGfpXhcekWXkdS5A2ukheJ5nNoGdJFrRrsgdpninet/t5/0svhX5trZjx4H1z6QCM38Ntl8pPyfBDHbM8TO8u6D0/+f1nLwVTYi1fJLrYNGPUgWG4JQStdyV3OKkS058xz2LK7NWNBXuIqM+5d3YboO/OPJ7afxFKEAlUv1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791166808; c=relaxed/simple;
	bh=xKi0fX2xbV6KEgiTf5sK2JRYLQwgg8in4PK26lZnbGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lq84sJxfe6GhNIAK7c+Qkbn6Jbhe6Bv28Op9UsY+rdWIenuZdqorBOTPhi4a3+3l4wK05efubc+PRH/wFCDGNBud4/ZxEAqqCoPwXzaxQAW/MXJKC21OC+FuujatTEwvXS53bcfoJSnZT46Tvh8jwpLl+8hd/S/l/EcxeZNtmWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v6tUDCQR; arc=none smtp.client-ip=95.215.58.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v6tUDCQR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xKi0fX2xbV6KEgiTf5sK2JRYLQwgg8in4PK26lZnbGc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791166803; v=1; x=1791771603;
 b=v6tUDCQRHGh5I1Lz048HFXRrdxOwL96yS5k5fXchQCrRcTIfYe/JNgCgZ1tUOdC7H3JTYgwu
 cfRrnDLRZyK+XLjwuW+qqw/L51Ghk8BerzYpLvSAV69Am1oui+YoiGkZIjO14v/Wzk2ORMslPxD
 6hlfG46aRtefryzGLFvFdJYM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4cae8ba250b31cd8;
	Mon, 05 Oct 2026 02:20:02 +0000
X-Mizu-Trace-ID: 4cae8ba250b31cd8
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: neganhat@gmail.com,
	david@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/gup: fix NULL pointer dereference in fixup_user_fault()
Date: Mon,  5 Oct 2026 10:19:57 +0800
Message-ID: <20261005021957.5254-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
References: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sun, Oct 04, 2026 at 12:56:01PM -0700, Andrew Morton wrote:
>On Sun,  4 Oct 2026 02:48:46 +0700 Nguyen Duy Nhat Anh <neganhat@gmail.com> wrote:
>
>> In fixup_user_fault(), the 'unlocked' parameter is checked for NULL
>> early on, allowing callers to pass NULL if they do not track whether the
>> mmap lock was dropped.
>> 
>> However, if handle_mm_fault() returns VM_FAULT_COMPLETED, line 1597
>> dereferences 'unlocked' directly (*unlocked = true) without checking
>> if it is NULL. Callers like s390's pci_mmio.c pass NULL for 'unlocked',
>> leading to a kernel NULL pointer dereference when VM_FAULT_COMPLETED
>> occurs.
>> 
>> Fix this by checking if 'unlocked' is non-NULL before assigning to it.
>
>This code is too subtle so you aren't the first to attempt to "fix" it.
>
>The key hint is in the kerneldoc:
>
> * @unlocked:	did we unlock the mmap_lock while retrying, maybe NULL if caller
> *		does not allow retry. If NULL, the caller must guarantee
> *		that fault_flags does not contain FAULT_FLAG_ALLOW_RETRY.
>
>Trace through the
>FAULT_FLAG_ALLOW_RETRY/VM_FAULT_COMPLETED/VM_FAULT_RETRY logic
>to confirm that the null deref is a cant-happen.

IIUC, that's indeed a can't-happen :)
