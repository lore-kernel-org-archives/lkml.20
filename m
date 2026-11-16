Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864717;
	b=T6srAqRZoI5qB0H53MX9BkYOVY32GFB6jezsqguCMBQABgH/H842s7Q4PK2X5U0xk4vz
	 s/asQrUUhldaZ6XjowqFyPWrJUalczMCCdUQ9fmJTWMG5c1qUS9e9HmTLcel3v2noHzpK
	 qrruIViFa7RRTJ8Y6gCQsXs3S+2J/3a/FWIzauvYiwSIbynSgi0UXFA9n1zkdk5xjnyzV
	 J1PuXX59IQb/0RfvlIi3OHfkwY9kBb/Wd/5933Qmn2CsxB1zpjRKj3VyccPfEy+Oit5kR
	 d6/2YF9/B8c+iN9niQD/h42ylqWtwJcLADoB+4nHElRqgraB+yvJEv47FmAGO4wRH7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sPk0pn9cbo9uW3HmYfUN1NlNCSOlhfvfIq6E+7rjiI4=;
	b=qOIa2EH+YA04epC9B4lrTVtek1KxBJ556Vj3m20zGxHxS+3MwtfU5Ld7bh5CmCFByeY2
	 Apdbo6gBND28j5SZwvMPfzB+8Bsn8VAy9aaqEvVbYEZkAPqm+XuwA+E17n31WXD98njIE
	 ZXV7MQZvBBT1Pyr3iZ5MPRqULjjskGw0N0I7lALVpUwB9wdd0fcLFUgJREjOoHnOvco3c
	 hKTlUmrxTjK1YWBY1+pPbF/Dq8vofXf7ggjLfI7soTsO/x3sPCQUjAtaGNQPFDHZokYb7
	 KyMeNO9XD171/NQnGvnejlB5CXuI8ZR4RK4KeBYU5JHmbTMeXkGneeWrdeDXJySFudg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=k6ILhr2B;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53840606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53840606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=k6ILhr2B
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f6295304dso3363435eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794864716; x=1795469516; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPk0pn9cbo9uW3HmYfUN1NlNCSOlhfvfIq6E+7rjiI4=;
        b=k6ILhr2BsaR+vtz/KNiOHmAurmPAfX0MuRJo65ZZJAI2epZW5wRhNAUUhGMO+5e1Yi
         NyFyFRg579DQGH1fjGTuK8xpHPi8Ac7mzhfdaOOEVcCd4uCmL9ZV4WYP2+xF1nMu9ruf
         xMffWajUjzoM03TKTn8d4+bWTAb0vaLZVcnu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864716; x=1795469516;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPk0pn9cbo9uW3HmYfUN1NlNCSOlhfvfIq6E+7rjiI4=;
        b=2JsRjC1r6XOQcUT91qrvDMJFfInBeNE2FPJZBBzG4EHIpnQ79gMnHgquFDj/LcDFZt
         /AO59CbCacZwn1s1lCAH2NZQOy1tVNk0oZmUSH3w3kn5swliGPSK2QMXg8o2UapbUnOx
         hkxM9lJoLzSMRNtlklJNK6JzkZoLcbbpVp1JgnCFqJbc8D3eNRmJpzdmxA3TFxkbE3LL
         kU8GHeY6UEZ5p+cz4Ola5bXbkW9NMpWS1E+exp87vp8Q2S45XHKVSXTRRd/BYk9QXKZ0
         WPfwwcd73YNNGiUIUQg+3Jfg3wRfzcXqfknuRQKPGemr/qDUDoRKMnW2b5ttwf8h2cG3
         9MTQ==
X-Forwarded-Encrypted: i=1; AL+hErERrV220vDoC5Z+LmENTt6KjOHwOhODtLUTStL6/KhMqvZAI2MdHGo8seKokc6NKPpIaYcjwD0D7dF2piU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lQ6Bc3Y1vpbi01mqHKhj09odzKYuB6V2wjN5dO3zo6Ma6K7GX
	19fPXaCs1CjigEZnrbnbuTeD9w4DfJd5zLwt1bA9pJQgJieVLVIYih95hbbVX1DcgjU=
X-Gm-Gg: AZFdTZfBXbGImgE2S2vzw2K5yZohvFVnq+sSRLxEcmTm0Jt7+QRhWvV03GvhoWvP3mG
	1P2lhiiqEdv3CtXibrNCay7FwAuphiNOUrgywsj6bpQgUeSsNRkWd4xc+OPjiHwr3d2exhGhw/w
	hHGhf9mNfLJYAtQh6JfRqKqGd/NpHDLW1z2RZD8DEu1qjeZ7NWtzzWay5sS9mKah7/Hz/Z632m+
	QFvkfDgyApP4pmFESlLK2TrF2o74QCgUNR2WK3Q62ncBjLi3SvsP5ES6o5uKCOyCDOcl7VLQMiJ
	A8r1kc/p2PpW/Fta0R1in0vfNsoDfYaimPF6MLgpaJYTJjCjeliRlhK7ys87956TrE3cwpJ8kVQ
	rycFfb9dApKBZ1LItJ5EUD5dMdvWAtjWnht1oA4pV4q47gK1HfNZJJSD5/pdgUhTOELhOxZMprG
	bzQFSuijIOhIvqBT2Z14EXi+SHPBM+NyaJer3s7OxbHJKaqi4PDZ2+o2Bw/PjK3qSZJI61e1pcJ
	F86ebOy4F7YLAS5DhFzkiTtOo7NhuOgo2srKTmRzkte0JMaUVYFnK66rclskU57CGTXsz+YmR0i
	7Bg8HvbYCD2pTT17pDwLkauWMEDuU2qYeWSxeaAsCB/0JQeD7LbZ/iM+3BX83qHGGJMJE4lb4jj
	HhIUHDGtX7fAJSngvZNd1ILbYbjwSpjKg7zh8MMS7fovd+2U58YH7s5Td+6IQR+882E9nNWoLME
	MsZcMKToOMJLwijzZNqUDZd9quM5EHi4gyPGqjwplqfPhNqviL7p0uaUGs4zjSVoRH
X-Received: by 2002:a05:693c:2a18:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-37967316347mr10092163eec.32.1794864716454;
        Mon, 16 Nov 2026 13:31:56 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm72572464eec.20.2026.11.16.13.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:31:55 -0800 (PST)
Date: Mon, 16 Nov 2026 13:31:52 -0800
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
Subject: Re: [PATCH 3/3] mm/vmscan: consolidate promo vs. high watermark
	checks
In-Reply-To: <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
	<20261113235238.3595412-4-joshua.hahnjy@gmail.com>
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
Message-ID: <avt2SHfo-qowULkB@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Joshua,

Thanks for the cleanups. I've tested that this works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
