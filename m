Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576913;
	b=fdoDJYicVkc3jTPmUldD2El7Qo8accMiiltZb1zSi1GwjuKWM1UUxV0SoPZGVWYAegCb
	 E8pjKdLEWQ7x9a9uHabkdFxx0oqbkG1pib9La644agBpP0/6Og4tXmEEtr2hP2uxmeSJ1
	 zj5ZjDgHxJ3zKKwmnv68/KO07iLl/YNTGgJKcGxD91KmnUeB3Aopw4Uidz7xEuvAUF0R9
	 oDaPkn95ZLkQizIzezl1F379f/+g0Q0NqY5uHY6bFUgtZAsmWq80RzUcr24GglhuSv6kI
	 dHXQPKCRbE9gYRbtqGQ68ll1pS9womctAwukJDTfwPybEYg0a/f7Y7+x8rXjJ/bTgRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SfupC0oc/N96J/Mda9FTAL+K7CQc5gimuxHzutKbmZ8=;
	b=4EQv3wMfl55taXtlLhiZ6Ncp7R2T+JKEFu4xC9F3GGhOrGv8yPPyaxM1LJaLA8t5ffny
	 tCLhD3Y8LaPu3yEORY0ikSdRMm/JmOyov9IRvPcr3T0vmtEnS7UOsiIJNC30Rxi5KDKTf
	 i7OlwDBe8UHtsLA3PEHgH3I1I1bIhH64lrEjWHXjJJ4kH0X+GQBtU6Wo/PMBggnlEQKDo
	 fsrJCHNXhWz0CWEYWjeGypX9kVlw20y+VXDLIllFOVyDGozUJ2IpLlHJdDCN6VY3Fo/2o
	 oSyN3wC9/SdM4gDVu8FJP9wia5D5Zzlik4C8/809RwF3Cq0mUdqMpQzi5FFCi7vh3Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7r1TL76;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B49606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B49606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7r1TL76
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1856342eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576912; x=1795181712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfupC0oc/N96J/Mda9FTAL+K7CQc5gimuxHzutKbmZ8=;
        b=z7r1TL76Mm4OuZCdIxW2VJM2RCwXE1rir/043PaTV+7zc1jSC4HMc/bU9P27LgJtXb
         eoRrQHBUIQcI3tsG2VV6OPmc3dm4M3W0XkZgLS3n6tAY8O/DdTk2LTFQYqFK+B0XAqOy
         4tWXaAmr41WJEt9Jz14sHBtaIrtfOAAZOv6Jk8ZcD2FnDNhMOZw1sc+scS0U6I9EHJM2
         zv8N8Dc28gRUN7rHQbPq6YMYvuU5eaiGXKYM58wucd4rnvXmaSAFbGX+CR15pRaxUJL3
         LlkiTzdICSul6uiaJDcGi2x4dzBOolydZxYMCz6EvMrXbA5redoyTZ5782YACs1JJEJM
         HKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576912; x=1795181712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfupC0oc/N96J/Mda9FTAL+K7CQc5gimuxHzutKbmZ8=;
        b=takoi4sdZigcam/xirqvUXp/WHCN8ZfQgws6YjrXwJgvycatH9ZqHBcqCztdzzH5L7
         7bZVk8gC+azKQRE/RRRVJOr4vP+7+7mp5cKdLFkjXSAXm6skXvqc+k0dxg1zcFnrPa8b
         YqyHI/XskP8CCsjJVQjOPMSd7whCLyaQL4Yt6F17VOWEOAV3/KKT03put1MA9Oc8uBv3
         +y65lf7/RTUXBjvkvIfKYjkvWo9LBu/TFJzGK+jRWKZwQRWU46pN+4uzNNrq+EZp+GI5
         T9TZKK7jT3KHOSofLqEThVXEco6/TKieCxCa/5qn7MLe/pnoLorq8f+7RJSUfQgS1zBV
         ORhA==
X-Forwarded-Encrypted: i=1; AL+hErFwWkFK7/1MZhFbVLJifJ+iV4xJHYsUn0XQKP96RjykBGWoBXbtS1Vu6skQ2dCFp0P33guEDuCVZrR3nao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tcPWRwtyvuz5NG4IQT5ySCpuzPhQeyO4Ygv5JrxWAqVEbmGFI
	qvpoF3q3gux0YR/BLNRM0yr5oG1A5qV5sR5Jl4Cvf4+2eWyoQBYUPAU=
X-Gm-Gg: AYBFou19PH+b1pQKAHURvm80hAnNFhDUt9/btLIknikrvgVFROurEK4QPrGVJ9v9zOR
	dlKtAQcVIceKpCz36C+Qo7kxlHEw7M2wlqru6s5c+kyQA+5x7gsExPugKRWMiAWxHpYeJdKD/CA
	yoTkmy1bt7odiuCm/vuVabth0iBf38U5UttMImi/KDlGGQTnPOU118BFRQELXGOAyL0cldB4cBO
	nYCtow42JHN8TPHRuqEBmDAWkGZ/BkUpy7SUM8qJSwT6HKkCYXS7MxcGe3O7PjOO/dSEK9NTGqV
	pSt+0PyAon3V2Ao2dsZRKcvLys5ooh3JirivjHZ4eFxrGtLSpG1J6Oi6xb8ygisQuMZn6aRZIpU
	KROrnd4I8f2fG2GHr6iIrjbjKnCITKQhO2Pwne4mFedDAOUUnfZBXMpib79udwzUAvu5+OIs6Sy
	IScxIgvcZd6UqWgt1oNgz8qpTycazzH4/kH+abDg4aWNmwupRBu0w43eZ0c2/sBuue33A1kycIZ
	iGBcWeIjRSXYDA4C549T9coQ4UPWPPO9jal1KbRqxlQuv8fX1Uc1gvudkPcT1n+C4RS0tclbrTf
	TLR9FKI9iETCr+rhPBoczj4M+++GYxnN4HaxENTWrFPBrNUWlEqRfKYtGnrr+nYBotqlEBWh0Nw
	bMi5LF3kfZO0=
X-Received: by 2002:a05:693c:808f:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-37966a5595bmr2552834eec.22.1794576911887;
        Fri, 13 Nov 2026 05:35:11 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.205.242.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm8074632eec.0.2026.11.13.05.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:35:11 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	harry.wentland@amd.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Subject: Re: [PATCH] drm/amd/amdgpu: Add 5K Support for iMac20,1 and iMac20,2
Date: Fri, 13 Nov 2026 08:35:03 -0500
Message-ID: <20261113133503.28291-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_Po302dyx5FA9u3A8os_Q-HsA74nk2qeDadcGe97zodbQ@mail.gmail.com>
References: <CADnq5_Po302dyx5FA9u3A8os_Q-HsA74nk2qeDadcGe97zodbQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> That sounds like a separate logical change from the rest of the patch.
> If changing the order of the init sequence fixes the SMU UCLK issue,
> that should be a separate patch from the changes to enable the 5K
> display.  That said, I'm not really keen on this change.  Can you dig
> further and figure out what the actual issue is?  There are now 3
> separate slightly different fixes for this for people with various
> Macs:
> 1. Enabling UCLK DPM in late init
> 2. Using the UCLK states from the UMC DPM table
> 3. Changing the init order for specific Mac models

I can understand your confusion, so i have tested some scenario's to
make you understand the situation. And for the moment you can assume
that OCLP is a efi loader that sets 0x4f1 to 1.

1. Stock Amdgpu, Without OCLP (0x4f1 = 0): Crashes 6/10 times, 3840x2160, UCLK works
2. Stock Amdgpu, With OCLP (0x4f1 = 1): Crashes 0/10 times, 2560x2880 (1 tile streched), UCLK works
3. Late UCLK patch, Without OCLP (0x4f1 = 0): Crashes 0/10 times, 3840x2160, UCLK works
4. Late UCLK patch, With OCLP (0x4f1 = 1): Crashes 0/10 times, 2560x2880, UCLK does not work (Command are sent BUT no change in hardware).
5. This patch, Without OCLP, Without revised boot order
	 (0x4f1 = 0, at boot, after amdgpu init 0x4f1 = 1): Crashes 5/10 times, 5120x2880, UCLK works
6. This patch, With OCLP, Without revised boot order (0x4f1 = 1): Crashes 0/10 times, 5120x2880, UCLK works
7. This patch, without OCLP, With revised boot order
	(0x4f1 = 0, at boot, after amdgpu init 0x4f1 = 1): Crashes 0/10 times, 5120x2880, UCLK works
8. This patch, with OCLP, With revised boot order
	(0x4f1 = 1): Crashes 0/10 times, 5120x2880, UCLK works

So from these scenario's you can probably conclude that 0x4F1 = 1 is needed for SMU to boot properly
and thats the reason for the init order change, to set 0x4F1 before SMU init, if we can for example set
0x4F1 in EFI (x86-libstub) (like OCLP), we dont need the init order change, but to do that we need to RE the DXE
modules in apple EFI and check how apple's firmware sets 0x4f1 = 1.
And even OCLP does not enable 0x4F1 on its own, its fakes being macOS, and then the
DXE modules turn 0x4F1 on, for the "faking" macOS, we need EFI changes across iMacs which is not fesiable.

And the UMC DPM tables patch does not interfere with anything, its not needed for iMacs.
