Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715808;
	b=Xq0zj4z/aP0gs7Oruj4mw8h7evHdzwSxWStSf9Jz1v2WjoV1D+XUpEkr2pHGNLrVJ+ww
	 d65+ZmFK8mBTOGoOiMzvt793PUMyVg5oqDsa3bff0XSrfLZCCO2pHU/7iW69p5TwV1bgA
	 +Ub+PunmMTLLwn1esYQLt1ERFLgZxlIoVlLFnz0nGtU7CJuw0eIpQG9jQkcx5zTMuUN1L
	 22yGvh3FCMrST2xutbBxhEngPgtKIlivKd4XjL/IYZ/gfvGUI1k9OmJ2OWN27ENWhc+Ne
	 2P1tCNU9h9HAoU8BiTJju5BtwH2gh5Qg62f+BpIXZWKvv227aL52gXPfti4isjSSeZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
	b=uZObGUz9WiRpSomTqts1yoRs7y5tt3+O3++Old66DLsUauyfK6ETcFdhDik1Srb7C+A/
	 wfYdBGUAAB9MQJXAeGUMMrAVA91dF0Ujtmun6mWeMMTlWCy/3+u9mdPHUijgokeFpsc/E
	 wzkPZQHeJGoeCDIpgYH8Cp/6TWmoVfzkNkHOL8edz8Y8ryMPImeKlMFcxDjrmZmqZ8Vaf
	 4dqoiFrbaWWJgFcTy04JLodyBDSblZHt6VlFaGgghHyt5Pb+5rJ51yozLQZRi0NWSroP3
	 7hksw/YnglBSZtEV5sVLG49ONB7n/0fOkPriPr9p9R9CN7m54Q8THjdOTxu/f52zdoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/unelNn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB423606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB423606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/unelNn
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso3914568e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715806; cv=none;
        d=google.com; s=arc-20260327;
        b=hKhq6WWWEAWPsXal485tiQ73xx9qFlkHU6GBwP23P11fmPjoSR4B64OA/X9m0ZimZt
         BMAY9YXx41CbY/QEia2WhzgAm+lXb90pN7TwwQUNocu9NZrJSVg1aqIE1BWss/SQvZBA
         txORn4UWQ53Gv4qI8Vez4RdihqzPvZ1xafANcJBAxap+snN4OIpQUM6mny7uv85g8BcR
         g/YQiQK9o5MO507XG0cwGXabxPy/7dme8ON0Ktfzbo9dNKrXWmk6hMYoj8y2I1MX+r7L
         Qnn5WSz5oGnyFKBVkxTnJUpBltynr/NzvSiwQDj97haUDF7oijxJhz5KcmsrA9ZKqc2k
         kXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
        fh=MC52Mi2BTKZbSpTTpgBfwZNLoghPUYVBaeTbgEG0zGs=;
        b=B6fhuneoEtp/+NR0vyE9YxM+1iXQJWc6t4rFzzxiweCQI6PAlrMHOTi92D8JqCOaSp
         L/5Ag4DfHJYMnclWr5Mp/Fq6uQVZHPsoI75VxIoFMsBPE8j2rkGcHMemnovVR0vgm4pC
         M/s6+ridHt5VDxjbBEmWBLyBo/3CuodEqtLAcqdPRDFpuS+HqPRd9LqTpGxmtJbKg5Rr
         sbbvFc7umg8GMlV0m9rCwlFTa0AsLvf2e0xGHOkkbtL/GMFwcWii0E+PwClLJlloSGy5
         e4qgnlKJqUHxJSRWiGNhjxsiam217a4rN6iaAnbVNEhQ9pIVIhOZehsFEV/J7lmsfmN+
         T1Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715806; x=1794320606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
        b=J/unelNnXlS41STwOvKArtHOPDj7Di5X2HM32zIS9I8Fi9w4BOTSrEdO1CJN8Mt/tz
         MXc5jt+3s1X3rCFP7EYsa8iGxfqk/YEseRK/m96bIveDGs9aBEyMGIOgphYpvNOtNbDM
         sgylqNQninHdiOxkZP/IxMsKg8f3o1JDHhFyElLQsYpn6RONjYAFpvthV/EosYG9DoGI
         IAC+a6s3MLZde8bso57/P04Sncz34d4uht4LEJ+zDnlIdyPjuARiokeM7rV97D849/HA
         odDnTtOCJZ15yt+7Ec2VmphNva4T3cMcd0yQv6RVoSC6W62xtVMs9s1bOozaQ//iDuNv
         JEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715806; x=1794320606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
        b=PDRHpctZyANMUVttxu92ukCZ/HdJ0uK4FJmDwpn0JwWCcy7nGruI8WVFpGE6tS37xy
         AHA70739IWmoqgbXdhINAInR0M1fzwmN3sydwmlA8OydQlKrueiEGkmk6RwPJBXYSYJE
         6W1wpz9Z4iUwLz4Vq/PqXd7VSNr8FzF9MpukMDh74smZAJmBIY87RVl3XSc5/suXqp3b
         eebyRv3gO81tzAF/HeZhAU3ad6KOEyd4Cbp3puHKHJGgfGQ0hVfEhDyE86J4wkEKd48L
         8Y+OjeS+kiLvU61R502knF8Pl5CTuJvr8b08pWeQkyC1XsifH2gPWU8OYk5RXmsvds82
         w7Kg==
X-Forwarded-Encrypted: i=1; AKwUvByj869V96Qo2OdD7K/vPFseD/sbX82SYzW/LoHwsRcMevQmIJTIbDRCHXPKQrSv4e6zXZpIPpPZKrqAmo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N+56K0B+33rwaarQgtjW4QWZjHjdjMkSdtdovXM4UfkWYjlQ3
	HA3PYKBS/GyAQ2vTHwwxWbhHt5fmXFFG2ajQjma6vXN5wNQ8gx/E7oJStJ42tkXwk8yZ+LiB2G3
	MO4v3eQMEjEJGQ/mvbPj5wDcgsAnFukA=
X-Gm-Gg: AYBFou1JMIz+qMecr+m7mrw7NtrvkHzGx3U4iJQbVrHDt1qOWssA8yi+uhSnDVJfOHk
	WX3VIGqFu1dzmam/1Lh2WZkNm4oeB6IFqI3QRut1j0bpRP3D2Yc/P6dD2zwRCh7hxflFdv6KyDr
	QfSaWNlqEgcLpOFf/wOshZXSDhGQXHZpx4bRSeeBvKE28VG+tSAmOkBAm0SmR0LyZOTCtRtrXGI
	ihGTGwJVjQcREyv5fqKpJ0tNBh1nskVsbemgmCY7UAvjxcbizKm11Se9X1Pza63Hjr64A40FZgt
	qtOa0usAyJMZ/WZt6H66nkVXVju00Hwamj5EZ4X09ofiZ2ADCOsHu+Jh9mjpKimRSpCHinmRPeP
	tH279OjQA61k0S2vSmJGWSzHKkBl8ovPcwIT9q4N9lH+SzfVri5lsnDX3zPzNlxjTsV3OLzLJjX
	5NeWoSr2uQXRFpN/rzThEsmBbErYugRkJpQp6yOhhNIRYEU9UQkAdFl6yJhhO1Y47gmPh9F3bQq
	5YD+TIoWuo2sqe2M1Z3hxI=
X-Received: by 2002:a05:6512:3402:b0:5be:5409:3886 with SMTP id
 2adb3069b0e04-5bfd95791eamr4374297e87.49.1793715805365; Tue, 03 Nov 2026
 06:23:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103121716.102730-2-manuelebnerli@mailbox.org>
In-Reply-To: <20261103121716.102730-2-manuelebnerli@mailbox.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:23:11 -0300
X-Gm-Features: AclHuK-VDs-Z0So0fxDRqULrC_8-8BejpNW7-paqqdaT-hr4vP9Unej-j5TEqWI
Message-ID: <CAMAsx6ehPnWBEb=6=j0pEUoPWj=kDYNK61XaJVGDtR2WbEEw9Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: exception-tables.rst: fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 3 de nov. de 2026 =C3=A0s 11:10, Manuel Ebner
<manuelebnerli@mailbox.org> escreveu:
>
> Remove needless pair of brackets.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
