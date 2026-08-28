Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBC3AEB32
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945499; cv=pass; b=qpgZKlU1QCjVRoTIPHoH+bhIKpkcY6SfrrH3Ut/5rCpQCw3kuJfoZJv2J1ln1FNeXN9ZzmC1DoZ3DTcacXtEY20qm+2c0bxQG6cpjWDPIKkLl7zQFQb0maZoFRCzWz7F9R9JIqw9CYHlHkqN4Qq4Lcwe0efTgWuyv707yzfP92I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945499; c=relaxed/simple;
	bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlAj4lsuMBaut7DVIYpI5bVWWSYajt0Gjz9S+UVKYFf+wf1TDnkOpK6RtqGA+SOc5wsrS8eeD5FRoNS/TIRs5bIkZoWDIc5duI8vviV7NcPb7boxPvL4DhloUH9htPm6LrcXlWaxd98Iaw2RvLDDfNXP3wWuHYpeSMZdhyUuTWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bPy7cmUX; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bPy7cmUX"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52fac937235so44561cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787945496; cv=none;
        d=google.com; s=arc-20260327;
        b=oU2pr/eQNY3aQ4D2aV1HCUTJ2WAHcKNqzXDRj1+9RupVKhZeqENC1/WvMw7EsTY6pS
         +F64Q6EBr9oAbMIe/7P5oI2nljSx5GVSjVM3JXnmsv3XkohuoyaOK89yTb9VK8Bzl/KT
         /Ru7U3Hs9SUEg4v5/VVscywY1psRsUJ2Eind9tLSID/cxFXdeBb2YvgrkJx1WmcuU6n2
         3god98RuBNx1Y5g0h9uqvuIaDL8fzh2k3tdPsEBPQTTPjQuUMC9/3Q5E7pE6A6LdABrk
         4nhhWqylAOfEspY3RkGWz5+DGkghhn+YN1SgKv6mEfLdTZyfRkIu1R0Bak5t/MwMXK/2
         Rjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        fh=GMJDFY178ugxBiVLgWeJBAuyqt9j188qVuNvQ7qIj8o=;
        b=aoRASurqCetB3C+HeD2GPGvKp1hz1N/BbfGkGAkfBdFdCOHb2Mhrie/S8+rMUMTRth
         ++RZyA1OJQW/Z+d7l3C3Twc2DtAW2gQWVhPF5Ed40+4d57ewpAcjJncv4TSV5a7VFJyA
         KNiVQEhQT9oySRDfqtvFXiMbHfYrAb7soXCbU0Vi1BsqMFOD1q9S/9LQ9ektn0/ztlD9
         DRqSLjzFb0609B3cex30YUEJpiyiX+l+2C56xisnFgNfrZTzk/+QYvwghlA59xCCmXJH
         hS7dI8JpPsY5LQt79OleiTh9+BMeAkpuC/iyVwqqq40U8b1RtEFwpX6VaI4mC4b7sAsB
         ybWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787945496; x=1788550296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        b=bPy7cmUXA2ocqz1JBhVuVuAhsGRvd9VvaSeYQhJlJfKq0WpAVzn6jCrqJ9uTq3aZoo
         S3lSdQ2IYoD/NtfB3fHAP+GgVOlSdT/ri4c6XA8drs3v8o1In6gg+DhKRojq3AQoS1G8
         oHgzPwsmhVe8pZhCy06IbSgYL43gDwmvr6bCEMoqnZ7OQ2y3YeBvd9gbhk0n93KoQSBU
         yb4Y22m1vSDnzE/xbH9qhR8TzFCAvqlvpNaonbu0ot9l0h+sbW1dFZhO6PgoE12ncOm4
         v+xxQkEl5QiNkO4SsJAZ4eF+0R5PHtaMChY28Oay34biChIX8PAvs9152BJGrfm5YHVv
         w9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945496; x=1788550296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        b=Ue8aWlPARucTosNe/3d3pzTfCNp5I2xHEpm9BStkCRe9E7/8uSjlGghg+tmGlIpOF6
         c9Zd6dTDUjQPgXPnhMsnZYTpyXgoYeCZ8GqkpO/Hl5y6/oeQY3QRLIge8MivDsPZkJDH
         4phPq0cS4uTzE/oo2/bi962RBN3BmNqALdzQTtqcKQDgcl4iq5jTCXfL32pixl0Hn2TG
         hTmaHopR/yDgKQAYtkO9sBZUN4tlJIcPJFfxmnRvMCqhg+9SNMfqVO6Ukg3jJnmrzV98
         Dp9hnoLVBo6HeArSZmZ/rxTS5oYOnJfuXyproSUYbYeLnkS5dSTFjZs+GeT1cqVUwkuD
         0/mA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0GTQnP8XUg02K9ZUl20i2E+EG2r2ObnVu55GwioExg3qYokDY+nTboL9KCpF7jUduFx/hKuzvzJ3H/JY=@vger.kernel.org
X-Gm-Message-State: AFuF++nRjxrNtRLq+bMnEEQPiDLQlzdyycZRHUoc/llEwpb4GnOmL0F6
	9y/V0mVB32G1R4egGHk7lkLE6dePriG8Lu3s92BFNZy/aXWXFJl7C/hKNTpLmXa1R690r3jdXQy
	s6BZME+4IIBhXKehz2bAoxs+qlLsF+A/mzf7f1M4f
X-Gm-Gg: AR+sD11Zf8QXv0ZsGwCZvX10H+3eOxi3QDY+7aXn8TGydOyQRMoriLENQbuuvWBAIz8
	uHgwOTUoI0uatpHS09k7Hoy4WfJhyL/LoSrThmYN/6A3lC5hX0ZkDu4l8keYSiNVqDMHhnf+Ke6
	fdl/r4CxqHGgrlxeEb1xQoEQC7fRRK+VSUEuPmGxMfMf6v/JR3VhDJH5HeJx2DRkl+4V7dGdW3Z
	Lmu/8G4qMX+OlR5zgFiaRLh2cvUoPsWpi0q5cH+bRjZoXLZIZOfSGXHosiMzswdcmPsH6jenp4T
	WTMSDe69++ejjL1/Ulu4UAipieQnpwCsVumlveFgcG0siHMNTPoFy5g8pwsTyqH97BY9rh4rucM
	=
X-Received: by 2002:a05:622a:e3d1:10b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-52ff716ce29mr1709001cf.3.1787945495743; Fri, 28 Aug 2026
 12:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-3-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-3-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:31:24 -0700
X-Gm-Features: AcwNN1WNSpQsijIEuWA2m2XaHo35MQhGxpQjLiFkQcVF5TdNjD6IsdWSCXD5vno
Message-ID: <CAGtprH-qD_P=_GTNmjKbhHk+ep959xcaP0PqUD-KgOv80=OPXg@mail.gmail.com>
Subject: Re: [PATCH v9 02/11] x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The TDX Physical Address Metadata Table (PAMT) holds data about the
> physical memory used by TDX, and must be allocated by the kernel during
> TDX module initialization.
>
> The exact size of the required PAMT memory is determined by the TDX modul=
e
> and may vary between TDX module versions. Currently it is approximately
> 0.4% of the system memory. This is a significant commitment, especially i=
f
> it is not known upfront whether the machine will run any TDX guests.
>
> Each memory region that the TDX module might use needs three separate PAM=
T
> allocations. One for each supported page size (1GB, 2MB, 4KB). The
> TDX module supports a new feature designed to reduce PAMT overhead called
> Dynamic PAMT. Under Dynamic PAMT the 4KB level is allocated dynamically
> during runtime, while the 1GB and 2MB levels remain allocated on TDX
> module initialization.
>
> However, in the details, Dynamic PAMT still needs some smaller per 4KB
> page scoped data (currently it is 1 bit per page). The TDX module exposes
> the number of bits as a separate piece of metadata than the 4KB static
> allocation for normal PAMT. Although the size is enumerated differently,
> it is handed to the TDX module in the same way the 4KB page size PAMT
> allocation is for normal PAMT.
>
> Begin to implement Dynamic PAMT in the kernel by reading the bits-per-pag=
e
> needed for Dynamic PAMT. Calculate the size needed for the bitmap,
> and use it instead of the 4KB size determined for normal PAMT, in the cas=
e
> of Dynamic PAMT.
>
> The existing metadata reading code was generated by a script, but the
> current plan is to stop generating this code, as the script has continued
> to need adjustments. So add manually written code and adjust the comment
> about it being autogenerated to be more generic. Start to adopt a more
> normal kernel code style without the ternary statements and if
> conditionals assignments that the auto generated code has.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Vishal Annapurve <vannapurve@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> ---

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
