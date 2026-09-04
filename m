Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072E40E8C1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511705; cv=pass; b=Qo0Gw43vt14oY2th4wJAzC3Qd7BE5aB2rHl/vLddkt5gzyphbcTnAGBKU2e5QidtmOT/LKyHKV9tiLxmb8QCeQr2cLnZ/6hShhopmRG1cPww9yPjjJQay5WWHJhL54FGNqXHRT+4gLSne4CYu3aMFTEazQNnZkVaCg3mXRxY89o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511705; c=relaxed/simple;
	bh=csbZ5KAl4vKfesLimfYyTmN73lP+bB8BTXIrPZQ6Haw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0DIS1206zjUgcbiuOrD0f0KbEWNlVGskBG82C7rKy55oASdScazQlZwl2BFxsQxzhQ67Z0ll7tKlKLPfzz7J+nk3iqaiUgvDS2UWfFQjTQQwsfC2rMDbT1L44KNASz76ljklDXnVBuZAE8SwxeSM94MK+jGC614Cz8jgmrVrMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=bYvD+FjS; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="bYvD+FjS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e592da74so82462766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511702; cv=none;
        d=google.com; s=arc-20260327;
        b=BB2kX52PILfrZ7DUl+rNdeQZuORbMkNdIpCEjGjY+MjXPbAl6t0NFF9JIySkjyHC+2
         4lC8D2Ap8YJ8+qgv6GQbuFhA4loO6GfZ3fKc5vhDoDk6q8JrNfzXEZcB5XujVSfu8NWe
         eyyhT/HdJGffoNNIXG1nOC40bLc9k8e/HL4ITqBb3g6hRraczeqxlVBs2tbBipbreX/b
         2AbAilOWl/5btxSj/RAXADptukm7/q51aK9OCGiY9uS6sOcrzmRrkvQpTG4KNZCxr/O+
         /ND0rA+iA1muoXO7XpRXOIm+HPMzfC7+sQyAEqIHlLdgDkei90P3edJTMKqeoS0VXbKe
         CnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFwA+0YYo9We0NL/A/S6sLwbGWp28OfVIR7TYbYUxkI=;
        fh=pg1WIYHjhYSnAl9USahFDbBFECED/GjlltIDQLY8hr4=;
        b=DnkbHk9WFoLraUHdJuExtCnMscelYdHR7nLOf6WIRwLtq7VFgeQ9X4iR0z07m5e/qs
         68+YJTfW6AhA+Ezq1md3EfJJIRVkWzJDyK4RobKQ+vai6oc4aIUnnKrAoQMumYObRCCU
         sVRDBStFvbmeeD/kdA+LQt+txQeglJMNp7Yr61ctNPeAnmmqOjz9eHK0uNP3xmxGX5qQ
         Bw5IY9X2sl9hpe/2l/tSHyuHXxz7JkKX4lseh7mivB1jFVaJ0juew8/3mqP4zB1lY7iw
         2c6MsEnFs0im9XgricTpM/PavDQLuUJqtSAW8SWCdZcxvKFh5BZxg6yErDVqOqlEOl9q
         coYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1788511702; x=1789116502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFwA+0YYo9We0NL/A/S6sLwbGWp28OfVIR7TYbYUxkI=;
        b=bYvD+FjSus3KiZ7Ep9GrhGd1vV4HUQ2foQkActPMvP34kXZUgntJJ7WWTBDFSn2pSx
         fChjSzjQGuE6diDlqVc/5lNU3eo2PnLhf1uFJDC8Jef4eAPxLJmWmL8oMFHrBDVGcUlF
         0EC9B/5kOSzwbdqkby4tAhbOQ2Iu3vJjiu5pYpS1l4l+ZihFR7Sdp3aO1kv/vPW21YNs
         RtkOD5pr/hSza8zQ4cP8pSjFwos+hk9Vd5DVaF2IEqxMLCZwZgK/r6VbSVHQBYl92tNb
         aX6beMzfnJYAgc7SysJseH79d9j3xyiZ0Zac+Taj0siulsJxGFu7Eu7T/Ux6db/8caCO
         moHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511702; x=1789116502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFwA+0YYo9We0NL/A/S6sLwbGWp28OfVIR7TYbYUxkI=;
        b=I9cM1sRbM/pIeS74S7zoEyP0gh1g8dbmL8O3f1P1q77jCJIlDdx0FCZtR/cTraKn1L
         UVqq7M5jA+bCalC8maiaGzdv0u+unuhUry4i5r+raA4TMbFxClHLpn0HxpOJtoRd2vuA
         mCZJDZ70xHlVIHSgka+Kg13IilgZ2tFD1tocecxusIasYpnZmXw8lCM9aeoZDXGYp7VC
         jissBSbl6I66NyyuMOXb+QTYtayadVQQ93vv0ensoPjBZAnRBuzb/G+O9lgrIP2RKqtA
         Y12SD/NEy1ElQbSk4laoUvWxENW9w2sKeX3LXPkcyKxo8IIsmcLN5bev7l3w5osEl7uS
         /x3g==
X-Forwarded-Encrypted: i=1; AKwUvBxJlrL+sW6r6BMIW+J/pNuGYG43PMZQ4D0z8OgOIsKL7eRgM+dhlvz18lFcGGSHAroJwlPACwCeqRaAxbk=@vger.kernel.org
X-Gm-Message-State: AFuF++kkeTqiawrFqqBIOhQM5bmoPeUAk2ghLsyMFXQOCJUB5zZyw6hG
	g2HFOlsROgLt8nPE1kELTurbyWfpNSrrg1dUzaEfhGDMN60SCN82L4jmloZDhdqSR1h5IVr8/q2
	WD5eTR5LpA2dCXPXVmlPSvWnYiyjWjncuhotNcfcSYQ==
X-Gm-Gg: AYBFou0nvgeiaUVs1YhFNI0l7s0asaJf0hzEIKAHuxqYSYMnWkvexnAfT3kHNM1SYxz
	v29i9vjEX+GAfYBZshxgc+oSsQLPzaFKLkS5+Wwac5PG85sDF0faJYF7hNql4JD6/G2gkzKbgZf
	QWTOZGZul97mQD9xsxiezp3B5Z3odtZ6L/GXdsNmgMrx9UX8H+DvA1W1UzDIVGwJ68AMlVbePv3
	bnXrTy1byz4RQMFeDcn3x5Bg9Yss/ksa82vqjOyL/whyUcnDrzB41T0OkeRExyxWRH0+SXOdr2Q
	sTh1lJJ7RrMKTGee1lx/hWW7FBIE6fjSuxDOx4dyB0usJwI/xyEr+Qxj
X-Received: by 2002:a17:907:d206:b0:c26:19de:9ac6 with SMTP id
 a640c23a62f3a-c2619dea68emr60778666b.30.1788511701432; Fri, 04 Sep 2026
 01:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904045803.810145556@linuxfoundation.org>
In-Reply-To: <20260904045803.810145556@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 4 Sep 2026 17:48:03 +0900
X-Gm-Features: AcwNN1V5JEyMRQOoTWxhoYs55bOvO-Fzg6C42vOCqnnnM8kKEll9MIurC3WByhw
Message-ID: <CAKL4bV6vhyqtFHw8Mb0XywmooHnFp6AFYsYGEUT2vm804HXTFw@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/713] 7.2.4-rc1 review
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

On Fri, Sep 4, 2026 at 2:09=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.4 release.
> There are 713 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 06 Sep 2026 04:56:59 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.4-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Linux version 7.2.4-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.4-rc1rv-ga5fdedcba898
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Fri Sep  4 17:16:05 JST 2026
Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
