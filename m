Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275CF42AF9C;
	Tue, 15 Sep 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504746; cv=none; b=kLLbCwa2tW3kPPpD3ywy7u6m7B2wn6GVrPBGeAVlxrCjEpFR6tXhNuatW6l+sKYgKY8H7US66O+vGbmL0ALnfXacBP3Rg91pNOm6hdzHYXfBqHSGQz7tF2Mj5iVWzSbQsfnyPaDwaS2J0HuoCQCPqdqBoS/mDUlrG8B7jLSb8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504746; c=relaxed/simple;
	bh=dsSBuYg3JBYapY7bi06MLYvpxn7GBuq/YDinOSGcfro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5BUtN1pZzwkog2tI8bHh0jdbfn2/MKMefyWUzEzh0ZDn3/74lwjVIkvJz5YiFAclzenqIpOBfmUV9anmVjFwr0+n3Qjr0yiOTstW4ZEJdFnsd7/bfw2YGgWEmDo+tKxuU0WpHd6jSzTn4TCcBkwonku42ruJZLDudmoEtVaz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSkf6Ixt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSkf6Ixt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2651F000FF;
	Tue, 15 Sep 2026 20:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504744;
	bh=3NsxLamSdtQ+xD2ZFRjSVxRVF1bNXgRXnGPsLEeKb8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gSkf6Ixt++stq5XJM6lz6YwtnVTdYZPGaKVJpmVh3nn9DolsWpqptXut9lplBf0Se
	 mTbtg7VWXNFacHasIK+48jSM4JDSfqCYUIaQeRxbVjtoMLLawr7T1Tk+iEOcmtkO8c
	 DK2kBALmGF0JqjvDNOy2cj5draSisAZt9nb0flDe5C4PNZHDFDVRt14ZBqY5qVgVXK
	 Z94TTnouMYT+snKXhOyfO7kqeYDh6zGlPq0h/MKpAja/TN9Ao5fHRHcmkd0IV+G4J4
	 4Lq+5FQB9UR1EvTxZNY8xIXVZLggivfH3jA4IalxsXNxaz+ajLrTeXUmqo98QI1WbE
	 zbp5wz0psvlTA==
Message-ID: <1ce40451-0bdf-4091-a478-e82a1b9e1d13@kernel.org>
Date: Tue, 15 Sep 2026 15:39:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "S, Sanath" <Sanath.S@amd.com>
Cc: "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 "Martinez, Juan" <Juan.Martinez@amd.com>,
 "westeri@kernel.org" <westeri@kernel.org>,
 "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
 "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260831130638.GK124825@black.igk.intel.com>
 <20260831161610.1322731-1-juan.martinez@amd.com>
 <ae19d381-0fcd-45fb-9e53-033c7d664d73@kernel.org>
 <20260902054800.GI106095@black.igk.intel.com>
 <21cbfbaf-ef1f-469b-a33b-8d623dd7f9a3@kernel.org>
 <MW4PR12MB7016EE093475BF1821A0046281BF2@MW4PR12MB7016.namprd12.prod.outlook.com>
 <70448c19-1ac5-4350-bdcc-eb3ebd008992@kernel.org>
 <MW4PR12MB7016137EFD6AEB235F3D50E481BA2@MW4PR12MB7016.namprd12.prod.outlook.com>
 <20260915060459.GJ106095@black.igk.intel.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260915060459.GJ106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 01:04, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Sep 15, 2026 at 04:51:00AM +0000, S, Sanath wrote:
>> Ported it and stressed it on two Strix Halo hosts connected back to back.
>> REG_CAPS reports hop_count = 3 here, so two usable DMA HopIDs. Observations:
>>
>>   - Single tunnel it works: 50 x traffic then link down/up, plus 42 x
>>     dma_test create / transfer / teardown. One reset per cycle, no ping loss,
>>     no errors, and every ring restart had a reset before it.
>>
>>   - Every reset is preceded by "dangling request in request_queue" and a
>>     WARNING from tb_ctl_stop(), 8 of 8 cycles, via tb_domain_pause() <-
>>     tb_ring_start() <- tbnet_connected_work().
>>
>>   - Two tunnels: the networking ring is stopped and restarted with no reset
>>     in between, because the check only runs in nhi_alloc_hop() and tbnet
>>     reuses its rings across a reconnect. 18 such cycles did not hang, so the
>>     unsafe reuse is reachable but I cannot say it hangs.
>>
>>   - When the check does fire it takes networking down, reproduced twice:
>>     "RTNETLINK answers: Cannot allocate memory" plus "out of HopIDs that do
>>     not need a host interface reset", until the second tunnel stops.
>>
>>   - tb_domain_pause() takes tb->lock from tb_ring_start(), while unplug holds
>>     tb->lock across tbnet_remove() -> stop_login() ->
>>     cancel_work_sync(&net->connected_work).
>>
>> Moving the reset into a per-NHI work item scheduled from tb_ring_stop() when
>> the last DMA ring stops removes the warning and the tb->lock inversion, and
>> passes the same tests cleanly. The reuse hole and the lockout still need the
>> reset to key off ring reuse rather than ring allocation.
>>
>> Mika, Can I respin your patch along those lines and post it as a new version?
> 
> Of course. I'm thinking though that should we do the revert for v7.3-rcX
> now and then do the proper fix for v7.4 with your updated patch?

Yeah; I think that's the right call right now given the timing and risk.
