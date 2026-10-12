Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C73949B5CF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818991; cv=none; b=PWmJPjVw8+19k7Rt6U5rMQJ690rbX7h9U09YykV+36Sy56NB2LsAgbVEJ/YsUfVzWyM9osM3bVJ/BSFqvDyAfGP975nDuQ2AVqm5R4+Ve2GADTBLfXDFJCXW/HxHSrYmGv2CrXphrDgx8IhJhRxaOW7Q1p1bkAQETIECIUOoDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818991; c=relaxed/simple;
	bh=S/6wBu1Qy0PjFWFsGd4NPUc2/G0ASzabS+h4tG5IOy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNtrMYVOsygzY03kfMHykQTr3rVVdgfRYBx1nVC6UCZeerzI1+kU1X3EN0kisE6OVRtTNbvT2BvZk6nujbCf8txXcnjPxK+Vb8nufUpyPRkrEPyQjfp5u5TpgtSdlDtln2W7+OxI0qveXnqZOtOMqyIbicuYsZKpcgRKarMlFRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m73PG3x6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m73PG3x6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso9572285e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818988; x=1792423788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHaZjZ/K9HkcWHP0xoN3hdI7zGw/VH12N/DXI78bY9w=;
        b=m73PG3x61KDHhuB9DVBfOJWPmuH8fpsxbuwo+uzeGLMXAJwi0r9Pruq63ReOCV5ghn
         DJcxD9KJlFH8z2oHQsI0eaPD3ARFY88vIHcynvXnkdKSu6GckV2Vdf2Ew5gY3HpiUKgJ
         YtvI4P228NiUf4X8SmWa4xcSQg5FZRLRPl03CO9mihO5i1UZDOCoZESurDyToeXEFZj2
         EXCYCQuCEdtiZMQt1k7YkXtjJR/XC9gWogq1Faj/NEtcPeUmelClnala+Lq/kAPHVuO8
         3EecEa8Gqz1LFhfWNFZtO5KHjyt2R5Nwm2FGpmu703LtgTfc5s68HRFSG4mlMdtuMivg
         bpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818988; x=1792423788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHaZjZ/K9HkcWHP0xoN3hdI7zGw/VH12N/DXI78bY9w=;
        b=eSpFQxVX5xi+lgweAYVGd8uNZhNb1wKp7mmdwqcUO4o3WsJQk/BEAT1LU+uGayuQrt
         1QFinqFP7dmWyC/Km3jI9V16PxJkAvm7jmcqb39z1u1qlwvsuIh636OuTMrgFgeAbyeJ
         /3sWIQpAbagV6EJEPXfwYj39z2Ks8ijVGSUI4Ssn2NnKkY1JcHXbasgbAxYaTUCPIx7W
         R+/SXV66rQ+f3kl5qcj9v+mv0yxOQhsOhXqWStVJT79BqFE8Sx8IeZH5zAyCCMNu0Qu3
         StBkO3zjyA9v487qkp8ygjWi6S7iSp4aG8h/hGCbEouiHye7jBGB4ScSeqJm1nfUJhP7
         6Qkg==
X-Forwarded-Encrypted: i=1; AKwUvBwORoRkrCbzlMNYRcqvq88rjpti9aAAxv342dmAHPnAkbGeDydTtn4dqyJjYJUjv2/KzsIwBnlPvmXYrYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo/2V7JgMuAvDQenh7/wx0wQ3iPRE62M56jT9wXxAMcORS7Isx
	fPWQvR1aF7trNp4UC582bnTlYcFj+Gpm2DeE1blVHOuihbgIMwKab/QK
X-Gm-Gg: AYBFou1P8Z8ASkp49RK7KYhw2FEnohLgbo1mcj/j30Wr2ysWbuWj0EtZwXIKikPijiR
	kuT30sDGBy/jBNY6FiCPSMlZX5wJKkXzLbFvBKtp7fzp2/9QYKo1GpeJK3YO3ePIhL+siBXQR2p
	uEIgQJC/coNzLWLjxjlyYUIiTxvQkDlbWMK1u/boZVyXdr0Oa4rLW+3gK58rL2a6iDwakEO5a67
	04zoaAWZ666pyMwSTNuUNsja7FYFgH0exqBG67liOuVlewciJ0km+twMsjAr2Aam/Aqaa5BY91r
	I6L7v6upkSfVRzXHLcfQWhJgKf0d371CRqeyp5TFr1m4uiU2xjOCqVZ3CYBQfqX2m0P1gDqU2pn
	bvdTvfLQT2UJNIzCILqdYa7A3rBF3VdWecsgv6+IMpYZ92azN04yfTjGll6/qlqrk70gNlukRiK
	IBl56v8dnA8RPb+truZpP6yYdyH3qe3/OJB+0FCHfFvaz7nZ2YBem+LGxBY6+XqR5moqcoPG7qQ
	1W/d+XriJMYoB8FWonRmRu2Rs2Zhqz267R5FgUKCr+WLcmUqL9qA3l+SMI9P3dHRqiMARK4lApU
	44B62lGQ9YSVflV5JwWFS+waEdFEBqhdSF0=
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr177576875e9.14.1791818988354;
        Mon, 12 Oct 2026 08:29:48 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm299058135e9.15.2026.10.12.08.29.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:29:47 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical run
Date: Mon, 12 Oct 2026 15:29:46 +0000
Message-ID: <20261012152946.63489-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012144616.GF14213@ziepe.ca>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com> <20261005132046.30025-1-griffoul@gmail.com> <f0077cec-10fe-400a-b229-f7434e297364@amd.com> <20261012144616.GF14213@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Oct 12, 2026 at 11:46:16AM -0300, Jason Gunthorpe wrote:
> I don't want to keep expanding this hack in iommufd. If dmabuf is to
> be used then dmabuf needs to provide a pluggable way to fill the
> iommu_domain that many exporters can plug into. I don't want to
> hardwire every exporter into iommufd, that makes no sense.
>
> The existing arrangement is to motivate solving this problem
> generically, not something to be expanded on.

Agreed. The iommufd registry I mentioned above was never posted, and I
have dropped it.

The series I posted since takes another route, without dma-buf:

  https://lore.kernel.org/all/20261006183235.16576-1-griffoul@gmail.com/

It adds a small interface in mm for drivers that own memory. Such a
driver hands out files, and for each page of a file it tells the caller
which frame backs it. iommufd maps the file with IOMMU_IOAS_MAP_FILE and
builds the iommu_domain itself, and the driver revokes a range when it
changes. So iommufd never knows which driver it is talking to, and there
is no symbol_get(). guest_memfd uses the same files for the guest. The
iommufd part is patch 5:

  https://lore.kernel.org/all/20261006183235.16576-6-griffoul@gmail.com/

The iommufd part is mainly there to show the interface, and it needs
more work. Its revoke unmaps and then remaps, so a device can hit a
hole. I would rebuild it on the REPLACE operation David discussed with
you at LPC, with the scratch page as a quirk on the IOAS.

Is this the kind of generic interface you had in mind, or would you
rather have it hang off dma-buf?

Thanks,
Fred
