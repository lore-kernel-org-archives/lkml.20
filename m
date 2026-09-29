Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747D36B918
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665935; cv=none; b=Tke8SgWf7LVAf2+1ZiXkF9zOoxBArf7cD2LIHMP01NTuVVIFE6Ol8RXxwfL9v2TAw1z21+42XZm8znCWEsFuvNrj0BGv8a2Vm+ldd4Xsvp/0ZYqjzhbsR1kMVNpyjz7jYp1Nw93XwXkL5Xy+MmaC6KcLRvu/5LLzKAnK7MoSXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665935; c=relaxed/simple;
	bh=u8TQO1UK8XHVE0Vqt/VlT60oO5zfpXd7X/el+fKVDdw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OUP3Ki8nbSynaWxEecLQxkeUhDyYmKR2ORiGnIsyTbSuPq1QNC3joohGVdrNqScOkTL7vQmAY0bbJSjjhFf45lpmV8phCHFgoMxV6P9meAY1TEtnAbOprPvV/N6c7pCOVbHWjcczJzUU2HWjHOCebHBCf8Fne8+xXLtQcMm1nvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdWe+GVy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdWe+GVy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2026925e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790665932; x=1791270732; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxnpfrZPnSG8Zb7d0SFA6XW6LeRwagGigYoZfwslrbM=;
        b=gdWe+GVyMrbnJ4jfPp+4CdgWZ3ISzfOP/HmxeTWiOYIce3jg8D4O3uEsXgj05XUUgC
         cGH+b226sIO5uZlGWNEyoW4PODXNWn5KiBLVwdnU3dwgBc5rapvQEf3U2oVTn7Qs+xRG
         pb733VhNwZ/LMlXGMmP8AhbczbE0N/uTLlbHq/68OA/UxikAdalmEUFLxKVbpDAb7+sD
         Hr6Teo2i404YYchHKdARwl+tZa/ibNVyLGON0tTsBpyBGnQdqAaUkdnnXfz46iuw7viA
         JaUvmE1IsvlSwb/gDpCjAhn1KChUkJlAxmlKr7hoSBEHt7qThtwKEXY8AjlnmN9TJ/ol
         BLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665932; x=1791270732;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OxnpfrZPnSG8Zb7d0SFA6XW6LeRwagGigYoZfwslrbM=;
        b=FWf7cOxKcab9QZG8yitTpkDqjM5OJuh9e53/vHAOwaOIcU5RUoxJGInuSNIkkqFWbM
         +izqtGhSYhB369GVa5lEdz5mWbJlVUEzFU8kaXsMCpa2ShshtYlkWnqc+gi40bcux8YO
         ExtlxC2Fl5K2DoXeDKeDYCxCtE5FktgzCgjWrEjTG4xI2G4i5u9kpwjkrWCOix2r3ih7
         B8RIO07f3Hh4//VIcedINlLn/08WJi+oGun9YbnAGmDZMRjRg7VEhaXYlMorwtaOFztB
         kbOH7BsWQLx82TegWxfGsvXQ92eebGtphavfDAjzstaQlJ1sX4Sm6IinV4H3LtrHnK7f
         BZQA==
X-Forwarded-Encrypted: i=1; AKwUvBwJMroHKSxTT7sRt2Sv19g071eEmEj+Q3NcUeskpdbwSYjEP8KZXR0cHJhVEb9ba5VwHSYe7Pys3TNptrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mmsm97DDkfXTfIyRgHA6ym83FhRI7oVtmoaVoR48D6GZiRHACH
	G9NReTkZId8r8PALYfB/vRnZvjG3k614eNz4CUSXQnR8YOjJGyM7+B4L
X-Gm-Gg: AYBFou3Xs6TwwXu6Jfkg4+0P4JVYolA3qg1BPBn8H0onlmehpxLAO/vbpEf+u4LVmfl
	cyamTcItEZnSu7xDYpntIZnsJx8kwcx2bl8VIjuJ2yUijLUhhs5L3ohzfKGF7kWhjuH/hHRa9iT
	3jx4ldLPHJeW2gHHkzvW89xkWDMxLIWjMO8qXpx4pVyp4GfcnbRHlN1OHkSRAdxZPGIi9ZnVWt6
	1KzqYZUAuW0FfTayeUsn1Y8N+EdmxBgvt+V0Cq0WRn9EO464DnX6YmdbafLukT5jn7gyx2xpNzp
	DAGvep6BOtZ0IqKBRmIfe+msGTBIpG/EVDRpwSaYMN8AY+aQQpcOPQUkXr80lBxxmM3kM7lYQAt
	mQ8YPeqoNqLaiGDYYdayOPqDKqcRv7kpW6B/0lIzp3PVIJlbtc0NmT9qfxXdwo4zLcSNUfBqvEm
	YF1m7kLcG7E4LfGE/HJ2McEBLLBZ5WVSkgmU/jy61gVHAhGIyR8B/R1kNmcrwTeKBQBm9cXgY2z
	LgVPfLzDq+Bdcw8QDhdU66Q4JOVOoc=
X-Received: by 2002:a05:600d:8650:20b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-4a00d75ad86mr16748835e9.4.1790665932244;
        Tue, 29 Sep 2026 00:12:12 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([141.2.113.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm52092075e9.14.2026.09.29.00.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:12:11 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: song@kernel.org, yukuai@fygo.io, chengzhihao1@huawei.com,
 magiclinan@didiglobal.com, xiao@kernel.org, agk@redhat.com,
 snitzer@kernel.org, mpatocka@redhat.com, bmarzins@redhat.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 dm-devel@lists.linux.dev
Subject: Re: [PATCH 2/2] md: add a control device for array management
In-Reply-To: <2026092927-dominion-defeat-eed0@gregkh>
References: <20260928201224.3602262-1-abd.masalkhi@gmail.com>
 <20260928201224.3602262-3-abd.masalkhi@gmail.com>
 <2026092927-dominion-defeat-eed0@gregkh>
Date: Tue, 29 Sep 2026 09:12:10 +0200
Message-ID: <m2ik3o4jlh.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Greg,

Thank you for your review.

On Tue, Sep 29, 2026 at 06:49 +0200, Greg KH wrote:
> On Mon, Sep 28, 2026 at 08:12:24PM +0000, Abd-Alrhman Masalkhi wrote:
>> Add a misc character device, /dev/md-control, with a fixed minor
>> MD_CTRL_MINOR. The control device is not tied to any md device, each
>> request specifies the array in the payload, either by name, by UUID or
>> by device number, without the need to open the md block device.
>
> Why is this a fixed number and not a dynamic one?  There should not eve
> be a need for fixed numbers anymore.
>
>> --- /dev/null
>> +++ b/drivers/md/md-ctl.c
>> @@ -0,0 +1,597 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>
> No copyright information?
>
I will add it in v2.

>> diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
>> index fa9000f68523..0bf2870dc191 100644
>> --- a/include/linux/miscdevice.h
>> +++ b/include/linux/miscdevice.h
>> @@ -71,6 +71,7 @@
>>  #define VHOST_VSOCK_MINOR	241
>>  #define EISA_EEPROM_MINOR	241
>>  #define RFKILL_MINOR		242
>> +#define MD_CTRL_MINOR		243
>
> No, please use a dynamic number instead.
>
I will use dynamic number in v2.

> thanks,
>
> greg k-h

-- 
Best Regards,
Abd-Alrhman
