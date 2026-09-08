Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2DF59651E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890248; cv=pass; b=DlRNJlo65/KhordNFR376+CZoPr2GLxC9Odu7FRwH956SvjT2E3lUDdjvtdmJyMbAaW/Y7HNHFBxvThO0AMAefx8r4pTFxvVEMV/x3l1w9F5rMc17RcUKM8IJd2Wlc1GuZUSXWM2gc+L7kTLcFVi8W642mYE/BEoZXkwHjE4uA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890248; c=relaxed/simple;
	bh=IJsyfPGLpm8UMa/BqkR66GRSRbIqbVXIutmTDpcavo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma2Twuu9vjRXdd9HuwnL5fz+7ETU+hkwZ34bmqs8Y2FTTEeoR7w8UkiriVS7pHy/uW4qr+8PWbm5kagaJSKIXW9HLrajf230Dm2IPDFofZqFhyL2n2gFvtd8wwU58W6GmBpF7UhQ7U1P59C9PH1i2PNbck9jOtI/FbmVXv7nIsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r1JO8mhO; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r1JO8mhO"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so638161cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788890244; cv=none;
        d=google.com; s=arc-20260327;
        b=St57TBQ41RxEIYyJF2MWdWxoIzsT/1m7tVcisFiZn96LCzUiI2OuN1Ovs6UN0VJuZI
         2jiLxO7CFKJLQMpl66OKVl6F9wn+ZZJcxn1O8fAQN2drup0Fzx3GpaA/+pmMLyTzy9ZG
         mjToFhkxBWeZ/BkzKW4UQR9E9plrJGohxThkjcC6eJIEd3owrP9vOh/ONJKjp40R7hqo
         TrLzmg7rBauHFqlDCeLxcAYUWGg91HReHI7iDNFia+vAQFYs6AshtfWlR35Y9vsc7ICJ
         lR5Cc8cNCjnSLnqpLKcFyH0vs/2M3Njz88FNNyHGNnz1moXWI421QgrobA7Rle2WuEhj
         d4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GB2pUu7GQQ4fx2+eTrSMAv2WzH1ekSifjwCfsPepe6g=;
        fh=qCcpjxMkixREuiLEOuy3YxljN/SRHeGuN1deYtZjhio=;
        b=gBxL163aI96nc71hFS6BvXvyrVQ24RSQgthILXAqn9/XPUQuVUc2VLGoGHS6W5tJtS
         QY3xwAIHsjQKG2/pb9QDxUzW5QvVx+TEOqESZthWnICqaXwPGFMoj9aFOORvV7jzJUoe
         TJZDY+NB66pOVp75Ju3zbNK2YDhCu+FxgEIcFWHJZWMC2zzznCTNRPxZSaf6cYCVy0x2
         zyRBOBBEqKttBYcg7S/Xd40J1krhOyUhZR0rjYsppZ5pub/AfKSd6pRaUADNkyFsYqiK
         iQ7zMwkwFG6QPp9i9fNj2v30e6uO9keBZfZSNqAtssfhw863gbe5wAimoo1++V1xCwnO
         mnzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788890244; x=1789495044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GB2pUu7GQQ4fx2+eTrSMAv2WzH1ekSifjwCfsPepe6g=;
        b=r1JO8mhOpTrPt7K+I86Dk4yl8nd/GdYNc+Jw9WQoSbx9x+sbnn+kWzTrUFXGzDlyYu
         SXSqt/m8iMFPJLp1z+ncydsEF2diulLlIwtAhF9RaYXDf8SqP7LjSuoCEFUDl9dOZSOH
         a2u6h59F7cizQ4FrsyPyDMyzpSX+0vmXcxzw2E5kTSw1SRjW02wNAJ5VCDYc/IiWVg+f
         IBy5U2oQxje/7mab7o266M7p/Ett4YNmtpFsBPQLpfXlzJHZKorE6KJ5oSM48yl+OEvS
         5eJkUXT4zGUde6TQ+zQb5J6lZisMgDz2IiQ6uPS85R3RUcNIy29+thDiYEsIsliyRAl8
         IrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890244; x=1789495044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB2pUu7GQQ4fx2+eTrSMAv2WzH1ekSifjwCfsPepe6g=;
        b=i6khuqWUyjT0bRdBt5iz/xPw/qko7VspGPfQOuf5E5v5KIvRO39Lu+69cx4g8yeY5H
         0zsRiWoTviHVzkV3dXSYhvPpFsiJxCRqHXGjkrkSxaqpDD5p6N/XjhjV4EXYPbfN99yL
         npYm9a/VBdEGonTzXndWHoQ5BqcKCAsrq/PqWY8zjeYT9TnDvSrWeJs0icJR0gcWBMmi
         Um9gRE8XYLejok7FnEusZ4+8x3mKGhA1y0NGirqag+czfCeQlKSOEQD2844mw5uQB6bt
         mi8JaLmkmVpI3vLb5Q8mWWBy4/yWfZLZjm0e9+94L4xMIrnxuHVlcSLUUJuWK/WRt7oi
         Noqg==
X-Forwarded-Encrypted: i=1; AKwUvBw2VNb6zywcfrm2lJueIIR58X2NieA0a9v9iPimSDU/pO0nlqnhDBsF83v5No1xbrLg1dN21imshyKR1us=@vger.kernel.org
X-Gm-Message-State: AFuF++ltatXnlCIzmOq3rHADbOUJpA2TleTOkf2bNdfcD6dUOtkFfrEv
	PdIxGQLUTb5Vg0AnaWJJwkUQZcPTKFqBhsuPZcrQLMfukAX3EhPAuD+4qr1uu0KYJKBxst19xGl
	ZYCLlv5WZV/KCG5JOOYuXQ/43G4Mqmp2N0YIRWvMj
X-Gm-Gg: AYBFou3ms97flYaiIDeu7rKI+32G0sW7ufQ6Y5SseufICqYvrA4SHmEA4fIvVl584t7
	b/v0LeDcdXkcbN3V+mh4bSE5w0mADUoF5vkJVZe4m85N2Ylaxj+kjArpOBAMEOyKMEv4uCY616a
	M0Ubol2r4uqNyP2bzMD+hL2n+ip/xZEnb2+Yk/t395fg4558KUcfZRFfXt1TUPxeyf+Pjgm2LC4
	QsyH8Tkd/3vFywGcoyU5HFQ2Y+UrXh3OrcZvTJliR/eMsTppBebJ107k8qplIbdD/33FVGTy8ac
	HapmJQhXy1O+hvXqOsRqztT0EY9YVF6MihEWfK2b2TYw/KfJiQIGsRBDWMmQD1+JV2ENY8MTig=
	=
X-Received: by 2002:ac8:5d48:0:b0:530:4cc8:b0b8 with SMTP id
 d75a77b69052e-530a46fdc0dmr598661cf.0.1788890243316; Tue, 08 Sep 2026
 10:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788872630.git.wutengda@huaweicloud.com> <07d3cce3cb8561c07d7c77deac81eb9ab0540ccb.1788872630.git.wutengda@huaweicloud.com>
In-Reply-To: <07d3cce3cb8561c07d7c77deac81eb9ab0540ccb.1788872630.git.wutengda@huaweicloud.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 10:57:11 -0700
X-Gm-Features: AcwNN1VTgg87NRXDwKCaLCVHhILMhGw-jUsmsmeNaMp7Cz6AWjeluRRn2LoZeEU
Message-ID: <CAP-5=fWj19r_NcMS8DPeD7SQ7-Ak9_rRn=EOaBLUmxvPyHTSPg@mail.gmail.com>
Subject: Re: [PATCH v5 05/26] perf annotate: Normalize arch__dwarf_regnum()
 error return values
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

On Tue, Sep 8, 2026 at 6:05=E2=80=AFAM Tengda Wu <wutengda@huaweicloud.com>=
 wrote:
>
> arch__dwarf_regnum() returns inconsistent error values: early path
> returns -1 while the main lookup returns -ENOENT/-EINVAL from
> get_dwarf_regnum(). Callers only check for -1, so genuine failures
> can slip through.
>
> Normalize all failures to -1 to match the callers' expectation.

This sounds like a bug in the callers but this function is local to
annotate.c and is just a convenience so:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Suggested-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
> ---
>  tools/perf/util/annotate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index df70e95a8470..f3d17d153b67 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2492,7 +2492,7 @@ static int arch__dwarf_regnum(const struct arch *ar=
ch, const char *str)
>
>         reg =3D get_dwarf_regnum(regname, arch->id.e_machine, arch->id.e_=
flags);
>         free(regname);
> -       return reg;
> +       return reg < 0 ? -1 : reg;
>  }
>
>  /*
> --
> 2.34.1
>
