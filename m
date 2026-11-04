Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787965;
	b=0ytbH7S+oCyR9CcU+eWm8s+77p5RtaFmSTF10gZvOAwDZq+amktDGyX9JRToTd2Z8HJI
	 D5Uy6WwhZap6RY2zyklEqRCtrkRts9JfHHpxWH1Oakkfe8Hiah8TMKUOIO+ruOExGHv9d
	 H/jnEQ8X8r9HyV89Ht8hSOCdpiygwQYYFbgKBD4FKCnP1RS+MusZF6tGZVV/u+e4mfAk2
	 BYRltDKEY5NUEf8lyKexekLoV0h/jX6+DMSbm45K9HGzXkVSuDNLfSDJ7ozw1sygx7+rj
	 i9S3lPj7uVcxM0j0sZCOmvnwv8T0csBwbC+2dWQNOIi4RqwX8I+8AZM8myDWChGqdXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787965;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vgyN1MVtewCE5iOY62uYApAFJ1DpQnif1ptUlpmq6/8=;
	b=zZEFntoT4m20fjrqDk9ej7uQjYGwMfVdHCOf84WEH9uy3sTgE8Nwx320u9q6VMI/S26D
	 DDW5s+7o1KYqeGRNtC4IL+I/d42SJazq+MGlD9Ca0/suJX5cqnHqh4ydj1pH0sSBjtTha
	 4P4/SuqY8cFpVPlT0Vo2WBEp/1HRp6O5ggcjDE8uZ3aaJArSzjOW9wi7qDl5mmT2Y8SNO
	 vjfH9Rv01PHsFN+w8IouyZ8PsR4r9cehEXU3MtlaKIk/jRNe9TaQC6nPBOPFuZJkQjxrZ
	 ngwiMDudHwg++exXNPzVpxKwOwb9zLe9kIgUaVaMBTQcq+9AcFNgzMqFyehFGZG1CtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36B3606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36B3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A9C1650;
	Wed,  4 Nov 2026 02:25:58 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B799D3F628;
	Wed,  4 Nov 2026 02:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793787961; bh=utZoELyLtysaSoiLRrID6O+IvVxEmp+/LsNWhwaKVIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DvgrQc4/2ieAj8PtYwzUIl1jjXxjiAs88cKzjbpPaYnPtPtrRW+XENEnDC0qfLEo9
	 5i0iroNo4nbycLyM0N+nyVQfc41aaWtecM1VmBaXm15mP+Lx2E61RQggFPO8RTR2yG
	 opc4JuLmsqxHbptVyexARO9IrBL82Pr7585TNv7U=
Message-ID: <3a778670-846a-4c29-bf8e-2f2e255d14ef@arm.com>
Date: Wed, 4 Nov 2026 10:25:59 +0000
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
Subject: Re: [PATCH 0/9] coresight: Fix assorted bugs reported by Sashiko
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 14:55, James Clark wrote:
> Small fixes for bugs in the CoreSight drivers that were found by
> Sashiko. Mostly reference and resource leaks on error paths, plus a
> deadlock, a missing lock, and a sysfs store that should return -EBUSY
> while a sysfs session is enabled.
> 
> This series depends on "coresight: Prevent per-thread events from
> sharing a sink" v4 [1]. That series takes coresight_mutex for perf AUX
> setup and adds coresight_release_path_locked(), which the
> etm_setup_aux() and coresight_build_path() fixes here are based on.

Please could you post these based on coresight/next ? As these are fixes
for existing issues, I can queue them (and potentially be backported for
stable) without additional dependencies ?

Cheers
Suzuki

> 
> [1]: https://lore.kernel.org/r/20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org/
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> James Clark (9):
>        coresight: cpu-debug: Fix PM usage counter leak in debug_enable_func()
>        coresight: etm4x: Remove perf symlink if config registration fails
>        coresight: etm4x: Fix truncation of nr_ext_inp
>        coresight: etm-perf: Fix sink device reference leak in etm_setup_aux()
>        coresight: syscfg: Take csdev lock when removing owned features
>        coresight: syscfg: Fix deadlock in cscfg_create_device() error path
>        coresight: Fix resource leaks on coresight_build_path() errors
>        coresight: etm3x: Don't ignore etm_parse_event_config() errors
>        coresight: etm3x: Prohibit modifying seq_curr_state while session is enabled
> 
>   drivers/hwtracing/coresight/coresight-core.c        | 6 ++++--
>   drivers/hwtracing/coresight/coresight-cpu-debug.c   | 4 ++--
>   drivers/hwtracing/coresight/coresight-etm-perf.c    | 4 ++++
>   drivers/hwtracing/coresight/coresight-etm3x-core.c  | 6 +++++-
>   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 5 +++++
>   drivers/hwtracing/coresight/coresight-etm4x-core.c  | 1 +
>   drivers/hwtracing/coresight/coresight-etm4x.h       | 2 +-
>   drivers/hwtracing/coresight/coresight-syscfg.c      | 8 +++++++-
>   8 files changed, 29 insertions(+), 7 deletions(-)
> ---
> base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
> change-id: 20261027-james-cs-sashiko-easy-fixes-1-692d80016a89
> prerequisite-message-id: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
> prerequisite-patch-id: 81acda380ba25acd3845eb58d5ded812175b9631
> prerequisite-patch-id: 430caddc9c87948d4e9a0d1967bf3d8a50bca06b
> prerequisite-patch-id: 633377150141300f7578b265fcc02eba52e592a8
> prerequisite-patch-id: 9a82ffe5d705ac1fdf1250ff6bf242cfcd9d8fbf
> prerequisite-patch-id: cf211801575d6bd0aa7fc0f6e19c3b90cea446a0
> prerequisite-patch-id: d22fee48bf4aa3e01536e4683ccd797b3dbe1c91
> prerequisite-patch-id: 55eeffb37cae55a1f47c2827899e0512b47a6efa
> prerequisite-patch-id: c542d74cd4bc76158d5872bab12b8bd7a00f0c27
> prerequisite-patch-id: 71cd37ed83d3e01d7a0321cdfa5cfc5ee113fe7b
> prerequisite-patch-id: 74c1e3ed6dba4e25bfd3c39f06d43b079eed45e1
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>

