Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFC73B059C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787777226; cv=none; b=kvzlzgDsNX5RZRd+W3q9aYSHtl811YrQPkYfwRyfYuRSWy5AENaHRxrTqikeqrorb8ysZ3BoSVqpH51BDo0ByoO4G3K1b0dsJNjDybEe4DOmnOPPBL2VsJbmBS5lbQsp8dYt2QESJgTJkKF90axE0rXAxSrbQ84RJZRqg7IQH1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787777226; c=relaxed/simple;
	bh=8W+6nm1p92cnpBRrsTxdlV28jcWT30IBrjF2fyWBd6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9JuK1OvXa3VwZsrO4xhIVg6iERA49aqTZjfgbt+wJ105Sn/DK8S89CR1MML/TsCmTqOPC1blZqHLR3gerTDZKKtkHjyKIo3oTD+rmOFY3aw0NsXo2tINR4t6J/iWh3mzUryZheOAxiz619Ink2KhjdMKUzicRMt/AcU0eaPgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bbImQpF0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bbImQpF0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cede6375caso32635ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787777225; x=1788382025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVpNY9AYqp69vRQbsKPPtkBeX+dXdwmZPC7oJAGryqk=;
        b=bbImQpF0VfDWrpfE1FdkzaYXAS5XZ2DsAzNMm/yEpmVqyoBCOaDtTsdyIUiroo3nRn
         hft4W7bQ4QQMTZA0dAqPUOfTFXEyIITQ+1VjG+u34mqNcODDLkec7KcbPVLz5N37Evm4
         mV5seE4sYB0v4dDr1Z5U23ozPQK5MUxfGoB2QWNVb7bKh7uTLaiLOrxlZkeKp7Ihp1os
         evpuqyvCxIqhD14CHFR5nENjw/iR3kh38kUmObthW9DIyE37pmjoHi2+nk/HhTHhwTMU
         9yfvQgy+OMZjYWP/mIGid3jYdKa2qnBPwoUVb+g//ncRuilNjch+WyjERQJgXcotC32Z
         hTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787777225; x=1788382025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVpNY9AYqp69vRQbsKPPtkBeX+dXdwmZPC7oJAGryqk=;
        b=WieysgDflW6+CTfDC8Wl34mW6+GlTTfnJ4tFLLuGP4TQMjpR7BXQI4dJ+QtOW/0h4d
         olYKaNfkJR9PP0jJ8xwAe/3zpe9/hO49CSeyD5cQA5itwCItzxw7gJFTwNYB27eTDAhc
         BzgTIP8gmwzzXDX0yuVh6SeGCk9Pj2zqnkZMTx+Sq+N0QHOWgHWDiCWZ3EL9RESGMzCw
         EZG+sPN4BJgbbWOlo5/OfIRbTwDmj9onAtiiIoC3JdFOAv+L7xvmpiJf6zS8mpEy5E3b
         KsKiRT8X0bzmGwJQAsZjHnNP2F4ANbGb7DhKdJ401Cx3aPyssKeLxdhF6HC8OmXmu1cU
         0xKw==
X-Forwarded-Encrypted: i=1; AHgh+RqXp+3MWv2JDV+E1RU8oPgELvb9p5kLGE6hLwUvbTbFjdoyFoM/L2Qt+q1UldOFxyv0E4zMsxg6o3dRgWs=@vger.kernel.org
X-Gm-Message-State: AFuF++nmWuXgg/KKIsso1mXIIc37Y/tmD2FNIjLMo8fhNI5I00OjMeK5
	tuaFD3LiTaYIaFWQ8CagcbvJCWaLRVIxxCqN3eyNUf68OrkmLEk8GtGLljWarUrN4g==
X-Gm-Gg: AR+sD12sVKhC/e5YI/QFI81v7hoCLSo/48PJdxxTm/5peUYDfy5K1EZfenryuyY5gN2
	dR3HEGILpYz7WVERrQOXo63kvUB4uSAh0AnSP3V8PswQgPBd8M+C7E1mu8AoYukrau+6ISX4XuW
	cOANMvTC3RYf5ZYdK+25YcntdwK+ZgWydml/WN6HTRchd2uoWxOPoNbhRqX68ud9jiCmFCs1OA6
	V5tCI2gSxeyOd+PjmP1JRHzgcBOjOJWu2TV5ur1O8eIv2Gol0dgeM66n2DWEjsleQtuCuVEf3Ts
	AaLuJxMlGlbxvdKyQGD8KOJj7gVzFRCfnLjBDbghcFOTpT/9FbG33/pkytoLFKOA8hKW3I/iKf9
	UDmun/EyBpR9dhfCb1aIPJy7Kw7uilAOlQndZvXnvjByOGMbjNgHlixEfsui4QdbKsZQYQTf1T0
	DQNTXC2B0xdHAZGjEZOxWJh+7hlcj3cfwZcKJrX2QAKcQzqTtA/DYug6j+IyZO5soVLnBT2j666
	7oFnzlfaH99AVZd3zr90EsroP0HRtourjM1t0fzmO2Kvfy0Hs4xQ3pL7mEMRvTJsPwJgw==
X-Received: by 2002:a17:902:e94f:b0:2d5:db3d:1a44 with SMTP id d9443c01a7336-2d73365a24amr151945ad.17.1787777213391;
        Wed, 26 Aug 2026 13:46:53 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1befce3b8sm1396240a12.5.2026.08.26.13.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:46:51 -0700 (PDT)
Date: Wed, 26 Aug 2026 20:46:47 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v4 07/18] iommu/vt-d: Implement device and iommu
 preserve/unpreserve ops
Message-ID: <ao9PE9gdOh3DXNvP@google.com>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <20260808022723.3893618-8-skhawaja@google.com>
 <065b2be2-2ff1-42a0-99b1-ed81e783dca1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <065b2be2-2ff1-42a0-99b1-ed81e783dca1@linux.intel.com>

On Wed, Aug 26, 2026 at 03:10:31PM +0800, Baolu Lu wrote:
>On 8/8/26 10:27, Samiullah Khawaja wrote:
>>Add implementation of the device and iommu presevation in a separate
>>file. Also set the device and iommu preserve/unpreserve ops in the
>>struct iommu_ops.
>
>This patch, on its own, does not fully implement the preserve operation.
>At this point, the callback preserves all root/context entries used for
>live update, but it does not yet clear non-preserved entries and
>invalidate the related caches; that cleanup is supposed to be done in
>the next patch.
>
>So I think we should either:
>
>- add a brief note here to make this dependency explicit, or
>- merge these two patches into a single patch for completeness.
>
>?

That is a good point. I kept the cleanup patch separate as it has to do
with shutdown and basically getting ready to go into kexec. This patch
mostly focuses on the "preservation of the memory" being used by various
IOMMU data structures.

But I agree, we should add a note about the cleanup here. I will do that
in the next revision.
>
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---

[snip]

>>+#else
>>+static inline int intel_iommu_preserve_device(struct device *dev,
>>+					      struct iommu_device_ser *device_ser)
>>+{
>>+	return -EOPNOTSUPP;
>>+}
>>+
>>+static inline void intel_iommu_unpreserve_device(struct device *dev,
>>+						 struct iommu_device_ser *device_ser)
>>+{
>>+}
>>+
>>+static inline int intel_iommu_preserve(struct iommu_device *iommu,
>>+				       struct iommu_hw_ser *iommu_ser)
>>+{
>>+	return -EOPNOTSUPP;
>>+}
>>+
>>+static inline void intel_iommu_unpreserve(struct iommu_device *iommu,
>>+					  struct iommu_hw_ser *iommu_ser)
>>+{
>>+}
>>+#endif
>
>I believe the #else ... #endif stubs are unnecessary and can be removed.
>
>Specially iommu core checks driver support via callback pointer
>presence:
>
>        if (!iommu->iommu_dev->ops->preserve_device ||
>            !iommu->iommu_dev->ops->unpreserve_device ||
>            !iommu->iommu_dev->ops->preserve ||
>            !iommu->iommu_dev->ops->unpreserve)
>                return -EOPNOTSUPP
>
>So when CONFIG_IOMMU_LIVEUPDATE is disabled, simply not wiring these
>callbacks is sufficient.

Agreed. Will remove these.
>
>>+
>>  #ifdef CONFIG_INTEL_IOMMU_SVM
>>  void intel_svm_check(struct intel_iommu *iommu);
>>  struct iommu_domain *intel_svm_domain_alloc(struct device *dev,
>>+

[snip]

>>+/**
>>+ * intel_iommu_unpreserve_device() - Intel IOMMU callback to unpreserve device state
>>+ * @dev: Target device
>>+ * @device_ser: Struct containing serialized device state
>>+ */
>>+void intel_iommu_unpreserve_device(struct device *dev,
>>+				   struct iommu_device_ser *device_ser)
>>+{
>>+}
>
>Please add a comment explaining why this callback is intentionally
>empty.

Agreed. Will add in the next revision.
>
>>+
>>+/**
>>+ * intel_iommu_preserve() - Intel IOMMU callback to preserve hardware state
>>+ * @iommu_dev: Generic IOMMU device handle
>>+ * @ser: Struct to populate with serialized hardware state
>>+ *
>>+ * Return: 0 on success, or negative error code.
>>+ */
>>+int intel_iommu_preserve(struct iommu_device *iommu_dev,
>>+			 struct iommu_hw_ser *ser)
>>+{
>>+	struct intel_iommu *iommu;
>>+	int ret;
>>+

[snip]

>>  /**
>>   * struct iommu_hw_ser - Serialized state of an IOMMU instance
>>   * @hdr: Common object header
>>   * @token: Unique token for the IOMMU
>>   * @type: IOMMU type serialized state belongs to
>>+ * @intel: Intel specific serialization data
>>   */
>>  struct iommu_hw_ser {
>>  	struct iommu_hdr_ser hdr;
>>  	u64 token;
>>  	u64 type;
>>+	union {
>>+		struct iommu_intel_ser intel;
>>+	};
>>  } __packed;
>>  /**
>
>Thanks,
>baolu

Thanks,
Sami
