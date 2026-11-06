Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793954967;
	b=r5JEWp4p2M3khkzvlGOrVuDQElTt765+5XAHuTuL2wt5qmcOQmucVHnWSS4VT9V7SY4O
	 m++H9hF7QBCHfu8akjcEudXgj9v7a/njqx1cB152tr0UUrGJ931IR8zDhSgtBRUOqoBhQ
	 jzuU2SI2+DLjA3cRltRwpwAfOW9empd1ssE5ccoO2qvJEJsYIktOwjdn2Jyx+mlEb4JV9
	 +e3ybiU/yjBJ1vfw6cCTMhs02qiV6h3i1u8PyYgRf2hY4fuYe2hD/40bn6nagG0H1H41G
	 OwivQ7EPk/0KD9l8dQbbAVX4y8escPhuCHnw5dlE6gB6r7xe0wz8vPSxQ7Y598CQCBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aAUjBfN+Ow5v0eWrx+Nw5CLPKU13V24M0Y+SWLDXZ4E=;
	b=0b1KorbbPl6Ic+rs7yAmDxQ/icFDULHLDybwP6DCBpjQ8uHy6OWIpKM7JW7sXijMpQig
	 RfTkz0VE1cAhVlAGWREHSkRjtAbYFh3fWwyVG1NufNqczcpRqRCM0DlEMTrAW8Ws06i82
	 OXp+avoYyT3Ltx1+pbZR5TQlCefgcuvmhJpy59+6lb7kfXHMKVD6A69nOUAktQzvRAOVj
	 KJU+586GL3AorBjq/mlaIIqInARBGUCzYSH9qaeCA/qkIDMB7aLheD0CjHtGG+L8kNBmL
	 3egdGtChj9ZVnVXgO/s5AivWf/53/7kHF+2Ml3CPOX4LjlUt467DSiYNMlquSENjCCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asa+ddil;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.138
Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4929606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4929606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asa+ddil
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-91e83f4d33cso3637596d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793954962; cv=none;
        d=google.com; s=arc-20260327;
        b=WnjhSgaOnlmWIkmCl7p5bXRkWg3exJ33396ZIzWTm41vEKRsP5E7W1u8ivAql8Y6ze
         OplrhxmQADeTqfyl37M8YM1Uw5iF5yGHZqSk0ZEz2gFbBAztFWIjhF4tALEQQ20hdk+A
         5dcb6bZ+nlYMJHkbS+Lm9g/r4wbGE6A0kvOEYOzz9xyQGUw+lhSkxTr83CVGDsLtLXso
         mjuz5Ml/HuwFFxU3HM522e/9UT4bbjCoB5mfVK6cOeJs66SyKujbZmSlF+gSPkZidGGB
         a8yECaMLK+hVmmDI9ANFT63+CVTmI6B6xkjo3kFk2q/n2hNxa9V3LZ3u7g46PJ6Uz6Wz
         /Ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAUjBfN+Ow5v0eWrx+Nw5CLPKU13V24M0Y+SWLDXZ4E=;
        fh=PUYTM6pma3CouD9qXBVWvYmSOufpBZgDiBxR0EpAW4I=;
        b=r/KgXlay103HpLayAuCOrXBETJVFC/AC4BY0EIkDQ7+jD0+7ac9P0z3Oc++T6sqd7A
         z+8ZATKAB+F9/EPK1qnotIohH5rJJlJiuVrt44c0pWmveJ8I9DQ3V8sp696lrfadTSQW
         kaqqSTT12U3OjUYhKZvoTy7C6Q4crpRHcP8kFRkKPETZr2huPWV7OEswUN1793s8ldqq
         yxGoOkci2ICl85cJi1insdkAJ7dirhkFfB6gnrQlYfNG2Bb7ozOGBlVdkPhHt6wUwRBc
         GJNaaxsUSoo2G0YZDNlLo5ZshBASbtggeO40VnZxZjPcmFlpOf+F5UPL7d/yUIVC+gLI
         O1Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793954962; x=1794559762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAUjBfN+Ow5v0eWrx+Nw5CLPKU13V24M0Y+SWLDXZ4E=;
        b=asa+ddilQIBt7rRbkAhfVSLcu3rbxK5KtNYOTTFYcdrXxl0d4ILbCyDMEn4N7t+1Ze
         A2fS/PZOIFZxHBd2qUuC5smzQPY4V6+4OUoRjjoqx7E1c1lja8qvDXQhkbjo2Rf6msGY
         EbF1Dfek0kV/aabmjcMvXAeLKSN3r2ip3j1MAqE+pWO2chbYMxzvRYCS6Dee1Wwt1g9+
         grZfYhorONBWSSaCEMPz9iTqtdLhSTED+tb3azy/hcGwgfQAr3A9Uu1+g+Rs+I58dmt2
         gp6r7W8wjH+cj5j2vbjbGlti3fW59fzt3h5c9nJdjM9rQ09jmRxHl8TCAezFQ0R3rv3j
         0stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954962; x=1794559762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAUjBfN+Ow5v0eWrx+Nw5CLPKU13V24M0Y+SWLDXZ4E=;
        b=X8ZCQp2PFM/W97XDJ7xdaK0S7sXoPGte6+sTyxr6SdFkJYvPPSGEVwb7fI364vpQ6R
         nfgVetj6sNtM9K3+MO+ClFYUhzH3cWuleLHhl7wOMGIgzCkbztGpjOlMagcFc9WLJGi7
         Vz8HViQkJ6NyLxjPCc1dNpoqXw0UTqiN0HOIF1poVLUC3rWzjcfB86BSFDcg3xuUYRHe
         PlbYsZkPPZSWq1FH8iDWHOUgBA3Y2Jk0Ob4UsqIg1xktn2kPPbq8xr8fJdmU9xVWscYR
         5fvFqTDxX5gREiLLRWhqI3XaLtOjB20DwGst4+kn73HqIgF6g55sfXAAnQB5Jt7yjKA0
         js4Q==
X-Forwarded-Encrypted: i=1; AL+hErFqm31kylm3MiqDsjDTOMX+DXDzC0A10iDI+EHxOQWRm/KipI8qfOrO2dMqx6tKpuYzOEco968uzCA2ajU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eVbG1/hGOambZEeWTlJOAwiiuIkaXJAs9GBlLLaOd82nZLJlu
	nJFkC9IbNjJEZlKFR4cmBEibPw+UHwBeYGs0L2NTFwy+feZR2NIozXSIRx+kEuuO+v7VwkkuP7l
	40jIiATcQf2Xv9PniRGvPELfc5UNX5AM=
X-Gm-Gg: AYBFou2FBcZKevkxTs8aFi7WcgMSA5RbdUOiRWAsTMdPXI6C6Vjpwt8qx4ze7cHey/K
	w6A4v3OtjUGq3ouCcP9R+OZBZkQ3vtjHKhRljJm7f/lnhTspRZFFquf7qgNupwszEVfIYw1B3+B
	9kNgzWwjmB5aYotne5jUN5ulyXdI/6k8dInQNM9hsuwRVKg6lTEPFrXhuSih51wX+RUhuS489sJ
	A6hsoELRz4oM41U20KL3L2bmYqV7e08fcYtsS7w5/v+TjYoZ1AM+QCchI5jgg4H9Yme2/5gvYKj
	BBQ/+IAHhAf3wI0dXRANOmwgbo8J/CRuSDTnDBJ97pQa74UwdxlLn75wi43y3D4XIw/OvQQlytV
	cdnf5KL/JJm/nhFFTcXDCjPdjPcvTaBh8mep44g==
X-Received: by 2002:a05:6214:3289:b0:91e:a362:fde3 with SMTP id
 6a1803df08f44-91ea993442dmr23957856d6.51.1793954961670; Fri, 06 Nov 2026
 00:49:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFxp=AY2cVRQrZvB9WNnigbsobuw11NMG-cagHx0_V+ur2ToFw@mail.gmail.com>
 <e4054f5a-e60c-4253-bccf-d05cc7c615b7@nvidia.com> <CAFxp=AapgUYLUhipVjR8oM0fRDSLDX60AQf0UP8=U4M1ASqmOA@mail.gmail.com>
 <e6a557b3-2986-486d-9679-e7a4fd1cee5c@nvidia.com> <CAFxp=AbmdmTsj4ugjxdKhRR=LJuuC1yr7DFnLCSgOpC2g9470g@mail.gmail.com>
 <atZKOtjrb9HKSNHF@dtatulea-c5.nvidia.com> <CAFxp=AYqVgR_Eahz2QsC=cCdxo5GmTwdHcgBdXRGf9P+v0OJxQ@mail.gmail.com>
 <d6c14ede-1cfd-4800-a8bf-5093ab8c000a@nvidia.com> <4cd75251-fbc4-402f-8939-1f6133f3b40a@nvidia.com>
In-Reply-To: <4cd75251-fbc4-402f-8939-1f6133f3b40a@nvidia.com>
From: jiabin deng <dengjiabin2023@gmail.com>
Date: Fri, 6 Nov 2026 16:49:10 +0800
X-Gm-Features: AclHuK9b4KLW_6Y9nV1CiuE9RC4CEq_MHrw70_JTORdOcq5STyTgVC_EA7ZLoD4
Message-ID: <CAFxp=AYboDhxOr5NXQajLn5rpi2Zn_o4EDJ7GxTZrnp0Ogd7ug@mail.gmail.com>
Subject: Re: mlx5e:zero-prefix corruption during TCP DMA-BUF RX - help requested
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, saeedm@nvidia.com, tariqt@nvidia.com, 
	mbloch@nvidia.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dragos,

Thank you for the confirmation. I have now submitted the fix to netdev
and copied you on the patch.

Subject: [PATCH net] net/mlx5e: SHAMPO, Disable end padding when
relaxed ordering is supported

Message-ID:
<20261106083719.22798-1-dengjiabin2023@gmail.com>

The patch is available in the netdev archive:
https://lore.kernel.org/netdev/20261106083719.22798-1-dengjiabin2023@gmail.=
com/

Thank you again for your help with the investigation and for suggesting
the fix.

Best regards,
Jiabin Deng

On Thu, Nov 5, 2026 at 10:14=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> On 23.10.26 15:14, Dragos Tatulea wrote:
> > On 21.10.26 07:19, jiabin deng wrote:
> >> Hi Dragos,
> >>
> >> [...]
> >> Thank you for continuing to investigate this issue and for suggesting
> >> the fix. I also greatly appreciate the time and effort you and the
> >> other maintainers dedicate to the open-source community. As a student,
> >> I am excited to have the opportunity to contribute to the community
> >> and to learn from this process.
> >>
> > Thank you for your good analysis and fast response!
> >
> >> I would be happy to help prepare a formal patch with the test results.
> >> Would you prefer to submit the fix yourself, or would it be helpful
> >> for me to prepare and submit it based on your suggested change?
> >>
> > I am still waiting for input from the HW folks to understand if this
> > change is needed for all SHAMPO cases or only specific P2P DMA
> > cases.
> >
> > I think you should submit the fix as you did most of the work. Just
> > give me some time to check the above. I'll ping you hopefully next
> > week.
> >
> I got my answers. Feel free to go ahead send a fix. If you won't get
> to, let me know so that we do it.
>
> Thanks,
> Dragos
