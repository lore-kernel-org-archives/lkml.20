Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE123A8722
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877626; cv=none; b=Do67xNbOueh0v1hCAUavjfeSHRppdItO4I7DHL6eW1K6ASo6wYrGTjLVuQRQ7OvD/ONsYaSOowUEo9tJjeXM3GQ1/Ngx+WMeyk0vTnTmPxdAUcelLZsVDkvP6ER/inEjgdpMke8GVeqVxS0kCsWpbyIyQ7UYnFL8x43T1pTR+6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877626; c=relaxed/simple;
	bh=T764kAcvkKeub4Du1qwWsLEQDh8HogaHxrIyf2CSLr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HX7j6/RupgnOJDAtmXzbR+WbDYMJ0KZQJI0KzHybAV48dE8mBTe+NOcrOIeyx3MN1RedRaRDVAGXgjdMGnBmPyJjTdF80HsFcYg4WQNo5Pm9YkjUek3En5V6S5UsIOeaqjhOjtoQC+vz2GqPTOXJOUrCMQQDj+yAocS/nCW56lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Zgm4jHfW; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Zgm4jHfW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=lwD0tq9kOXo25StVj9HfyV90bbrSfiL0k0vfeLXKdH8=; b=Zgm4jHfWmbbqFCxXJRKGa45J/z
	q1GafYG8r/oc2H9s+3kIyT2VAxO5OdIBGpz1MyCovDfLqv9RirunY1n0xGehxvrHqVpy5N5jKmqEq
	WCDra4zMSlTaFP1PBKSoPm6wUff2bvB4cKtwzlPYz4A5x6QDhYiaSVtQpNMoznaZ2FUU6NPr7gQVx
	SwJDkD70QC0v7Fc4TvIJqHYGS4gt86ws0jNQ4psPfa/HAx59zPY/7lHJMd4zJkeCKtW6SE4ZdU94a
	x20DmOokVdB5DggOSWHPxaQlYp74ivuL5NuCYjRYZhxTBiAimLZM2rlq1C5Es2Cvzln+I6WT7PHJA
	svPZXFLg==;
Received: from [179.190.179.102] (helo=[192.168.1.27])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xCL4i-00AEm6-KF; Thu, 01 Oct 2026 20:00:08 +0200
Message-ID: <f852acbe-6d4c-4edb-a320-e2d690486bd6@igalia.com>
Date: Thu, 1 Oct 2026 15:00:03 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET
 programming for ADL
To: Andi Shyti <andi.shyti@kernel.org>
Cc: rodrigo.vivi@intel.com, demarchi@kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 tvrtko.ursulin@igalia.com, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260930170434.317671-1-koike@igalia.com>
 <ar3_LjzklapoN1tM@zenone.zhora.eu>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <ar3_LjzklapoN1tM@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andi,

Thanks for your reply.

On 10/1/26 5:45 AM, Andi Shyti wrote:
> Hi Helen,
> 
> On Wed, Sep 30, 2026 at 02:04:30PM -0300, Helen Koike wrote:
>> CTX_CS_INDIRECT_CTX_OFFSET default value is not retrieved from the GPU
>> by inhibit+context save mechanism since it is not part of the Engine
>> Context. Thus, at restore, 0x0 is programed back to the GPU, which is
> 
> /programed/programmed/

Ack

> 
>> an invalid value according to the PRM.
> 
> ...
> 
>>   	/*
>>   	 * Enable INDIRECT_CTX leaving INDIRECT_CTX_OFFSET at its default: it
>> -	 * varies per engine class, but the default is good enough
>> +	 * varies per engine class, but the default is good enough, except on
>> +	 * Alder Lake.
>>   	 */
>>   	xe_lrc_write_ctx_reg(lrc,
>>   			     CTX_CS_INDIRECT_CTX,
>>   			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
>>   			     /* Size in CLs. */
>>   			     (state.written * sizeof(u32) / 64));
>> +	if (GRAPHICS_VER(lrc_to_xe(lrc)) < 20)
> 
> Are you assuming that only Alder Lake is xe < 20?

This is a good point, since I was basing this patch on TGL PRM [1], I 
believe it should apply to all Gen12 gpus. Maybe I could s/for ADL/for 
Gen12, make sense? I only tested on ADL though.

[1] 
https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/tiger-lake.html

> 
> As you are restoring the original code for render and compute,
> would it make sense also add a check for class being
> XE_EGINE_CLASS_RENDER || XE_ENGINE_CLASS_COMPUTE?

In my understanding from commit [2], indirect ctx will be allowed for 
other engines in the future, so I'm not sure we should limit here to 
those classes besides what gt_engine_needs_indirect_ctx() does.

[2] 
https://lore.kernel.org/all/20250916-wa-bb-cmds-v5-5-306bddbc15da@intel.com/


Helen

> 
> Andi
> 
>> +		xe_lrc_write_ctx_reg(lrc,
>> +				     CTX_CS_INDIRECT_CTX_OFFSET,
>> +				     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.54.0
>>

