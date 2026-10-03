Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC54432AADB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990643; cv=pass; b=ImQFp6SMlR5RiD31V5W4A1nXtsD9lx4C+Tj7pLC69vwleEiTdOTe5VilAsKYIRHvI+7z89xdpFPDC+S1FgwWhZE1o4N3+XFZ8D6A1JdJmA3WnMjC3uan9bla3d/sFZNEYPqwJnuDRjoou/jffv3rfeyasEorXs4Uv0J0k4B3Ks4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990643; c=relaxed/simple;
	bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMhOHDpIVQVuuXBwhFmOkkRQugeUuo6Ldg9bMSTemy+I+pTNFFWsoFifE0caGD+8E7PCKu6fMeuGj2q4SyRnin/hW7LEavBBPZd0qo+rNeCpC90/3FZbmS8L4+eYGPuBjwQtoB9DE0Vd7BXgi+oB+VDFx/t9NbASmCkzApNFW2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=vptHXqtb; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="vptHXqtb"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b14db40daso74119eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790990635; cv=none;
        d=google.com; s=arc-20260327;
        b=ErX69fB74h1cCVrNBAESwe4ZExk8Lm1r3avaRSPKPq6byv61ubPiMlhgmSHNkoZEgB
         5d6cmYzr4H+ulczgKFXw+S7uRBzz1mPfa/fdhXlx9HM4yqcNjDQmBWOBGAzLKSPZgwrO
         gFokSI0G6L6wfpB935Wa8OJ23sKwBPKNnwEk8Kf5UyNlxLPVHR2+zKtohFdEwF0CbnV8
         VsnxNMvmrVcv7D1imgvuyTM75Xm3lpuOGOCuGpMCH+aG4U6keqgsZj64zJlslN1ynOiZ
         49BhPxm78gIEh2nCePhSqbPtYe2MFzKseLz9JIykb9boAe6Ebj2RyCiWE7xYmKwmJ4dO
         NIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
        fh=3f5tFDwz19Tvg16t7dB6QIAObMcpHrnrJHJlIECwwBI=;
        b=oXVy344FqQJRg4LkuNAlErZqN4rAQ2dHY3t54O9stU4BW68LM3O2VMNwOaSE1T0bQw
         MmWO76j3xyx7rx1h5gyFhbsPPxPmF0Pz0hXr5S+PgrchUWLtHcP3AzJ0bYJBmvDJez+R
         JiCjLTaMM6+l06tjR/ZZKbR/dr98u0pEtov3JaBIFtXE4TFGLOa+l6Gb9U9FJb2Li5Az
         dCtr3mDSkAkAxgH6nO/nIviif9sIXq5vToVO007RBfwLoADB0zyfve4kaPEiDlOo9nEG
         /tfMSuAVDFMexUl5QSfHHVh87lAqHnRvlm4pNCsQkQolJrUPiRUK9fYl0mxkXyPpoUt8
         QRjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790990635; x=1791595435; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
        b=vptHXqtbayGI6SKlDmB2B0Bg14AjdFObiQOZZJXTFNs1tHpN+jLdnKl105C41SlAf8
         2yzvNuO2ej7ZAMSx9vPskI22LmyJRX7u20ZfA/kHPOdiWY352dzrVDkyGXwROJP19cbZ
         5uci6mdC+Q7R4WGNi++iKTVxYOgRCIWrVNUoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990635; x=1791595435;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
        b=ZGU+MODcHk19bL9z0fyrdaAQHyzmPhPeAEuEHN69xLWBzu/q/uuFtwJY454IUxY7XD
         AK0zacNpw9M0OIdhAIKLyLaPr8Q4IMMPdLWktJMQG+P993GYAbtzTRQaqWSo2LM5Vs5t
         dwooRUT/p/aG1iTAvdE2L1oybYEoJ3TeQ5JDyDJG2VyrYzmm8tQn5xtdabYEL2joIOuK
         mlwe3bCr3wO5fCRI/zCtq+lsIU0Xw+xvnyMpqezzNrAhmGiKOkqJ24EV1ZO8TRap/Mkg
         b+XqrhLFlKRGYF+61zOEeFDGlALeeDN1HpfOGCGP9tQ559qy3iLtwth1cUO+5Rf22fEd
         V7PA==
X-Forwarded-Encrypted: i=1; AKwUvBzk054r5r2BFGJw/5l1uHg/lDidD9uhFYwHGKb92Xl5Uo+xwvJoJSI8aNepiQ6OohRsRSTumdYvEzVn+n8=@vger.kernel.org
X-Gm-Message-State: AFuF++mvhne1dencjw1SzSjrBJDnH6W4Qi+v83HHEmFhGMiv98zcO94/
	z78PEkbnOyzbIbWnXU+SK7dR90VTaN52AEf3C6wh7SrM3BVD9HNyVS40d7lEYcCK4IwhyIpsw7q
	sLhX0tjABbzy8Oz3QlKfpqT9Rj2V719pG0rcF6AmZFg==
X-Gm-Gg: AYBFou2BMD9VdGwHA/nGQ0FR2mnb5JJLArgesp4x6XJ1UoHZ2TTrHY/y+1iACMk/1pg
	jGEdNSed+/FRBqeYr2XFKjkHkl90cXpssWKhoo5g/2STYehhUBL3llKefosLFcWQRZ+a+1EAqLk
	/afIaomI2A45mXkwvPHK3H7jk9Hzv2llHEWGvE1xqP+bqO+17SOiSzVg4veeGb9y7eHtCgo5XFc
	7XAxtCALkRXcg5h1wPHG3PydxdlXKrkjEeIVPVuqufPehHSL86I6MWxE/6PI9Ra6TYBqzA+WiWl
	Pd/N8OssJLjur9GxzznypQM22fl04e2O5raQQAv+y7rvhNFiLmA1c4HV
X-Received: by 2002:a05:701b:250a:b0:144:e59d:af02 with SMTP id
 a92af1059eb24-14f5b413640mr4772844c88.12.1790990634522; Fri, 02 Oct 2026
 18:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
 <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com> <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
 <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
In-Reply-To: <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 3 Oct 2026 10:23:42 +0900
X-Gm-Features: AclHuK848pC5CD9UEaQvllBn96zCoeLE1p9yCx9zD8zRQMN6UIL-sqXECJvrsOw
Message-ID: <CAFr9PXn1M3PJF=rcR8SDarYU77b9f_v6Bfq+6=pm_vEO28BjeA@mail.gmail.com>
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, 3 Oct 2026 at 08:55, Michael Schmitz <schmitzmic@gmail.com> wrote:
>060 tests are still missing.

I meant to test this but my 060 Amiga was doing other things.. I will
test this on when I get back from LPC next week.

Thanks,

Daniel
