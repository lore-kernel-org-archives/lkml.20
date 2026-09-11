Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A683EC82B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098283; cv=none; b=rHt7D7hwaQoSQ1nwiWQaJKn6HBUNGVF9dLQq1dYL25wL9BQOekHQtLNcjYNeaXDlnzfc6nQRcBPyPK2aQbKpNzdUP+7PdXHWitQOfkGmRgc9sdl2hn4b4osFg2mSTU9ojofkipD453NNRvyuaQ62gPQsfLXl8M7rK39/Qo7xLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098283; c=relaxed/simple;
	bh=OrlO9OhHLUo2PNU95ClVWuENwIpXA2V4LVlC2KUcF+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X0I08AdA/KVH8F+3ogYKdPDj6VLb4Uj1wvarmtPXOviqdXXD5ln+NyHwmLDL5Di7IN9cv7FBdL8Olm6QKFfWNELy28E/38/q7++c3LZuHnJzW9wZ8tdk/Ixb+4qD9XlWs3gcRfBQQBum0V46GQv5SjP5VqAbQIjoLZpzTYsMOPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UTsrvdWT; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UTsrvdWT"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso803743a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789098281; x=1789703081; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZQJJOdxTgn2EMmC/iTnd7198iii4HFKKy4Hu1QI1UA=;
        b=UTsrvdWTy8XulGS4J7gc8xVmM9GaiuWK1Qt2u5Id/Knqd4UXg/yNTJtoUzUhXmFUMY
         VHGw5evd29iOFHP+zDAUYgVxDJ6KmNmu0nFNSW94ThADSj5PiFfMBfk1/nVXpcFNfPbS
         t+bRnKNYjZoWA3Sn7uPNIG2agLuJFCYxHD1s5qDTZD97wFEVFZEnRqFP3Cv4P8C6XjKm
         Ty229FGhRq8dPeThG3fIoWB0y4k9TIYY+mIfYc1ff2tAqGU4kXuoCkBSOGAryzHUYS+/
         WdT6azSwky5NJe/FV9Fxyqxn7hssAucvsW3hyjymAw1+MSm2J7r5U+eoeik9iunQzOer
         7n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098281; x=1789703081;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZQJJOdxTgn2EMmC/iTnd7198iii4HFKKy4Hu1QI1UA=;
        b=pNwPecZN5WlX0tBVwcmBrqwv5ROq88rvhbdBj+lpL1AY6IXk/287naHxhwZL5RUwgs
         K+yIGtbGSWHSzr3gnctvVepsD9g8PLgRz+ctZRvnFywWhVu05tnmrULgwgcJ5Gq/w95A
         B+IeU5DvZrRVjNt7zgb40tCZwrL4nRCRxKYHP8gdNyQ3/kA1CipWQiZSMVLMK+sI4nEl
         uHYhOypDc0DeyrcTJRWgznIx2N2VMErL2RRIQH+UWcn8+GBmPLksbvxuC/5ZS50NLYk5
         SwP4CW0IvR3GMd0PAOu6KDHDyWH1ZKtt4jq2w1C1yqQDTtifoY9pxL4X0XF4rRFAUcpI
         vPlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0RHCMU2Fs3nLnvJhxRusGJka6gWVIlzT9qEU+OuA1cY8cLHvfVQwffK0rl3o/axvY+aoE3OlmGuur+cs=@vger.kernel.org
X-Gm-Message-State: AFuF++mBnbLo8jej/R5rXeunYGKVQW1FGLOMJ2SNVnAjr8FM9C0Uz59/
	he3vyYrP7yWOmY2wLjR6f4YjuvGbfp1HoIB6ToV15kNzOxvnc5x286VPzSw3lKsyOvMCHhwxI5w
	gOTTipbD4TRDgZgCj66apliG0qeojdg==
X-Received: from dlbbq6.prod.google.com ([2002:a05:7022:6706:b0:143:6c23:2cab])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3ccc:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39d9c1dc2a1mr3823577a91.15.1789098281252;
 Thu, 10 Sep 2026 20:44:41 -0700 (PDT)
Date: Fri, 11 Sep 2026 03:44:40 +0000
In-Reply-To: <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
X-Mailer: aerc 0.21.0
Message-ID: <DLC6ERLST1B6.6K3HLH38DQLK@google.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
From: Sam Agazaryan <samagazaryan@google.com>
To: Frank Li <Frank.li@oss.nxp.com>, Sam Agazaryan <samagazaryan@google.com>
Cc: <linux-i3c@lists.infradead.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed Sep 9, 2026 at 9:51 PM UTC, Frank Li wrote:
> On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
>> From: Vitor Soares <vitor.soares@toradex.com>
>>
>> This patch adds userspace character device support for I3C SDR private
>> transfers via /dev.
>
> Add userspace character device ...

Updated in v5.


>>
>>   - Dynamically exposes /dev/bus/i3c/<device> character devices for I3C
>>     devices when unbound from kernel drivers.
>>   - Dynamically allocates character device minor numbers using the IDA
>>     allocator.
>>   - Implements private SDR read/write transfers via I3C_IOC_PRIV_XFER ioctl
>>     with 64-bit aligned UAPI data structures.
>
> Consider PRIV for SDR, need unified HDR also,
>
> I3C_IOC_XFER
>

At this very moment the production use case we have (OCP Recovery) supports SDR mode. That being said
supporting HDR mode also makes sense.

>> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
>
> new post, should be 2026

Updated in v5.

>> +
>> +	i3cdev = kzalloc(sizeof(*i3cdev), GFP_KERNEL);
>
> kzalloc_obj()
>

Updated in v5.

>> +	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
>> +
>> +	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
>
> why force to SDR here.
>

For reads and writes we don't really have an option of passing down a struct denoting cmd mode.
Is there a different default behavior you had in mind for read/write besides SDR mode?

>> +err_out:
>> +	mutex_unlock(&i3cdev->xfer_lock);
>
> use cleanup guard()
>

Updated in v5.

>> +	for (i = 0; i < nxfers; i++) {
>> +		if (xfers[i].rnw) {
>> +			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
>> +					 data_ptrs[i], xfers[i].len))
>
> Use actual_len,
>

Updated in v5.

>> +				ret = -EFAULT;
>> +		}
>> +	}
>> +
>> +err_free_mem:
>> +	for (j = 0; j < i; j++)
>> +		kfree(data_ptrs[j]);
>> +	kfree(k_xfers);
>
>
> use clean up __free(kfree) when alloc.
>

Updated in v5.

>> +	case BUS_NOTIFY_ADD_DEVICE:
>> +	case BUS_NOTIFY_UNBOUND_DRIVER:
>> +		return i3cdev_attach(dev, NULL);
>
> Does all i3c devices attach this driver?
>

Just i3c target devices without a bound driver, the controller should not attach.
The controller itself is explicitly skipped:
        if (dev->type == &i3c_masterdev_type || dev->driver)
            return 0;

>> +struct i3c_ioc_priv_xfer {
>> +	__u64 data;
>> +	__u16 len;
>> +	__u8 rnw;
>
> In HDR mode,  rnw is command.
>

Addressing this in the final comment in this message alongside the rest of
the HDR suggestions.

>> +	__u8 pad[5];
>> +};
>> +
>> +#define I3C_PRIV_XFER_SIZE(N)	\
>> +	((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
>> +	? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
>> +
>> +#define I3C_IOC_PRIV_XFER(N)	\
>> +	_IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))
>
> I3C_IOC_SDR_XFER, support DDR, TSP, TSL future.
>
> Frank


On HDR modes - I think it makes sense to ensure the UAPI supports HDR modes now that
they're integrated into the i3c core. Would you prefer a scheme where we pass
in a more unified struct to specify either: SDR mode r/w or an HDR mode r/w
with ioctl?

Drawing inspiration from i3c_xfer:

    struct i3c_ioc_xfer {
        __u64 data;
        __u16 len;
        __u16 actual_len;
        union {
            __u8 rnw;
            __u8 cmd;
        };
        __u8 mode;
        __u8 pad[2];
    };



Thanks,
Sam
