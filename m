Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434765476F9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082683; cv=none; b=jKHth1IFbULbXN+jeQCK/4UFhe8sg3xpegnUIVgxGR32KmQzG5m6k8bRvvMjAwvfdhKYS2Q8DF7vUTJMUXKmwFc65cBe90ZrYREoGxTyTgvTkilbvwfPd/XwK3Uk7AONgC8iKaMjuDazEOWJW3HbMedWCChB5c87yo5W7cYZqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082683; c=relaxed/simple;
	bh=cSnNPwiN6yk+EOVHl73RfPUomrZtynv9ccjwZPx+lAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qo8w5igcGihLQsEgLcJ+2RVKkS4ovFgvxHygohSpwhIXVG1UOK1lioVH89MHJ6GqGLX0nL8gzAKjZwNNaJyQaJG0rq0Nl8DsJ+4Os+BktqoPED1QvT9HYSt/Vx9q5Y4U8MulaKq4hFxGGTK8nUhpuDdMVz6EBCu6mnt6yFcu2So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDPHeOGA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDPHeOGA"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso122599466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790082679; x=1790687479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo/W8WDh2FRjK2u86q2opD/F5j1sC7K9OlH5rFnj7t8=;
        b=dDPHeOGAky6GNlctH/fSRLrNObUbNCY+VxtoJeYO8iPfQNX1NjJ8mqXsgnHc/Yzxcs
         zVKub8Hzaw4D/ATtgv8AmqIbrT4134Zz/pHwjKRojhDzp5j7Ya7cG1tcik0vcyiPHUSL
         1nQdUVqj26qGNOfWZelGktqoFRtw7yZuWN+BWzuVnz9Q9GZaIxSK09eLVMyTky3We8Vs
         ElpZ/QDy+D5rOakjC5amYD8KWTVKADjiG3HZFFrDhxaHUifs8lys9+wszgkR9oishDIz
         TZI3phcM+cPBRHl1b+d5bBuvXYvt5aBOESvbAh9lGbBki2SL80712ptzAEBmaimafaPv
         stwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082679; x=1790687479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo/W8WDh2FRjK2u86q2opD/F5j1sC7K9OlH5rFnj7t8=;
        b=SgiROvIqwMFHLytEDBFgy5cooun+Vq+6JmoE11eMkzDARvPtZ6kNABGDu4Rpyfreb4
         VZe4NtX3zuR48nMXaG1pxeFZMOehMbaORIhKkBGZqpoZ2MBr9WDOF44j1n9VMA2Dr7xZ
         imuLXwftNgtbvzETCxML2UhOlBI7zb1nShlfYGGKJhCypzelTOSSCrQTWVC//jOcrfhy
         wF5Rl5csdLuzmq9fQYhZMREORfW4NIqrtn1T8ftA4zhnPpE4eAfFGTA9ix+HE3t6XHqP
         dPdvrMMb37npP4c8HZn1gQTB6cGcQwkmd575Y0XaRZKsxeYpUGII6g8n7uzpUXjWb1Jz
         AKBw==
X-Forwarded-Encrypted: i=1; AKwUvBxdmuLPi443A5kbkVvW1jVKFgrp3qMZ1OLYqGEUn9x8WkNO6BF8k2x/JpmQo923j4zLxVJUk+lmH4vNGek=@vger.kernel.org
X-Gm-Message-State: AFuF++mEt3rASPuUOXdyEfGlZxBSw/I+vww2BkL4Gb0PHbYKHkvPPi93
	5TCk2ikEFgqgwTQbBdQsKGtAoNPQsKFqMFkuLg6g10tM+A7f3xVYqBBjwSR7CCoj27A=
X-Gm-Gg: AYBFou1B4oosolr5nqtxdVPVeCA05JlLX0mY71ZQlC2i3OGBJkYUIzquKbaJMSgZxxz
	TUn6yOneGhmTM32s/dwO+Gv/OlZlin9Fui7PZKxrqXd+LzvlBJIgQvpL0BJYNX3hZrDnUsuF8Hs
	oo0AYsIslu3BgNbZpkz0vu1GWSOZMP9WcvJzsrQBJzql7pz4O1+icdSydqpN7/L2+Cr6V51cMl2
	zhi4TiYjn7Bp0pVaoFTCbf59eAMGg8q4VGxFkc/ri6wvMZIKQq+FioDRvcWq8xDenndXRzksl0V
	esu5s0cQ2zed1Gy4MCNgPcuXOaXwZWvnrSWIIEeIPGYr/nG8nZEax1UxgxYlBbZP8OKmblG1aFa
	u0R9d5VJymreoD9YlD7tkZyGvO9ah/jp+nP8HR5yA1KMaaaxi1MKnDjoibhTQrKWpE13byMKEAN
	tm2q2R5FegS8dNP+jAL4GJw2esPSWAmaMtnmkG+P40B9fFvxxWLh4TL8yWdnFbBoZkHMxXZRabz
	1I=
X-Received: by 2002:a17:907:db02:b0:c26:1f8f:ed53 with SMTP id a640c23a62f3a-c2a8d522b8dmr222772266b.12.1790082679216;
        Tue, 22 Sep 2026 06:11:19 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5832fesm84591366b.30.2026.09.22.06.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:11:18 -0700 (PDT)
Message-ID: <56ea4b35-f73f-4e6e-95e4-f255eb089c5c@linaro.org>
Date: Tue, 22 Sep 2026 14:11:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/49] perf build: Make mypy build test opt-out
 (NO_MYPY=1)
To: Ian Rogers <irogers@google.com>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, leo.yan@linux.dev,
 linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 tmricht@linux.ibm.com, acme@kernel.org, alice.mei.rogers@gmail.com,
 linux-perf-users@vger.kernel.org, namhyung@kernel.org
References: <cover.1789966896.git.irogers@google.com>
 <7c56d15d6e61fabe8b94f5a98713305f15bf0848.1789966896.git.irogers@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <7c56d15d6e61fabe8b94f5a98713305f15bf0848.1789966896.git.irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/09/2026 06:06, Ian Rogers wrote:
> Commit 168910d0f937 ("perf build: Add mypy build tests") added mypy as an
> opt-in compile-time check (MYPY=1) because of existing mypy errors across
> perf Python scripts.
> 
> Now that all Python scripts in tools/perf have been cleaned up and pass
> mypy without errors, make the mypy build test opt-out (default on when
> mypy is installed, disabled with NO_MYPY=1), matching NO_SHELLCHECK=1.
> Set MYPYPATH to tools/perf/python so local imports resolve during type
> checking, and clean *.mypy_log files in 'make clean'.
> 
> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Ian Rogers <irogers@google.com>

Is there some minimum version or other setup requirement? I get this:


pmu-events/amd_metrics.py:181: error: Unsupported operand types for + 
("Event" and "object")  [operator]
pmu-events/amd_metrics.py:182: error: Unsupported operand types for + 
("Event" and "object")  [operator]
pmu-events/amd_metrics.py:230: error: Argument 1 to "d_ratio" has 
incompatible type "object"; expected "int | float | Expression"  [arg-type]
pmu-events/amd_metrics.py:231: error: Unsupported left operand type for 
+ ("object")  [operator]
pmu-events/amd_metrics.py:236: error: Argument 1 to "d_ratio" has 
incompatible type "object"; expected "int | float | Expression"  [arg-type]
pmu-events/amd_metrics.py:236: error: Unsupported left operand type for 
+ ("object")  [operator]
Found 6 errors in 1 file (checked 1 source file)
make[3]: *** [pmu-events/Build:192: 
/home/james/workspace/linux/build/local/pmu-events/amd_metrics.py.mypy_log] 
Error 1
make[2]: *** [Makefile.perf:562: 
/home/james/workspace/linux/build/local/pmu-events/pmu-events-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....
python/ilist.py:13: error: Cannot find implementation or library stub 
for module named "textual"  [import-not-found]
python/ilist.py:14: error: Cannot find implementation or library stub 
for module named "textual.app"  [import-not-found]
python/ilist.py:15: error: Cannot find implementation or library stub 
for module named "textual.binding"  [import-not-found]
python/ilist.py:16: error: Cannot find implementation or library stub 
for module named "textual.containers"  [import-not-found]
python/ilist.py:17: error: Cannot find implementation or library stub 
for module named "textual.css.query"  [import-not-found]
python/ilist.py:17: note: See 
https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
python/ilist.py:18: error: Cannot find implementation or library stub 
for module named "textual.command"  [import-not-found]
python/ilist.py:19: error: Cannot find implementation or library stub 
for module named "textual.screen"  [import-not-found]
python/ilist.py:20: error: Cannot find implementation or library stub 
for module named "textual.widgets"  [import-not-found]
python/ilist.py:21: error: Cannot find implementation or library stub 
for module named "textual.widgets.tree"  [import-not-found]
Found 9 errors in 1 file (checked 1 source file)
make[3]: *** [Build:91: 
/home/james/workspace/linux/build/local/python/ilist.py.mypy_log] Error 1
make[3]: *** Waiting for unfinished jobs....
python/treport.py:12: error: Cannot find implementation or library stub 
for module named "textual"  [import-not-found]
python/treport.py:13: error: Cannot find implementation or library stub 
for module named "textual.app"  [import-not-found]
python/treport.py:14: error: Cannot find implementation or library stub 
for module named "textual.binding"  [import-not-found]
python/treport.py:15: error: Cannot find implementation or library stub 
for module named "textual.color"  [import-not-found]
python/treport.py:16: error: Cannot find implementation or library stub 
for module named "textual.scroll_view"  [import-not-found]
python/treport.py:17: error: Cannot find implementation or library stub 
for module named "textual.strip"  [import-not-found]
python/treport.py:18: error: Cannot find implementation or library stub 
for module named "textual.widgets"  [import-not-found]
python/treport.py:19: error: Cannot find implementation or library stub 
for module named "textual.widgets.tree"  [import-not-found]
python/treport.py:19: note: See 
https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
Found 8 errors in 1 file (checked 1 source file)

