Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793395561;
	b=QGCFOsuMxbZr34jg9zGu725P5GfpI40cP/Frm7M0VFxdUoVolw4N97JeI3UIOC6EFgOq
	 vLtaRipqztinpaDsNzhxJ66jq6DWDJ5oLKT2zUKd43tes5tx4AN84KGU3mkh5uI7KpFwi
	 eqywL4bCpo5+Xjq/teDTGvoDE3Q7q4y6dDoMQ3SVrek8w1lxYjoKreE5nLFlo/Yt8BRhU
	 Lzs+Q1GHLB+nnLnNSH2QxgzXRJM+I5SwMjcBx6NS4hDzEZ+fsHMV/JmNbAUPuadcQWQyT
	 FfcejDcYdGjanMxPMxnyXyLLXZ0ggj3xGyMOhaDuYJVwo3LcaWgvSZ7Wd/at8GpTOOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6PnPZflWZGQkBJLvcdzUi8qDR8iMloTcXmEwdQBRUDQ=;
	b=0QA57kQM6CkILfGtceI+eOPw6vT/a8K/v9I52G+buFq5iXnRCG+rNHhmayU3cBML3gsf
	 c4DRI5KwmREjjjJ/K81KNZugzHA6fpwmtKZC5HezFoIMmnNfqR+IZ2Ly+VoihqkHBk1Pd
	 aWcrPK0mmN2Aqr5oHUbDB464rt8PBiZDqCt+ERGnRU8dDHMpOT+qxfq7taa3pd0clbTCQ
	 9iXv7NcrWfNfWprAIZsM20AO2cZJTnezJyCW2ar7pc9MTnwGLM6rcmeXQrVPFvHXnuPpB
	 CFy4Qw2R8dYPLtPrrbveBOxZKjatuBgW+x3ZTrM6/7Ab5LXOqGc6KKnpwIocKA/4iZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=f1nZOEPk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF26606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF26606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=f1nZOEPk
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5364d86f7f0so15290491cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793395559; cv=none;
        d=google.com; s=arc-20260327;
        b=jivAeOR397AxYHzcujKCYnY6tjQlK0+YcqpMNR0AM2F1t9fFTwIRR0wXoDlg9u+ghd
         dsrPLTQzck2psIkpp5XuejzRe3AaTrjSMVNuQ4zl6eXzVvG2d6NRsGTKtXCT6PSe8l0v
         EJMtlawRWA9FxFb7B7kiUynifttyLLw8j3FmEnM55AY3gpTW8XeOkHsZguZGa5eTYnOx
         MijgJFHDJsA5vvrtiLjORt7g+cgDv6thFuWSktczn5ANUVLoHH7kJQ70mAV3IOSjw8oF
         EvLVhTT1d5bgp3O1lKVr6sHX3AZ3umjpaDHND7PxZhahowCLpfx4WLhc1Y6vL6nJ0p6j
         Q6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6PnPZflWZGQkBJLvcdzUi8qDR8iMloTcXmEwdQBRUDQ=;
        fh=PMeL4rjCUDKSp+1nwdLURlX0rz9wM/2n5HpluJpjGKc=;
        b=eF/+kIRJ2D/JEKL/0vToWHG+5/4BCT+mKYK2X6yH02adVTQLiERnA2dSsMwtcPkQW6
         hTTo7MsOnvAf8MSjt0h++J2cwdO7UQMdQ2u973d/bSbJCtYCTXjyq3IX86Cas5rFSXOF
         IiulbWrVwQM3PN8ejDUs3Id6/mgnp/BSyIDxWU1HacDbS2CB1BGi0kAGmGrJfxg5wQDq
         9EPF/vcCQhwkVinmuXqGHOLRAPBZRJiNSfoSfPTtYJ2Fbsiw/6CijB+n9VWcc6cHJUBc
         f1l3XP12WoZ16t+td9tir/N0DgsyXVQqg7GmNC4FlLAXoA+GkmfcQ9YLPKycfqQ9VuLL
         OIDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793395559; x=1794000359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PnPZflWZGQkBJLvcdzUi8qDR8iMloTcXmEwdQBRUDQ=;
        b=f1nZOEPkxDsPswUOg0jAB4Add1tbwZv2yiaMXe1wU9YYdhZlY7C/Dxr06Hac5Vq+ad
         YzFR0tvulxVXpTMCaqw70CsDaRpGcF0osBcoWf+3iF1xiAAVz7SGlCUOZkk2s2prKL/5
         kK29uGsX6fJyaxsOnr9oKSX5U5waPLZJ1pKk7FBlHyOYQjNwisbEg+QqSvMLkNJn/glL
         dpqLBIM6m5FjxJ6Fmh3nutIYG7kDx5MlizClHUh06PSeS4JK3Nm1ZzEDlFMpb1UN6BoA
         +lrzXIfUp1tkz37xxAaHAB2eXDkrU3Rr1N62lLOl5uP38fb3WhJzGK2Rqy6TspD/9MVW
         z0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395559; x=1794000359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PnPZflWZGQkBJLvcdzUi8qDR8iMloTcXmEwdQBRUDQ=;
        b=SQItpM7pPdChqS6EO9kDc//yGJ7rUYTqrGkuK4hdqtoFGKk9ErPJ1X1TjKuN8/gZOD
         jfoxiyPN4O1iW9v0/rVe5LcwqcbLrEm70vXdDBhbDz4+uETXDd6++GA2UwFD3N01KFt5
         M2rWryMUmnxNzTF61NTx2VnGUagai7xxZI/tgdap9lZ5/TsCew08hcg1N8Zf4S5fIA/J
         pVyS4i4dX/FHwl9qhN29bWwr3Xxs4V2wjykGQ79xjgJZhFBH7Jq7oCeVb/xsTLYxC2wK
         h1ip1Oc8F4B1eo1/BzpkjWAOpkiUyyHUwC03627zxI6XGVQ89VFjkpNK2uRaGO7ZvfV9
         HmSA==
X-Forwarded-Encrypted: i=1; AKwUvBxDgchNZiS+PYaBwmbhj/P13iNlY9W6ZDV3TWdwK4SO7xXnCF6lFdF1mgr5BNiyBw2MIA4An4RVezrjAaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNK2yY4mFLy8srDhkMZhnzJBdv9UQMEVeMiwGwNYvihJgv2yEh
	4nv3VZIqVgOqhknrOyz8eWgAgUo5ZFgCr0rjW+GGj5bbBU7cEB88D+rbw10Ii7TOzFefhdkOiDj
	gCou3c//ke2DvPiKRzw+IVJxVto+s3R/aqgwyHnVdeQ==
X-Gm-Gg: AYBFou3SYrr3dYNVMeTiFWDV/dSFaCZmmmZNIR9n8JNmjymjzs40jYjxNWb8q3AG8eS
	hX82/ycj9BneJMHLCIIKtv+QKSJUlMjWkKo4POhytDfdQ+s8r1djff7wu7Zsh6/IS6nNJoGpEVJ
	Fn/Dc++eN+1DxsYtLprW5XZ10V8B7V4gqR8yD2GfXWwsCUZZI9HjoIZD8QYnjSpl5k/qq/wzbVd
	DvBZYHIfrpDVpqRXyrdE4uuZDCergbJgoIgvLzsFn5dShd8C7kKSam3o2QsHiYLDij3Sj1pgwaB
	0qP1nK0ekIcGANcfbtpg51VT2mQ71PQm6Pm+xfsqZYhaLCTmsqMe/+iuBMejmBN2vdgjTeJYN0A
	28aTLZbj9D4aaR+hqt4DvJAETqvpWn8V1eQMD
X-Received: by 2002:ac8:5a04:0:b0:535:25db:17b1 with SMTP id
 d75a77b69052e-542b62a459emr59994351cf.17.1793395559191; Fri, 30 Oct 2026
 14:25:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922200718.3941465-1-sgogte@purestorage.com>
 <20260922200718.3941465-4-sgogte@purestorage.com> <705f4452-3d07-4d91-9dcd-ea53b2cd75a5@gmail.com>
In-Reply-To: <705f4452-3d07-4d91-9dcd-ea53b2cd75a5@gmail.com>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Fri, 30 Oct 2026 14:25:22 -0700
X-Gm-Features: AclHuK-E-tAbQfFFoffttX8JpmWen3SDKN4NyGsv3Y_ggaQL4RVBOp4lMFsPazQ
Message-ID: <CAMof9cU5s0ck20fcSAYSvK-xpcP5_Hv2BmN20Bh3btpLum7THg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and startup
To: Martin Belanger <martin.nvme.dev@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mkhalfella@purestorage.com, 
	randyj@purestorage.com, adailey@purestorage.com, 
	Hannes Reinecke <hare@kernel.org>, wagi@kernel.org, shinichiro.kawasaki@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:57=E2=80=AFAM Martin Belanger
<martin.nvme.dev@gmail.com> wrote:
>
> On 9/22/26 16:07, Surabhi Gogte wrote:
>  > Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
>  > allocation and startup"), refactor nvme tcp I/O queue setup to use asy=
nc
>  > API, combining allocation and startup into a single parallel operation
>  > per queue. This reduces connection and reconnection setup time when
>  > there are delays in establishing connections, which is especially
>  > important for high-core-count hosts.
> [...]
>
> Hi Surabhi,
>
> This patch breaks NVMe/TCP connects with TLS. This is a different bug
> from the pf_cache_lock one that Shin'ichiro reported.
>
> Test: one VM with 4 CPUs, nvmet-tcp on 127.0.0.1 with tsas tls1.3, a
> connect with --tls and 4 I/O queues, and tlshd at upstream commit
> a0bd51d.
>
> - Linus master 6b4b543fa187: 14 of 20 connects fail.
> - Same tree with this patch reverted: 20 of 20 connects pass.
> - Same tree with Daniel's pf_cache_lock fix [1]: 22 of 40 and 17 of 40
>    connects fail.
>
> On each failed connect, one I/O queue logs:
>
>    nvme nvme0: queue 4: TLS handshake complete, error -110
>
> The tlshd that runs for the target logs:
>
>    failed to search 'psk' key 'NVMe0R01 <hostnqn> <subnqn>'
>    gnutls: Error in password/key file. (-31)
>
> and closes the connection. The tlshd that runs for the host then gets
> GNUTLS_E_PREMATURE_TERMINATION, which it reports to the kernel as
> ETIMEDOUT. The other queues use the same PSK, and their handshakes
> succeed. blktests nvme/062 and nvme/063 fail the same way.
>
> I can share the reproducer script.

Hey Martin, can you try the tests once with tlshd using commit 3a6658e
("tlshd: Link the NFS keyrings per handshake instead of at startup")
or ktls-utils 1.5. blktests nvme/062 and nvme/063 passed with this
commit. I believe that change fixed the keyring race in tlshd
independently. If the issue persists, let me know the reproducer
script so I can also take a look. I saw the same errors while running
blktests with an older tlshd version from ktls-utils 1.3.1 and
updating tlshd worked.

Best,
Surabhi
