Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0476447D451
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237149; cv=none; b=AeNA7wg2dO0veXBe47x+bWX72YhP3gUDEKukwVqBwyIj6WhcdF7nYy6cqPqh78sry7swgwWl7d+OM3Fp+0QpvuyA5qeko+V1gR9MWfq0N6BWkkKAPKrtVk4g1VMlj/ZJVoxf6IqQVIlLlH2xB1lZL1KEIwgnptww2lyqgBgztjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237149; c=relaxed/simple;
	bh=eXah0/8yiozeIQkstc64apVlDIhMk0HX27N9Ddbe8J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqgdxahaBuS2jO55sgFVquRl9NCEVP3Zoj+FV47i9qtCHRoPa2boD4M0UPrC4ucfU10xfPmaz8sqfAgBt4/Q0gt3PVR6LzKOwkXQkoR8nCJsqW/gwQZVjkFbeC2D9/ulsAEHHpIFYznTRqPKqIy9JYQqXl1/0PcykeDZI/CshEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDqyaT7f; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDqyaT7f"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-804795653f9so247340a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237147; x=1789841947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VGIYZo7HUmxuRC6xiRDT2Kb9by85XHCuXQlDG3DRrk=;
        b=XDqyaT7fzgIiJGxvJhgOJk4NF+5+xxNePSDMUgBE2x67rXHARQ0KlvuWT45SnSi6aF
         Jcz0HPWnpstEAgkfUBUCVD6jIM3YufE09xO7FTgE9kPqg1K2zGkD0nlbAXckvIZaSMHW
         QYuxIxIVkoP+3Qnexa8qCqPXaN7nwqeJep3VRDVuxFJF/gN9ChvuWEgL8vaUiqoPZ3xf
         V44inNwgArvzF1lpLMhutflS1axzFv5d4KwUjWcR+JPRQ6Dbh+CekMza/7KL7+WZYUG0
         dwtdKy8Z1nLq4FZX4sHWOpTR7hrD7W9SayBYEkH0jjwM/SRnYkYmNJqrNwz8n2YCwowi
         EV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237147; x=1789841947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VGIYZo7HUmxuRC6xiRDT2Kb9by85XHCuXQlDG3DRrk=;
        b=eHJ/AlaqUkXqsl6WtHnaBafnk07JOLgdmJ3yYZ5cGz8QVk+fYEpxNcgh1CgH5z9sTK
         a8hz9sWmQSNX4okMpM08R6m2+Qv5UjlCKnGTUVNDVQdc+cnNM1WWOkBnpc51pGgqX2ij
         GVsXdJxJY+gFVDG9q/YYOkNKCjQiagOXY9MFcngI9csgGMJE5CzVaxx1rKrxC1cL7nue
         TdMJ43jTaabc8g7Bny95dWOD/lyXKn+77rlJ1R0a9U4PmPyWUcSDxs+4wuE4b2hzIYBi
         PVXd7edglZrKN+xE5KERaOXG2NQptBjsBg2fIUcO3pHeLYaRjuwooXJaMmz/mqcqtNrw
         D7lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyd4o3vvKC7MMo02ScBpL9FQmmdtF7cIiyU0SEJl7tA0Lu2Y3tgHnxQ47BLw2p12VmrBf/Cq4zGyV2Krs=@vger.kernel.org
X-Gm-Message-State: AFuF++nNdBQVFWDZs98YG3lukTrctHNOzdk8kV0dVyOqUroTRGyynema
	YVm3D39xTAeDfdWgf0tvlNdZDFzpGSRYT97oWDCBuKv71ERMkM4IKIHx
X-Gm-Gg: AYBFou0XSRND1K7KEE8QSbNcQmdfFAujDnmXNdLdC827ZzK4tWITuAW1RCCZhu4ufCU
	+6Ys1BJBDO2zz2Wsu0vwHrB4KKJN2DxriBtlQlgr+UIxZOju8mWSNqXiZ8UYe1uZAtyS8HfW96n
	pVv1IFrej9cWcshGT5tzDukVooCZtnqsxUkEiVdMVKWeUPQ8+dRrlmsxAI6A9wtdCWQXIAutl3Y
	bwRNzZ1bOZLiMSrczIzbwbvP3G98qHitLtJaf25zt1Z6T/QYRokizRhh/0/fVQNKJFdl1cfuHFD
	nuiA81vev6ee23hnfserw/Jx9Y8yppHt1NxwJXCq6Z9f3F4LtHlXpU9Z7592+pU74/3gVCDrepd
	FHd1XcH4g4I5nzvJJVWkTkP+AUsGumR2vZYSPUDGuJkAn1voZqgTR7I6wKscF8e+2joP+ChQ327
	mjUcVw3WFWRdoJvDeE0ljhMsOz0mhbm3/jB5UJjDKUxt36I+7wlB+VOqTmwQoyRcVOKLQ5aH4JK
	Q8IjDmvwobLWqNQ
X-Received: by 2002:a05:6830:6d44:b0:801:21a3:f304 with SMTP id 46e09a7af769-805a0c42350mr2098949a34.20.1789237146911;
        Sat, 12 Sep 2026 11:19:06 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm6787312a34.15.2026.09.12.11.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 11:19:06 -0700 (PDT)
Message-ID: <a214e0d4-b25c-4606-8a46-6a697cfdb1d0@gmail.com>
Date: Sat, 12 Sep 2026 13:19:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Novatek NT51021 DSI panel IC driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
 <56dcdf77-2a82-4efc-888b-736f512e63f5@gmail.com>
 <6fc67e27-a36c-4974-96e4-1f68b85b3114@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <6fc67e27-a36c-4974-96e4-1f68b85b3114@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 7:05 AM, Nickolay Goppen wrote:
> Maybe I can incorporate your panel to my driver. 
Ack, sending out the patches on top of yours now. Thank you!
