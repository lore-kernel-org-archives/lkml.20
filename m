Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407555;
	b=juoG/pRdUXltEuejQgy6LSRbHNb9s1/z1/JkSBu17eCvTprrlWH8vbOR7a7h90N8e2L4
	 Y02tTqiYApvUXrAlAARy4OhYSdaabHsdyXpJwtSvglfglfid9TBZ1Z/IlS/CtTOO1c1Z4
	 auanXkDs2BTWObfICCXI8GyBgBqPYKRGkBolyKaRBDFlKQ+i7XwZi9w37gOPShuluFbWo
	 tTjnk+bnCdKQMeK0uF9GVlsVH2t6QGRcKiYj9D4iCSzgXZKstAOUPOZxl8PwCp/mA6AYy
	 qIS0F9RJVQDbhvzW/Xh13SYcNrrkERQKxCeVCfvImdNEb+4vz8iJ4IbXFDJ/+5nxL6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407555;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=N347scaieRKnfZAxwyIlV4lZkQNr3Gsi349x5S8E61Q=;
	b=jLW9OjX78Unm5BZT4ZJ2u2vBYgeEqriqsaqx1zlCUQjvhKhyBJdR38Vk4tphoZm64lT+
	 PjYktR49XVTmnFr12nHqFV5D1ilIdCxByyNjqq7yrTLSgDJpSHZBPu/C4zeu4Ozpl6T2a
	 Ldvcn0qNsM7+4n71Y519uT1ffmyae7WmqRtlBgevk4gm4G2bc/ovt1s9bIT0rBR7UL0Yy
	 BbXCWXFhyx9bSwErUQOwUdxNuajFQ3DYgj6S+DcDNrjTM2ESbWu5KNzSLtucJagy98mSo
	 om+yIqip2TQzVXK0Yd3yNXcLRKE/ksxGgJcx7H7cHtSaJvg2MM2HtW2KBrVH/g1BITQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ELCL6CDm;
	arc=none smtp.remote-ip=91.218.175.125
Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118D2606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ELCL6CDm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qzhoW8hkYHWNhkLmB736TkASUeOo7ZLmpURHWLLr858=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793407552; v=1; x=1794012352;
 b=ELCL6CDmUwhiuWeB1YbP9LifjMZgTavMPdRceeYAFvZ5GxRaLMxa2FSRkJh9ZZmqWGwKgXW4
 X59vrrAJx7sg1ot0ONKm2Gl3fbczTJll0c1txdFkjawCH/g8JknSfdI72pBgwpn9LUAwZgHmsYD
 4u9hs3Re3R/GgZOJnRzFolOo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 59289533df5a5a2f;
	Sat, 31 Oct 2026 00:45:52 +0000
X-Mizu-Trace-ID: 59289533df5a5a2f
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/5] memcg: move memory.high enforcement out of
 try_charge_memcg()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261030205418.341214-2-shakeel.butt@linux.dev>
Date: Sat, 31 Oct 2026 08:45:32 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Tejun Heo <tj@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Meta kernel team <kernel-team@meta.com>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F94627B5-26E7-4F9F-ADAD-395026632C45@linux.dev>
References: <20261030205418.341214-1-shakeel.butt@linux.dev>
 <20261030205418.341214-2-shakeel.butt@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 31, 2026, at 04:54, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> 
> try_charge_memcg() does a lot. It charges the page counters, reclaims
> when a limit is hit, may call the OOM killer, and at the end it checks
> and enforces memory.high. Move the memory.high part into a new function,
> memcg_enforce_high(), so that try_charge_memcg() is shorter and the
> memory.high code is easier to read and change.
> 
> The code and its comments move as they are. The only difference is that
> the new function gets allow_spinning from gfp_mask itself.
> 
> No functional change.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

