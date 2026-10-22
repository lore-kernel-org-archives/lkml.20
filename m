Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657680;
	b=z0OpT+tkobJ1WdTtLYS7gVlUBgYVM5I9iZuqr24qeJVAx+qZGQB4cBpZyGp0yJT+CBwh
	 1fptixKxHPw5WwDLzCfqfW8w9YTzBalbhkYE7pJQTUQTRnwjMRc9GN+NBnE1b2B2INlas
	 dAIRkb74u3vODO27LTP5H5YIAnMRy4bZ21/CCfygg7i+jI9UcxwF5cJXtdc6Zdwy30uSr
	 7gOuZBLWfgv4Kf3IKmPALp82ViAzFqScdgESa/QuIKHlmZW3KBPYJzCOFm9t/aNsfddkd
	 Fakk49QLxU7dME2n63QEpEAQQCFbbTLpWM8TGsBxH6rK2yquLu9TNNoskbv+gCx9Uiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=asTQwS3Q/pIZmKtVtb/ZZcYojtRdxCAchkNTDOljnRg=;
	b=l0q3dBUapeKfKj3qmxz+qfIrXk4cRAgI1yAts5aRETD5JnwsUm4qipehK+sQmM25L3fW
	 Z2Sp6O3hK/iA4175hc4+8BwfSKRRz5TAegVNALksG6vjTc6jmeMbRMkhz9RllZWpht+XE
	 3bvMBY7ye3dT5rprV093u5+4u8zC3EHRfxsRq1v7AzWvyxCGgTjQQgiIXdPaYgNbG2sVC
	 uGZEnd5Dx2haiGBBn5zaDtKQoZSoJX8gshyb5dVOxPr/42XAFjKaWm9N7oJ9UmDSS6FIM
	 l+9Wwpf1UZuAKwqhyGgpoecvz9/XAE7Txnha2WIrKwcTXRAQXEZrE2/ZPO+zQ1co5dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="Xqn/2yUi";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C93606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C93606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Xqn/2yUi
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso20034775e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792657677; x=1793262477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asTQwS3Q/pIZmKtVtb/ZZcYojtRdxCAchkNTDOljnRg=;
        b=Xqn/2yUifSYwd1lLkvjTelhwbh1/fDxIkgCiTBzt6jpzF2b6Jtj1W+vx0Bue+MUy58
         9u42cvxmjlsJRbnQR2g3CWbj4u0rkL/k1ULnZYHkA6SYgBSLjiaJLKo7XUYZtC7tNenJ
         rsFukD01VvOvzDd3SE4W8Oqv/En+hGSOb1IleVA+BPtjYtldui+qaj/eFrGXDbDTs6Zh
         HQUgjRlg+/mxJFoLyy6ZYJH45n5kbvVwK0xr1YtKjqBE0q6RxnBXsMTT0TqpvW3YuGgS
         6xjeAh+dj5PSGSU8D18ZjCN3TeNPZns36H6lwwUccK2iJaoVhrAUeKBlAglwvy3XGzs4
         TAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657677; x=1793262477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asTQwS3Q/pIZmKtVtb/ZZcYojtRdxCAchkNTDOljnRg=;
        b=0phMfTpgPjgOLTERSgICIJdpY2JC+WQ0i2cP/BcYehOhfTpy2nCeN7ZGigoBiKx4c7
         jj6AWrgFOky3As1IHuvlptIbhcNnbVjhPI2O7crCpoXXaakSw60KQxHk9TzJ/GFL2O3B
         olaPFgJQjAGzwEiwWCE3tb+BBBFGF2PHXQ58+lSaXFI+L7qghH5J5rFX8hdn6C+FaT1R
         kKCYpDPc7LmwxXG53+YhGs6NtTqveleoICs+IzmSwgqOISDU/QigQ3smpDP4pfG1LSwi
         YjQebQ6MogHCv7RdDklYay2HOrv5VT4YGMAtG2kF39NcgxUfMfd9cyvHtCyqU9dvmpxP
         rsVw==
X-Forwarded-Encrypted: i=1; AKwUvBx7fyPxBPWbo2MEWIhXZ7Ay3xP2K7H95G6jR01FeHQeI5L4dRaJrkUVkpft2fQZuL5a6onyBqDl3wb9b20=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWh9WwBHbMuzzrXPVdvAWNzUW/AZSGA6mnO3kNTO+KjycqOSEl
	Dda0zQK604qrhv0c95bzmISBTU7ovb6MnGGsRrLc/R1ve17rDSlo1DGntV/EMz+vICc=
X-Gm-Gg: AYBFou0RqWB4gD6yYC5khW/GwfjqlGhgiqecjc+yXxINHbQPiR2rHn1b9eRI3PjFMwb
	PhYWHEEN2JM5RGli2ErQfMS0QpXBGSgBJBEgGEYfsIB+V8jTsi+5ngdirGga58YJagxRadfg0yP
	zcZtwxRtKzPM4D6tNVHYGbCI+7oC2TF86kIykwRdqnMRVOeeLiIWU9AcNMDmnHqWzW5CGLcNmJv
	aptyob5+AxZ2kqupSPvBteHoW4CGCXexyjGV4XpPBUwfhs8e/bdf94eP4tQUdxbPNimW1gdO5Wz
	Qgl3WMGN0boyAE3HQ5Xy3/mTdhYxdg7oJOTeugRaTscoF+90q6NiJ2hnpAR/WN/BaAHaX9XKYmI
	f4eF12uj2jI3FSU1osKOnJFmxsnpY4WFo/1Nv3l59TZGJxIG1U4EoVk6VCvPw8KgItDyWKp9fp0
	E6fcvg7sYmkVXE+A+ohmSTgz7qN31wC7b2li36jNgZ1YlUPu21RD9tpFGDo5pzvZGbfyyOTZu/7
	NuXv+jGwcZiL6yhPrF+gu84bSj3+SpIV/yIYmZ+pXirQf2k9aFPyq6B35Xm0hXn
X-Received: by 2002:a05:600c:524a:b0:4a2:994:5750 with SMTP id 5b1f17b1804b1-4a209945818mr14069445e9.32.1792657677030;
        Thu, 22 Oct 2026 01:27:57 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258426f4sm10865456f8f.54.2026.10.22.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:27:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:27:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <atnIDx6qmLe-geb4@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <20261021014324.58376589@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021014324.58376589@jic23-hlaptop>

Wed, Oct 21, 2026 at 02:43:24AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:38 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Add wire walking, request indexing and validated input accessors for
>> generated family readers.
>> 
>> Keep CONFIG_CTLV unwired until dispatch completes the module.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>Trivial stuff only. I didn't attempt (yet) to check
>all the walking code, just get a feeling for what was here. 
>
>
>> diff --git a/drivers/ctlv/Kconfig b/drivers/ctlv/Kconfig
>> new file mode 100644
>> index 000000000000..aed3243c55fd
>> --- /dev/null
>> +++ b/drivers/ctlv/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig CTLV
>> +	tristate "CTLV character device TLV UAPI"
>> +	help
>> +	  CTLV provides character device UAPIs described by a checked-in YAML
>> +	  specification. It owns the character device lifetime, the strict TLV
>> +	  message format, request validation, reply serialization, the large
>> +	  payloads a request describes rather than carries, per-open event
>> +	  queues and runtime schema introspection, so families only implement
>> +	  semantics.
>> +
>> +	  If you don't know what to do here, say N.
>
>I'd not say that.  Overly cautious for something we expect
>to get fairly extensive use.

Okay.


>
>
>> diff --git a/drivers/ctlv/message.c b/drivers/ctlv/message.c
>> new file mode 100644
>> index 000000000000..7e5742ba8f70
>> --- /dev/null
>> +++ b/drivers/ctlv/message.c
>
>> +
>> +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
>> +			       u32 node)
>> +{
>> +	const struct ctlv_message_input_scope *bound_scope;
>> +	const struct ctlv_message_input_nest *indexed;
>> +	u32 i;
>> +
>> +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
>> +		return false;
>> +	if (!ctlv_message_nest_index_ok(nest))
>> +		return false;
>> +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
>> +	indexed = &nest->msg->index->nests[bound_scope->nest];
>> +	for (i = 0; i < indexed->scopes_count; i++) {
>
>	for (u32 i = 0; ...

Okay.


>
>> +		u32 scope_index = indexed->first_scope + i;
>> +		const struct ctlv_message_input_scope *scope =
>> +			&nest->msg->index->scopes[scope_index];
>> +
>> +		if (scope->tree != tree || scope->node != node)
>> +			continue;
>> +		nest->tree = tree;
>> +		nest->node = node;
>> +		nest->index_nest_scope = scope_index;
>> +		return true;
>> +	}
>> +	return false;
>> +}
>
>> +
>> +void ctlv_attr_next(struct ctlv_cursor *cursor)
>> +{
>> +	const struct ctlv_message_input_slot *slot;
>> +	const struct ctlv_message_input_scope *scope;
>> +	const struct ctlv_node_schema *node;
>> +	const struct ctlv_attr *next;
>> +	u32 next_nest;
>> +	u32 next_offset;
>> +
>> +	slot = ctlv_message_cursor_index(cursor);
>> +	if (!slot || WARN_ON_ONCE(!cursor->attr))
>> +		return;
>> +	next = (const void *)((const u8 *)cursor->attr +
>> +			      ALIGN((size_t)cursor->attr->len, CTLV_ALIGNTO));
>
>kernel code is allowed to rely on void * arithmetic, so this can be
>	next = (const void *)cursor->attr +
>	       ALIGN((size_t)cursor->attr->len, CTLV_ALIGNTO);
>
>container_of() for instance makes use of sizeof(void) == 1.

Okay.


> 
>
>
>> +const void *ctlv_attr_binary(const struct ctlv_cursor *cursor, u32 *len)
>> +{
>> +	const void *value;
>> +
>> +	*len = 0;
>> +	value = ctlv_message_cursor_payload(cursor, BIT(CTLV_SCHEMA_BINARY), len);
>> +	if (!value)
>> +		*len = 0;
>
>I'd kind of have assumed that ctlv_message_cursor_payload() would not
>set len to anything if it returns NULL.  Thus the default *len = 0 would
>be intact.  From a quick look that seems to be the case making this
>code a little odd. 
>
>Perhaps overly defensive or keeping an LLM happy?
>Same applies on some other functions.

You are right. Will remove these.


>
>
>
>> +	return value;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_attr_binary, "CTLV");
>> +
>> +/*
>> + * The room is measured before anything is written, which is what leaves a
>> + * refused attr's message exactly as it was, padding included.
>> + */
>
>Having a trailing comment in a file rarely adds much or indeed
>even more rarely gets read.

True, will remove.


Thanks!

>
>
>> diff --git a/drivers/ctlv/message.h b/drivers/ctlv/message.h
