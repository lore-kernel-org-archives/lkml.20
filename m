Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565679;
	b=iRXoKzoDY//hK+kZ0cGxMUoCn6wFZX+igWA4nxkjPZBhA1viE7IhtLXtcwINmO0WKU6J
	 tJRA7HMfIQCwgmNLvdupnqV2CQXaIgw4lIT9NwS5JDd7CmsFDuPBCw3Be3evb8gRHrjO6
	 4ORU2/kAoAGqD62NOFFIB826h7OuDYkO8NuCANR/jyP1A+b4YW5QHSXG5Ra6pFxvCvu2p
	 XkmB97bsAAqKobBF83HgAW4dtLlkVYjBORA1Ii0Z9SoQtrAp0UQmZkO8sOjNVdwKR6URH
	 EVjPsPFGlrtzvZFJ1PlSY0QxcEahkJ0cDT999+c3Lm2D6p8LEeg2Kpa6AkAtdU4HADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565679;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qttE7i/NYMGEyijPDXwoBLWDxtH3LyQR/xHbwik0TMo=;
	b=5t160QgEoj9qw+2nNO/BVnYGKZuujHzCXdtkkkNClSFYE9vQZ0dZHayH9c1CuNdVsLqx
	 NAvuPE+EZRrZcWLjLR/LegQeIKTnD3BtWVAeYAIjVfU1HGnIEA2EE4nBqxPWZkJ/Gms+D
	 PLBYK2Ps8oPr8gA7HC/HNhXvqXE5pmw0o/bIejrtDj3Fmc3iuTYRocgdw9l0LTLgFJlCb
	 cb1/W6/g/97gxe4BYaD7yJbgrZZs3VCGXk70idJPRVMyu+MpTsd1u18MRAtY8FmXSEGDs
	 ZKQF1iYg2OTWQy/yNItRbyIC6BUcp2MQeBfz7iyS+mZN5xEbj9wa1hYt+y+FN0xuV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ayS2AFLo;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3A7606A31C;
	Fri, 13 Nov 2026 10:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C3A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ayS2AFLo
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0403B1BB2;
	Fri, 13 Nov 2026 02:27:55 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 065AD3F673;
	Fri, 13 Nov 2026 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794565678; bh=sniyVvy7eqHqmejSGAzUGcpDdk2gZp+cN0PLHrSDCc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ayS2AFLog3ARBcBC8Rp6U2yO2Jhb/mY4HBYhUzNqyQWWla3xl+YPBIwNxbqF6N3CM
	 z1YsWOacUrBYT1pAib+Lcvza532CUEYyWehckXaNG7pQ2fAvWAYFlcAPIUjR+8u/oV
	 acLNvKcxJ1dS8XGxOBWXHKPxWggrWidI8lqZzApg=
Message-ID: <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Date: Fri, 13 Nov 2026 10:27:54 +0000
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
Subject: Re: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to
 linux/coresight.h
Content-Language: en-GB
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 02:49, Songwei Chai wrote:
> CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
> (0xfc0) within the generic CoreSight management register block,
> immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
> drivers/hwtracing/coresight/ that follow the same register convention
> (e.g. the Qualcomm TGU, which uses it to detect its timer/counter
> capabilities) need to read it too.
> 
> Add it to the public include/linux/coresight.h so it can be shared
> outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
> CORESIGHT_DEVID already moved there.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   include/linux/coresight.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 5286b3606581..7ce0366c7c70 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -37,6 +37,7 @@
>   #define CORESIGHT_UNLOCK	0xc5acce55
>   #define CORESIGHT_LAR		0xfb0
>   #define CORESIGHT_DEVID		0xfc8
> +#define CORESIGHT_DEVID2	0xfc0
>   
>   static inline void CS_LOCK(void __iomem *addr)
>   {


Merge it with Patch 1 please.

Suzuki
