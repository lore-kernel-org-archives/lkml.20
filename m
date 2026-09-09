Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150303033DF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995350; cv=pass; b=b1JwVjF1rtym9aBUZfEfwseqR16DvC3qmECYzL/zq2s/JpmWWzoU5DRUJIag98zuS1gEBQpKZsVPYy7ixEzoJQWMwUFdyFJEwMrGy8jvowHtvjoNnOCZPpxpwEMkx8SfzRlr8fNnkvBlSQbmBJ1xoEPehZag4WwLQ+ostB5hmuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995350; c=relaxed/simple;
	bh=nb1YblmrUlr2sa2V2CZkzLqPe6bh6GMBpVgP0JRYHCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etNUM+g4t7HmnMevhRiD5baVgJI+U+s9mrKthbUUScK1c8RvsTYwApxw7OKcU7gXPxY5NdU0UWIHO3AImTCpuqe23WNev1VvChCiD+mRcUrcEeHqos/9ingmOvCSNL31BMzzNqj7QpThP83iS6Jk2EMymZGZq2rcF238qqmvPUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=gpQ3LkG3; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="gpQ3LkG3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so9050219a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788995345; cv=none;
        d=google.com; s=arc-20260327;
        b=YOen7WdgJZqrq5KbcwZdR/s6Ytu95K/ZQBo8+SOivI2ZaYZgsqwjNvydaTXig52MFg
         YSbzCl/OaDJ95iWjqoF4tD3lCuhGEcvBG1ORNVg8iXX9PHy0wNqigOMzkQ+qNBJTXOkn
         zjS0YkvGwzltViSPsPLMbXmZLgmcO7PJFpeXP3JjRhzcE9Sw8o0nqAeqi04pw3k15RRG
         zMI17qNXQfiGAdx1pzxKXgmZ9nEEVi7TZR0m/Pab8oBarYH3BRSImFIAYVt2sgZngagO
         ZVqgvy6kP6foyz9hM4GVVOBWjcI15uGmeSou0e6DHz2twISCgIh504tyJdEI/J1OBy7I
         Zqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GqZtypdgnQbkzEFaLVtmtAULjzYK8mwtxUr5PWfFkcc=;
        fh=d58XqmWP+fpceStW18p+CU5iYJv2n0kKVST9QdQm8iI=;
        b=eYk1W4vLyEz5ShFicseNe171Q1vHGKXHDrs08ehMRnjxS1ByyaVlhhX6yqjtH3i+uf
         CJn/aEoBJCa314+m/PQBnY95hv6/2wOt6ysEA4EtGTGva20NOjssEOFltKgjynpgH4ZJ
         j/BWzvDLpwp3yb4g5y3cC5tJIzugWPm36OrJMsF783Hil/NTkelvPkFSN4ILq1kZ6/ah
         isrV9aoAiEPSvmgAbz9BkdQwKvziXCgyHN2/uOlczFqjTAyuvUm3LX54dD+lUDQd2Xtf
         aQnMeRLQ5cxDVDSYZzw5Bcqng0D0V9OU1gfqN40MNhYLrfUGQcWzs1hOEhe7JpuFLJKE
         Hqjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1788995345; x=1789600145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqZtypdgnQbkzEFaLVtmtAULjzYK8mwtxUr5PWfFkcc=;
        b=gpQ3LkG3bzlKZr/h03MwBWovXuDOnbT694YKP5hiJq0/pZS7VHZDhdBwhCLKSqx7tL
         SpL+GRjq6d4qZ9ru5QoYB1ylqz2jxzB22uL7FEEtY+s5ZlvARG+debVQNRO2vOhIwYgZ
         fXC6PI+1ZmodS9MEkQdgGNx1VmAQVBs0DcBfgmUQJmyqImFDx0XXpps1gAyazAUR6/fg
         YLwP9JP2L54sE5ffFt7/FoloFckvTDhk8SJbCZpPVMHxOTLb4hDbRqNqLJhi/Ft66IAS
         OaEHYczx8hj3SQCVFKtqQ754KsjBHOyYNdb3Iynq1j6+F8UJV2uDegRNQeBvrKsyah59
         RwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788995345; x=1789600145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqZtypdgnQbkzEFaLVtmtAULjzYK8mwtxUr5PWfFkcc=;
        b=OWK9zKfGMUyjPCeb1EyF0tfte7QJQUwxUY/2sd+undGeKaGUhmfcsUlXi/B0B/TdXg
         RdDRXQ8LoSF60gQxq+DoYrEpdwQWF361JJ5EewGzhx6EE+cdQ8SjeNzHZeMiBeJrLrZC
         NYTX5TrF5VNMArDsF3llv8hWFTWGDHvUvlsln6Fr0qiKmhVW/UZNoCGeUd5Az22v0BMt
         8EoUkj93yRgH3IArhoto7ZUgtrNfNwlHj8OwXKDC6RzV/SaUcmLs4s7NXyOjMCmAT3qA
         cZEGp53OHKqdbcMnE9EUO2c2nUSr55bw3EOnkNOR6m8ZHQjvhz0qGxVif1k0ULLONbVz
         Z+nA==
X-Forwarded-Encrypted: i=1; AKwUvBz4I5B4FgosXfvC19wQ/n8wGI3l3u1tQRwvPx8F1ha23ynHLtRlaHDrA/FPXRAU9WCZIQd06/jgRkZyke4=@vger.kernel.org
X-Gm-Message-State: AFuF++llMdydelTvRPrYJt6Td63OijTQ2ijmMPISOUxOthK9jFrK6fsK
	yU4ToOhvA4jPdxr4By2pv2Cz578DQaO7Be+1CJIDkQemie1Gx9PSrm9jaayAbrCADFRSeZ507Rc
	iPvQDK3BI+jLTm9BEaampUQLdBcpH6u7v6Kniq/jcAw==
X-Gm-Gg: AYBFou1DQUdz/ubGWmIWg/jSbScACG2Y7H5Xww4ydG/HHuqow27e6F2lX1HWG867ToO
	s0CcrAaeysDLSD2K2kjJtWI+dQD6gS06vA/c8jDtrGfsS/uAGJyxzZ/r7x8ZY1PDYxFLZWE6UTm
	kDKKL7vAZkOWoZ+kROR5gBSNv8OgZtP3qRVDtaaZDkg5UDIdU7CYtcrs/8RV5Jz25XQSH8mI71K
	9FtiAw4P0ZRtx8y5KNOVgRsQtvY7Cb4qgDh78yW/2I4aQz48vE23vsNxaPdx9OtB/oEMx6HTASP
	fE/lQNLhhzFDucqEM5qxxzORf9F5a5MJJpEBeja0EHZM6UPo+w6rbBRRuWavuki6AHw=
X-Received: by 2002:a05:6402:3546:b0:6a7:ee56:8158 with SMTP id
 4fb4d7f45d1cf-6a7ee56823emr13010872a12.38.1788995345102; Wed, 09 Sep 2026
 16:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909134230.441546314@linuxfoundation.org>
In-Reply-To: <20260909134230.441546314@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 10 Sep 2026 08:08:46 +0900
X-Gm-Features: AcwNN1XsZj6QFOQ_6a3WQsNELHQa_nUcIhH5WCykY4cQ6hErmSK2vs3WnidzMYE
Message-ID: <CAKL4bV6sASyrDc81R648XH+kV-BSOa+-v_4CpEp38KiHzU8_CA@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/556] 7.2.5-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Wed, Sep 9, 2026 at 11:14=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.5 release.
> There are 556 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 11 Sep 2026 13:40:31 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.5-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.5-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.5-rc1rv-ge01c81012950
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Sep 10 07:34:49 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
