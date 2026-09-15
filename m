Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631F364E85
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459454; cv=none; b=QBXOwJ3cTvg5YcRS8FgSphltAhPif3NFHVDKl95q5DPTvRD/+kqgrEMJs8YVoZyd10dkuV81WnHhSGcMYMM1nPnBZ5e2Omhy4/SObN9YEnLAUOqIhHshb3cq4jEoRjeX0tIgmPIzo7KdhoFUzpXmD001hk8VgXndL++PT44FAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459454; c=relaxed/simple;
	bh=GPKtH/OWWOMpvaRAq0q/oZ/4JxZxKopos6ivVhFrOqA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=bLKxEOS5ORr7GR7F7IFnW3AeNeywo5ClWKC5g7MHuHRnK9sWOixzCkalgMQjDoc+3feavcNBuBu619eF6Lgt+kcwQxaUsCaJV/D3BKrY5A+5dDZifI6GyVMDWC4TwDvT+lXzbHYmsXnttmMnmsnczmtg53BsCU+qV5PPU/z1sQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKXqTuVB; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKXqTuVB"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b12942ed04so3911791eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459451; x=1790064251; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=skIHTRCMg076kDWG2pdx8YKlOQsvXC/Hd109poRNzB4=;
        b=VKXqTuVB6bwRAuMvauNyTgI4yvTz9pBgt1AZzEQpWW9VBlDLo26GDcuY7FxjFNYuZJ
         n0xRMcBU+VW9zgtsn6lqVSfvVhmv9Rg/cLCTbRR16Lcs5stul8I24BunrSmwV4Y+abgM
         OeZTUHHRBj33nnf3RD/U0tuofHjlXxFIbRrDh2BsIKxIPvmR2Lfrk2yaCF2Mejs855/n
         GbUAaZI1w57gRTI/fO2nnxtaTy8/+V+k6ErKKlfFeCxa7Mxkwj3UCLwFLSIVKGTnnihR
         4A2lTlb6leSrkRIK2sCZd27DVQRtL1vZ0YqDP7BSuso0Ia84Vivj8eq5UeDtqC1I4TT7
         gTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459451; x=1790064251;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skIHTRCMg076kDWG2pdx8YKlOQsvXC/Hd109poRNzB4=;
        b=aM9knbkinwWVcmWQL6WGp7SCLzdr9CNWBIHjHR5ODe0rEo/eOmzIK9xbWKoDblDhhE
         u5M/klM59b9iFiiHKfwfvt6M8RZjNwkdjkIiY1Y8SWA8Sbrsv7A+RXa5iQ3+ITg8wl5O
         xA0EFKIDhTkeJvR45YBIVOItBNCMd9H9HNxSwq6zyhuSgcAL/EpmBq/TNemPKnhovhnB
         xTB4P44Gchayn9CSDC1PWURz2cxUsPyLEHJYEJidz5qWqQSln9TLP2jKyBUKsmqH7KKc
         Y9KhrT5szshOCgRBUdFj9jCOsCrFmUtkC68ebd22OCZALD2zfzPMHVF/PDH451qrUqkm
         RMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzsjtRhbEBWOY+vCtxb2B4zz97taGpUKYXm716S4zwfElD0bclHQ5y8lmrgmfs02P/uCuo7qx+CasEA+M=@vger.kernel.org
X-Gm-Message-State: AFuF++k46gX/Ym13hRwOgAplegQEfhnH2RkoLNbQgFYNhCPDhHWT7pR1
	2hW9z17Ef62WEteYIwshSDm/w8EkgpFAU8DLeIy7k/nPiH6AWDGA7oR8
X-Gm-Gg: AYBFou2dVbkoRYP8+RIshpUHKfobbChdMhhbrFxfZaLE8pHHqExuOhKMJoKTrASeUl8
	DKiZg0Z/CswW25Aimzt/Z65+6gW9NCx8jlNS1pmloFXvwrvqJhM4d5IsFQ7KndeR5CWS5Np+t1i
	r+q/27CIuVcOJwXg7hBozjEQy4R9jjR0wwS8+GIEU7Y8Yv4pEy2NE904lWxoEKo/3RfTviDBUPD
	qEaosBln6WqWz4pBGnf+9XQwC2OtbSqLa2OH6sz0thqXwVQh2vBFIciU4Q3xvbg3Rgu60IXiyQf
	kK5sOc5ZOCieOzmuWvG9uJM8smXCyyk5k5lEII8CzGczbOQ+voOlpz9Se2kvGUGN95C+12eQ+26
	Zdq1wiPzTeBLNwqA0oSslq67NHuOmWi6cqbk6FGGMyI2rRekNMkGzHqo6/joHjIWbc2dg3I7LOR
	xptDiBGWOfD88KeOWKC785f/TvGBhutSxZBSKqhWzS5aaEi+EBKgw53BQsCY1Vp32TMaqBqeiNe
	1wV0OV16KHFvwQ6wB/0JZQfFb7xUrYV0PJwgfyW4mAfwlmot8OWd64=
X-Received: by 2002:a05:6820:1628:b0:6b8:ef7d:e181 with SMTP id 006d021491bc7-6c544daaf8cmr3999047eaf.54.1789459451326;
        Tue, 15 Sep 2026 01:04:11 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm57642954c88.12.2026.09.15.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:04:10 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Chris Chiu <chris.chiu@canonical.com>, maddy@linux.ibm.com, shuah@kernel.org
Cc: sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Chiu <chris.chiu@canonical.com>
Subject: Re: [PATCH] selftests/powerpc: Fix exec_prot test failure on Hash MMU
In-Reply-To: <wlsnyvt2.ritesh.list@gmail.com>
Date: Tue, 15 Sep 2026 13:32:02 +0530
Message-ID: <v787ymbp.ritesh.list@gmail.com>
References: <20260909050919.3344699-1-chris.chiu@canonical.com> <wlsnyvt2.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> So, I think what we need here is:
>
> diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
> index db75b2225de1..51ac2f9c14a6 100644
> --- a/tools/testing/selftests/powerpc/mm/exec_prot.c
> +++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
> @@ -167,13 +167,17 @@ static int test(void)
>          * Read an instruction word from the address when the page
>          * is execute only. This should generate an access fault.
>          */
> -       fault_code = -1;
> -       remaining_faults = 1;
> -       printf("Testing read on --x, should fault...");
> -       FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
> -       i = *fault_addr;
> -       FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
> -       printf("ok!\n");
> +       if (pkeys_supported) {
One quick correction - I think this should be
            if (!hash_mmu || pkeys_supported)

> +               fault_code = -1;
> +               remaining_faults = 1;
> +               printf("Testing read on --x, should fault...");
> +               FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
> +               i = *fault_addr;
> +               FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
> +               printf("ok!\n");
> +       } else {
> +               printf("Testing read on --x, skipped on Hash MMU without pkeys\n");
> +       }
>
>

-ritesh
