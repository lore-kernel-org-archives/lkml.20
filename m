Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686207;
	b=p9fsEzwsP2bQsC19eeAwG9eDzii88BogghfHj5fex6TSAUn+4Q9T3Q5jvuNyiKUljlWy
	 YOWygpKSv5C/EOfMP2y7p1+e5+ZdOr4Gq6B+FF5kpvYPT6zVVPpZeHgZkyryR/fA9wWou
	 qvxQPEofseUvjj007Z/0AqiZIYNuV5OccSl/kwK9s0MqjEbH9/v99XGVBNX5y6uVC93Q2
	 l+vWaIUYzBVj+5FRrDA/CkP8y+SKf0U9haxCl7G4kArUiaGx1E2LoTTd7Eo3bq0mSlnX3
	 vf8UxBpAchRpyJ68c1ZcT4rcrei71X6KJ22EYKBlvdMt4X3BNagqSl1wpSsn9WT2ALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=p2FvWA6CWZEDhvwtscmjEDIo0Dx+bIAbYiK0/cRgf1A=;
	b=pa1QlUsRHesBj0azdBPKD9Pa0/ygSBYQPgPDyCNQateufJ4cmaY9zm5stgd7Onu1zu6U
	 19EgtGvhXaxZTkILtYFaxs0nQb3o4mU+lNHOruhCtubaSVbqnFQAUaJIvzjhp0T5HN5yP
	 Sl34PISo94iD16Zrdok2S9BM/B4M6EWTBhgVcsL6P0RCuSgpoAgGVXpzcaf/1jDvyQQQz
	 WQVnsnMH+jk57bdGYoKSNEbuXXQN58jKfT4Ft1sn1oqG0gQz84EHpEqQjFdpPUEEEyhIm
	 MmMmot/QU07RCJXlY/UklOEnms5DhD7vId+CW6NYQePIbpmF0zapftgoouHAHDKUKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="LDM/h6MO";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F67B606A883
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F67B606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=LDM/h6MO
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2168847a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686206; x=1795291006; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2FvWA6CWZEDhvwtscmjEDIo0Dx+bIAbYiK0/cRgf1A=;
        b=LDM/h6MOiHEX7xFKKsejdh1WkOA2YmMpAl3w3H/gpPvZkvUmcKi83r/TD7OH7qRVQx
         t3gQtx4/UqonZxRhdQhnsdqPX0K2Aemih7kxpmpFq4GkeOPU17M2qXE+VkBcrcCYV8fj
         h2A/FJCTmVyu4uzm0xehrNHDwFPjY3taClT3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686206; x=1795291006;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2FvWA6CWZEDhvwtscmjEDIo0Dx+bIAbYiK0/cRgf1A=;
        b=ABaGRI8Umv7iuBShrDVFi1Ff4LmCR8oIQEdeT05Hbxu7gO75Yp0fehtuHie1HD9UsC
         5Bozb85UFlVYxka2sMzMu004BHInzZmdHE0N7jkpeemlg8EAEXQVnmDKDKWptp0KDdwZ
         auW3yKWp4phPBuGuA4AFPkHvsyBLee5lHAN3BvpqclpKhMxIt1ei0fgw/8DzGzYxXMJU
         IhvFXxloFVv+GR8yNwCs6HsrYRn+ZiTVR49dg2WPOMNmRcI79wAwjEOZ5j2Ys3DDsfRF
         K5vmapluFHZa9R1BstLK9EejIJhG9l1qB6zrgaAYReDPMzJ/KAErTv5toueDsShaskGm
         8CPA==
X-Forwarded-Encrypted: i=1; AL+hErGDyZZ7Dhgzt4ZgExWeUfZvImdiaZ4omGwFt8zoQ7EgKhc9tGKQlaWFXWDCVipM6dcV9oS3Da8rn0Oamv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+aZPGXh84FrOIqm7CpB5ugZdDsqpBxzwUO8Ly5UEueokcjSiY
	d1OOPyjKpQFzcS1rWyqwv1/VST6OVLUsuBT85mJRgagnHugQHTBFa5QNvXWfCBnZFwQ=
X-Gm-Gg: AYBFou0WFnwlNK+hIphN/CiyxmzXxDBdtMhZ4pmMSIRQRhw1v+0KvpDxf/ms1SKt6+V
	E7OmeGC92V21ZpEtzHmAV6qGk2nIHzEt95Hp5EG6TXQ37WIGCxm+S6L51kjw8Gtnbq8wTgK19lT
	rXV6790jGirkfyVTFdUv863eFmea6EjM0LExCPo+1eqM9TO4RYsmPb0tTL3IdsWmu4KZEnYZJ00
	M00W19+NZIYvbFDQxkrNlsGGBnUEOBYnpiutJQ9HPmWIOf/PMZaPbOg36L+19xK0sr1T70tVRvc
	3tui3ILrd7OTTY42GJSB0TnUb524tL4RH8VB0AxrsPBagTWO5CDkEBT9U8HjYBrW7wdZDZ5/lXJ
	rIZa0TfRKy//0US3B3dhgGrGw2Y7CQZfwxy8Vl5c/Wq0yWEFdLm798QTk/sMl2rEBYQbeZvSoXK
	+Zrbb61HjJ4GjmBQ2uCcX8S6TVKVDmmx1zKbezmDk0SkR7Melw7snikoBXASgTycVMsWrYrkKhb
	7jCbdPZvyvtZhOH2UgPmCGMmXXMpB/Jky+4gPjoyUlZEHxBCRqQue33yhCTeYjvUgc0V+xZt8l/
	ims6S42zKd+DOdHBVlIcCrKPGituxwMboWBk/S8OXl30MwDUQeb/OYajwTWgu0sJCgdc6zS+Rai
	49jGY/C4h9kzeAEnE7ayckvOqiDfmivkY/4Uh4SaUjKIHvfB+NvWzHpXM7+nGdCL5LcH3UKR5QO
	p2LhrQWmNO5ztwsWo3UkABwvySj38pSnmTfyuvgFxkeswS7fBX2EXEvPSw
X-Received: by 2002:a17:90b:2803:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3b1b0ba1693mr6466266a91.28.1794686206120;
        Sat, 14 Nov 2026 11:56:46 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm14613174a91.13.2026.11.14.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:56:45 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:43 -0800
From: Chris Down <chris@chrisdown.name>
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
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
	=?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 04/13] mm/migrate_device: allocate THP deferred split
	heads
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-4-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-4-50a2ed382b61@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114115643.a6727abe20ff6cd1@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Thanks! I've tested this by migrating into an empty PMD in a new memcg,
faulting the THP back and partially unmapping it, and the warning from
lock_list_lru_of_memcg() is gone.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
