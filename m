Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887000;
	b=iyEzXauoH3efHSXP8u7dFzBTkpZ7IO5P6QcglqxPHx7B3M0mQddESCS3lULWi1k7h279
	 D6z7OxrB4iV/2nCEtYueFeKA7TMbnEZ5E4a7hg4/El8C584zimxXI9e3tXdI2gs2JhNvB
	 k2fAWGLL+X8KkyJLrIYdZBT/7S76HChOGrExYpA89DLcPC+GfQB9JiZvI4zBqrww7JQtP
	 v1JMmJvKJqO0N2sP9EBLcqCtlsoy/7doBm9UX+Dk0jZ8WoOigculH9RnYGk2L+DviSnu7
	 i69F2xjU1P1aNCHm/VN1xJkxgFMaWg3rMWHBIyoKnCJKqd8NH3JfE/HXkCB0r55Wt/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887000;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5de7j5buijetKe9mhmqKAeLcHieeqVgYr8IfmGSIxhM=;
	b=n8G2Au5z21sBhpyjESPsw1EfE/2wV3SZOfZtXpBBWwy8atEs8+5uCxUkjz8NLFWWYefs
	 tqqelalstiHkgbXbTW0gW/+FdRk6ITxDU8gc9/a5HZlVqiOCdGA8BMpIjiGtAAGM+yB83
	 5hexQ1LwBM3dD/luTRVJQfHXofr5GQAymJvfHoQbMt0snRsd4FSmVJ4ly/OfSgz6WWsDp
	 EBFN97VkKYPpADQcVmFgCK7H9rZfU2QQ5Gmtwd+CweIZ/B51mBqPodiFjydRA5kXeQ7Ad
	 GrbbWv4GBL0hrIjkXsrKyXzRsBFnqXdCHmBXA4aE+YT1Uqtbc0VJltHPPQ9fqdFey4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Kemm3CLw;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E816B606A31C;
	Tue, 17 Nov 2026 03:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E816B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Kemm3CLw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Kemm3CLwCcIKAD933FqXmrDxKMbH2+HVT/bov0HfMmyUNHWO8PP0IiZIaP8iJWrv12oUwv92jmRl4
	 gmuKXl1ZtCsW/4OsVql59F3pZX7IRMTOp7Vy7DMPo6mKvYnKy3Wp6W6wiRiHwIm3+wwUyWkl055dL1
	 TCjAC2P6t0RWcScI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afbcd54e5a-0a617;
	Tue, 17 Nov 2026 11:43:16 +0800 (CST)
X-RM-TRANSID:2ee96afbcd54e5a-0a617
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.50] (unknown[223.108.79.102])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76afbcd527b8-a1a99;
	Tue, 17 Nov 2026 11:43:16 +0800 (CST)
X-RM-TRANSID:2ee76afbcd527b8-a1a99
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Daniel Wade <danjwade95@gmail.com>, netdev@vger.kernel.org
Cc: razor@blackwall.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 bridge@lists.linux.dev, linux-kernel@vger.kernel.org, yana06070@163.com
Subject:
 Re: [PATCH net] net: bridge: fix skb leak of reinjected link-local frames
Date: Tue, 17 Nov 2026 11:43:15 +0800
Message-ID: <1794886995000.600537.2725044486872632095@cmss.chinamobile.com>
In-Reply-To: <20261115130211.7724-1-danjwade95@gmail.com>
References: <20261115130211.7724-1-danjwade95@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

On 11/15/26 23:32, Daniel Wade wrote:
> br_handle_frame() passes the link-local frames it neither forwards nor
> delivers (01:80:c2:00:00:02 to 0d and 0f, unless set in the group
> forward mask) through NF_HOOK() at NF_BR_LOCAL_IN. Since commit
> 3b2e2904deb3 ("net: bridge: fix per-port af_packet sockets") the okfn
> only learns the source and returns 1, which becomes RX_HANDLER_PASS.

Before that commit the okfn called br_pass_frame_up() and the frame
was consumed on reinjection. The leak starts at 3b2e2904deb3.

The queue paths hold up too. Both fail-open exits in
__nfqnl_enqueue_packet() reinject NF_ACCEPT inside the enqueue call,
and nf_queue() still reports the frame as queued. nf_hook() returns
0, br_handle_frame() answers RX_HANDLER_CONSUMED, and the single free
is the kfree_skb() in the new okfn. QUEUE_BYPASS just resumes the
hook walk. If the remaining hooks accept, nf_hook() returns 1 and the
frame is passed up from br_handle_frame() itself. The branch now
matches the 0x00 and 0x0e cases above it, including the *pskb
assignment after skb_share_check().

No other bridge okfn leaves the skb with the caller. Delivered frames
reach netif_receive_skb() through br_pass_frame_up() and forwarding
goes through br_forward_finish(). The link-local hook was the
exception.

Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>


