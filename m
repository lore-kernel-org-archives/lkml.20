Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE824B8269
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978647; cv=pass; b=Da7bPplOafdp+G3fHysgZ4nU5JVF0vADbZmNaEJu88gH9Rtcv9Sombdnvn6ZrtLkt3mcfcvowpL4ffo78FDedwsaRPMXvjMvsGbaqhXl1eORjlZ2XM0/1VsjTb/KFLNssKl5QAAqDjlVXnQYFakbDAYla9hy3D02AHzWoiXoqdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978647; c=relaxed/simple;
	bh=1/9wWtkCVuLP+HndxiaJnX37Iwl0UJ8x/5Z9QzRW9so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmHgtpWZheBDjsNH85UT7N7EtXGZy4Reku6+brKQZNWnuwmXlWZ97d4g+6IclnpjDZ4luZpxpLsFKyUDmCSOXo7HAqPT72ZTKiRgw6lzubl83D9QHaqQkBoR3ONM9epbnJl0AcidVr9chKflGZWr284eZdqSVb+84C5lPp1c3Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=VzZBYDqT; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="VzZBYDqT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso541277066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978640; cv=none;
        d=google.com; s=arc-20260327;
        b=gCD3lLruaMuDFYxWD3hwzDeSF6oWpYScOiT0SrpuvfTOAeoxN3Y/DF23IbqRtcZOqk
         LfDhTcC3L3V4KLqXNtSn8Os8czrOy84pEOBRKZTADiKZVmaVSvRGXCM+fb7W3xe/fP+z
         /8JxHrcoXZ+l3Bc6RSOMmpUNHYTW/VCn2SssVpsaPtm6npCxHeatmtwCFIjRYiO9KRK5
         r6FC3tIGlCDnBdZxiQIHQy8Z30JkSG2VT8wvPczIWGWVCgSWmxjyFg1SCo6234mFwR5N
         Ttd07kC1uHa+mA8cny/mtOcnbs1hdCJLmwRGIoZrW9VAeGvsTXNdalAVwD8Se4VpFsC7
         S0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/9wWtkCVuLP+HndxiaJnX37Iwl0UJ8x/5Z9QzRW9so=;
        fh=UWCNEro5s7dMkVkW0GXvfOXF9IMNh2Vk4rLTdMQMcVM=;
        b=EVlHFMB8hglP3SaNMIwcxBO7vWC1GKac/gj0Nc6I3nwCudFwqeAwaJ8tclc1N0mBZ8
         3NfA+Cp60Bx504UfX7H73uVsZDudJAn/vZxKrrC7GKR+UcTt+eu0DH9y3mv85j2+Kqrh
         aKB90fJZafHistX3xh/mblbCP8SGG2m9Gyj+L5JGXs0BD5QCZB5XH3AvrpJ2jfMcH5ur
         JcIH0FyxqcrHrMnasmnXvgEUP8cABYD1CZvJAk1faAd6lfYng76o8PR7YmHunuCsRvsW
         yqGwk6pFDEj6Zsq77f6yWH/UM+0NxEVNj+HChQarKI/xiEBicWCMLxj0OCpoP3Pkk4tB
         lj2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791978640; x=1792583440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/9wWtkCVuLP+HndxiaJnX37Iwl0UJ8x/5Z9QzRW9so=;
        b=VzZBYDqTxofJS1YeruugwPOXcqTr2nLfrEzw1FtObffvztD4TjuAhA6A4VkZID1CXN
         ND+AN4fC33vyYECBgSACKVMH5DoNbF71SAms8v5cSUBsEPFh9FSDgvUSQDY2doD0sFCd
         n/vYaXvv8GCDAN6nDrKApVurZrmS6sS1D3JR47Z8FhgbJj6RRR9tkbdLLFeI744B5O9A
         8hoftcexk7vgIRftjPKxGwPGrtDDpTsNDlNh0NaLKqMraVaWjmdE+aPWmYjBtNQHeBkI
         z82MPo4qqv2bwtdlO/7V74tr4156hw7dUgCKWumyDbpj6CS9MOfUUTZCfc+p4tp7C46C
         Ptog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978640; x=1792583440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/9wWtkCVuLP+HndxiaJnX37Iwl0UJ8x/5Z9QzRW9so=;
        b=zb8+r/B9qBSRId5YGEEhfUf4Esldop5aZBY6Gtqorfh3mmlOKN27RWt5fzvPFppKBe
         Gd5KBnPsDiFVqgBDaHzsItUIKUv/Z8MbEV6ipIhWWpQlMbJdfkT9ke2zUKLzr3EsB+Pg
         +dbDMAlPEM6iRiE/XKk/95gPTsCT/JAw+DTTgVBEd09UM1WJoyUGOzA3peUIiU4o13Ol
         FdYDy1z4g6Nh8jeCA1b2GRg7Gxwa0b7hbPsjEF69RqYszV28pwVFzW9/1bpi7LybSBTc
         hID944BqL/PIuBfrglbsz5iYiFwVydk5cz6KBOntgEDjmmotKLNU+l/3vhp7ltMDkoqR
         eKLg==
X-Forwarded-Encrypted: i=1; AKwUvByMPcdegu+IK+S6EFXguD4IUmDu0uuAtZsusB6RKfIdbKXyNtFDcfqfNuYuRjq9QlEDJ2vycTn+CwPIFuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLx3acSw5eawz1vSAPEEhFKHZD0VZbqMhf+8mFWGJ2GwvhIeaA
	4VvUKIHF0qLuOclnQ0Eo74H5t/XZ90bWAFXnAPH0FHqsNO4ncfB4LZfUV+AxczllLaSYOQUqbMz
	CysPYLfuFTnW8tAD33mSUsH1QvJ54ILjmnQxp3+S1KQ==
X-Gm-Gg: AYBFou0hVNqdxyatIEMeQpfNZ5YDHPIz4bz8rIOzE8YH8Wlak45yQXjKoNlMgJI+tf3
	ZyTT7EK6LK5MZSpVJIrfsxImte2HfZ0+iaT48d/yIZOdKml7RMLRAhSmT2rNB0mTZmOOxQ4mZcR
	b9gVy85IOTP9LKiTtUEcyzl57u4kBP/d6h2YIrwMdjXeaW/gAwZdJYkR8UI13T/e3b050XBGTEf
	xJ4zohh0/3GJA9Wq/cu5qeUb7Ljf2I0q4VRJoKnXxRk0s3W/4uVWAhzkdxgc/feq2nL7qOJgf6w
	sH1j94P6xXRm7945sEU4vmAFxp0/XLpA/r/qMjuANJQBZYyRt8UufuO3tk7PGc8RzAEuPCg7K2a
	j6w0Fyct/
X-Received: by 2002:a17:907:1c8e:b0:c2d:ca8d:435a with SMTP id
 a640c23a62f3a-c31a9fd6f9bmr1557096366b.38.1791978639567; Wed, 14 Oct 2026
 04:50:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com> <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
 <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com> <CAO8a2SiVWYSR6s=Z34QcfPVNVSLGk+YQQza4DDEt8_8+j37AHg@mail.gmail.com>
In-Reply-To: <CAO8a2SiVWYSR6s=Z34QcfPVNVSLGk+YQQza4DDEt8_8+j37AHg@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 14 Oct 2026 13:50:28 +0200
X-Gm-Features: AclHuK9sSR_6nkWZJStfKgewh42m0NwU8VaKEe8YILznWZ8_5zl5u-W4tA4Sl-4
Message-ID: <CAKPOu+9x_7WQmKhW==AmLoSzuPrUqeSV+JR69-TaovjEhuj6Ew@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: Alex Markuze <amarkuze@redhat.com>
Cc: "chenyuxi (D)" <chenyuxi19@huawei.com>, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 1:28=E2=80=AFPM Alex Markuze <amarkuze@redhat.com> =
wrote:
>
> Max, Please resend the patchset, the tree has diverged since this
> patchset was sent back in September.

I see no rebase conflicts with linus/master nor ceph-client/for-linus.
What other recent changes would make resending necessary?

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
