Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BBE2E22B5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598250; cv=none; b=PPYqgzxMdd/9to9dGrthMr2Wif4ED5Kz4vpFw4wiAc8ZXwgiU2hzLnNzpJ92skgj7tfGFvwu6T9Gm7FoQEAUTlDd2yQHZ4q/g2PakTAa7OuD6kUgh8ZBY+s3KT/SATJGSNPCRZwIwglezUUCiBAO9Wc6dxo0AO/SNJ1gMdCP8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598250; c=relaxed/simple;
	bh=ymWANid+W9QAIfsP2B7dxOZPLHb025E1MmiiKZKG/Ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPoJ209fgkylUCpah4nXkEPCpjGat4q2uPET0//exq+xS2HBPnnDVH+tMDHRMYrG7vzUf4MjsE2+h8FWYDwo2IxRjYQu3c2PpGTnjUqMKsB1vC1Qm1CGLAJk9Vf4GN+5CATVsJe5SdOxBpBm0E50DmNbig3JTiNY2SuWq6f/0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ec395so27918791cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598248; x=1791203048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQP52bKkr7Y/wzuKqDsjuqgLw7VrjDizWZT0Wc7gkw4=;
        b=ziLklsMyrRLqnC2ivl2RLOFiaUR00nbkhIalUdMbbJHjnfhWnS6SdKuS9uz0FElUEI
         ZwYlroHuoOCdki1cxH1lYTzxVmgcivac24+1XVMO9KtynaLFfuIprg6HXGC5tLx02zzN
         nGrP2MM8ijeUL2WO0sKSJf0oBkwfTRExX17ALwdB3Hk5w1L3Votor36y/27tcRtYTPMV
         49nDXjm1WJTz98S0mAVyjhJi/JfK2Gjn+khyVj2nyhClgZWxipjU8KHvck1gvXlXcjN7
         GfqCj5yZUxCL/5R4p2h8LeC23ZvVklGHmgevzMSlPZHtgl7hqGErEavAL/lvTzV8p7M4
         jKhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy13s0k6zflkOxTdLyNgk+N/IsxB+qxA7OpH3BSr8Q5A6/wyDJwqm02M4si3FLuL6/10aTQ+6kBiEUd/7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mjh5yBoPdA+wv091Yla0XoHfTpzAxEPscIqLCKYc2TMIiZmcjZ
	3Nr3yO1oSGp7gjTIMXE51XrhGN6TuJlgfxnvDqBPwer+7K6wJMltdydxhlN1XJIP
X-Gm-Gg: AYBFou39kADyMtvsPYSXJDtzwBNdV4maXXF2nNXiK5qHhpI993NXWUbjvR6H82Am9GN
	o03o4I254W7emlbvr9zx471Ne3zYB41uh2qhhxEVUClNKQ77pOrX3jVXZeu4e3d1ZsG9JJGgNQi
	tJvmdCJgEBcBfXfz3nUOqM+5sjng4wmm2ZY6jmTAoC5Fe/j9pnbUMuu545Ss/526NVZeMYBo6Bj
	gXWSnonPUvuh6Fv8ZjneLqT6IzIiCQZQEE1UJfTatpcE2+wPn3eZ74Kjf19I517nAhyX6sAxpB/
	FJ09c8nXwk2Y9yhxG54qGUqxOdqBtjhqMVSwWXqJ/l+DIiMkIC+T2Ju7Zeb0JgTW0iagugoS+XJ
	fr4orJGGR+0zULGf+b8WLlFyTavNfOsetheTC2uGlQDGlrgy/dmXLA5X3c3SKC+RbDt12KZbtVD
	KwaJ0qqrfmFZOSDa0x1Av2gIuhcvCBpk6D0xX3AXDG4dtuB2VrE3Z3xs9QepcbPA2G0wPeoXDXF
	64d3u6RiHuucdKJ+gg85XMyBqmLtUZh6Rarlg==
X-Received: by 2002:a05:622a:c07:b0:533:39bc:efec with SMTP id d75a77b69052e-53339bcf3b3mr88562491cf.2.1790598247841;
        Mon, 28 Sep 2026 05:24:07 -0700 (PDT)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com. [74.125.230.204])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332238d545sm61186681cf.17.2026.09.28.05.24.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:24:07 -0700 (PDT)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so27918701cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8jBFn1PXxwbIFUXc40s4l7eIR6MzLdn3Sjf6qf6QhMRec/8eWNJ/IqA6j9IDeHkEwUZh5YqLYrUxT6mA=@vger.kernel.org
X-Received: by 2002:a05:6102:6883:b0:7a7:19aa:8a83 with SMTP id
 ada2fe7eead31-7af1ecf279bmr5070898137.30.1790597755270; Mon, 28 Sep 2026
 05:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927205501.672807-1-visitorckw@gmail.com>
In-Reply-To: <20260927205501.672807-1-visitorckw@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 14:15:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
X-Gm-Features: AclHuK85gzWq5IklKOwAQu80W0kMa7pFyTsMwsvdeVooaKjfbbGjxmEBQYgiP_k
Message-ID: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
Subject: Re: [PATCH v6] m68k, bpf: Add initial BPF JIT compiler support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, ast@kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com, andrii@kernel.org, 
	gerg@linux-m68k.org, rdunlap@infradead.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, marscheng@google.com, 
	eleanor15x@gmail.com, Daniel Palmer <daniel@thingy.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Kuwan-Wei,

On Sun, 27 Sept 2026 at 22:55, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> Add a BPF JIT compiler for the m68k architecture.
>
> The JIT generates m68k machine code targeting m68020+ processors and
> coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> and non-mmu coldfire processors, as it relies on 32-bit branch
> displacements (b<cc>.l) to handle large bpf programs.
>
> Tested with the test_bpf.ko:
> test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
>
> Tested-by: Daniel Palmer <daniel@thingy.jp>
> Co-developed-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes in v6:
> - Fix kconfig sort order for HAVE_EBPF_JIT.
> - Update eBPF-JIT/arch-support.txt

Thanks for the update!

Are any of the issues raised by the bpf-ci bot valid?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
