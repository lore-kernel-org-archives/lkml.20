Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361721;
	b=zn39t23iz4xINhy+7boeM0cLU8g22ZiRVdc9GHrA0R3KbTh6DLausYuHLMnqWW9UGzem
	 ZzRpRgdlcXEJBKjA3mRxoNAgA8UfCvFWtJRB6no/sUBiHWPOGbNPSvpnWuPQM88wYfpw+
	 QAPtjMuiAAPqYgcHDQ9mVmBYt1CwC4EdczIWLfT2Vt22cMhkTnzbK6E3+myX2cKlRTKGT
	 o341Ht5EdolZ1qdJd9WG7cLt8X2iQKKpggZi9dK02xLik3UzRBHJM5yqLgGl9CQ7KqQcL
	 Bk60iV8v41rHovrHV8khLFcoBRLdzFCA/Itvbs557TtsIjjeziD1q5H+SZohd5HJ9Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=f2RcHe64LeB/gnyTEhJrBfe4ypF50Xcw5AhrrNUhpVI=;
	b=LeKI/BNEZ4xvzFOM3sNV0zXqIfO0OaROSznGvxtKnRFqgL2OuLGxoymHtOEiiBJQ2ymY
	 tFCcI5lebP3jdv46ghkLLsViVU6b4nCTm/zJu1iJwRqqQtyhlVZa+0CJv9K/TC1xN8lzU
	 FYkHDK8rZZ28rfD/g+IkUBBr6d28clSWs3+EloLr7ZXPsJ0tlKwxn6hUgidw8mESMJ4cT
	 eM5WIVHH4vUTFFHgwr1tgOWbyGN3GBqDWmRttJv+BYHCus7AvmnwzF4ZEHvsGgf+NkwDN
	 wTfc6TLdK87FM1jzhkWXjmQeyzyotBGnxmghz8ukyc9pVNQ9t7+/TxIiQpfN6GO3Keg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QpvXFC4q;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDD3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QpvXFC4q
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so3008434eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361720; x=1794966520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2RcHe64LeB/gnyTEhJrBfe4ypF50Xcw5AhrrNUhpVI=;
        b=QpvXFC4qN5QJ0p8bI9c4XT2xJMP9QqQnJRrb0+E/4FPOEtQGqIfdwyAgZzZxp3+Qd2
         FMYtqpTjXuJAv7hM5VrDk0oByO4JH83W4qEkAk4lhzJr0y/qFfPhb8DorPMstZwwLw9E
         w61I9WaiAaxGBAokVOV8TmRg8wzzQuekBMpLbmACyn/bbxt5pfN9e5sEkS4drpyAjcvx
         wm5BNfYHeyHleflpj16Tw0cgsr+1RQOPs7sfyUkPesdAftEpm1lDeuaoFEgsSad9LGVG
         y1JzZTlGKsz58h/un9DcNxBRjfB4or4dJpX4dvd9qoI320is2XHFOJ40+/hfk3QDcelm
         MxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361720; x=1794966520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2RcHe64LeB/gnyTEhJrBfe4ypF50Xcw5AhrrNUhpVI=;
        b=QTZTcg88WVj5EXBEhRzsmIsSMxXJLy3uN+dDFl8TQ5K1lzHKZIpTJSAwx+Bf6TDKmW
         nGTvYJ5bq/nsOzUA4POlaN/dc8x1MUmf7ZLjfbqdidCXhKmU2iaSiKP57j6BAQXjK5jI
         LyzKSgkmv9rjUp31iLpLSPx270Kx8yiCt6uArwpbmrhTG53GK1AbRPsHzPENB0vhu5wv
         tcv8uDHI6Zk1mB4Mfu15t2PAyZkrY14cjYBuNCxklfN3uFzziIp0tIg07OvaBERHxqb7
         U+uzMTuRRbUMXs5G91xCWGbQ+tbIYBgEf5rKTTQdHidZSuChe3BIGur/pyFipDmNuWz2
         fhOg==
X-Forwarded-Encrypted: i=1; AL+hErEKbNzsAq0yJ5UfScpG5Ol3Hc4+IYnqjvrA9Uc9utAyjgEljwDVL6D3+zpIGGwv7+T6hokKvna8/eCSL3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k9LG0JGPkLcyv3QYnc5SPQhLShupycie6KJ1x55im0db05LYd
	kA2fddvUTQc7EjcZ059BW+4HZEkMrpqzbKTkRioSFW4K3h6Q8tRPLk+z
X-Gm-Gg: AYBFou1aIQ421wCbIoN8CSetxSFtrv2NUs8bT5CvDV0l8bIcRtTqExkmEagS/tGdULk
	E6GCwzbvwfhYhOfqGik/82m4KFaR1lUx1A4ntTrMOGSLHm2ih8XEAPxkcRAtfq+4bfVSXwYTlzM
	3D6hLDu+iyViyJj4D0dx8SQpVi/uND7Cq/fq5msXeiYqlWRRtOLRv187+4LIbBseGTSs/NC4kAS
	eoyPqHY8epo3QgTKIGlb3R2A6HHfhonECL8TiiHhOXMmypqboivTfqfRI9xIChhuejfJz7gkh4a
	mMG1M9e2x6k8PIYbK0yXFpzJ1hlO5IbM9wMi9j4BkJt2PuH49AQHgIFUTBWzpeZaIRNd6OEi7Ta
	B8UGq5Y45Kw+4qvbx4co/+VNA3XG4xbPHG90Pt66CkPalx+UwHZuFg3oKXc7MYv39YOdLwYi6Qe
	uBGtz11tP2y4Oq3VF25uHAKccrDKZqIebC0u40jwMrDYrFDOakztIrmBa+VZnlGVX0igiPgwyjw
	1cxjbYtJLvaGgSX2eGiIQSr+CK8fj8yxDzHwhqal9lsqkegc2ZLc6gIg1GT2VwcgjIwDKR8pl3B
	sI1qfcBbkK477FARe6773XoanrIQuFlWi6s5GQBz7ABukEQ=
X-Received: by 2002:a05:7301:e22:b0:36a:37:1404 with SMTP id 5a478bee46e88-37686d2fcd4mr1959136eec.13.1794361719645;
        Tue, 10 Nov 2026 17:48:39 -0800 (PST)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm11902533eec.24.2026.11.10.17.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:48:39 -0800 (PST)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hui Zhu <hui.zhu@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Yu Zhao <yuzhao@google.com>,
	Kairui Song <kasong@tencent.com>,
	Hui Zhu <zhuhui@kylinos.cn>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
Date: Wed, 11 Nov 2026 09:48:33 +0800
Message-Id: <20261111014833.2661236-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGsJ_4ybXskWKDLHkeeuVGirGaaZ8TdPEDX+xQXZcYmPMSjS=A@mail.gmail.com>
References: <CAGsJ_4ybXskWKDLHkeeuVGirGaaZ8TdPEDX+xQXZcYmPMSjS=A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 9, 2026 at 1:08 PM Barry Song <baohua@kernel.org> wrote:
> However, real-world workload data would be helpful
> to demonstrate the actual performance impact and make
> the case more convincing.
>
> The patch itself makes a lot of sense in theory, though.
>
> I'll arrange some tests with Android workloads and report
> back once the data is available. If Hui already has some
> data, it would be great if he could share it as well.

Tested on a Xiaomi phone (android16-6.12 GKI with this fix backported,
MGLRU enabled). The workload launches and scrolls 26 common apps for
5 rounds; each run produces ~7-9M MADV_FREE pages. 3 runs per kernel,
same system image, same sequence (fresh boot, then back-to-back), only
the kernel differs:

                            without fix   with fix
  workingset_refault_file      44.7M        29.0M   (-35%)
  pgmajfault                   13.9M         9.0M   (-35%)
  pgsteal (kswapd+direct)     100.9M        75.6M   (-25%)
  cold launch (avg)           2436ms       2034ms   (-17%)

Without the fix, lazyfree folios keep their stale refs/PG_workingset
and get protected instead of evicted. Since they sit on the file LRU,
page cache is reclaimed in their place, which shows up as more file
refaults and major faults.

Tested-by: Bo Zhang <zhangbo56@xiaomi.com>
