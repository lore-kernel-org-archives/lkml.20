Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793114549;
	b=Pjca4Emjg82FoNMs/x06V8+Jv2nFLSIr54YBgWW1nVwXO34QE4ppV5pR7h2nAEgZdzJ/
	 B82oEhXYjcgNJJa6sTt53eICh/53bFJkBiBfTIJ9Y8qSaPgGlxZOowQi4YEenbfwzxWHq
	 IFafAYGHR+HUBuBlZKFuBZfWwkucMOC8ueRuNe7gxASrLmsc1NyoCxQ5V2O3/UtUlgLkg
	 RA6H3Fu9fNwQKJAvikbkm611vN4yoKpxca32UPePxAZ0LEJgJaWqneo5NGiowIjf6E5+r
	 d4lc2HTZWdl/0agT8QEeWyrk34vTNfJoiRNnCRjsq4GaROGqjsepWgq4dzQ5I9cUGSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
	b=LTWzCBDX1jfKI9ny7qqwYMNq6yTWR15olqFZ1ctrlnoecfdHJPIalUPrtGVCi6ZgqN85
	 g2HL0rs3h1J16hrvI9OdIv2L736Qg7eCUXr4noQ72mCurQYQSXQ5HOdOCFRh1xYFMFV0R
	 O+X7teu1EIB2OunmARHz1oSYSGEpSOxTwJp2CxWM/gFXrpgkub2EsxgZTCtWTfkx7Hb9N
	 8t0c0QAzyiLANAU13hAAwMn0Ml306fB/LTKInPHugdN6/ATJX4quIsm5fAOeVvlUcydhY
	 SLMNLa4+0O+9y7epqBMTcKPfg9WZpzNnhdTGffCS78Tiu3zV9c7aUPRwW16Q7oXfXsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSdHnOiB;
	arc=fail smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D905606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D905606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSdHnOiB
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc074a653cso201827137.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114548; cv=none;
        d=google.com; s=arc-20260327;
        b=YyhLZTsz2OfGMO/yk/1u1nFOpoDoOfg7lkdgcBpMhl8JYOuve2X7HZtZi6Buh3ZRSz
         PwUQtkQhYUBMG98hxsiKeIPNEC5SjqIi8FD3+1rJ8fWEccWOs9bjlPxAyvJqaMqlQa8b
         LO1eaYj11gAuEuFet9nOqSEWer8V/FavzlCFYSHuRHvlkXCnjcOBs3ECyqIN/vVNYmTr
         +h+7dsuUC7jDeVd20u8Jwjc9hrTYg9RQXo7sykHd+R/Ztw/QFo+E4iFq63Jf7ENUQGU3
         l+Plkrg5r5jH01UJgLLAONiKBcR8lBfpHX78XqGdyRCP9mDDvsya1Lm0HrwZJobvtRlZ
         qV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
        fh=xHIJI7aRhF4We7+3UZYNjpyrv/My5qWMoR7U+iH8M6g=;
        b=FhBs+pPgA6nYGlxGdafW5VJiz6/H7HQ2blkACBiFBY2H4XvOzwXeQJp7TlC/2fmlc/
         z9axckE3o/21ABedo9njiPy4q01/ZcQGKStTTabCf0BZUXLjAhVtCoACcSEnynNI7uiN
         yh8ei0d9t6c4q7CoyQPHc1LwWn2Nrj7yxzf3YXZWO7JFGbgx+VAV2Ar2J8rsuTiYvMNw
         SvRtSWrK98XuJ7Lqp/9rI75RlIy48fmI8xI0YBgLguBnwfNnMEalTAutKY5CJER9QXhy
         /Z/77nPA+KYRTNnWEl+2QnlkKLy+7RFbPU8I40Cj0rfwbNnOqF8eDbPLGSULKMqplPxO
         WZmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114548; x=1793719348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
        b=rSdHnOiBHVDYoVQv5OsAPIJexs9GauRvr0qVYof54fNCMwrl2UeCsib7ZA3sPyHzg7
         EUmx2RJjAbgsE7vXgiJhaOeAN8ixi10oX9AR609nY7NabtRAsHdKeis97W1Pwf1YPgzi
         5tX3vTUeOHHd2H2V2LkSbI6f2HrGpB2I6Nz6V0T2nOgmMjzr8H4zdbr4FyI3Y5FdGSFY
         60h6IyWEhdSrI79pmztL47iXi7Bwyeqxp1Jxpoa/DTyRSO+JsTWk36Lg0C5INS1td/5r
         Sh/M9+SFnW/UAHqQXXcd58WcS634RkaxyeXMAFAlMKlEiHV+cEWctVBs+lZ/tbx0Qnao
         4nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114548; x=1793719348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
        b=QNtLG8hhUw+EKSKh7XoKMuKEXOIlWyJsHY6l1Kbq2f03/PwUzUwJJQwAOLlN4pKmfY
         xRehouFvlt+Go0i80sBdTgV62Q2rq7+PlDaJPdcypSPnMsL5YWuFJim1OHdK9o634r2o
         6RVYtLFL7KrFhOCDx087MEmTHXy17AfP6B6IfM73wnnDLyd0JUyaSOl18eug8x04a7hP
         sbKnSClsgK78jVdVtrUV4K0qAt10mQJzp+llWVqgIKGpfTqfhBvbpXlrWqNVqB8LfoKC
         88R5pskEYjZsnAIRfhvCUQeOnf0+e1NDR4TLMnnlbvHvEzI5NiJH/4ODUBZDdmwvLZbe
         HmlA==
X-Forwarded-Encrypted: i=1; AKwUvByG0DVJPMpaEjsHKa9gvJShGjbsmNe5Xbysenae2N4yuuq9cbF+xswytQy8RZIJ9JezlDD3mUF8Z1CQWnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJELDDfVhp6qABbna8+vhRJZ9nvUPhVUWhWn3w+YRfLOEB9sgCs
	hn1uT9dNqTO1AeA8jHjvkBpEH+tgLHrNbCiZYiamug/KqvtS1VloA3+8kZTRSjxW79pPwuSwcSh
	0bf7l2OOBuyFbep39bKZZjcH7KlNm0aA=
X-Gm-Gg: AYBFou13BnQaXVqTGYS4dGszdNtLaKABaDnGucVJmeSxX5SbEwOFyGYePmSWXgPxI5p
	/cI6qpGTtuZlkw9xjY17m24M7apB1c6CegVhm4V7W46pPHE1UpXtlh33TLPjsizt6IOcvPFKYM/
	Nft8vH42+0zyGrG45foZmIOc7tX8zC6G+sPpI1apebJ9ZJM0szxoVyU43GZhQcJPphtRrjg4c+F
	pdZKpJOzSPdiQtVOkqadAu6QvMlVmlsfVOjLVQALjkx87n69w9YO1BWY2u9TrZEFu7r33r4uno2
	tEqFOw9ARRQWeGW5EmyWCkV6PxLD6TqvcFrn8472l7FfQK5ITLlnd8G1u3cYxH+8THFWOvWpB9i
	T3AZoCDjKmFW9YHNEolbLRf9V6JYKZpJuxMgNOPGA2P7UC+PyjXR3ZCkRfJcoay00beDNN17oHl
	v7f54DCi2+zcktt9fE4gBQf2E=
X-Received: by 2002:a05:6102:3250:10b0:7cc:174b:f7ca with SMTP id
 ada2fe7eead31-7ce5c6ba0dfmr4003174137.0.1793114548478; Tue, 27 Oct 2026
 08:22:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
 <20261027082913.8002-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261027082913.8002-1-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Oct 2026 11:22:15 -0400
X-Gm-Features: AclHuK-Adz3pXhRznVuw9H0EI3Am4aff3rHKztB_BB4zRj3ojyCoORRQiP8JW0I
Message-ID: <CADnq5_PYSbB-Ges6vVgNcR4ZjYH4TxLZeAShifdV9uuH8swQzA@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/amdgpu: Catch register access while GMUX keeps
 the GPU off
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, bhelgaas@google.com, bp@alien8.de, 
	christian.koenig@amd.com, dave.hansen@linux.intel.com, dev@deq.rocks, 
	dri-devel@lists.freedesktop.org, hansg@kernel.org, harry.wentland@amd.com, 
	hpa@zytor.com, ilpo.jarvinen@linux.intel.com, kenneth.feng@amd.com, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, mingo@redhat.com, 
	platform-driver-x86@vger.kernel.org, simona@ffwll.ch, siqueira@igalia.com, 
	sunpeng.li@amd.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:29=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> > You can drop this.  Nothing about this is GMUX specific.
>
> I agree, but there needs to be another variable. Using pm_runtime_suspend=
ed
> or using any other pm function will not work, as amdgpu_pmops_runtime_res=
ume
> also requires hardware access and even though hardware is accessable by t=
hen
> pm core will show that its runtime suspended.
>

I guess the runpm code doesn't update the status until after
resume/suspend?  If so, call it something like runpm_active.

Alex
