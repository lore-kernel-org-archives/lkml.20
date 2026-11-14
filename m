Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686213;
	b=JcISpvmHN0EGVOKF3Hir6xFktnlydYk4H99Kh2VqWHPO2zp5K0ixbTPVZ6EySvzR5sql
	 zY7f5VBImHRt79M7WnfwFTmg5lYOYQ1QZQh07b8Kvgp133FdNZR4kNLiGnmXHszwuOFKI
	 3b5qT5bwelYJwCBioorPd9vAiZXPSl7AYsNAd2zjQIp7D58/Am12jjj7S4isibV9u1OCi
	 Zma64dtu4LxdCMFo6LwBe8kniGPjbaudOdQmgN8Y0HccaoXYSh5kWDf2Whis27mOSCJv/
	 sTOF5yfZSwTUF5rv965cK9NIdma4ynFLgjVVIU3UPYup7ipdoVlqSAelOVaZENlEfgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=jUPvgjj1PBRfdwLGObCdW0ZVMBq40+Tj39RcKsF/1KM=;
	b=U/pGQCqcqnADK+W9PtqbbPjWyuAspW2Nyjqm4O6Gxi1nIoLRdQdz9aevB8YjcTRxpJaa
	 5r4c1N78CY9HguFkQtmGPLzYO0/90Q6AW8T0H+u3Ln2KGnwHqfEFmMQOWKfj6TeNEKVos
	 WnPIaG6d9rdRxDv5lHE+GoovQ75lHuDQTOSOZDrESECREpsferCdhF0nsnyqHLuITwIVS
	 TQ3d5mwevIi87SCkkiGImhabBpfuhDC/XzjeVIbwbEs2lA1YOkGK40X/p8tZdN2UOuaA1
	 jmgjcpeKO6RPGJX87eMyo9xapfCkqq0YKOHyJKiUIe9OxLKfzXRL9ZdxJ38PpTfxtwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pRiTwZzn;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBF60A2617
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCBF60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pRiTwZzn
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1829226a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686212; x=1795291012; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jUPvgjj1PBRfdwLGObCdW0ZVMBq40+Tj39RcKsF/1KM=;
        b=pRiTwZznyJjRXEwfZ2Yj6bQhTMfhAND8SF1yLLCDprlMuuVUEfuXxcMAeIcXT4oMCb
         h2mWAMZ9RLugktvlsTqKXyz8lJjoTbqH9YlZA7iLPtiOJs07kKmXDovd5gz/xA3lrkUk
         pSf1nT3EqnybmBBib+Jjaw2cWu4Mh32UD5SfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686212; x=1795291012;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUPvgjj1PBRfdwLGObCdW0ZVMBq40+Tj39RcKsF/1KM=;
        b=0VwjZ7pcQS/Gi8+0Hv3coespxYCdsJ2GH8RJiqIgoEzQiswgUt5cgPVRFZyHfXuyW2
         srMwRutQpYS2fYDe8fNuYOGpYijXLNCEkCVep/WPsOR5Fnpj03JDuWNcVd3J4Avcw2Fs
         UzpTZkmQhx40KQAmyOvBGyHHPYkRtEZQh/yPdru0sQBPmBnIiMgUlTI9MiocA/yyFO2z
         3PYoVj7AqMrtYeY//9YqvTdRhIeKtyPvxypscq2ofOCHDUOTXIax2qYKA9AMBqM6eK8L
         tW9OfZDF3toiL0rq1la0bxYvTvC2kXoRIzs7xXObIsXx773BE+pjtvAryPuUBixcJ+0p
         MV4w==
X-Forwarded-Encrypted: i=1; AL+hErEgFR5NBRjHpOHGBZQ9SGv6k+UgbZvnArKgQZOjDmhrOgfA1OOf9PfHgsP1EpMzLx4vzEDOqE7KMPTC6Qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8je3ECsQDTB9hSjvl48xoP3syn1mgHynJxevTysKHBVQncgIdq
	mgFYfA1627+Cz2qnlof2HGvpsrCVCU+v0kAa7clXrUSz0Ko3lVGESS8W0LcW5kwFHvw=
X-Gm-Gg: AYBFou1ZiZ/MTugGeKAsHIJoLHlMydApgwP/gEBUJwvMcqltO9o5ntlB/x3SwqBvKun
	6NZnZDBaino9izv1SElWxmrV+nLqz4PXUxImTbib5Mh/+NHewgePpWh4D1CEVJMVN93nm/4Zc6M
	ZjPIkd9Y+DcJrXqU6VC1vGcLxBHsLeo8IHYQ1TCHQjlrWmJovQZ7FER5qmT3gNriDcXAgB0YNlk
	dCAdafW3oa4DMyAKfqpFxFgK3d76i5KhW1bMq+GuE1LTBM3pQ+Sx/OwDEz1k1geOLkunZmu0BUZ
	srbr6ITy7lgYHT4CWKpu5QcoYz/GnS24yB+dNi5Kw7sJQNjUKbkyF+CEoAppZfctmuMZ3G6x+L3
	4aaKqtMDQhWBtAH5wh+RTlHmGCvMDFzIZmssS3I3gTUUXo/BbRwkDyGbLTM1IUKYlktruxPIR5f
	+14gYrZ3cGOhF44hKMm9YgspnYQhlF49oQTSzagq623qok8oaGvkTKWMe8jROufk78MZiXGwWbJ
	P0MDVxtuKuWQp7OZemDmnArQKjpXm9oDfXtV0+5bu/JUqheFrbU7kypryRJmVj8rsQYqf79UNsb
	iqIX8Eb4CLc/2Y1IjMcbNxQcimFQQx+otJc5UuD2RHSdjG/uP5yZAKoWrG3Wgc1QjhiQ0MYn5U/
	mWKI1LR/arO91JWm2BJOQpT+n6uzrVsCRclI9aAjOnqYLF0pViD8OT0M22pWUo9bnayPDkl6wnf
	k5WGBSc0IpoOSn7I8KERSxTSGhs+gopjf25rVlc2nrJtQYw1j7VMPw/EaU
X-Received: by 2002:a17:90b:3551:b0:3b3:8194:9e4c with SMTP id 98e67ed59e1d1-3b381949f14mr141149a91.34.1794686212209;
        Sat, 14 Nov 2026 11:56:52 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm10009272a91.12.2026.11.14.11.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:56:51 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:49 -0800
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
Subject: Re: [PATCH v2 06/13] mm/migrate_device: don't let go of the fault
	page
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-6-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-6-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115649.cafa06b8b8401e8a@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Thanks! I've tested this with the HMM selftests that split the fault
folio, and it works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
