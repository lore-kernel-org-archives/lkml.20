Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602496;
	b=ZqboNz2qkGagXr7WYqEEo4qc0MentEol+gWvS5GRqGEunsVtkwnJExeqtB/3dECJdlFG
	 KzQsI+/uxgyCqWNkVRlJnGZ9M+KF7chZjy5eyzY7E3Gr/jH/b1J8TXMPV2QkbDFlzjS4b
	 bhdVJBVEc8LzQCrBvY3iQJpSrTnh9iyXeCUL523y5YL0Hg2dZknXWk/+epIzQ5+826cgZ
	 gG1OsTg8HVtz9MkvfTIQJZcO4/tqYo6WdsTz2M/1UfZcyuUFr4rK3IJ/R8+tqWEaTgf0r
	 nLa6PcINhupZZfwc6OJp1IjQk0xdv31xIdarhOHAX3FuC+PBPvnB25nR9oEU1fuYakg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=Go1UlgX1P4vYTlu1myflgbT685YTRFHTo3Fw25oz0DU=;
	b=n6cJS61fBf6CybV8KvpIzFaAv75bQlHWG7Tw/lqbhJQq0EDo1DfuZyMKFsGqKHBaSA0w
	 21CApzZDbiViulZclXcOp8hqbDvAq63XpMvKqnojw7ma9WrhEr1BOKTs7T+ekCjjWKzb8
	 duGHH780IcTc5untYGGz2xmBk0jMXIru0wGqw0WTPxIW2dQQkhvDJDlEu5p5lShYxqs0Y
	 gJsNxj+yl+EP1/KVXSB8yf5Qtebc3MVMAYv0/WVkR21dxoF/DP+gi9bpN8gI2xwHD1ud/
	 +NmxA4EBVeLQ5lKpotoZSXhdXHA/35vIL7Dq1SDuPSra+QaKZSFBQTscNionfw6Xguw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H6cHbjyz;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E4606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H6cHbjyz
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94962d80d34so7960985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794602495; x=1795207295; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Go1UlgX1P4vYTlu1myflgbT685YTRFHTo3Fw25oz0DU=;
        b=H6cHbjyziz1gLSO7NGLmPKJ2sWjqqZPQtZKw9ktfXegRk5crmjVAzuYgLoGXwmOg6G
         4x0my1vj9kG7zmBMS6jT4gCyYqQAesvQvYZ80PekskeAQFS9xUotAKj8P+B/wM6TS+Ms
         R4OFYi+p4QJh4fuy8qJNiIv0ZGxfiKTZXFDc1Wd93RfKMeXl0e7qVhnAnyN3vrGGpKTL
         JTxq8WV7HynrNibJnldK7O9YKvBjRZVixNwa7+tqKizFa/HqqNHwrZ+2YuRwyLy0PuPy
         MYZJTsQsqmAUl3kh6Y+CIWueTXnEDdZBE+DwHDJusD87/q97axAwprGJExG0tzpGUBaN
         9DSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602495; x=1795207295;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go1UlgX1P4vYTlu1myflgbT685YTRFHTo3Fw25oz0DU=;
        b=hF/tXLeXs95uAXRfVgKsUnpGUiQTv1bbY/YolQrMxlJBYDLWCiCv0pXUTGKLHcbY3J
         mxyjxRJ0XwtdmiSlDKTIcU2/VNY6jeWk+ZAq7iJzvTmw8rx5LnHzrcMyVEDWOx/XmllC
         H8k/72w16SBrLdgvAsEOoved+1jkYGvqXHgxqRMmcuA/xuLHB1fxgbrl9pfD/ZvXAsOG
         xqq2bHxZAL5DqMXb3smta01LgxZ9jv8BdNr/JHUMt74FQQDDbxgGynuxE+8f80dmFgqh
         mT8p2SSwsgSfkzryK64sQgwZ/TTMwQSRfSn8byciqcABMht11STp8apoiOK7xOffF/fJ
         ntZQ==
X-Forwarded-Encrypted: i=1; AL+hErE0Cxos0t4lnm0eS7CZ6cs+f6mPfTz8aAP4Zp5UOxg95snjrYBULb+gKgSaGxyTEqfGGFh5HXSp8L1EP9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bDSeJ7xyBQn5N9crb8LSysL2IkS+4+PLPDQFrPiW26U4w20jp
	/H9fMbbl9MfpFLN+/9INZRPbhbD1JozkkTLAWgrkXC4h9XBLzUoumvWJYvQDwlK+er4=
X-Gm-Gg: AYBFou24t58wYeZ60Xs99ndHawY7ylOIwKOIfAQ8C0EGHkAg8l6eFcDhMmZLCfT4lzS
	V7xKcmGZ/Womc4bbOZVtmLJ+eYtvYEIALm1y2hWnM4hZqcgoMS8Az9KaKHT9H5rrktzL59Jb+c0
	VJrcYDDU5YN+ZwjYtt02AFJEamCTzom+PHNC4jwsdSyGGLVXQ/YtVkiWp0+7NGBlbgbtcQnqm/A
	LdlpT+9MODLviEX3JhjijgPtjjpcN0M3q+xLdFZZHHAIDzLiChVn75qPojTXuNVFJbzyY1E6DZt
	0jNmCoi/h++59xoTQOSE7KpSVIwcNjxPEKfhw1OgJH1js0w1yG2ZLmYssniqJKB0WYuSbZPGib4
	db8gpWCclmrbpHY3WRRS/MLOIhRcydaI+j3N0KtkXM1+8wxvSEekpsAU3wNuHgTsb+1QTGy9zhJ
	urLgrmSd3k/4ow3XnlbB0oiwJr8s+Qq++PpnxlR5Dh/9jijBZwgW5cPlrEEFI34wTObduihZ0dr
	NpMWsDBpSrmXbl6QxREgpufmH1/XfSBqjl+6+HRnCWOSTLMcvr42Z33glzME/lXAAWeKSBWdT6+
	dofb0UrQVK0lEJf1hqu4TbUIOWCzNRduhokcLYW+ZF2rkNrRxQaBQb2+Hj8qxkg/FGSqk927vsH
	XSPK85wY=
X-Received: by 2002:a05:620a:2792:b0:93e:a71a:5de0 with SMTP id af79cd13be357-9494bb894c4mr610417685a.26.1794602494861;
        Fri, 13 Nov 2026 12:41:34 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c5fd154sm262112585a.2.2026.11.13.12.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:41:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: reject shadow-stack mappings
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, leon@kernel.org, 
 akpm@linux-foundation.org, david@kernel.org, kas@kernel.org, 
 dave.hansen@linux.intel.com, bp@alien8.de, rppt@kernel.org, 
 stable@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
In-Reply-To: <20261113200303.GA395967@nvidia.com>
References: <20261113195536.2660763-1-gourry@gourry.net>
 <20261113200303.GA395967@nvidia.com>
Date: Fri, 13 Nov 2026 15:41:33 -0500
Message-Id: <179460249376.482102.14669935557901467762.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 16:03 -0400, Jason Gunthorpe wrote:
> On Fri, Nov 13, 2026 at 02:55:36PM -0500, Gregory Price (Meta) wrote:
> > HMM can grant ordinary device write access to a userspace shadow stack.
> > On x86, pte_write() is true for a shadow-stack PTE, so a populated page
> > can be returned with HMM_PFN_WRITE without taking a CPU write fault.
> 
> I'm not sure I understand this? The pte is writable but you don't want
> only DMA to write to it?
>
> Is there something special on x86 that makes the shadow stack pte
> non-writable by the CPU?
>

Some of the context is here:
https://lore.kernel.org/all/20261111-mason-migrate-et-al-fixes-v1-10-3d2454362e8d@kernel.org/

We had a similar issue with migration, but this should handle the DMA
case as well.

It's "technically writable" but the kernel is supposed to prevent that.

I will say my understanding of the larger HMM picture is limited, so
there might be a better way than special-casing it like this.

-- 
~Gregory

