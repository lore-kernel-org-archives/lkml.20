Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2945038;
	Mon, 19 Oct 2026 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396111; cv=none; b=Sb06rcULfPKaJ7tvUKv6GHGOM+tDbh7DXfFKg4GExNaB7NvQ0dGsUmdw5C/D5e/oJgVI+OSr2mgxOyTcYD2sxiSW54mOatK/t48HEgtZA5IMwwariOJU5JnrV0GWgtREchXAmmpP4JCc3GIj72AVrSUFAsLn5vnvpSuLcBGD0Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396111; c=relaxed/simple;
	bh=UugaPpyM8zjK/3mOz1PhfoEpWrElDjEhRs4oGFCzF4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0wn30dGrF9kDRNg35v9Ualze2PDqh9iGpXVzF9lAT6oTUsD2cmIIgy7tIfjX0TGlz9lQkavYHgLJ4M/9wGqWwc3I1Uvnl7cC5p+bkhTNFVuS+VssPE0Y6XQKoYYqEIudQUVy9r5ADW/N1D7SIM0lpS7NkN/FEYbvlCUeabcaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 73821e1ecb9111f19a56ed5b684f684d-20261019
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:13e470c7-9ba7-4ecb-ae35-8ac0bb053dc1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:2f2f9112d3f338843b07ac65b84e28d1,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|52
	|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 73821e1ecb9111f19a56ed5b684f684d-20261019
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1739337229; Mon, 19 Oct 2026 15:48:19 +0800
Message-ID: <80871b7e-3b2a-40a2-8c0a-690619acb864@kylinos.cn>
Date: Mon, 19 Oct 2026 15:48:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Add XHCI_TT_SOFT_RETRY quirk for transaction
 errors on TT devices
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261010032518.2040608-1-dengjie03@kylinos.cn>
 <20261010075221.409a5353.michal.pecio@gmail.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <20261010075221.409a5353.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,
Thanks for the review.

在 2026/10/10 13:52, Michal Pecio 写道:
> On Sat, 10 Oct 2026 11:25:18 +0800, Jie Deng wrote:
>> Low-speed devices behind a high-speed hub on some xHCI controllers stop
>> working after repeated lsusb -v: a transient USB transaction error on a
>> bulk/interrupt endpoint is followed by a hard reset recovery where every
>> command completes successfully (Reset EP with TSP=0 and Set TR Deq both
>> return COMP_SUCCESS), but the first new split transaction issued after
>> the restart fails again.  After two such cycles the hub reports a port
>> connection change and the device drops off.
> There are no bulk/interrupt endopints. Which one?
> (I tried and lsusb -v does seem to trigger some interrupt transfers).
It is an interrupt IN endpoint. The affected device is a low-speed
HID mouse behind a high-speed hub (slot 2, ep 2, interrupt IN,
MPS 8). You are right that bulk is not possible at low speed. The
commit message is wrong on this point.
> The patch seems LLM-generated.
> Are you sure it's a HW problem and not an LLM problem?
I used an LLM to help draft the commit message, and the wording
shows. The hardware problem is real. The controller is an SoC
integrated xHCI in a Phytium FT-D3000M. Repeater: run `lsusb -v` on
the low-speed mouse approximately <N> times. The mouse disconnects
within <N> rounds.
Raw dmesg from one run (xhci dynamic debug enabled):
     Transfer error for slot 2 ep 2 on endpoint
     Set TR Deq Ptr cmd, new deq ptr = 0x..., new cycle = 0
     Giveback URB ..., len = 0, expected = 5, status = -71
     Successful Set TR Deq Ptr cmd, deq = @0x...
     Transfer error for slot 2 ep 2 on endpoint
     Successful Set TR Deq Ptr cmd, deq = @0x... (+0x10)
     usb 9-1.3: USB disconnect, device number 8
Every error reports comp code 4, tt_info 0x301, err_count 1.
The dequeue pointer advances exactly one TRB (16 bytes) per cycle,
consistent with a single split-transaction retry that fails and is
re-issued with stale state.
>> The affected silicon does not honor the xHCI spec (4.6.8) requirement
>> that a Reset Endpoint command with TSP=0 "reset any USB2 split
>> transaction state associated with the endpoint": the stale split state
>> survives the reset, so the next split transaction carries the old
>> transaction's identity and can never match the hub TT state, cleared
>> or not.  The soft reset path (TSP=1), which per the spec maintains the
>> split transaction state and retries the last transaction on the next
>> doorbell, recovers these transient errors on the first retry.
>>
>> Add a XHCI_TT_SOFT_RETRY quirk: when set, bulk/interrupt endpoints
>> behind a TT hub may use the existing soft retry machinery to retry a
>> USB Transaction Error (completion code 4) in place instead of going
>> through the hard reset path.  Platforms without the quirk keep the
>> exact previous behavior.  Isochronous and control endpoints never
>> enter this function, and the existing MAX_SOFT_RETRY bound still falls
>> back to the hard reset path for persistent errors.
> Sounds like you may need Configure Endpoint recovery if you ever run
> out of retries in any case other than disconnection.
Agreed. The current fallback after MAX_SOFT_RETRY is still the hard
reset path (break -> finish_td -> EP_HARD_RESET), which on this
controller does not clear the split-transaction state. I will
investigate whether Configure Endpoint can serve as the recovery
path for persistent errors and test it on the hardware.
> Is support for this HW coming upstream anytime soon?
> Not sure if we take fixes for out-of-tree issues.
The FT-D3000M platform code is not currently on an upstream track.
Whether it will be submitted later is undetermined.
