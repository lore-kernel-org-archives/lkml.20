Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C3D48FF9D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055794; cv=none; b=RTArMXoFMps8ygoxjG1zAd4CX7FfO+EjPNCiNMr+osvQ/eJ40F5169sAQejoZjLAheFKY7LIHQ6TZgsaryxp8jtqmI7hWZ/P7Vu3qgbfjeMrDkKOsyypuQ4rM9p8/EIsAGCba5rdje9bBX0ViVOM2csA1ozRRGT2CRNDheCfqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055794; c=relaxed/simple;
	bh=onLoIFbxGYgNENpzYwBeL4lKyCZZ/6Q+11sfK9OAB+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtRaHglfLcstZ1qJmT1tbToX5QC265Z8QOYsNpP0n+Gv9nk8Qeu8fGio4rXSPePerZb5+ISY73mZZ9dJmkEVFDOdr+Zt4xYk0DxQMPweIy0wpBd8erqMjgcpwMlVP36xXdFSXJ1MSwqg+iPmUjJBLCMPvNBGfPfNPPHWqnv52gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVcvzB/m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mOzIFdJm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVcvzB/m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mOzIFdJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehNp1JTVt6t81etN8BHSi1b5yH/BNSAqQ2MBfVgapJo=;
	b=AVcvzB/mOPE830eFKobV3i4HASsNzgX6Ha8G97pnODzNnGf6VoZNEZJ7i8d7Mp2BrUBCXZ
	ATfZRGCF8PMpcutyqYTg9xoFqUpH3EwP+6Eqqkfdk4dn1eO/6qXWz/ixWeKoqKryO1jbXa
	dlPEA0KGNyNgAjbhdVjQdpVu1hNVE14=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-oPtc_rGHMtmhorRY1DJY0A-1; Tue, 22 Sep 2026 01:43:07 -0400
X-MC-Unique: oPtc_rGHMtmhorRY1DJY0A-1
X-Mimecast-MFC-AGG-ID: oPtc_rGHMtmhorRY1DJY0A_1790055786
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso5098224a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055786; x=1790660586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehNp1JTVt6t81etN8BHSi1b5yH/BNSAqQ2MBfVgapJo=;
        b=mOzIFdJmKxb6IFn9puOeygTxsK7uPd2y9RTgISXgC5LEf2BIuOeqCrPy+7xsTWd+py
         Su/PJX4cWyO/ARGg5SUWL1Kvnhr91PHXRCX4br/28H0d7yxz0Vo5yanErmHdv8LcZYB8
         GYsQPCFa2K7jG0yMC2DJTas1mxNlPI6vIFBYFCVq3eocZwE+dzk+0rYNwLnnST+5RucQ
         Fc9x/O6ZhOp9EB6bye7KobhG/tnwjdRSDh5IiQbAZX+GbHBSPqJM4PZFjNR7o6pvEJ4z
         yEiVr33/MXwH60VvihGd6GiG1R5STsvJF+1yLLA0WyXa/DQomLRnGgfFPjz7iEGXKIIM
         ZtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055786; x=1790660586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehNp1JTVt6t81etN8BHSi1b5yH/BNSAqQ2MBfVgapJo=;
        b=HaprbGcsf4otLdg9WVbW2FITDCjcpYvveWG4k/kLkgGjU3tuQi+BUaVUZL+LZRBFOc
         iD/vKhBRLvvw554iBOeF/kHputD2e7IGA5P6PSkgMMRFQ07g5yDlC2dUsyz2YxrSca/h
         htihYQ9XdmUDKMDUg3RHgox+PEy8kMoAgWDQrqdPwsqJn9PyrNBo/dop8RSBLtzAL4GD
         QM+DtO4V6se/JReze0shn4JRmIG/U6NuSQ+fSaQLCJVldK2izPwgsq+gtinub1Mou2bB
         QYuTEJ/5o2oh3f/oy+S6aCFrEtxEbAKjPrwRZtrFRgM0KqlErmXPpQWPXnhZZEuYkqNB
         C+WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhCVCnhj1MKqA6CSFxhif0kirt5kZrT2skJSCEyY6LGuPnE1llbtXN29v7Vz1kZ+fuJ/qbNkCILENjYGY=@vger.kernel.org
X-Gm-Message-State: AFuF++mzDp7Uea5l0vM8gEgcpMUkCG/cBAXb6Tfg4vgiLWKuK/mIAYtW
	NFDEWIxSax/qfUc8NlzlFIPMvPFB3UHnY0IVgvxXuG4CJH525SZqA3h69wOzluFR/tzG/XTgDim
	ncsWZpxoYhhuaAioArU8dBg6dyRN4g+J050w4YAm4gTFZY37J3/GN8idV63PeetmWb2HVppNBVQ
	==
X-Gm-Gg: AYBFou1neiz57XTJ1hqA3pdzBV8fJ95JJ6vUttyjB/vtIhY/yRJoCuBs87s2rnD8Rpp
	l45hrsH4gBldjzPJffyChk4t0OYSi86Guw42wcp2mXiWtKnsL39UlWy6zrSIJK8vjAoHMm1oQcS
	X0SwSKstzV5VbQ3mkVeltmDFRpLA5dsCMQsmdYE29b/v8cDHKn2iBrZgGchcMmSzsxIYpG+SyTC
	cDo3qdQfNWKHzSjW8w+R462sDJZAXBNSo+y71qCvk/2YlGnDwcgLrNLI9yF7K2aa98GbGpkRGtE
	XdWwrlVKeuHEyISDXN1fiTLbBSEN9faJdY4DSSLfPfDZWIuThSgi7gh64SNOuYRjhlxs8BKVfwG
	skgXZxpf0Eo1wOttm9KdtzOYEy5O7dZe0T45oaHZgNQ==
X-Received: by 2002:a17:90b:4ec8:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a0730d8f30mr84665a91.19.1790055786251;
        Mon, 21 Sep 2026 22:43:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec8:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a0730d8f30mr84648a91.19.1790055785811;
        Mon, 21 Sep 2026 22:43:05 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674c321dsm2592051a91.14.2026.09.21.22.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:43:05 -0700 (PDT)
Message-ID: <729c585e-2977-496f-aa7f-d68d9ccb9162@redhat.com>
Date: Tue, 22 Sep 2026 15:43:00 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] arm_mpam: Ensure MBWU counters are reset on
 restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-6-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-6-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
> zero in mpam_save_mbwu_state(). This is very likely to mean that the config
> will mismatch when restoring and so the monitor will be reset. However, the
> state may have been lost and so there are no guarantees. Ensure the reset
> happens by setting the reset_on_next_read and remove the unnecessary writes
> from mpam_save_mbwu_state().
> 
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
> Changes since v1:
> Use local variable mbwu_state consistently (Shaopeng)
> Only access ris->mbwu_state when have the mon_sel_lock
> ---
>   drivers/resctrl/mpam_devices.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

