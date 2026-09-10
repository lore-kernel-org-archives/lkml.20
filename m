Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DFD471424
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039927; cv=none; b=pKv7aMGrWUeWjARpE0oM7fNUnPpnwlCz2UwABvU2Ac+gBmbDXVuGygtLsnhL16mRan88z1uKUubSiHcvTzHLVLeP8jwrAgSfUTh3uVcRybvVMt5plrVolpQO1E6wT1RSSg/BkOEgxtkQHAbeYw8RrLzWC03L9tfoh0rEN6vUiu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039927; c=relaxed/simple;
	bh=lJZi95WZB7yzdlKPvBofx8mF9bEAbVe5sXoFviCtnMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=ow4M+HoiOxdNfFcaT7A0OCXOlnFGrOEHit1jio/3qm992v8sw68sYSfSh17u3s7AIau29tpy5g4VKR1ptDEzuf4aSmhCcCNWoyU84nGagc7a6f1digEX+4WAxEZaK4SAhYE90T5VC5y5t7MEsmUsJdabsZvEiEpYQOixScyhFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSCSCPQ9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSCSCPQ9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so7748278b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039923; x=1789644723; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPKZJQlP21ww4LrqqKoCC3eq7Co68DwS+hHs4a+8eYc=;
        b=WSCSCPQ99WEhgSMG29hwUfvzAE3NRCZmk95Rkda+PLeIQkZanHPraZ0QjEZkVPgXPS
         vOnKwJ4Q/B8B9BSmuLSqIS+ASAkKLS4gTOH8hPU9RJkJEZ0SDhIU5fJnADChtiECHTSK
         +liJjWjepGcOfeYCe/BRUGnpGKCrPSuX2RYafwjSd3ZM7cAoS0psbumsut1OMxAveEvQ
         wzt0lUAfB51nUDw2UblJGPTHScLleSZIkQOux2U+XpR73R2FrFrZZuS2Z3tyE7YJ8QtY
         bPxNoWRGuKmYyxhzD44rBb39oWacp2TKBpbQow2nDSiIxfggRcsZh0MJFutUCXsSlL+4
         h0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039923; x=1789644723;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPKZJQlP21ww4LrqqKoCC3eq7Co68DwS+hHs4a+8eYc=;
        b=riY9VKkQiKjRoIR0W3tR2jUOIE69pk4LmXYbWkOK5EE+c2gPVOiFP2L/h2MHr8KKfz
         /ocZlbVJ8NqjQhS6qhaBXtQsRVI4Z17VgOZlkVzB8xoOTqFL3pZxEnpQ5yUEJNzOjbIY
         fXUhAjpSx9uTnk5b1uY+jRVUlhMGtAf6T7Z0c68V1xF0uj6eOdbsbO63oI553KBVmn4X
         qGwJT0+xVqC9T+dA9LQ0yyZa9obMG9hL04QBnun3gfsFSPGjw8nIlYM7hNlvxIbUSGG8
         Qy0RRJv3AFVJhZgWZ7B1XfrhLVnjjUUIZEiRvtC/3dd9GK1xRk+2CUltTLp95ldyhNAf
         I8CA==
X-Forwarded-Encrypted: i=1; AKwUvBxhy0ltYaOvr+9uJChX/KqvaPwkU2wlCK1NNTJzEKPdGlDIhIORyKdFzUcevsfHsFoPT5jF32SDAHL0YZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mjrFBzwPLIxrrVd5HRgfoCGvaV6p7eJ/6w5eThLYTo2rau8dGd
	F5w+WVsYssTFy3SstJHbU5XZK0B75eEAHaFyQKm6M9U9AlrkKF4yLxEa
X-Gm-Gg: AYBFou1+Q/db2Smbb6ew2dqVYhFQMuU/PrNgXBHOK+akWIEgfLQGp4QCJKkxkaYPq3k
	ihpYp14r1PqgzsPGIIyD1vRzJ+oTgU8efJAy9c0t+d/5gQlC/M+Fvz1t01pnI6uocmFdZ6WN2JN
	gmCEh6TYtaTwzMW+49nXRmWCO6sDwdO4eHixlPqL2XAjDd07Y2KxalDd0Fp6vggLPeRdW7+ohI/
	3WCqOJRgs6YPRW7vBlwD71g8zpvhVQERfG29XxsTjZBEOxjCVtRvnHLR3iXVaiMuRWE4BRYk/4K
	Gu76UY9p544zwFHWBud/KunJ/gKwWb8KZ6HDdjWZ6GD2lKYPCSSiXDrQ8vYB+LOusiIwJA5Kwgh
	mPiGhWBkxE6TxMdRQISBJDuNqfFEETCfuxc6+WwJDbPHi6zbIkv8oRj6wACTIhAah+OTg1TfH6D
	cQjtHigQUXhMQggG709n7muxUiofRRIVJ5mAb+prkTI9cxRv3mqKY5uJ9BZLqZd2QZqOU5rV1T5
	SrGpMbYeJSA2Mi0ZCGkQcHinG6RrrCgKWK8tKHR1kgeqKwPiaAmeBX/G3yrvEy5fqIc1MrWkRFh
	AeD2kH5YEBOXKLner2eAy3gSmeSMVwFMPUTz0oRFwu5+ujBbP2Ae/tdm3C1CbT/uuEESuToTXFH
	lxVHGml1E1hfodPrecJOS
X-Received: by 2002:a05:6a00:13a0:b0:86a:59ca:6cb6 with SMTP id d2e1a72fcca58-86a59ca7130mr2870537b3a.20.1789039922659;
        Thu, 10 Sep 2026 04:32:02 -0700 (PDT)
Received: from [127.0.1.1] ([43.227.225.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-869a5b727f6sm818032b3a.28.2026.09.10.04.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:32:02 -0700 (PDT)
From: Nikhil Ludder <nikhilljatt@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Emil Tsalapatis <linux-lists@etsalapatis.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, eddyz87@gmail.com,
 memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, horms@kernel.org, dsahern@gmail.com, hawk@kernel.org,
 razor@blackwall.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: fix reading neigh ha in bpf_fib_lookup()
In-Reply-To: <7f3e237e-ac5c-46af-ae21-8b437a099fe3@linux.dev>
References: <20260909024011.1252694-1-nikhilljatt@gmail.com>
 <CABFh=a7Z=heZODVsXwisY3VwULDy-Rq1hwO09exgX2d0-KzgUQ@mail.gmail.com>
 <178898653497.1776876.10402414041023036972@gmail.com>
 <7f3e237e-ac5c-46af-ae21-8b437a099fe3@linux.dev>
Date: Thu, 10 Sep 2026 17:01:52 +0530
Message-ID: <178903991209.1916825.3991149870565892141@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On 9/10/26 12:59 PM, Jiayuan Chen wrote:
> Yes, no deadlock.

Thanks for confirming.

> BTW, if an IPoIB device can show up here, dmac is already truncated
> today and the packet can't be forwarded anyway.
> Shouldn't we just reject addr_len != ETH_ALEN instead of open-coding
> the copy? Then you can use the native function instead.

You are right, and it is worse than just dmac: the line immediately
below copies dev->dev_addr into params->smac with a fixed ETH_ALEN and
no addr_len check either, so both addresses are already truncated for
such a device.  struct bpf_fib_lookup declares smac[6] and dmac[6], so
the helper is ethernet-only by contract and a non-ethernet nexthop is
already outside it.

I would rather not fold that into this patch though.  This one is a
race fix with Cc: stable and no behaviour change, whereas rejecting a
device that today returns a (garbage) success is uapi visible and does
not belong in a stable backport.  Would you be happy with the seqlock
fix as it stands, and a follow-up for bpf-next that rejects
addr_len != ETH_ALEN and covers smac as well?  I am happy to write it.

If so, which return code would you want for that?  None of the existing
BPF_FIB_LKUP_RET_* really fits: NO_NEIGH is untrue since the neighbour
is there, NOT_FWDED is vague, and adding a new BPF_FIB_LKUP_RET_* is
uapi, which is another reason to keep it out of this patch.

Thanks,
Nikhil
