Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719141;
	b=ZAUcwxeE4rhU6FpEb2c1/1fPAlUFGtsGEd/XGb+BZoQvEIdCSnn1pinSOyMNnbgWaz6t
	 JrQ1huj4r8Kz+eHp4OujGBy7Fa+qpuzurDGYw4Qt1puuu+IYdEOCrRmy4pCAqy6UYC/ar
	 Eg/5+XXhn0pZoUviv3eThwW4FTzvQdYlMdsaSzac4WXemvQ7hLuc2cUIsYfUnDzChUmUS
	 /1zHrPRFX0KS85XLLkivllp6sCVs7b2az0yp6uNsWT+OK4xMeqoeLI5Z0s/15oHrZGSNZ
	 PCFXLPpYvnLbhMF9Q8F3DjhDocTYNR+1P1s9HUZ+DcbU06K1Qd0KAzgCVXArkwKHyyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719141;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=3kh7cB3NHbVZeYBD16GLVXEHt7xKsgZXCvb8wD4xq6U=;
	b=0y/feGYOjzdpXQc+07i+C3s8PVDT9Ip/O0ylIF6e184FFPSP/LfmqiwcO4cID0n39ikA
	 LyF5VHcI9jhK/RnGfkqs3dV3GZTgq8BH1/acbXX9+tdR1evWDqS/KEfI5zuoVTmpqYdbp
	 GvLrLQFZyMgTWWnCtGlERuuwiDzgrAn5IepX3QEc4lgFJX58X0lfoeYdlTPIDzulxoucO
	 6M3c1xpBZhq+aCeHRAzF3iyHhI0SKl2zlKV4moeOTTNtmmZSobvyODJ7PBgyFZLZvKqDm
	 8kZz1DJr2FjS2vssgbFFxGE6HFR10yIKbnZkKtjfHze4WaLzOl9FGKFQFwHqqYkHtDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=GPAvbxyR;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95817608363E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95817608363E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=GPAvbxyR
Received: from [192.168.1.10] (unknown [52.172.102.219])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3AAFA20B716A;
	Tue,  3 Nov 2026 07:18:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3AAFA20B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793719125;
	bh=3kh7cB3NHbVZeYBD16GLVXEHt7xKsgZXCvb8wD4xq6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GPAvbxyRx5KMdL21dUAPyjAMQvakEHkEWbhIhNMkfJ+t9n4u+njR1F1n+oCwMdES6
	 Szy9TTXdtMVKUR9lFhw+6zPlOlWdihIgVGnKH76VNsQDHB9e3Gh+mIpwdrMsU7LPMp
	 o2YjC25D42bAt4zZIgAALlWagf53QtziL+T8UFg4=
Message-ID: <192a8868-d73a-4f05-9207-b8cea8eaa7fc@linux.microsoft.com>
Date: Tue, 3 Nov 2026 20:48:55 +0530
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
Subject: Re: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state
 cleanup
To: Jay Buddhabhatti <jbuddhab@amd.com>
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, michal.simek@amd.com, srivatsa@csail.mit.edu,
 ssengar@linux.microsoft.com, tgopinath@linux.microsoft.com
References: <20261103063515.679043-1-ptsm@linux.microsoft.com>
 <8986493a-cc47-4ad2-a142-764d4069c146@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <8986493a-cc47-4ad2-a142-764d4069c146@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jay,

On 03-11-2026 17:56, Jay Buddhabhatti wrote:
> Hi Prasanna,
> 
> On Mon, Nov 02, 2026 at 10:35:15PM -0800, Prasanna Kumar T S M wrote:
>  > On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
>  > CPU hotplug state instead of the its actual state. This can leave the
>  > event manager callbacks dangling. Use the actual CPU hotplug state
>  > during driver removal.
>  >
>  > Hotplug registration failures are also ignored, allowing probe to
>  > succeed without the callbacks needed to enable event interrupts on
>  > CPUs brought online later.
>  >
>  > Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event 
> management driver")
>  > Signed-off-by: Prasanna Kumar T S M ptsm@linux.microsoft.com
> 
> This looks good to me.
> 
> A couple of small nits:
> 
> - "instead of the its actual state" -> "instead of its actual state"

Thanks for catching this.

> - Minor alignment on the cpuhp_setup_state() continuation lines;
>    checkpatch --strict complains.
>      CHECK: Alignment should match open parenthesis
>      #49: FILE: drivers/soc/xilinx/xlnx_event_manager.c:663:
>      +       hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>      +                       "soc/event:starting", xlnx_event_cpuhp_start,
> 
>      total: 0 errors, 0 warnings, 1 checks, 44 lines checked

I missed this.

I think the issues are minor. Is it possible to fix this while merging 
the patch?

> 
> Worth Cc: stable@vger.kernel.org as well, given the Fixes tag.

Do I need to send v2 to address this?

> 
> Reviewed-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> 
> Thanks,
> Jay

Thanks,
Prasanna Kumar
