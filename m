Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793835525;
	b=UpNzQVI0OgEgihQDAZJfBk3jyHDKW3kFwZe04N+KJX/spMBD3Y9B0SAOliLd9Bybf0KL
	 EsC6eB2USeSngsUyecMy7FxQoFB/DGcsDGDF+vi4nmE/W6Ww1PB2zo5V3eZ7CkWu6+eR/
	 oVlmI6Rel1V+0U/KuSYxHQhyBuYz0Cn23w6XxuJqMFecTSTfw/9ZGZE8Fl8URI2W8XAFh
	 enFDxfOZj4m1ySKU1O6UIrl44nHU7Odj/1XriX6TK2RoVhlutWIN/RGuGgu13wbp6gfiH
	 tbkwzY0jfhZ9Zwankjv1IEXPFn0NBYftz7hsfvjlDUYVMXyM3WKPcBHFqbCYbzcEikw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
	b=Wbqf2EthlT8oli34YeGXZRIqhEvon8jFXFHUJ2JMC4E7zG0BtdFlaly3w8cTrSguQS2F
	 okIvCq54NWBsvMFZguIaKWpUjyWS9Zcnru4vxPVDx9vChfg+ZqrmdT1B1wfaj6Ba+OZa/
	 WR2Efom/IHjOqRiGoB+IGhYtFZMs62PbRqnWjr5FegudB4UzkASUEFIcFl4nMUkHr9hDf
	 vbNdwj0Em3VpXorippGgantLs/u5MiQ9iedkvTs3LeVUVW6WwWzoy2USn7kNsHD6JdZhG
	 LwIZ40FyBSfAC9a2nUunmx8EcldzAsUhnY9tidPq55ZVUcY++D/KJ8Rorn8Gwa1GTXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zw+iQKvo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFEF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFEF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zw+iQKvo
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d21051042so52009066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793835523; cv=none;
        d=google.com; s=arc-20260327;
        b=qH1Bh4AFP7WTj9QtlArrPgZWlYT+RUXqVL0DYF8yLyAtpG6aJwC9IXGZpryMEQXFTb
         lU0iqvz3M2SCpo9R0n7vJMeSFKMp4XLW7up0AsmBH/BNqrr3SNDexAAQCCkPZu9VgGPe
         ROnBdtX81Aq0AsiuU3yy3nuHW/Bw8kYB6k61GyiJJce+dxaawi2nFqwgIqIjHYZv9wNa
         RA2m2EVM1Zr5MXsL+qCvJ7loECcr/vgc85MZwWduwYx+LB3FpJuvBnU9vDyYR4hgJxPj
         ph4alpDfdLlxn3wajWUMjZDone8ppW5+ahy35KkyTekS579n6BB0OkTrhe9wvoh4U9jR
         m+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        fh=Z7zGTQITyIhxjjFLFENcmHRQPsh6pelJW5CfAN+uZ4U=;
        b=A1+nDhZ1gvjSVvK0JMvhzV7wD2DMCOVwvhZ3w7l7QDSMPY+H0Boc/L4ZHY8x+rjgT5
         Z/tjLhthUmTom/NMMpZAMePuQ87VOC8D3O23kYqLwNBvScatM/Pb7cme+7/4Nll6WD8Y
         /ktbP/QBBSWoWHM+vussYLXf3HU+XRvEf2Buiv/POgH37y6Zvw09Wgr04E9hLPywBkCj
         sJ2padQ70mBc8r3YZ3SrWKm9o13/B1rbHGdz0gjtJ3ilU9f0cjxW8fmX6OG7M/6UwXWH
         DmFYOg5iivxWIvo0ULLtzOKdJ1/7rcP0ARgWhdeZ1StMugdwwq+XpzeqpFI6tmw6sDBR
         rQbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793835523; x=1794440323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        b=Zw+iQKvo8Yf8fVczV1PDLI8KZfnE5zD0Cy6JTEk5mrT+ANTk+Lt+hMyZL8ZK+hzaa6
         bdqHCgHYrXD2YptQvLE7Xs4RdcioPm+8dTdjWrF0y1UvAcJHzjXYrzW35/rratZF8luu
         LR1Wfc1ZIZ6BPQyvDsP6kpM+hMcU+zgNW0NkUJ0rGRFONICywRUEtCAH52e9elPlgdZT
         dVEwy6CbhLCuH50RF2GvrCmQURfOLeWwNap7324DsLlv5ejmp38bYmN6gR3tU2IwBECa
         UbE20ltlRCZZhsZNjTY9YwNlfgCgHQwcVRFqXrQ2vprEK/KNndD8xQlhHD4A7AcNrgF1
         lkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835523; x=1794440323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        b=oV+y74SjuIGCHriFgO7+nRDquNTC31+cMAzfYmbN19SVCtFzLnDe5ZrPPQj+m1JIxS
         QEOyX09p40uiTlGEPcMHyiTKfSQcMzYQTmzvsWzWNguTxLpFR1+AAHhtvk3qtytTXKw/
         zaZHBwCDVMZsz46hR3Uya+U4Kzb3mgvj97W6wTBf5uH8tU8rapkXvihOfntAJ1CGIYdY
         j/CNjcsXQtsM/3o9SLdxccU6A/j+Rdu/Dkfa6NleKDg8Jsp823eMTdlOmBqo+yVHJ9wd
         NKzJ7LphGhlM/hUTnEA3a1DVwxXsu/uEpLqfFUjR0isBkP5FRJ0Ndr58TNEoVd8IE3W4
         iQnw==
X-Forwarded-Encrypted: i=1; AKwUvBw9ykehgDZIWkju+zs5dq4fuo7LosXltnNlvnA11Xe7LpkDhR3mGcj/pViOO18/P1O/1beGp6bHY2DPadk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7CDJ3TLxGW8ClSIldI8v7Xc8mGDvReSiAg/8DxxUMQ2SWItjD
	Lsg5D/ZBv/sYFFbLNw7q8GKTWpJsGlaGpTHpTeJIGvpsaHbLZ21h22NhVzBuIqyyuCTyHPYsNMB
	7M4oV5ukGkQyEUG7gQMytMerO1bbPaQZ5j15y/eVF
X-Gm-Gg: AYBFou2M1jI3lpX9rwRO59NVrgj1s7BddchRWrOs6k8djoztVz4BhjBCZi30Q0e9zXj
	2J0y/rK5D+/YsgtelAxXxlBzQLCcVv108gWG2kkndq5USMQSYHMyvtEJLJJKozSy0fMRtjoyQYV
	zh3M7Nk7hWqtlj2XWx/BiFAPmYXTQfJ3zLB2kvGqPFzLMnV6E8DTFABmKpyCmQtB+juPOk2pnOg
	LEGVd9sZ4fFBBgd7lkhV4+pqZN+4Nvx3YQyNBi7xhVfYm6Oz9lN6g+4MOl1hu7DWvB1jV8F0gT7
	eUHu4aDBkAeKkBVc5pezTc5NC88VcEJminzZImEzsSdu26RsYBDcWklP+ELuUtDtUP2XuQcd9o2
	9fwZCrdN/RYY75luqE+94L103OE266xLQd4fY6A==
X-Received: by 2002:a17:907:9615:b0:c2e:893:7010 with SMTP id
 a640c23a62f3a-c4ca7ab1105mr1606291066b.37.1793835523294; Wed, 04 Nov 2026
 15:38:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com> <20261103010216.3447716-9-dmatlack@google.com>
 <2vxza4nok0ji.fsf@kernel.org>
In-Reply-To: <2vxza4nok0ji.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 4 Nov 2026 15:38:16 -0800
X-Gm-Features: AclHuK8g0SSTWzLAJK32VMTa5tPkJ4SYKSZ2JyPLhAu2cuQYk5IO7KP3qYgSUkY
Message-ID: <CALzav=cjq0FjSRe_KHns4sGpHtspVy-5DBdo6Kzg1TdQa1z9FQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files that
 are still linked
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:46=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
> I usually spawn a subagent with clean context and a high level descriptio=
n
> of the goal to review the changes and changelogs, to clean up these
> things, and then of course review everything manually.

This is a very good suggestion. I'll do this for all my patches in the
future. Thanks!
