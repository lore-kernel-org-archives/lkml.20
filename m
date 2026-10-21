Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792541784;
	b=0k2CDLd+nEDr3ifyeEbC/1pUqsozYT/TGRTUVBf4JRHRm+zHwf6rxR3GRf+lDOKnjH7q
	 zomLMmpq5LkntC6BxYoyz0pN62nKu95m9j+JUQvQZXvLKWessqO39aKWH3y0t3q0oHdX1
	 b595SRt1OURZLKZ9vyOnz0z8zxhMR+t1MP3yKnizSP3MEuXqg3dzBjJKwHZ6OufOFrrmb
	 KhVg0dSHWOKhp2SWwMcBGOWium3uSUzgaNKVHyCcyKOMq3amqMZJxaDMwrcxUkGZKUyCm
	 +IEtdcB++kBfc0/WtmavcIWuZincwNQU2GRgkjB/TJuQiRA/UeHfI8vg5Gbz6y1xBKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
	b=lR5txQ6g05LSTvMP7ytpWadNBN5e7npJT3vts7x5ngKiWWKswIIf0JdA1SZv1fjykpCK
	 G8/yu/mgFbFqCjWN7uic9YJDeO/qrF7SFfZYbImqz/SkSW/S6BFAWw6MDbXV11BbQ0jXl
	 JCIBQjUQlFEByr29TX9K/X+mbTjPVhs5WKGUawr6RB5vU5TtGXEGMmRE4LnfXvRxwvrGF
	 YyAtiH2idhELxZuD5Dq6SNbK1xXbUteibZivMIXdacVLltOs7f7+JuKctODQkTTTyDQa6
	 0X6+sbqZyU8xjQfI/9r9dxtCvyVIkeQIcxEJFh1nQPO+0pd77hR7nWU2U1QcehiFspA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j1laCVTL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E7606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587E7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j1laCVTL
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8acda240937so1582487b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:16:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792541783; cv=none;
        d=google.com; s=arc-20260327;
        b=PLqLnRuBlekqoBXjiqkleXaZNRMQqF1KUHVNolhFQIEBhFIHkDEYNJ5v7tb6etamSR
         pCpkUnKImeLmN04t7OR1xCz0rTw/i/Lad292LcEXNe1q7jpyDQvIyN8ohLveVo8/5eup
         ip/ZSqWTHupZJYP2/T1fxWeVfbXt8c0YWQMlWHW7p3nqdKQ5JAnEU7Co7Se77SeNpsZr
         jSksgqxxSKn7af+2K/897UoTiLmuEj0FY7BcrXIZr1Ks9KjRVTn7LXtkmlftifXBibgM
         /BHuxjW2UV5HZ2vPDwWwXSX2Q+tHB30pxvcv/IV+8QRbVjily2Bhw1+NWYokiXl27Xqe
         30cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
        fh=0fryV3Z8t2SvBmSegWYy1sg4ypuFoVeDF8EiNmjrrH8=;
        b=mDx+BZjihvUm9E8F2eGn1juxfYA+o9DU/GEdt2KKKs4Z8JZrJu2/dsQY8Y8sGDSL39
         XcEZg8tiLf1+9v/mt7eoAQKqcVLsUXH0snp57bTx1pZEcCFklV2NoKfz0EFjPYJy1Bdy
         2asq6n22gsHxLD5hwvnveK36eJj8W6PpSl8/B14eVVJ124ib6Qql5yO/YDDB12w7febu
         zp7qHYXIvdi3MoLDRjvh5DKGvtiKaHFF4JvFomDY8yFWjBy91GW98dWnHq7o2UpwsVrf
         aEXR9m5UN92suiNeT+fFUaMoNrBefcrWxtkjP2fr+3zELLbTTa603vbvV+TAC8jDvkjj
         JOew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541783; x=1793146583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
        b=j1laCVTL3txBPYjWWVpjMIQ2W6tC6XgY1+TRm+wL33VlkQbBtqK8U7eyHWJBWr0ZTC
         PkqKCrkqaA/NjCIYOCiDEoru2HXRs6UQv6hZ/RazF3rEYzZuTyOpoHT1dyeizutAMBNf
         t/J4PRb+Tb03cJsc/ZIn2j7ZcYVn+g0v0QErf9Cb0V1ioCd54BwWkxiKI5cSu+fY56tp
         ZXtD8eqwlrmtIigiiFGvEwHk2mAp3USp44VwQisPJ/AGz4np8T1iyCUuuVmyvdvUmBog
         fS9JwiS7jsfQGtpenWyZOyzzGB7g2PnyQoi1qj1lrC2WRatcz2F3vbgY4iVvMMWPEpsE
         2/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541783; x=1793146583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
        b=acSiokqAZ9VOt502APqY14L2+5dKU2wowaZuV4TH+AI8O/yVXAkc0ZyN16l2DFrQhg
         DN9TOzR0GgH2T9iYJPDXGMKH855wQLg7sH69/4c3vObjHAy7Ng+gPIKuRc847/zUQ+Z7
         9AQlYNVyG5JuxbsQpUrM25PY1I5t1GZ7Nx4pgIV5FvkT8KGIc/x4QZryf8ZzmxiqpM5V
         0siSL8Pc0m2VUGzfhFQ7yXYVI9PQXueJOB4a4awmEuF2uxWhyDNvKOfICJsdh1IcvoZy
         rG9x6G5Cx6oQqN9BoY2dkT3W9+8XhXj1W9fVd0a9JOZ5wcoZY5/P25/FlDg5a6Kh7JlM
         XTiw==
X-Forwarded-Encrypted: i=1; AKwUvBwI16LBxYSLlDZNW8Z/Rn5+Q3OO1XQPNGc6r515pUduQzPOoO2fPSNLO5JYOFKhVOam97XCvZPIX1Prjzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/03x91WkV4rEiECuu2wxvjuuAiPakzFATLM5SqhZyoHjOqal9
	nEYfhc2vLfejSmUNi57XyKF4CK1p23UMuir+f5aWVfnHCDAV21j9A+qF+0nsrD1nW/bviby9x2W
	8G3etYrXzBrkqAWBtJRB04fIHWZnzFwg=
X-Gm-Gg: AYBFou2k/kX+SL6nk2JCXz/1wd+4iHy6O7xecA0r+7XMjV/t1I4MXj33l6jrGC5XqvC
	IDbrERBbhOv9rnNLskCe9CfLiraxlYVLDkeQX7iC55gJ7BtU89OL91j6/frO4b5YokjEozWtOdl
	7f1scvzip4XOXG6MYb97EzgzcllEXoPe/nXQ8WW+XpREBcti6742HbBCjXexoyamWZiS7AixLCC
	Eyw/Dxidj+FkYAhtFL6pBqgNaBP3rOA3qEn9A7jx9HhNrJAwd5Pwt48KqWSy3hLkzYrzxvi6BhG
	B2H6qP1PVnqC644KqGQ/uqtEx01inImtnfPO1DdkFPY5gHf9xEfi6/x/3QY1SSEEQuYDOLhbx/w
	k82DSuDpZv+d+tVTlC81rQMelm51AfDhCu/qiBJOuVHtmY358F5MzEZ1DjI/UpAGE18KjCg==
X-Received: by 2002:a05:690c:660c:b0:8b1:ce5:be42 with SMTP id
 00721157ae682-8b133fe3435mr2771807b3.28.1792541783308; Tue, 20 Oct 2026
 17:16:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013181932.1739238-1-listout@listout.xyz>
In-Reply-To: <20261013181932.1739238-1-listout@listout.xyz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Oct 2026 17:16:10 -0700
X-Gm-Features: AclHuK_gZWAJUCU0Ubmw8jXYAFhpzdlBus0Vb1Ad3mAeDSuigAmuyURzHqelNUE
Message-ID: <CAADnVQJ5s1MaFhFQ7Djz0a_ABumiEs9NKCCmGAbkeE8TfuZNZA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/2] selftests/bpf: Add tests for memcg kfuncs
To: Brahmajit Das <listout@listout.xyz>
Cc: bpf <bpf@vger.kernel.org>, bdas@suse.de, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	JP Kobryn <jp.kobryn@linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:19=E2=80=AFAM <listout@listout.xyz> wrote:
>
> From: Brahmajit Das <bdas@suse.de>
>
> bpf_get_root_mem_cgroup(), bpf_mem_cgroup_usage(),
> bpf_mem_cgroup_memory_events() and bpf_proactive_reclaim() have no
> selftest coverage. Patch 2 adds a memcg_kfuncs test for them, plus
> verifier tests for their acquire/release, NULL and program type rules.

I don't think we need to test them.

pw-bot: cr
