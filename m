Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C591348C76
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292584; cv=none; b=JHdK40FQLZFNNCHqCQzkxs10ammTNwsHM+bQnNXaMDrXDAQnfKOZKv4qxdWcqoHlN4qXO0860RTOdsm3rLASqBdN4OJCaxdzORp3QM1CgC/pzFj46dYPCLQWMH/eJ21rVU4iR+J7oEn6sbwUNB3s6POkRUaRs4Yk+bG51JFAFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292584; c=relaxed/simple;
	bh=ZITNZtXI1LEVNcddldEtZUUMUQQr3d4n2wmhbo8gnjI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WAGfATgJMFKjiHSMCHlTXQbNQyTFL4TypzEwS8n9D/eYm5E4uV+SejZHQy64w+d92g4AstW+H7wL1Rz0B76QrvE2MQe+J/wGflRyz5fr7TRoi0wz241ah250//lld8Myc6LkvHMJlgVpAfmueX2UmETpEIhDGyWOQTl0Tbz4bJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lklahw+m; arc=none smtp.client-ip=74.125.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lklahw+m"
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35c95a3a303so150554eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792292582; x=1792897382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=itgPlMiyJa1Z48u7pjVt4mWiUxVb/1ebtQBcGmzhbn0=;
        b=Lklahw+mVnpE8c+d6IMoubwHA/yZiwgoAJL3aE5evl5WWs0eGtnjunpVm8Nhuk82E+
         3JClLd4ep9kGmQztqp7HMuDoMGBjc6TLpkp2H/fc7mePB4kwGKj0zDfFRQSYqT/UK7LC
         U3y1+7LWxdL/GrRrDfj1tCVUSm+2igM8H+fm0aksQNE3Ne/cuvek1dxwqKKnaZQsVyx5
         hwKSsey99D7FnF9LSCJhTWHVCM5QMr1QLccUw4G2KxXieVqzFh1bIrAIkb8czKIYXVXc
         tpPmtYrHL8Yt5XjzY5EBjXxkfltD1uCk9wqeZXdMtnHqFR04uEaz+Ky9tMDPoBELr/9d
         XNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292582; x=1792897382;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itgPlMiyJa1Z48u7pjVt4mWiUxVb/1ebtQBcGmzhbn0=;
        b=MyhgOvtaGw0d6ItYLLBMD+la7+nPCARXFOfBe4xAKFJyJVth/+2LTR476JM1+dcpeP
         VTJalpgv6oCFp7BaEM/zORS9eJuV24jSK2pm0trPOM89utQPYz4CP7Z5WkcvW6MZwG+z
         vDDjst0majAq3FQjpvmLUfD1mNoZ7HExdHc3U/WOz0OUmlv+AFLibisZxGXFL+6jeT3o
         OuTInyXYpm3lzjIKbDcT5AH77TjQDeL/frVsXKNB2MWUMFs0pxCVkl2kOsV46LN65J90
         RY1VbUyO1xMn+Njx6IVSEXQid0/hmUHQaEjfssju0ssEC1ZN3QcLccC+kDjJbyHgKGvR
         UhMw==
X-Forwarded-Encrypted: i=1; AKwUvByp+BsXlHK2SQE7DFdQjMGSCyVSeuMV/ZUoXixUSpGxCNUNU/BAEd/MveUsNQJSKYgtLTAXPFTI8Nec4S0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6dgBfjX0qY/DRFVIBysR8l1T+c8ITr0s2DZgDdp/4tco6qh7Y
	RgWPIsvGExtggbo6chovflC51+epMZvJPmEO97HNJmE8JcQYRh8MEq6x
X-Gm-Gg: AYBFou0VwoUjE1PdUKVhEnBFcIwHi5nuT5G3BzW1zaXn+zv4kr/G2WZo8M3Ys0pjhXD
	iq2Sncf32q8xJA4DdxckQtqyPAZjqdsm4u4leB4ojFUtYwukaUtVsUgx5GffLbMM3/zKbw4h38k
	QHEn4jZ1DpZJuezlQx4b+N6wCN0vLtaBdeKhZNu1tAFVdUFV0StMlH5or0P6py5kWVStmeFZ9+U
	b2UyjOOaQtK8XFdyIhb86R5SD4zQq2RMtlbnvi6bxuuhMcYq7L/E5S9BjAFiSGJybMPrIGuiDRA
	rNhPU3dxsY5ElGeZPzWGzcHSUw+VzzBiaCbCJ7iTAxQJfL/x+hVTf/w35lnWMmfq8eTbwZ1GX1p
	mosYuNytLx3gZk8XWHPQu17Ym03W5eaim/hx1n8opnxMYIJxepGUR5rk7ahWq8GoxyHgJeUBJ1e
	en0zbkLqz0yVU0EbtD5jjLQthIe90/iNbzHu+mpzQK1ZCI7qHc0ggP5KUMGfsgtWeiIL66vv5wd
	/hprLHXKg1Q4aMRoI0uptUHnwVANotp15+ISCmKSlk+yKSw46cy
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr5923201eec.7.1792292582456;
        Sat, 17 Oct 2026 20:03:02 -0700 (PDT)
Received: from ?IPV6:2607:f598:b3da:60:e5a8:1520:7d4c:f121? ([2607:f598:b3da:60:e5a8:1520:7d4c:f121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm20383250eec.1.2026.10.17.20.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 20:03:02 -0700 (PDT)
Message-ID: <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
Date: Sat, 17 Oct 2026 20:03:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bozhen Peng <bozhenpeng93@gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only expose kb_mode when
 it is supported
To: Anton Karasev <uselessfire@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, qby140326@gmail.com, ilya.gladyshev@linux.dev,
 chris@miget.com, kento@kekto.ru, wolf109909@outlook.com,
 vlku.milos.fun@gmail.com, btx342@gmail.com, zsanya322@gmail.com,
 i@rsplwe.com, martiya.ar@gmail.com, nika@nikableh.moe
References: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
Content-Language: en-US
In-Reply-To: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Anton,

I tested your patch as posted on my MECHREVO WUJIE15 PRO
(WUJIE15 Series-HPT), using your stated for-next base: 

98f039265e580291d5e76a11b2072541fbb1c393

I booted the baseline and then the same kernel with only your patch
applied. On the baseline, kb_mode was present, but reading it returned
"Input/output error". With your patch, kb_mode was absent and I got:

  kb_mode not supported (-5), hiding it

The GET produces an ACPI AE_NOT_FOUND for HEC.LEDM on this machine.
With your patch, the probe still reports the ACPI error, 
but kb_mode is correctly hidden.

I cycled the keyboard backlight with Fn+F7 from off through levels
1, 2 and 3, then back to off. All levels worked. During this check,
atkbd logged unknown scancode 0xf6 messages.

This confirms the unsupported-kb_mode case on HPT. My keyboard backlight
is not RGB, so I didn't tested the supported RGB-mode case.

Tested-by: Bozhen Peng <bozhenpeng93@gmail.com>

Thanks,
Bozhen
