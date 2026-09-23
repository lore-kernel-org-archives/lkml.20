Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B912147E6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165907; cv=none; b=AbGOOCFQCVn5cf9Knx0JESQ8XP3EWho2MZ0xwC+kXDVA1zl7TnvZO2A0aZTUDGG1vZ4SuArBNeJHyCU5XGs8siv1CqzVv3rXMe95BJZxP310CLLNY6B3LuH6R5oluuIGFYChb1i2hUnTGLfChJEtISiYX0c7wG8096U462WXQ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165907; c=relaxed/simple;
	bh=5DfvD/ddgKSBVUcqi43IiThh2zCFchOr2BTMLLFDh0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5Wsq0IAvM+7/2hArrrMKSNOEL9NgxFKc4bMednKCKe5kjg7AK9ShFFhoD61tiDIzy+VXTeod4LUgrQYQmxgZMVj87AaOsqPIkL5HN0RgCb90pUQ+ESTt8DRmwOaZPlw4WLLdIEk90Vt83vw2V2P2ZJidolyhih8u246KQWsq2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a5fwrDsI; arc=none smtp.client-ip=95.215.58.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a5fwrDsI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5DfvD/ddgKSBVUcqi43IiThh2zCFchOr2BTMLLFDh0k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790165902; v=1; x=1790770702;
 b=a5fwrDsIbEMSYVm5yy/5sq3CviCeYBUfIMWSqMiVpU6gHWrpi+/rQXiaRe7Z61dA1LCzCvBc
 VEJZYT5y5cDjmbwatSy8xgGi1AtbpWXjrtLg6G49ZW+lsX+LMKBtZ7YsB7kdMVU2BDq3TER6p0y
 aKn5KZzgz7W4F//b+geR3RQw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d7396f17ddaeb9a7;
	Wed, 23 Sep 2026 12:18:20 +0000
X-Mizu-Trace-ID: d7396f17ddaeb9a7
X-Migadu-Flow: FLOW_OUT
Message-ID: <7fd63887-9312-41ee-9956-65843eb3ca60@linux.dev>
Date: Wed, 23 Sep 2026 14:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
To: Hans de Goede <hansg@kernel.org>, chipang_kao <prozac2734@gmail.com>,
 W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, scardracs@disroot.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202609221954.123456@gmx.de>
 <20260923082923.154732-1-chipang_kao@asus.com>
 <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/23/26 10:42, Hans de Goede wrote:
> Hi,
>
> On 23-Sep-26 10:29, chipang_kao wrote:
>> Hi Armin, Hans, and all,
>>
>> Thank you for the feedback, Armin!
>>
>> I completely agree that separating WMI core infrastructure from WMI client
>> drivers makes logical sense. The reason v3 relocated the drivers to
>> drivers/platform/wmi/asus/ was based on Hans's earlier suggestion to use the
>> WMI subsystem hierarchy. However, Armin's point about keeping client drivers in
>> a brand-specific directory like drivers/platform/asus/ also provides a very
>> clean, cross-architecture solution for all ASUS platform drivers.
>>
>> Regarding the background: yes, the RTX Spark is indeed our target platform.
>> ASUS plans to provide user-space applications on Ubuntu to control platform
>> features via the WMI interface. During our bring-up on ARM64, we found that no
>> ASUS WMI modules were currently available for this architecture due to the
>> existing x86 Kconfig restriction. This patch series aims to enable
>> cross-architecture WMI support to address this gap.
>>
>> I am happy to go with either path (wmi/asus/ vs. platform/asus/). Hans, Armin,
>> what would be the preferred target directory before I prepare [PATCH v4]?
> If I understand things correctly then Armin prefers drivers/platform/asus
> that is completely fine with me, so lets go with drivers/platform/asus .

Hi Hans,

Yeah it's my understanding that drivers/platform/asus is the only path
that so far nobody has stated any reason to exclude so I agree on moving
asus-related stuff there.

> Having that will also be useful to share any platform specific drivers
> which directly use ACPI calls rather then WMI.
>
> E.g. I can see a drivers/platform/lenovo show up to use thinkpad_acpi
> on ThinkPad ARM64 laptops.
>
> Regards,
>
> Hans
>
>
>
Best regards,
Denis
