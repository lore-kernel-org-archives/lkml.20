Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFB04F648D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455920; cv=none; b=WwHL/Pw/tKvOQbUnsrwEGd/V5G/sz2rzlDPUz7kUhVpqHWo5d7Q+CGfmjVmWrNL1CvACs/bjSaOKuE1czhmT9SwsLe90hX5uXdTN+q91vtQIzsNgepD3F4XPh67VFjuDQLNl/rN63KQ0kx30RA7mTSvHva1BULfIasDZh9mFejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455920; c=relaxed/simple;
	bh=48a3toOvR18Ra0dPY+h4+qV+F4oz76ihqdhRFA6Wyq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtuB0OQModdAeqSgmJQDPbY22Vm2luD6zmVvLw4nTUpGGn+bqwhULVnKPoNV/MDg7LF/YAVk7U3HMDvyucuyUi0oVXcjby15QVzU4MUQNFlgFaXgABXFSxoPFBTtuRj+4A7asnu+M5ekqK8oN3SVt15bhw0wr34arETTCFvWDTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xszAiWsp; arc=none smtp.client-ip=95.215.58.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xszAiWsp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=48a3toOvR18Ra0dPY+h4+qV+F4oz76ihqdhRFA6Wyq8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788455914; v=1; x=1789060714;
 b=xszAiWspvhN3djEez38IGbJV6LtzxRUcRaNOVY8Vqb+LFZjFX3exHgVy5GCrBuOjmorOiVl9
 vAXsluFhtsov9PvC2+nio3Se18K/hAdUsneQF4q3Ca6YRUI/JPXXXpF8hILcBt/eumG3xkAUVNj
 KyCkzDWSFNTuYy/swN+KfrwA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fd62f8eb6babc664;
	Thu, 03 Sep 2026 17:18:24 +0000
X-Mizu-Trace-ID: fd62f8eb6babc664
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 10:18:23 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Martin Liu <liumartin@google.com>, David Rientjes <rientjes@google.com>, christian.koenig@amd.com, 
	SeongJae Park <sj@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Wei Yang <richard.weiyang@gmail.com>, David Hildenbrand <david@kernel.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Al Viro <viro@zeniv.linux.org.uk>, Yu Zhao <yuzhao@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mateusz Guzik <mjguzik@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Aboorva Devarajan <aboorvad@linux.ibm.com>, David Carlier <devnexen@gmail.com>, 
	Josh Law <objecting@objecting.org>, linux-mm@kvack.org
Subject: Re: [PATCH v21 0/6] Hierarchical Percpu Counters for RSS
Message-ID: <apmrfy5zsjmWMNj4@linux.dev>
References: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>

On Tue, Sep 01, 2026 at 02:28:45PM -0400, Mathieu Desnoyers wrote:
> Hi Andrew,
> 
> Here is the hierarchical percpu counters for RSS accounting series
> rebased on top of v7.3-rc1. It includes small bootup fixes which were
> needed to fix bootup sequence on specific architectures, and a rename of
> the test config option to include "KUNIT_".
> 
> This aims at replacing the prior version of the series you had
> in mm.
> 
> As a reminder, the goal here is to provide more precise RSS counters
> through /proc. A future step would be to also use these counters to
> speed up the OOM killer task selection when OOM is triggered by
> memcg. In whole-machine OOM situations, latency introduced by the
> OOM killer task selection may not be too much of an issue, but for
> memcg, where cgroups may routinely depend on the OOM killer, the
> acceptable latency tradeoff is quite different.
> 

Hi Mathieu, can you please comment on the Sashiko's findings [1]?
Worth addressing or not?

[1] https://sashiko.dev/#/patchset/20260901182857.26690-1-mathieu.desnoyers%40efficios.com

