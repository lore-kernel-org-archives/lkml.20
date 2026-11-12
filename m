Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504173;
	b=fm08jT0C6c3WYkG129O/Tg78JrtazDp8OrQFOrkVPoq6a39P7TQDjhjO1uQdzBbyvtq/
	 YLuls+HST3ElztvL8EWFdeuchLEG2KOUQ0AIxvYq25OPHQQztiZqlUFROMP20AIpeO/nI
	 OgQeNfyuvippG+L52Ne2rXVti8lr2DHNZa+l7hs0jve5S5WTMzSOA5Jd3c4mWJFFiqVhw
	 aQArk6YLwcqTH60zItCOF/YDmjnGuwmuJiDxn7y/a8CRRPP3ty3zcDxnA7F6UHnsY32mt
	 0t7qfP4mxWao6504y7YaQxzg4UpoD/uuOluyo1VU1OHrwUA/ijGSaseIWGL05vNaycw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=a/JRN/xbf7qsdPvNLlS8GtXasJ+TiojxhhjDTwn3xLY=;
	b=QXMFvdEX9SkpGVYj16D5dkHVN0Dm9tEApPU08YtxaOMAgKZEmStaDtTSz5/dvUdsna8H
	 OFk2VLdu312SE9guBnVDu/GIJxpUk5IBZnwjWHRffZnY4US4D2jm9elwUlgP0xKpV0CyX
	 StCKK4ehfQJADlj+DXGSjLbHDnKlz2JwOT9jb96cT23gR9OVtQPwz7dckC9yAv7c/BVm1
	 XGd23gfAhVxZ9rfAXi6TVY50tlH4q/G/oELRvDTB83FRA+wnXQ+UVE/h5Xrd0v5GmeRb2
	 tY/C0e7RMBSUUpS1RX+UafmqtTLEh9apTUaCI4xpwi+Mp6M5SphRhdP4rtynz39hlTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vEiLisOe;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E48606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E48606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vEiLisOe
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53bb57f1310so49810861cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794504171; x=1795108971; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a/JRN/xbf7qsdPvNLlS8GtXasJ+TiojxhhjDTwn3xLY=;
        b=vEiLisOeATJcgaH8HupEr6TgVwYoVfRhOc5WUsJ97Fr/YmUk7miXmTYVniih//0XKg
         QHLJ2ZMK8tqd1Et7ZG+N4Jh0PE0NAP0DMFsTfjohOPnRbNbx5wCi9MJf7GlbX3zGC5bi
         aLUK0quGQJOUi6k1xd8x7SWJKtq9f5WXsAvqMv5Jofuab5LSwieefdRRSscAfGpRNImR
         sbdLr+gv9jGDWpKHzo1kNv1TRF4RDoecODqqKyKYyyViG6EOhcR5hf9KcsCEy5o/DAVl
         SjKv8MglBVhq4lTjIWfDKL+t0qDr6AR+DnZiNsQlHWG3G4GChP1hcSnl0JNtqLZQikII
         00Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504171; x=1795108971;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/JRN/xbf7qsdPvNLlS8GtXasJ+TiojxhhjDTwn3xLY=;
        b=AnDKvXEjPaghZKlXdQcRbjxfD0UbIoLB2yXLLAp1PMZ0gNQ5Tzz0pP1cI7YI/NnBdT
         fqTzmoLSqxnth9MHbR60FAIN3P9StLnkqZcsU0AEj2TkkcUuglIEfjRKEFyxancpLxL0
         X0L2sYf6AIgJTkBjKWBJiVNZignDog4MQ8O0FFHnnjkReGjkgGGp/1oxFf7Hq7u+BKNK
         fAWSwFw3zyVVdhIwJnqFZeGXNCeq8eEJ+qUm9GmqbtxU3SfcuZtNgFq7d7QXhB+c1tbL
         8euYd2G7dNdUdZQWCOeooTT+inyt65yaVWeEoyWzXb0jzGl9/ImfKSIAJYcmDl5doEYb
         sltQ==
X-Forwarded-Encrypted: i=1; AL+hErGAYp1TcV6/WNb5INdBfKoqvED5fgkFvHR0mghyMIp0cb1tAoj06lZsYZ4kI6opz5+JmN0geJczYyreVsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IBOW9l/at8FAhfhKiMdGLulIXqlK/A6/egqAsb03uNJNCJR9l
	hyXiF1E5XaXtJi88TXJnND6sWo+CY78JAi2zp1G5pbBdP3En/0uDa5GTJMMhDGyBPU8=
X-Gm-Gg: AYBFou1EqLHw0NGzDMhmt4zHiaQZLgdycK8k2qXxb4cTCj79gpjU8AbfKH+i1BjoREG
	ERQPL5lcGnKSFJ05EOZGcut6mHnkYLxmDbWmafG0aCy9lnpilkcOKStYMlQ4vh28NxqcECN4+x1
	Vo2G21KRSPxsfaldRe8HCdj3os1KGJ4d1H4bRDCaKH0Mp8V1UR6N96JOkbvsz8kKSl91vROHbxX
	6BZMXOlL16KtA/4LtXvTu2LC1oEq/Ra67JgW82uVhfrP4df7mMtpg3j7LJ1KK9K/aIPJjN6GxEG
	m1/VKqoZpS4eivemQ7b7L098PZAvcs6Y9kGgbz0v146QtkLZCSfBi3aABlsBH9TndXbFBzj7GvO
	8Unj+strFQxgftJYH6zB09P3vzV4cK/dZvC0J/zv/uygiMx+1z1P9P3nFTj5oijccud6Vo0LXaM
	LAnTezOxaVjxjdFhSFZ1+nIEXsEMFJ/uU1cZEydcpDLatPQk2VFz7lk3HO8GiaQAk2+i7TsPK88
	hhJ2K1lYD0spwNCZ6oaxTbajIQ6cJenojG/1gEubhedlfN85PdT8JN3RhtgibeOBnGl7b3YSw6J
	crLrEWdO45yMRK7ZP56XxW9R0LFnHl0GB8KDYlkV5KRqGxyxWCmlHhdyvmVhdoC/n7yn4yON34E
	IE6bwXaM=
X-Received: by 2002:a05:622a:180e:b0:536:64a3:aaca with SMTP id d75a77b69052e-55ac8e955b4mr521501cf.62.1794504171329;
        Thu, 12 Nov 2026 09:22:51 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d93f10sm542436d6.30.2026.11.12.09.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:22:50 -0800 (PST)
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
Subject: Re: [PATCH 08/13] mm/migrate_device: fix ksmd oops on a migrated
 KSM page
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, 
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-8-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-8-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 12:22:49 -0500
Message-Id: <179450416941.482102.7238369347030508170.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> After a KSM page is migrated to device private memory, ksmd can oops,
> and KSM then stops until reboot. A process that maps the page can also
> loop in page faults when it next accesses the page.
> 
> The problem arises because KSM doesn't know not to try to look at device
> private memory that does not exist in the direct map.
> 
> Disallow this from happening by explicitly testing for this scenario in
> __migrate_device_pages().
> 
> Fixes: a5430dda8a3a ("mm/migrate: support un-addressable ZONE_DEVICE page in migration")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: tweak commit message, comment ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reproduced and tested the fix.  I validated in the base kernel that
a migration could succeed and after this patch it cannot.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

