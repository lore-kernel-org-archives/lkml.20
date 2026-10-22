Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694597;
	b=4J7XfuL4xO+WrSoSAX37xBI/2Yw8oqASVzMXBcbCJeiJUbnXKWcjA1FhHoIvDnjX/I4N
	 vUni89nigAZFtOc5sYUcn3ECbOCAy3OXrVnQR3gFfn8C8lE9Z6E8fTCJpwYr5TKrDaz7S
	 x+ZcHpJGRG79QP+wqIyGqMs4O8eeSO+uwhd7BNc+IcHFIxoE9OkV/kfmqgyBWQYhbl2bR
	 Av4GvQaxiXnXXoJnseMjgbGtwnzjAgiglITkrRS1twLgPvsloE6/5KuIUBjzTkJIXqA3p
	 ejqR7Lyi0LSkuqXAwvfGiNRhIWixy13XRm9BE9YJTwnxaBAaGHplc/GXtVKdnx74zUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
	b=aV1ms93/q4Qd+RN5tCEO4UwQG64w7esMSwa5sY6KM/FrwKYTmFJ4+GJryE+A3a4EPUKi
	 zDVb7oewP3VXuKhFLWmmu7QUl6VdRENO4mPUcNMVpcA6EUV9wvnI0om5AtLLuy9d7OMje
	 ilGUgwduMViVi3ytUcr8ljNyfbECovLOUkrO84tu+eBz9UzTG2+fGFBE6yqcTjI1gPX3N
	 kC08SJFt8D1xH2wd2dgoxUVIVP2ZrQ3TucfEkwOv1+WVzdijyHEDJNKFRMTtbud6blaDN
	 27NQNVjeX53gzoRcAA4pmvP6ZdjUxy9KbSbqkYANiXE0kdfAoRJEJE5GQA+KKS67oKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nKJi93LP;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687C7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nKJi93LP
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c11468b5fso2362136d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792694596; x=1793299396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
        b=nKJi93LPc48Esxvohip1vSyHieBUQORNbKUhASwH832yq8/YpN7cupzfybrDxNZpwb
         9Tux6bXq8BPZTnJ0xrIE2ypof5Mq+DgTPuRBxYrlMvJ7pvPttb4ErfUwG25/5mEAyvsX
         3i5SsTcaAThuto3P5oLgORukoVh/lCAgW8PXZT/kpbMhDVHYC+YqWMZDs5Zjv3eKswZN
         T9PVuV+Y/yAla5vrjn+/dQ4k8GDIinY/XCI/+tg5+RonRfWg2hghEjHgY8otLDvEhcBs
         2eFakYN6BWX9BHluQ2GWKp7JHXTFhcYL1XE2jxLpRChT+kYtkIuSe2t5mEbD2G1YBghp
         1nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694596; x=1793299396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
        b=oVgsP2CaCAfjRAQLfoj8Lfm3JUWK1Ipn6dU6VRp9hM4kg8d7ffoBfz4hswRDXojpRQ
         eL0iNM3Xaw8tvnT+AiMyOux56D7nGhzysD15NPG1qR05k/2D5NkyIRygVQO2mtnBCu2r
         LMtKvuWMZGM49Q67Y467MOQ17EihTuJ31oQwEOUkBZ0fhhkPnfoPupKhwskCrsbS35KD
         rLol/o8KZEJzmjM9RTqS9nC873TTGW+ultFnI2rhigqnCjWVwiaE1JKSkpfZ8ckJpXEz
         lH0EKPG+lwNpaIis696B+A9N9AqOw+ZgIDVkCp/nFrwihWyQLkzE4Jt+AY2cvzTZvk60
         y8tA==
X-Forwarded-Encrypted: i=1; AKwUvBxNWAmhj5vI4IOVi530zfAsceJIrqdhj9mV1PrD78PVbqr4sWPCFHZCb1aWkyYaCzeikWyv3/ESBQFqa8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeIgscQ1YwWOSTre09x/DBzCU6HbQ3BQgyDqnaIRwtG3DNk7pd
	qXQr1+7JD8b1fwptSQWInlpQpCYY++7d9MVX5gPu2Zm78ufrVOD4K4Ojb07N31o7CaI=
X-Gm-Gg: AYBFou1+qEQN6x6b4Jactud7FqYHgwF18uJLIjmytfSYjOClUD2oVEHHDHY4gPSywx0
	Z40psG1bO6hDKn0KPD104SHot4LjlI5jwVP1A3ZBYb1fsiFzYJXtVtS0kCgG0sFcSaoOD/fvjc7
	buQ0Od52VWMbWceVt4rnu9T0NN2RZBivk8vrP75eQF0T+TzlBS62ZmvoFJSh8E0S79s0luI6Juy
	TVeYlke7Eg5ISNGA+NtBy6yBmrRlMsvJ/itKdvCDNHY9w1hWWqvfMdLzaMPucSUjwWQoUWbmw8X
	N0jRC5CywB+zrmQQpCsw+DSlE4EYQPschEwznu3sfZiwDghg4lmZMz1tgaEMz0J/aDcZ+wOI2ZP
	kZBA8kelhE7B1pSiwoP4eXunk3WKMYZ8JOGKf03TQSVqAAYsmQdW42dSpBcE5qt6HtYWYtpa+sm
	46aNDMqSAvvGQmL45tcglYj4JpXpQA4zGzMfLqr80/Y8Xnk7k/g9aZ1s8AaOFBkxmEyH+kt5+H7
	utJom6/l70XuOYM7lCdoERAH5CZSDg79dE0FWLy3KQItqhdS5/KaqAMUVOOVGmABmgEFYwOhXz8
	F+oXspWWmfa00L1VZZNwywepbcBr+xP6rbYypA==
X-Received: by 2002:ad4:4ee5:0:b0:91b:8b44:d4c7 with SMTP id 6a1803df08f44-91c12ee2dc3mr106716916d6.26.1792694596058;
        Thu, 22 Oct 2026 11:43:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c37060bb5sm4070256d6.24.2026.10.22.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:43:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJxkv-0000000FjQ8-3dAv;
	Thu, 22 Oct 2026 15:43:13 -0300
Date: Thu, 22 Oct 2026 15:43:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <20261022184313.GD3381610@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
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
In-Reply-To: <20261021022505.6fe1b1bb@jic23-hlaptop>

On Wed, Oct 21, 2026 at 02:25:05AM +0100, Jonathan Cameron wrote:
> > +struct ctlv_device *ctlv_create(struct device *parent_dev, const struct ctlv_family *family,
> > +				const void *init_info)
> > +{
> > +	struct ctlv_device *ctlvdev;
> > +	int devnum, ret;
> > +
> > +	if (!parent_dev || !family)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	ctlvdev = kzalloc_obj(*ctlvdev, GFP_KERNEL);
> > +	if (!ctlvdev)
> > +		return ERR_PTR(-ENOMEM);
> > +	ctlvdev->family = family;
> > +	init_rwsem(&ctlvdev->registration_lock);
> > +	spin_lock_init(&ctlvdev->transition_lock);
> > +	ctlv_event_device_init(ctlvdev);
> > +
> > +	/* Before anything reads the schema through this device. */
> > +	ret = ctlv_op_resolution_init(ctlvdev, family);
> > +	if (ret)
> > +		goto err_free;
> > +	/* What this family's events need of every queue opened on it. */
> > +	ret = ctlv_event_sizes(ctlvdev);
> > +	if (ret)
> > +		goto err_free;
> > +	/* Before a minor is spent on a device that could not be announced. */
> > +	ret = ctlv_device_uevent_check(family);
> > +	if (ret)
> > +		goto err_free;
> > +	if (ctlvdev->dynamic_ops_count) {
> > +		ctlvdev->disabled = bitmap_zalloc(ctlvdev->dynamic_ops_count, GFP_KERNEL);
> > +		if (!ctlvdev->disabled) {
> > +			ret = -ENOMEM;
> > +			goto err_free;
> > +		}
> > +	}
> > +	devnum = ida_alloc_max(&ctlv_device_ids, CTLV_MAX_DEVICES - 1, GFP_KERNEL);
> > +	if (devnum < 0) {
> > +		ret = devnum;
> > +		goto err_free;
> > +	}
> > +
> > +	ctlvdev->dev.devt = ctlv_device_number + devnum;
> > +	ctlvdev->dev.class = &ctlv_device_class;
> > +	ctlvdev->dev.parent = parent_dev;
> > +	device_initialize(&ctlvdev->dev);
> > +	/*
> > +	 * The core owns the file operations, so an open holds the core module
> > +	 * and not the family's, which may unload while readers remain.
> > +	 */
> > +	cdev_init(&ctlvdev->cdev, &ctlv_file_operations);
> > +	ctlvdev->cdev.owner = THIS_MODULE;
> > +
> > +	ret = dev_set_name(&ctlvdev->dev, "ctlv%d", devnum);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_claim_add(family->schema);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_privs_pre_init(ctlvdev, init_info);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_privs_init(ctlvdev);
> > +	if (ret)
> > +		goto err_put;
> > +	ctlv_op_publish_all(ctlvdev);
> > +	ctlv_event_contexts_start(ctlvdev);
> > +	ret = ctlv_family_privs_post_init(ctlvdev);
> > +	if (ret)
> > +		goto err_fini;
> > +	scoped_guard(rwsem_write, &ctlvdev->registration_lock) {
> > +		ret = ctlv_device_add(ctlvdev);
> > +		if (!ret)
> > +			ctlvdev->registered = true;
> > +	}
> > +	if (ret)
> > +		goto err_fini;
> > +	return ctlvdev;
> > +
> > +err_fini:
> > +	ctlv_device_fini(ctlvdev);
> > +err_put:
> > +	put_device(&ctlvdev->dev);
> > +	return ERR_PTR(ret);
> 
> Jason did some nice handling in the fwctl stuff for
> device alloc and hand over after device_initialize()
> (I've copied it into a few places recently :)
> 
> I'd like to see something similar here as it made
> it easier to follow lifetimes etc.

This is really at the wrong layer.. Attestation subsystem is the lead
subsystem, it should be allocating the struct device memory and the
driver should see the typical

  struct attestation_dev *adev;

  adev = attestation_alloc()
  [..]
  attestation_register(adev)

Sequence in its probe function

We need the subsystem refcounted memory to exist if we are ever going
to create a kapi and common functions

Jason
