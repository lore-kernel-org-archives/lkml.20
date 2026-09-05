Received: from mta0.migadu.com (out-191.mta0.migadu.com [91.218.175.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EBB2DCF57
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619753; cv=none; b=IEdEEHzZRm+xNxoVTcSuZE/gOxvMgQY7EDrgYSOQET8URjCfJpSCzj1WRirt4Hxddo+2zP45Dmj5PBjT99GVc6POe3FJ297gKiOu/roxTU0DzvtPmp3QLJUG3S/YpvXv5/pE9a/b+uTObPewZ2v20PHJLhjC94L0PLRqZhUgVPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619753; c=relaxed/simple;
	bh=KMsll9iQFNSUTrh8N8anWA8Wgq6/rLAsmD1HO/f5UgQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s751uQRryv11mtmg2p49aMANHNrczIFjR4JC+mt6qt6Az2MuHaa1GTdqO/iwrl5VAJmp/YHCX/NO96VFQsc/3e/PXHXbIFd6YkGhq0YCPlyCK9YAJpGvCeVpL6qtDzNJb0Upvs/geJXH+U0A/WU323r0FrXBLEgdlJ/4UpZWXCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uBmVbLWe; arc=none smtp.client-ip=91.218.175.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uBmVbLWe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KMsll9iQFNSUTrh8N8anWA8Wgq6/rLAsmD1HO/f5UgQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788619749; v=1; x=1789224549;
 b=uBmVbLWe/5txyaDoDcflcAEEJ+fSLugFVOUZBlEYI7gcsaee3Gl2CDR8jQTm/99JWjYy40sS
 ytxqo3o2zcB2uWv9u45NhsBkH8+/v76EzyEf7SKtPiQVkvLQ0EaGuvyLGb/Jm+8/Pi7XALh1V6w
 b33tQBqZi03gtO4Be3L5vIUU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c050fd726f4a85f9;
	Sat, 05 Sep 2026 14:49:09 +0000
X-Mizu-Trace-ID: c050fd726f4a85f9
X-Migadu-Flow: FLOW_OUT
Message-ID: <cf9ff462-1a77-44c7-92fd-2b11518aeb69@linux.dev>
Date: Sat, 5 Sep 2026 20:19:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] HID: appletb-kbd: support layer switching on Fn double
 press
From: Aditya Garg <aditya.garg@linux.dev>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Linux Input Mailing List <linux-input@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andre Eikmeyer <dev@deq.rocks>
References: <20260905143733.17819-1-aditya.garg@linux.dev>
Content-Language: en-US
In-Reply-To: <20260905143733.17819-1-aditya.garg@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 8:07 PM, Aditya Garg wrote:
> Holding Fn temporarily switches the Touch Bar between media controls and
> function keys. Users who want to keep the alternate layer currently need
> to change the mode through sysfs.
> 
> An optional double_press_switch_time module parameter makes a double press
> persistently switch the default layer. Its value specifies the double-press
> interval in milliseconds, while zero leaves the behavior disabled.
> 
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
> Changes in v2:
> - Added a check to ensure negative fn switch times are ignored.
> 
> Changes in v3:
> - Renamed the backing variable to match the module parameter.
> - Fixed the reported code style issues.
> 
> Changes in v4:
> - Added missing "break;" in case statements.
> - Change author's email to aditya.garg@linux.dev

Now that I see it, the case statements were ending in return. break was not needed. Sorry for the brainfart.
