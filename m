Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794105628;
	b=ujBsV5wh8xCsfORZLX3KSIKBKobhaLYhuKNnEWURnQ6r/W0NRecr07e/2VSya5ZRmS91
	 DetvyFrErktbUwwCZ4v7V52eDv2DZ++08oMERW8w2riPYXO6MFTi1xsnn6o5vN6WNO5+u
	 nx7i1aG1Z37x42DkXiskzohZt0PIQvTtPcNU1s+jArnRRVcfvV8TaniqaQutI1N5htMUF
	 YClBuTHPuRZvIOQ0WSEKJKM8Pdx6jcgX8IKhJRg29br/tndpyiRtjJFteVShLZtrAB6b3
	 lDwOExRxpQcrKeybU1UwZ3MdX46o0zN0yJ69tsgi/DiN+CPM6YY1GKnD//cj4fQYC8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794105628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
	b=iMQa3hiMM99thJ7cY6E+FERfxd6292hOB9HlgQga4z0gS/JkNT6KIgGiZuVQblKMhsGc
	 cc3YOTlgM1T137yshmIScY0Z8SWDDiwi/oleIzaADI5y7l8B4Wvh4sE0tTA6HyrpCKD8B
	 MayvoiAHvPT+tbNMOS4sIb/8lD6Yf0Z3+ILvAjQvd4NXOnHRbnaphn2qLNiZ1hQa2OyNO
	 POgDCVNHNXGZjKhXmwFSUUmRZMBdZdPcU3AicRvp9PwFdKzQzzjCe1hSSgCUzQNW/iYJp
	 W4EWyo1tH2WzYrQdsQ+wyhvP9xD7mIpy+2tm7aVdpHgQttyp4e4Br5YySznhAz+j7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UXwIo/X0";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894DB606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXwIo/X0
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae18eb9b69so56166c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794105627; x=1794710427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
        b=UXwIo/X0nMEY8pSegQDtBBDEYOgg9buMlNfVpUCJaCPxyDBW4GKuSMiS2XCK+ywzep
         YLB+FEBPjeG0bpzVlVZjMHkwFPnHmvbNMfI/9AKQC7cDXrmyc22Dm2q1c0QBbHcovDJM
         c6TJ73vjHeeun2Op2KyYulh+TNEFpB58UO+7biqirYqdHGmbO+KDXbpOr9SiWBjvW2lZ
         +hfZ7CgxvpS1YkJIRXIz13FGfANie7uYVWLJWTpLaIV75vKq8eNHpF07P+Hr/z1w/H+W
         preiWv4kx455lOfOGj0+SIf+7MGQBF3kBa6Lb1UgmN7odrLkuXd+JN8FOYBXmF8RPEjI
         tYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794105627; x=1794710427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
        b=XF5QzA8DJ8BOqt8quIw06FGUSgY8YnfrZzxSo5pNW2VxOGD3LUwFvLjxWcdKteSNwL
         pr70D64Ie0qC7cLUelCf6fdttzCZ+sOPytZt5pASXktAie1rrNsapv2mzCc1Sl3CTZlP
         o9yJFcx5wTEwTSrj1NVTCdE1++/d0m5rImmNOn83tRSCS0qFntG6r+kkyG/pvSaqqxdL
         vLsZzP4Vfv5Dt/B9xdlQps9WISZJgGJw9kSAmD59HCKQoE+NR2pGiD2DUi6310g9kjgx
         dsK0kqOlnautEdXoPgOUWJUDwTid0kAWQhjIsR8VRxb5o5cMRuclmakVegcXWlZ7nt5p
         ljVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1evsJ6KV12gQo5kfkSfb0EMPlbUhtBFNzO6ved6WCat14fbxNQ9rKm1XwqyBy9At7iLDg3JcckTPV6IQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v0tmZUAUrDcTfWoCjBQqMi09VWZSbjNwPwdyUCAjk4Sj5Y/EU
	IK8ae2h0VGAkp+skKbJhuFkkQfu9uCfZ0sXTX8HGEQSQ2o3ZKl2oW2fu
X-Gm-Gg: AYBFou0OyRdZoDCKMr888z+w5Wf6PbdA6zpekCZ3UyS3kfkUPjmPRltOH8tqneQ6jOu
	JS0vkjmj0OtVBiCjdY6E7irSjtC7OQ1tL48eTMFVDboRatwzzI8ODpsBmNrcRj3Uou3tvZWhF9u
	GZA9HZoghFHhHdwdrBonez0xeGh7CEOerZEGQINDclYiEGPFOncTMe80NIA3K/NlOppzBx3J0ot
	2RQKngZaYm5c1e47eHL/BrSivShvJ6CyRqb5kzlkyUa5DpgXzdN95pejmAfN1cJ3zDNO7aZrCTV
	LDTBe8q+AZICz93I7ToVkwv9FN6+nYmU4Pg7kivFw+gD5WOSuINjY7fUzYyyJK3pf4ORUbwpz1p
	fao4fvMnywek8TYVqUdpuI/9B7xN//aSdE7YaygwRsoH2XMMrZYoI1lZPf89ogFBKND8WN1EbOU
	OhigzPlpSohu1e6F/OBfSEpiaMbVMOvMhFT50sEwR711E+fr6BBVsUfawLX5HXqH/1QA6IBbyCF
	V+VDs1F3HDrkFuv7vJ39oV/dI7BnfkgxEPEoSYExRXj76XgdXVEswwWIFV3fLpzLl7FK/VpVKWg
	zEkBbNmyJRzopZam9T/P
X-Received: by 2002:a05:7022:29b:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b39fec1c25mr452900c88.8.1794105627500;
        Sat, 07 Nov 2026 18:40:27 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771e5728sm2228842c88.16.2026.11.07.18.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:40:26 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Stefan Roesch <shr@devkernel.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/ksm: align smart scan skips with the scan number
Date: Sat,  7 Nov 2026 21:40:19 -0500
Message-ID: <20261108024019.1195186-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7df793d7-55dd-40db-8455-1f22bb44193c@kernel.org>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com> <20261107-bug-mm-ksm-smart-scan-align-skips-v3-1-16d5ce8b5fd6@gmail.com> <7df793d7-55dd-40db-8455-1f22bb44193c@kernel.org>
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

On 11/7/26 20:51, David Hildenbrand (Arm) wrote:
> On 11/7/26 17:57, Qiliang Yuan wrote:
>>                               before     after      after/before
>>   pairs merged (of 420)       361        420        116%
>>                               334        420        126%
>>   pages looked at per scan    1792       2048       114%
>>
> 
> Oh, I was wondering whether this should actually go to stable? Do you think the
> above is rather an extreme case, and most users won't really run into it that
> severely?

I don't think it is an extreme case, and the test above rather
understates it: it makes the second page of a pair mergeable while the
first one is still young. The age of an rmap_item only grows, and is not
reset when the page content changes, so on a long running system most
unmerged pages are past age 8 and each is looked at every ninth scan, on
a phase of its own.

To check that case, I let 1800 pairs of unique pages age for 32 scans,
with the second page of each pair made mergeable 1 to 9 scans after the
first, and then gave both pages of each pair the same new content:

  kernel           pairs merged after 16 / 32 / 256 scans
  before the fix    112 /  200 /  200
  with the fix     1666 / 1800 / 1800

Before the fix only the pairs whose phases match, one in nine, get
merged, and the others stay unmerged. Three more runs of 64 scans and
one with 128 scans of aging gave 200 and 1800 each time.

It is limited to content that is not in the stable tree yet, since KSM
pages are never skipped and later copies merge with them, and the cost
is memory that stays unmerged. With smart scan on by default since v6.7
and the fix being small, I'd lean towards stable.

I'll send a v4 in the next day or two, which also makes the new selftest
helpers treat a short read or write of smart_scan as an error, and can
add Cc: stable to patch 1 there if you agree.

-- 
Thanks,
Qiliang
