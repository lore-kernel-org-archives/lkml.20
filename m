Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371220;
	b=4KK2ZXl2QibTQwkqsKYQwurizIu+9txShiHSIrB+OqEFyMO7QY3zaLMAUGRVmFbN2h0h
	 V5PqldtaSgdYtscYX5dh0jIWJCWUPyMe8vub7bwgMrDA9wn9tHhtU+n2Yjt4q40EP3RhW
	 LOaXMH4YJBBk0J53+NFcys66iMZ2oZeA6Ilvz5oBG9dm6567a5CEYaD4Zm5QfZJFVWIRL
	 lgWty0NxEcRJXnFIUUn2pGt6DyPmbBCtadg1DyZeBgkOW8cNmC754ZikBlTA6WTBhlgJT
	 T+744FQw597gwHceVA+PeA3tj52XiBC//Zoy0KbPPssdyyG/s8jX7zXAgs8XF+tZHtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y1pY2f18oXgCvPBL0khHJZDCXmLtKWWVDmpFe3/LPR8=;
	b=CHE/lDSXrkGi5XI6j9emN0RjyCx0mkBDg9h+xt79u6I4mdSBg0WIPSTJ2inNVrVtisFx
	 IxlBRF9NfGF8ikx9CgMFOj7ouaQ6FF2D/lJrkjRqtEsPgJEsUT6p7EGa1gsZE2ZGBSK05
	 A0SEMgaPQETSq0fQU9UCzGpOqA9F0wu4myQx5wQsnhV8LscaUEmeBMVh/j1fv17Ni+vnI
	 LXMO83AyMkMB3+E8X+4wmYpU7OBn3skfJnK+N7QYJnRbG0ttunASsmroqoVQ0dJbStBTp
	 ySVTb2pf/Cpfbok6rr7A1WpHYKNW4itvCHBMM3aasFtI9pcgrEbO9PQkkRqkosqKU0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bwtt81yh;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A4960A2622
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A4960A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bwtt81yh
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so4341233c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371219; x=1794976019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1pY2f18oXgCvPBL0khHJZDCXmLtKWWVDmpFe3/LPR8=;
        b=Bwtt81yhvu0wEfGoBjy9Y5Oqf2BwoAh5Iqn0G/PMSPK0uYBx9oZtLjka60IG0pe2Z5
         sV6wCLpyVe0J5I3hux8QBV3gl8DhE/erxeo9tiTwGtMbBPQ88qWVwCBNQ5TOhRGFqlQW
         2Cykqk49Lu/d0fM3PMrg6x6YA3YY1X+lYfSZgSuGbCFzJio3RhljwE+iEXPWamGHD9n3
         2UdtpDL/AqZ9pj9YVK5o6/KC8+lNqSQctnYl7X4nrlNgGCKPvUa8/a+Dr3kKzMNUrHQQ
         gZ/HUE1AAx9Rs6Eu/PWPcUZh7d7WtYukRlfiK2LfEaUpVIZq/7dp4wu1zzp257vIAylT
         7tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371219; x=1794976019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1pY2f18oXgCvPBL0khHJZDCXmLtKWWVDmpFe3/LPR8=;
        b=XLFEb9xkzIRZQwYdpFHwuJfKlXmy74VW533P8x2F4136Solt4BTaDrELQAlPig90mv
         c7TUuoFG4Ky7nKQs4yO6d/20DJmWaaBMqKqfpe8DFafJ4YHoOPSib91CWJSwDuWCV1o0
         bTLtdezJEhboVytcGh4T4uFOd8NIu61A7jz0x0+iMQmPh6/Bm3b5rN4xnXwovmdQMa5k
         S+8uz3LlCWLPsqW5GoHCM2Xo+iYbyfSaqfZdjco4nryTKa3WiPrS8JtAAR1c/CMlhPkQ
         gx3uLTyzUzMB0Lcvi1AM5XLxFJEhqohbIqizALXOUhWVCXVGmem+JanHHg7rxjo6aFwo
         Eqxw==
X-Forwarded-Encrypted: i=1; AL+hErE0QyGMXpNnUx/nLeio30aZWJYW/1we0fgpCOs+QLkoRYvt2vST/eFu6WXcZ1jZlU+RD3faT19c2YGdrFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tOZJpX7c7LhSKPvpPtFyA35el5au7yo24IIkH44Wcm36IJS4a
	Z46fQ7K6Joe+AmHcBUwGDt6gy1obF0/Vd4dn5fapEC+zckCIjmmgvHAZ
X-Gm-Gg: AYBFou02KmbOjCUIoV1inV8ojhqfiL6rLckSTZP+ZD6ob6AwRa15C0pSssocI61zEAg
	m/a4uPjNX3JrX39kq9zFKePZMRkEy58uxTOywEtNrh5uYL7eVNHwnYdU2wgXywv9Q3kkHqUZBAU
	ZTsmv7X17r6RHVxKbq+D0VWPCs4gVhyi9teGIu0GX8VkeBKHde8uW+LhUswK/3/BJw9Skqb4lWj
	UUU0Mpefb/pgTBdNATeFvvq6VTqE/xgRtAhBRy81Dihh888fbgXKWRKaEwiVBA08gXs5qeDUp68
	DV3VzIU1JOGZs+9iVb1Go9PumgqGB1DTQCSa8wvAwJbOROfznFj7R1ikLfWBUC1UQGb6g8W49vu
	K//zZfZ9+blLmVt1Kr0kXa0ACmU6GR0yfczW+xi5XEL5K9qBkXJgGrdCqSH06eoMETfITx3r8+1
	+LjTRMJdhDmq9hd15AoSvDKvyPCuq//Chc437wKmSvfhrKRStnzJcZnEDQ8MCsEhb0iEXR1VIuC
	MTwJRX9/EYr55wQ1bnnQ6gsTOLgryhDIXsTUc+lmbteus+VDtPM4Bv0j404GWJPNuyQVVEojeiz
	/i5uBIeiFKERA2RyxKOwX3VX7xtni3dmnmJcqZJhhuTdylakldTwOYA2KSHqSSu/lw==
X-Received: by 2002:a05:701b:2302:b0:1b3:a26b:8b97 with SMTP id a92af1059eb24-1b3c0353171mr1289026c88.41.1794371219170;
        Tue, 10 Nov 2026 20:26:59 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11563252c88.2.2026.11.10.20.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:58 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: jack@suse.cz
Cc: akpm@linux-foundation.org,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	fujunjie1@qq.com,
	vishal.moola@gmail.com,
	roman.gushchin@linux.dev,
	tracekotae@gmail.com
Subject: Re: [PATCH] mm/filemap: restart mmap readahead on sequential faults after many misses
Date: Wed, 11 Nov 2026 04:26:39 +0000
Message-ID: <20261111042639.191997-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <jwg2p4bjzkacnx6fkifkb5jbe7ah6btuecpcpulbkym6e23v6x@mh35p6yafmqi>
References: <20261105192517.228523-1-tracekotae@gmail.com> <20261109091444.128521-1-gopalmalaviya53@gmail.com> <jwg2p4bjzkacnx6fkifkb5jbe7ah6btuecpcpulbkym6e23v6x@mh35p6yafmqi>
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

On Tue 10-11-26 14:53:14, Jan Kara wrote:
> I think this [1] looks like a nicer solution to your problem.
>
> [1] https://lore.kernel.org/all/20261109-mmap-miss-v1-1-8b44b33f3358@it.uu.se/

Agreed, it is simpler. I am dropping this patch, so the v2 I mentioned
will not come. I have tested Alireza's patch with the reproducer from
Trace's report and replied in his thread.
