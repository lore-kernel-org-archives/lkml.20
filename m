Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445128;
	b=FDGY7MHvhG3/2sqZcmFRXrrhvP5VzawISxNHlwXOe/dYYiUeCCcxlwtnu1G1FTfqnGv5
	 STC8Bj3U0EoARt/FxENtjGHReCu1BkghTgEfuEyARDMQ5Z7Bpol/15AQLncN+rhJ3VJHy
	 c1BZ9U4szXdDNIi/TaxvTJX/q6WoCCiZVTv/EFeOAWEc58KLDCbO00deQ2uQkBGorGDhk
	 zqnFVKe3vAZYe9RprRfopHbk5s+9Vglol9kecCj6a9woeZRUWvePWyTzljFMKqUYTK2cO
	 3m0wubhRnD56/GuEIorB1LjY/qviIGdjCYygkBtGVcCiPJVxfI1mfFsmwBdlShYJOmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
	b=uKQmIKwNjgslb5lxJsofh1ooMVGZxuI44I4YQfoAX6Qtzx4sVILSgad1F5NukU8b6ZqJ
	 y4tEjExVm14r1USGEq1VWoYpKMSMiYqVp0Gfu7qZCThm1qfPT5SGRjd4fDoaoLCd2bZzi
	 21TE0W26M8vQ5dmbItTonGnENfIPI1NbyBD02tqclUQBqMMj1cctqR6mtWD90Q7hT+USZ
	 cRpO0k87qzfp+hzKi8J53B0PQBZhzWTgDOOZrxvo06phmxGIB0nq/gokl5lxA+FLiMWIG
	 OIUtsrwiQhHgrG8sJuTeaxE/kLRtwCiH3lR/lfmnypzCsS2Bo39N8UrAmdU/Lx0WteA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbwFx2Zr;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4F9606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4F9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbwFx2Zr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so33720855e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445126; x=1793049926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=QbwFx2ZroypK6R/rCW4N5ltjtXaEJgTxUGJvQO1nqB+DU9ME2G59z8HDKJQ51VfX23
         RtYuMHOGf14Htyx7tDSGfP1iwrMoFmICI9dbtDu8D3AsvvREwp3KfC4WRG1l6FKWyFDK
         knV4MBl6J9cX84x/hlz0huPYI7PlUYQ3FqeRM3q6Ul5/MmAfvkeZmhzk9YSEUfgrcDC7
         2PbZq6yqCcmOUUlK6e0MSkPd/uI8CwIGck20xu99WHf5qlDCT9i8YKP1Y5tHBsWo50Z5
         pd1kc36ljY49xYXhn94TscBpCeW81TSKLYfSp2m5ZHZ1wspmLtYZpBMI7ScZezVw/7lA
         Exyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445126; x=1793049926;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=i+6xp07pUSNkZOMxYKzF1EcL3JwglEyk4Yj9X1VA7QrZk2NwOJUn8/Ah+NLwNFEqRo
         JrKjWPDYJbENSdO19Ym70xNLyDhmjYU++lrMVa3IRx4GYyc3bBQRY1RlWTtXq19sqlK+
         L6NWRWOwdy11xrtxwySI72WBEqIv93nM5NDZsZgMb/DX2DEyInJpTGgFZVWnlRewwAjY
         KnGRC3VNT6WzHgLa3DUZD3YAbrVecaJSYvMlnvLkpLFZZXLgxrrhp5hGrk4QgrBYCUrm
         5F/PnCdUTtEg5xhWUpKWIW9GQ8hPxLZqEZCKaFa8ioRjofSwqnpt968xUc1d9xwvMzvW
         /43Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZ5Qpx27dJ10oaqpDYW7Yr7dZ3WaukUk51vwi6Py79u5jTPbeRcvgNvmRISOWZVR9lfoAOVOQoUdcWRss=@vger.kernel.org
X-Gm-Message-State: AFq9FYIylOmWyGXzDGDjva92XrZwmKQ4up/clz7R6M2phV8/mqVwvpRl
	2Rqm4ZNMTUSyovmZ/7YzaC86JqNT/KjRy1Fbx2g620aBIruIAjT9rbXg
X-Gm-Gg: AYBFou0oaR063ZYzp7xOEMAvLErXVZ3l3mZjb4FeDdEdeWMvgLv+lEK9AmUNf9/PfLA
	iQl2y7kxS4b9FvtyF81h1518JN/2zvlLnH7yybMtIEsqEXCG4E3lvX3hx1Q1y2hGGf4fT+pir7i
	jARjDTtDW/tRtbh1ZEpnbIRLepmrv1frLoEnbihNdiLUwBwURrOtJHNzTFBcHCjGHRM7pPNA3No
	L+WAYzDjFw4I+sS9P8dqPB/5KfPTiaT0RcLoYPF5+dwQdHrflSgvMyuj05HOGa1222EPkUKA+e7
	tcpwSXQPEf8UOqDItcMMGh9wMZPGOH2E8fXfUakF6pt37QJ+tU65BlEKr+fwg1iqf29JsTI7nUL
	2XQw5NpMMJp1BPkcMS/xHXaDrNfJBi6XLSswZVYgBt1XKFj8O4ym3l1sDyFXZ8WfJIpz6xSIppy
	SpUmBO4i/C2eM/ch581aiqF2XjAa3l0fWJDx/u9QP7j8YgDmDAVGstofPLv95Pa6QCzbpVyMaDD
	Ui1dzgChAIByxpOHLtK804wsnQOFeFHBPs=
X-Received: by 2002:a05:600c:c8c:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a1d7643dadmr171548545e9.34.1792445125587;
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm25118305e9.0.2026.10.19.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:25:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 next 03/15] kallsyms: Improve selftest
 test_perf_kallsyms_lookup_name() output
Message-ID: <20261019222524.695a4d31@pumpkin>
In-Reply-To: <202610200434.qSHPOyDo-lkp@intel.com>
References: <20261018155206.132411-4-david.laight.linux@gmail.com>
	<202610200434.qSHPOyDo-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 04:57:54 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-4-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 next 03/15] kallsyms: Improve selftest test_perf_kallsyms_lookup_name() output
> config: arm64-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/config)
> compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200434.qSHPOyDo-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/kallsyms_selftest.c:82:12: warning: unused variable 'The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun' [-Wunused-variable]  
>       82 | static int kallsyms_very_long_name = 1;
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kallsyms_selftest.c:69:33: note: expanded from macro 'kallsyms_very_long_name'
>       69 | #define kallsyms_very_long_name \
>          |                                 ^
>    1 warning generated.

Duplicate, depends on config options.

David

> 
> 
> vim +/The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun +82 kernel/kallsyms_selftest.c
> 
>     81	
>   > 82	static int kallsyms_very_long_name = 1;  
>     83	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

