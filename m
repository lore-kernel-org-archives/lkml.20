Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634409;
	b=y3jSv9bFWvQdDdElJalhaxQngkL2xvyIjR7EE27U/Dmw7knlZ8GMN3iG3IAEfyPtErzq
	 q1H/Sw/jKnpHPKxWx/kTF0ZJ92/EBQqSSzij+X+Q6qodc4NmGd76mOU4oaJsH8dN3dhXz
	 IyxtYsLNZoJKMxGomIVTcaGPvXFnFtBPyr2QfH595hpJ6WOXFM84NibNFrs8uYIw5miZG
	 Ag7X1IbbKFYRFUi+RehnlQcTnwm6D7ofbUbqHYHE3ji7d6nWoFfzF/D6o8pqD6y0TRcZu
	 aY3pCgtYnAZ0CifCjmd8bRVgAdycM75BGNmK5em/BTF5TcT9530i8q7bpwjgI/iQMtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T18TAp5F6jRaMrl/nS/24uUBMXl4uu1RdHaAtztL58U=;
	b=lWqbPN+M9bcvfLc1dNgN+Q8LaFWS9AksPauDKBfUR+Wb2NKr3n19TYH2YMiumWezO0sy
	 r8FrzTuo/VUGwTGlxuru3AMnzpoPCqaOiE8oi+JqVSKhMCZSsuHlH5kmFpVuB9MaAK9u1
	 1NTWCeIGbEc8TD3tb51lWVRcRze6g23QQx24yqUCZEyRbf7MRiDNLgdBbvV41Oq7KJRZa
	 MlM2LO5vz77gg85NL73HkheyHj+Ei+N0pYwkYKlTOIsXVYhyIocC2a6Bo+ztSIqv0Pwdb
	 MHy8o1Q189oEca07+goX3ZH2Exn7ul3F4r5xTJM73PBQgJ+uD4qbG6gS07cqt1z+Mqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O/uWwWQ4";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA00606B1D9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA00606B1D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O/uWwWQ4
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1767540f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634407; x=1794239207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T18TAp5F6jRaMrl/nS/24uUBMXl4uu1RdHaAtztL58U=;
        b=O/uWwWQ4MaClpIQA8a5Kzs9fakE50sx51ScnrYLyjmppMn6eoVPzm4I7PPHPVY89Wv
         I9Nv9CWMLl6PjBLS4VgnLUEMOf4tH361pV0DP86PZfVPJAwM0B+ZrhVV8gxGKPZcQsn2
         WGMKrxmz4ycRpcT2d51/EsvImEjyRct2l3Loo0y2Qheb5gV1nlPXMOHE6XCqUbirVoOY
         x+8AKQiZr7fdpUnsqFFxD3AJnG6CNVx6pdOjEKcSaKFuQzFYu05hD2DaM95QkLFX6sJW
         28GoIIrvb/wBJM7PQD81HltjxeZj32CywBZKY6QXvJOwZLwoHSzQB/NvgVWFHT+EKTAL
         kwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634407; x=1794239207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T18TAp5F6jRaMrl/nS/24uUBMXl4uu1RdHaAtztL58U=;
        b=aSAFi6pqZMHRurDgtaeKc8MTCJ8ruAMflMg24YcMxw5WuclURaYIFVfEu514OzK+cm
         TzVEXFJZAo+0UoWF1/HrA/BTiAEcOl/iqkbAXv3o8U6xCH+B1wje6RI/VbAnzcKnsg8h
         7KwtFbTKwNTQRU6cP+f33iHQytJ5ivjYjzAAG5xxlxQSZXS8z3QcMd8zoy9gfQNtR26W
         /aZXECalh95stG2E5X9PzxVZrtpcymVIZGC/WbO3wF1ViZCW1UrbK0QazAn2BYip+OXP
         ZfpDqkAZjKxW8mzOAGAIFT57MIg4DiCZSwUwqFs/zaBPcMCVdKo6KjYgHU/PtSJBnGM/
         1s9A==
X-Forwarded-Encrypted: i=1; AKwUvBzkAsHmWc625Y0MY5xpg99AQeWnkpZx6SQ6cMsDPk8zhrRYYu0PvUA1rKRVkfi9Jgf1/R2u5laLnAx2hBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CSdc+fdkIS4DRqJJzY8QGpAR6tktULIW8Dbms1Da3XgVRQ/Cc
	6HnGBKtNjlyR8d0qq861kTTptOrj6xl473pVIsXYWbQUC/lFTZ5fGvkZeDTUCRYjdpQ+TWn7
X-Gm-Gg: AYBFou2afoi7R2QF8kJIwo014BEP/fXlBK0+4khTXi8og2Y7wXg/KiZJGVQ6Go5KUdj
	vT4WLqT2F9oBCzvuMyCHUyafMe0Nl+WKWGo48hLLBw3cRPuUHMBA405uZwgOMLMrireV70aRUh5
	xCkYLFJ5Opnh62rwLogHkzOEqanAoJYzevFwPo1uq6WH0wgRNx4e5wlpbXJmhO08XWMSuPvlXZs
	BIT36emSnvpMvMzXtiEvRw12Hqx71ngfY8XWU2L/S6AnNwLx0lBK7kyi4Vrbn8MoFbu341p+n5u
	mseAp/Xl5BGzQGNbEfv/Tulv+UKhqMRrXD2gjDZArn/xZec5AOt87JUgLI/5EibHARv2F7oqdmk
	nwWhR/Q93/MaU1+WgIOdpvf3jfWPciAkTNFekZJgfl0Yw3coi0PHroY9Q3ScerRv7c+KkhK1s85
	liNLKAem8KQ8ePYbL1W9Dz6QoVlsrZfdHN+ii2XtHjCJmoy68Mt4IUnF/GXPFafh/uXpDxM5G88
	v2trDG/CFoA7feFuGRlnoNZ/Uc4JmmIMTqZf5axMwK7XInlyfVHHwUl7SJFaBTPvPigpv8j2Ctg
	V8zsKi7ieQRctoJp6UECRELPcq2k4sOz8uKvCH1R32mHaigiWDz/yPLiIkCGlMFIj2ccOBaE9U3
	pJEY7yei2fE4lniUJkBJsW39hrN/q6s7Nkm56YQ5AIeCt9UXqqedeZN3MqmXeB0HA3w==
X-Received: by 2002:a05:6000:2207:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-48e6e30406fmr21363979f8f.24.1793634407055;
        Mon, 02 Nov 2026 07:46:47 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e7a1d9d71sm14974051f8f.48.2026.11.02.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:46:46 -0800 (PST)
Date: Mon, 2 Nov 2026 18:46:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware
 sample
Message-ID: <auiwY5ReM-rqeG2I@stanley.mountain>
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
 <auihq9nm86d6D3MW@stanley.mountain>
 <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>

On Mon, Nov 02, 2026 at 08:49:58PM +0530, Kurmapu Sai Devansh Prasad wrote:
> ---
> Hello  Dan, thanks for the advice. I've attached the patch this time to avoid the Gmail formatting issues.
>  I also removed the extra commentary from the commit message.

This is userspace code so the original is fine.

Also you can't send patches as attachments.  There is a whole process
to sending v2 patches.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/


regards,
dan carpenter

