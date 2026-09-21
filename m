Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327448EC9E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989374; cv=none; b=kHop/M5QAGYOyxzZ+3D4CLk60Kxi84LPO1ifyml1vlF9S2q8MR1Fl5EwLZ8rMTtZDFIUMLVgNmbhJU1OKOGlOYN9MyMRPWOGz5HL7Ze9og8O0Yc1GCTBh9x//sG3p0HjRChDb87bw190QbTOwp4dbc+dl4TFew8Yzb4Rx3zRhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989374; c=relaxed/simple;
	bh=8ZrL1Qk82JC/DsKJBv6clrtjkiFR/oATgqHqtfCf7TQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EY/MrDSKIHuwj08jO3YFA7zFdrWd6KrOZmkVRMblLDClmgNES9Or5E/qIA/LDaTw5pT9XIKmnyDzKjMO8BtOPcDQDT6mPqYdyds3PXFSMy5kTPYZt6s5M8WH+msV1OwGcBlIInNdXo93gaakvIcGAGld6XNRTzfguRf6bcgZUUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gpzo2vlj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gpzo2vlj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17031F00898
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989370;
	bh=Kx+QAr4ToKGYlWngvHHV4j0mm9EDwxDdHyCjQotbmHw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Gpzo2vljT2HuymoqbCrtcFV0Ilc4qveze20AdFQvj2VVTBe3FjupreimH2/6MSYxt
	 TPbGFRznhxEn8LYS3J16BMBU4MgtmNdrhRpH38vyaCX0PfaDWLb9Z1FhCgLqrNov/p
	 x4r4ZxUuNOUdHpDGt1fqrn5yQtM29krNQ0e0aihkDqe+P11SOTDMaITR0QlP2L2M4M
	 H7SXJ3yGMCsg4cpoJjUZaKNhFTB26KWwE/3xWndiVUidgs4BzbV7WhrC1nnTOVrCGi
	 pxxiQkgSGY8bCOSldOyLh3EY5nVMPo9t1vD5vJT6IRCv0LE8Fq9I5XYSOycewPyd7Q
	 Dn9Cs1GgK2NEA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49bc59559so18519421fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmotJo/TFKeWxQDTSW48XeZj5e4eKEHbL98aQD16m8Ex43mCUrLnJjEYqOo5K8XZ+FMTLSDGDHpkZGT1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++njLb+jxd2ZKzrEPF3zJxoIvjEacOncQNvBK8TwWbKr+TPWwA2K
	ZEigDVjYjva8BSV+S/QS3D+9eSV8XnGc9VictnqEFrS0fhKmG8Wl2E851xBDtbQLYx+aVH55glV
	ipNo49IuIZo+YLOExWl2I1eQ9yahbd+nE4078ZC04XQ==
X-Received: by 2002:a2e:beab:0:b0:3a3:7681:6d6b with SMTP id
 38308e7fff4ca-3a5fc0898f4mr24620201fa.20.1789989369291; Mon, 21 Sep 2026
 04:16:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 07:16:07 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 07:16:07 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aqz-Wfa7sLNMlxym@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com> <aqz-Wfa7sLNMlxym@gondor.apana.org.au>
Date: Mon, 21 Sep 2026 07:16:07 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdtL_djqfHqh0fx4Y3B2e33mvKDsVb4bUVAAutyOULqMg@mail.gmail.com>
X-Gm-Features: AcwNN1VdFJqsdmLtUEpvvQalKYJeC0bqhIxDdP6vo3jg0p3p6d92YvZG7ppnXWE
Message-ID: <CAMRc=MdtL_djqfHqh0fx4Y3B2e33mvKDsVb4bUVAAutyOULqMg@mail.gmail.com>
Subject: Re: [PATCH v7 00/12] crypto: qce - Fix crypto self-test failures
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, 
	stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sep 2026 11:03:21 +0200, Herbert Xu
<herbert@gondor.apana.org.au> said:
> On Thu, Sep 10, 2026 at 03:00:41PM +0200, Bartosz Golaszewski wrote:
>> This iteration - in addition to the previous fixes - proposes to split
>> the QCE driver into a core part necessary to bind to the QCE DT node and
>> enable runtime power management in order to allow to drop the
>> interconnect votes, and the crypto part registering the crypto
>> algorithms. The core module is then enabled in arm64 defconfig while the
>> crypto part stays disabled by default.
>>
>> The QCE hardware crypto engine has several limitations that cause it to
>> produce incorrect results or stall on certain inputs. This series fixes
>> several bugs and adds workaround allowing the deiver to pass crypto
>> self-tests.
>>
>> The failures addressed are:
>>
>> - HMAC self-test failures for empty messages
>> - AES-XTS returning success on zero-length input (should be -EINVAL)
>> - AES-CTR: partial final block causes the engine to stall, output IV
>>   derivation was incorrect
>> - AES-XTS with key1 == key2 is not supported by the CE
>> - AES-CCM: partial final block and fragmented payload both stall the
>>   engine
>>
>> All fixes were tested on an SM8650 QRD board with
>> CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>> Changes in v7:
>> - Add follow-up changes converting the QCE crypto driver to auxiliary
>>   bus, adding the core QCE driver under drivers/soc/ registering the
>>   auxiliary device and removing the BROKEN Kconfig label
>> - Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com
>
> For some reason your patches do not apply, please fix this and
> resubmit:
>
> https://sashiko.dev/#/patchset/20260910-qce-fix-self-tests-v7-0-cdbd2718af14%40oss.qualcomm.com
>

Weird, I did base the series on current linux-next. I'll do the same for v8.

Bart
