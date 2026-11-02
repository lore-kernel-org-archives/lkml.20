Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622775;
	b=yQEQfx+boK/z+lAnjSHTZL1vUuqsQIBsLWxpfmfZnOwV1ixy0fXc57QdwIjhZdA73xGo
	 EaT+BxerrRs+kYu9yj1cX62QfUDfsgwFUPRktxmsH5mOrqMZeHw7ttEodykXxj6rSpFON
	 xmJnTqjN4Z636BuAz3IyqJ7TSAVrRDgpX1h/76yRSR4CfF45NAIZ1zs3Ac5iprktc3nVI
	 LDax9BUa3B7P9pz/B9ed4PO+yCPmsLxE5WmPBZZD4haAe8KWuYYf9K4EmrTqy4ETun3Rj
	 PVrq2DdmsPMWBar1N2UsOhWw0v8KZN7Y16EbBVMC0W7uwqx0OuSQNgyNvEvLNhch+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622775;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MQ19bcwaq603ARreLcaNlnVPX00FfirjVvY5HRr13fo=;
	b=ydi4pj/vAYEJwmWRCtQwxJZxDTfjXi3RNRW4zoxd1ARX2wfuJZR9/n0h56Ss5GpgaqYP
	 h+FKcP6jB1waJJRUKIVBcAtenQ/3KcharDEfazNNueZhmYJpJV3x8vrfJTcvh9VZPlwAm
	 A0lQiC8dEdML/fzLh+ZdOwbRTErAEh6HfrBvprjLYVf1E+5hE3Ib0a5UPS40sw09Wcq/P
	 i7XRKHuaAtSPAMMtEr89abKCeQkAJjVj26gg1DHuGuMJNEZxrcDOuVNHEv68mHUqFR+0j
	 phgBJ9uGSeTBw7oBigl6Kme9MDIZ0+jmzvhJr2vvb5hF8+XjR3NT6Tzwv1n4XfY80BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F7606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE2F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95bd1c14cso26834575ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622774; x=1794227574;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQ19bcwaq603ARreLcaNlnVPX00FfirjVvY5HRr13fo=;
        b=rkzJSkgFSeVzYa6c02jLWVnk2sHJGaRiIJhCXfkdzCF2bnHpLnhI7Al0U7xB1kUBIz
         c1lh5MtbRYe68EbVpUKtPRKiDRvLLhHvHJEPAaXNq/LCXOI1+nHwY2eHWUJI/yUYVMZy
         zuy5xQZwTXmHoAmOzenfAiObfzF2GexFu0zI48O1xLPs9A9c4HfVzSODeHzYLUNxWpgw
         hm7qXHqaGumGS7KW5KHLxGt2OmtXuqsWlxWMqBp8hUykExAMNR7QhB6lSaA2mUESSOuj
         k+3V+NalfRuwPKIpXSO71WN23XhG6a39qV2su4tySTWXkaRibWz0mvI3xOk4LkcWVGGG
         6TSw==
X-Forwarded-Encrypted: i=1; AKwUvBzXaxisNU3uF9hI4XCMOoWyEMiLOwJGmEVL5DErjYzWGP5MODKMFs8bO5De8krtndUh6e3b6iyA2PcYD1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ijxTI52U/It8brV+1kOoPNhd5fss6nQgh6sQEAvDg6Bm1lJs
	bZH3Ji2gFLiRmapDqQsV0dOJspuCKkJ+eTQjNVLYrYCClKYRX5dylON8A19Dh9cqsvfl
X-Gm-Gg: AYBFou1lPEI4uxvgMSXmG5/Gk5nSS8a8y2cvRrrSoN1LgP15GXr7S1MYcnF9OYuUZMW
	oFTiUrgs7AWUJVs3ww7vKhSXpJ1D5AA00RoFbrgKaLxgJvMqXT+b8u8h2BrC+REP7wjbTfIeYmM
	mM1WHf0B/xa8Hwc8IyaFlPVXWRhFBFAozKsqo+QMUTkigkL8ed1eG4ye96qDRnbKTJtrI5jLSuV
	MOWSdkKfJnSzE9Mi/g/g14M2FGsQujcxls+N4zYjHP0q4b9KM+MY16cUWdyR+h/5qTo+lc2yz+5
	eI4yLUSe3GaU0OARkuHqMAkFFTmtpsT2+P2CETBClOr82D41W30lvHPJ+koHpZxi8gLsIqCTPqK
	eKDxZa0h2w6hf6M0qoOGWOEdGZZpQC+c5nQ1n02u2wtjAXz1TdY8pjOXEaLIc8PB2GAsyfEHRfA
	gP5jyl1xRwsjWgSC1IFL7KlSJbFJGB/VpbUBAk7Qsbnu/qfTfINkbTTc9WmzJvHNHbw/NWBzuuD
	GaDKAXbPVBLLkn4bQ6AtHIizEEs0N+kU9QxzvBbYt3EwZsKGJx/+AfixLBLMiccml/VgZOZTKQu
	7iJcyODyAuz8o+nZlMqgJrX6ws89mMTfvJ2CyNmxaIwFv8ptcrwSFBy66rZjHlzwwZzfROsYlLR
	Wcoq9wrKlkBrd9RTimOoGxcn9jNKdMYRs8VO4p2VOK70pgQV5ZRIyDsivfxWq
X-Received: by 2002:a17:902:e890:b0:2e5:98d7:821e with SMTP id d9443c01a7336-2eb364026a5mr93260695ad.7.1793622773885;
        Mon, 02 Nov 2026 04:32:53 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm27101845ad.32.2026.11.02.04.32.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2026 04:32:53 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Richard Cheng <icheng@nvidia.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cxl/edac: Read cached DRAM event records under the
 xarray lock
Date: Mon, 02 Nov 2026 21:32:38 +0900
Message-ID: <20261102123233.74598-r1-ai@linux.com>
In-Reply-To: <aug-xbNiSauAAjjx@MWDK4CY14F>
References: <20261101013418.87326-1-ai@linux.com>
 <20261101013418.87326-2-ai@linux.com> <aug-xbNiSauAAjjx@MWDK4CY14F>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Richard,

Thanks for going through the whole series so carefully. v4 is out
with all three of your comments addressed:
https://lore.kernel.org/r/20261102123233.74598-1-ai@linux.com

On Mon, Nov 02, 2026 at 03:56:17PM +0800, Richard Cheng wrote:
> Did the bug actually happened ? if so , can you provide the error log ?

Only with a test-only delay. Without it, v4 ran for 1800 s and the
unpatched kernel for 900 s, with four repair loops and the host
injecting events with no gap, and neither reported anything. With
mdelay(20) added after xa_load() in cxl_find_rec_dram() and after the
lookup in the sparing path, the unpatched kernel hit this after 120 s
(trimmed):

  BUG: KASAN: slab-use-after-free in cxl_do_mem_sparing+0xed9/0x1000
  Read of size 2 at addr ff1100000670732b by task c1-repair.sh/153
  Call Trace:
   cxl_do_mem_sparing+0xed9/0x1000
   repair_store+0x1d9/0x340
   kernfs_fop_write_iter+0x337/0x510
   vfs_write+0x4a2/0xfc0
   ksys_write+0x111/0x250
   do_syscall_64+0x10e/0x5e0
  Allocated by task 68:
   kmemdup_noprof+0x20/0x40
   cxl_store_rec_dram+0xb0/0x360
   cxl_event_trace_record+0x617/0xd40
   __cxl_event_trace_record+0x14c/0x1d0
   cxl_mem_get_records_log+0x27d/0x540
   cxl_event_thread+0x14e/0x1f0
  Freed by task 68:
   kfree+0x1e3/0x5e0
   cxl_store_rec_dram+0x154/0x360
   cxl_event_trace_record+0x617/0xd40
   __cxl_event_trace_record+0x14c/0x1d0
   cxl_mem_get_records_log+0x27d/0x540
   cxl_event_thread+0x14e/0x1f0
  The buggy address is located 43 bytes inside of
   freed 128-byte region [ff11000006707300, ff11000006707380)

Offset 43 is media_hdr.validity_flags, the second read in the sparing
path, and the record was freed by cxl_store_rec_dram() in the event
thread. I can send the full log if it helps.

So the window is small in practice. The race was reported by Sashiko
from reading the code, and the delayed run confirms the free and the
read can overlap.

> Seems like the root cause is that the cxl's rwsem was only protecting CXL
> topology and DPA, while leaving memory problem's entry ( those xarray entry )
> without protection.

Yes, that matches what I found.

> Using xarray lock is fair for me, keeping the access short and the entry
> already use xarray as bookkeeping, though I'm wonder if there're better
> alternative for locking mechanism. we might want to discuss abit about that.

The other options I looked at were kfree_rcu(), which needs a wrapper
struct with an rcu_head around each cached record, and device_lock() in
the repair path, which can deadlock against unbind. A refcount per
record would also work, but it adds get/put to the event path for a
lookup that copies one small struct. I'm happy to switch if you or the
maintainers prefer one of these.

> What if we copy the whole struct cxl_event_dram ? PPR can continue
> passing NULL since it only needs matching result.

Agreed, that keeps the signature stable if callers need more fields
later. In v4 cxl_find_rec_dram() and cxl_mem_get_rec_dram() take a
struct cxl_event_dram *out, the sparing path reads validity_flags from
its own copy, and PPR passes NULL. The cover letter now describes
patch 1 first, as you asked.

Thanks,
Jongwon
