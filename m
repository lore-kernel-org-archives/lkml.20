Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88E39185C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996092; cv=none; b=vFjkqES01VPE+i1Wa4BdU7Pu6aASveDTeVkXUc6O1oi56sld7rJCcSvlwircxV8GxT1C2XMyBGSdFcI4qcWSfNnnrHQ/xb905yns8uTTeaod0o8Y4h67nuG/tsT8FiLp/W/q9aYjk6G1Gv0vdnqor0iO53wZFaHiudpW6ycgdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996092; c=relaxed/simple;
	bh=kQ75PMv+BY9OnLoeEVPyFqxTAPL+KhKo+I77xMhcgcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvWwmPPsLcy4IVKwTzEA+yW8Ql03tOKkW2KEMb8Q03vU8D2R+5M7MboJPbCFW6NesSHAejrD+oh16o6hIIhLONqKJeWr1szjnE5S0t0Cj0ZL6MBRukbEiG21uXSmFx3H2+1soY7mJIM8kgBrWdGcwEqQQ1cws6N/VzGnGA7JLvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=MsOieU8G; arc=none smtp.client-ip=95.215.58.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="MsOieU8G"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kQ75PMv+BY9OnLoeEVPyFqxTAPL+KhKo+I77xMhcgcc=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791996088; v=1; x=1792600888;
 b=MsOieU8GejELPQB8oXQZ702KEehwpVk1NSUAGj509KZOkxXo5eNCJepaJ/YuteKifIZQYZkI
 LAOlwOis9kUDG7Nmyg3M19OQIHYRwjOeuVG2GmHB3aF3yB3J0vLmSncpSBgfV6fjZ6qrd+60w6F
 ob9OFUTVW8QwncRsah8TiUOe/JxE3ouS3l/2ax47QVaUjqJwhwF/m/ywYMoFxM7wMAuy94qe3/h
 hleDlYsc2Sjcch8KM51WPNmB3Bn1BYxS0II3bJS2+TZRzDKBCaZgZ0CrUnTLF6d4ekOedWJ4VZR
 7wBQPdJVxe4CD6D80pW1aUKuwL/fd+awHvVz8j2qHHLQw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 454a9d4a808200d2;
	Wed, 14 Oct 2026 16:41:28 +0000
X-Mizu-Trace-ID: 454a9d4a808200d2
X-Migadu-Flow: FLOW_OUT
Message-ID: <12d14e1d-8355-4b3b-9eef-bd5e90dfd19f@packett.cool>
Date: Wed, 14 Oct 2026 13:41:19 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap
 no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
References: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 5:38 AM, Jianping Li wrote:

> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
>
> On Talos, GPU stress testing triggers a synchronous external abort
> when zram accesses pages within the ADSP remote heap.
>
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
>
> Fixes: b0b51a5f1911f ("arm64: dts: qcom: talos: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-

This also applies to: glymur, agatti, sm8250, kodiak, sm8750.. (at least 
those I've found by grepping for the adsp_rpc_remote_heap_mem label)

I've been hitting the SEA on a kodiak phone (sm7325-motorola-dubai) 
constantly with just light everyday usage:

Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
CPU: 7 UID: 10000 PID: 26485 Comm: pool-24 Tainted: G   M    W         
7.3.0-rc6-next-20261009-uwu+ #167 PREEMPT(full)
Tainted: [M]=MACHINE_CHECK, [W]=WARN
Hardware name: motorola Motorola Edge 30 (Tianma)/Motorola Edge 30 
(Tianma), BIOS 2026.07-gca7686425f32-dirty 07/01/2026
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : clear_page+0x30/0x70
lr : prep_new_page+0x94/0x178 ...
Call trace:
  clear_page+0x30/0x70 (P)
  get_page_from_freelist+0x1bd8/0x1c00
  __alloc_frozen_pages_noprof+0x1cc/0x3f8
  alloc_pages_mpol+0x124/0x210
  vma_alloc_folio_noprof+0x124/0x200
  vma_alloc_zeroed_movable_folio+0x3c/0x50
  do_pte_missing+0x9e0/0xf80
  ...


This no-map does seem to fix it.


Thanks,
~val

