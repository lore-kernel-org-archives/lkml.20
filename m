Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299974;
	b=YAoSA+u4/sp78r/q2akF9C5fm73TcJ8TZkuCoCQnkxr6DNIY0nEbcPm9Imh6qvLwEvCf
	 Xv0ccwCo/DD3yYZ/32ktnCTyMG6XRqt35yvm6PCVtZCJP2IEvmHFR8rqfkP1oWy4zOYhs
	 vlSLKF3dtKBjCnkQwStRoc0Eb/KoRGCFl/Z5VNvdjAFvPRjZsO+S+v2VptC6Lb8JkZ/Zx
	 +rxiRVh2NN1vP+FrrkcQcLp2ya49SUaOyXpLABFmTzHSY2UWjSOQQDtct8Oc6Sv+nBdf9
	 DFrZXGmT77Y8pmNwTpTSO1zRUS+WUrtFvYw1xNOFmNeHFtvv20JLvJnXzKa2HxsE0lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=kPPto5KE/jC+RmkH+6jKlnfiz+VihZ+geh+WGRQD6SI=;
	b=Mh+apoVHmUYYhSYJMiX4VDUJXs7+tIw4bKTPbYTkSe/D9zMfFK4E3zUDLI7poMeMYmaj
	 vMRmnLnw6zGtOEOfdpEMQEAL+utt0pO3TqRYrNG8xdp+47bBh6fiVqupXhFbIGu/Uhay2
	 QESOEpBRqwc1HvZHS51RCQFm2f6Goesb/8dKb4VYu1zH0OFI2pvXO37p9VxRFfusUEXB1
	 vVOrbop49AaGjx9qBGRBhcP5RA3Ze1gbK0jMbeyp805YAU+D6RYBATxpCUkU0rYqN7FfR
	 Hpg1Tf6oVT62IX6NYS9J83Cs8kjNlH/Y3Fi+7qNLmhwXrTrsVsgcUCfG8LLK8ZbJn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lMrmUz7y;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBEE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADBEE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lMrmUz7y
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f259cdc86so218970385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793299972; x=1793904772; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPPto5KE/jC+RmkH+6jKlnfiz+VihZ+geh+WGRQD6SI=;
        b=lMrmUz7yU2gCaxrE6Tlp08lBtJycMw7QR89N+s8Gh4DQeVhh2wNVg+GuE70Y9h38FH
         eZrTs592WGpvWDm+bnoe9ciXhCXT36p46FjI26b6HVIBuFQgp7rploiFTHhHFXkwVxk/
         5ycamKJu399DQkZYY0D+ri91Snpk86YBGwEX6a5r27FtNNm4tdJxCoVRoy3gDBjuNikp
         KoYGZ4x3dMcKcFVFF4CrzXQEaU8UCcc/Adk7quY9agrv+gzpYo/P+bbL+bWdbjXjgSpW
         mxxYlmtunlW15eu8st/T6svu5TI14HKBc47I71tIAOTt18goNyaQJkgRRZOw8LMFOLUF
         sMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299972; x=1793904772;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPPto5KE/jC+RmkH+6jKlnfiz+VihZ+geh+WGRQD6SI=;
        b=2Wf86Zkin5dFIqMzaRqyfF1Kvuq6khCa1Tdmu7UfByG4oamvomIX/hmTkAS1W/thfS
         ODNsKSttzBu4KTgpVxMsEYlTxA3fnEKxNXTXsej3LGDPnM9XAQAvvR9CdZgcoVmTJAmZ
         ZIvpO6I07eFIQnBX2wZy0oGBUhPa/gf6IAfQm0cmWaka/n0WT8uC8LmPwfQaWd0De9cj
         uFBMK8V1rj253Eb62gg8hYxIeqqswhi+kLuZLmVhbOwTVwuZTEABgRDN1H6X983v32+4
         r/rwcUhCVMMMdPV61kJhB+EWCJ6njR6YhbALjkqn7W8ZRt7Qxo+u1SZBwXB7fmSa7KlC
         I0JA==
X-Forwarded-Encrypted: i=1; AKwUvByIt8cs1TnutMKpLwLZ7Ue7vVv5t65JfVPc7n9MRJNSLnB1OyAEplo/KDY9JxSk69Kmr432a/DcBS/nYww=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq2KRjjuy0QSfaOkYhjiut8aPhDnvIePhwxT340daNrAwVWV5h
	ayZcgwNMTyjVi1W1RMK3Y1DaId7OjBYWLoxb3bPV/0+ggDzC/le9WErctW9wkrOO+DI=
X-Gm-Gg: AYBFou1eZ9p/v872tyPOtAxC+ZAEorDHCQLJbrXVntBh5FVOXNqZ97gM36ha3bTvEkj
	FjkYQLRqM07Cr4kpvE4n1vc1Suq29+4CK7+fyTIb5EXxo4F53TAVsbDlC9qa988tgQ6mzbaj4Gp
	mq+VpWBr4jg+t4xtdZiY30ZJDdytlpICogHCWdVAUyJya+aM+CSLYZghqHueO0ikTYv16v3zC3Q
	XiDvH3BchTMF32RjKq33QXcQlNWf6hahBYnrv8NV2HE25cbV58MSTsvIeAJNuMxIok1Zl9JwIJi
	LeTbgGpWQWqdocykZ9MG4tM8YzIR3ce7WRsXF03PleM1CyFgBCcLXEuVak2lNAanHFMHr3O4mVm
	HnnfzlRjwJlKspplAvRwY3zRdxZgfBmcNv4n5vBaqVfqlyv13lmfQMndf3woYZNHj32kgjxXVX2
	iVnGaG4iA/rSyWdhGcfP4J6Fmc57eeAVpMj2d11LgQuWYVjlBOWUipz+fsWZQW4tA20nATPM6F4
	Btka5dxJb6x3R4WaawUmN80Jxzf6C8ePFYUXMbK0FFJVm22BDWo1ZEfcNk8kJZLi7SHq5uAbhPF
	wEAmHYyC0L0QhHDBwMHOyjWqfceYR/xvon2PQP7zO5jk73sFxcVvDy4+jN8NUfuLIZwsQr35XnK
	K
X-Received: by 2002:a05:620a:2686:b0:93f:5f83:2cbb with SMTP id af79cd13be357-94421581847mr21461385a.7.1793299972404;
        Thu, 29 Oct 2026 11:52:52 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31581acsm3343856d6.36.2026.10.29.11.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:52:52 -0700 (PDT)
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
Subject: Re: [PATCH v4 0/8] mm: fix allocator races with memory hotplug
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, 
 akpm@linux-foundation.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, ljs@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, 
 mgorman@techsingularity.net, anshuman.khandual@arm.com
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
Date: Thu, 29 Oct 2026 14:52:50 -0400
Message-Id: <179329997091.2127828.9582419476069377621.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 17:19 -0400, Gregory Price (Meta) wrote:
> Memory hotplug rebuilds zonelists in place while allocations walk them,
> and offlining an emptied zone frees pagesets the vmstat worker can still
> hold.  These eight fixes cover the walkers that crash, fail, or pick the
> wrong zone or node as a result.
>

Andrew/David - please don't pull this for now.

We're solving some cross-over between this series and Vlastimil's
set of fixes from anthropic:

https://lore.kernel.org/linux-mm/20261027-pgalloc-ai-hotfixes-v1-0-9c7d1aca801e@kernel.org/

Have discussed with Vlastimil, and i'm going to pull patches 4/9 and 5/9
from his series onto this series when i respin this for his updates.
That should keep the backport issues self-contained on this series.

-- 
~Gregory

