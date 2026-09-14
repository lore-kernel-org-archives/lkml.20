Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBEA38AC79
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410562; cv=none; b=gU3UQIiJy8g9A00grWyfZnjrExwg+B51u9QRlGHFHWkfWhWKFfiuEnbUHQZ/gyeI11hlNqpbW0j+16697I8H6rpXSjiT59rAh0DT0QYaMUSDv/UCs6k76PtbCNOIvWxjsa01F7a60c90qEJIQQAn/DZssGjTh/OnkEVfzl2tj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410562; c=relaxed/simple;
	bh=oiUF5LhxlHtYbTxjopkGNneVmugHN51Eq7CGGnZam7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgNMcfmP42jahT3708XppcoBq+xiKDnmXDG+2Ed66oEZFpp1zeS/PRl0uOGwvMVZlR70NHgA/0wZCgiG6IdNrFqXmn6a7VnZBqwyq85m/C6Dy4TbvG2X5AiZ+buJoxZ0IoyF8cCqDpFHjPeNymXZhVub//noEc4aevB7nIxTIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ejzlphn0; arc=none smtp.client-ip=91.218.175.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ejzlphn0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oiUF5LhxlHtYbTxjopkGNneVmugHN51Eq7CGGnZam7c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789410557; v=1; x=1790015357;
 b=Ejzlphn0Vu+wMB4ePv4GJDq8Ynn9cQqvSpCU10hF+uxC8F80TICdVTbCmo6KiSutmeBR4fI1
 hocfncLt4Vl1ncC8qP1A+6CPpapeUB07ZBKFvbk54LI18nrO88VK9Tb5SxifhursPBzyf2G9+t3
 s7xQxC8rGhmgUgO8HGQ+Mp4k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 934f72edde8d4b3d;
	Mon, 14 Sep 2026 18:29:07 +0000
X-Mizu-Trace-ID: 934f72edde8d4b3d
X-Migadu-Flow: FLOW_OUT
Message-ID: <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Date: Mon, 14 Sep 2026 19:21:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soundwire: qcom: add multi-master support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
 yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
 jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
 quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 10:21, Srinivas Kandagatla wrote:
> v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
> bus with more than two DATA lanes. One IP owns SWR_CLK and drives
> the bus; the other contributes DATA lanes only.
> 
> Support this pairing on the driver side. A device link between the
> two IPs enforces correct unbind ordering and keeps the peer resumed
> while the primary is active.
> 
> Single-master deployments (no qcom,multi-master-mode in DT) are
> unaffected.

It'd be good to clarify how the command protocol is handled. Each IP is
probably capable of handling PING/READ/WRITE commands in Column0, but in
the paired option the primary IP is the only one that deals with Column0
and all other DATA lanes are just data?

