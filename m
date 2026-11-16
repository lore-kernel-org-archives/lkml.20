Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834836;
	b=sbd9yWYHvyPwJ1f9ARiEpuSgzvjhjh9+0D7I19yfkD3rfDAnaIorANYS2yMQQniutn7R
	 3TrsiAPPrRjyQQ/PCDybwaV+5Q4GJjTdY+o/iqqEscmFf7dldvpznR1cHuVRBrVF1CAmO
	 u9l0vaiaF6ZvoLS3C3y7OwOVkVGdzK/f5KMTdbXaGcHKX4kS+a33gsaHuly7lM9VFjOwL
	 spJo4NaNOTifvm9d5UI9fNR3vRZPSINhZ+CMIIcpKkZDXUbBTbKhdoUMUexCmvH+mNYOv
	 OW1j5Dd+hdX/q+zx1SOHBGu9TbGpr0aOXi/v4iGjZ3X7kqteek6RYZ1bH0QzxmK82PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834836;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=cqYUPgahOl8DP0EPrF+yvgW87EzhH2eW3qa1QwXll5o=;
	b=gCIatTO04Xw/of9oCR+pUwGRSDbDzYTMXIEziQcPpkmAC9X2zOD0P3OlcgAJ/DcEHmLI
	 oImSqQ6jaZ17hGAJcjD5iKCXbKFSeCHxVeyMfBLdiVraDtYsMmLcdhZpARwBg3egIp9ON
	 pP+PJxx0B1nzhwCU0kdSTANe9A+nA2DDtQzVGolrLn3ChZ86VPbAjP++ff2ioH8WTO7KC
	 KXYLZbejmhFDIyKLXeD/gJhJeur32tWf2rrE+VDfxZnupCU8OUXm2CjvA3oAT2bc22Lwv
	 1AibldZrNmdUV13QldTXh5B96YtESgbDGlmzRDdtiuJrQs+seQNxRsCidVeF33KWd4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X6uS2Tz1;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31964606A329;
	Mon, 16 Nov 2026 13:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31964606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X6uS2Tz1
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cqYUPgahOl8DP0EPrF+yvgW87EzhH2eW3qa1QwXll5o=;
	b=X6uS2Tz1JSUkYV7oihQ49nYSbt2uSW5eRpRVpLGhEh570sqYqYDeXWYdpQ2Kc4GZ6EB8mwxE+
	MzqCZiN3Hex0txa3RA65YYQybrsYj/KRguOmlnKoSghqxLrXdmtepDahiSVaQU/RBsH2DJU3gir
	pxIhoG8U1aw0439+3ykU9do=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jSpFT1d9gzpStt;
	Mon, 16 Nov 2026 21:13:01 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id D675140579;
	Mon, 16 Nov 2026 21:13:47 +0800 (CST)
Received: from [10.67.121.233] (10.67.121.233) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 16 Nov 2026 21:13:47 +0800
Message-ID: <e3535430-eb4b-418a-b16c-06ce2acc52e1@huawei.com>
Date: Mon, 16 Nov 2026 21:13:46 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <shenjian15@huawei.com>,
	<liuyonglong@huawei.com>, <chenhao418@huawei.com>,
	<yangshuaisong@h-partners.com>, <ningwei15@huawei.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 net 3/4] net: hns3: fix interface stuck after OOM with
 full hardware rx queue
To: Jakub Kicinski <kuba@kernel.org>, <netdev-bot+sashiko@kernel.org>
References: <20261111125810.3359030-4-shaojijie@huawei.com>
 <179462624232.2199510.16700149583019655532@kernel.org>
 <20261115104113.6b608a8e@kernel.org>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <20261115104113.6b608a8e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo500018.china.huawei.com (7.202.195.199)


on 2026/11/16 2:41, Jakub Kicinski wrote:
> On Sat, 14 Nov 2026 03:17:22 +0000 netdev-bot+sashiko@kernel.org wrote:
>> - [Medium] The patch adds a new private `ethtool -S` per-queue string,
>>    "rx_oom_cnt", at hns3_rxq_stats[] in hns3_ethtool.c line 65.
>> - [Medium] net: hns3: rx_ring_oom_bm freed before cancelling oom_task on
>>    init error
> Both Medium comments look legit. Let me apply patches 1 & 2 since they
> are unrelated, please respin the rest.


Thanks for the review.  I'll rebase onto net and send v5.

On Sashiko's two Medium comments on patch 3:

1) rx_oom_cnt

It is a companion diagnostic for the OOM recovery, not an unrelated
stat: it counts the first RX allocation failure in each 250ms window
per ring.  I'd like to keep it in ethtool -S rather than qstats:

   - hns3 has no netdev_stat_ops; adding one only for this counter would
     expose a single qstat without the rest of the per-queue set.
   - alloc_fail is defined as an exact count of RX allocation failures;
     this is a 250ms-window trend, so mapping it to alloc_fail would
     misrepresent the standard stat.
   - hns3's existing per-queue stats and customer tooling use ethtool -S.

I'm fine with it being backported to stable.  If you'd prefer to keep
the fix minimal, I can split it into a separate patch without a Fixes:
tag.  Please let me know which you prefer.

2) rx_ring_oom_bm vs oom_task

Sashiko is right: the invariant in the commit message is wrong on the
init error unwind paths.  I'll cancel the work at the top of
hns3_uninit_all_ring(), before the rings and bitmap are freed, and keep
the existing cancel in hns3_nic_uninit_vector_data().  The window is
small, but the ordering is still wrong.

3) patch 4

Sashiko's remaining comments on patch 4:

- page_pool_info / error-code changes: I'll add these to the commit
   message.

- re-init ordering: my understanding is that the window is theoretical.
   Sashiko itself notes that the writer issues full barriers before
   clear_bit(RESETTING), so a reader that observes the reset as complete
   is very unlikely to see stale pointers.  Unless I'm missing a path
   that can observe the intermediate state, I'd prefer not to add a
   locking change to this fix.

- set_ringparam/RTNL wait: I agree this is a latency concern; my
   reading is that it is bounded by the dump length and is not a
   correctness issue.  Unless you see a correctness problem, I'd prefer
   not to add a new state bit to this fix.

I'll also make hns3_oom_task() use only atomic bitops and correct the
exit-refill description in the commit message.

Thanks,
Jijie Shao



