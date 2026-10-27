Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119065;
	b=GFQtkwjb1+Lntv3ofG0/NWXeOCGl3088lf/9ZZ9ZDQuT34WnoPrB2ykexrVUU/HVCIfa
	 yBVemPiBESeWIYEZmJcLdrqVQ81/FNQCktwPAA2P9mgJqYed9VKPh00Vaz9p106ALy7Jx
	 0AhPMrlm22t84orug7tprKKs3Ekwwa/EOK8SclTD2BKOw6i4XIBmubNDJmqgxyoOSACuZ
	 ye8bh0iYajoTXttYrqFHsTILd0ooLJB5sdSExy10RCt2E127NvSDE7PbYaa6wKmnislD3
	 Ym2u5UcsmnVPJ8AmrmXp2tsNG29T5TK+iiGaOmqyejoOy0C6xjFguWlAmRv+0F/twog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
	b=WRwgs4R70fqQEzgW6pmeJ6BqlixG6Jf/acwtgFM7IKsHvYvsKx9YQFLpwEx6CoBmfoTT
	 8t5jhyq5OZevlFbuk9uIakkyqhns0BcPrw5vv1lGQPq5FnoiBKXJTjlHz02hnyDS99H73
	 9XksdNDd6pSPC1s0tvxhBA4dfS3DVdbtoJq+skqzRz+eEMvYreIKuC7bRyTjPFV3ir4Rj
	 B1Nz2sSH8NsCv505MxC/qo4RcINbN3Im/IXgUK7VpDjy593YwbEU6jw7Mvd3OifWtD9aS
	 cXvj3/chSTraEYEuJWIHU3jY/sXJhjZMoRMX8D7zChRU0ylkOjS09vfC37/va6nXZyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jp0oF4Ys;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371A606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4371A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jp0oF4Ys
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so81669a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793119065; x=1793723865; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
        b=jp0oF4Ys897XRGpeW6RKR/fHWs0900z2eISbO0/7YoTTJ1fFarjXa0F+Tp0M1QIRaV
         1g8zSJLLa2lNBbVlsUVyLp3zNvrpzucfIl+D14Xq31PvhpEZ+hIqMTwTXDul/RmgikfL
         CjByDjQ1ylYmmxEchddCELFvL65xpS7fbntKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119065; x=1793723865;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
        b=a3ZN0X0zGlVFtFkXutBpYHqXP1A0OSWCZITRIkrXkqwNjghqvWGIEJRi0I0CW3FNQ9
         elhryNdfV7dcHMsrsMCzVU6jXIJ3M1XBMFkR2B80VE6Eg8RrOrID996+1avnKURcMP1l
         M1uHxcQlMaWMf/JkcZ4gXAWucrERqCfrdVCugtc9ExJMPjXcCuj92uG1NlCRYE267IVy
         71LhqIALBr4qFQVv+Igs7kRYLfBVoN/qjJNQlb2ChcR/mV1zaN8II5jGplAHw0gnTgKR
         PbK+M5cY7vx++0zMbV8K3NveeQSmnd1jOFYhvxa8n4q0K06Wir2OtaUDHRKSq7WT7itx
         4Z0g==
X-Forwarded-Encrypted: i=1; AKwUvBztI8a4R8PNpEvqy+gjo4x4miG7DpzXLEM60CWJ9nr+hXvL+pqs/NupOrZHdBEiQylkrXhMZgZ8exH0Qjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlOXKwiiK8HGRAmz9DJDxIYZ5uyU34vPLtUbR4wsxGXL95HUo3
	yHDMS6ojA73n+kB2W+oKIYlY+BL1kD9WZhC2zyF8nuDpu4YYlvqYeLbiW1p7DA7RMOY=
X-Gm-Gg: AYBFou0JDi7WiQ4G3laWicTtaBD2eE/yUEzvAXZP0hwxwJ3kuciowEtp0Cna8/+ZLGY
	l41bn+vifhaSnpxyJvDDSNBFoMHnb8H/UIA/W3xBNlABvOUT/Lh0WuHiEExAVPYjlyXTWOneIbZ
	xGa60SHsU+W4gUDKlP95jQ//X3/PI0zZewdD+X1mKVgLRcTJ0P5fVk0NZHu3ZQY3ypenb6eBqfw
	ZQpzoiZaGFecnaxM0c423Nw+D3jUnfzfvVkgx0Fp/BtpGJFh0o7nzd3RIUog5ubz4PVozyV+2wy
	wyp7zold2/wUWxz9dbWYkthD2Avo8nE6Fb1gWw0CHB9Iceg+IFgXP5PAQgp+4zlMH1xm8JLoUr4
	rCvYWUwydByaGO6i9kuYH1i1Aa1iz/0+pVt0+jhEWJee++muo4G5fNjfh5IC67n/+r9zdI9DBHK
	ERbMiMLFq57hxd9oyKTNxLAZgpiAcSnpyE9ak/0xiOxRaHSOknj1QWWFhEtH6oGF2hvY9wK1Atp
	ZIgyYUslF8Zc4lQRMuk9zkHyOZofC07XkaRL5D4NU1Ab0BOK7jBjiHgAA4awcQVHv8BrXt1GVay
	OcaS0/91srYdB5MYHy3vxtCPyjUDdP4GDXaKMHY/rhdq+n6rrgua24R/ECq1ck1CjP/r6afcUXa
	/YZcmKC37D+KDayM+TJMAE8M=
X-Received: by 2002:a17:90b:4cc4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ade9b2d399mr8594261a91.3.1793119064572;
        Tue, 27 Oct 2026 09:37:44 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm5635829a91.0.2026.10.27.09.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:37:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:37:41 +0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] mseal sysmap: Allow with CHECKPOINT_RESTORE, default
 off
Message-ID: <auDTVShTfZ2et9m4@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <7ff59c2ab6c234ca4d799f862eb7c3f22d671f99.1793094611.git.chris@chrisdown.name>
 <auC7SFhV_qj-agQp@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auC7SFhV_qj-agQp@gremlin>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Ok, sounds good. I'll drop MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON, and fold dropping 
the !CHECKPOINT_RESTORE dependency into the boot parameter patch. Thanks!
