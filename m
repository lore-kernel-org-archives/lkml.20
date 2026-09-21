Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818414C4F55
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009966; cv=pass; b=puQVK1nSnpnDaRm70VkqBioY8uvXss0ol0dcpVUdBtJ1XgEc6PjXMSzxbmfFmDlfnvloLmxT7ut82jUhCulkU2WdGH14rqCcK52x/Wq6fawPK/ezt5W3GUrobNnb5GW1i8YwiGPS6Td5NcaUD3wV0wnOkvluwZg+wSa0bt3U8e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009966; c=relaxed/simple;
	bh=yWngzaaOkrrGGD5OTkD0qpL0wQ8vMcgQMR/dSnwLmgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/7qP7rIGPd0m51Z1+zZisrN37DD9BZXRwFl9ThptedSO1/JjEb9tQcqPqp2mv/sOhLVn8pFwgLw6O+JLgQ4Io88IcPH/cxrZYWa6eoYPGZ5gvXbqMBahRFLT/BLOLsezFBSKSUAvRdzDv+XlmP/iQPUb3E0yyXMFXgQXvaPIYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQdMKaYg; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQdMKaYg"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d45ae011aso25588317b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790009963; cv=none;
        d=google.com; s=arc-20260327;
        b=Lnqw3/gSbeW4ZoJFtZJfeMRRbLB8AU/wukxd5K8Ln/W5IoO9TqNgjR2xsiBs7t57/g
         AslVE+DXarjk1fBlsVNW6NnPiAea4WYXyuRrgR5dDMmZMJCzIkNftojQUczPCTtFeEle
         a3lG8ZlEwyCso7TxRjxdG9+noSjYO0lfX2nNH/6lnW5/CoIL7HQv6UDPc9f4pJZPagUB
         KoiHDIAcAkIavqEdnndnEpyzBncx2+D8toxWvJrHdmW4P3xAmAqZFNGVivBpME29bAjM
         oTB4vEkkQ+eWgkQkxkVANIJLzp8QuTGElZK6Qj1PbnLKbYE7JloiMh4h8dTX3D8Zzw5K
         Hb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mIoNQQFkO9KYjaAfdTZ5ScyMF1bXg0TUiegkh1VG1RM=;
        fh=EU/tIhLT4md5QxHfGcLXpZYUa9aKThbltvM77KyjEu4=;
        b=bV61vxuIl3wCrdcnLdGqaMfjvaQh0O7iEnD3cA3Ew3/EyfLW7mmijaFWxYBazfIEpr
         YjTlY9VD3AcmoIBBD+TUTqDWLrn/8Rkp1cUhxDELjUcGeRKT3Fu+TANuxxiSIuWZgAU9
         lyo9931PLixrb/5NBDR5W3y46UmrR6jZgZ12iEjTJuTUbg9Oja7Ft6/sBUC224GXqTNd
         KGxchTczQFUstI5j6sYPoM99FkaCnqfz8HlfFMSR/a2CcJYDgXf34dWmI2oA7ssOGpkX
         ywxfCxQgk7gKduxqD4fgjWgvCk9E6Hoyj7S5AixzywNqVYYf5xsgROte42oU2PxBScbb
         6dMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009963; x=1790614763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mIoNQQFkO9KYjaAfdTZ5ScyMF1bXg0TUiegkh1VG1RM=;
        b=WQdMKaYgHH+WEMz4OsEyoJO9xQFCwSMHeSptPPYvbYZ+z0y0xxT3dt5yMNzvKcihqR
         KCv/dtC6vaAKQnhHwSq8NCdhwMNZh3JcO+9KaH3FYzuxptl+8Pj8Zn1R4iEpV1R6RL7i
         mHC5QLmk7/tRFz2yhv4nXWmQqZKybdVft49fqNwY0SYk9uyPVkX78aAsIg0w7ZhV8a7V
         QEVOjCZTfc6G60IKGhGfxVugJjesWZEFgGnpSPWE7cdmPqaT82EJ5V3CxbN3Ump5zH5q
         94pqstyaW46EA0QoSum1uXmjCYzcwfKwnIDj7U8rtdc36oKEIV+WTiRDhowc6OI4KNDT
         nVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009963; x=1790614763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIoNQQFkO9KYjaAfdTZ5ScyMF1bXg0TUiegkh1VG1RM=;
        b=yc6yWlCNR/zeWCKLZrHMQdhtgtAby3AIc7QPHIQ0eITi5Gv1r580swD6MQn8KPdgPo
         scQGeAwnrRqaR1Pyde4dX4MycmaRSSQ7DYzahXzaJKYN7slB/zBBWz74l4ZL3qyzdKdy
         lbxUCRKgMs49ersoCPvcNC/iuHimjGJqVpS9AW+65RjGMxzjbUnwLwg5acKwjnOsRDN8
         tAVDKMCkzO+Bqqg9UQHNx4fq8Z7JpAZROxNb6S5e/oo0GSRU4JyJCmkIAFby8LFwCeOR
         4AWc6CiReU7S85cRKkEBFmQxpCByVGGeL7y4wJ4GYFqOKFmLELcjO3mojfTYd/eUp0YD
         4NVw==
X-Forwarded-Encrypted: i=1; AKwUvBzdv40CxdNwA3AF4vOJj5NtHGO1Ai1+c3hOoybOLpdOHz1P/pyKjdTbNTJNbS75bNNZiu/emynqI1Y0el0=@vger.kernel.org
X-Gm-Message-State: AFuF++nv4ErgoYb3+xcujLw/nt0K3nwqo3zLxvRvLPGKcVfuOM2AlrK0
	3Gz64fuxMPoB39PESGrXUtb0Cu7OAsOjN/iaBR8mcOHsqbEQrLdu3Sn/4423QW+1J3sHV3jKH0w
	gtIgaOyjC3MpH45pBcnSdZyXz45y+nbvPfJujYjQqGQ==
X-Gm-Gg: AYBFou0vZutNisn3i1MIP6qqAgr9tKihD0l5pMEgQjyExAFkXga2ly3WkLxSf88tLc9
	AFhanQxPrIHGbgeUjKp6hGhM9tycr5GscYsaxpBiTQMZWrWLuMV+NLCLGLWQFI52RvEPATrg+U1
	GCZ00GYgLOmaXFl04uJ0Ned4259ZyCW64LS5eR5JHS5FnSCqbZGCj7zpiM/uX/R+MODGZWQ6d+T
	gR7KX+j1WwAG73StO2//kzLuwhRAxHOSMwRTLF90KC2A/NdoOLx7cuQzQtNAEPDejVZmMjIrwIj
	mO87EnP8dbjzOuj6CxuVfqKQoEVVa5BZu78JDynxeACrCwDhuVqFwvuvAosuTwm1sB0=
X-Received: by 2002:a05:690c:e3e5:b0:81e:6a10:f90f with SMTP id
 00721157ae682-897318a8c2amr33910247b3.17.1790009963258; Mon, 21 Sep 2026
 09:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com> <CABBYNZK2fK_iPL3u5YC8msj853QeGgH1o2i=nPqDFKXMV9UVAw@mail.gmail.com>
In-Reply-To: <CABBYNZK2fK_iPL3u5YC8msj853QeGgH1o2i=nPqDFKXMV9UVAw@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 22 Sep 2026 00:59:10 +0800
X-Gm-Features: AcwNN1Uq46xoUGPgL9i4HHsx-ydXPi2nll3UuwhNdNAS647pgGVLfVMVJlygHDU
Message-ID: <CAFRLqsWydYv7xuTYxy8wsMm2DFQfo7ysg7S28+vaMz_T0mwWpQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Bluetooth: 6LoWPAN lifecycle fixes
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Marco Elver <elver@google.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

Luiz Augusto von Dentz <luiz.dentz@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=
=8822=E6=97=A5=E5=91=A8=E4=BA=8C 00:07=E5=86=99=E9=81=93=EF=BC=9A
>
> Something suggests none of this was tested, as IPSP was never
> mentioned once in this set.
>
Thank you for the feedback, and sorry that the patch series is not clear en=
ough.

This series addresses six Bluetooth 6LoWPAN/IPSP lifetime bugs found
by our tools.
They were not submitted as static guesses: each bug was confirmed by dynami=
c
execution in a controlled, instrumented kernel. Two of them produced
native reports:
a KASAN use-after-free in send_pkt(), and an instruction-fetch fault
after unloading
bluetooth_6lowpan. The other four were confirmed as semantic or state-manag=
ement
bugs where the harmful state or broken invariant was observed at runtime.

Because these bugs are related, I tried to fix them together in one series.
However, this turned out to be more difficult than I expected, and the
current result is not good enough. I will try either to narrow the fixes or
to send detailed bug reports first and work through the solutions together.

Do you think it would be better to start from separate bug reports, or from
narrower patches for a smaller subset of these issues?

For reference, the six bugs were:

    - A transmit race between ndo_start_xmit() and peer/channel removal,
      producing a native KASAN use-after-free report in send_pkt().
    - A module-lifetime bug where Bluetooth 6LoWPAN callback code could kee=
p
      executing or return through module text after the module reference wa=
s
      dropped, producing a native instruction-fetch-fault report after unlo=
ad.
    - A pre-publication setup failure where an IPSP channel could be delete=
d
      before lowpan_peer publication, leaving the creator-side channel
      reference without an owner.
    - A close-path race where local close could continue from stale connect=
ed
      state after concurrent deletion had set FLAG_DEL, rearming the timer =
and
      sending another disconnect for the deleted channel.
    - A listener/disable race where a request that had already looked up th=
e
      listener could still create and publish a child peer after 6LoWPAN ha=
d
      been disabled and existing peers swept.
    - A ready/publication failure where add_peer_chan() could fail while th=
e
      void ready callback returned normally, leaving a connected channel
      without a peer and running ifup() on a zero-peer netdev.


Best regards,

Cen Zhang
