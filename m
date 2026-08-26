Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AAB24DD17
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781711; cv=none; b=rUiyhNgvHqnRbH9XUhJemXa0bM6AncggEIOPrfy+IXcRn1oONQRjeQjV7Oi8xkRf7qi2GXWjyJKPo+E7Jp9vbM9eM7Fr8w++edGfm3OrBC14p6lN3N4g+LHsFzjhNgVkasX09iT/LtyvK3asWOK5UtvQkWIdEZFbtRs+OiDM6cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781711; c=relaxed/simple;
	bh=1ZaRLjJ/+BY5gxM8qZ0ipOhr+Q1mZ/QdBn2WHK0wf+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhWrV5xx9KYX8zAd8vGSV8hsvqDk6xL6vJ76U0zABepnlJwHh1DWOZk2d53LSFgB2zx7YHPCiURBkDkrhmMKSFKAptQ6GhfUQAKLel3/C6FGkqL+65IFDgN1sWrAIbaDiIK24h2y4Roa9fepKGMJ7493ZSGgh6IukrJnKXLmS1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=aDEyCT6U; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="aDEyCT6U"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52f1a320162so375021cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787781709; x=1788386509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qh7ZIJ3flIkW8UsNA9B9WHVstOgi6/sjKnlY9QHolSI=;
        b=aDEyCT6UHMowmQRBejdiOetNShjQcqbJjiz74Um8UAhS8HUQHvHSTBYnnWnLXka2Jd
         ZNVe6Ly+GLZ82/ReGHuzjLSFOWnHh8guMq+lvmsDC0qyeeomiPHFoR/sE+LTGJnbD7cd
         mGJGjPDsAKh75ip7Ex6Hd6zFovfSlf0n7Xms/8C998qRkI6+1ndjR8tUnnQBMwxRW31X
         wNXVmXB7t9lRINg0APQLjiSrL7sbNJDJq4vJr4gk8+5lgMtdHRO0653OVaLnRmuopD7Z
         rpuTlFLRc2YlXFcO4bYushDJ1uwscvhVfGeKmtDGkMH7BNMEKKAhW3odmNJeSccg2HTe
         7fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781709; x=1788386509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qh7ZIJ3flIkW8UsNA9B9WHVstOgi6/sjKnlY9QHolSI=;
        b=k5c80iwTMQk8JDF1mQgkbX8Ynsj0uixnbrRQr7GEn8WSqsHL3hMyoR6YTM9UYEkAgY
         GQFVmITmx87BDCCIrTp2BRs0toaX1q7t8YanRxWZFhx1URe/eicO4XxdZEtrbXGOTTgV
         SHQ0uowPxCT4Fv1FDSCNXLVwVpilGS5MY4zlDT2oVAEDR9v5B4Pn37lStzYxa2vVF7jY
         PNp7fxZ5yKw8JPzT1LjfOUiIkcl5eUdZuMGN8wnHv5GeNJN0oJJNUpEdDd9oyq3lD3ww
         Nzi9+jZLFWzzVR6deny4AyA8pAELDL8RGBo1lZDve4FWYzbooKJaawt6rlzndka0i+0X
         0sNg==
X-Forwarded-Encrypted: i=1; AHgh+Rpy+WH0OyrcBVWBZXY7tXIwR3nH1Qd4ZuxpzOv9E5dyT6r9EPgrNjwM5EwViLniwLGW7Hu39HoIj4PCch4=@vger.kernel.org
X-Gm-Message-State: AFuF++lGbU86L3VQWVE1Z4mi3RGkbgeBBXEU15CSuik3lAMnBByO4fGb
	KekzQwSjCGb92X65kZvMJX7UIzm29mXQ2gmdgwYriYxmccy+2gbKkMmnGglLz0ZoIJM=
X-Gm-Gg: AR+sD114kv1Srl1N8jLK8gIAdpo/aeQX59Dk5bzkiNx1lDtt1N5v/ORCcjS3FmM11Cn
	YagLa5UHYa6Rq1ePh0PEf7M79eHs9ngSiWEqAfHRADMIRmQcjheBMry51i30vaKl9gN4ObdLE4O
	L5jsi0RjI5WcFPkXrBbXsJd3VCT2YHRzh98loJwTH1d2FAktpVAOHemdVn0ElvR+PdWBEzEIy4e
	3fdctlEWYu1j4gtDqtUfqQpglXD2p6nsCjh1MdmTMhvVgKhk/wxIuBQLjrGc+zonb3TyNcuixsO
	NfvYQ6H8WTTuY2kWNPpHjcLH23exx4ZO3PoHwGSkPddUzPYl5Exa3Ql2yH3r3lqMFW96h6KNwof
	bQrOu6tBTAQZi++V0fm6Z0FHldkflc9QVQzMbNp0J1OWf9kyH7shUkBPdPyjtqpTVrgrjpqqJcz
	Hbqw60UKjY0TwTOFSXlPFSVxQA4uJGqZJUVfZ0o9CJHWSnDEiExghbPXB/fe2ZgizonANDZ7BFD
	VKOTwldPP/x2UV/5ANFK1FbQVHMT0fKowU4rv0ksDXG
X-Received: by 2002:ac8:5c85:0:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52e4223425amr120036291cf.2.1787781709323;
        Wed, 26 Aug 2026 15:01:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e427693c3sm25202981cf.26.2026.08.26.15.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:01:46 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:01:43 -0400
From: Gregory Price <gourry@gourry.net>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Rama Krishna Katta <ramakrishna.katta@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Gregory Price <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/syscall_user_dispatch: Skip benchmark if
 SUD is unsupported
Message-ID: <ao9iIVH5Zn5FvSMZ@gourry-fedora-PF4VCD3F>
References: <cover.1786965107.git.christian.loehle@arm.com>
 <7f6caf7adeefaac0e57bb06d194b36795f2888bc.1786965107.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6caf7adeefaac0e57bb06d194b36795f2888bc.1786965107.git.christian.loehle@arm.com>

On Mon, Aug 17, 2026 at 12:16:11PM +0100, Christian Loehle wrote:
> Syscall User Dispatch is unavailable on architectures without generic
> syscall entry. On such architectures, sud_benchmark spends several
> seconds calibrating before its SUD prctl fails with EINVAL.
> 
> Probe SUD with a valid disabled configuration before calibration and skip
> when the kernel returns EINVAL. Treat other probe errors as failures and
> continue to run the benchmark unchanged on supported kernels.
> 
> Fixes: d87ae0fa21c2 ("selftests: Add benchmark for syscall user dispatch")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>


Reviewed-by: Gregory Price (Meta) <gourry@gourry.net> 

