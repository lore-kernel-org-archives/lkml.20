Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14211413D69
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153325; cv=pass; b=t6AY3dGhASm25XAhDcOxbQe1r3O4UPvCAzIbCP7Bj1DWnuJsDRH1Xpt6bIv85lFMnVRnfcYiV/h1GnLqb6/Tjiu4CkCn6YEajjop896PqPUQqFEGhAA/ETTkNA/bnRTRGP5VMhe1jp5xE+rXSyViRM3fj+X4GTJiB2RP5d8u3Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153325; c=relaxed/simple;
	bh=zgXaZV//QYG4469dRhLaxLf4jDLcoZBNLlaluFRomK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1uCVHjCn3dL2aDl1hRnxgbZwjJbi3F3nXAA/NaaurBzzVlHrR7FDn/Waq+3+wD8ezuX6s1gjJVow8OHJPC69pEUHZ7H7m9Xb/9tD8x7XIBMuLaBxSj0LdDib80EioUV8oCAIMEMJ11gBatzOxJzyIqd4QFT+sA0iDmTx8A+QIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbpjNv77; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbpjNv77"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so536424a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789153305; cv=none;
        d=google.com; s=arc-20260327;
        b=G85pbkUfJ5wOc6kmY/Kvnx/s6Qhj+izAi1fn6aV2DEIg3S/f1uEPm6ec1x35ZWJ7wr
         ux5PlWOERiPDb2QQB6ngo3gn7xgSf75Eu9TIryy1RdsLPFOZDW5fZJZ9G19204EtqKZD
         vxEVZwUUAmxbUkQYm7QksRv7bUl9tLOdCUfWzRPAlgEt5NdT4bRzZdI2v7SvLdS/b+q7
         78V0FIn03CarQf4dRIWgvbzhrEUHwmpFEIqWKZ2GgGKq79NORlYze2IjTSXl37NAVgsE
         IYqCsoeZsQW/TtpifKkFPEbsU/2JHzsRPuNtg5NmIcUmc3GlB7+KEckeX06BtYqssfIQ
         ELeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgXaZV//QYG4469dRhLaxLf4jDLcoZBNLlaluFRomK0=;
        fh=cmBewG5Og9n1bXUSV21Ki5cKsKIcUcMGdxTa9KgLCVk=;
        b=WsOODArixYnHdkwej0auKDEZ1NyyrR+m+N7YWiHTGmUHZB7NDwDxufN7z6Iq5VMipP
         BagPY2+PdJDjGPR2TaQ4/5cwLF0V9oTKZdK2agly5qTam7PLLfXgKuqpc3/6ze4rshjJ
         PSnrMYocWI/qhUXZn2ymyf3w/6VykiL5HFXwivQVYt50+EUFTwmK/so3uRAknQEXUFMg
         yX+ZbU+bhx9ycE0aebLZpiRMaHutqMWlzYW0sBO9NQif/58scNtm4jLDaFKPtCFvK/TH
         xbYqemQRhKbGTkbocEggNovFrc9Sp9m8ohIlZ9hSqR5gTvJ5f6I57/8AB2kWZxPr2oZh
         qPxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789153305; x=1789758105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgXaZV//QYG4469dRhLaxLf4jDLcoZBNLlaluFRomK0=;
        b=TbpjNv77h7PMHP0ATTD/d+yPvKvPJEpFsagODaqPzYdgugBetFTxEwnO91BSj0v/5P
         0RCx2ESJNklOYv8gu2d1nWXj1bElyJgLsIhMekiQL4NxFYlO43Gr3R46KZ9ZJ6+qBhfh
         0sm/5Qntg26dPH4i2ICDnXrsEfv8pYNkX7wqLKWJ1S/eGxJOVG5cGhTMYmOZAq8QdZZ2
         JlgVNMeE+Tx/IrXtHGAOBmptko+98ylN50MibwtGIGwI4zAn/HRenwQMRyE6+V9/R+lL
         Z4b73w6/eKuWeczfnre0tQB6uZUR2u3g1rDrFUKwYVQljVjaAYEpGOmWjCo7yfiro/E8
         j+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153305; x=1789758105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgXaZV//QYG4469dRhLaxLf4jDLcoZBNLlaluFRomK0=;
        b=Vw+uqrfp/grwfRKSqAGZpjEPw9YxJ0rDZUAqD0sbEZFiabtueYv22XLFgVQ4zT5hax
         EyeAFTn7Zw9kpDj80v5MZuiaRlv8nstiFjInMobtFw91RJu9O4ZwUX/+Nf1KSlGosFUq
         MjsoAAVaM4GbPjWt6781wXi5woBHn8vZKE0D2S4zhfok1HnUsGzmLkqf8M3Tc399593i
         +FNH0iI6PYi9WvX19oTK6859xnp6Z02ix/E8oePtlPCW8CUf9xH1ISGjWGFpMWTS7nfo
         8tDrgjOPE951tduXZ8l2wVn+I0GDmRWQxd8+bXiTwUTAAzmPvlWIHVPA/cwhe3QKx2Y/
         erqA==
X-Forwarded-Encrypted: i=1; AKwUvByDcZM7xyzmqq2rgVRc/7IvGbIFd09ak3w/31v91RKrfcT644EF06FsdHnVrKrSO5GAW1eKTHfEviGk97E=@vger.kernel.org
X-Gm-Message-State: AFuF++m+moCD79Ozv0DRGr/rPdCVmZh1iiZe0ANilBMoPTWs9EtjroTE
	G3JQD70c7lwhCegtfg8d0HU3skPh427JA7tLmCjY+VXw2I54Dk+7Cd4+mnuJvZQuLYhMqhvt7b+
	YOT+dOixpfV319pSBlYAdy0yfCP6gbvA=
X-Gm-Gg: AYBFou3OCQdwycmipY02j0c9Ird1yCWrtomhXJWHqpwmbtlNR+pi3ZTtsoqnrHr30gw
	4SXao03Zj+s7Xn1W88YhZkG15kumzhx0MoiWehp5q//ivh4oMFFbT3U/CqzZZ5hSgtdlYHMtWda
	MkctBhVBFeKrQgfc9+eHoXo1++bTF8mbHB5TJgbgOWMwMhi4XZ82dMJgtMGLFqvQPtb+LCifs6h
	AtKNSgyt46hCMoaJ86ez7jfy6AdVWeM1AQVhWsbahfdfzxEy6UE4VSSp84pldR8ss2h5myFWjbs
	zfUFnq+Ly7mLWB7QL9GywF2F5mhcTVq3dsf4eIKw2asmvgHIHzRtJFjP
X-Received: by 2002:a05:6402:5024:b0:6a6:32f5:90b3 with SMTP id
 4fb4d7f45d1cf-6a9b56cb90bmr5271034a12.21.1789153305023; Fri, 11 Sep 2026
 12:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 11 Sep 2026 14:01:32 -0500
X-Gm-Features: AcwNN1Ue_pfyyzvxcWu7bUZijifaEJzBimk14NP6B3kzlMYEX1HbytKB-0x_sYs
Message-ID: <CAFTtA3MNxUp8pnUzcM-EfAQkZ=ZG6k=7aXKZBVmjGPnjXhywTw@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context save/restore
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

On Tue, Sep 8, 2026 at 8:03=E2=80=AFAM Troy Mitchell <troy.mitchell@linux.d=
ev> wrote:
>
> The standard vector save/restore asm advances datap but declares it as
> input-only. An inlined caller reusing the original pointer may therefore
> use the advanced address instead.
>
> Declare datap as read-write so the compiler can preserve the original
> pointer when needed.
>
> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per=
-task Vector state")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

Thank you,
Andy Chiu
