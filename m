Received: from mail-yx2-f37.google.com (mail-yx2-f37.google.com [74.125.224.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E6468C15
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267422; cv=none; b=eeF/l4+mWfKM/R1r0TI6D61Y4aDWKCT/ESj2XzRq+mYN6R2tLdRCk+zlpG1XGeTj4T7T9GD2NZrj0VDYNfXH+9LkiTMNkT2slZdbmcZynjW/g9f6uHjB4NpcACyu1XaYt8s8NWUcVKKmVC/iF3M2EteBzBPPy8MdFav7qS6KTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267422; c=relaxed/simple;
	bh=73k6FJTz+3Iw7WPeGZfV2lzEAXI++hDZctysXJS34no=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=KH6uF2Plwfp/ZJro7tzN31fw62MVjxfi6nO7TjfBuuk+Wg51UumaXMIGhQv7b67pdvL1KOScAeXSGfZw5B1KEgFL1OlLVEXQUsOeylsgn57Mh+McZFxuNTpeNazusQnK1wEANDFNweC0t8M8qE/QTGRncmiVKqD7FhJVXb3DnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyjlpmaS; arc=none smtp.client-ip=74.125.224.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyjlpmaS"
Received: by mail-yx2-f37.google.com with SMTP id 00721157ae682-8a8288165fbso187287b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267419; x=1790872219; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73k6FJTz+3Iw7WPeGZfV2lzEAXI++hDZctysXJS34no=;
        b=MyjlpmaSfVZQNAS1iQcwXWJPsfpy2RfjDhajWZDPEVNcGMM5nHvxpkQH+fFsArSnBp
         iFC3MkOblYPubslzR+pKVDfdV5lEgX8rW/Ui1mP/p05uvLpGVEzaBbF3e54RFed/DWBd
         Nf87EdGwAZWHSx8M5CvwIWphvlHir6FLbO+H5dfQGUwh78iFqvk3NlojqXskjlSTVBY1
         PZOq24ZXokix0yvD1tNDismBsxIlOIf5KbTu2V1bFIvkcZOlUjpHnKcHzkcCpAHVrMTY
         k+gJi2pJE4MbwkDSe+gHxSPtEiwtwIzi8qr8GywZ4CMRT3DOezpp/TnfZsBcBHl9S1fZ
         lTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267419; x=1790872219;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73k6FJTz+3Iw7WPeGZfV2lzEAXI++hDZctysXJS34no=;
        b=xQ47tgD2qi7Abek3ZEpsXteBZPfrMoDC7kQhq3DNhXxlOrL/+W0hwoc/GBHd0ESnkZ
         LUgmm5kfsLVEga7IWrXRGlPIG9HyIqPuhoxLCKyXbpunq0Butcr2qchMN5FMehCg5MJj
         etYw7R1a+vi/uzD6t81dIwrFpZfN34w6pp1m4Xc8iT7UrwWGw3V45wjJbdcH1s6z1v8a
         m9UBXC+z6AdRJX7Sldw7L3UXepGvSVasDA5VxNjFsmjLw3v7YGT3dr8dqUUX1osBtYs+
         PaGQQi5iLcM2DhC4Yn/OOmMzOM98RSQEMlyHqjCAFOYS5yW5CWw6wwwJ0n7jxGvGFfIn
         bYVg==
X-Forwarded-Encrypted: i=1; AKwUvByhTpyL5kqZs08FOydBcxgoucj59Vq670RM1eUgWi7BIA8mSmCamKZQt5Sv8Gk/DCR/c5MbMUyNZH6Vtyc=@vger.kernel.org
X-Gm-Message-State: AFuF++kmpvl7JTgvRG1C5tqcs8HiodUCYXFyhiMFzwu1VnPNPbCxEn6I
	fONaaS4fPoLCnB51nskk6Ky5NwCdeJC6nWb+S657tETXcAHJ4I6ZgJR7
X-Gm-Gg: AYBFou1qLQCKJBy39UzJG5veAxoWt3X1MuT4TVHuDj5R0wFbQ3ZVXQU1flwjq39RYHK
	EtWpOCB57s50EOvEBLdgnYsGYhWGT9TSnRmNc2CFM0SJL2XIUDPtRSKAS2KPloV/dd7NJ5BWGZK
	MNkcYmuSjXfM178+RTQvRFVHTiKrjDS++2uXbKbHl0Bc7oehCkafhcXZa6qQYjthVwhdWNE3u4n
	xSiymjXWvLpBRNeA4ZvyqwKuIkJic/NWO0udtEb0DBzX8mkjWIapGbEgvWkE5mJ8VJctAqcdAYw
	SQOQfsrxSwskxKCB11q+95Whf6ARVfgrcb/uhax5JizbSc2wzqf638F8S1adLs0q27b1khAlRdm
	LMu0ntppQwGdh65z7icCEuwGgPb9cf0WiTS/ms1gIxCLly6QFmxr2bqJrjcSmtiC15J19p4Cs+P
	/JIyO2tcPyqWVhcgto8CPaRSB08XdRQqkPoOh9zzVYNY3nKI3g10ap1UtjL2oIQ5NYZ6KPGCfcZ
	pD4vFyvgsyJyizsrtS6AjnnY6AeU1m2OUIeMCeNSj7W2NBJCzKK4SJIrdBGrAurx/fuJ60K0O41
	34SJ
X-Received: by 2002:a05:690c:e3cb:b0:8a0:9ec0:e13b with SMTP id 00721157ae682-8a648ec5183mr21164237b3.17.1790267419358;
        Thu, 24 Sep 2026 09:30:19 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a6525dc675sm10883477b3.34.2026.09.24.09.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:30:18 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 16:30:16 +0000
Message-Id: <DLNOU1DBG2W4.1SHS4ZHDHYUM3@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Tejun Heo" <tj@kernel.org>, "David Vernet"
 <void@manifault.com>, "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min"
 <changwoo@igalia.com>, <sched-ext@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 3/3] sched_ext: Stop citing the x86 JIT for
 the cmask cmpxchg loop
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Puranjay Mohan" <puranjay@kernel.org>, <bpf@vger.kernel.org>
In-Reply-To: <20260924160354.531101-4-puranjay@kernel.org>
References: <20260924160354.531101-1-puranjay@kernel.org> <20260924160354.531101-4-puranjay@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 24, 2026 at 09:03 AM Puranjay Mohan <puranjay@kernel.org> wrote:
> - * x86 BPF JIT rejects BPF_OR | BPF_FETCH and BPF_AND | BPF_FETCH on arena
> - * pointers (see bpf_jit_supports_insn() in arch/x86/net/bpf_jit_comp.c). Only
> - * BPF_CMPXCHG / BPF_XCHG / BPF_ADD with FETCH are allowed. Implement
> - * test_and_{set,clear} and the atomic set/clear via a cmpxchg loop.
> + * Not every BPF JIT accepts BPF_OR | BPF_FETCH and BPF_AND | BPF_FETCH on
> + * arena pointers: arm64 without LSE rejects every arena read-modify-write
> + * atomic. Implement test_and_{set,clear} and the atomic set/clear via a
> + * cmpxchg loop so this works everywhere.

arm64 without LSE rejects BPF_CMPXCHG in arena too.
bpf_jit_supports_insn() there returns false for everything that
is not load_acq/store_rel, so the loop doesn't load on such cpu either.
riscv without Zacas is the other way around. It rejects arena cmpxchg
and accepts fetching and/or.
So the loop doesn't make it work everywhere.

After patch 1 can cmask_set/clear/test_and_set/test_and_clear
be __sync_fetch_and_or/and and CMASK_CAS_TRIES go away ?

pw-bot: cr
