Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041130;
	b=Mwtr7KzhlT7rVLJzDBZTDtOMW6F5MQlCM/9b14ViHnwZfIr4I57wjDg7PQkqkHyCl3Ua
	 xftKXi2SZlKFUUz2oJsxZ7i1TwveK0HrcwT7gJHYZUmm7RtSQS8NsZIKHkDgcolfRQW7n
	 HhOYiDupRy3Ta20mkxGnnfTqnAl5A6H9EcfGN3y65YH2yMb4oacBl8pn1Xuw9bSmIp+nP
	 +KebRiymC0QoNeAZdKlLfS9LqPum7NeEKhV7zO9298vGWdGAmzXwRoAnKV/6iqe6u2+Qz
	 pADfUbf4hAjv2AwzHFYgClSR3EPFXUK90+SqSZPFJ/C0bUtUzh8dD+I+Eix4d//teqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uO/W/z94g5X81Ln9+3SsNcj1ZpjaM4tumvmhkUCPgU4=;
	b=SWqV38jFOTJEkiEbLmeWJKwoX0ODmfvQXIArKaMNncslBZq/EZZIoqiVOM7yePTNxJwc
	 fri87xgKZOvstpPwHiof0SfXy0KWy6U3uVG2mE5IEWqiY/rrnkZWMX9YA46p/GIWPiezd
	 hmeHkvUABvkYD6AccBz6icyOB5ZrBl+YCsv06kPJODps+Ha3EtV391VxjKX7PuDlO8IaF
	 BoognT66NfvQ76vjUyhtQ4pJSS0lm6P8oFR1YIS11kTBGfpPjEpUZa41CN12t8w63M5oJ
	 RPbCucsFYDvEIKdX/1xw9uKG7++uhpf5FzvVaaNwlRORgsQnAcNptSRkMe/KA1JsnaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JKjjoCuI;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JKjjoCuI
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c40aa03ded8so352188666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793041128; x=1793645928; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uO/W/z94g5X81Ln9+3SsNcj1ZpjaM4tumvmhkUCPgU4=;
        b=JKjjoCuIbh02ARsgvrK0Ol5dDb2+nWtUMqToc9T+8ozlgQZ/Dgm8a7ApYJpJZ8a9Qz
         D4u6VnpJ2NeSYianLaTYcirwtSxRoQLznFchjOGCTQaMjjNtTQkYQDhzMMFI1/aR7t+W
         6GzKMV3fWoajRwlhMYho/AR32BGL9T08zSze4PgMRvY22rssC3uF4RKbkFPer9V2Xvs+
         woNpVD9ZkhjMXqPKnkebxShirYiCHfC7yYUChvd77PP8wta40d+o4uhEyj5GxskB2tAA
         W5U8UbcHbEud2hPjnFnrqUPEM8/VkcqYOs3RzrvaoYiKZSlNwcoKEG+G7zk7V15QhBi8
         ya1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041128; x=1793645928;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uO/W/z94g5X81Ln9+3SsNcj1ZpjaM4tumvmhkUCPgU4=;
        b=WIPOciP6gzrDPyeCd5px4FQd+rk2XzJRdlLRkqTze3SvwI8tyN5j9l+ITmnTWsUipa
         +GumETUE6MQRG+al/+VX3j5r8eLcU3L3Kv1kpb0mNvTzZep2a5T/x+rizJ2+Y3T7X+uS
         Vzqm8XySX7uJzP8j0W53lQ6JKppHdeJ+0nirxWo4ksKgFw0BCRiSZxMF9E+NYp0Yvepw
         Hn+loUnT2jihdCjPFz5o25HTtL7pWsk2C1CK/lF3f2cIJKbGWzZF1zErPJb/iInEet/i
         qSDEyMFNMSPxdZD8y65GNrapr934dB4REGlH6bHMYNQQF0i92gYTrrzLoF9TwF67+Ps4
         pIsw==
X-Gm-Message-State: AFq9FYKsjovp2SJBZr7lFCYpAfJXuWZKeZ3/++4j/hdJnd3HfGIW1NXU
	Cs7ygJfVc3ls0kQFPIskww/Ng6tvU7xN58ocyyu+sas9WlXyUqjOJLhY8AjoZtW3UurFL44M9yh
	KaT0O4aMjQ6z2DzzclA==
X-Received: from ejzi19.prod.google.com ([2002:a17:906:a293:b0:c40:732:2996])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:9f88:b0:c46:7462:6332 with SMTP id a640c23a62f3a-c46bdebd370mr947991366b.37.1793041128327;
 Mon, 26 Oct 2026 11:58:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:58:47 +0000
In-Reply-To: <20261026174217.603114-1-tarunsahu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026174217.603114-1-tarunsahu@google.com>
Message-ID: <9huz8q3k9tlk.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH v3 0/4] liveupdate: Add feature header for
 fine-grained ABI compatibility
From: tarunsahu@google.com
To: loganodell@google.com, alex@shazbot.org, dwmw2@infradead.org, 
	seanjc@google.com, Mike Rapoport <rppt@kernel.org>, will@kernel.org, pbonzini@redhat.com, 
	jgg@nvidia.com, Pasha Tatashin <pasha.tatashin@soleen.com>, arnd@arndb.de, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, oupton@kernel.org, 
	baolu.lu@linux.intel.com, David Matlack <dmatlack@google.com>, robin.murphy@arm.com, 
	maz@kernel.org, Alexander Graf <graf@amazon.com>, joro@8bytes.org, 
	Bjorn Helgaas <bhelgaas@google.com>, kevin.tian@intel.com, 
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"


Withdrawing this version because of the following reasons.

1. KHO also has versioning which can also share the same concept of the
feature flags, And the header can be shared amongst KHO and LUO. In next
version, I will include this.

2. If there are any open threads in the V2, Can be settled based on this V3
reference. This V3 has included the suggestion from V2, like updated
truth table, nr_features based flags array, ABI wrapper MACRO etc.

~Tarun


Tarun Sahu <tarunsahu@google.com> writes:

> Changes since RFC v2 [1]:
> - Dropped the file handler compatible rename and per-FD handler
>   selection patches.
> - Replaced the fixed 128-byte header with an expandable struct
>   luo_ser_hdr (size, nr_features, flags[]), kept separate from the
>   payload structure. The header is 8 bytes with no features and 16 bytes
>   for 1 to 32 features.
> - Each subsystem declares its wrapper once with DECLARE_LUO_SER_WRAP(),
>   passing its feature enum MAX; the macro sizes the flags entries and
>   generates name##_wrap_init(), so callers never pass sizes or counts.
>   The target kernel reaches the payload with luo_ser_payload().
> - Feature bits describe only what each preserved object uses. The target
>   kernel checks them against its own boolean supported table, and the
>   header is trusted as the source of truth: validation only rejects a
>   required feature the target kernel does not support. 0b10 is reserved.
> - Moved the __packed removal into its own patch (1/4) and added a KUnit
>   test (4/4).
>
> Changes since RFC v1 [2]:
> - Replaced the 3-mask (supp, req, active) design with a header of 2-bit
>   feature states.
>
> [1] https://lore.kernel.org/all/20261021152527.375070-1-tarunsahu@google.com/
> [2] https://lore.kernel.org/all/20260903023452.721732-1-loganodell@google.com/
>
> ==========COVER LETTER==============
>
> LUO and its file handlers rely only on coarse-grained compatibility
> strings (such as luo-v5 and memfd-v2) to validate handed-over state
> across kexec. Any change to a serialized structure, even an optional
> additive field, requires bumping the string and breaks live update
> between adjacent kernels.
>
> This series adds a feature header (struct luo_ser_hdr) ahead of
> serialized LUO structures so subsystems can evolve their serialized state
> per feature. Each subsystem groups its serialized fields under feature
> indices, with index 0 for the base fields. New capabilities append fields
> at the end of the payload under a new feature index, and retired fields
> stay in place so offsets never shift. Only a change that feature flags
> cannot express needs a new handler with a bumped compatibility string.
>
> Each feature has a 2-bit state set by the source kernel:
> - LUO_FEAT_ABSENT (0b00): not in the payload; a target kernel that
>   supports it can use default values.
> - LUO_FEAT_OPTIONAL (0b01): in the payload; a target kernel that does not
>   support it ignores the data.
> - LUO_FEAT_REQUIRED (0b11): in the payload; a target kernel that does not
>   support it rejects the state with -EOPNOTSUPP.
> - LUO_FEAT_RESERVED (0b10): reserved, not checked by the target kernel.
>
> The target kernel checks the header against its own boolean supported
> table:
>
>   Source hdr  Target supported[i]  Action
>   ----------  -------------------  ----------------------------------
>   00          0 or 1               Accept: feature absent in payload
>   01          0                    Accept: ignore the feature data
>   01          1                    Accept: use the feature data
>   11          0                    Reject: -EOPNOTSUPP
>   11          1                    Accept: use the feature data
>   10          0 or 1               Reserved: not checked by target
>
> struct luo_ser_hdr holds the total size of the serialized structure
> (u32), the number of features (u32 nr_features), and 64-bit flags
> entries with 32 features each. With no features the header is 8 bytes;
> with 1 to 32 features it is 16 bytes.
>
> On the source side, a subsystem declares its wrapper once with
> DECLARE_LUO_SER_WRAP(name, expected_size, nr_features), passing its
> feature enum MAX, then calls name##_wrap_init(), marks the features the
> preserved object uses with luo_ser_set_feat(), and fills wrap->ser. On
> the target side, incoming state is never cast to the wrapper, since the
> source kernel may use a different number of flags entries. The target
> kernel calls luo_ser_hdr_validate(), finds the payload with
> luo_ser_payload(), and reads the fields of a feature only after
> luo_ser_get_feat() shows it present.
>
> Patch 1 removes __packed from the LUO and memfd ABI structures. Patch 2
> adds the header and converts struct luo_ser. Patch 3 converts memfd and
> bumps its compatibility string to memfd-v3. Patch 4 adds KUnit tests.
>
> Tarun Sahu (4):
>   liveupdate: Remove __packed from LUO and memfd ABI structures
>   liveupdate: Add feature header for fine-grained ABI compatibility
>   mm: memfd_luo: Add the feature header
>   liveupdate: Add KUnit test for the feature header helpers
>
>  MAINTAINERS                          |   1 +
>  include/linux/kho/abi/luo.h          | 359 ++++++++++++++++++++++++---
>  include/linux/kho/abi/memfd.h        |  43 +++-
>  kernel/liveupdate/luo_core.c         |  62 +++--
>  lib/Kconfig.debug                    |  16 ++
>  lib/tests/Makefile                   |   1 +
>  lib/tests/liveupdate_feature_kunit.c | 118 +++++++++
>  mm/memfd_luo.c                       |  68 +++--
>  8 files changed, 577 insertions(+), 91 deletions(-)
>  create mode 100644 lib/tests/liveupdate_feature_kunit.c
>
> -- 
> 2.56.0.307.g5fe7bd680c-goog
