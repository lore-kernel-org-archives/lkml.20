Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810789;
	b=MVsZnap91QbXOaFWpuqb6BTWj1Jru4nDt+xG4osqcibSRjPgRuSLwNX9+ty3OlqJYKzS
	 +64UcHsmQ3/Xxv9Pgm7SSlurLQUaLY9IzFEzLs47qAmIXdaIm2OAS1/rw6HSxVaACrctb
	 1o1G6rNycZ66Y/qSm/Mk/UD3bKRNNbUl9QqMEdfhnPVrJ+1L9SVwis+sr8570PMyzpSMj
	 Qt/6xsba+pK9cNTQdkr1tEB0ghWLj7fHGwvVn59hwj8JytAu+aP1+9Hx2i12YezwkqKlj
	 4TDG7VnTRgCNBZ67ksBy1M0aiiUOBxJjuBJRpRMfGlJFDDS0GHDiqKhQVrshc84EwJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=qxevzDe0ERznAZjpDl0rGSZzGbCrk7b/Nsjrdx1IHxQ=;
	b=yswd/bxrjdJzq+PdPxEDLvb2p5/96O/d+e7ZyVOJTWKjzR2nwJM0AbYZHLgNBTKH+ExY
	 YHibzI+Q76VRpuo9GDpuEPjxXxaKRowHNhB4LgF+QgYzk8kUvKWflnJTAjCmZTDxnm2a3
	 zYhR9oaC3YnNRRs289oaI83bETrGmiwIdEdAMYCQ8aO77Mh9HMCR2YB0n20zZ1xrx7DwF
	 d237LcpeP6LwjtAlSguXsEGq3i4QXvOfuVvooLe9lxfwrn3bv/0O/IRnPMd8d4Hw1ZXAC
	 4x4pYU6JQAsPK/Rj0+ax+lVGYSxMK+Lvv7wv/+JDFTOx1huzu77F8Bx8LKcxgfLaDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ru3FEnu0;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2706082BE2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D2706082BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ru3FEnu0
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9eb579c0eso6102665ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810789; x=1794415589; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxevzDe0ERznAZjpDl0rGSZzGbCrk7b/Nsjrdx1IHxQ=;
        b=Ru3FEnu0VHLR7r5u1t6YBaxmZVqC2XOTMln2xKGTlN30WyOcM34wDWgsdSO/AQAm4u
         +dGZl2Gob+iUIOb7yb5gXIjvSYs3zy4WPDcoTEqFG7Ik1b1Za/GtEzmkjCexaaygpew9
         43PwyJALhTqq7UAy/4AGtOhlQdN1pYoP7f4n62v/HgzyoOXi44egmBCSLtPc0AlEfFmy
         C1jUkrGOTL3EqjL+VqE4qnqWFk2s9B7Jof0SI62okD717EJ5yQoHCUe1i+DWLi4vYZLU
         xh0WLGugCRIJVikwM0bq+1lSL2lJZPGjPZA0Oqq4U+5xwMUIVao6etUiLTL0GeeY+Wm+
         L1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810789; x=1794415589;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxevzDe0ERznAZjpDl0rGSZzGbCrk7b/Nsjrdx1IHxQ=;
        b=n+brJApPTa8jzTSRP7n8QiDUkzGrDeixCj7hYkJeLqIjtpTWwaInQLmzH88GpyzjkK
         Pru4u5a1oRFZbnLpIfwd8/uJfaGe6y53bcnB5B5dszKKcJnWVuww/+D7gmNkukadVLs2
         KnL0lND5chkXbOMOIeqv8gstK9JohwlyctoCipogAhwaPB1jzgoFF3hB/mj9FEjbj5Sz
         lKZed0zoaqKxsEpp/xccMgsFCR0bpJsHAvNmUlzvfdjjHpDOV31cLCBUNN8lgiePbEVE
         KC5sa3tdcxCmbUE3dh4HR3HOIr9BXhcr1yUt0aPsqEejzpANRTcdVKKdJkD7pZWozYUW
         5MyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd6le7N5WO8UXT8mcFEKi6FUHLIiMKm3AmOJbyDLv/J6PBkcX51Jek50+o7wknIlJQ8+zGxXgBoraKAUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5rnie8YNtAh+x2RhYo/34CWEhw6HbKfdFpMGoEYDpicSgzuMb
	JFua5xiP6FQ7VNRcaf6abGu6Xin9z9A13OeSb1xtuJ44liZc1PpPztqT
X-Gm-Gg: AYBFou0VVovHbWvmYwyTCqbpSQv78a5IDhFGcAONwVMW2/g+7IMQ4j48RgBN0KOA4Uq
	97YkUnc8hqKsn87wbCUTS9pzJzIrkCb20AW7OtbCxCVbH2eRl8X9mQDnNFD8+efXOGhe52Y0E0Z
	sYU0JOvL9m/9mDz7jyx0RY9244hINIs5i47oQt0O60fQSvJju4/ciBZofkXnqs7s7Lb0+iSr7x/
	QF9VD2RuZ3Nh7XThjx1dPMXgD3va0ud/TjrfDmlKHLiKhJpbmiH4b7A+gjJZ4yYkHXYi25JUHLl
	OHas+AQsN0zL/kOk7HV+O5Gd0jt0uJAZTiaDQTxpdwRrX6MLGZCavSZVgNi8zIRyPA9md66QOue
	1HbqQUfauux84/68NqFXF8vrYBsbzE2xTO7e3tZ3AGJseHzb//zQXhadHhbmtcCo3a92viiIscA
	G4jG8FGUKtEvJ2G7Ri5OHa7fygz38r89fXqp8DJvRkQUj3AoEuTcNRff0JZmZ/3p3u4hkH+5qD4
	RthQh3GgfYPDRB2YR24PxOjzkcErV+1rCDq+WtRb+tueFq3Wcf7aQDyQuGabSzYQZrNoXmax8vN
	oqu+RdXhqcYmGLXpiknZ678MJK5vo+nHvE1iDOjrBwMWFf5Wu63fXraeH0pO8LigPKEKBOhiDEF
	L3Nc0o4tFLj5pcYx5Qg01JZEy526H0wsE7bo=
X-Received: by 2002:a17:903:4b0e:b0:2e9:9a19:c54 with SMTP id d9443c01a7336-2eb3646ee38mr139469995ad.50.1793810788339;
        Wed, 04 Nov 2026 08:46:28 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd4a3csm9983805ad.11.2026.11.04.08.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:46:27 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:46:26 +0000
Message-Id: <DMMKUQVDEM0N.322USN1ZSYMCU@gmail.com>
Subject: Re: [PATCH for-next-fixes v2 4/5] mm/slab: fix a deadlock in
 memcg_alloc_abort_single()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Harry Yoo"
 <harry@kernel.org>
Cc: "Johannes Weiner" <hannes@cmpxchg.org>, "Michal Hocko"
 <mhocko@kernel.org>, "Roman Gushchin" <roman.gushchin@linux.dev>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Hao Li" <hao.li@linux.dev>,
 "Christoph Lameter" <cl@gentwo.org>, "David Rientjes"
 <rientjes@google.com>, "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Clark Williams" <clrkwllms@kernel.org>, "Steven Rostedt"
 <rostedt@goodmis.org>, <kernel-team@meta.com>, <cgroups@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-rt-devel@lists.linux.dev>, "Sashiko" <sashiko-bot@kernel.org>
In-Reply-To: <6441429b-eff2-485b-acf3-26c3034910ae@kernel.org>
References: <20261103-kmalloc-nolock-fixes-v2-0-19167cfe4779@kernel.org> <20261103-kmalloc-nolock-fixes-v2-4-19167cfe4779@kernel.org> <DMLSN9VHK0P3.2A97046A4YXGY@gmail.com> <auo5G__ac1qA9JRs@thinkstation> <DMLVUTB5J1RJ.2QKOUW6UB04ZM@gmail.com> <6441429b-eff2-485b-acf3-26c3034910ae@kernel.org>
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

On Wed, Nov 04, 2026 at 07:35 AM Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
>> I don't insist on kfree_nolock() there,
>> but can we try free_to_pcs() before defer_free() ?
>> Like:
>>
>> 	if (likely(allow_spin))
>> 		__slab_free(s, slab, object, object, 1, _RET_IP_);
>> 	else if (!can_free_to_pcs(slab) || !free_to_pcs(s, object, false))
>> 		defer_free(s, object);
>
> Why not try free_to_pcs with allow_spin as well then, and improve
> memcg_alloc_abort_single() for both contexts?

yep. Even better.
The bulk side does that already.
Like:

	if (likely(can_free_to_pcs(slab)) &&
	    likely(free_to_pcs(s, object, allow_spin)))
		return;

	if (likely(allow_spin))
		__slab_free(s, slab, object, object, 1, _RET_IP_);
	else
		defer_free(s, object);
?
