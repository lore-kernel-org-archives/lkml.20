Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964EB4FC326
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015785; cv=pass; b=lxLl0Sc629hNj2ePws2rrp1n6oPJkhRbT0oArQYYdpcYyM3NlaKI42zlj05oA9z0b6S0EjoAxy0tht8pIoTrHzRYC16TAQASTMDseLTOnFBrB6ljMpEfh7l5tAFSlMQE8MtxVwtv48JM9QWmdBg26UlUf+Yzo5ToRoif/MlL0GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015785; c=relaxed/simple;
	bh=5IMj8x9eRgcjqpyKwZG/YkXc/KumJsdOZYNSTZMIJ0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WS2eRPY7PaLgxYLNG+oAANx8xrNDBXRWfzi2+BnuiRow5KYJjRyrMaXymdJvdXdMBDxE0Wif9bZPoQ4rTFU7AgUJ8DVWCJU4o+xbgntr0jzD9BlpNdFLj7PBSIT1KQ6D4ryuAPnbPSmLQ5WtRSM3dlctFlV2/tJzBnw3KQ1hX2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g6g/NmxZ; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g6g/NmxZ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52faa58bff5so33751cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015781; cv=none;
        d=google.com; s=arc-20260327;
        b=UmGf67iCWJGW+l/zuVe7uClYvEbFXyH2W5PAucwVXDbMoYYje2sI3w+A5UBvPfVW5t
         HbwY3JC4d2ePXYXpt0P/4hE9AQvM8VVp8QTQGB7CzkyUolA3HPtVHgR2edBbp1gdhvWZ
         fRfpAP3GUi7UNtqNpAkhCHnFJea8tB+KDdJOdWWhP/A+Emj5qH0pKT2jC94D+f9XA2qn
         Q5QMXEminFjfGJjlDyBhuRkOKZfP6MmamFBH4dJ42ytKUJGOQoyRFuvC96b++EvaCit8
         bBP3IGYOFsSK3iJ16C2k+DyB6WDuzZzpdFrN6nbLDRXwH2Kq/iW3NHu5DfQGK//3F1BF
         F2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hkzGojJ4vehMF4KKmjoVCNEOrAfdvYhqr8q/GMHHrXo=;
        fh=1RZ1mzbDdvV4rc6oJ1KsL3v1MwkaMgD3sSm2fKZG2iA=;
        b=JyxGmOT6xBH7xSJ4nob2fUXsTsbIHzRuFju71LmE6Rlbfm3kpzZZuiMfAdHdhxxFtF
         E254QOPemDcmF4A6zaDpJnR/R6FSDG+mauGdAth9VKD83xhmcbHe2ECnfpLttXXAXc5W
         L7ShQaGGe1H2Y/5UraiC3f1VH0CwPHvx47bt1QzKInqFFpAU3TifeBjKgWO3jhAatEzo
         tgoVxtl+3bto5Q5O/9mhtxu/ust4Y2HOLNZEcW0JyyQkywkcNq3xa+YnUoAH6Zq4oZjT
         HQDFcmO3YJsfGyYX75+bP/feDXKpgdsSkvNhmhUQV/+t4TnzXHv2G7JMUGzhGWfHaEqL
         sGPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790015781; x=1790620581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hkzGojJ4vehMF4KKmjoVCNEOrAfdvYhqr8q/GMHHrXo=;
        b=g6g/NmxZnVbbxXCTDBtFClZLNsmeVsSTYG8zbjz2ufJat7d/6czp6ezGWd01i/6igk
         BI4BH1MdPj67xMYx4+xOPiwuUfoXfQkHVBxSs3Gx6OFuOaw/cNGzRRNR0sTzWtDMRGdL
         5PEqjzpalLt7r78HQT4e+RpL/QCCjdJK81QTh2pXG0Rt0kXpyWqPji7zGZXJnog0clr1
         lr8Thx7VnqF9TKi7A6r6lxKVp68rZAQpDg+pW1H4ZOKkJ0BGhQwIziV6kxFWNjCA49g/
         2VkY/OQ9xz487DARmxt5Dr070t2iUadYvcMq/damywjFOTPkKxZaneTahYaPxo1wsWIe
         ZNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015781; x=1790620581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkzGojJ4vehMF4KKmjoVCNEOrAfdvYhqr8q/GMHHrXo=;
        b=Xiv6c1isiFsysEWaeuihVrWXHQ/aqYaf4umUB2bKIrDP1gviQGsd6dgTsl/BscYcO3
         EDYxv5wRCsPy4h/g2TljkiYjaYYPNjizsqngoeuVnuKA+7hX92vjimrJzKYRE/rAJTe/
         7ezt21tIwEa9Zg2OUIRZJMvVUbugR83LzR0kkNSdrprMzaaF6a8pmzr2kRVW63b1ibmx
         l8bHJY5y0v1deLhNlC3NBnjjbGjrHKx22ljtp/tXHpsMQbOYklMAFg6JZtbCuc2i5fLQ
         En5PRCRChjwSzMIp7zdRyxVEs2Y09iXrMdko2BRoa/EfCIwJwFOmFo7542GKDQcZvJYx
         SxCQ==
X-Forwarded-Encrypted: i=1; AKwUvByCoUJnSH9avs2YploE4nJrQHlpxImTEybxvlV64N/jM6v1yxlwnCD8eTppVwu4Igc1tFxegspyPyhMTeo=@vger.kernel.org
X-Gm-Message-State: AFuF++lYSWEhvMG04EBFMxGQgNov7H91pKXhMrd7BN6hViptN3A22cIW
	bzCY76/yzzlWfiSHwACGFY0uZPfwnO/EOjKWCX9bQvTAoMYgQr7F8OHOKUz8AvmwV4W4lUbRs7v
	ovNcwperd6+32bNtn1AdQz7LyLBetlTxp861/wP87
X-Gm-Gg: AYBFou1+SFwWoyrgW79vJ9Gnca4mBvvGN0/E6u9h3Rd3+qUN/CRWP5vdSdKRVC5u1H8
	5mwK1/FGJh8LV6iLlqvHe+PxhLCdy9Ii8gcxgI6x1s2XgN1cbONvbvSYpFTTDj2cxXC2oWp6o56
	07OdnsSNCYtXBsXkFOhf56N4xFiu+9sJUo1/4yeOEc2qyWZc+UF2fJVMv1EiLtVHoVXFEtxdKXP
	oLv9VSrKUHQJMcKNxTOVQJpsB6V+TRM6JmHbjTW1AXQt1v7WhzLMv4fXH7RuhlmP57rbtyCLCFp
	LEY7yFSA2epzNAFF/yVFNO8zrnWPI1++wqrOOZ8WoqjRncorQGhebrU4DJdwULi0onEjCsSWLDN
	smBtvZzSn
X-Received: by 2002:a05:622a:2290:b0:531:a85:69c1 with SMTP id
 d75a77b69052e-532dc3bde3bmr1415511cf.5.1790015780611; Mon, 21 Sep 2026
 11:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917125802.1198419-1-wutengda@huaweicloud.com>
In-Reply-To: <20260917125802.1198419-1-wutengda@huaweicloud.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 11:36:08 -0700
X-Gm-Features: AcwNN1XL2P6NwaYXUdhKIHqVAwXxCkVy_W7OkIGEoUZLnBkLv48KQjUcMsGXLjE
Message-ID: <CAP-5=fVOdeA-cf1NRJxQ_YFeYKu3F1PJ3ykXR5Gtx7r0MtsUtA@mail.gmail.com>
Subject: Re: [PATCH] perf llvm: Fix memory leak of args->fileloc in symbol__disassemble_llvm()
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org, xueshuai@linux.alibaba.com, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, leo.yan@linux.dev, 
	Li Huafei <lihuafei1@huawei.com>, Kim Phillips <kim.phillips@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Bill Wendling <morbo@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Zecheng Li <zli94@ncsu.edu>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 5:58=E2=80=AFAM Tengda Wu <wutengda@huaweicloud.com=
> wrote:
>
> In symbol__disassemble_llvm(), after calling llvm_addr2line(), if the
> subsequent disasm_line__new() fails, the code directly jumps to 'err'
> without freeing args->fileloc, leading to a memory leak.
>
> Fix this by explicitly calling free(args->fileloc) before jumping to
> the error handling path when disasm_line__new() fails.
>
> Fixes: 048856817888 ("perf annotate: LLVM-based disassembler")
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/llvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
> index a0deb742a733..dc66f6cc1db6 100644
> --- a/tools/perf/util/llvm.c
> +++ b/tools/perf/util/llvm.c
> @@ -254,8 +254,10 @@ int symbol__disassemble_llvm(const char *filename, s=
truct symbol *sym,
>                                (unsigned int *)&args->line_nr, false, NUL=
L);
>
>                 dl =3D disasm_line__new(args);
> -               if (dl =3D=3D NULL)
> +               if (dl =3D=3D NULL) {
> +                       free(args->fileloc);
>                         goto err;
> +               }
>
>                 annotation_line__add(&dl->al, &notes->src->source);
>
> --
> 2.34.1
>
