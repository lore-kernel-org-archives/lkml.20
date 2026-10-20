Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528072;
	b=wxFF8DFGioyJnXS7zdZLWyuscJBa8XZqc1WGHMAjs8k9gyg/kfniA3uFmg6uRHlnhs3m
	 Xx8qQBIJoTlH8GpscV+GO0JML4oqidD0YhcrT8QFYq3ZJyll1Mmy2/7RaXA/5CdXcbMDR
	 NfAXGDxGCdWKFbnSrf+akL9sQfL+52twF1B11T4xi5K+56pFRWYagux6sz51Z3d8Dw+Bx
	 aU3DGm71HIOkWze61p2xFOHOf9nfyb+KZUnYovTxekD6hUYlFU1wiWGFFp2ZtJP4mspBi
	 SrQhAqV5FSxhvkF46NSIB96ukMvbB/neSt5SKLQH/ufZ8tQ9p0FgJjQBgcNu3m6p5fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=j1azJ827J4napxY8pkAKVpOgDxEHSu+Tz2FVu6oeb9k=;
	b=QhH/dcekkxQBJcMmx2MwyusEB0Z2cSIFFMnQVhE7jq/01fh8KemIfCXHl//OIPnXTO2X
	 jOAZo4r3i+g9Y7M47E7XckFvvODSufXgAzomSok6H3AJREBfdWYcm777lDUmYil5eDQxm
	 06GYZCM6322OspCJ8anzg40Bt84sKnRA6NOZtD6hHuYhMOp5zubMjvcNX4UW2+kyKGZ5Q
	 wSVSKBdPJqSIqDJDezGkjvgYnNmgQLEa1WFpsdoApgU1axIvTnI+qYaqTpulId5IWqYk/
	 ScS9MO5ZA41YzRX+/JOgRLLDhlKmQRT7gM5/Tw0h3X3D/SixTel1kMcjx3vy9xBxjXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=B1b7AuxV;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FA1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=B1b7AuxV
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5350d9ea106so942061cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792528071; x=1793132871; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j1azJ827J4napxY8pkAKVpOgDxEHSu+Tz2FVu6oeb9k=;
        b=B1b7AuxVwOZ9otHwRxe150bvOC4s2T7c0Xx2cDRxW2SkBo7s9YLCe5WlFOKwczA4sP
         fvARxR5uiLfOFLHA6PeNc8I6D0TXye0f6rBcbgqTBWmY7AThtfA8p4uJgt/EL7iL6nJh
         ArFBs29ueub12pInvsVyeGCFHCYhPZhCP9OroLjzbVs8yJjIvHjEF/a5Swev1xSQP3mL
         MwRtb+Jc3+F3uwiQ2+nD0fZtmdriHTQjDsiI3CKZtcjRx1+lCb4MNCHOttOPl6QkF4LC
         VLjFNHzOdXdRx7eeghQvxg74iT7awWlYz/UUIV4U9S0B1CVibW0CDzn0clpjCht6q/q/
         BrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528071; x=1793132871;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1azJ827J4napxY8pkAKVpOgDxEHSu+Tz2FVu6oeb9k=;
        b=1Du/3+QVF14H1vNp+yE+2sNS4H5QjEn7Ljdyjh98hr7qvX2LWnVBO+Mai9Gq99gpZ3
         AxSBkW7lihPzensERVHjO0ynAcr8zgmogCj9iCmfO9TSsOgqNTPHQR2VQY2qhQAQiC9n
         eZ/r0greKfSraUdSfInaRd+maH+B8ak2g4sENE3BaTtKgvg+LUzUaSsFW8ltRJ2jqmSO
         LKP8yZ6UBgA6+5QuzwnvnLnKhxliOCc8CKQE2/ZggivNZZhSKZ/O9LzIPQHLnPErhE4n
         fEQbDbU2eNljvnFqbf2yWsFHZtOX8fXV9DpGd5vLqTmGGZiebSfOBZtIJT6t0RyLlCrm
         dC6A==
X-Forwarded-Encrypted: i=1; AKwUvBycj7ikAntvGdR+WyorMztQU44awfgueiyxhye0nFqmuh2PCzWZAz2NZRRS6nyQdf7yXKOHaYjtxSaJ+dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjLPqf0Eai7HFzIqMdDpWGOBOl1kokYO0C2i7vZ4mG8K/4ueqj
	qq/MvudWDJuZorUsA3vKwDmlaULOMMY+eqAPetUk+1zFnxYMJwpFEUj6oGNFZD3nqvM=
X-Gm-Gg: AYBFou12JQun3PDj8dn7IYNvyAt3i+yPrSc3925MGG1Dc/9U2WUr0hcKYmwqzVU1wG+
	OuZvh9EbNTt/vo0gosGyMFTnd2z/TwJiq7z8V0co1G6XZBFwCvzlFHrmYL3m/qgX55gUSZo7w2X
	OsD0FyUG7+i1f6RV8ULyMKNcd+uclOlucq47Slyea7IfKCX4DSNzzzfLBFlBvTG+44AWyJDVWmb
	bdpE/DBUiTiCIdm/Edn5uJYtH9RM5hjX5oZXTQuazwL9XfAzXHC53RgABFbiiPsxZa3gMrh4XHT
	dEXi06w4sii55tpQu7LKBhCE+GRudnPLcoH0qPFzO8oesfkH4PorR2uFlgZvs1YJ52q4TbxOtIy
	swe2ostVJEBnXBemJW0uoCbojYfqskgatMEuydR0fypA9wSUZOVo/ZhbZWv2idOP9GKTjnC5+bJ
	NQX8E1nkLStdiHK8AqAePaxDdQWVL7brWJY+oOQrDwdwooF2WBBheYpHE7UoEZf+M1kWN0+j0sp
	E60gq5RH5AzOkXUymfz6EFO0q6OZ0u7DmfT85RBpHtlgVKC4KNahbYIpVOIZY+oMM7uJJhg1hJr
	70IZZ7VzWecWNTQZB6P/He3OB6zTg1cVdQRCO+DmCqKjz80C
X-Received: by 2002:ac8:5d0e:0:b0:530:8853:1be5 with SMTP id d75a77b69052e-53645c32ef4mr200533381cf.10.1792528071192;
        Tue, 20 Oct 2026 13:27:51 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698bb8234sm4300751cf.24.2026.10.20.13.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:27:50 -0700 (PDT)
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
Subject: Re: [PATCH v2 2/5] mm/page_alloc: validate zonelist slots against
 concurrent rebuilds
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 liam@infradead.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, 
 mgorman@techsingularity.net, jiang.liu@huawei.com, Bessel.Wang@huawei.com, 
 stable@vger.kernel.org
In-Reply-To: <45ef34c7-eea5-4813-b54f-3e34675697b5@kernel.org>
References: <20261019172346.3344005-1-gourry@gourry.net>
 <20261019172346.3344005-3-gourry@gourry.net>
 <45ef34c7-eea5-4813-b54f-3e34675697b5@kernel.org>
Date: Tue, 20 Oct 2026 16:27:47 -0400
Message-Id: <179252806771.851873.10455974025763071382.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 17:22 +0200, Vlastimil Babka (SUSE) wrote:
> On 10/19/26 19:23, Gregory Price (Meta) wrote:
> Furthermore, since we have the zonelist_update_seq anyway, wouldn't it be
> better to use it to avoid these kinds of races rather than the more tricky
> way of relying on what exact updates in what order can derail the allocator
> side and trying to protect against those specifically?
> 

Sorry also meant to note that from my reading, zonelist_update_seq
presently only gets checked on failure, but maybe we could re-use it on
success?  Let me see.

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
