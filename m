Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864711;
	b=HxcLypqR8LoZmqud0qmQ9u9kmLSPqlgBedzuk/fHGqTZJECJPLbDHNFZzzYHoSrsKVwE
	 rkqXGLlxHj96nVCRNhSz7CKmIJJgfjYptLiM/T31y8prFHAM/tbjjAgBeO+Lqf7l8ty6u
	 OScEkG1t1kWFUfeJ8tODankM+vT00av5TBRN2ZX1GAX9TP+wH2gULbmG+eeatXVRe8Jug
	 As2yf+k0E2jr0/O71FOVGextOM/3lzR8DRvWOz4RMEG4BAlA245RuvtpU0j4sf0fre5BZ
	 7gOIhf8ur/iOoWdLr2EnFkcOWlmgZnrrymE2AzAt+YbaiTlgnYtGD2T/Tyyh61RjmnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=Uulz8wvteS4duYmav/8Y0A2DGNv0SwfVraT84t2QINFflChj2bhaHJM1clSzBOOUsIq/
	 U9SRVNj8h57pxzqOf5BL5a/uK9AHImOXpls5eVuyM+Xe4d8AAvu2jToU6VkUfIi0mzLFw
	 vRuZ6UZ3FgC2WNUFLZCQzY3kqxUdK+1U8Ea5Ixo3UwQ1iBPcwMMzNgh6CFGuxTezRNPP+
	 6b+sfRX2jB8zmWMb7vN+vLiZquVcObRqH48aYIyMLohDy4W73wyoMvIcJOOVkiz9dkpDj
	 zayYNTVmMTgqNap41e9vzP2bqD6tuoqJTzp3v+Fiezj5QC0lAEmqGDNBK8CCIvyuIXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="K/aHoKYe";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C21B606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C21B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=K/aHoKYe
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so5726146c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794864710; x=1795469510; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=K/aHoKYeB2ikimQ5IVNCqHVZgvzrU4Blaj92yXAdwHbcTlm92C2AYv+PovTs6ZQI39
         SmOKMTEqClHrW6qnvsHkugVpq0Vgv4OmityZlzutbKzB6Smz/1cS0id9DnPlA7AWpiZ6
         ocbyRt1VkawAu6pvV2sSWs1PHvGWOon35M6h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864710; x=1795469510;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=JMPms8xKDzjA1ho58OWS/sBHOg3X8YMbScpCmJZtcJraWhUU8fVPlBSe38YpsIFVva
         XmJnocZNHT0WgrNiEZ7P6CYKlXias2RDGakGxHPByJwSjamfkC5did59TB26Y+aZBERq
         ryEEQTqbUuhp4HuFKqZnYiwo25MRIvXAEeP4TIQ46lJ8GO9D+LCuhgvg2pP6nvhT+91P
         4XfZxZk7dOwF8Xu3qzf2nHZXk/3iYWnb8b9TK6un16PyKxLdFpdLwh5oEFfHzkpg9PZC
         OIp5bA/CCdFIFfPAzVbxxjKXEG3KuZYLrl9DXFHR5pj3No0lijP9PklzlzsNEqf3AGeg
         RMCw==
X-Forwarded-Encrypted: i=1; AL+hErHseRG4lZu/XkmIrHZmtvm0bXOfqLyvkVQHpP8u/nfyj2bECGVoZN/9i3f7FUo/FOcKoL18N5FxhFXpUG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QHSWBD4rKgutRARyuZNOgZCEgmeSlBnsmWkHCQ7WJDWFNsR7a
	rlT/HhwhXJ//G1ltloTQUq6X7WdnCW39CNfUO5GtN+c8FGEtST2uhVn8AUwMSSHAlYE=
X-Gm-Gg: AZFdTZcVJD+jcbZTcuReLGxnenLyJ402pshlOsjqpPAt9kQNijo4UcNFwl6CiPfDKni
	5uRjYMnhiVE3MQL561pIjz677ZD7qzpp4HYUcih3/7vJ6me1+xtsRYhyq3FqUYpCimjFiWthn7F
	7w9qKAlC4mVAOIZyiYsbUSd5zhmzXd+9MEB/wZXiA/+pxVDXmlk5DZbQZ4Xy4znqU1JrNxrgAXe
	/C+GJjWSdV/rEOY+h80lnjC5NMx8S58J2xWgdX+OJDKQ0SxaJgjln8aQOwl+3SzV1kjuAypdOd5
	7fIvhozWyorhuMM7U5Ks0dAvKYzyTRXBRBX/MXB+tV/g11DuCjRSBSqy34nMPgTbCXErs4LwMTu
	X1GljopWZSny9vkItFvLhF0rY+ygYLXyDcvu+n+G4YRpVlBGV8MvQ73AoaOuQX9McPajRwvQoNt
	odznHMOhhtZXsdXtkElnkcAe7QIQR6yrIeybv7sg5nT4sDy/3Ek/3jk4XLrn6jjThGWLf3QJkAQ
	QFE0YgmZNc2jyxBlxR/6poHCkD839b5PcN3WUrCvIO6e/vltY5Q5/9OfSWzOOqHRswRQs3bkusx
	5ajinFdfcuA+9COrJpXJ/RKpwSvzdJ7U1vuEWWQBull3W010jauLxla1eC8DGC0oxISA0Z2S9sV
	5PnkrN2/kKcwsTC1+P6jp3j4M3SK/Zkw17GIf+26e+SnAJqBq0ngmwebXNlXJejSmcwm2iX/oBE
	SEO8mCJ/YYzvG2qThHccx/u/MCaKYUrWvgNsXUAfRZoXkuh0kvm62xeiWTCsrNS9gL
X-Received: by 2002:a05:7301:4d07:b0:375:87f5:ccee with SMTP id 5a478bee46e88-379684b56e7mr12617736eec.29.1794864710396;
        Mon, 16 Nov 2026 13:31:50 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm72571250eec.20.2026.11.16.13.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:31:49 -0800 (PST)
Date: Mon, 16 Nov 2026 13:31:46 -0800
From: Chris Down <chris@chrisdown.name>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] mm/page_alloc: drop unused gfp_mask from
	zone_watermark_fast()
In-Reply-To: <20261113235238.3595412-2-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
	<20261113235238.3595412-2-joshua.hahnjy@gmail.com>
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
Message-ID: <avt2QreyA6p99XLQ@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
