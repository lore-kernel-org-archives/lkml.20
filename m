Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792462837;
	b=5IEkyVSKjUNnwX6tms3A7LIZvoZ15VPqpcZfahccrlHCyvkMQ0QKzLnsFobAbB0IQXCV
	 GdFjg2+q9hksGuF8Eqo64aO/rX/h4OH3L2Tle/vOeWgsLxi0NX+TmUGTUXOooDBcaSKrx
	 cYP6xcEn+WkAwaCb2A2TKOVTo6PW32dBko/ERrhzjr2RPLxv8sR2FyopIdOnWV9Aj1eba
	 Rolz3YfsKZOKdCtaPJCggXhPoTKNy0NdiqBLey2Glfvn/qIGmarGRqiMUDJXuPMd6rhnh
	 zDLBKtN02uAz07DUdK8jXVIigJQwqvh8DHkOncpV0cghH+AGd2sVjLjUh8in+OBKrvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ov1JQi2JjMl24yFAFJ2MUTE1RthNQLp4XwRk7/4yijY=;
	b=M2LMZVwvueSoJY1nxHUY8yzchp3t8qM9+XAgwxNGbFEt+RbfFgCpxSI/asGzfHiDc6Ec
	 mKIvzB2SnAWN46FOVe5ox7s4j4dLe9d1iwWxwQ7NdVqUxIQJ3drrOFVH+U9Fjr5LVj86s
	 WHHmrF7Q+Q0H9qrz2rk7OTt7cEoMc6DLWuRJ9B3Ue/1nlURERFTeEs+3aR2oCFSMbFLsf
	 5E+AGKUqwyQ5FdM13wcRcBfsdyvqJJKMaFycMa6OEliI3EvSD9KZ6HxCiK3H92XJEUwAk
	 7i/kMkXdMNr+4qHmYqU4q7EudZsu9JAwCHm+1bSqBHIwcOmBIxmjn7E2RF7mDofSJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="PGx4+T/n";
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FF606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 842FF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PGx4+T/n
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1afdf5196so959970eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462836; x=1793067636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ov1JQi2JjMl24yFAFJ2MUTE1RthNQLp4XwRk7/4yijY=;
        b=PGx4+T/nmKgwVXQMg2g7SUNf4KZr6otZbgMWVQUFD24tBE1Gw+5XH1ZZxs0m7kosbF
         hy5/IZaTzRvsS/HAnWL8g85M18UFL4MT+dJuIi+HV1ps9Zx1qGDEtojeYxqauSP4J+uj
         G1CDs7OVI9991XMsyI1exjk0mmxuZJ3JoohC4HWfj61dIpyqzskEzAvmzakUgRXgubvD
         rR56xTm3pJ19nYcpjcNnX/lh3dDZVykzRhcSlUv9sxNO9zMTYUoDaDuu9FKJVN/7Vmxf
         /BIvBHkzjGWN4kFwAq8UYSB4+bBdWz0ocMT9mCPLuobo3dKFhYNONjpBMMAR518mvr0Q
         HJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462836; x=1793067636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov1JQi2JjMl24yFAFJ2MUTE1RthNQLp4XwRk7/4yijY=;
        b=XWFfwUROX+CCuZbsX9f7TfKsSppdFglqwW+ylHrmX31C5qW4W8VRfYzmnAxQS+gCnx
         IT5OCsrRgT6vSd4n1tLH4qH+8nIKB8or0GHKDjQod/nqWl6gP+9tL9+AwVPaJLgWDRDT
         Wrors+auIaUvWdB/8GhjVBdvex64iLsm0qE3C7V1+8aZGitduJ6pSkqlKTWSeAfySs3n
         scvg58Z4XwWZyDJiipjETGyTSVo0A+XUVX/tf+nVOaQ4WOxfkWVxWRMGxwdOUMHCYAOU
         focfgGcq3Iz/wK9gf5o9Kg55jDDwsW5jLyJT+Qogn0/aLiCaK91EmZhGlycF78qOB6PC
         It9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0ANn+z4cONm1Po2y/nlFpXVc/bb+FjMc4EAp6Nd6egM5Hlt8UvNZzGbmO6kmhotPp6UbO36Qh/AaiyJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc+kSINCd3ncDATJ8W4hh2qe7YFY+HQWb4/O6dEQ8He/mcejuC
	sQg8Loofu/sZK1CgCNyXcKbr6c4bhII/7nnGNkiZLsNyVOh3eYNfVlOy
X-Gm-Gg: AYBFou11TTP4I1KKyzC9wgZd4EreiuPGw7Jd8Hul3yekZiRw7v/E6/T+FRwwEGLSEv8
	d3M0whsur+ZTDZe6taSKkBOQzITgneJzi07ZN4gDMLYqRLEtBQ1raFWy3xbsf3dDxHCmyRrG6kv
	43R/VIZcyOsqwLCV9yZd56MV0ZfvnhUlezJbMV+cCx9nW0FqEe3ffyo0B0QQ//ts0KeRkyNoGVF
	yvGDHUrNBKc856xSC8B7KJs7lM8YVqg5TsNi569mUoorBSdjDVpeuz9+4ogQqegLDE4xsbEXt2D
	FJJNkhdJFfDSKn9GryPtzBsAn4EeyLPGzPqIncrWHnBx3YMDtSNmaRAMzC9e6xuv0bPDREJW89s
	pphQP1n6qqpideE4eY8yhQYIp05O93hwQsl3yXpUmoua0dllaHgvejmawMrDrHQPGAtqGRe2H/8
	baEelVHTV1GEjBiHahxEHdJEf6431OsH98rmBdpblJIbixCwBCTcw9Wu0HmfTbnnFOYX2A8Y72x
	e0GUkjZ3LpXX1lJ1bXsOWFsYmO0Uz5X1RllGCLT4cE=
X-Received: by 2002:a05:6820:82c:b0:6f8:3d45:b465 with SMTP id 006d021491bc7-70352783f61mr5261958eaf.11.1792462836179;
        Mon, 19 Oct 2026 19:20:36 -0700 (PDT)
Received: from [172.20.5.89] ([65.141.20.21])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f284d1sm10247392a34.2.2026.10.19.19.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:20:34 -0700 (PDT)
Message-ID: <cdcaf727-4433-4f8c-8e33-42094efcc6d8@gmail.com>
Date: Mon, 19 Oct 2026 20:20:33 -0600
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
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match open
 parenthesis
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <8a960200525367f0fadca6b83ca57273e469f225.camel@gmail.com>
 <53D6A234-940A-4B29-89B2-7EB0E459F077@inria.fr>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <53D6A234-940A-4B29-89B2-7EB0E459F077@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/18/26 11:09 AM, Julia Lawall wrote:
> 
> 
>> On 18 Oct 2026, at 10:18, Comfort Oyewole <coyewole7@gmail.com> wrote:
>>
>> ﻿-----Original Message-----
>> From: Greg KH <gregkh@linuxfoundation.org>
>> To: Comfort Oyewole <coyewole7@gmail.com>
>> Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
>> linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
>> outreachy@lists.linux.dev
>> Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to
>> match open parenthesis
>> Date: 10/18/2026 02:30:05 PM
>>
>>> On Sun, Oct 18, 2026 at 02:22:49PM +0100, Comfort Oyewole wrote:
>>> Fix the alignment issue in order to adhere to kernel coding style
>>>
>>> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
>>> ---
>>> drivers/comedi/comedi_fops.c | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> This is not a staging driver, why is staging in the subject line and the
>> cc list?
>> Sorry, I made a mistake while working on my first patch. I just realised the staging drivers are located under drivers/staging dir.
>> Is there anything I can do to correct this?
> 
> Just work on something else.
> 
Comfort,

The comedi driver isn't part of staging. You can see who looks after it 
in the MAINTAINERS file
or with:

   ./scripts/get_maintainer.pl -f drivers/comedi/comedi_fops.c

That lists Ian Abbott and H Hartley Sweeten as maintainers, with
linux-kernel@vger.kernel.org as the list.

There's no dedicated patchwork for comedi. Some subsystems do have one.
https://patchwork.kernel.org/

Drivers outside staging have different
expectations. A clean-up style fix may not warrant a change.

You can still send it if you'd like to see that change in the driver, 
but I think it could be separate from Outreachy and staging.

Good luck with your next patch.

Jeremy

> Julia
> 
>>
> 

