Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941230;
	b=yPYxFzONM6TCr/PYmp3j27qZvVcsDalYbaXVhaGOZaIaJe/mPY+bNuanZ1OD3d1y2wnj
	 H9M0pcYjxStPBfeMcEaPSNYBPO5PwQmkYNmceZi3m7IIx8JJ3CVKuH3GeTJcNXLnU/PpT
	 9zPOMmGX+NMsc3foo6/e/UPe/KQn6p3wxM0C0ktRUCj+m6uA3nebOSMsv6Une8YTX+K66
	 39nxIa/MlwYNCp/PWqV9yd8b1i8g6HYcFiMQSuGDfMRMmZ36BdAS8YWRDe4cmFsepw1r+
	 q+0dra+N1pVps7W+G+zZ1Ckpu4faPuzQrFJLe4wRbm0ML4IHldPwElCiPp4qpV9viaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=476k4UWO4hCLUtWW9nGRjKZYF5O3zRuAKrFSRe5j/zY=;
	b=C9+5fBoNwmZL8FmcHrf2Fjm+yDpmEFEib61mAiEo6+LyKbRDCJpNTATYWJ9kD+7N9mpx
	 K5FfrYjK+bnFDuhmuj+alRC8t6Z7LceGanuqeDiXYzdys2M1G/5cedwJ4EOrVo6HXORwo
	 s0jJ8bkqMal418YIwB9O7twUDOuI7T3Ws7MGUZOOYXVRmTm7lo0z0HvJ+CSmBnK/8aGju
	 r1bHI39K85ONotT2SmmJpfZo/mPSwuAbPlIGJD0kzMpA9mvJsyJ3OyLXYBqnNO/x5awom
	 BEYWzSpeXz5dUXeRGP5BNybQ3Cx391YscS0152j9WWoQyxArgd7UV3rI66N2/jC/XxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FQFVX3J+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC9B606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FQFVX3J+
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5383c97c8cfso27881cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941228; cv=none;
        d=google.com; s=arc-20260327;
        b=CBiFZcbXvnLkEYxiYkGW5Xxc2BnskMAjYaABOnDhA7dVbLAw98xuT31uREXo+6EPuA
         OKjI71REUrGpqxDsFhdd1faQ+Jp+6ppX6eWCRW9U19TSEuUT4m2PuwNfSEYvzmTNsw0h
         XCmx3YeS9tgwVLADuHnC03ath9XPV9+h2s9ROmV45E5nJ0E+XkCfj3NMLprieD1EtIYC
         IbcaxiHZk/RHUkJWF+NEhx60n75pPm8QM7GHSYtUy9ftMKtxPjK1lf40U8uwdo9Ab9ww
         tfnlbgID4shNd0WA6YYmiZ6YUuyzjLZFxl8kv1Fqd0F14GwF/OGb6lKvabOsxzucY5RU
         rbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=476k4UWO4hCLUtWW9nGRjKZYF5O3zRuAKrFSRe5j/zY=;
        fh=bB1CS18++ArQLmlVPVVBJfwe1NfqPfeTkwBwGzIdxuI=;
        b=gG8h1z0L8oGw2vTXmXz6ESaM6VNU/9vzVZQY03hwgeKiCfX4rJCxq7F5vo37kc2DgY
         8Qep2pVrIIAt6HCj8TW4aY6AnbfLo/PAZTgPzon1ykZx9VgPAAwXu4CUXrMBE74m4RA6
         anrgXJWfPExRV6YcJ5/EzruX3fQQFzH6nTP/B4rpIcNBXog+iS/7dndMw5MHtg4+cuCu
         zQ5ErjMKzr0QEuEWKY4Gup3rkIxN2RtqTpQxBloXei3MNHcXjTKGowLKk1rlnFsw3ccu
         VTW8uIi6oOlEvEAclQE38B8GIYb6plzhdG6uSM7nBXqONlxSeLqb3OZkIBXGb0V6I/ad
         dBUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793941228; x=1794546028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=476k4UWO4hCLUtWW9nGRjKZYF5O3zRuAKrFSRe5j/zY=;
        b=FQFVX3J+kJaq8/nyvHvnkV2Oo4Li2PH3c6+MtKS4UsoUejN1Gc1gCG7ikMSMYaehVN
         BkvznXO5+RjoxaB/rTzkfacEsYOvte9Sgvkn/+fJ2Ewk5WpkTUD3WfmlPKFMkRzgMPw6
         MIOFgjoG5Dqh1tJFA0BMhFgMN38tj6Bg44ib28DSNZBMhPGI1yh1P0OwaqnKtA7WYWAb
         x3sKvz2l6CWM64JgcUB18hBBM3rxpBSFpCZ1Z1X8HSrBsXtU/XCXSSM/7nH8JUAbVaZv
         LRXfNUXR5edDTgKfKyVOBE0ThdOOfuHlK8N7iJoh79Bma2V+PwX0hhtzUYEYRj9BblG4
         5G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941228; x=1794546028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=476k4UWO4hCLUtWW9nGRjKZYF5O3zRuAKrFSRe5j/zY=;
        b=O6wA2Vze+1SZdeMDD3KoKwNma5jK3p2isp/dy7tTTAEDXwx1ehaelathaaY+1uQ7J1
         l1Nxr+Y8WlaQoYXEu/Zb5IZdXGXfuZKg6Xtz/VNxJ5SUzm+ubNtin3663m1ES8fasbVu
         J/0r9jwof0Feg+x+9hYPRh2qHUMwAbjhw278Kwv1Ippys+f56n8zF5XALy7AThp060xl
         he5DxnYwbt+eREDw3+6NCFEd28qhOuuFVcYi8xHM92G4fvbYbeQsX1DFzCZ+codRNMHp
         8YWtAV99qiirwMwJi6AdQOcB/hiTYS+TZdsRWi5Sc3wJA22XYS2X6ibtzQNFAytlRxdt
         juPA==
X-Forwarded-Encrypted: i=1; AKwUvBzkvIZpxSn88SUQcMu+PYNAMbHx3GmLYzYz8qbSoaeYX3Eu07TQbGY1jvA9rYiPa/8lNW1KDsMmqCbmX2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UnVOLlDmlFGHz5/T318ShHu+le1QGzkua+MNLrKIr8MF/KRt2
	T90qWi1tcL2PNg5yKWqoRvTctJXgtMFVGDXE/DZu4k5KeepTFJQY4OMHOnNRZ5TeCD3xblwH1Hi
	2kORetQ0lH58ZZ4TQzD9jcSwxXffFFozpkGDulvmH
X-Gm-Gg: AYBFou0kFSknwBt0Sdqb/WGepQstZ5lyJBTYSIRAeXwXO6NIiWdbvwyWjSxj2RrKqvs
	f+4kkUaYifkRhPRsNbo/Ljk2+AHZmbeTfpFSg16pev22KRRiWw4tH0aPG61i3PCWv8RRt0iywig
	awmZS2RmEoupdQd4qu2csUXpQI1yBXzMUfznpieoojBnfFsBuOdt96HWnXxLuyW8VJpJPWfyU8S
	JS7EV7nN4mz2ZFdcfAGfs0X1PmYDFCixZasAtWukhCbb5JoNmoO9TXA6ok3rGDKB/9SNcXdxTJU
	GXjTae9xNqff97l/9W077XZfQ0KMwmZ2k726jxXuuO71j9HYEvvyli+kdR49L8iGUy3mNTWl4MG
	JTGOAMlCwIqZQvGEXo9FgDCZ0xJVwt7qkmRS0bYSeIidtSiuGDLIzMBN1JhcE2mQiePYHAh7jOB
	qxLs0TrB9eIMhvDiIVgksW7nQr+bLtKcguYPU/J6as36Z77Q==
X-Received: by 2002:a05:622a:4894:b0:534:313:9b4e with SMTP id
 d75a77b69052e-54e96052d51mr2155131cf.5.1793941227739; Thu, 05 Nov 2026
 21:00:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-16-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-16-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:00:13 -0800
X-Gm-Features: AclHuK-ONvtswf74Bk4x5GIzd_0Y6c_P4oOC_oEKOJB8KY16SmIA-q6ZE1FOnK4
Message-ID: <CALMp9eQBuQms_sTjc3w70BQ9GVgCDB5gpj3+-ScJM40k9MOpdA@mail.gmail.com>
Subject: Re: [PATCH v8 15/20] KVM: x86: Guard valid XCR0.APX settings
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:16=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Prevent invalid XCR0.APX configurations in two cases: conflict with MPX
> and lack of SVM support.
>
> In the non-compacted XSAVE format, APX and MPX conflict on the same
> offset. Although MPX is being deprecated in practice, KVM should
> explicitly reject such configurations that set both bits.
>
> At this point, only VMX supports EGPRs. SVM will require corresponding
> extensions to handle EGPR indices.
>
> Updating the supported XCR0 mask will be done separately.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/ab3f4937-38f5-4354-8850-bf773c159bbe@redhat=
.com
Reviewed-by: Jim Mattson <jmattson@google.com>
