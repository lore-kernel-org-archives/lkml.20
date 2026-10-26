Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049253;
	b=WniVpmCOvWA8XNjhUYOb67EV3stFTWt2YOhbEOixT5tdGD7//HpfCWJlRW+H2G3O9eyX
	 fHu9zqBnH+3HK/usTu/yHiPUn84T1vF+kG2VK0NT7VGxl/42XaflclJhzu0UwLx2C6xkT
	 KDxSIVF1ctBu1oAXHvjXCq3UIZ4HGAP8vmlxjRr9DvyCfFMXOqFI10UOnk58CoBB2jhm/
	 AGHmkvKT1MX7XJRzWsuVaKdNRcYBK2gwRB2oNOHETRWYmDY/3uUDU0Wiwyi/yHULuw96y
	 fCjrr/jLACURZIwzuQuXffd+j05z4xE9u9J11JB5+MTD3S/iH7n2jBmpKwT7AUhpe8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gKF3hAWDK1ltcE+SHB5ZbEu9q5rcNDasVCUAn/AhQHg=;
	b=5J9FQyDoVd1pJ4UFStApf4LVNJ0u/cqFyH+tTXmG849868wWJ0CVlieXv8IcTdfOUZxF
	 TDDK/9NXU6DyjvGuOPL82B4RA7kHmyf7KCzpTc8zjEXqU3HJ1cP8t2QVfOFPws58nmBSg
	 ov65nWYxK8svX/0iCmKkd6SuRS44M6DPxO9sz7uZGpFTf4GgyuJr8vgRaJm1PD3iA2hwO
	 7ldkqQbsdUYpjSJWBP1dtG3f71EsDLmkt+bEFr5dAIDg+vRv7XWLaTLkcsBev/PGwr619
	 uHtw6CwtTKi7i/KszRPxsFNjJ8ajoV3gw1kf7St2TjE14RNOkZKuuH/eQ6lVK8LTdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=K67nv9XJ;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E641D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=K67nv9XJ
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1602584b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793049252; x=1793654052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKF3hAWDK1ltcE+SHB5ZbEu9q5rcNDasVCUAn/AhQHg=;
        b=K67nv9XJ4TeaL34vMeEZnzHwkkjAJXvovbKt25dK0ARJPImK8eAJxasjllvcrO3Mvz
         0GnHKSvbs2j+fu1L93vtVfYaEU7xBX2oBxVR4XSp19D8BxbS5MYCpBV1+ZjPWQ/Qou0G
         zCzOQQs71hCXYgkSqfxoI+w4i5o+oRk28rX4pfVUgSmX2Ghz150YtewTvUM95BqcWP5W
         +em5Y44xGXwMDj3h+mYQvTQ5PR6vT1Y1kvTbUxQmieHlgsnHuGeGqx3rs6CbGzAdcSyS
         aIIPuVbSixMCtl5PfpYxO7dwRL+PhVrWizeSZ5Cq07AOWp7dCw6lGuB6PhYEUCIwAA9v
         LA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049252; x=1793654052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKF3hAWDK1ltcE+SHB5ZbEu9q5rcNDasVCUAn/AhQHg=;
        b=Wl6F6VuSr+C7Z4pfZrlNIRM9AzdvZ9q+hRer/vET/C2+jS9fTh8fE91izCGVdcOozq
         5L/Ate8I3ssPPSkqlmuwj8A1nrvlTAED3ujk17KcbH1Xxbr/7BlGAlshR1wDY2H0QdWZ
         pUJBYl1VdPbCxLyKxjvd5YkuMjuB1onXvzjnJ/Ow8owcGo5JsEWU6fO2RvCszh94tsww
         NXb2zIDZNeOfDale9QZdAnejHvRtqZoaJxdNcsHLSkzUGkD85JqwkJP2Ai7jsbFoq2nn
         K1lJzUBdXjgoyozgb4/TisgUO5Oa5PAUlBX0v+YPIOD3vZAgxQ7Sx712cp8QDfx8pGz1
         Qlzg==
X-Forwarded-Encrypted: i=1; AKwUvBwYZPesy7bzBUAV4nn3X9MXldzPIIlfg0Nh/ZTzAqSfSqJRIYX/jzlyDN12Ag+3SFfb5L25/ran/vfmQ6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYSK81cng+iauwoHgaOEop/35x2O9S/B4/vIghM+rbjW26tNPu
	MS8Zep5q4PYk0zMJao1AEWjgmMFu3inCJxV+E3flMJperzLFXTYVK18zOIs0z/hg4w==
X-Gm-Gg: AYBFou0i5h9Q9UgdYSoTyJeBbw2Kjjc2WAy1Hb246E6ewEouGh2vSy57YodVSE2QJ/Y
	0ZGr+s+zLKb7rveYbtwAXASmRbzJ1xuV4D3v+RDElSzRKTsC9+Pmi/0la8zlIiXAZe2Gt6BfcMV
	le7DTyQs9S73oiCcXBJ7ZutCDt6u6yQULRiDDby8Ew52w5tXpAkGfP36pjkVEyMuh4pSr3qiKt7
	tgGwknyAWmrMkNwaPS/dswF0co7O+WB4JJmnq/6OwWe6uhLygBDMM9eO3y9rgCGMoNxRJlFAD/H
	nb8q/KfjpyKiYRhDx8tX1z5LPIBoforRdzBYrvgSVwmiTKjddTrwiwv582UJTwIzdDT6dWxbqfz
	s8U8IEkWw04+qFVmOhi4LZAFbxIaRG5bNWYytuAlx1julU+3zSrlN/YpXIBd0LKIgKKNsCdGDbw
	s00o9vhobqGLMoCqc9J5vj5rK3reNIlTUSkDhH9WlGi34Z79z0/MRRz4xOS/HJOQv2UwzMODFW7
	K8o8zpHW8120oi3yWpU3vaSktDTCrpiwk0qzv1FLAzOLeSUH9x6mM4PlTph0wZ+EQQoS5qT+off
	zibJecWMdAym/PY8e4w2shOc91PIddWxQQZCe7eL+TI=
X-Received: by 2002:a05:6300:6bc9:b0:3e2:3392:53e7 with SMTP id adf61e73a8af0-3e7a1b97750mr5308652637.0.1793049251805;
        Mon, 26 Oct 2026 14:14:11 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36b372888sm1666157b3a.30.2026.10.26.14.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:14:09 -0700 (PDT)
Date: Mon, 26 Oct 2026 21:14:05 +0000
From: David Matlack <dmatlack@google.com>
To: tarunsahu@google.com
Cc: Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <at_CncIPYCxOVkLo@google.com>
References: <20261021152527.375070-1-tarunsahu@google.com>
 <20261021152527.375070-4-tarunsahu@google.com>
 <atlQ_Er0Ig7CCSxv@google.com>
 <CALzav=f00C4yOAseNunW8GgQTDUGWT927Qy=TLm-3-J0TEDH8Q@mail.gmail.com>
 <9huzzew0el59.fsf@tarunix.c.googlers.com>
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
In-Reply-To: <9huzzew0el59.fsf@tarunix.c.googlers.com>

On 2026-10-26 11:50 AM, tarunsahu@google.com wrote:
> Right, Required bit should be source kernel payload property to tell
> target kernel that the payload must be handled to correctly deserialize
> the data. It should be source kernel (userspace) responsiblity to make
> sure it understand the target kernel before doing liveupdate.
> 
> Saying this, During deserialization, target kernel's required bit is not
> necessary. So I propose the following truth table.
> 
> Source hdr  Target supported[i]  Action
> ----------  -------------------  ----------------------------------
> 00          0 or 1               Accept: feature absent in payload
> 01          0                    Accept: ignore the feature data
> 01          1                    Accept: use the feature data
> 11          0                    Reject: -EOPNOTSUPP
> 11          1                    Accept: use the feature data
> 10          0 or 1               Reject: -EINVAL (invalid encoding)

Yes, this matches what I had in mind for the semantics.

To be explicit: the source kernel should set the bits for each Live
Update based on what is actually preserved, rather than generating the
header from a static per-kernel array. E.g. memfd would only mark a
feature present for memfds that actually use it. That's what allows
rollback to an older kernel as long as nothing being preserved depends
on the new feature.

But looking at this again, I think the required bit is redundant. Whether
a feature can be safely ignored is a property of the feature itself, not
of any particular file. Every file that has a feature present will have
the same required bit for it. The only thing that actually varies per
file is whether the feature is present.

The required bit still has to be conveyed to the target somehow, since
the kernel that needs it is the one that doesn't know about the feature.
But it can be conveyed by the feature's number rather than an extra bit:
split the flag space into required features and optional features, and
assign each feature to one of them when it is defined. This is similar
to the required_flags and optional_flags approach in struct pci_ser [1].

Keeping the same header shape as discussed with Pasha:

struct kho_ser_hdr {
    __u32 size;           /* Size of header + payload in bytes */
    __u16 nr_required;    /* Number of required feature bits */
    __u16 nr_optional;    /* Number of optional feature bits */
    __u64 flags[];        /* Required bits, followed by optional bits */
};

Required feature N is bit N of flags[], and optional feature N is bit
nr_required + N (using nr_required from the incoming header). The length
of flags[] is DIV_ROUND_UP(nr_required + nr_optional, 64). Both spaces
are numbered contiguously, so there are no gaps, and up to 64 features
still fit in a 16-byte header.

Each bit just means the feature is present, so the truth table becomes:

Source bit       Target supports  Action
---------------  ---------------  ------------------------------
Not set          -                Accept: feature absent
Optional set     No               Accept: ignore the feature data
Optional set     Yes              Accept: use the feature data
Required set     No               Reject: -EOPNOTSUPP
Required set     Yes              Accept: use the feature data

There is no invalid encoding left to check.

[1] https://lore.kernel.org/linux-pci/20261013162529.1928093-1-dmatlack@google.com/
