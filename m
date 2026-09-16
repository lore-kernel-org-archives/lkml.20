Received: from smtpout1.mo536.mail-out.ovh.net (smtpout1.mo536.mail-out.ovh.net [51.210.91.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09803BBFC2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.91.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536733; cv=none; b=SlsCk7PkLtPiCVWFsjB7ryUWRFUd+jmp75vv3bXpdNq60jWPaPUflQG1C2JIK71NQgT5KNLP5C8kDLUuN0aPoRoKXrfH1t64hFAL8I2KLBfQjNPUkLZpbz/lV9z6IjYAZJftVqqktu3y5bzAhlkPT4SJFijrMckSBWTtqJcmFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536733; c=relaxed/simple;
	bh=xwRS/gZYcYtNuuIl68FA6iF6e09MpKatew8xKhATmjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHGddbahxrk/bQbtqPRFLXhxtk8P7K8cdT5sLYKHowS0AstWGsPefpTT50QLeQ1hpmvz+7St7lrDUUOi6eyuI2x1X0iNwWdzWbSKV6OsfYE3JVn/ZdeV3dTnrgHw9suBYE9ucJbHhrBopsmJdX1rS87wA495ALgmv9yx2/0FD2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pixelcluster.dev; spf=pass smtp.mailfrom=pixelcluster.dev; dkim=pass (2048-bit key) header.d=pixelcluster.dev header.i=@pixelcluster.dev header.b=mpz2+FK9; arc=none smtp.client-ip=51.210.91.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pixelcluster.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pixelcluster.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pixelcluster.dev header.i=@pixelcluster.dev header.b="mpz2+FK9"
Received: from director6.derp.mail-out.ovh.net (director6.derp.mail-out.ovh.net [79.137.60.226])
	by mo536.mail-out.ovh.net (Postfix) with ESMTPS id 4hl6vf6qtYz89Dq;
	Wed, 16 Sep 2026 05:31:58 +0000 (UTC)
Received: from director6.derp.mail-out.ovh.net (director6.derp.mail-out.ovh.net. [127.0.0.1])
        by director6.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <arunpravin.paneerselvam@amd.com>; Wed, 16 Sep 2026 05:31:58 +0000 (UTC)
Received: from mta11.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.0.187])
	by director6.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4hl6vf5vx4z46ZB;
	Wed, 16 Sep 2026 05:31:58 +0000 (UTC)
Received: from pixelcluster.dev (unknown [10.1.6.5])
	(Authenticated sender: nat@pixelcluster.dev)
	by mta11.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 8639A9A1C21;
	Wed, 16 Sep 2026 05:31:57 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-104R0051070beb6-b773-446b-8d4f-44f46e538ee6,
                    69B76013C106EEA375DAA2C64D98DF65BC6C8E4B) smtp.auth=nat@pixelcluster.dev
X-OVh-ClientIp:88.133.252.134
Message-ID: <06ba629c-192e-4a65-a48f-0f61b7037c7b@pixelcluster.dev>
Date: Wed, 16 Sep 2026 07:31:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: change TTM maintainers to Natalie and Arun
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 christian.koenig@amd.com, ray.huang@amd.com,
 arunpravin.paneerselvam@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260915154804.605772-1-christian.koenig@amd.com>
Content-Language: en-US
From: Natalie Vock <nat@pixelcluster.dev>
In-Reply-To: <20260915154804.605772-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 3012345201672020284
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFRfwPuXz5e3IWqGYPDEKHZ3x/M2YZGSZ8E32VVcwMb1j3KKBl2m+tUHN2rZrm0fucxlaeylCZLlLoFNNxPvCVmDDGLqP/abZiAUzT6vOW7ZsA4E2YR8C7feuD4+EjwKWiCxuDBaUzUlgnZ7UW3A/bcBcHOu0KMTTRVRDhp/QqaXvZednGeQ973KFdCRKyqcvISUYeoqzBlNgLYv+/OYTATaSOA7mtAneBn9N3cQTzmKSzF81pAvYcIG3meuA6y2M4j6cw4s0QTyDjoYkyPSfLhZkt5Xc3SonFVlrjooVE5qQy8nOrldhuZ700d3btYSV+SMyKdXXmbTBj0RdYhCLkcT8iQCRGcNFiimQc1yvyb+gUsSc96f9rd0DMZJPlvWEV/kakVVw1PTCovHZRrLWtlaPkWSTteM1SGd7mQLQkrjJfa84thnAqDp7BAfUMKANCwPoL7LMhniZg2uaOw5uY8uje4fu+rs3stns+CsGYC4bCD1MXLPLQfuVm5Hk3iPuS2uMQBTFwAqkNq0CYOEv9aJ2edVUkxO6DbMQSpFsM1dM72Ipr3W/F+Vn6xy1MwQX4GUUT2+z+j83qrlFSuDpd+JbWSx9hKXVIp9i/MUg5+vXozSPKFkzCQhwlo89RpPjgtZ/jiIHksDeLI/Pj9Q2HBaAX7NpydA4elDca8WlsjqA
DKIM-Signature: a=rsa-sha256; bh=ioPl4fvpUxZb/jtEXguIL+7E9wHogFQsb1NAV9MRKf8=;
 c=relaxed/relaxed; d=pixelcluster.dev; h=From; s=ovhmo-selector-1;
 t=1789536719; v=1;
 b=mpz2+FK9rbNsHe2aDHrnKz+gAmGH6p+Ap+EWyc6Cvcj0w2WNL0z4Sva8CWBkN7tY4hhWzDfX
 1ca3lSYDbYO3gFKaGx7mS1CnPNrmILrQN+Ti74/qMtCuYS4QuaXTdr96GyuSXJEQLOWgIqgGrr1
 aLwo2BRW6+V8zhcG2ifYJKWGFmP2OXnXuGervL48a9iy+Sk7E2WhGRn97JNIlSC9A7Tq863yhZZ
 QuaXjLK60kwK8/hYOcFhBDeO6/KEdrtGVzaEzo/9ncXngs69HXgzBZ/dpZ2LwfcOvamC+P8Y55S
 R6T7cmZkvjnE1QSCVLY4NHk1ay5MyPST+8bXWroPCcoOg==

Hi,

On 9/15/26 17:48, Christian König wrote:
> The blunt reality is that I don't have time to look into patches or bugs
> any more as it would be necessary. The same counts for Ray.
> 
> Natalie has been working on the dmem cgroup patches for TTM and agreed
> to take over looking more into TTM.
> 
> Arun is working in my team and already maintaining AMDs VRAM backend for
> TTM and the underlying buddy allocator.
> 
> Add Thomas as reviewer as well, better to have more eyes on that
> component.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Acked-by: Natalie Vock <nat@pixelcluster.dev>

Thank you for your work!

Best,
Natalie
> ---
>   MAINTAINERS | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b5a4e4b35cf..b6e58a138501 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9140,10 +9140,11 @@ F:	drivers/gpu/drm/drm_privacy_screen*
>   F:	include/drm/drm_privacy_screen*
>   
>   DRM TTM SUBSYSTEM
> -M:	Christian Koenig <christian.koenig@amd.com>
> -M:	Huang Rui <ray.huang@amd.com>
> +M:	Natalie Vock <nat@pixelcluster.dev>
> +M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
>   R:	Matthew Auld <matthew.auld@intel.com>
>   R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

