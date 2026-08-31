Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8E3DCDA9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180029; cv=none; b=IPuKDXi+Yz9Pj3eOdC5B7t6Ssl7wacIho5oH+w3Y3+1HsYMXH4grpJ/RvqrGeEhLrXQqyMEq3v5jKg1ugUEMJeq7YTy+qu4LPs9LEEJuFRFQDX/tLItLfTPo3uYdMyjY1WnoGu78LWb7KlhrQMMOWh8vpKA4lKk3jE0w9nA9M3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180029; c=relaxed/simple;
	bh=S8dZjeqOYV4ek91I2r4Qov9/LVvEEgQMX8OjggbeLCI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M20VlCoADERqRvKVqbATCWEYJ7rIWTSjJH+WNbs34RpQL/X8otIm7CDBT3yRjpQNHzBh+wiZZqMHTVURAsFpMyoLu63mLEj9IVqTbg9VWLIkLrzZBmJBSNaVBNGjUzkXYX0+r0cCk/qgInE1nkxEjSNCxKA/ON5wzLSTfiHYbLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmTHClyx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmTHClyx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so36211375e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180026; x=1788784826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2wnfH7b7KKmDiXtn7bM9cfVe5VuHQ+7bwoAdYTm8PAY=;
        b=hmTHClyxhl3g8IIP1y/KOI/t2FGA9hqsQcFIt3fS906aTCmPhS2X20H50m/EAlfmuv
         QMlaQGlD2bc2o1KoqHwgKuYGpNTtMTjHZWvmsMt26Ill2vUOgBN/wUw5FWhpgIdsCl+y
         +Dtf2Ei25rq4fInbiCwaqDojk2NLR+Tq8KS5/VLHqI3MH1w0RpiAyfZvKfmBqAXwIgAr
         fioZsY/knH1c8Sxx8RWSOQhcPo3CZl29hrYm4j8VoLmgz4WSNcsX8I8P/HbhQdLtJZUb
         Eg09ihGctnA4vRnwvFQ1zc6DfR82F2ptH6Kzg31hKGg4bSBtveukBd7fnNWx87bId1tQ
         Cz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180026; x=1788784826;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wnfH7b7KKmDiXtn7bM9cfVe5VuHQ+7bwoAdYTm8PAY=;
        b=SaRzfNLbqz6t2Z8r+q8TtOUWaQ/7lhUVw3A37/XRJUsS+pD8donJVVzfFwIpOJWDHQ
         A1dfea9Zy95YxD4qolrjyKNeUNle/v8Um3w+oKI8TwCj1JTJezvycWOZpwcnnkTN0Kh/
         Te10h/X8IST1kpBmSlMrMysf4KWPgS5mT45NZgwjKKnfdmuljnuJ411N0NMYwwUA5G/c
         ZSRIv2m+5GlqnwU8eIgLQM+rVOnYRZq92I1ijHNwTQBFwneFRk+4reC+yy0jw9rj3ftx
         X9nEedscIQ63eRajPkP0RyJ1XcCLJq7P89JuIqfR6PEBpZEDxtKr+n8HY01VCA4qCHnr
         2hjA==
X-Forwarded-Encrypted: i=1; AHgh+RqVaGC2FWB4jKWfXO/iSM8cl5s4y3KyLg+iyDgTxiBEG5uL+7ttqh00RLQVRLfyp9PqQtwjfebJH8EAceY=@vger.kernel.org
X-Gm-Message-State: AFuF++njDLUEbqXkPpBZIJ0C+68XyqCADebWKo3yCnXVYN5RHjclIxQ7
	8iXnCUQo6ysyY30TP1a2Qf5K8xavZvarfLq/ttrP0RxvQc5dhAyvCo1h
X-Gm-Gg: AR+sD106+2oZIIFcwZ49+zK40/oSdifm58Sjb1L0KIeJp5HEcrlzQMdqLcQABLAFHaB
	C7kvNVpIaCvu9cNUxwquRT+JePxgjK0EAPnNSdui6Gabj9oh03Vudutnsi4eE62LTxr9BsQ32Tk
	gqjuJJ3nUCwi/atUnwf8Xm2O2zEd0+mhQ9SaZGW5vY7eq+VlBMRW34dqvwaacmyxGwaTOq4RmI4
	MWadqDaW3BYYwO1a3foJjx2c/8C8APGYUZB66jMmoLNs55hum+P49C4jnzSH4lNcng6Zv/250yF
	Pp3WqmOnQTX2uSreb+6n4LGAPUcWTVmIgV0epq7hO/CCwa4nD+K5OmQ+qcyX70b4eEvLr2ZQhV2
	IaNzUSrzIFJJVy4gQVKj5omj9HMwwBJjFIRkBgEBctf0GWJoTbxj32OSwvEfzScY5C6bHhd8p9S
	CGYQdhOYk4GuXzKB7MMyEKf6kpqgEZIW1srXm/b3I2wmd5imMwnL8KqBpMcBvEHA5c3lEY4K4hx
	I8FRSY4lRgtAkE+VWtVy1Qp1A==
X-Received: by 2002:a05:600c:8011:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-49cdc5660bamr4232645e9.12.1788180025820;
        Mon, 31 Aug 2026 05:40:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm338783295e9.8.2026.08.31.05.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:40:25 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:40:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 kys@microsoft.com, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
 <longli@microsoft.com>, linux-input@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: hyperv: add KUnit coverage for device info
 bounds
Message-ID: <20260831134023.7784374a@pumpkin>
In-Reply-To: <20260710022854.3739558-3-michael.bommarito@gmail.com>
References: <20260710022854.3739558-1-michael.bommarito@gmail.com>
	<20260710022854.3739558-3-michael.bommarito@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  9 Jul 2026 22:28:54 -0400
Michael Bommarito <michael.bommarito@gmail.com> wrote:

> Add KUnit coverage for Hyper-V synthetic HID initial device-info parsing.
> The tests cover zero bLength, a valid descriptor plus report descriptor,
> and a malformed report descriptor length that exceeds the received
> message.
> 
> The same-translation-unit test uses a KUnit-only ACK bypass so parser
> coverage does not require a live VMBus channel.

Breaks build - see below.

> 
> Assisted-by: Codex:gpt-5-5-xhigh
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> ---
>  drivers/hid/Kconfig      |  10 ++++
>  drivers/hid/hid-hyperv.c | 117 ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 120 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index c1d9f7c6a5f23..41ca48d9adc9e 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1183,6 +1183,16 @@ config HID_HYPERV_MOUSE
>  	help
>  	Select this option to enable the Hyper-V mouse driver.
>  
> +config HID_HYPERV_MOUSE_KUNIT_TEST
> +	bool "KUnit tests for Hyper-V mouse driver" if !KUNIT_ALL_TESTS
> +	depends on KUNIT && HID_HYPERV_MOUSE
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Builds unit tests for the Hyper-V synthetic HID driver.
> +	  These tests exercise the initial device-info parser with
> +	  malformed host-provided HID descriptors and are only useful
> +	  for kernel developers running KUnit.
> +
>  config HID_SMARTJOYPLUS
>  	tristate "SmartJoy PLUS PS2/USB adapter support"
>  	help
> diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
> index fd90196430e29..6579bd19da13a 100644
> --- a/drivers/hid/hid-hyperv.c
> +++ b/drivers/hid/hid-hyperv.c
> @@ -13,6 +13,9 @@
>  #include <linux/hiddev.h>
>  #include <linux/hyperv.h>
>  
> +#if IS_ENABLED(CONFIG_HID_HYPERV_MOUSE_KUNIT_TEST)
> +#include <kunit/test.h>
> +#endif
>  
>  struct hv_input_dev_info {
>  	unsigned int size;
> @@ -240,13 +243,18 @@ static void mousevsc_on_receive_device_info(struct mousevsc_dev *input_device,
>  	ack.ack.header.size = 1;
>  	ack.ack.reserved = 0;
>  
> -	ret = vmbus_sendpacket(input_device->device->channel,
> -			&ack,
> -			sizeof(struct pipe_prt_msg) +
> -			sizeof(struct synthhid_device_info_ack),
> -			(unsigned long)&ack,
> -			VM_PKT_DATA_INBAND,
> -			VMBUS_DATA_PACKET_FLAG_COMPLETION_REQUESTED);
> +	if (IS_ENABLED(CONFIG_HID_HYPERV_MOUSE_KUNIT_TEST) &&
> +	    !input_device->device) {
> +		ret = 0;
> +	} else {
> +		ret = vmbus_sendpacket(input_device->device->channel,
> +				       &ack,
> +				       sizeof(struct pipe_prt_msg) +
> +				       sizeof(struct synthhid_device_info_ack),
> +				       (unsigned long)&ack,
> +				       VM_PKT_DATA_INBAND,
> +				       VMBUS_DATA_PACKET_FLAG_COMPLETION_REQUESTED);
> +	}
>  
>  	if (!ret)
>  		input_device->dev_info_status = 0;
> @@ -635,5 +643,100 @@ static void __exit mousevsc_exit(void)
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Microsoft Hyper-V Synthetic HID Driver");
>  
> +#if IS_ENABLED(CONFIG_HID_HYPERV_MOUSE_KUNIT_TEST)
> +static struct mousevsc_dev *mousevsc_kunit_alloc_dev(struct kunit *test)
> +{
> +	struct mousevsc_dev *input_dev;
> +
> +	input_dev = kunit_kzalloc(test, sizeof(*input_dev), GFP_KERNEL);
> +	if (!input_dev)
> +		return NULL;
> +
> +	init_completion(&input_dev->wait_event);
> +
> +	return input_dev;
> +}
> +
> +static void mousevsc_device_info_zero_blength(struct kunit *test)
> +{
> +	struct synthhid_device_info *info;
> +	struct mousevsc_dev *input_dev;
> +
> +	input_dev = mousevsc_kunit_alloc_dev(test);
> +	KUNIT_ASSERT_NOT_NULL(test, input_dev);
> +	info = kunit_kzalloc(test, sizeof(*info), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, info);
> +
> +	info->hid_descriptor.bLength = 0;
> +
> +	mousevsc_on_receive_device_info(input_dev, info, sizeof(*info));
> +
> +	KUNIT_EXPECT_EQ(test, input_dev->dev_info_status, -ENOMEM);
> +}
> +
> +static void mousevsc_device_info_valid_descriptor(struct kunit *test)
> +{
> +	struct synthhid_device_info *info;
> +	struct mousevsc_dev *input_dev;
> +	u8 *report;
> +
> +	input_dev = mousevsc_kunit_alloc_dev(test);
> +	KUNIT_ASSERT_NOT_NULL(test, input_dev);
> +	info = kunit_kzalloc(test, sizeof(*info) + 4, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, info);
> +
> +	info->hid_descriptor.bLength = sizeof(struct hid_descriptor);
> +	info->hid_descriptor.rpt_desc.wDescriptorLength = cpu_to_le16(4);
> +	report = ((u8 *)&info->hid_descriptor) + info->hid_descriptor.bLength;
> +	memset(report, 0x42, 4);

This has landed in rc1 and fails to build (with gcc 12.2) because the tests
in fortify-string.h detect that is it writing beyond the end of the
structure.

> +
> +	mousevsc_on_receive_device_info(input_dev, info, sizeof(*info) + 4);
> +
> +	KUNIT_EXPECT_EQ(test, input_dev->dev_info_status, 0);
> +	KUNIT_EXPECT_EQ(test, input_dev->report_desc_size, 4);
> +	KUNIT_EXPECT_MEMEQ(test, input_dev->report_desc, report, 4);
> +
> +	kfree(input_dev->hid_desc);
> +	kfree(input_dev->report_desc);
> +}
> +
> +static void mousevsc_device_info_report_desc_oob(struct kunit *test)
> +{
> +	struct synthhid_device_info *info;
> +	struct mousevsc_dev *input_dev;
> +	u8 *report;
> +
> +	input_dev = mousevsc_kunit_alloc_dev(test);
> +	KUNIT_ASSERT_NOT_NULL(test, input_dev);
> +	info = kunit_kzalloc(test, sizeof(*info) + 8, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, info);
> +
> +	info->hid_descriptor.bLength = sizeof(struct hid_descriptor);
> +	info->hid_descriptor.rpt_desc.wDescriptorLength = cpu_to_le16(64);
> +	report = ((u8 *)&info->hid_descriptor) + info->hid_descriptor.bLength;
> +	memset(report, 0x42, 8);

Same here.

David

> +
> +	mousevsc_on_receive_device_info(input_dev, info, sizeof(*info) + 8);
> +
> +	KUNIT_EXPECT_EQ(test, input_dev->dev_info_status, -EINVAL);
> +
> +	kfree(input_dev->hid_desc);
> +}
> +
> +static struct kunit_case mousevsc_test_cases[] = {
> +	KUNIT_CASE(mousevsc_device_info_zero_blength),
> +	KUNIT_CASE(mousevsc_device_info_valid_descriptor),
> +	KUNIT_CASE(mousevsc_device_info_report_desc_oob),
> +	{}
> +};
> +
> +static struct kunit_suite mousevsc_test_suite = {
> +	.name = "hid_hyperv_mouse",
> +	.test_cases = mousevsc_test_cases,
> +};
> +
> +kunit_test_suite(mousevsc_test_suite);
> +#endif
> +
>  module_init(mousevsc_init);
>  module_exit(mousevsc_exit);

