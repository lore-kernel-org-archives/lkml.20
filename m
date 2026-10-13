Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CCE21ABBB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881654; cv=none; b=fx/L/Sqvfa4DlZmTPHsmyUYkzG0zvAatZPU28+r7qYdVbdu3X2FEXs7LjmQ4axZV2lZ5L1zLavbcMSX4mdiNGp848B9inbpSWE4mYXDQ/EnRoKAlL4842zN9UuguEDte2oe0jJdFBl4fRp2uW3f+w4YgFrsh2k4UOo2rBsH2cjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881654; c=relaxed/simple;
	bh=9C8E/CwZ6TBFR1igCATRGDOo0vG9c2kE1cJ8ZRNiIs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdmuR6uNSuTe+ygb3kGT4hh3Be2bF9GrhLug/pzhVHkObN1cFnPLl+Eswf0+03YVmUmsiHvQ9OnAeNwxXI3EqRG/S+4LRCj0oxZaeHhZH5BA9No4hP+XIp4KDWIktxV1gxNb39LVgWS7oAypvQ4B/w0GMgbwOUhk1lqRquH3Bhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PA5Qtje7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PA5Qtje7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2611218f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791881651; x=1792486451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4fx6vBB5Eaubq9v9yvh6B2v2niRs6BpEP+mNzzmCOU=;
        b=PA5Qtje7EuX8gF9kJ+pI0kuzEDNAZQgMfCmuYLDh3wh+BrimdYQz7Kd+ueEQwYODXW
         VXtV+eZS36RsZnhjcKSo4inYIWYQaN33MscjQ1n3vB728kNrKQGNMZPsnmeZ8R/dZ9Xj
         UahPTQbW9imBDLzn7BWF++iUyEYAYmU8HDqnZ5qwpWo0ak5JPMAZx1cp/OlT1b1NKcFm
         YSpgfZTHNKeGNtJasNdctxY6tUBmyfmL9knyRpIRmMhA/MGPZGj96B2Admlw4OcReRjw
         gkFfMk0j5RoTlrWvofmso+mKgxhJiuneqEw4a6x6MPugrJKlBl9GqJ3aodd8IS7EqQfY
         FIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881651; x=1792486451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4fx6vBB5Eaubq9v9yvh6B2v2niRs6BpEP+mNzzmCOU=;
        b=lrEokL1O4FnFaVH6aunHXmuXE5rDCGzuW6MCcTUF6mhTxMp8CGa7uCyGZvN/uXZ7Mb
         g3D7Dcc8lV1syAImSbB6K+M7caYrmNuw339foVxl8pNX0MddXfu1yIL0w/6L0+miHjbv
         FE/n2vNA/ziCK2DXHAE1kYIFN7or0SD2GbbFoZYtLQKmQq01UqKOB9DelFZ7J4x+dYQn
         XGqyH3/xQ6rnnzQ/U+wTqcz2qVNqWW4A/ZBhwxjd04Fw+9zZnwSNEWRSvKb7KHSArylL
         M3/MXfMKHNgydnV3bCGbD5EKVaRs3fVTByLSjKwPNis3TUVQGDbJZvENztgrtocsHdWZ
         GM8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxxKwXat0vGFWDVD5yBVxBDph+V8vklWACmn4Hic3ekqnM8qcl2fua/h88byqgEC3008f3IYEUT+KTwSqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUk3d9I5XNhCKx9kQ9YcYD9IkukAHI6AsNcckRA0YQ7/xkxhEp
	PKRQ8c0OsrlR8K4iYsrIvg5hitOH2CQ/N5Gma5CN5NNGBAom5OtEJ83Xe10xPDK1vEY=
X-Gm-Gg: AYBFou3jchgL3UzQzhjt2KzNqYAIB93amiQZI1nKLIxm5W6UvxwOHdLbkccLDofttWu
	jXWtbd/DRXfqde6HTHxMhRE+v7OqjDXeylMY9jQBr708d9x3BEDRdiCx2/CfxFzfqifL50KkjaJ
	/VAv8+r6tmH/h4rH7omNdA7E28rd4AhlqfdAgO+RzkxKlOZWkgltFMFiWAwqZeV7BWg8ei+ZIKV
	kcayQQOy3LTSLBrpkGLxqHvbvnPBBnzqsoGyqeY7XfwsXUzBpwJ3PZELoJxaN/pOqM41gBYQllr
	vd1AtiKU/NNzEisHLx/KZ2NEhalKc1jcTs+s9E/JvfwjhqjSqTXOILFSfStjRxbu83/iavp6kbV
	RolcQ8+wzAN8uBxL+rpq/ut0pGBAvo5if6GuohdBpz2FM/t6SCB7cZwNb79sYshxqvONGTb9EHn
	zcf5fPUtfwyjBfzvE39TLkDN/hZ8JiOWn6G45skr0UiovABXk+An7OGgE0Lr2BcjvStccBVEd1D
	838u+vqewao573Z2RMfVOA/zBenT048uhTqG6+yBf9v/1ZRiKs=
X-Received: by 2002:a05:600c:4685:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a18e4ae6fcmr249070115e9.30.1791881650922;
        Tue, 13 Oct 2026 01:54:10 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f5:2701:b3a3:b9f5:f3dd:ee85? ([2001:a61:13f5:2701:b3a3:b9f5:f3dd:ee85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm347856035e9.13.2026.10.13.01.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:54:10 -0700 (PDT)
Message-ID: <4d3a6c5c-7516-4bab-ac0a-3cf4d7a034a2@suse.com>
Date: Tue, 13 Oct 2026 10:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v6] usbnet: fix smp_processor_id() use in preemptible
 context
To: Alan Stern <stern@rowland.harvard.edu>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?=C3=96mer_Mete_Kaya?=
 <omermetekaya0@gmail.com>, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 david.laight.linux@gmail.com,
 syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
References: <20261004215937.302247-1-omermetekaya0@gmail.com>
 <20261007200049.079aeb75@kernel.org>
 <7c4a2f1c-f16d-479b-a11f-cef962d5e2c7@rowland.harvard.edu>
 <20261008094338.301a75fa@kernel.org>
 <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
 <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
 <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.10.26 22:26, Alan Stern wrote:
  
> Today you fix VHCI, tomorrow some other virtual HCD will cause problems.
> 
> Should we document any requirements that all HCDs will have to follow
> and that all completion handlers can rely on?

Numerous corner cases. For example I strongly suspect that unloading
the driver for the HC will always complete URBs synchronously.
Please do not do this.

	Regards
		Oliver

