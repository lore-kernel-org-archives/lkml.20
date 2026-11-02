Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600716;
	b=TDKHHCbC39X1n2+8+v8plUD70khFIM6MOmM8ULoey8daT3uvu6MJoqfK0wKj8uqrZ9Uv
	 BG/DoEiQLgmI4em660z9UAjrtF9EaFtBxP5IW4PFlgofQQwZfhuU1Hws8JQGkGGniLsBW
	 b3Z71FUyAIh15aNVgLj94imy8LFdn/05W1MfCkgCAJxCQGJjtXuweuJIOHse7j8UMjtmA
	 toIDs3qiN+iXnsZGFajcQTc5wIrGopSg5I/LMn/5kzCwTc9j1nu7UMIlaJL6CxrG7twJG
	 di2mcOyzyPQrPgxkWGig9lcBpnG3+/KgJ/WBiAHz5q6Tj2X5aJA32+hItkOuTcx4IZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600716;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=pnRH6wIWSU4ng5turGk9vkscHubh/jFa/k8JOrPTJwA=;
	b=37PeltTtkDLF/dfOk9j2UzWt1l3vbu3fNpOCvPP3XtQ2htEOjFuAhc46pLWuXepqphLL
	 w1Ke3YKREPsI/Ep6t6J9UVquqs28Y8dHMdJeY8h2VNqb6DATjs8cBoXwv/p1yWv2GU9Rh
	 Z2ByAtJMjKwcLiJelVB2ScIR6Wjvle+TwKnikjcvU7evO8XBKWbhqO3KB9498XANjP4Wz
	 je30A/grP3hPDQSf38nijjzQusxuiPBc5iOuJ0KrnGnoolVDRCA0gN/YPyp9OlKKWm7x4
	 yTPQlCDSVY+7rV0KncqPgO+R6iX6ygHTODeofGXrz/2DCfJCOrFL3+pj16qrmd3U2fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=NVZrqDZE;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1A8606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=NVZrqDZE
Received: from [10.94.176.45] (unknown [4.194.122.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id A046620B7167;
	Sun,  1 Nov 2026 22:24:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A046620B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793600696;
	bh=pnRH6wIWSU4ng5turGk9vkscHubh/jFa/k8JOrPTJwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVZrqDZEMv+lPGbDfbq+11hwHZyvZPpWtIl1MVLvVHgQVEeuyWClmXN5Smku3Dsqu
	 p4AH++tYvGuyFnwORKqEWdARRDeBsPW3eljWOET8GWmOWDlbyhBZRoG7dz9uPpUuNX
	 OvSLixE+P8cBwxwDTejO6+E4IIJUoBawxQaQ7MsU=
Message-ID: <bdab8445-6b6b-40c7-818b-3b0f33b6ede4@linux.microsoft.com>
Date: Mon, 2 Nov 2026 11:55:06 +0530
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
Subject: Re: [PATCH v2] firmware: xilinx: Request pre-allocated peripheral
 nodes after bulk release
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com
Cc: linux-arm-kernel@lists.infradead.org, git@amd.com,
 linux-kernel@vger.kernel.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
 <20261019102110.3448932-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261019102110.3448932-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19-10-2026 15:51, Jay Buddhabhatti wrote:
> During a kexec restart, zynqmp_clear_pm_state() releases all peripheral
> devices via PM_DEV_ALL_PERIPH. Pre-allocated nodes are then left released,
> so Linux no longer owns them and later peripheral access can fail.
> 
> Immediately re-request those nodes with zynqmp_pm_request_node(
> PM_DEV_ALL_PERIPH, ...) so Linux retains ownership. On a graceful kexec
> this runs from zynqmp_firmware_shutdown(). On a crash kernel restart it
> runs from zynqmp_firmware_probe() in the reloaded kernel.
> 
> The bulk request depends on firmware support for PM_DEV_ALL_PERIPH
> (PM_REQUEST_NODE feature check version >= PM_API_VERSION_3). On firmware
> that does not implement it, the request is skipped and a warning is
> logged. Errors are already logged inside zynqmp_clear_pm_state() and
> zynqmp_firmware_probe() does not abort if the request fails.
> 
> Also, drop the redundant ret = 0 assignments whose value is overwritten
> by the next do_feature_check_call()
> 
> Fixes: 84dbfa5519cf ("firmware: xilinx: Release all peripheral devices from firmware")
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes in v2:
>    - Add Fixes tag for the bulk peripheral release commit.
>    - Add Reviewed-by from Radhey Shyam Pandey (v1 review).
> 
> Link: https://lore.kernel.org/r/20260923100343.3147243-1-jay.buddhabhatti@amd.com/
> ---
>   drivers/firmware/xilinx/zynqmp.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fe650747ac91..96dbb23eb673 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -2193,7 +2193,6 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   					"Failed to clear EL3 PM subsystem state: %d\n", ret);
>   		} else {
>   			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
> -			ret = 0;
>   		}
>   
>   		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> @@ -2206,7 +2205,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   		} else {
>   			dev_warn(dev,
>   				 "Bulk device release is not supported by firmware: %d\n", ret);
> -			ret = 0;
> +		}
> +
> +		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> +		ret = do_feature_check_call(PM_REQUEST_NODE);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
> +			/* Attempt to request all nodes via firmware */
> +			ret = zynqmp_pm_request_node(PM_DEV_ALL_PERIPH, 0, 0, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to request all peripheral devices: %d\n", ret);
> +		} else {
> +			dev_warn(dev,
> +				 "Firmware doesn't support request all peripheral devices at once: %d\n",
> +				 ret);

Tested this change, works fine. And the code looks good to me.

Tested-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

>   		}
>   
>   		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */

