Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8E3D331E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165493; cv=none; b=TYsZLJvxOFfOz/42Lm6jbyJyiIjjUV6moImbgydiYr0zyIPW6n1d/ZJLw0V0srDuilqnNEtzphULR1NyiPsSku7bjnxBl+adQ0z6ajAF5nAogn0yCyuxJUZJy1QFQmonmn1gaBB7EuYBVIyJfPsrlBk4baoMhwixOd68Dc9oSzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165493; c=relaxed/simple;
	bh=WLtm+GBjS4mENbZdWq6ft2W9jH1OWPirkpQ5szhajHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixc7EjL59V9mFL8xCIBUkr8rOxI+UA5Y/dpezMuwWdQKmtjvnGm5HE+VmoRHU938Br7pXF4cAjKPzt1QWGK8v+V6sZecxO5dBZgXlAOF6A9kJHWuezPJIpj7vROpduQXRCjsVBJPzmx8djrqW4i0Mu+p5hj+64jlkWuNyiXdfG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtcOLTG/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtcOLTG/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3326995a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788165485; x=1788770285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wvmBjNWujEmlSCyP5EP6vmyuBGO/nrT24KCWQT1TNSQ=;
        b=AtcOLTG/e8e8yduYS9tgCC1O5Dqgq0qNkM9FL6xjE+z6VAdoOOHzBkQvXfy536lN4H
         KlOpYy8g+kAF5aMzcCYu3ATuVbOOi95u3G9MccHKVVsLEMjXdLYt3C8LpebdjTYCT0sB
         lIgaw5TAPQ0JMhrtLE7VDI5UYHqT/VMC7U2Tt813tnxF2itGXWMQ0WU8V+r12UaAG88S
         Y3NvcOXzlssbXOmpeKQydrDGPpd1oghGf+ZbkLuF5HBS0v/n9RB4dPNnybWQdYjD7Nkh
         JrMc0VzVShlD5oZw5zi5YbJj6VPCstqab7kGYXLhCSkP+RGbmURurLP7EDKNBEkFVJhF
         WTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165485; x=1788770285;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvmBjNWujEmlSCyP5EP6vmyuBGO/nrT24KCWQT1TNSQ=;
        b=eqQeSoUhmdyBFtuLHYRTaZGYQ8CegZzBn1K9SAmbSMDM2cD5pxe3n5OQxP2vqrNFh6
         hVzPT6iJYVKpIYwvdFM+5wrjJc8bj2Tmaq3CQeTAAb5rqk7plxeZooB2Vx+lOoxKGL6L
         9CDU21MoE/hZVUZji9Sm/I2iMjOPzCMCw4aG4zy8F2XgU/qUTtRoDOKwIjUBAAHik+RY
         Aq8aBlcNDFJkaMDOTLr8pvN+BFtk9tuFdSbksn3Bx/qBleEWpYuHpiyf775T8cRYdFEf
         uHy9SVmwsvpKwmhaMsQ195JQg9YbGptBIhAEQ4ooWABCLgKAQwqFzZjALdChE7lJ87aI
         /Hjw==
X-Forwarded-Encrypted: i=1; AKwUvBxc55gKulL/WDPlZrOmgFFxoISrd9BKGI5HBzEI3ewiNPApOtgodmAGIqR5GTfBAF9zIHz4othe926R/vI=@vger.kernel.org
X-Gm-Message-State: AFuF++kX95O4i30QivNXo+22WA60mk9EtpsZtriNxe/C7o1Dx8yM//G4
	fN8gLhySP1RLAs13YFi6UBqMmeOIgpD5VHNOFqFkyckmb8folKdE5QCd
X-Gm-Gg: AYBFou2WdBqxKcIBe2U8T2AlClD/3He2YozhJtVgc5099L/mHIOsquw9ETshjWr3ZRW
	IeDNUy3fOq1fK76PPcUDUUJuHpa5UTs485HB3E3aWXqy9weRQBXnWFLV0fZLi8di1tFJP8GEcQW
	rie1CjqqgbY53k5JsH2kfHZ4jeKlLTDMcpIArjEfh+2zZjAZmKQFUe/t3YdFqVyQCqr6ekC9B8v
	E0j8p5/Yhy3CPaJTDkeCHx+roEmz8V8iQObAAXCd6u7DW6mj7jjSd6pzP09Sc7AWY2lLZmFrPIu
	60KB1+x4EzFGWwxEm6TksKz1Ac+XwoUqGq/9aISgKMxxLzvmY2V7T6n9bf+/Yd+lK7d+pA+YmBW
	bzYCiQaysBlTYj9j17rFPM0AEkVz46jic6NV0nEFWxE2jVI7Pq3MIsb/bGCgiUjGmN++qU8rmiq
	+CwC8qLpjT+dCwjfKyLAWOTjeJzXaul/PxPLdfgfV8Ex4F/VW3hvrQMSKTKGo67mjyhDUohmjvJ
	AmSyCunAo4b+myawb4=
X-Received: by 2002:a17:90b:388a:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-398da8cf414mr5021997a91.15.1788165484692;
        Mon, 31 Aug 2026 01:38:04 -0700 (PDT)
Received: from [10.125.192.112] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d7853da8sm5066022a91.4.2026.08.31.01.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:38:04 -0700 (PDT)
Message-ID: <c961850c-09d0-3366-73e0-1932c1dc00e5@gmail.com>
Date: Mon, 31 Aug 2026 16:37:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2] zram: fix idle age_sec underflow in idle_store()
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, minchan@kernel.org, axboe@kernel.dk,
 bgeffon@google.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, stable@vger.kernel.org
References: <20260828083149.45760-1-jiahao.kernel@gmail.com>
 <20260828102446.3eb7f3dc779753b831e33fe6@linux-foundation.org>
 <apT-ocFYDmU6iC-j@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <apT-ocFYDmU6iC-j@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/31 12:15, Sergey Senozhatsky wrote:
> On (26/08/28 10:24), Andrew Morton wrote:
>> On Fri, 28 Aug 2026 16:31:49 +0800 Hao Jia <jiahao.kernel@gmail.com> wrote:
> [..]
>>
>> Thanks.  Sashiko asked a couple of questions about this change:
>> 	https://sashiko.dev/#/patchset/20260828083149.45760-1-jiahao.kernel@gmail.com
> 
> 
>> Does this early return prevent marking valid boot-time pages as idle?
>> When a page is accessed during the first second of system boot, its ac_time
>> would be 0.
> 
> There is no possibility for zram to hold pages during first second of
> system boot, regardless of whether zram was configured as a swap device
> or as a block device (mount-ed with real filesystem).
> 
> 
>> Can the early return above bypass this zram device initialization check?
> 
> We already do that, e.g. when kstrtouint(buf, 0, &age_sec) fails.  Apart
> from that, that's not how one checks if device was initialized.  We may
> want to consolidate those checks, just for symmetry.

Agreed on both points -- the early return is not a new "bypass", and
the write() return value was never a way to probe init state.

How about moving the init_done() check to the top, so all the early
returns sit behind the same device-state check?

static ssize_t idle_store(...)
{
    struct zram *zram = dev_to_zram(dev);
    time64_t cutoff = 0;

    guard(rwsem_read)(&zram->dev_lock);
    if (!init_done(zram))
            return -EINVAL;

    if (!sysfs_streq(buf, "all")) {
            ...
    }

    mark_idle(zram, cutoff);
    return len;
}

The read lock then also covers the parsing, but that is non-sleeping
and its cost is negligible.

Thanks,
Hao
