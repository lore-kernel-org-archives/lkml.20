Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499225;
	b=wKwA4KKGR4q4QKO19d7mvuuPI3ET1cc3Lq+KnG26fN63dI1eFwxmsfJ64yOQZacpuiEI
	 b1ThFc4q96ePjMVf4BoRIOvXWwrzk0z2xb+zFfryN6mE7hkg1MkcpAsco5F/M8ISkRRc1
	 ubmujQJnR+1Z2nFTaSAO5qI2yjF0451Q5BOUhSCd8Go3ZcHqThdvix/hRv1/W48Yyu4HF
	 3QgGvBclbT6MCMLkX8W8C+mHsnSx+LRkyC4I+SODWCboOoedSmbW16z/mGlfkaRMeutuI
	 qUpo2czzafgkmD63jVqgJ4MSp0l5KiGTm1I7LARdJ5Ccg/v3zeDZG9hlkyKER7NyTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r+JXJ7/RizMzNWpQZbCi3pXUDD6ZYso7OnyQ+kdiZlM=;
	b=AttoYIXlkn02B69q7rsGezMWItKVAtNww0Si+rjnp2NP94ja9+xouksvG/r+bGdcsHG0
	 y5iIuBFLh42xoNwytaGpFl3GLmvQb9OsL+SK8rZnKC8blWoi4KgW6ii6CeJIgRkzs7WRZ
	 48tiGY0omM5CUTBO7cPir3V2pJPUruu+Zje8iMEx+LruuDwp7VtTnsmNMJ5AO+VZtnxgO
	 DIDkc6pmROxQarSILXQgb9JfkHp0TryNMmYNNEcinhWqguYTAD/TLpt7chkMf7WgOutN5
	 Htc9P56mdrUiGJBBVTDEFbsoNuUgp26zX8y/dOGWNZUMA+TsHo/VCpjiAmJHcbbC74w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hFWwiKZY;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD3606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66AD3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hFWwiKZY
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so18774855e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792499217; x=1793104017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+JXJ7/RizMzNWpQZbCi3pXUDD6ZYso7OnyQ+kdiZlM=;
        b=hFWwiKZYM9mL6E9PjvXPJ3WGnS6fCoA5M4DIXCiZ7QxzFi2/LcC4qvf+KiToBx11vf
         GRItbzTNaPMrrqtIFRswHSZ98neyu90Uq5IfSu4sQ36KzvEhbpjmB1UwNwd7qYf4BWxN
         bDz3iEsnC7hCleu9A1kqlb5Rzg4kdPeLjcGlV31/IXxUBLh7w3J02q1/tfvUIz81uOS/
         UEM6+101n2rlxfRua/iUXIXttcSlcn3JJy+8PQ0VU6ITRl8uQjt14rR220smlHCvOj+l
         C6Q2+TncSYuWzfBvITAgECC4jVu0YXsBeECg75adzeCZE0pz4lYpLhgty1FCkfWqLh1e
         sotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499217; x=1793104017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+JXJ7/RizMzNWpQZbCi3pXUDD6ZYso7OnyQ+kdiZlM=;
        b=Q5JQcnneL1YCNRkMSD+pD0qvmN46n5IXdOgUd6Et2u93JkrFjDiL43RNV3tRRUpDeK
         pjpCsHS+C2xevLOa/Sxw9B7XGf64Hw2FZTGh3Z89vL2bbdxZxk39YHHEI/sdoGxkhrSS
         hnxn13lHR1693ZY/u85oijZJeSI4DAAdZlhmBDioGQZEAmxN0ZpSRrQrDNcwC417/w0J
         ipg8pPNSG2nDl4Jg7NLm1gYcZ1mt0DL6YutWqhUuE9glBrk/onpDiK++c7HZczO2AzBS
         DRk5VJ6ezKKd9idWPjVbBHlB25UQE6AIbrSL1W2F5L1svv3rWJuuwrh4h0SB+f0bgVyD
         2Hug==
X-Forwarded-Encrypted: i=1; AKwUvBy6MD2WJaPGtE553eBL2jwkvm5418nsGCLr/KIxppF1aI2MHnIL4o3slpkaQHuduBAUJ+DEl6qqgK0Fvgk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOgodNL3DC1DGZaSpUdhJ5H0j7/x7UwPcTrVrOUIghREng+tP2
	Sq2TedscLOM88MlZEk//j9XoZus7cUFadVLWCSsa4/ovRmJVQRVzIFle1cslnaTA554=
X-Gm-Gg: AYBFou25FkwPyJtqQw9L6Gn67Sx9qnXDCMUSPmJuzuGRH7jq41yYkCsuEJspZJvDDqW
	kTjfENTnCMIQnIYR8XwrA4GzHveZ8V78cbFmGXHSLbSihg0Z6kNMxytVnvu7loCEY2Hkk0Wy30x
	FMh6YtvtDLdXHqQpk0ktvRY6VtTT5zjUqq30KD6pBKPb1hKr/RYGVWX0kQg0mcXRDOWLSv6fA9v
	jv539L+gjfLfcMCN6NqzTueWA9yELEwQBHo3lHOLajkgabpGHdQ/VlxqAKS5kEiQzOeUSAVnhIG
	3bM/mN2u2G4tkReX+rkK2aG8mozgB5akKsTh1zpda0Rn0g+wioIkjOratkyHwI9GJMPrjlbxvMK
	IrqrcTaClRnhsTvjYo3X2Vap7rMIL6v/oYF1eGi42PdjaCgcChcMCt+0bpae9BIHtPaobgwA6BQ
	+VOgHxFTssG6zv1b6fYeRjWBX8kQClnGbp9fErOymOaXT4cwN2XW255Gxs2xk1JfFBHqPGsg6Fb
	Kuc
X-Received: by 2002:a05:600c:34c5:b0:4a1:dc8e:edc1 with SMTP id 5b1f17b1804b1-4a1dc8eee6dmr208638065e9.0.1792499217319;
        Tue, 20 Oct 2026 05:26:57 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce1479sm69425855e9.14.2026.10.20.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:26:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:26:54 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <atddoIx-sA2eheSu@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <179245258504.58760.15790996354033644110.b4-review@b4>
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
In-Reply-To: <179245258504.58760.15790996354033644110.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> [ ... 159 lines skipped ... ]
>> +#define CTLV_NODE_SCHEMA_UNLIMITED 0
>> +
>> +#define __CTLV_NODE_SCHEMA(_attr, _kind, _occurrences, ...)	\
>> +	{ .attr_id = (_attr), .kind = (_kind),			\
>> +	  .max_occurrences = (_occurrences), __VA_ARGS__ }
>
>This reads alot better without the extra macro layer. The point of
>this is to allow the codegen output to be concise it is worth being a
>bit more verbose here so the exact form is easier to see.
>
>> +
>> +#define __CTLV_NODE_SCHEMA_CHILDREN(_first, _count, _required)	\
>> +	.first_child = (_first), .children_count = (_count),	\
>> +	.required_children_count = (_required)
>> +
>> +#define CTLV_NODE_SCHEMA_ROOT(_first, _count, _required)	\
>> +	__CTLV_NODE_SCHEMA(CTLV_ATTR_ROOT, CTLV_SCHEMA_NEST, 1,	\
>> +			   __CTLV_NODE_SCHEMA_CHILDREN(_first, _count, _required))
>
>For instance this is much more directly readable:
>
>#define CTLV_NODE_SCHEMA_ROOT(_first, _count, _required) \
>	((struct ctlv_node_schema){                      \
>		.attr_id = CTLV_ATTR_ROOT,               \
>		.kind = CTLV_SCHEMA_NEST,                \
>		.max_occurrences = 1,                    \
>		.first_child = _first,                   \
>		.children_count = _count,                \
>		.required_children_count = _required,    \
>	})
>
>Even if it is longer, and and clangd can now jump to the struct members
>
>I also think each of these should have a one line comment explaining
>when it is used.

Okay, makes sense.


>
>> [ ... 61 lines skipped ... ]
>> +#define __CTLV_STUB_SCHEMA(_family, _set, _node, _optional)	\
>> +	{ .family_id = (_family), .set_id = (_set),		\
>> +	  .node = (_node), .optional = (_optional) }
>
>Same here

Ok.


>
>> +
>> +#define CTLV_STUB_SCHEMA(_family, _set, _node)			\
>> +	__CTLV_STUB_SCHEMA(_family, _set, _node, false)
>> +
>> +#define CTLV_STUB_SCHEMA_OPTIONAL(_family, _set, _node)		\
>> +	__CTLV_STUB_SCHEMA(_family, _set, _node, true)
>> +
>> +struct ctlv_schema_tree {
>> +	const struct ctlv_node_schema *node_schemas;
>> +	u32 node_schemas_count;
>> +	const struct ctlv_stub_schema *stub_schemas;
>> +	u32 stub_schemas_count;
>> +};
>
>I've been ponding for a while what 'stub' means in this context.
>
>AI suggested "extension_points would be a clearer name here." I guess
>because ctlv.rst calls it "Inheritance and extension points" ?

Will think about rename. Pehaps better documentation&comments would be
enough, IDK.


>
>> +
>> +#define CTLV_SCHEMA_TREE(_name) {				\
>> +	.node_schemas = _name##_node_schemas,			\
>> +	.node_schemas_count = ARRAY_SIZE(_name##_node_schemas),	\
>> +}
>
>It is helpful to put the struct on these macros ((struct X){})
>
>#define CTLV_SCHEMA_TREE(_name)                                         \
>	((struct ctlv_schema_tree){                                     \
>		.node_schemas = _name##_node_schemas,                   \
>		.node_schemas_count = ARRAY_SIZE(_name##_node_schemas), \
>	})

okay.


>
>> [ ... 127 lines skipped ... ]
>> +typedef size_t (*ctlv_family_priv_size_fn)(void);
>> +typedef const void *(*ctlv_family_pre_init_fn)(const void *init_info);
>> +typedef int (*ctlv_family_init_fn)(struct ctlv_device *ctlvdev,
>> +				   const void *init_info, void *priv);
>> +typedef int (*ctlv_family_post_init_fn)(struct ctlv_device *ctlvdev,
>> +					void *priv);
>> +typedef void (*ctlv_family_pre_fini_fn)(struct ctlv_device *ctlvdev,
>> +					void *priv);
>> +typedef void (*ctlv_family_fini_fn)(struct ctlv_device *ctlvdev, void *priv);
>> +
>> +typedef int (*ctlv_stub_fill_fn)(void *priv, struct ctlv_op_ctx *ctx,
>> +				 const struct ctlv_cursor *request,
>> +				 struct ctlv_cursor *nest);
>> +
>> +struct ctlv_stub_ops {
>> +	u16 family_id;
>> +	u32 set_id;
>> +	ctlv_stub_fill_fn fill;
>> +};
>> +
>> +#define CTLV_STUB_OPS(_family, _set, _name) {			\
>> +	.family_id = (_family),					\
>> +	.set_id = (_set),					\
>> +	.fill = _name##_fill,					\
>> +}
>> +
>> +struct ctlv_family {
>> +	const struct ctlv_family_schema *schema;
>> +	const struct ctlv_family *parent;
>> +	const struct ctlv_op *ops;
>> +	u32 ops_count;
>> +	ctlv_op_pre_fn pre;
>> +	ctlv_op_post_fn post;
>> +	ctlv_family_priv_size_fn priv_size;
>> +	ctlv_family_pre_init_fn pre_init;
>> +	ctlv_family_init_fn init;
>> +	ctlv_family_post_init_fn post_init;
>> +	ctlv_family_pre_fini_fn pre_fini;
>> +	ctlv_family_fini_fn fini;
>> +	const struct ctlv_stub_ops *stub_ops;
>> +	u32 stub_ops_count;
>
>Having the function ops in a struct use typedefs instead of just
>coding the signature is unkernelly, I couldn't figure out what this
>was done, it seems there is no user of the typedef

Right, will remove.


>
>> [ ... 182 lines skipped ... ]
>> +/* Implementation limits, not wire-field maxima: raising them is compatible. */
>> +
>> +/* Request roots, action replies, query reply fragments and event roots. */
>> +#define CTLV_MAX_INLINE_MESSAGE_LEN	0x100000	/* 1 MiB */
>> +/* Includes the error information root. */
>> +#define CTLV_MAX_ERROR_LEN		0x4000		/* 16 KiB */
>> +/* The root attr is at depth zero. */
>> +#define CTLV_MAX_NEST_DEPTH		32
>> +#define CTLV_DEFAULT_QUERY_REPLY_LEN	0x10000		/* 64 KiB */
>> +#define CTLV_MAX_EVENT_QUEUE_LEN	0x1000000	/* 16 MiB */
>
>If they are just random kernel limits I'm not sure they should be in
>this uapi header?

True, will move to internal c/h

>
>-- 
>Jason
