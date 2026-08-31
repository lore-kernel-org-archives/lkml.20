Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2785C3C2786
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788149714; cv=none; b=jIMX16gdV/CoR/8ghQ4VFO9FNsOwQolnhWW+qINHuuoqADAi33kevoa6Q7k6cf2g/Edsv6uMlk6DGT6BixdQc/CilEIZC2j4EMpcR4oiffZYUokj/kbx85yA5l6NxPEEn+L243FJo1RrahHZy2+OMgsl3iwda7EL1ke10jUl0hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788149714; c=relaxed/simple;
	bh=JWo7qptpEQzm5VHboo67cAi1vsGRFcq3ubh3+dfJsWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjwAJ+7TT9eT773OAeQ6+KrMckV9Lh0n7mwUUE/vhRNGF1DGZbqitxjp+KngKAb4Cq1jfqlVLh/MTS/7Eu1O0s/a/jjFI2VKGq+wbET6t6I+9vHzUp5xtJvBjUgReR6i+tNpGH6CKWJ5JkemN2R965MamNQ1PVZgUJL57UbHlII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JsSdJZpG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JsSdJZpG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d5335cf904so28550585ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788149711; x=1788754511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sf/yHYtrO3MQh0Uz1YqiTDYHxqYrBGeKFLdYV/NPx7E=;
        b=JsSdJZpGdCeI2ltUaUM/Rk32oLibhNj1jwKI23MgiLnDLnVQA0FjFNnwIW1vb4+Qjj
         p8dga2++saDpM81nzNBIEHsiyAkdH+grOTDWaOr+6eGawBQNxTlAujEAwfqwn+bZCfYt
         +x53SdIj1TRS0OKrRvxqaRlRisCmQfaFlz7k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788149711; x=1788754511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sf/yHYtrO3MQh0Uz1YqiTDYHxqYrBGeKFLdYV/NPx7E=;
        b=mcyrFZ0ESpzesA4dI16K1AdypaloYEOpylDwGkc2EKzSBHaF4Q7UQ2HUgIlNICk/Y5
         7QVgYKGSBHKeOPWPaBUt0etoQDpnS9kn2hIA5AbpK41kyCzHz3T9fr6fOKJ4qSinLEqm
         F3XGUtRYyY8mOcRzvXBX4sHJnAtqLIb7eA2dihNhbWtfxKL6S31snD6C3hoCE9s1vA2W
         wowVSb2GGWPUh/UbVb77uv6CQRmxBxCi3OUdwz3h4wNeXKhZUqMO+CmdK0RMybQCtq+9
         ljjp2l1fJicoRwbbVB2NGt0o0YsLgf2z1lVdBoBhfhdbrq6X6sJxBvD0lKJ8qT+gHat1
         WowA==
X-Forwarded-Encrypted: i=1; AKwUvBy4dUDx3Lk8rGhH9troHD7qVzKiSHmo3QeALbBeyne3sEW5BY9V6L1f1d+0JbwtX4vCget3dOOe1gHsCj8=@vger.kernel.org
X-Gm-Message-State: AFuF++n7iTJqlWXVLXr18Ts6IVRFJM7C6lRc8+HetkHkFHN1PTHenUan
	TGzTxVa6cjX5z66dS5xoehWeeEYZozddjLdNnmy1oGPAb+7ruY5uUEFa4hJmcL8LdA==
X-Gm-Gg: AYBFou3F0doPLC360EaptKaYCEzeWJfuzJtbPOdp6mr9Ee8/62sWKp9KT1qQg6K8Bgy
	6DBFYTmlLQvm8PQzfEk1oZaL86gQ/dvWK3X2D8aHvHpZKIep6efXKHAcbx2uvuThbOjLsx8cpAt
	jlyyFDuMen+niDWRyMeN3jy0m4jzXZeI6S40HukCeLcpNDvkR3vCeHoDs2E5xtlFKOjRr9YO6v5
	+1CAJNFFGEPmrCAiHW5TeeFLp+4xJtCm8DuUrfznMh4edB7JEFjBMkWr+Lssp4h5DqopF+Y/5/A
	9lNiP8DCd+VKGaBAGCcblC9uI70s8FHS0WxgsJu6IQb4Iq2LLFU8KCivKoU7LE1uN+KFgOPzSdf
	FXhMgG7AX7bTQXkMWC04xJMNGICKMSm1OsaXXVdwWvKif9ipVb1FL6p7e8MHt0MBeAU/mZngkyR
	yb2iO6O9V1pFtUe1CM1iTzKrybh+ua05xcmHK+M0eea4F7mOC3QvsJ9/bLchoQ1GuLg9faxJCgn
	73LTzCTxigD7f7KoSlq6RBc+vHc
X-Received: by 2002:a17:903:3d07:b0:2d8:d4d7:f055 with SMTP id d9443c01a7336-2d93fa78359mr10662945ad.22.1788149711457;
        Sun, 30 Aug 2026 21:15:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:6c22:caaa:530b:455d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b6fcsm28017105ad.56.2026.08.30.21.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:15:10 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:15:06 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, minchan@kernel.org, 
	senozhatsky@chromium.org, axboe@kernel.dk, bgeffon@google.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] zram: fix idle age_sec underflow in idle_store()
Message-ID: <apT-ocFYDmU6iC-j@google.com>
References: <20260828083149.45760-1-jiahao.kernel@gmail.com>
 <20260828102446.3eb7f3dc779753b831e33fe6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828102446.3eb7f3dc779753b831e33fe6@linux-foundation.org>

On (26/08/28 10:24), Andrew Morton wrote:
> On Fri, 28 Aug 2026 16:31:49 +0800 Hao Jia <jiahao.kernel@gmail.com> wrote:
[..]
> 
> Thanks.  Sashiko asked a couple of questions about this change:
> 	https://sashiko.dev/#/patchset/20260828083149.45760-1-jiahao.kernel@gmail.com


> Does this early return prevent marking valid boot-time pages as idle?
> When a page is accessed during the first second of system boot, its ac_time
> would be 0.

There is no possibility for zram to hold pages during first second of
system boot, regardless of whether zram was configured as a swap device
or as a block device (mount-ed with real filesystem).


> Can the early return above bypass this zram device initialization check?

We already do that, e.g. when kstrtouint(buf, 0, &age_sec) fails.  Apart
from that, that's not how one checks if device was initialized.  We may
want to consolidate those checks, just for symmetry.
