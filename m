Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556139;
	b=yE4w5aLSMMY6KG6pnft8g/4Dyxa0nYhzeM+IBsz/hiqFHkQVkiEUxr+Emk7t9KDDLQhu
	 fj/uEamNB7WDCS6G6Tr2584jgX7YfQisYZPnrF+dkJeI/PBZLSu8EjOAmX51uSBcnKrFt
	 Y6qF/mFF1nZxnpGz4E4/6Rn2F0e4PxA2a4vpf/bbwB2vdOwj9RYF7KHhjKnUmnZ6hD9Xj
	 9p3OwkPlkuL+ApGX8gmYcEG/KyaViMLSs/wnuLHXAUgNphzx5ilDgP+MRhrtUzMd2pmUK
	 Smy72n43eeCYdNCFkLpxFEASQhIEmddr+MWW2KCqhiI7azpd6x8CFiuamTwOWK9T1qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=FREPCHqd32BxvTRibj2ezyei+u70OcF5BBJs2hCkKaA=;
	b=SwsshHwpyUNCrD+xynXsROpjtJQ2mr9PAcobaFoDawRbsTqdCMMG5y8Q8YMFz8dNz6bx
	 EGyprecByTrICK2/AGGa16uUaouki8/mrtC6K10ktA9K4HfFWD61PKzsKvwcWDe0HGoIT
	 eoNZtJdg9LwiW2KlrT7iLtsDC7AAzOhJ/ABd6KRVeN3/iNsVOmFPiMXxYwNkwIU7/phGv
	 d9XrFRDhYyrDHyxhGlMHrU13TGcjJMXu+EihLLClA718bq6uS2yVWHmUc8gNiMMZxvT8m
	 Jxs9CgP5weoeZa3OoJCbNfACwTwE3pWCkl3RH0KqeO3p17I+EN/F89ub5Ze2tOjL5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slcgMxp8;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41083606A332
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41083606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slcgMxp8
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1194968a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556138; x=1794160938; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FREPCHqd32BxvTRibj2ezyei+u70OcF5BBJs2hCkKaA=;
        b=slcgMxp8RCYEydkkdc3y20upQDeN8khLNYu7y3Nh8Q7/AOFw7WfOqjqtV9/H9j4gyx
         x33+sn4dxMuLkHJRVhs1BHMRmx5o9BqnZHTdzKKTdObJdURiF7AmcWHf+zoO3Qrei1vq
         z26pjR/Zkg74S2vOxlDF6j8pbcqQitmI1PeIXcC3dDwLuIuyULuvB5MvuNI79FzBbWt1
         TSy9iPNq13w3pAuTygLC6mLgBbFQ1vqJAOG0R1iZknuTS7J2qwNiGGN2Q4GCOt4yVIWg
         h72GjTOXlKO+JWXRwo2qs+v4vRwDWUkeRxxHCdq+YsfG1ofPac30PNmC1X5laJ+UHTB+
         4weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556138; x=1794160938;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FREPCHqd32BxvTRibj2ezyei+u70OcF5BBJs2hCkKaA=;
        b=ADofM9garClgzDUYFzXfOn0WYS6DAOxmAHQXElpeiyXnkKQhYN0aKDtx4VAVeKFAah
         xcRsZFKZHGr+yZRMc1nxoYwC1c9dzNI2yAjWIXMg/VW6T9RvRpBX37vDuPRxuQvK0K85
         T3YIFCy1CL8ciIyavs+4qUCRSaPi5eh/oyF7AXCYBVAM7O3ercnHaM8k4HJVKxhUy/PX
         amOhDNjGBfpgxSrfbjztUtPLcS2PzgIMedj7GT+faTMrXwFxCIrRKLtGY7DQoNvHJoAo
         eho3aIbwRsoVbKtGHcLyE9PNH30zIC4x2XQpbXebXzyqOX+VsfR71X/VRg8FBWr+Ykpy
         fcqw==
X-Forwarded-Encrypted: i=1; AKwUvBzJR2QWqyirK+ddlrC5m+zwX6muATGuWifa6Z24z/vLTG/J19oAgRGqnz1EFTqm9KR9/2es8pUwQMb000U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sq3Vre6+DiX//zjrvk1kCVofjPMk0xnwZfea2ZUkeMZDqwOf8
	okj5/ur7zCjtST3tGne9tjb+SlskTwSYd1b/6vKEwlq0nzPeBcpK2/4t
X-Gm-Gg: AYBFou3DwUbZuNJunwDVF8E0Ta903RWZCP1ZapI8kx8arwU/kCGZFt1y6yKOcKDCS9c
	xVnE3ztek+3P7HJssesbRDwh4xjwBTiD0r5q1Cs1sSTwog8Jo7xSFRBuOa6PnhqpV1J/4VHeEND
	4qTAo0bi98fPw7dRHsjQni0IH9TJiSDKetSSUc4fUCOJhdrom2LpGl1ppOVtFOvOIgDSqSAqyE+
	8YNbiTSUKnJC+a+fo9vDIgUQb1zPsAACEKCvZqGBk31UwVRRlY69P5z2l6AO0mo1hZulSzFhZns
	l0eZ442ydHyhcTSWBNUD4G/ndBlhhV20n7nurVxtVmFqNCvDYNMKfPKw/jJfDwlHPVHREniRifV
	xl1kI4o08uY6TuE1q9XTiABhjOf4kvNBgghu7LJYzs9WqsLQvmOE5AfVGjqtsNba7umXSVbefh0
	p4fd/PFoSXkqGZ6W3KIYuYPKBsmzWY0xPu+V7TJ4OCmtH90gAbmViA8JmeRUBhahzfwtpe5y0kH
	nmxNcM+DY8bQQK0YHmlLozPRaihWi5nvZc14ehGMF/FN+bCurFO6o6iKk3Vg+CB3Zujl/lqDhqJ
	y3cf7kClmXcr52nkkpkEU4VHU1N27GQDoSQmbaLQAhh6X6NJ8m2LKtiQpF/xyxqnbdjcqBzjxhI
	eJaK7rbIpsLTApUA+zaGq3HJHZVPBDWrHOQ==
X-Received: by 2002:a17:90b:2891:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3ae897ab44emr6085932a91.44.1793556138558;
        Sun, 01 Nov 2026 10:02:18 -0800 (PST)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm15660646a91.1.2026.11.01.10.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 10:02:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 18:02:16 +0000
Message-Id: <DMK2L6ELL4W5.24CXTMXFDKA3P@gmail.com>
Cc: =?utf-8?q?=E6=B4=9B?= <wanghai8081@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "Alan
 Maguire" <alan.maguire@oracle.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] libbpf: Fix stale raw data after
 btf__relocate()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261101155615.324501-1-jiayuan.chen@linux.dev>
References: <20261101155615.324501-1-jiayuan.chen@linux.dev>
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

On Sun, Nov 01, 2026 at 07:56 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> Call btf_ensure_modifiable() first, like other BTF mutators do, so the
> cache is invalidated.

btf_parse_elf() calls btf__relocate() for every module with .BTF.base.
That BTF is read-only. types_data points into raw_data, so raw_data is
not a cache there. Only raw_data_swapped can be stale.
With this patch that path changes:

                    today                 with the patch
  types             rewritten in place    copied
  strings           as-is                 copied and hashed into strset
  named_start_id    kept                  0, lookup by name is linear
  has_hdr_extra     relocates             -EOPNOTSUPP

The last row: btf__parse_split() of a module with new header fields fails.
Ihor removes the same side effect from btf__find_str():
https://lore.kernel.org/bpf/20261030233355.1836749-2-ihor.solodrai@linux.dev/

can we drop only the copies ?
The kernel calls btf_check_sorted() after btf_relocate() too.

Something like this (not even compile tested):

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index d2ff6f5..d67f78d 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -2033,7 +2033,8 @@ struct btf *btf__load_from_kernel_by_id(__u32 id)

 static void btf_invalidate_raw_data(struct btf *btf)
 {
-	if (btf->raw_data)
+	/* types_data and strs_data of read-only BTF point into raw_data */
+	if (btf->raw_data && btf_is_modifiable(btf))
 		btf_free_raw_data(btf);
 	if (btf->raw_data_swapped) {
 		free(btf->raw_data_swapped);
@@ -2099,11 +2100,11 @@ static int btf_ensure_modifiable(struct btf *btf)
 	if (!btf->base_btf && btf->hdr.str_len == 1)
 		btf->strs_deduped = true;

+	btf->modifiable = true;
+
 	/* invalidate raw_data representation */
 	btf_invalidate_raw_data(btf);

-	btf->modifiable = true;
-
 	return 0;

 err_out:
@@ -6642,8 +6643,12 @@ int btf__relocate(struct btf *btf, const struct btf *base_btf)
 {
 	int err = btf_relocate(btf, base_btf, NULL, NULL);

-	if (!err)
+	/* types are rewritten in place, some of them even on error */
+	btf_invalidate_raw_data(btf);
+	if (!err) {
 		btf->owns_base = false;
+		btf_check_sorted(btf);
+	}
 	return libbpf_err(err);
 }


Also pls target bpf-next. The selftest is contrived.

pw-bot: cr
