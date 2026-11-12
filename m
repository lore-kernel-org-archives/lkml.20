Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502794;
	b=KK8u/29dNc824ULnoOnFtJRfXpsDYtJp0rs3OhcAIcHgB+1mMx7KoHaujWaePAK79QEE
	 ryuJpjY/a6lhUfzR+FMKM7lpEEM+CupeiRu7BDlF0Q5zGo7wtRLisvSQbPe60ea0aw/6C
	 GNFK8PD9LpwdAYAqb7gbS6t613+7S+OWaXbaeMXx0M66FMCRrEzYOCyRpp80OqrySSWYq
	 7ELIr/ztHvBhzVSgkyCJSqULLDPlDr/KaHdHaLRJBygi/SfgLAqgf9xrjCB2OwE1FwCLz
	 d6+dt1Zg1kwN5CVGZ1ZgPoQfFHUJ7XD/TClvFoY7gT82fxNheJ0ydVkgv3G/daCTnQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=b7AojsWQdmnu8z7CsRmtwQ/iZVkZjTk5+I2/AfHY1s0=;
	b=VX5ENuGngZqMZlP9DNXi1n73Zi1aZcTfM/SI6IBHSA09KuQCOKRluwLULHrlkqorbwUy
	 fLnNttQGp4US5PJXuDHfCb8Yn9uqdzPZJ79CXww24ZFhIm93UEI57//KuLHPQILNqzAdJ
	 tZb+IBaxyulRum7DMf3c/NcDTRe35nSkTcecKmWadgWl8mNKF0Ue8nTnLQWsMzoIDSCEn
	 s/XWim09PUGOst+FqS+e7sV9vFcNG2iSzFNlr08oPlxy1bQcf7X2OCQZhrHNZiyYxs0kt
	 vSOBGBnE6m2ltA1SaIUlrZF5E/qupoBkHRFpnPJlsp5rb2yAt6uAO0Q7VhC1GxaTtDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZU30IxzG;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28357606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28357606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZU30IxzG
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9441591aa5cso124857085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794502793; x=1795107593; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b7AojsWQdmnu8z7CsRmtwQ/iZVkZjTk5+I2/AfHY1s0=;
        b=ZU30IxzGF8dTAnKh0hg/WW7t2ylFe3MYJYBXubmCf1/k0kqtiBJ0BHFnlPIecHUaEU
         +IOyPQjcJanpVIfwQEyjiCo6R8ZX6eRq5qe/70rgSGI7XTTUsHeaJdEJ+rt86dO3O4QG
         IEUiGAj+qbzlD2oBfD0mzrQlpkwUxvBln1wYn9oA8cukVPeDq7dpLvSUXGYb6dXLyEFE
         vRplzbwFbfz1dfysSc4/vI7lT75Et/sbZuEzEjHfpQS+gx9dYciD/G51J8TE2ue/slis
         bnZQPk0+xQgbm/k2K/jwW5N5aOs1hrfOWqwRb16xam3/PsiW/U5odSFtLBlksi86RNx9
         J0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502793; x=1795107593;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7AojsWQdmnu8z7CsRmtwQ/iZVkZjTk5+I2/AfHY1s0=;
        b=1GDUonfhqX4bGCZoY9HUKlEjdLUI9P3eqGD3Lj9k9itg0XFcZHjcdzsYCi2HBWM0q+
         aU22N8+aSmKZ36Mp9xvbkpvRX7oi3SU4fI6uZ5vy/BCnrlu9Wt28LptNxUV14P3nW2sa
         dlZYiz7lIc+xBkBWsrIf6Io7EY0rEAesJohzZqT+P24eea/hduIq4IzSlyIQ9InT77oI
         Wnvwo1W5cpuH7AvgnYsbK3TZv7X+7lH3feFo99IpYBqU+GuaXG8TG8LZieKlV8hHbXnY
         FQWpRiN4CVc14ZTH4xjhziRosZW/Mayz1S9WVkERh/6ABH8FgALW9GjczgPBfT0brWXl
         6FUA==
X-Forwarded-Encrypted: i=1; AL+hErFZVa8JbmGWnyEXLznhPVaDJ+gJL6kPQAPcoV1+3h4PXDDU1/w9yCICuK+0uL3JIVnGxVGtrAIqka4C61c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kYaU9xj1kzgIT0siMUm0ZVZljFQBr65C9mwORyC2pEScrxxEo
	cz1344mHr7sleEqX1vZvyDwop37RcT4H13LosVkBLs5RiH0QAZTAzOIWgfCH6bPvi/g=
X-Gm-Gg: AYBFou1PxcifnEtFeCwROvARSZvw1i6U26+QrrCIvLPzb0Gugl/geIH8ADW7XEd0NOm
	9WtUNpVSl649Hl77Z8udgPmnx+Dnq5XYCBK6p5QpO4sTmuNESnMkK9E8K4MWX5kwtV72cTIORno
	4co8OHmSpG7F2n8FdFHPw4Pr6f/FYmkzbh1maaH2LNpb8kbmp31KPO+w6oweDCNu1eTTl6GEOCj
	bQWNIGGhjeod/4umus3kHnCwWhhf5DvKGvPl6TbKwXURkx1VKZLBBQyslLC09bUbLvSd6/SkX2Q
	kDGAjeRkcf1rezQzyfI7JY9JEG+EqxIOs29BDfckffjwKLAGsbJmUvSc3df+sp/dgrYEclIGp0N
	IVh8PFMv4V6O1p3+/wCvqnqwIVrVfM903kHjMGOxzqAW8km5yttn1Ek8O7JzBS9pCQgnEGjWQRo
	d81rKUILT3ETKIqkh7hGXR5r/j5DhqpPyjaHTUK1swvix/5gto+YPIzVBJlcH45xBUWy4OJmoun
	YojrIviceNERrvpoLDLIkbQzDFrKMshcD4Z+w+HR8ANrviL41AtWIWaBjdyw/3Oz+7q7CSu2vV2
	Wbx5qgX8gmF7ucvI4o63MiZZh9pmSqxzwgZtOYk10sr73m39vr6Ag4f7kRMPspW0iMU+/InNlSs
	+8Amfw0U=
X-Received: by 2002:a05:620a:6088:b0:945:f5c0:a630 with SMTP id af79cd13be357-94932e8795amr549937885a.40.1794502793241;
        Thu, 12 Nov 2026 08:59:53 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94935073633sm220651485a.37.2026.11.12.08.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:59:52 -0800 (PST)
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
Subject: Re: [PATCH 01/13] mm/mmap: free gathered pages before MMF_OOM_SKIP
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
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-1-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-1-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 11:59:50 -0500
Message-Id: <179450279073.482102.1691484916250559829.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> The OOM killer can quickly trigger again after having selected a
> victim. That victim might not have freed its memory yet, but its mm will
> be marked MMF_OOM_SKIP by this point, so the OOM killer will ignore it.
> 
> This can cause the OOM killer to kill an innocent process when the first
> might have freed enough memory to relieve the memory pressure.
> 
> Fix the issue by freeing the memory before marking the mm MMF_OOM_SKIP.
> 
> Note that the task which calls mmput() might not be the victim - if it
> took a reference on the mm (e.g. ptrace), it may hold the last reference
> and release it when it calls mmput().
> 
> Therefore we cannot rely on current to tell whether the mm belongs to an
> OOM victim. Instead, partially revert commit b3541d912a84 ("mm: delete
> unused MMF_OOM_VICTIM flag") to reinstate MMF_OOM_VICTIM, which
> mark_oom_victim() sets on the victim's mm, and check that.
> 
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: bf3980c85212 ("mm: drop oom code from exit_mmap")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

I was able to reproduce/observe the unfreed batch and the second victim
issue.  In the base series i could kill a second victim with the
in-flight oom in about 26/512 attempts, and 0/512 attempts with this
patch.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

