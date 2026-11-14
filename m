Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686204;
	b=qupShDBL+k1J9NgpdIy7toQZpGr9HOc6iy1WRba6HznaVX644eJ2U2+0qAXwsuH6QvfL
	 4h+Pp1T+21dZ23D7WwKNzeXlH+14A6lBIGIbS5eBLA/APIhuUth7SVdzC3Vj2obrcr1FK
	 44asFA1wVxhCySzFaMfSa/cIhBQ9CADVUkXTjNsUF2FD0cYk3pT4mMhBTJDSkPv9fFkfJ
	 d2lwW1QQ/ngXR6ajV5msjjYSDhhQ5yt+/aKtKRQMUWF7EYJ4dnz1BmUTV7bs2ISko6Tr+
	 jVVwe0nf5naHRlR0DfLimPQpLq5wfhKSMRqh9qVvG6G16rpptG0RCVPNpz3QY9cTzGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=h8tQe57OZTUGccU/0PYe2wABwR56zJWhJyWxH7qncio=;
	b=WHhNoSeqIiecKLnYqnpiYKyM9wltOnIJ9pbeZbKIkexJ3HT55H3O+3V013JfRZ4Ntuiu
	 AsUI4ue3U8SX9qKD2Sa65VbrCSxqLxE4epZkC0ATQhZHYu5bZ3KYYrRd5dILpxDuYRrwx
	 prG4gh0rDLiW5JuqinS4AKh/P8rkY1a1OcOqSSBVxV0V7W1qBXJ2yyZ/r/4YUb/MTATtH
	 jqruG8jr/udzTHzXTXuICzZOkTu65nA2mLKVEZWFRh3Pg3ZJkzcQsve5VMK7tjEvCmsr4
	 NSPivA83VJ6uNrtXj/JAfAVnBAGUg8nb7cZYmAF2VW8KW5dxzICUvtB5eIlC580cxBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ES5qf4Sv;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60664606A89F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60664606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ES5qf4Sv
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso754677a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686204; x=1795291004; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8tQe57OZTUGccU/0PYe2wABwR56zJWhJyWxH7qncio=;
        b=ES5qf4SvSOASRHgqYUg6JId6P9TDYc5Bg6Hb4naf2ka2X9xIJvqrVPHE3vSKV3O0QT
         eQRZUbPM4zB8mXvpO15pvZqMsT9zT0Mp6L1LiFDDzyz1gVMsePZLCRn+VcQtAbR8Rmyv
         nFXqFCTWyxNSh4lLmuRMoxyMGAM9PA+L9Myvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686204; x=1795291004;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8tQe57OZTUGccU/0PYe2wABwR56zJWhJyWxH7qncio=;
        b=Ja9chTeZiDC1vsHfBi/5AMh42xqduaO//DEKPtUy6F1ED83s9HifKdsKdAg61klQzs
         OTthp4KfM0QiC+d7H+eqPww954aBIDvoeuhhIb1D6ess/NqO5SCgT1lM7+1Wn7kE2kFA
         yb3DE1HR7M4ZJuqbRZI3kbooUNOzg9M5ZV+U/EhI47gHh0JGEhQcRFGp+/VqaXurUUzF
         46OLvusbdLjyKoopH8BU12P2i4ymuq/aXxtXbZ7QvWNPslB1h/rd8eZBVDOKXyA4Q4+c
         PIqoUBoBKsQvfMC8SnUXFFNMKrgB5JjutOLWftwD3FoVu7wCYX4Pouyqox9piQ+ypOsE
         vSPg==
X-Forwarded-Encrypted: i=1; AL+hErGqR90hr04JFSKgdlb0uhjvOHK7XkUIcg4VFJsw3WrNh570AMwfbdYlmI3qYqsMqhpKBVw7ClUY+RdNDEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z84mcz4n9AThMGzaE13iB/G+bEaOGXVfDUdAd47Wx0ecUKlV7u9
	0cd72rURUGUk7nIZ96igr3xc3awBCp2kuayaCgyMTFNtasOF8byXKyc3cNyEcU6FVAc=
X-Gm-Gg: AYBFou3WXs6TkpKQVKfGGoKpyHTxFZV0WppdtRUeUCXJ9BSaA17VA308DLcTK8n1gJr
	P+HmvZCJzCLQNfSEn0oDlWdo9HXSA14LbFTAziZfFem0btVOBwp964y5jBeRBqJjVby7cugcHwZ
	E5ohau/rWLxLBcrLfGGW93zu0JwvZ092Bdf86dqNTLv4+pslyMr0ptEeb7eAXC3evYEViF7CFQ8
	yw3O8os3qw6dKzZKsz8QxMTgmPuPKL9so/oxGRwrDOC2OkTw887Oj379mq/zZWqKnUWaWQi/a9X
	iP84L3BqYr3pAfrVtZWooUkMnwrjt7BYGAe+ZIPmnE64Plwa7JJYlJk5i1Cxd1YQ3JfSsri4xzI
	4pbdk1DPZMPpnDpFkYrzhJf35IOPXQQlHUCo2Y8DvEJFdRwqJ69TGEysOvMWmp8mrBPPriRJLsd
	xgVuB5fDa2MyJReKcJyPRf8ngfec0Uk9o347kOq5cC5Ra85rKwLpaNt3xM0g0yJ593Rfx4PiDhK
	JAopWLMI7IF6Ci9r9yAr54dKfycWwPh6nSMBhBbfeigbsie5jIrXsOaAZy6HT7ztJ6j/hb45i0d
	ml8JKWVyqVL3KWf30NOC8regoZcnaNLRxzCqk/wxfhB50MMCZceyXfO398/8dfnQ5y5aqvubS88
	JDSIEa+Vtb8JUpy6fKEH5QHkaJwnG3ag/s8IMregG57jfqihBRCkbwg91oU6lRQ3FfHBS32kZYJ
	MIgvYBjjf9zjwWE0fqaS08OaY3XlYEq1z3f3XNauBHM2y3Z67NhLg1IOYL
X-Received: by 2002:a17:90b:4a48:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b1b0a44a42mr5984883a91.28.1794686203709;
        Sat, 14 Nov 2026 11:56:43 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b21c609esm4089149a91.0.2026.11.14.11.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:56:43 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:40 -0800
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
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 03/13] mm: cachestat: restart the walk after each entry
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-3-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-3-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115640.c707f5c9496fcea4@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Thanks! I've tested this with cachestat() racing against splits and
collapses of a tmpfs file, and with this on top of 02/13 the counts no
longer come out too low either.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
