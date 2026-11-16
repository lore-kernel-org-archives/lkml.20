Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845705;
	b=B3Zwp52bPMl1tWsrhqF1hRspMTrTsYL1aflXinyJQ2EgToU3lqOQAlU45BjtDnJONoE0
	 2v618oG1g65InfhATG/C4HNNUezsdQs3RQ6p2O+U2n9R4V6KfL3XYFTq5oOSgDa110qy+
	 AX6D5wn7YW5x4otY0709oP9Ip1Jl/rVknSrSJHwkUxChLqZ2Sy4OMupCclvxoFuhWfIO1
	 sLjGtSKkETnjc07fQxqvXAWDOKkcWF/XvOXLOVlJ8xORSxDiXQNguY6nskeFJBvPGNUFE
	 CU03j48x76c+oeVvFx7GWaMqLmgnYOJXbggzDeLVj7v08zBWnBYjdHo0vblwTP2gOaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845705;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:MIME-Version:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Report:X-Spam-Score:
	 X-Spam-Bar:X-Rspamd-Score:X-Rspamd-Action:X-Rspamd-Bar;
	bh=V1xlPrcwevkHhhF1roij2EQNXI7xAEc4iuT9utCLcHU=;
	b=ymuvOdfnv+Lt1GCWIWfclvt075yxn7oiyxOR95zcA6xdnTNy6eRJCEYq/b9Ov5YenBgQ
	 pMn77jro2n7KXg0QIUin7kmANLeJi3uZE6KAdxGx3OFKk4skSz3JJ3ghTSvO9Is9y3Mt4
	 t7CWm13IwWYJcPNyy0uW3F6Rmxx6V8fHgo0HUtkE6rZzn7801t3CylTW41OCr8AVKN0zx
	 INZO/RrQ7nmg/XWcnlXFVXS3rViEcY+tWSJ/OHbJMTVRcv1izZje95MhuyJyiH5jSMHS0
	 TpukoxL/TZ4/jRkhUECMLsd4CzUaHJviGetwppTyn++gjKIRBaBGBdoIVPh6lhYc7iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=BGQS84oB;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98156606A336;
	Mon, 16 Nov 2026 16:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98156606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=BGQS84oB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=V1xlPrcwevkHhhF1roij2EQNXI7xAEc4iuT9utCLcHU=; t=1794845704; x=2110205704; 
	b=BGQS84oBfA/4Pb4w0HSmSzHBE9/BN68fhzTvx8qDcAtXM+PjzI+77v88SD6aHHPXGgI5a753le8
	HdPP2OoCT+sCkSz/9MaxkSc8OaNS3/XfNjWStew7jV7yCWjzdJOvKGzHgvkw543BR77bybYkXzrPj
	7KZGSXx4UZ2tnnpPM50wpvZpD+mJxvxQZhlHbxlOZgJRtZTrJ+E0VSb9otjnrhmYcfouZZzf0V3XY
	DTZzQlX1PschojOt40y63nmL99jy3GIq9OOdfybFWmOZxMP0cvwAB+MeE97Snc3W/+QAkxugdqk39
	CQj8muCkcemXyAj2oE+zl495M5I1xp15ayDg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xSzMD-00000000GW9-3vsL;
	Mon, 16 Nov 2026 17:15:01 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1xSzMD-0000000Gjcw-16AI;
	Mon, 16 Nov 2026 17:15:01 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1xSzMD-00000000XqJ-0TQo;
	Mon, 16 Nov 2026 17:15:01 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 13:15:00 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Po-Hao Huang <phhuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw88: fix skb leak in hw_scan probe request length
 check
In-Reply-To: <9AF24DB9-D92E-479C-A678-0571B1557198@linux.dev>
References: <20261113-rtw88-hw-scan-skb-leak-v1-1-3bd47562abf6@igalia.com>
 <9AF24DB9-D92E-479C-A678-0571B1557198@linux.dev>
Message-ID: <f230c2d62e866f2d645216226cd80b2d@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.9, Tests=ALL_TRUSTED=-3,BAYES_00=-1.9,KAM_DMARC_STATUS=0.007
X-Spam-Score: -48
X-Spam-Bar: ----
X-Rspamd-Score: -1.0
X-Rspamd-Action: no action
X-Rspamd-Bar: -

On 2026-11-14 10:40, Luka Gejak wrote:
> On November 13, 2026 4:17:33 PM GMT+01:00, Mauricio Faria de Oliveira
> <mfo@igalia.com> wrote:
>> In _rtw_hw_scan_update_probe_req(), if the first loop fails (goto out;)
>> the
>> skb is leaked. It does not reach kfree_skb() at the end of the loop body
>> or
>> in the second loop (out:) since it is unlinked from probe_req_list.
>> 
>> Fix the leak by calling kfree_skb() if the first loop fails.
>> 
>> In /sys/kernel/debug/kmemleak, after simulating the failure:
>> 
>>  unreferenced object 0xffff88810965a000 (size 232):
>>    comm "iw", pid 4729, jiffies 4345008185
>>    hex dump (first 32 bytes):
>>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>    backtrace (crc 20f7de11):
>>      kmem_cache_alloc_node_noprof+0x302/0x380
>>      __alloc_skb+0x74/0x2f0
>>      skb_copy+0x57/0xe0
>>      rtw_hw_scan_update_probe_req+0xff/0x230
>>      rtw_hw_scan_prehandle+0x4e/0x180
>>      rtw_hw_scan_offload+0x186/0x1d0
>>      rtw_ops_hw_scan+0x61/0xb0
>>      drv_hw_scan+0x81/0x130
>>      __ieee80211_start_scan+0x2e0/0x760
>>      rdev_scan+0x42/0x100
>>      nl80211_trigger_scan+0x53b/0x730
>>      genl_family_rcv_msg_doit+0x103/0x160
>>      genl_rcv_msg+0x1b5/0x2c0
>>      netlink_rcv_skb+0x52/0x100
>>      genl_rcv+0x28/0x40
>>      netlink_unicast+0x26d/0x3b0
>> 
> 

Thanks for reviewing.

> Should this dump go under --- so it doesn't end up in commit message?

IMHO it does more good than harm, so I'll keep it per your earlier
reply.

>> This leak exists in the first loop since the function was introduced, and
>> still happened with the addition of the second loop, in these two commits:
>> 
>> Fixes: 10d162b2ed39 ("rtw88: 8822c: add ieee80211_ops::hw_scan")
>> Fixes: d95984b5580d ("rtw88: fix memory overrun and memory leak during hw_scan")
> 
> Should this perhaps cc stable?

Yes. I was relying on Fixes trailers implicitly, but that isn't
guaranteed; added an explicit Cc: stable.

> 
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> ---
> 
> Either way I'm fine with the code, so just fix the commit message. Feel
> free to carry the tag for v2.
> 
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Added; thank you.

> 
> Best regards,
> Luka Gejak

-- 
Mauricio
