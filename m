Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676641;
	b=K4JEA+CgbkomzTU0LKIG/vR4fVGgjrmbViPp3KzhEgvJM202OVxtrvA+YkZXp4IldTx3
	 vyZ6KVf7fxE3I50FBZge4CAHqxIIKQDFuNLG71tu0VVsYwidLzGnlugLnNp7+gm2gFkn6
	 /sHZ1ThosW1BiZ29/PU1YmQbuO4rlG+Kh8cFd4z4UQZkrDE2RLTgwSGdbK38BVXlTdy8U
	 i83+zlcqnm8SvTAzmECclcecBXrooO61waXzsfbnI+51O5zLeNdpeBGANcnk6fcRF/Y4O
	 r6upOBsNxwJboceCcSC3GuYxZgnIrcBqGx05BwdaD0B5INOHcwPtmryo7bgiVVEtuCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676641;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=p9RwlCMCtgQ4LD966DG+a+2i8ZdKCL5YsRJuE7p1/EM=;
	b=sMQ443PtZUTr4iN+lLoTce4nVEODaDQ8B7YLEEO9b9TMFFMrk0bva1GYwgkTUQGoZxEb
	 mR2pBLK7ljbdZR92S0Hsl2jdM/CRSSg6+U798Ycub4cdC7t03Qq8R07/Yz9drtvPL117B
	 S6YE+sGFwLi+GjRv/1S5UAVSCIYdFPCY5X3x7xEpya80vaAcSMRPRnZIEN+3Yc/akWGcJ
	 hE1K9J7riaRBGKXXZflPUDIIl5gEdlU8/rlk7kPFBW1JlxYTmw+xIWQhaRXNWabxLALCO
	 D7GGLO+uFTYNJ/7bP9xubT0yTGWwRqL4waPIapQoCayoP9EsavJ5tjTZ02WSrHBIDOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pBJ4SunG;
	arc=none smtp.remote-ip=91.218.175.213
Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC7A606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC7A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pBJ4SunG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7rjx8697L/EudKux+JV/5MqFQZaVrwGSPixl5/xSs6A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794676632; v=1; x=1795281432;
 b=pBJ4SunG/jvsRpTJIVxXyzA7nvFQ9cmFGEHnX8wbgIfYFNDyYoX8HnAvCFTWfk6PVa8ciqO6
 dyFuKatFUlX4lTAPJqbnsM7v60CJU0Ixwjl81Ye73xlv3yv7yFlHuzk/52kPPQCvs2IDYCFPCT9
 IyXiZfqwUfP4o5qYM5R9hg6k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49da2c438d27ad89;
	Sat, 14 Nov 2026 17:17:12 +0000
X-Mizu-Trace-ID: 49da2c438d27ad89
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 18:17:07 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
CC: linux-wireless@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>,
 Ping-Ke Shih <pkshih@realtek.com>, Po-Hao Huang <phhuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_wifi=3A_rtw88=3A_fix_skb_leak?=
 =?US-ASCII?Q?_in_hw=5Fscan_probe_request_length_check?=
In-Reply-To: <aviVCqxRQfNvtl_g@quatroqueijos.cascardo.eti.br>
References: <20261113-rtw88-hw-scan-skb-leak-v1-1-3bd47562abf6@igalia.com> <9AF24DB9-D92E-479C-A678-0571B1557198@linux.dev> <aviVCqxRQfNvtl_g@quatroqueijos.cascardo.eti.br>
Message-ID: <58DBCE2A-DD56-4AF8-BF46-F5BDCFC1D297@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 14, 2026 6:06:18 PM GMT+01:00, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
>On Sat, Nov 14, 2026 at 02:40:24PM +0100, Luka Gejak wrote:
>> On November 13, 2026 4:17:33 PM GMT+01:00, Mauricio Faria de Oliveira
>> <mfo@igalia.com> wrote:
>> >In _rtw_hw_scan_update_probe_req(), if the first loop fails (goto out;)
>> >the
>> >skb is leaked. It does not reach kfree_skb() at the end of the loop
>body
>> >or
>> >in the second loop (out:) since it is unlinked from probe_req_list.
>> >
>> >Fix the leak by calling kfree_skb() if the first loop fails.
>> >
>> >In /sys/kernel/debug/kmemleak, after simulating the failure:
>> >
>> >  unreferenced object 0xffff88810965a000 (size 232):
>> >    comm "iw", pid 4729, jiffies 4345008185
>> >    hex dump (first 32 bytes):
>> >      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>> >      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>> >    backtrace (crc 20f7de11):
>> >      kmem_cache_alloc_node_noprof+0x302/0x380
>> >      __alloc_skb+0x74/0x2f0
>> >      skb_copy+0x57/0xe0
>> >      rtw_hw_scan_update_probe_req+0xff/0x230
>> >      rtw_hw_scan_prehandle+0x4e/0x180
>> >      rtw_hw_scan_offload+0x186/0x1d0
>> >      rtw_ops_hw_scan+0x61/0xb0
>> >      drv_hw_scan+0x81/0x130
>> >      __ieee80211_start_scan+0x2e0/0x760
>> >      rdev_scan+0x42/0x100
>> >      nl80211_trigger_scan+0x53b/0x730
>> >      genl_family_rcv_msg_doit+0x103/0x160
>> >      genl_rcv_msg+0x1b5/0x2c0
>> >      netlink_rcv_skb+0x52/0x100
>> >      genl_rcv+0x28/0x40
>> >      netlink_unicast+0x26d/0x3b0
>> >
>> 
>> Should this dump go under --- so it doesn't end up in commit message?
>> 
>
>I find stack traces particularly helpful in commit messages. The help find
>out fixes for bugs one encounter, avoiding duplicate work, and they also
>justify the commit.
>
>Cascardo.
>

Personally I don't find it that necessary, as if I need it I will just
search the commit subject on the lore and get it from there, but I guess it
can't hurt to keep it in, so keep it if have a strong preference on that
matter.

Best regards,
Luka Gejak
