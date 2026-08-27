Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B4623E35F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789431; cv=none; b=RNguBZsal6XUU/VwejFYSRf/ppVohVCQlvfhivjQ+GlJozJhvI4U29DwWrze7u5D9Vif8pk2cMKCjHAnkvM1bG7vE6RZe1xUbF5vRi83nqbxvevQIH1/xHlWQ2Fu/coHqnDC57SFHyuFsl3G0kXfWDsXAt0v/YpIiRXH46On3Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789431; c=relaxed/simple;
	bh=NpFoAN3ARoByq+Fs2sx4uXcEiHmYv9k+CBvlMh5NByY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZdvRFwGKSpDs4Ma9XNk6BcoM6R+VGUXKfIXR+/8Rsae29AhvR1iPcARNukogmiyxZ2wIy+4AsFNeGrhROwKaY7Qr8YtVv5m+Gr2x7Z106Vl4UfcpFSYmQyJ/SHhJmkTFO5uPS0BGoqyHzU9ET1DMcKfWM8Bi0yObUpIAIwx5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Smk83bzV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DX1Aueue; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Smk83bzV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DX1Aueue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787789427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kI48VtjA0m79pfKThr79GcCuUw/Tq7WCD7HinJujWM=;
	b=Smk83bzVDcKDOlhffKdsWDNIW76PbyUVLHJmf1FIlZCuFiWc5R4VZvGBw+eNN77qAAns5D
	d9wc4OZdBJ6GqJQyglKg9HTIsI2BGavD/Y0L+ty7nnj+L2R0Ya+PhSPt0qi2KzDPpoJSU+
	x0meOwTrhAhKqyWbDV3saKqoVFBOrr8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-JALLveDON4emZU9MMOJsAQ-1; Wed, 26 Aug 2026 20:10:25 -0400
X-MC-Unique: JALLveDON4emZU9MMOJsAQ-1
X-Mimecast-MFC-AGG-ID: JALLveDON4emZU9MMOJsAQ_1787789425
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2774982a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787789424; x=1788394224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kI48VtjA0m79pfKThr79GcCuUw/Tq7WCD7HinJujWM=;
        b=DX1Aueuee4LYfJ9W27naBvENe8PUUiZkwCO9PKwt1GJJwpD7pyCTXO2IM5AlntgJWh
         mSo967J9Kgrr4kUxCS7OqVPwcUhHauUvrB1ULeSWmCegjH156pFa9qDvqUSF4GvqAx3w
         iHkQJIgYJy7kpdRjcznJlBH4FqG7BdtuTlL+HjEzzlwJAXW9l69V6d6zf/IdV0cH84px
         9pti+Tdd5ZNT6KtykU/LWadGbFAHC29k15LlxdfHk8S9ewchQ6D1VePmLf2jRTrNdGoP
         vrRIO8WuWnLPERR+JCi+srIo8jrP+bLei5ZxKBUeS/6i9dOPN3ZHHfnZHQkZiZQIGWIG
         VCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789424; x=1788394224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kI48VtjA0m79pfKThr79GcCuUw/Tq7WCD7HinJujWM=;
        b=qDZ1ELo10P5KrRObhKYiKGg0OIMpNTN9U8PEYUDMW5KMTg2IXTYF7QaVyASuwGAGbf
         FJofz7pC1R74FzvS1yA0sXGgI6dTcCfFfD7VXxVEdLP4PcMfvpZ3Dx+L+vdGLiadJW0b
         o83UB101CWm9Z7Nu6I2svzvFM9MjIaJ7gQDa7BfYAEfACf6AM5n5DRGCwWLrjLtDNF35
         BKTpEXg40zTdMQ/Knmpzb+73zfvQSXGvXhKziz37o+HkbJ84bjBaYwXPCG015GDqum4k
         fzgFzq6xT4IsiYDUnl47wzrRZSvTu4xi4u/B2FWyS5lWBfj7dQcXQzs/v4SOLCkS8Vu+
         EHgg==
X-Forwarded-Encrypted: i=1; AHgh+Roq4cepYYU9IhX0EIkS8siPX2nBcLt1NQgJ0PklfU+hYTGHNPtfy/Z3w/VDPyig9owtzmn5j5Er2gXSP+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lipCQ+4edXM5cWBUzkdCdcgEZuUGJEV1UG/zDGG7GhmhQO61JD
	85k0e9jy3NosrYHd+ZLm44rYepogMOYb2ZGE77svN+Pvx3lSrUtjanZcq459i3BTVxAdot0nJEo
	oe03dyWN/rpB/JRyhX6b9mhC1xSFjQdRIE2EUOWF1xboDm+hySYG3QUtQ7Yw44ilkOg==
X-Gm-Gg: AR+sD13pMYcTln8F3NWTBivtpFqdS3lA9plM6DjFsnQAu5bwbSjmhGDCn8tkbTgGrZA
	yksdFB9tP8FcNll1KXO2x+axhMjRdCQTsAZIUfE2T1uUmwRzF4/6rlbZBFCsPDplWda/W6EFjWe
	0b7jwnOgiWsZHk9xWwFbP2x3s2RmQJoU+GJ/gLAEMwcnK/QRJ9AnGSUTSZqz5N0w5+9oFqAiVT+
	uVvFH+DraIch0aMy8XGJHMGGj01mzoemRh4Pb42/hzfy7D5z8lAhjSokHh5NxQy2+a5xps2WVq7
	Ko5nO/KpzmQzlPUST9m4GP6Hkf8ZbWtz/CYAVgjsYkTfjGtsrWbRv65Vd2Mo6fdPZVXi3f6azCR
	jXVIRv7mHQXSCafBkrhpzapaFAZCyscyGPD6oFISHfg==
X-Received: by 2002:a17:90b:1dce:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3966d3e1cfdmr21940246a91.10.1787789424344;
        Wed, 26 Aug 2026 17:10:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1dce:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3966d3e1cfdmr21940059a91.10.1787789423479;
        Wed, 26 Aug 2026 17:10:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm12020839eec.28.2026.08.26.17.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 17:10:22 -0700 (PDT)
Message-ID: <996cd400-44e2-4b4a-8286-1235c3248750@redhat.com>
Date: Thu, 27 Aug 2026 10:10:13 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-13-andre.przywara@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260807105451.3728284-13-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 8:54 PM, Andre Przywara wrote:
> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> 
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com> # on Arm AGI CPU
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 112 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_fb.c       |  41 ++++++++++++
>   drivers/resctrl/mpam_internal.h |   2 +
>   3 files changed, 153 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

