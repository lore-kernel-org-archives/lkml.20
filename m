Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983684477F1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793079; cv=pass; b=aivJDZBd3HQ6nzsZ3+hiz2vN+EawN19RMnVq52PNyfGdJOIgswvwGyzKJZabv1h8b2SUECBGO7+KOSx7N1FXiVT/zycJM92T+1QffEWF4Rl/qbnBoCB7QnDOA7Uap7qcYXAXD+zesZkhHWJz9IIUfw7rK3hcXlcdzwPBV3Oopec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793079; c=relaxed/simple;
	bh=1GLLejLzmf38Sqpzl/J1qn5yJLV3HZP8rb7jIFgq2Vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBbzsGIjrjwlULZwgHqK6umszQwANUOOWJ0soKMnSdkk6XFKSvC7ra1x4l+3M0Eh7DZW0Gpd/m6rv5MeQ5XxXOwrqdg9IqZ6f/LbSksI5VwqQytdWr7ClQeMTrOioB8DKSXjb7si4aGT/mBzuGSoJngr0aBoouh/3Gw4eN1Qwgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=ZDd4GRkQ; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="ZDd4GRkQ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c2520ad38so3647912eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791793078; cv=none;
        d=google.com; s=arc-20260327;
        b=Psvvjjlx+eUiZGekj6rdZIwpMCyyVkFWyowhVnsKQ4vtYP4MYsQ3kJ0eTKOYc61PaT
         gO/0cE4dYX2eSPHI314kzOuxMDaRcQuh0o6wOR4R8sKd52juFKLykmSdtmlcQA712A5D
         PsMeOn5cAtW816G2JXDCNE2o21Ybw3Gj3AbC9XVfcoQ1YQZCmwyXEoGaAH8j6GUpZm/d
         vQjgxqDtIR8jiCcRjsK7B1ZbQRXze6OnX39219fkCVJCd5H7a8pN1EK59AhOkBhewlf7
         v+kn6z7hpEP+SJKdXU4Q/+xJd9Yaaz2zn3rXq7PWnR2paPoP88cxVzt5gkhFksPmT3xx
         czSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Dd4TAZB19XGjWX3ZomXrsadjEIedrZeOBjDL75jfIE=;
        fh=6Vybm5cYq65ziCeu5yI7TtzVrMmXqbebnN5/+PIdXVE=;
        b=e8v/Hlq/4rxVZCtuvkgnntcHr1eRiIltHfx1F33RMV+1T4gqNeEIxPAlvplK6d6sRL
         i2BfbsQROqPCKDr/E7CQUIDlijmprbcNB7UpWjsifDNxarpGVfe7rTjKZUunDNtRIa7W
         SnHB2tpyIvhk9wF7UzgYF7YMBcntUjMWyatMDj1MZU6ofkbtDs77Wfqp39wuksX95O+b
         Y1ti+87k6DwVo6d5wh8x3Ynm+f6K4iYFgOHe3V5rbPpeD4c8TcREHviUsU90z1WckK7y
         vn9jgwEHXeLOUUv7cG2SmvhjqfcvkW1RdVEEW8ThNPOvzOMzwl5YDShMjOvmgIFtc+LD
         wLQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1791793078; x=1792397878; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Dd4TAZB19XGjWX3ZomXrsadjEIedrZeOBjDL75jfIE=;
        b=ZDd4GRkQlr+cV2bZlli0MKa/uFLU2ghsGslO1Hg2wxhjtJjoK+re0KjPo6MeivTaVv
         8RWOEGa7LS4jHPM990Ls5MHaK1OldubIiPigS47fRYHIwWf+imiS9biO58axwmZJoOob
         4t6dXZ5Bc1+RTWUUXl4zrQj0h2Ql2s2/t5GYcgok+Z1g78tDU33KD57ynQADbVV4+3Sf
         NzPSZ/mfCOwGhKiOTBTa5wHmE8ztD6WiRwXztk/dyptbzTvDN7qHNO16tvK0a5eHFv4P
         Cgx6/MdGhkmX8bga6Hw19GVes9xX7OMwdxzY+AbP1ruj2P8sXsiH3nw2LAu8x3DqtRgI
         OOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793078; x=1792397878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Dd4TAZB19XGjWX3ZomXrsadjEIedrZeOBjDL75jfIE=;
        b=C4ZD41ggKtFIJvz268LGxp6RodZ7I6RLmUT/yHALir7D4oxvJT4k1747+mX4H4LFf9
         QNU/GfDH5xxaTAWYFHvuwSyBqTDXM6DiTZfTxMIgVGhkrGO47MYosxeScbjK9g7PCkLz
         Hv+a2n4bbNHMJd5RnRNKFnLDV3B/KMo4uj3OXfNZqGn32F1JiA7F5BdEmk6ja2u0Jf/V
         f41SP8UvWiAaWQxavsSSQyw4V30+G4F16tZn/jdPlVJHyBU4zMIU1CjblX2mGi3QH2cF
         yy0Yn6vSmZTwmsU7ieZnPv6XN2mqcBdw3G+TOme+5J9gt5feRtVYiJSkskw3EeGdf5+M
         nARg==
X-Forwarded-Encrypted: i=1; AKwUvBxeg45c+U23QgxoTNQAU831Hu2QPHLaYMaAYh54XIYiUXcyl8N0g9nlWCqpHc2PjzKgXtCy9A4JyFLvJps=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGCJ7YKeCb7GdZCwherjcCVvc9hMvWnJ6adXviPHhvX22k9AMJ
	5ojNjPsQgrE/MF74dbiXFVcWMebdoOllezpm274OGr+5ogC/15wIUmgtfju5nDIi4iBWebOduUx
	q/kj8YrUMCsUFSIhHfiBETZ+GXCfhgz/tiH1+IPT+NA==
X-Gm-Gg: AYBFou3ur/X9DxxwXBOqXTo5xGpAljkgzgtpMJeiJ7QtI32DEpHQn5vBboiIWUODEKx
	1UHk+/uisTHEMfKclgfJk1D4c+TdXH1sDU2d87kqOkHebeBsdFNWjQ7epeAkR9B0IL3+Bj/TQc3
	2Oy9KNP6VAC8bQ0ya6kF/pHFUBIJX8TLjr4sB8tbP1jWS/xafv8Gssy3/zVMKnHsIKe7aUoytKa
	urOxclT4SOf1X0wjeGUKvTQnphil3i4LGw0wPZlEZN7NV+Tkl6KhDGV/ZWBhqJQWIjt1STORa/6
	/UteDBjBva4bwYSYEGPtBXgeJYO9SZGRUzfsTOWsFXolzt6dtvkIPes=
X-Received: by 2002:a05:701b:4305:b0:149:d501:b990 with SMTP id
 a92af1059eb24-16a5f3f191dmr9983232c88.25.1791793077611; Mon, 12 Oct 2026
 01:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911032905.63683-1-mingyu.he@shopee.com> <aqRXqcynCx88D2QK@linux.dev>
In-Reply-To: <aqRXqcynCx88D2QK@linux.dev>
From: Mingyu He <mingyu.he@shopee.com>
Date: Mon, 12 Oct 2026 16:17:46 +0800
X-Gm-Features: AclHuK-_Zx2LzZN02tzISzVWGha4IvMdOMWo2JFUzwRP2aZsF1MCrxc-_yMLwpY
Message-ID: <CAAoBcuS=sqOAPFr9Gda9aTwuCMHMPzBMEee8qvPNHtNxrRWKuw@mail.gmail.com>
Subject: Re: [PATCH] memcg: keep propagating stats updates to ancestors
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	littleswimmingwhale@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Shakeel,

  This came from a reproducible workload with a custom in-kernel consumer,
  not a conjecture or an AI analysis. I uses aggregated file pages statistics to
  decide whether reclamation is needed.

  Tracing showed leaf stats_updates at 6656 while root stayed at 6144
  (the threshold). Further updates stopped at the leaf, and root flush
  requests were skipped.
  In one reclamation check, memcg_page_state(leaf, NR_FILE_PAGES) returned
  about 2.64 GiB from the aggregated statistics. In the same invocation,
  a bpftrace probe sequentially summed the leaf's per-CPU NR_FILE_PAGES
  counters and obtained about 6.58 GiB. This sum was not an atomic snapshot,
  but it exposed a large discrepancy with the value used by the check.

  The periodic flush does restore progress. But issue for this consumer is
  the missed reclamation decisions before that flush, not permanently lost
  accounting.

  Regarding the BPF interface, the implementation in the tree I found is:

  __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
  {
          mem_cgroup_flush_stats(memcg);
  }
  This bpf function still uses memcg_rstat_updated() benethe.
  It doesn't handle the issue.

  I originally called mem_cgroup_flush_stats() before reading the counters.
  After observing this issue, I switched the consumer to css_rstat_flush()
  on the relevant subtree.

  If waiting for the 2 seconds periodic flush is acceptable for this
function even
  under continued updates, I agree there is no need to change it.

  However, the comment in memcg_rstat_updated() states:

          If @memcg is already flushable then all its ancestors are
          flushable as well

  Concurrent counter resets can invalidate that assumption, as the trace
  shows. If the early exit is retained as an acceptable trade-off, could
  we update the comment to acknowledge this and the reliance on a later
  flush to restore progress?

  Thanks,
  Runli
