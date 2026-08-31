Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D42931D9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788209877; cv=none; b=lB7WgM9r/dpgh4B19jp0gq2u3zeSyXB2hdNNWLZflu70mL73nrn8D74xC/9askvBk2ZqFrtN03SZCIyGR0Aq8Tmd/r2RbYPWrAvi5A66KO2OG2yeNzUgGnBlsJTAXIsD0VJ7w/9OM7GojjeXYlG1/xPk76FCgPTrkKLWH90828w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788209877; c=relaxed/simple;
	bh=7XhoZc+d+Npz+Cabc3A0TtQ6BwVo5jOIjEe/ClwtPew=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=M9wK/NLVxwXGqtkSprP1sSOXxMCDnlVjQioyZNzHlO/q5pv9rfhuz7ZcTFki7Kh+3OFDyD4tS6XaSHFzFuHJavVZwdEiPiJLD4/kBM20yzY3dD1zSCeBDeTDmC8nrnNWZTAl/4C+b/28YmJ9b9kSCWWdG2WW6d4+vGP4dPkUA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mplP3KI5; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mplP3KI5"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c2a818fc4so39335011cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788209874; x=1788814674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ro9e2jTWieCFdtrEqKTJDij7AqVySynjSHA79dJ5Oyo=;
        b=mplP3KI5aFgm2VPsWp7C5ZG3trNzKyAbqVnp5rloavmp6w3JLmC9BtC4nuJ/lF6rX7
         VH4z627Fme4e18dtHI8u3FWA+uiTqDznw434oFRbrAjk1YTovBE27m76j7a3ecUP8/2a
         FndtccCjeYvc9KSYdReDKRDvq6DN9YhWPKt2+i9/KrRnjYtCO7wXb6XT457JAQDYQtfu
         TIzFnWDKJkq4sXpkcpfIoT0EpLY4Xadrz3ou5sXFcglG2EwV/BPd3O7OW1n0RpBRIrCF
         YrS+u+afGxRbz4LDBZCysbB/gwkymmMj5juATJ6aMtxUVNTGtmgsLDqqJ8wLaySXH+oy
         fxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788209874; x=1788814674;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ro9e2jTWieCFdtrEqKTJDij7AqVySynjSHA79dJ5Oyo=;
        b=Bd1x5jU/Yw6/G3bWOeeIOcG3zHNiD9kOtYxuyKb+DghMahxcit9xwp3nN6aGFLb0Ez
         HxXaq94LMvzIbVUuylDMf5gusFDvpmiV7A/sWchW2JHtjOTNcJ/QYmeS5trLbDUNYaUW
         bKFKqlaFDTOUnFCSR24C8SzP8mL+3D+wYgLxlWcJCvHwwn2QT6iCtvvunYyJxxJluegI
         2SJinT4NKalxVHPiC8yRnM7eqZem2WcFmJKEDsaT/IZKdczuMm9ar99wdvpaJP3NWP7Q
         I/TupDzVVOcx9rzbiiGvaqQVIo1JftXlbCGpEyqo702ffMKKT+532pHgn6Vj8FkL9aMn
         naLA==
X-Forwarded-Encrypted: i=1; AHgh+RoUJmgPFn4vxJwyKZuiMPQ6R3MBa64F7KrrPWDjiusVs+xTFR9PSvIrmd558bj5ZwOTqe3fns0+3DrwdGg=@vger.kernel.org
X-Gm-Message-State: AFuF++m28l8ciI1r1Nd+CpFJR/c0laWyfsJ5+H+B7//Efyo2UsF0Ojqp
	7fGgcGWwBLphQP2OkiVo1n4RtNOHhchjWK2qsKPO3EjL/3kPWJNBlcY=
X-Gm-Gg: AR+sD10vMDcVETrzfphgWaPzoLJeGJ/th9BM53gr8uE5omlGEq1+eFulltrGcU7GkFJ
	7Ztf+TpxDiau52M3hl7mi6zgAH9EXKWu/zzfMoehBw1WUTZ3dOMLdpB3JX1HfaYyr/2GGB6r9gF
	0Kb0DBN+lYu8t0CC6pCOOqOtSxrjCWDNMw7CFICv5GJKg7aW2woX11E2M6cut3KnM/OB2WdWQff
	n05hpsUbVxSpYJu5/3uLMXQc9wT+T+gLLstJEKnaVjHOZYT+qaSfuhmRUs+CCH2rh7E/PSbgCOx
	qUcRA+bf+jFHMsJROse4QuBMRHIivYBoPAI3nfgCkRwl+nktYktgg31+hy+dQAXsls8DYHealYV
	HCg1aPCvOGZnKKb5u8bf0axLC7sd1Y0o7ht98X7V1cgbvn5IL73kqZSkRDHTZ3l2eyVMowMCZ3K
	arJ9/jfTqhBAQSP1K702IZ8KeQHfFwuYPbjn96QCnyTVBiiYTmiOYqIjk1hbClqaUIx+0lVltyG
	EoVcNee9g+mL60E4N82UJv49g==
X-Received: by 2002:a05:622a:e3ce:20b0:52f:c0b8:b619 with SMTP id d75a77b69052e-52fc0b928b5mr168125111cf.29.1788209873697;
        Mon, 31 Aug 2026 13:57:53 -0700 (PDT)
Received: from [120.7.1.23] (135-23-94-154.cpe.pppoe.ca. [135.23.94.154])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4515072sm91956876d6.36.2026.08.31.13.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:57:53 -0700 (PDT)
Subject: Re: [PATCH 5.10 00/43] 5.10.269-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133358.571886287@linuxfoundation.org>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <ffd3fcee-cb98-0821-3544-4da490e546a8@gmail.com>
Date: Mon, 31 Aug 2026 16:58:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101
 Firefox/140.0 SeaMonkey/2.53.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260831133358.571886287@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.269 release.
> There are 43 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
Compiled an i386 kernel, installed and booted OK on a 32-bit EeePC.
No problems noticed.

Tested-by: Woody Suwalski <terraluna977@gmail.com>

PS. Should the 5.10.269 patch include the fix from pchelkin@ispras.ru
[PATCH 5.10] Revert "USB: serial: keyspan_pda: fix information leak" ?


