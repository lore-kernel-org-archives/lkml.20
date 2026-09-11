Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58A4BEE59
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168864; cv=none; b=a6xy5j/E4x0MZ7xewzglukEq1X9BtKmW5E4ZQpDkjJGv3+Cwj5rRHyAd2pRnemGdUQeIbPY+js/suRHmvSOw9QtxOo0/Ikz1d4uZJ5S6V/8rnYhV+zig3DYCaci/6qi1B3WH4l/m1wkEriqZGc8itILaY0PxRg/yeC1TKaBMqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168864; c=relaxed/simple;
	bh=JDE3O54+uPB/NIAVVl/ufko6s1c+5dSjdyfyemrkrrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9JHWnrtQYiWNtJ9umcqrF9RlycyhJ7USKrMJRi1qAfddiLjFe9gn7Lmpdu4q/Mkcs1pxNIGgjD9lQdRBLft6/cv4paOYXGBnqDt3sMeIK843DbnpVwUA26EALPgkKqgqk3j25SbFqAztmtW6GBr2rnQK2MgN6szOiAEKIAgibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=G65anrGB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="G65anrGB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8f265cbe6so15281765ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1789168862; x=1789773662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDE3O54+uPB/NIAVVl/ufko6s1c+5dSjdyfyemrkrrc=;
        b=G65anrGBb0PECdWJBiiDQ4RfqFU7kCxq1YBOjTse0HBoISRDHOrUG1j1tPF7JE9SYp
         0z0x+d6woz+kagl+faAP4wxTx1zP6ej9ki3DBb6mTZAO/fcKZTy3tF3YyV+lZlA3Bs4P
         JirE0u3bIlMpDDBUAzoMmOLt8u4LttoL6A4ivpgpdm4HrAT1AW/3r/dKuqnmC2KXvd1p
         rzAeTO3T33DCA2eEhbhO/NRs14+PwR+CWJFxJf8deT9ombLRA1i66e/U+1hyczamBgne
         GHX4SpKoFgpsd4x73Li9aNgMH3Uwxolfp1/ALwCrW4onyNm6DzcdX+lqcGNIRrmvEnJD
         NtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168862; x=1789773662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDE3O54+uPB/NIAVVl/ufko6s1c+5dSjdyfyemrkrrc=;
        b=IpkT6ASsODYUBv4pxg4J++Fy4pc63Qgmh9LnTgjfpK7z0RAYPVTxkY702Tp15+nq1K
         /zSUnP6g2FrmLv7OgqE6k5feeQS3KuFHf0hOw4jyMxbzZ5CraMN8JFXOfISPtnUXqpy7
         lZ21hL2uc3u5QCNXRQ8NFkNbRMvqtwK6LfylcARtQu8DI5KI7A94KNn7J/pzlePM2Xc6
         CLTvwDG7pvlapDmyvR9h7PIrsRPaBoyrP+1oSZ0vnjPNchb1N92HUesBX/FxjSpt78h1
         FNLGdCLQ6CuzLp4UJRP/gm/igHVrjvnYMaaaQKTorWSJcw+Et9RNcQRWoYXEY3oSXS1E
         0Crg==
X-Forwarded-Encrypted: i=1; AKwUvBxSebOKaRJHBlLrpBsuIX5jrDOyNKbcl1nJaDsg0APgp2YznNPX40q/PUgoUDoImBCsYkM9/LxAondjex4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFFBJeSFY9THX0EdkiPHjol1hmA7WsR3PbVRTmoWRfzbs7+Nmy
	zx4Xh0stn+GWpEluhHCQwtfB1vox2w0Rc+PKwt+zXdUyWAR9YGUPSFQWJFTqMxxnRxk=
X-Gm-Gg: AYBFou0z1sfKk9mawbPCg4xjfwG4tgX8RjlJFiixSCSE3qRbF0twtoDmtD55f8TKKPc
	7uy+qquOtMryxQ0zN+/xsYyAb1Kf03OTydYN6mWAWeubq4572lWi3Yx7ARvfu4FHY7YX7b5qoVl
	kxmEcjKf3i2Cl7P0auIfDp/ThER8SdhllmFKTGMo4UStadCeeyq3zGENFypyAAdL1Mt3Btoti+O
	Cnwps2kxT5twEkdhTcKEabkd+jIDIGX3JQPfPyXIBxx9rf2LGy2+wGye6HqertpXxl82vAIBZa0
	gendNBD46sPX585EqCi4Wh0nb7bdfW6Is2g3No96tSy+C8Lps81j81OXeG6jIq/LydCecR1usGU
	Juf7sHPDoAyP6P2EOt6GSuq9hCmHaMQ59BHiMV+zHWLgdH+tT3Vcv5IQBo0pGI03wXX3q+ep1ww
	ngx9lbVg3g+Ju2zJq/KTInI+oYap7sxVFDEvHNYvxerTXQjdKY+wywXKDOjytVxhVZKDt2qEYan
	GAE8aZ5JJyWRKtjaf/CYO8zLCeT6Vxykm2FWPmGt5/G
X-Received: by 2002:a17:90b:384d:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39d9c1b4a9dmr9730828a91.16.1789168862074;
        Fri, 11 Sep 2026 16:21:02 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([4.7.95.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5193dsm8886173eec.10.2026.09.11.16.21.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:21:01 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Krishna Iyer <kiyer@crusoe.ai>,
	kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	nilay@linux.ibm.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sj@kernel.org,
	saravanand@crusoe.ai
Subject: Re: [PATCH] nvme-multipath: add fail_io_now sysfs attribute to fail queued I/O
Date: Fri, 11 Sep 2026 16:20:59 -0700
Message-ID: <20260911232059.98122-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8d06416e-a0be-4a0a-b1fe-f5b7831f8574@grimberg.me>
References: <20260904032605.65758-1-kiyer@crusoe.ai> <6b8ff0b7-c606-471d-b3be-12df3dac350b@grimberg.me> <20260906042235.71778-1-kiyer@crusoe.ai> <8d06416e-a0be-4a0a-b1fe-f5b7831f8574@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/11/26 2:37 PM, Sagi Grimberg wrote:

> At that point you can disconnect the controllers, which will teardown
> the inflight blocked IO.

That works, but it tears down every namespace on the controller and
someone has to reconnect afterwards. Our controllers back multiple
namespaces and we only want to fail I/O for one of them.

> If you have a namespace that is attached to controllers say X,Y,Z,W
> Now all of these controllers are unavailable, aren't all of the namespaces
> on these paths also unavailable?

Yes, they are all pathless. The difference between them is what to do
with the queued I/O. Holding it until a path returns is right for a
namespace whose user is still around, and wrong for one whose user is
gone. In our case a SIGKILLed VMM will never collect its completions,
while the neighboring namespaces belong to running VMs that should
keep queueing and resume once the fabric heals. The kernel cannot tell
these apart, only host software knows. That is why this needs to be a
per-namespace policy set by the admin, the same model as
fail_if_no_path in dm-multipath.

> Or is it that the paths are online, but the ANA group got into a state where
> there is no optimized path?

In our case no, the controllers sit in CONNECTING for the whole
outage, so there is no LIVE path. But v2 will cover that ANA case too:
with the policy set, a LIVE path with ANA inaccessible or
persistent-loss also does not count as usable.

Either way the no-path condition may be controller-wide, but the
remedy is not: anything controller-scoped releases I/O for every
namespace behind it, and we only want to release one. Hence a
per-namespace policy, which per Nilay's review v2 will rename to
fail_if_no_path and make persistent instead of self-clearing.

Thanks,
Krishna
