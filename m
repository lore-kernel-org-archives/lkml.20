Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7C3C0619
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814915; cv=none; b=PznpLsVU7hqz0yErwYe2mXzfkigFt+H+Yc0NeDDcW13LdDY7bSiHdfNJbytNwZNbPRMCGT3Qb2BkdgG4gzmtMmzNLg1p42lP8bWCi4b+Xq/btevoORhk5Dh8ULVfGej6b2Uc+wNM8DXvtmfgb0jMKmIFO/u13Nh6/5NlsoSCv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814915; c=relaxed/simple;
	bh=Hiyd+n9zj41GfYY2+DseKgKsmgTv+qy1m8+orHWzefY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qc5uY1ptwtcfAxtiClz4uKepAgXVLIZJ2Kax2o/UZPXQdx0pxXEl/6HMuolL3qcTcshpmbtICSPTCJawGMAqWAucm9UyVlce/j5sGmvpbMuIdCPvu8UYC2nzUkO0QndLUN2tciafKfsPUKCYF5fsT7UfeZi1YDXhldDdP/xc9vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lR76VlK6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lR76VlK6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff390a6cso131945ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788814914; x=1789419714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGJyWqg8b9I8pDWEAS1fAo54dmwDkCp8//1b4QCLnMM=;
        b=lR76VlK6N5W4KsUEXS8GaNfKaVb1x7FCfRITFIn2pgrI55HJx6TQcjMaNdVA1D1jJv
         PwgtRiR7eoYdPxSORWXleP0mA/MAMm1m0PDtekcYLKKn8L0Rs9S6JsJLiBas1tkUKdUK
         zdKe10eq5t9RtSy5BUIpKzz2IJwLZt3ux9nAK9XxFlKxC4vBCPJW3Tefx3pwVVoerlK1
         iqkTT2b6GH3UUAIfBq/hCO9nUtxfsaKvct+SmEKkOz+WCBY8oMcYkfBNnfh6QjsHKkbv
         h8SwjtsB+1427fuYvxoYvGfRcEFCpMpdEbh4HoWaduQkOaiaWUHCm7RR6heyQFdQZxqC
         0k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814914; x=1789419714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGJyWqg8b9I8pDWEAS1fAo54dmwDkCp8//1b4QCLnMM=;
        b=bJp8/ezAc00u7cv2KjAOvDx1zqmcoYjnGnUWQhLFRjWRRCI0On+osSU2XHPLVOuLEL
         Zz+SOa046pEViYeK85ss6qVLZFLA7poj7icUyBxYZRYT56h72yAIbDY5AXNv0VuVjEKP
         eLNLBLh7zeaFhpwnI/OJOIS0wXq+6sI95VimhSulUtAS0hyyF8fjKdT2RaqPOnRxM38l
         ZxTLpzvn99TXKUqI77nUEEOh1RCMoCmxU731kaMEAKzLtBpv6X+0QF45AGD5xgB2fEcG
         vTon9yv+eOYMpQeIi4NmRReLzXWAJAewCLc5nzrywoFM0RZdZ0u5knKt9pBY1DnJsuhw
         KnAw==
X-Forwarded-Encrypted: i=1; AKwUvBzvu2Y9ZLu6oskPX8t5GQn41krfBD5CQ7hlJ858CVU0tTlharQhcWbTn/kqHJRijIonYvp8rUrNy/QuCVE=@vger.kernel.org
X-Gm-Message-State: AFuF++lMWNXnOXSmwsxEWitM25qK/yQAzPJ17tqSMSoDTbnqEH0tvXMG
	ydfYfntbX4fLf68lei2FWzWMnsXD+/Ee03/wG05DMbWrvJ1vLF3hAwMVtZqqR0QlpQ==
X-Gm-Gg: AYBFou2+aAp+5KOHN2vSYSer6l0xFcJZcOBzV28VWjukxFTXqEqBHm6SDUoWQBlAmha
	rr7+2YQOLYvb9wdR71iEyT3Xvj1QTdJ3rxxVFWcAM2Raa2TDSyfZQH/ItZQhOzWYBZstjMyRWtK
	tiBjxSTrwVAFmLDR+TXdEiNzh2ItF1XpPxg+8MsEshpOLhFBMF+0RwxTwopc7JQTTcVN5PwdLMf
	KOIzAF/dtBzpbc2qUSKmDq9w02Nho0nYj0R99zx9dOIOD6/O9CJfwY7QZyZ9Lle1ERUThTFVNxG
	LyxB4RXRVL4FOERQ7FAX6xQdkbvwJucSxjCwqPvIFnSYo2V4PJ4eyCAKneA4spV60e8MuwZ5Hk2
	wmeyI9LVy4KjHM3b5A5zUG0bv73xlst4kOPdRUx/7XW6C62SbF9CNp21aYdwspMIQIb2dP2IXJ0
	VEgTR81iyFTjcz8IfqZ3WwCWgtVmyRRE4Tz6tHngmPmFpMb1JP3c4sevl0mbW2BgrYD4Fuj4zla
	f9iqAllETo/W1wsdKnnkAx6y7sBB/tYBUUur+34EaoDNHdK42WRem76Hes3tHq+M3hgYA==
X-Received: by 2002:a17:902:e745:b0:2cf:4353:f117 with SMTP id d9443c01a7336-2db7773ef8bmr714085ad.0.1788814913291;
        Mon, 07 Sep 2026 14:01:53 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae92c5d72sm8942409a91.4.2026.09.07.14.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:01:52 -0700 (PDT)
Date: Mon, 7 Sep 2026 21:01:47 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
	David Matlack <dmatlack@google.com>, tarunsahu@google.com, open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, "open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Subject: Re: [PATCH 1/1] liveupdate: luo_file: Add documentation for
 dependencies
Message-ID: <ap3UCMlxUKU_DFDO@google.com>
References: <20260904220555.589752-1-skhawaja@google.com>
 <20260904220555.589752-2-skhawaja@google.com>
 <178872718104.3691424.15410189304450384708.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <178872718104.3691424.15410189304450384708.b4-review@b4>

Hi Mike,

On Sun, Sep 06, 2026 at 11:39:41PM +0300, Mike Rapoport wrote:
>Hi Sami,
>
>> Add documentation for dependencies between FDs preserved by File
>> Handlers. This supplements the previously added
>
>Why capital F and H? :)
>
>I think we use "file handler" in the most places.

Ah, force of habit! You are right, it should be lowercased.

Let me send a v2 for this patch with the capitalization fixed. I will
check if I did the same in the source file also.

Thanks,
Sami
>
>-- 
>Sincerely yours,
>Mike.
>
