Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793438896;
	b=F5DeaYWlNML09U/AljW0xqAMEO8xBHREwdtgxHWZGLHi6cjffPRXbFR527Lsh8kKg4sR
	 y/FbY4KiDgkEKn/ijorDeIrKFaIBfnQLf9VsPCxMvyS+IwevWZUIqkbW4cyOyH2H9miV3
	 WAaeNZPU+g2lGE/309mT82/8DDXXN7CWtM954FyDtN30zVsoU4w1LjT3AFQlNdzRthJU6
	 OYolD7+m32Ou1Bbgw4AqM26OOjY77Szstl93CheJRsaOghBNtLqfpH86aHdZS45MW85RF
	 sR5nEO4S+wkfzX7hQxDXn21tG2+d+Tuq/uIdhr/O7ujeiInb4dueI6KLtC0gCIuqhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793438896;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=/He75rqZEHTrbQuKFrcjCckncTUr+jB2aL3GERrJXuo=;
	b=E9u6yI5lfs6ZCdy0hp3b2Zj+6nPhotB7v2l/OvW8twi1zMyg+c808gmO4PUgmYbYaOMJ
	 e3XcFyedvHXV3qzJSlVfK+o/HWoQq/d3CR5jG8n62pmipmFs2CvZZveDFTAxFQg1LMrUw
	 zpFpBbr47mj6iwsdxvfxGX/bsURNLIqV6li60OpgCcjBkqAkudyU5YSfTMqI/9x7H9InY
	 ypzNoTLcpVAfrK8422hRe1Lye6tuIklC7/OSocjolPLbcYlpr3RfRKqsw6o2GPH0di4f+
	 3hHogQqw80tarmoxEPGrS5S1YTsZvGnUWZ35HkkWjb0otSuH9/SlungMoKjnesNju+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.75
Received: from mta0.migadu.com (out-75.mta0.migadu.com [91.218.175.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159D606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8159D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=08Ba43Ng1QTJoClFmEOcfURkhCB+iyftKxXyUWNmLKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793438888; v=1; x=1794043688;
 b=sVxs5SaDkDBa09uTFu4hFJOaqrtNtfEPrN2fBpSuwy9ko181eiquYUD8AOWi9trGcmunnpcx
 sLJzJIJ+JB9/1wP5f764vUWk8rhW4KYWW1Qfb0Kx6k3KcUZKmeE4KbhbIDn+wtMKR2i8l7yWZgt
 o5KYGeBJItZdvSCZKs9EPhTo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 034d958c6540cbee;
	Sat, 31 Oct 2026 09:28:07 +0000
X-Mizu-Trace-ID: 034d958c6540cbee
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
Subject: Re: [PATCH v5 2/6] mm/vmscan: move vmscan tracepoints to a local
 header
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261031090041.58574-3-ridong.chen@linux.dev>
Date: Sat, 31 Oct 2026 17:27:45 +0800
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Dave Chinner <david@fromorbit.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
 bpf@vger.kernel.org,
 Ridong Chen <chenridong@xiaomi.com>,
 "open list:BPF [MISC]:Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org (ope>)
Content-Transfer-Encoding: 7bit
Message-Id: <9F0BED6B-4992-4F67-A8C6-D9550FBCEF22@linux.dev>
References: <20261031090041.58574-1-ridong.chen@linux.dev>
 <20261031090041.58574-3-ridong.chen@linux.dev>
To: Ridong Chen <ridong.chen@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 31, 2026, at 17:00, Ridong Chen <ridong.chen@linux.dev> wrote:
> 
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> Move include/trace/events/vmscan.h to mm/trace_vmscan.h so that the
> tracepoints can be extended to reference vmscan-internal structures such
> as struct scan_control, which is not visible outside mm/.  This mirrors
> what several other subsystems already do with their trace headers (e.g.
> fs/fuse/fuse_trace.h, fs/gfs2/trace_gfs2.h, fs/lockd/trace.h).  As they
> do, set TRACE_INCLUDE_PATH to "." and add mm/ to the include path of
> vmscan.o, the only user that defines CREATE_TRACE_POINTS.
> 
> No functional change.
> 
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks

