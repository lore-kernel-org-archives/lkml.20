Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC94483AC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148587; cv=pass; b=t8GsxlmQX6Q4yhCe/MJfoUirHnE0ZWHUEeOA+nEMeY4GhwbnAhrfzJUODNpdrlKh9o3/b+ZLC5da7Eys2CcoL9CgAfnqwzVQ+cvgUEEHNjR22fLonO125zhLW1y6x+WMFU6+SxW8HWd+jkcmh3yzXKlbpYKTiq7CEMJAKOb6iE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148587; c=relaxed/simple;
	bh=w81K7uDp3GuPBiEppWUi8J0HYpDyiKUpNPxoR0sXK6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/GUgiFJwB8/TKgkXe5fQOlEO4HD6DUb8CvX5g80htnYp81oD+c2gcMbfdWLCtoI6F/KSnxDJCvgYC4UVKsiO/AJjW6E861DDENfzZ6JFh2lMtWvdX6pcVE2BpaRe+0aOtl6zziolSY4PZtUh+jXtVtc1RZBS0Ioyt8MPwqashQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltj2pUDw; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltj2pUDw"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20e86cffso90558d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790148585; cv=none;
        d=google.com; s=arc-20260327;
        b=rJ1IX7wedv2RiR4JCyQvCrp5Cjr1aBGLjMz8dEPllwirlwp0dSwpM/FDnkmDUHEdR0
         BOoiFbPsLRj6SaeySd4wXyKuC03UIj+3bf1zU3s9hrRfVslzfDfSpfvYZ6ds6ff35253
         6tCaxVdp9CaFGSI2FFU/I6art9LVFYOX50sQJUhgu2UokHy1Sy4WSiQBVifk5poAbxuK
         bRc4TmNOz7x6ULO0y14rr1pvBikWE6GK5GBhPbQVX6Cv13wSQtP4IFhcyLdUsMYu0QKF
         Vfty/sW7mPyrTKADnVYIe7n7H3rZ2vBE5oVywj2F6DYcQgKVQBtyjr4WUApyNVnzQWX5
         8jpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LLXhmmwiXGVMSYLL9EVJ5vh7HjECRCSGD3Fcr7GaA/4=;
        fh=0oBO9tpxNk5hHBLpe6op97S8kAjHAbJ+xE7Z9QGa78I=;
        b=nRXRrqlF44D4tiYpFIBAJQ06rT9QMv+/kOcl5I/kmI3EjoXfWKJ8qSz534QTj9gqNI
         ID63Qc5RSq+gHDnmOoiHQ137PQxNU60f9zZ5PxpriKrwigv+E1uQxiOt/NZP/vae3J4E
         1hoNV07e1O4QxRY3fU415End3yNAffxsPTujfFzM8x6l0f1oadJ2yxbJbU2wk7bipuZs
         St+gu48aIiJtpg8rLKubBk2uwFOlkTFOdrU/xeOCjsxVAkaNZE/x787zzHMMH8qMRHH9
         AjvwXfTXTTqGaBtdh5mzRC5kEFn9hDGhjNN+6ooEZRqvMIokA5/4YqLTltt33ioTuLpA
         dq3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148585; x=1790753385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LLXhmmwiXGVMSYLL9EVJ5vh7HjECRCSGD3Fcr7GaA/4=;
        b=ltj2pUDw/3KHLAMBGZRa/aKbxJqn0FQ3Fm3BXlAZuwyh1lvZWJvwuN+/Pn9INX40wK
         F+AmUpoui3Cvh8HWVRFEFCgYw2AaIXPHn3IojoDSiTK8iW2GWnbwui9WMTVKbMz9n0Vf
         tODEQi6HuxlnOl92ai9GEeEyyaRBQ2lyLcg+4FQ2YxUp4QiNIDDhUZoRf5/EEXXBIN/u
         nhf5XY83pskHhnOFLc8Ov+KFk6LIGKD1IWd/CCw2VYLGlE48xv9Op/i7sCecuVrVaTyo
         gvLhzRHggENFQLNSj6ik0f91T+wi0iaHH2QFToVS2+hDJP2ectQzpoqppwPHw8Z9v32E
         bSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148585; x=1790753385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLXhmmwiXGVMSYLL9EVJ5vh7HjECRCSGD3Fcr7GaA/4=;
        b=LzjH46DJj0UDGR1h2lx+SZV184gNmK4R1sRYW4Tp5LB1RBBmhiTRW2Ruyy4+2dE2sJ
         GgNKO5bpWoBin7wY6weeVePIiM3/GgCdH63Et5ooVcUfrpI8mYs/W1/NrBYncsCin/7u
         YWTJk1PulzrIY6e2EpvtMVvnEtpdQBO0z6VMntYWgt56wxAcN/X5xfhPExuNNPU0usQ8
         0gj201OJuxkiJOEfiwTam6Udh+TEjCvOktGFjx8rSfM4XAOKe2W96/2af0u6jjs3nKNn
         xt8W3qbsSYBpxSpbKj0/Jb3ENa5vOnFWVdZlJK0XD6o0nbvw2UD/+h1kVr8RH3rHr09i
         mvSw==
X-Forwarded-Encrypted: i=1; AKwUvBxx/rTzBsDEzYj4aEoyZ1jyij3r9ULhD1hn0eqBrwClKdXKxj/uW4e/fvL12KNf8oWtyXQCmv0rquhb8so=@vger.kernel.org
X-Gm-Message-State: AFuF++npcXuRKXNfHzTpdUzM4lo80XznHqmfAaAmNaZaL+lPOYofjNVd
	eiKBGGon6lr+wmkqpl9zHGTecWXFASr4GoQjOa4QOC5WTmw0hkiwl32KhlhLCT3HnVk86Kwkzau
	l3kapaWwUOZ/AngooNjSbEL3/Mdgb56Y=
X-Gm-Gg: AYBFou2Gj5Io4sOyOf210nAACVvgnVA6rEhDld1oia62oTe1UHMsH1PYeBSbK9yEmSN
	mb8SHz+PT//CY8mjWjashVUWwr60SVf/gCxWGV0QQLs6oL+wKlKineYDCLD1LJPQpR8ynLpYbVT
	3oTeyguAaRQgPaxrrLYdhUHQSI4IrjpCScMVwzqVeljQ9wzERaPFf1EaDi9atXpFBcxEaFgMv27
	2+mT0Ani0BKTH2c7JQeOz8oXs26Hpi7mYeEmjYVdLPEnlf4fuW81ae5Lg8RQI5b5A+ZXvUNAqGd
	WTzFE+d6jCbL3qO8pWNU7rqaxWfR0WPNR1HYVcSM7z8Kj1PrBbIai9gu
X-Received: by 2002:a05:690c:6709:b0:85e:3071:f103 with SMTP id
 00721157ae682-8a4574a521emr18830827b3.1.1790148584934; Wed, 23 Sep 2026
 00:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922120330.127262-1-itai.handler@gmail.com>
 <07e750dc-570b-4f69-9ec3-68de51416a06@gmail.com> <20260922134945.667305-1-itai.handler@gmail.com>
 <20260922213457.GA3536981@google.com>
In-Reply-To: <20260922213457.GA3536981@google.com>
From: Itai Handler <itai.handler@gmail.com>
Date: Wed, 23 Sep 2026 10:29:34 +0300
X-Gm-Features: AclHuK8toaulBOT-3YOE_3phn9wcYRLjApTWuJJjZ2V6oTfFGkdD_31cj0caEbI
Message-ID: <CAFpOueSjekxhjEosQGiZ9BiDh5tFOqBPX5w_2PVsrcN6pO+dHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
To: Eric Biggers <ebiggers@kernel.org>
Cc: Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	dm-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:34=E2=80=AFAM Eric Biggers <ebiggers@kernel.org>=
 wrote:
>
> On Tue, Sep 22, 2026 at 04:49:45PM +0300, Itai Handler wrote:
> > Storage is not the use case - crypto offload is.
> >
> > Where the cipher is a hardware engine driven over DMA, the per-request
> > cost is a descriptor setup and a round trip, and that cost dominates.
> > Making the request sixteen times larger amortises it. With the in-tree
> > qce driver on an arm64 64k-page board, plain dm-crypt over a ramdisk,
> > MB/s:
>
> That isn't a real use case, though.  Using the QCE driver is *much*
> slower than just using the encryption on the CPU, even on long messages.
> That's been established in many previous discussions and is now even
> admitted by the maintainers of the QCE driver.  The QCE driver even
> (incredibly) uses more CPU time than just doing the crypto on the CPU,
> due to all its driver, scheduling, and IRQ overhead.  The pending
> patches to add BAM locking will make it even slower.
>
> The fix is to not use QCE.  (And also ensure that
> CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy is set, to get the ARMv8 CE accelerate=
d
> code.  But even on legacy CPUs without ARMv8 CE, QCE is still slower.)
>
> Unsurprisingly, the numbers in this patch's cover letter show this as
> well, with much higher throughput reported for the CPU-based encryption.
>
> (Also note that QCE is currently marked as BROKEN upstream.)
>
> I really do not think dm-crypt should accept changes to further
> accommodate obsolete and problematic external crypto engines like this.

Thanks for the detailed feedback.

I agree that QCE is not a good example to use as the main motivation for
this change if its driver overhead makes it slower, and even more so if
the driver consumes more CPU time than the software implementation. I
will therefore not argue that QCE itself justifies changing dm-crypt.

However, I don't think this necessarily establishes that the generic
dm-crypt change is unnecessary.

One point regarding the suggested ARMv8 Crypto Extensions implementation:
PAGE_SIZE and the presence of ARMv8 Crypto Extensions are independent
properties. In particular, an ARM64 system can use 64 KiB pages without
having ARMv8 Crypto Extensions. Therefore, the fact that AES-CE is faster
than QCE on CPUs which support it does not apply to all systems where the
proposed change would be possible.

There is also a more general reason why hardware crypto offload can be
useful even when its raw throughput is lower than CPU-based encryption.
Offloading encryption can leave CPU cycles available for the application,
filesystem, networking, or other work. Of course, this only makes sense
when the accelerator and its driver have reasonable overhead; I agree that
QCE is a poor example if its driver overhead outweighs this benefit.

My main question with the patch is therefore independent of QCE:

Is there a reason for dm-crypt itself to impose a fixed 4096-byte
encryption-unit limit, rather than allowing an encryption unit up to the
size that its existing I/O conversion path can safely handle?

The patch does not make larger sectors the default, and it does not
remove the kernel-side validation. The default remains 512 bytes, and a
larger sector must be explicitly requested. The proposed upper bound is
the smaller of PAGE_SIZE and BLK_MAX_BLOCK_SIZE, so configurations that
cannot represent such an I/O unit are still rejected.

The motivation for using PAGE_SIZE as the upper bound is also not tied
to any particular crypto accelerator. The current dm-crypt conversion
path processes the encryption unit through the bio/scatterlist
representation, and the relevant bio vector cannot represent more than
PAGE_SIZE in a single entry. Consequently, PAGE_SIZE is already a
natural upper bound for the current implementation.

The performance measurements with QCE were intended to demonstrate the
kind of workload where reducing the number of crypto submissions can
matter, rather than to claim that QCE is itself a desirable accelerator.
I agree that I should find a better hardware-accelerator example before
using those measurements as evidence for the patch.

I also don't intend this change to imply that larger encryption sectors
are appropriate for LUKS or other portable on-disk formats. That is a
separate userspace/on-disk-format consideration. The kernel would still
enforce the limits of the dm-crypt implementation itself.

So I would frame the patch more narrowly: this is an attempt to remove
an apparently arbitrary 4096-byte limitation from dm-crypt and allow
larger encryption units on systems where PAGE_SIZE and the block-layer
limits permit them, without changing the default behavior.

If there is a specific correctness, security, or architectural reason
why dm-crypt should retain 4096 bytes as an absolute limit even on
systems with larger PAGE_SIZE, I would be very interested to understand
it. Otherwise, I think the question is better evaluated independently
of whether QCE is a suitable accelerator.

Thanks,
Itai
