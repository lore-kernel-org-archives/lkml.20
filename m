Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714743;
	b=M3eFZNqv7Ti8RHxpQy2skMf6P6M9QwoFMrN3hfQoLG8nFQpAF6fgut4FOkvxowMRt0Pi
	 Vt0LmXXRO0RGe+EjUmU+wyFgSbwiAT/jurxNilwy8atwZM3jXKg407m4pTYPc9FbfJyIk
	 21lsIUAF/RhSlMLJ7X7FZAVoffbCCKI9/H3yvB2ORe/yul0o9GzwrxnKU/zxDQz9lLcSf
	 aw0KpbiGn36ZsbJQZxhj7uiflU+w1cKh1Pbwr9v4PZe3LlJQwL8V47jOlJk1Dz0BnS3ku
	 ctOb/4y/IZqz0373NvyI2ypgN+uqsAmDQb9SkKtZd03p7tM37XYlqoQocGAmofQGvzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714743;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sxADwTiymOPoKjzH+kNK1qcY50175eKELUL4Xyb/obY=;
	b=3s497dDZw8invNR4I05cp+RWW3/l83/bPJ00+Q56a2L0WC4rLSZguesSjp5tMsUMLrpV
	 tY/G2A8h8pv9PltbmrTfODjZ+PYJSVZq/NDsR1s8Fx6/6SjtIHHmezr5jtXV6gSyY9fQw
	 tgNMdHrQFlTVyALnc9LxA96aw87amDPtrFDnVAooJ5nkKW31EUy4xHwG0vw3meyuVnk6m
	 CtyItJW+IS4LOgKsszRTQMGT6TGTgI7ZV8RY1vgpeXD8DPotjCyK2NODwT3LiCFU0WGHh
	 LoEk8COHndTq3wW5ynBOcT8bpYzZXwPtEU2Eqig/OcH68sSBWoPZtK1SmH/+cgi3D6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0MyWbRI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF13606A319;
	Fri, 23 Oct 2026 00:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0MyWbRI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90951F01825;
	Fri, 23 Oct 2026 00:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792714743;
	bh=sxADwTiymOPoKjzH+kNK1qcY50175eKELUL4Xyb/obY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M0MyWbRI9ndZnDBGOYs8LY+6VsUtny127F5A1k/NoP5MyzrDTGbSN7mcidSsS7s53
	 6eKdjmiM0/Hcvr0qYnNcXGXFo4vYIYRhHDrcibPNQ5rv/z5+nubhtSqZCGWtrjrjbI
	 MwLjiNv8mvjeFDycII0My7bS+fbdda6YDTira4iOmLhb+JMMcQQgf+yzlIuTq/40DG
	 W2EtAbx9/zoj6DIV87kcfx1Cje0r/ds3dgC4Gn9Q8b98tJGULcQY7yYYEydVypERGm
	 a1Zk6Zx+De0JIAHOPZ9yTN8sdxRxCH9y6ducR7aL9zjOWYf+ybNW/uJ/ctRSKZYruU
	 8OsbQ4mJt3Wgw==
Date: Thu, 22 Oct 2026 14:19:01 -1000
Message-ID: <fa32d01cf66a6ca9818425f33bed0c96@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuhao Tan <tanshuhao@google.com>
Subject: Re: [PATCH 2/3] workqueue: expose per-workqueue stats in debugfs
In-Reply-To: <p973mrs5tkuc.fsf@wfelipe-west1.c.googlers.com>
References: <20261022155352.1293020-1-wfelipe@google.com>
 <20261022155352.1293020-3-wfelipe@google.com>
 <atpzgIOeEecUN9Qu@slm.duckdns.org>
 <p973mrs5tkuc.fsf@wfelipe-west1.c.googlers.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Wilson.

On Thu, Oct 22, 2026 at 10:46:19PM +0000, Wilson Felipe Pereira wrote:
> Why not drgn? For continuous monitoring, running drgn on every machine,
> with vmlinux debuginfo, and memory footprint from Python/drgn, while
> having CONFIG_PROC_KCORE available, it adds up. Having a simple file
> interface, it can be read from an existing monitoring collector.
>
> Why debugfs? If sysfs is picked, not all queues are in
> /sys/bus/workqueue/devices/. Using debugfs, a single file can include
> all queues. If you have a suggestion, I'm open to change this series.

I'm usually really skeptical when people suggest debugfs as a solution.
If you need continuous monitoring and drgn is too heavy, this is trivial
to do with BPF. The following bpftrace script prints the per-workqueue
stats and needs only BTF, no DWARF debuginfo, /proc/kcore or Python:

  BEGIN
  {
      printf("%-24s %10s %10s %12s %6s %6s %6s\n", "workqueue", "started",
             "completed", "cpu_time_us", "active", "cmw", "mayday");

      $whead = (uint64)kaddr("workqueues");
      $wpos = (uint64)((struct list_head *)$whead)->next;
      for ($i : 0..4096) {
          if ($wpos == $whead) {
              break;
          }
          $wq = (struct workqueue_struct *)($wpos - offsetof(struct workqueue_struct, list));
          $started = (uint64)0; $completed = (uint64)0; $cpu = (uint64)0;
          $cmw = (uint64)0; $mayday = (uint64)0; $active = 0;

          $phead = (uint64)$wq + offsetof(struct workqueue_struct, pwqs);
          $ppos = (uint64)((struct list_head *)$phead)->next;
          for ($j : 0..8192) {
              if ($ppos == $phead) {
                  break;
              }
              $pwq = (struct pool_workqueue *)($ppos - offsetof(struct pool_workqueue, pwqs_node));
              $started += $pwq->stats[PWQ_STAT_STARTED];
              $completed += $pwq->stats[PWQ_STAT_COMPLETED];
              $cpu += $pwq->stats[PWQ_STAT_CPU_TIME];
              $cmw += $pwq->stats[PWQ_STAT_CM_WAKEUP];
              $mayday += $pwq->stats[PWQ_STAT_MAYDAY];
              $active += $pwq->nr_active;
              $ppos = (uint64)((struct list_head *)$ppos)->next;
          }

          printf("%-24s %10lu %10lu %12lu %6d %6lu %6lu\n", $wq->name, $started,
                 $completed, $cpu, $active, $cmw, $mayday);
          $wpos = (uint64)((struct list_head *)$wpos)->next;
      }
      exit();
  }

It took an AI agent about a minute to write and test.

Thanks.

--
tejun
