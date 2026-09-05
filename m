Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9483363C48
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616775; cv=pass; b=ixSM/zoIcC06pr9Ld0bW1oSkNwpZseIf7MQiWF9l0wC97AEyEnXp4z0LHOT1acA2+zQTTwo5vj+2Q6BNhx8n1aNfWSbafh1yxuHs0Zd/dO1Y2Kodq5+g9R1PDsUgih1kCnYpZqgLGeAieEJJCCNgO37HGCoTuE3xV1mwLUtm2DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616775; c=relaxed/simple;
	bh=0NZgvcjxD//y9TcBVnzxsrfCCQmI3Ud37a8Ni4R+RGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIkJ3UR5mJgB9dL/jZj0Y0DSfZdMzAx0DCXRZkA444kB0r+HzZy8ioSo3FTZNcf8EREoKoFBmJ8rlb7sA3sSIFLfL9s66ZRlrSih6DCIeRzb+0I/KGM8x1Hbu0jsgecDPNQkUEuB2f8CLT3KTo6mObx7mMJBE0yar4BOXhmKw+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+hYeY0e; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+hYeY0e"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5e329c0f2so2254310a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788616772; cv=none;
        d=google.com; s=arc-20260327;
        b=f2bTKyFNP9q/XzLgr/LZuh1pAsv/ymfTJjRP8gYXivGp0F3ZYBwjgBolKby4VV9lru
         FBuS9d3mnucUv7v1e3w6i6RJ58CVqdIp6PmpyBsZN9K4O+NyWn+lv7YiQitKSYDCm8e5
         Jlnil2tQjUYygMqyTyNL6VqkQU5Nu747OlpGmZOVjLuD6BqDLtELaELcoTIwLIZvgoSv
         YoqUBrHiVZOpI1i0eZaQB02JdWXqiecGc5s1+uObHAVuH9JMGFuC49mfInJvC/w+7DTI
         ZneMw4htN20SJ3AmlCfPoP4y1mGs5K7QwMqzGRNbNGEMbubdXgyh3HGWOlm8EDzppXiH
         vcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        fh=fw8BLWGJ/vUI58FR+yWrSuzv065/kVVn0JdO20ykkBE=;
        b=n7YzCjZl1AQaZsS5M99QElUjV35whmcS0yQ4mYDE087kR1qeMkI79OOVXacjRJCRck
         4bdf9tW4sxru8cGTmnyhCN/iLqzTT4UQtdS9hhgddTS2+jTCb96lGsL2jqgmTdUvvveK
         BH6HMnfHO//kCigUih14C4koIa3TdUg0bLg5CGVonD5KicfqSVexk0E3EqqqVPGGu/Ni
         CX8tMVmBtrj51g1ZoKJ72jdd13EImYx3X3JZyr6vFZD3yPGrbahefWYE06ITkCtOPEnn
         D+SnBJI9oN/DLUE6xC2LON4JxbZ20ZXcEWCNhWoaYo9j71eJHymnlWewnXyk8RyBQ9gy
         jF8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616772; x=1789221572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        b=H+hYeY0ekhuwq6EzSOpXyPjw0JubJRtzQzwN/zPkUWxz1pC22fokJYR+IdLNkhJEwt
         FzTT973ks9udGWyjCXyQERFn+DMXlEgwLy1pw/rI7PhYnfJNZUOJU5xykhiRsGbl+1tZ
         adj2azTtCGVhP/eiaphHW1PRm7SIvIuu9Fn2wIBpQK339QMu3h6bp86+yYBoELNVcc/N
         F70nc2EL+wcecxCApC1qxRsf61QaGrAkerrTtEIHzkBCVJxuY3l9hHelNEpbY8K4i184
         Z/EJRQLe+wZQ2yNqgedjWTNfh7MYZ9ys5PzSicFnad5QEgMMA3j9y+cQ+97ee5AJqH0c
         nG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616772; x=1789221572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        b=WZ+W2VN+sHDYH5XkunhQI4anbOLo88J5SdkqKaNrtpTMrfE71GJdYAYhiUfDRo9pHF
         TsJ4R4z0RxXSCEkAEcqho99nZMgdRvT1guL1ENWg4WzV+Eq0v1ua97XL8dTSAZRIvRYF
         CLtA6Nl+sbZUKr0bVyYsyJF1X8pc0Tbp3scooY5ZsXn3yH/Yb6RD4CR8jPJ9lxXCEbiw
         rnO2Zdj37aVenaert2VWi88M+6Mo494KasCHnAC8asPG1ZIdN1+BIkfPGSq0Z2jYtcgQ
         ReFRllQPnKAiG3m3EiVfvnmQsDDqi4hUMJBBDvmufaki65lPx5obV20vx6bD6cP9MYwu
         ZB2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3oy8hqG8W9H77OqgR3O9pcFEIkbmvdxYoFscKAXBdYNqqwMrBlX0+NRubzJhWNyLXLf0NcxwVdptPapY=@vger.kernel.org
X-Gm-Message-State: AFuF++kUpzyX+YMliKxxpZot3MhIJKkrwxJiazemW4UanUcI4BSXe7lV
	93HLIR7s27epYjh1zxIlBdHHSThLDoEn8ijp0IkUgwAgKN9qjQLL7IUrbHDqWXLcHlegevO6ND6
	lIc4EJu7UsOTmOc9Kzj4HhjC1j8KWNIM=
X-Gm-Gg: AYBFou1PmElQMFkfbxO+dxY90Lutq0ovEUOrTZbNAGBDY5k1HUwpaB/yfkTBIxlNH39
	RoQ6h+syMFtStg+GGS8oZO+EY9m+hqcO3gLGXb4Sm4YDv2SjrKFRftmHs96EpkzoSCL8I9caQFL
	di4AQaoQTqBbGKSy8O/KOhf8NrSacMJhrpmCGnsDOkynF03gGFQKlw9cZXyyHummxPUncm0PRhI
	0Ddnn+tTEj8H0frjcN9oRR9en0XgaSNYxKFCSFLev3y6dFwNgfK7b9iNvorZv5YA3Mapsx16N+/
	ARN+SqWqoZnhk/xRZwvF+4HIjAav2FtrvPzUuHObCPpVoQ==
X-Received: by 2002:a05:6402:4343:b0:6a7:ea53:f624 with SMTP id
 4fb4d7f45d1cf-6a7ea540b3dmr3578271a12.35.1788616771728; Sat, 05 Sep 2026
 06:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-4-luis@igalia.com>
In-Reply-To: <20260904103920.4471-4-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 15:59:20 +0200
X-Gm-Features: AcwNN1W2vMf-WzY4zwsWBAU_vcsCDCHvVaEThEDUXBh2gwCNW5IHuyRc5r8QctI
Message-ID: <CAOQ4uxjCFCS=V5SLH7QT0q1VmJUKKVkWMSgd9DAtdM9U=a_EWw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/8] selftests/fuse: check that fusectlfs is mounted
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> The control filesystem for FUSE needs to be mounted for the fusectl_test =
to
> be successfully run.  Skip the test is that is not the case.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  tools/testing/selftests/filesystems/fuse/fusectl_test.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/to=
ols/testing/selftests/filesystems/fuse/fusectl_test.c
> index 0d1d012c35ed..b828173c01bd 100644
> --- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> @@ -106,8 +106,15 @@ TEST_F(fusectl, abort)
>         char path_buf[PATH_MAX];
>         int abort_fd, test_fd, ret;
>
> -       sprintf(path_buf, "/sys/fs/fuse/connections/%d/abort", self->conn=
ection);
> +       snprintf(path_buf, PATH_MAX, "%s/%d", FUSECTL_MOUNTPOINT,
> +                self->connection);
> +       if (access(path_buf, F_OK) !=3D 0)
> +               SKIP(return,
> +                    "fusectl doesn't seem to be mounted: %s",
> +                    strerror(errno));
>
> +       snprintf(path_buf, PATH_MAX, "%s/%d/abort", FUSECTL_MOUNTPOINT,
> +                self->connection);
>         ASSERT_EQ(0, access(path_buf, F_OK));
>
>         abort_fd =3D open(path_buf, O_WRONLY);
