Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A633438F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018179; cv=pass; b=uyxCuGPEG4B2x3iIXzJJ9YQ/1S5QyXWfujAg47vI0wo3EqLXVHYr7Bjd5dyEsJZni3Kb4rJN9yj3CqRTSONKnfv29ntf+mNAaexegn2lZlwwKBS6jIZMUmEDwNVkvFTpWq3+wJ6i+h0Ix4WVfhraNc9hnfEeLao884TZj9Jki/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018179; c=relaxed/simple;
	bh=0zUNFdROD+s3FbG06ZcIlC9kAGg6qu2e9eBHnz8R8rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3+u8ufWvx2KGU+EBIjD7TBswFDwFckFz6yaQQN6uGvyCL+tpMXTXWFVdJzbn0Se6rZbZ/Tr7Z2feHdNmmbJYqa/l5Tmq/60kcxoWqzMDFz2DKS7FGgALcs4SR0WId6irzReBahX6SH2qik7ZCGN9dnasBPuqlnPHXnlvMyqxeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoOeFmap; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoOeFmap"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ebso1153740d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789018177; cv=none;
        d=google.com; s=arc-20260327;
        b=hYudUiU7FCjUT/C5OyPR7DCbN0p+vzY9cg7ZxpQbohHgOVhHMxPBR4Xuow+SGsUJED
         uKEPXLs9f6LkxdJljKvQbM105BCDUILdvElGyI57uG/Tr/c0aVrEQKzFyxGkzcB0E5W0
         0Za/rBnZinQ0N3bijn21jZvoNnHymUq+Z33FtSnv8zfqJAauWPChPrbT1r+VIAiguFDm
         SJbZb18EljWIPe/21FGZhD+6jmMlFO9D2esMISUtqwhrF7pc2347VrWNTGttwfYywzVa
         z/XNprLdjmSjM//k3LV2+xrq2O/5frteMUPgZLsgj/JrawnYeCjgDBSPSgCvbv8Mdt+J
         WtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sVJ7wwjXP5FP1fIe5LzmMMJV495iJRt8J3I4dXdfrhU=;
        fh=LWVnN+eBF2e2Xl5fM1uRy/JWvdcdNfJ+QEM/Mdoik08=;
        b=JsssCQD1D16NHmJ2no7wrTxRWIlz11q1JASMR9jcYbz5/uac/+2F5sDQW7L2KdrrOn
         cClB3xzVQpUZtAYjy5CwOg/vH3s1WfIzcAHuHmW3VJp2yaD96ydvNwBvyTsP/4qLHaE/
         Kl8IqNEUf5A26Pu+wF2C3NMjUJQqtcxxcU26Z16U8H3qiJvEffZd4rmz9Nqc6QZvvebu
         gnGw57Hb6kejwipjUO/UcMceVjQPm/4wFLvAzhCMOY6/c+jubtHu86D3wAs+w1mkXg9O
         VO9K9dVfU/ywovBTz0QaDhkN5Wtef0ik1alkzx9qnIQb57SoB94wAXXQ6omEDBoSbEKf
         UNAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789018177; x=1789622977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sVJ7wwjXP5FP1fIe5LzmMMJV495iJRt8J3I4dXdfrhU=;
        b=HoOeFmapBS8z05Ctmo1zSNcUsUKCq6lSh58dpI/4A3IlyrpjIigS3XfStcd4DJHeJ1
         LLowdSJFrndshMWsDsL7uyLrmL0re0aF7XVHaYELf2PQRLCPoXqzXVBmIGDUl8F+wTnc
         9GA5EYtQkVGThng8j91yfG3+Vey4E7wTnh7kIsRJcVBeiU/Rjxhq6JeMIwbbQA7Gz/Ga
         5VqHvhDOMippO6jxgDmGSvGVYvkVmk/tV3+X+9DsOjZhJ8SoTnUxNXRgKtQheRLL+nUq
         vWKCik37JWv+nGrCLith4zRvPKxdAGPxxDwiI/OzM95ZEIRdQrQ3/MALcJlkpHHRandP
         ecyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789018177; x=1789622977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVJ7wwjXP5FP1fIe5LzmMMJV495iJRt8J3I4dXdfrhU=;
        b=c76kPs8q3lRaN+94ccXYClnNPkw6tF3q8QMGKspvoWUPg+9Mlg+pyB28hEaskk+Rxb
         y6rmdLS8u2/71WqtneeZgw0m+vOAroFHkLDLXrjBAfQaMqhb3ne3qv+A4Kp5BItp6Ec9
         RPKgO/bgh2TxmBEjGBCpWleymUImyR74n38YUpWJGrlAZ1pSvy+efiUbFgplv2zuB/Ru
         a0dWqBAYXU6YYJmll7E5042xTrryMYdaHnwVEtXBpEJm65jxPPFnvCanzm6qNnjNYSpo
         ZbE3v7giKjtvmtRkAb3g6poyR4SxQpDGfpSOg2gTr5fyZsiuEwipYGDP5ZNpQ7mfkLbd
         S3CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxai/spZN0cMlyFmMqi9+YcKtz4r1zgmbTAUUy3nYMwpUEKUJBCLvQ0CHDzIboZ/Hf2JFQDA3WpYon4FA=@vger.kernel.org
X-Gm-Message-State: AFuF++n94piYoIW6VG59j2KonuV1cPm8vNg3cxA8RO3HoclCNLYPSPnz
	MT1swYZvE63Ng8LvIuWWSOTazmFH82RNHhUdbwwle5DmoJr7D4f2CktE2rmUpaufmfuJqqT9ZyI
	9fhAgAACJBRV5Zkh0CzAJYkb3NJpSung=
X-Gm-Gg: AYBFou0xb89IxRECeBzZF6TNZEpm78E3rBO31rfudTBVrAEunc1m6ePz1McVNWaho3U
	3TYgDkpd1MWof4/5IvF/ljCjcK4kEI08+V+bEFowe2YIE1gxk9l6CoDdmgaLl4oZqaB6+LV952h
	nL8a/LvQHSoK82PInDSfwfNN2S9Urt+Usc4gK62liUSGKYqri3w7yBpNg3SCRxbab0V9OajY7jp
	ArzMEDG/9GvUsCB5+MCbNhL+lnLTLgffOJXimYfAaas1LK/3VL7GUEw+OlmZ0UoScFpZR6C1CYs
	Nx5DdREX6kmRwIGy1QgralrVWCt6MNEwtV0mdpjOj5ruZ9jumzDf
X-Received: by 2002:a05:690e:4083:b0:66f:c1bc:87f2 with SMTP id
 956f58d0204a3-67110052265mr2611416d50.75.1789018176882; Wed, 09 Sep 2026
 22:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178896921555.177508.434402948295885560.stgit@devnote2> <178896922501.177508.6894964926791268965.stgit@devnote2>
In-Reply-To: <178896922501.177508.6894964926791268965.stgit@devnote2>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 10 Sep 2026 14:29:25 +0900
X-Gm-Features: AcwNN1WfqoCBjOCD1GDG9fJFcRPteqqjXxaNmf3GsdVy7IL_frWFMz9q1scHfmQ
Message-ID: <CABFDxMG-T6t47JehL1AtwqGOV1L1iUj_LUW73=UYQ_V2_dBbrw@mail.gmail.com>
Subject: Re: [PATCH 1/3] bootconfig: Reject unexpected data after null character
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:53=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> If a bootconfig buffer contains an intermediate null character in the
> middle of the configuration, xbc_parse_tree() stops at the null character
> because string delimiter searches (e.g. strpbrk()) stop at '\0', and
> cleanly breaks out of the loop without error. As a result, any
> configuration data following the intermediate null character is silently
> ignored, allowing unparsed or potentially malicious data to be hidden
> after an early termination.
>
> Fix this in xbc_parse_tree() by checking that no non-null data remains
> between the parser termination point and the end of the input buffer.
> Trailing null characters (such as alignment padding in initrd) continue
> to be accepted as valid.
>
> Also update apply_xbc() in tools/bootconfig/main.c to calculate the
> buffer size based on the loaded file size rather than strlen(), so that
> files with intermediate null characters are not truncated before
> validation.
>
> Assisted-by: Antigravity:gemini-3.8-flash
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  lib/bootconfig.c                    |    7 +++++++
>  tools/bootconfig/main.c             |    4 +++-
>  tools/bootconfig/test-bootconfig.sh |   12 ++++++++++++
>  3 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/lib/bootconfig.c b/lib/bootconfig.c
> index aba11caf6903..0ec2874db9c7 100644
> --- a/lib/bootconfig.c
> +++ b/lib/bootconfig.c
> @@ -1116,6 +1116,13 @@ static int __init xbc_parse_tree(void)
>                 }
>         } while (!ret);
>
> +       if (!ret) {
> +               while (p < xbc_data + xbc_data_size - 1 && *p =3D=3D '\0'=
)
> +                       p++;
> +               if (p < xbc_data + xbc_data_size - 1)
> +                       ret =3D xbc_parse_error("Unexpected data after nu=
ll character", p);
> +       }
> +
>         return ret;
>  }
>
> diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
> index 7dc9fff9b637..6035404733c3 100644
> --- a/tools/bootconfig/main.c
> +++ b/tools/bootconfig/main.c
> @@ -422,7 +422,9 @@ static int apply_xbc(const char *path, const char *xb=
c_path)
>                 pr_err("Failed to load %s : %d\n", xbc_path, ret);
>                 return ret;
>         }
> -       size =3D strlen(buf) + 1;
> +       size =3D ret;
> +       if (size =3D=3D 0 || buf[size - 1] !=3D '\0')
> +               size++;
>         csum =3D xbc_calc_checksum(buf, size);
>
>         /* Backup the bootconfig data */
> diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-=
bootconfig.sh
> index fc69f815ce4a..530ce7e28d63 100755
> --- a/tools/bootconfig/test-bootconfig.sh
> +++ b/tools/bootconfig/test-bootconfig.sh
> @@ -180,6 +180,18 @@ EOF
>  $BOOTCONF -a $TEMPCONF $INITRD 2> $OUTFILE
>  xpass grep -q "1:1" $OUTFILE
>
> +echo "Intermediate null character test"
> +printf "key =3D value\n\0extra =3D data\n" > $TEMPCONF
> +xfail $BOOTCONF -a $TEMPCONF $INITRD
> +$BOOTCONF -a $TEMPCONF $INITRD 2> $OUTFILE
> +xpass grep -q "Unexpected" $OUTFILE
> +
> +echo "Trailing null character test"
> +printf "key =3D value\n\0" > $TEMPCONF
> +xpass $BOOTCONF -a $TEMPCONF $INITRD
> +$BOOTCONF $INITRD > $OUTFILE
> +xpass grep -q "value" $OUTFILE
> +
>  echo "=3D=3D=3D expected failure cases =3D=3D=3D"
>  for i in samples/bad-* ; do
>    xfail $BOOTCONF -a $i $INITRD
>

Thanks for doing this.

Reviewed-by: Sang-Heon Jeon <ekffu200098@gmail.com>
