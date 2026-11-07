Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081222;
	b=UmTFrgjWqbhE821TCczw7Pq3hKV+hill+rI33GWLnSI8MANfm/yIePMCZD9GOfX9biAD
	 my3TmFWegq1hA2E28qOcjfd93OAildb+SKAH96NO9XWvINeazUIcTLLseu+bwIVGQnILL
	 2YRSTiQrNfnV+Dl99sITsJWlqGG4KkV+xgXoQojmDwbzOKp5CzedkRf67oYYy1QsppS+v
	 3EM23wFyS3JvuopkPACbPSCAlBxUEL/DUmyr8vXOjB4hkPfI6FJ63WZN71IgDQScM41xz
	 GlsRzW0hH/MWd+v2slfETjetT3rIQKdxag7Y+XHE7R18G4emOBpGof1ydA0Z+lPypcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=aDZ68c9QI8zugnRRjirZtU0A/GBNiwDPbLZHWfZlZRw=;
	b=n2BbPsgY3QlIzww1DvhyKbCJVqyMy3DvctyKqZkUZi5Qfi7uy6jL9CGB+JXdYjKmtH2b
	 EO484W4xDYFZkx5yWGoS55Bksxad2AD/CenLMsh+ko7EKgjTL67zZA1VnkNsiVFmxznv7
	 LuEhTqSf9b182HfadMIJjLzWa81d7DNLuQ4lZsA+Iy0Es6AiWlXovFLx4n/eqQwyMPgA8
	 xM1Q8Zc8ku3lGxespPzyKhs06BZ2YHG0hzdfSE5tNJb/n43VOW/V/KKBCOBV7znM/p9KY
	 BH8ZpeamYDRTPDkwRNqD+yc8x+mLNZreEBh2pczMPtIqHUjvFJlxJkF1BUui8qcMUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkvIjMIr;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19D606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E19D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkvIjMIr
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1802a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794081222; x=1794686022; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aDZ68c9QI8zugnRRjirZtU0A/GBNiwDPbLZHWfZlZRw=;
        b=wkvIjMIrogDMoWYdXmOlA0m2ERQp6Apu2EDVk3l6utD+jFd+Lh/6heMm8d2Vl4P2GO
         Fb//gs3EZ5+tKC6gqcGpI35P5tz4YxTxnlRxdHBinNVWuoy5CI1B70uiykPZpsjCPtdj
         A9M+TK4D5Jk3st+YO1jRLF1wPe38KqD0a08HjrJusVX/HjbzlrjMmMyQeVm2D/cpwINs
         NLE5t2eEqEn4bc5saN0SQs7Wt06rdRyyuq+RLg8XiAJT1kAZqg0EmyoHQ3asfczQK5Pq
         KsOlFtUSGmvCJyF4Gw66Uz33KgWrdFDC+FYk60/BOnpWpp/CglWF8QSGVGDTNk0OeUkv
         a4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794081222; x=1794686022;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDZ68c9QI8zugnRRjirZtU0A/GBNiwDPbLZHWfZlZRw=;
        b=h6XwDK3MgSc/4U1zPWCDrrZBGCVz3cFb7+fgkg6Fc+JsOBD+P+WGSX5PxC2b48rGqO
         J2YAOsunh/HbDwaiJQd840szf20Eq2LFyNfyf/gBqR3kjqfET2kZhGfF7xsFbESZsUbT
         Er8Ar2PSzVSKeq8b7eHj3iPWXl8UyTAu1P8cW6KQSPWhj7Ri4Bw4yeMKYWRVEcAsU73r
         Rc51FeVLL+cX15GTKB7i3zFUIeBMUHXQPfKobXAxHdp98zmRbJUQ3h1hQER6G+13J8nL
         IvKBONoKFwnm6WGcjpdg/iEMvQxRnUXDVRTjW2ltt+F3ENBFtNeZxH02Pbjpxm6R5H81
         X1Jg==
X-Forwarded-Encrypted: i=1; AL+hErH++WmddHfH+rrhWC5nm9ZnfublLvjTQ+L4ePQ8FrxWxQRUCNWW4FsR+uDa0S5La0/xqscb8qDYqFxXbQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sE+/a1eiIaocbjRJlSeflsAEPHcgrQhBdBRQgk1nCcofSq6Bk
	p7u10gLVsesrf/R85QTyBOlN1SVUfZfKQnTZEoMz4fMr2iSJnJN3CiGO
X-Gm-Gg: AYBFou1yQSZifvoZezM32q9ffQPp+QHnzl18iwaMvIn88GWjlH81IKeEl3Z6EMk4i5g
	vZIueTu2xxuAg1BoI7DKd35U+0Cev2tNdygd0M9HGE8PQ0x5H+oadgIvaohLJ90OQCyPo9uFLR8
	yl2SoOKX81vw2RM6GBbB56dTnHGHYfGQzvFjLTonV72IjdmbUQOY2729up4u5KTpOTy5LyNbqE+
	5CkLSis/z5VeLpC7P84RbLTaJ9HMSW17mGo5nDdpZbjeMmTDfX/dbGH9TS4k/gFt07tP0gW1zjk
	+e1WQNNQBLizhw3b/x1LnaMgQP4SVeaAz8J7frsT6fS+fEO/27br9F6muRBYFaDTkcvHtyr1MBb
	TDkoNOF1kYhOChBYzegYzlzbAqxKZ02+DZpxZckdxiOAz9fW7xKd6zlif33/Kuj3PwcDOZCFbTo
	uKq2g7YjOVkU9qaysVxX+WSZV0v7XE8nVX1C8YF+RhSo+dwchq1XI7oao2M4ES2l+Gj/jdCKRWa
	gbp0+/8841JZXQ+Iz7EJW5U+ABlnsC7nx4BrBYsUCou+Qr/v3X0mx9JtO0O62XvS7c31JoX0Fii
	u8hrlm5WN/gX6VdmWm+1sPgqdJZQFGLuBb7wYW5vIT4pDkI2ZdwPoC3yKs4I/z3fEbtEacjpcC6
	ODUZn6LiYkLlI9zMKGJ53FaAA1w8R4cTMWA==
X-Received: by 2002:a17:90b:554d:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b0db5edb73mr6825490a91.7.1794081221674;
        Sat, 07 Nov 2026 11:53:41 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b126385c62sm226598a91.8.2026.11.07.11.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 11:53:41 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 19:53:40 +0000
Message-Id: <DMP8PQQ4S8F9.15Q6N6B56KY39@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Reject writable map iterators on read-only and
 frozen maps
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "AdetsGithub" <adethyasrinivasan@outlook.com>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
In-Reply-To: <LO2P302MB0197FAF0305A94F7575CA700BC752@LO2P302MB0197.GBRP302.PROD.OUTLOOK.COM>
References: <LO2P302MB0197FAF0305A94F7575CA700BC752@LO2P302MB0197.GBRP302.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 07, 2026 at 06:14 AM AdetsGithub <adethyasrinivasan@outlook.com> wrote:
> The bpf_map_elem and bpf_sk_storage_map iterators pass the live element
> value (ctx->value) to the iterator program as a writable buffer
> (PTR_TO_BUF | PTR_MAYBE_NULL) for all non-percpu map types. Since

Way too long.
With CAP_BPF and CAP_PERFMON an iterator prog writes into a frozen
BPF_F_RDONLY_PROG array.
The verifier treats the content of such array as constants.
That's all that needs to be said.

check_map_load() doesn't exist.
bpftool map dump doesn't use iterators.

> Fixes: 8d0358f6e8b3 ("bpf: Keep iterator programs off special map fields")
> Fixes: d3cc2ab546ad ("bpf: Implement bpf iterator for array maps")
> Fixes: d6c4503cc296 ("bpf: Implement bpf iterator for hash maps")
> Fixes: 5ce6e77c7edf ("bpf: Implement bpf iterator for sock local storage map")

Wrong tags.
8d0358f6e8b3 only added a check.
sk_storage maps cannot have BPF_F_RDONLY_PROG.
Keep d3cc2ab546ad and d6c4503cc296. Drop the other two.
Don't add a5cbe05a6673 that bpf-ci proposed. In that commit
bpf_iter_check_map() returns -EINVAL for every map.


> B) Patched 7.4.0-rc1 -- writable iterator rejected with -EACCES on all phases:
>   ./test_progs -v -t frozen_rdonly_iter_write

Pls add a selftest as patch 2. Not this one. It fails on a fixed kernel.
dump_bpf_array_map() in progs/bpf_iter_bpf_array_map.c writes into
ctx->value. Attach it to an array with BPF_F_RDONLY_PROG, like
"attach_oob_write_iter" in test_bpf_sk_storage_map().
The attach succeeds today. With the fix it returns -EACCES.


> +	if ((map->map_flags & BPF_F_RDONLY_PROG) || READ_ONCE(map->frozen))
> +		return -EACCES;

bpf-ci is right.
BPF_MAP_FREEZE stops the writes from the syscall side only.
Progs can write into a frozen map.
See BPF_MAP_FREEZE in uapi/linux/bpf.h.
bpf_map_is_rdonly() needs BPF_F_RDONLY_PROG, so the flag alone closes
the hole. The flag never changes, so there is no race with map_freeze().
Drop the map->frozen part here and in the comment.

pw-bot: cr
