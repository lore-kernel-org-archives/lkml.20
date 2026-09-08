Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2261DDFE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843810; cv=pass; b=CzWE0GDOOVLHYW9rYp4J1KX4+XN6DZckdb1I+w0MCYdwTIlTyiGQJJrPYO1txIXtZ8EOU91QQzKXRK0q0lcekBdMziTM2fDAbZ8S+s8hcR1QywbJCKjgiCFEiNduJvxCBOyKBN63exUYNKL2MM+oXd8k/cqR6vzkKnppedj8TI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843810; c=relaxed/simple;
	bh=wHWLl+AY+6R9gF+WQK0aNUVqFTeT2mAxVsrGGjIIecU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOxZLhSfxyI0t8Ay9fAILOFkbXQfWjCuQUHSZTBRKAXaX6Xs6K1WqP+/5mmim8FY02oDmDJjx3u0AstQGBKVdqQD1crfE3Q59LKF+gt6sVmEJB4FcRr0ngN+Qe58YxMhkVo/ddU1D1BKFfLLSsYZ2xGicfmTLq9KUelPTZ7soIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MafPXygO; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MafPXygO"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309c3e17b2so95091cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788843808; cv=none;
        d=google.com; s=arc-20260327;
        b=dxUMYql5Bi0atpiS9du1EMEHLBrxNNkfZkUS0msh12O6SZtg9ZhlFAtBPT6pUBIc+o
         Jc0RE3lPJtPUEOibFNI21DjfqXEobo2jXxi3fBNKptBYd4AIpkPs4jLGxQHQBB7uuths
         ATfvkv1JdGkhMBXMZ9LeLCSrfVOG5Rk9r2R2m5CPbkvU5wKKe4d7hbzey37D/oUN44Ud
         SDpT7p+6D0BrRraehw99iGFwawQP8hnDPMrqwP3x4XumbvyNrfNx+pnd3mnMSMo/zU6Z
         dSFAv80fdwmxDSp8EinKaFCNn7ZzK5Ez1TbQud5sLiKiwYZTsN9I7fzAJh7YmwJVWc1M
         rKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wHWLl+AY+6R9gF+WQK0aNUVqFTeT2mAxVsrGGjIIecU=;
        fh=BTGfUOpR1OWeezIFYnJFr+bRVN/XRufVKunkqFIv9js=;
        b=S13TJsJKin/Qo9YsF5xCjMQL6wfBI9sYoWaVzvUtUwgnHTgtBd6yN6PDHdxHWSkEHv
         z8eMksxx53n1xjIZPn9Sto0xiPj1Ryifl+vfSoc//b5gqzcG4Z3agetVhG67FI1tiNiQ
         In8UXGf75YLfdt8zS+R0LUv7EKLSB5knRukBM/aGPLoFMggvlrHvKeT+SyFGwQG+3C9x
         EIv3ZGxc4qLp6d3pEuByIGhPmdON3Po/ORlWQCWNL+7m+IA+LD+Pn0uUiZegH/HNsa4C
         yoZnHnF/5YTfslRhn1aKKsltNMRiv6udkGmd2PbTmQvQ7zTnEtAPbz5/VKz5agrjJ5JQ
         dkUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788843808; x=1789448608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHWLl+AY+6R9gF+WQK0aNUVqFTeT2mAxVsrGGjIIecU=;
        b=MafPXygOggzgL6Cp43d4LlI8CyduSVRo85xvv3o/BBGszS5248f1ZyV7+1jHEtDDJb
         Cel3WGCgfQ1RDe+ue2IY6udd+HDA8k+w21ESK1go8dBRhC84HfOFTWyBXJlnEtwgjfyh
         YMmshhgoYgL5tjHwZDyj175121014PZgA0p1I/G3XcNOAB8G0HblmtfNWCMFchc2kIVf
         CENpPl4irCEIzZbXYsoy/QML4PPzY2wmoZutCjQifjxxOpY/V7zRhCw8DgcqwDaYevfI
         UaGyanNSXJSnMF/wIWDVfL0XeE0MVOXZZ4Le+comD97PEKwtwJ+OrGmjqHAgD0Z7c7SY
         Tt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843808; x=1789448608;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wHWLl+AY+6R9gF+WQK0aNUVqFTeT2mAxVsrGGjIIecU=;
        b=d7+2/HpHVQR3obxZ2tb0BXcQgA+2PxKRNM6g5blhQNj3JKSkw7KgxS5vljypKICD1K
         jRI/HQ8pSWW+parfUpUAiy+muEbyZxVMtSXn20EK5iaQEe2p0znauMMqUI5G003K+93j
         +CdtRJcs8rXqLm63+nB21f9ydcxXCJoWTRUz9HT+AI4hlcMlnKoPF45/0/AzzMm8058V
         yMgGCNzdZPP6OJagdO075hD9SjFf94CcpNpamb/FMuMRFQscNKQew8DZDmi+9VS4gPD1
         Fueg566ZqFj0RxTJIQ/HXXJYBoF+lHTowpdLEdgHZvLuQryN3soe9NMvoLiyYntk4y+9
         BJAw==
X-Forwarded-Encrypted: i=1; AKwUvBw+eYnnEukEXWRGB7d7145NJ/yPXP5ZHfab7w9HPes2LLcMUCERwVMn6ESL6pS9llNV0cXlCPccgreCpBs=@vger.kernel.org
X-Gm-Message-State: AFuF++n1hvzIfZxK6UG4mmJtfiRNo2lr0FCLxX3sX6V1xFs4OKjt/wcM
	XfJVdmIL4ZpMYqcNCH+soqpYCPxb/ZYjx2Qvq2b9U1V0pU3aOIf7S/s5AhXVuVkMBncQChv9owu
	/Z1EdJXt+6vLzlzaCmoZsLl8uBYgiXI/waQZ3
X-Gm-Gg: AYBFou06/+uXpbY946ZsR4aXLANhjCzdg/ijrLZzOW8NefNq0mjX2SLKsNkgy1jHOrR
	9TRjy89+fnGm4HrnUvbJmLbswtKFDHldsa1TPC7MBM7aPXK5OecyT1aOSrJObGg9bAG6UPmCXPn
	39qvDasfv/bv4S1iOa2ffbQibAKTZGVgCBtee1aJTW2YpswW20NiXzkJclzzMzpWxyYgQyc2Z0U
	ZGYRBXmOPRSVYjwnnzwMumFQXaMEGtKyRRP/O4n2eVN61qOwIowl3WHRnHStgOJbxFMgNbOfog4
	Z/qGBrsTyQQI16rdiSmqQLSl9OW46wEUUd7M8bY9fJBMV6hYUlVakERlZqYqDojICZUqtMS7GGA
	a4/BDTiSSbA+1ps+8da3pnfVei2E9Kg==
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id
 d75a77b69052e-53064575926mr179500891cf.2.1788843807729; Mon, 07 Sep 2026
 22:03:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 00:03:25 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 00:03:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: miguelgarciaroman8@gmail.com
In-Reply-To: <2026-09-07-daily-reply-0019-aiptek-6-1@kernel.org>
References: <20260907184959.1567893-1-miguelgarciaroman8@gmail.com> <2026-09-07-daily-reply-0019-aiptek-6-1@kernel.org>
Date: Tue, 8 Sep 2026 00:03:25 -0500
X-Gm-Features: AcwNN1UHSRkRqX6Cchn0eyhtuQvh9SJQvknSWUvMUSQpGO_lX_JnVov7isf2EqQ
Message-ID: <CABKbRoJKpLe+mhv3VdTxdce+HDfVBggvJgAeCkJ+Us2Hi3QVXA@mail.gmail.com>
Subject: Re: [PATCH 6.1.y] Input: aiptek - validate raw macro indices before
 updating state
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, dmitry.torokhov@gmail.com, 
	gregkh@linuxfoundation.org, pengpeng@iscas.ac.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Signed-off-by, can you confirm your relationship to this submission (sending on
> Pengpeng's/Dmitry's behalf, or an independent resubmission)?

This is an independent submission for stable, not on their behalf.
Pengpeng is the author, with Dmitry's adjustment. I forwarded the upstream
patch unchanged and added my Signed-off-by as the stable submitter.

Thanks,
Miguel
