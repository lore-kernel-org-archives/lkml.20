Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF35840F732
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263642; cv=pass; b=NUDIGMrVLckSqNWS+iYNVw1B7rNXQZT83YtrQYWPToxlExoNanCfQYiEMiOm/ECDJDRuHTqxiSc+ACOnvUbguvJuhZ4EdTs/uJJB3Hib6eZERLxWnOYF8TkumkEQpWoZXhXkgJZsWTwQhUdyDkueFxXduWvzktQNMeV4wtRLPNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263642; c=relaxed/simple;
	bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw5Pnu0VTtG75Yglu9x5CAKYGbc38/aoeD4qhYttrCvqYXSfD+u8dpxr0UX7UjLD6D3SO6qaiLTBPRZG0E+ztk4aZYb5+nXxPMuEOdhlwXa3VEVVduwkf0Oq5xxzRFfbGI7lwwq4YIDV65yWo8eMkhOuUrQfwSYoBhKSl33SCMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvbdTdaL; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvbdTdaL"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6737f0593faso34230d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790263638; cv=none;
        d=google.com; s=arc-20260327;
        b=Y77btH/kTtjpqoNXINrgyU/cjein2IfAZdxhuzGuVwI7XcnYnvg8moYtjjafAen0pt
         JlkSotaghMu30hFqUffjNc4afm9/xuzN6N/6Glct6YHKXLoP5P9YUsTLeuAeotAzso2z
         LTSU6V9RACBj83fAWY9lJdaDZhE0uwIT1TxYFdLRN1Owv2zkLFmt1DBHDs9XWrPgipiC
         9KVr3ioT113b5OsXpM6i2mreW52EdVhulRz8HnfjiDn/lat0NlNDWSv5Kg2IDhvBHc1x
         o6vM/HaDHa0fC+TsaTRxfRxjfsIZlw9Zj0r2aIY8mGpl2sgVAciC1zLhAaCNpzvlQkU1
         cQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=;
        fh=8hVRCZ3nKSNNigPQMCuhL1voACu/Rm3ziUZw8h7MUCY=;
        b=Hatr2TkBigBVg6WogLDZZ3qt1GLUNInVl6ZLL/yQzmgv1iBiDsStaB5VPq9bNqL96/
         h2tYj0ZAEU/e0kuldsJDQV1LTVdFqaAzypxbhhCdGPVRbh52iM/HNMactI6Tr3CHSX9x
         7446peEXPizMs6IG/RPOXf/FF7SN1A9BROmTGcFzUxwyFOdWN2QRKa+AWf5tGoOIBYSR
         EBvm3glGJhHfdyC3rfIrHr8BPN8vNC8TlXcSq1w1/0MK+VxfVfu2QBGCZVjBmi5Bk5Xr
         HVuVpbfSWqhLpt23jUYlofL4SNtbqdVxbArK2+VxSaY5iEHvJC5SjmDHYz8gFNKy3c/F
         w8bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790263638; x=1790868438; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=;
        b=GvbdTdaLjwOxPP/9dSYmpM665hWHeowIGUm2OUIfAo9lvMOkV0wUpWMTVW9qo9m7tA
         EcxUg0DdyBlATfCRVtD36pxAyQm/YoPBxLix42FIMDipucPJaImVIFZPQIdHHSrrVxJp
         EJuyTKcKOCJSZIlDJ8Rb37DBVcvwzNbDdydUYyZvHHrZ8Odx5T6OECwyPw1IOfYmRTgB
         keXlkaiG5OVlI8pp8tr4qejh0xLGTAyA+0hAt6lju4DuXSbgBScjfnoRczHcagPaLz+i
         iWAxqOlsAzKmhMgRM/7adDz/nYJpquMIMj8PWQboZS3hPR8mZC9ndGEqrF31141zyVIN
         0qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263638; x=1790868438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=;
        b=us5/5MO/w1AoGKil3r0skMqfDBZYc8KiEm1UjmSIU5Ye2CR+dxYM++kfbRlKH47M80
         48dq/XySCT11oST6oAXnzBCBH0wc3VmvYFW3UVlI5Lus/v6HvxxQ14NAnu3wMCcC/Wsx
         SzH9BdX87KdE26IexD2zYVXmnPu7iZnQzuOgc0OaZHWz9k36aJcuhJl22gPNXutsm4td
         G8KsnNaW2w7rSqG1ksPGwTbIAPwH95FUQi+mGzCOCXwnNGc0/RZUQp1LqfQXqEQlp9HL
         0s7HXdVvP0k+9GgCTboLg7tYpjnf4ZARLpvrKVP28Z1QUXdQkUxaoyLDXl2xs07PbQdD
         qCqA==
X-Forwarded-Encrypted: i=1; AKwUvBxJizHGhbQ6rzrVrB0w77fj+2Oo6dRGBylkEmkb3gE/RyePxR9zH9qliDiOIia6C8dWSUmJiP5VrRZMQaI=@vger.kernel.org
X-Gm-Message-State: AFuF++m8W3oqunD/JqNAFS3SCsz0JeY+RzxIoLqZJzzSHr3Wg0qoK/ts
	nReOFq3Jv+K/0Vh08JLDIXfd+mUTUux7Dtzj+25oB6PbkEIlA6S/T/fhj+9CGK3mQLVlmQFSPFc
	IAfkZ+cR5kNElLl05uLc0VoX5jl96YYA=
X-Gm-Gg: AYBFou1cFj728UajUp1kWs5nNukdup2Es4+jFsri0TaXVpHLoZvr152xfk+DjuNMcxU
	Ss+dNBZv1e+spVa8QzVSxV7D6Qotj1tBtIAmRIkwUzsIuuRBvn0hDzpwOjC7A0v+KoV1uhpGDxk
	8TBqsj1N7cHKlwU46pyx0z9+gwfBd6ww9TREnjA2A+5/FHecqF7kJ9+KkEQlp4mu+Q0NhqXy2cJ
	MAMNErtSYj4W9i1dyq7oqdIgIPW0R32d+F9hc1mGp8Qeh2u4lCDunoXXVk4R5IhSXCPmO3TgnXN
	q34SmMcDiB1d8vJCRD1D9ioc9xYIaacNdFYqndRts3rGRQ3oUl6l2fo=
X-Received: by 2002:a05:690e:4383:b0:66f:c1be:a64e with SMTP id
 956f58d0204a3-672ed4304f2mr1429442d50.64.1790263638367; Thu, 24 Sep 2026
 08:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924001906.715322-1-oss.patchbox@gmail.com> <20260924081522.GK200420@e132581.arm.com>
In-Reply-To: <20260924081522.GK200420@e132581.arm.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Thu, 24 Sep 2026 11:27:07 -0400
X-Gm-Features: AclHuK82l9ZaR0IUnPDbcSKEOTQfVhmelPZS4u7C78ZsgzLXCQHXkDmfvBdAZqE
Message-ID: <CAGG=RgCwTOTLdocpmSc9=MpzhHwaxotc9GDDQA2C-VNHpyfcMQ@mail.gmail.com>
Subject: Re: [PATCH v2] coresight: Check runtime PM resume result
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 04:15, Leo Yan <leo.yan@arm.com> wrote:
>
> There is already a patch that does something similar and fixes the same
> errors across the CoreSight folder. See:

Thanks for pointing out the existing patch!
