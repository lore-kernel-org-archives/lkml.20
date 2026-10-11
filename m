Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327B433BC4
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727923; cv=pass; b=SooEmXzK4hzXFrN/xgqSSDtI0D/EPuAKpLctY8vvwkXDsRWXbl6sYCFoZ3zpIRK+0E0NnhL6jWrn1J0KG0cGtng3wpfHf0KEEBWcd+VfMt0xYvbjdx+3+PwNkc+5wrd5+U0y955v+r8eUZtpQmWf9GyqH3zun0jIVUeg6N0ch9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727923; c=relaxed/simple;
	bh=wdRnVqUf1ZGud0eChWIXjEZO/K7UTTIev25EskoBKgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SklOun0BPnN3a8p7Pt28Dc2RSDQCseQf8blCLYyKGLPHO8m9KljjSNrdPPqdfX5bJnEBm8XsSvt680u7FDzf1vBJZCDsvMMz6RQT7OWldHxRd62bk5azmzPU43jY+T6XWn9+g3sBpTz244yXkhIQlsS0MJGxhSr1cEYZfpE9yZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azOeW3qa; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azOeW3qa"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3584f70a5aaso114304eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791727921; cv=none;
        d=google.com; s=arc-20260327;
        b=OO2lsjr42BiJwJkGrZXeYZ4DKDRlEMSV2tiIv8Rkia8jcssKpHsb6xXKEwBhdtNiuP
         msQgg8WTT5xKz916G5T1p/fWeD/q5+0qvH5SZQHa4+8QvF7FsXrdAeJwd3Yb/ijUH6My
         8p5BEgDXOEju3xVqNI1/bbk0vV6a9CwA/tLQNtt+N2ayHBpE/QKXSZ86cmLeSct64rs9
         8lV54OBdyL+H3A+YVD1uKjZHXkwBgpsPhaHxzd5RSnJTFeMRQchvJxq3tmGIQSQkEPXW
         YCSfPSjWZfE4GMYM3OzGvM+sxrGLxGrYMuWCLqjq+RFaTPlsWCHv3P+CpB8cDOAcx1O/
         XcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2A8o9vYIEEGemnCCmWv7AJBvyLztV29qJFJ0TTixwU=;
        fh=FGPTrldrrnTy/qdyuzxM2eealSQf6r8FhCqmz3ht22Q=;
        b=dv+d7C18ikLleSNskg7fuMpBa/8Be1eadxoCbz8xSPRr4vX129z/9gq6zdNnhH6sAZ
         3SwM5a8QXQAGOPbChb1T4zh1NsxxIPE86ol3s0yo2bYvv/J/RqH175WSXwnEgdLf48cD
         m4DWs80QjbRwyO3aO2VjXPRcf5GjTIMfqUBN5TMp3UByZhes00ROQRYKaPr5xpY+OxSV
         FQBtlljEB1CQzaeT+0WsbZST1o9PS6/IonfkcyPe+4jHGLpRFGuNfRGU8mC5G8wcAMFw
         aRHeufaROBGbZu/sju8MQL+weDNHzbehUedKNcgY3/PiSHLnr++XSwUrbZigozBQpfP5
         TzsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727921; x=1792332721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2A8o9vYIEEGemnCCmWv7AJBvyLztV29qJFJ0TTixwU=;
        b=azOeW3qaHzyDh6lWAb+OGQhnpQT2g44MkSKiXkKjAGQntZnEG0qjid8cbXnUrKuWjh
         wFJEFFLM3yg5d99Xgakf930W2r1psT/nldzM4tjP3Jq9pbZfr7KC1APPyXtllUgX8tMu
         2TUhLzD6/HhhNYA4VFxaTgQJ02LD7i7JSm4P/rOX/s0alTV4biiMPlVOl7Bd6CUkiv4/
         7mIxDKY8mRsdG2SFVvKQ0swnxxKJyF5rrNrwS7/MocEv52bP3uiDYXx8m87tW/p2U2d8
         ATd2Zs9XThvh3YbnjYm6qXiuWGHFthJHrWDfs7uTcN1pGij0jL9gmvib1e8qi6fy++Nj
         lT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727921; x=1792332721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2A8o9vYIEEGemnCCmWv7AJBvyLztV29qJFJ0TTixwU=;
        b=RDf3Nq4nLUyQRnkdyJxfFZvbfZwTzoao0HLWRThSdcR+Z1zciu+Dqtyir4RARmutWT
         SwFGpUXZsrI4OIn6QpQdH1dXpjZBm9i4NC828Q4CHqghVCfFMSjgekP9FQVmBDFyUw29
         JTdtoD8MzdPoB/tq9WKitH8rd0CH1UQm3p8hcnv9Ut4SZiN8rcdVZRSjyfJBAN7WMOuR
         hrqgje3pB0u16v4+JvEJ6vWXtwfILXXNWw1PdE4OoxLUdfAnr820A+At9cDzel46vL+s
         nIdnLKzcJAcIIfvHC93WaU9I+b/4D2uMkdQR+Eri5EqT53xosH5Hwch03zkqBZeQX1te
         Av3g==
X-Forwarded-Encrypted: i=1; AKwUvBzZP901ajTQRaqCbnnTCz+GLq1t7l1iIBHEnmjxVp7SI+eonHDjYHP3fF/gEFT8I4hSLBQ+TixejpXYkUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI37z64S7555Mb84hqzvtjot1xiS2Ey8G5g2vvGVMYGYp3wTajU
	hfWFSPbJQGOWMMbVFyl7wp44Puy/4ZA7RPTflD6ydOef72QftvowBdj4qLeW2xu2Rh4XBiTYdsC
	o/AKiMG7FD9u6k8qh0kzHVrhl04UpVls=
X-Gm-Gg: AYBFou2LoSUaZ/soPRfHZgM9g+Wo+BOsGMG44hf0lBzwzr0jUO9zjwMzcsj7+fXqipc
	agDm3YSvXJ07jPmRLeB7uTUlaMCcPg0mMS0xxWOcOQuRV2zfsWCHwZoJOdsPdccAZCpiIwAHF3j
	9VWA01lw7PImL2164MBowOkCf/iWEhZFLQ2A31CqEuJ/BsOir5RMuEaSDoH8KZgzJSPF6+rK1ZK
	ZeyCH+y6YVIDP6Q1R/3ihhXNpo+frv8BtLFCF3KvwEz1DWDd206TBEQzU1MAERQG/4lXn9BDhl2
	4DAS1tnrawhqIp6PaGcBxZjjMsvxTpziTJ+hD9wwj9TpQBvFyY/1jZrQUWsLOJHaKcahD77kK62
	h0m0lIHIwvt1YBPrpZn+ancQuWmk3VLom0oUXhfDtZHzdVQr6s7Ye6Sa7wa1cPHdg8B6o+itc6D
	JHajW+Bn+3VoElpfZ5hzCAlMg7/uH+hlRrreCET4OTvUef2oIyUTk=
X-Received: by 2002:a05:7301:4d0b:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3537e0129e3mr15526523eec.2.1791727921035; Sun, 11 Oct 2026
 07:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009140946.008206689@linuxfoundation.org> <20261011111313.27648-1-ojeda@kernel.org>
 <2026101124-rethink-craftily-cb25@gregkh>
In-Reply-To: <2026101124-rethink-craftily-cb25@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 16:11:48 +0200
X-Gm-Features: AclHuK9vMOPoMYcJzpYtaZWxlpIrwxbTqInUNqo073P_f5dJet-f3k_x1nsh7uA
Message-ID: <CANiq72ndhLush3bugar1YGPnsein8min1k3_NucBxzFwCWe9Ug@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/428] 7.2.10-rc1 review
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, achill@achill.org, akpm@linux-foundation.org, 
	broonie@kernel.org, conor@kernel.org, f.fainelli@gmail.com, 
	hargar@microsoft.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, lkft-triage@lists.linaro.org, patches@kernelci.org, 
	patches@lists.linux.dev, pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, 
	sr@sladewatkins.com, stable@vger.kernel.org, sudipm.mukherjee@gmail.com, 
	torvalds@linux-foundation.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:10=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> Seems to be broken by "rust_binder: reschedule node refcount update on
> thread exit" as removing that fixes the builds which I did.  Any
> objection to that?

Yeah, it is that one.

In case it helps, I am re-running my CI with the extra parameter
manually removed in those two calls (instead of dropping that commit),
to see if the rest builds and runs fine after that issue, and it looks
OK in all the builds that completed so far.

Cheers,
Miguel
