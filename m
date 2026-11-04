Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793780688;
	b=KIkg7rUcPUOla3EJjjCfEaOZBV+Wy1w3G/QACxHtF+Ajelj1bZkpzsx7kEbIbyjKPSDM
	 ToBf7Y0WV9gKajwjIghpkA0ldP4tPyypVGDvTjLNxY2bbQ9nytg8hOX5o/7M/yOpMQmzD
	 JapJsBVds8tBnF7WQbnz+7xDhOYFZ8o94MZdr42mCG/NeuPbp6e2Exdrm7/XOGn5ADfJD
	 jn89ciYtZdA3zZWyC3zosCKe4KuKGuV5Jb7yOKYuKFsCnOe6GSQzpmDx0t/YHDXd+KU0m
	 Qjet5L0frFofR2fFNS/2u5oDXDf80XwRNXYh2oqKxVNGELPvEbihpu10E0M0KOXpb1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+GDlXWJUsYv47EeExLeI8zNRHRArPEHoLs9WQdDARCo=;
	b=Vk2NieKI1NsiUrJ+evko1gZfLVTVXfEft+0CFhAH/65tnzYocnhmhrRbticvlem3UihD
	 8k2zKldHEM4/0yW8TDxLvAEmLXJ0D2/ep+VEihL0uP2i4yL0PnFzhf3LB80qyEc+q9Qg9
	 gRoKvuUxA5P7RxCBoWD2n02+UT/K/qHseEelDHItwEKBbr0BjL8mQ8HLdny+MmWHzfZjA
	 dUhCmhzgxoRlyRMrl5eTK6n83l3Le4bIzlH9eCDOtn/s4KnXPKWlPiYnpI9sJQcqr6Htf
	 9hEca13HYddt2e/R1HwxvkTf6KvJaPD69Np64vhAMw0huQHXgDuyznF+8iLWA8gmdVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRWBnV3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A2F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A2F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRWBnV3N
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2af2ae1258so7015766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793780686; cv=none;
        d=google.com; s=arc-20260327;
        b=nnmgMKTpYt/jaYi/baTnOnevbHCiHFTJCkrUvgkkpG/WGJgtUnlBhdAhIScix1Tu2X
         1xz3HJisk4NoqMFs2Y8ijaloVmhSNXnmbrAU8c1d4aXJeERHWpvlXt0sV0HXUUOVlapH
         oB9+IUYda1BT04Z2yL1TY8TjqWNAVSP21leFES+ISW7sgyJyEn90i2brdN6sCosVTh/4
         okh/NflNdbldILPiC/CMFh90I/ae8A0WaGwCBFeRaB3F2hspEw5heEYNIAaab/vMlnIO
         tYkrRkfabk9zFh1POpi44+/4Nv4l8UUQQprqWU4IHCA2QPRBKUljW0F3/WEZLUbbUPLz
         2CGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GDlXWJUsYv47EeExLeI8zNRHRArPEHoLs9WQdDARCo=;
        fh=krnsLGnRJtr4Xab2YYoaDILmyFn4MHqwKoKwXcWVG84=;
        b=eCqpR2JnwxI2i5EOQ8Ft7zZOteAYuogCy+Veag3qr5X2f5w8LwALJ1Efab+moE47IC
         3mB/mI3o9OMeKMwURHgGjBNx2FQ+zCCViHNKG7D9iUkZS6qOZyHJhJdoy5kbxeJlp72/
         IpIkLnNeqh6Nlxm7e9/R5AQEMPxxJaxfm2oiXu2NOAtwCUUgehAws3L1HBE/w8YPQqZk
         c4QZw0VzbR823lsdIdr+KEWhUqswTsU4a6j0RBKMUqMt1tS+GPoaVKbyqNBr6trEbs5R
         m5+Uv0Kj/CALD/ddliEqYgNkKPAJjc1anepVascR+YpkTVgqTdvYg1YAFVlBUeml3S0a
         68Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793780686; x=1794385486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GDlXWJUsYv47EeExLeI8zNRHRArPEHoLs9WQdDARCo=;
        b=dRWBnV3Nh4PROZw+QpcipQd8jacvXRo2SiAcx9F0GSEdnpef5TLxpdLLHcOI+znKWY
         BwxU4N5boHG0FVdrA5NGjzperhdOTlthNJYkBKDPeJjJJlK/Xy3MsYjYvou4iiQn/Muy
         BvW7x+H+H5MtnI3bE5tIcddZ57QmqBsBD+2NLCVJzKJ6QDMyux2+CrZGTOvgnnPATyZd
         Nyu+PUiRFhobHG+SXMjcb+LWhkhwkxu+zzxw9+wcf9uupVgnMei476FWifQaR6mIKnl+
         0jZxMPv6CFYG9Zw9OhpWuoGgdqlzXr3zpktswjfN83Ng2hNmXg7+6bcQF6ZJfHo350I6
         UILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780686; x=1794385486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GDlXWJUsYv47EeExLeI8zNRHRArPEHoLs9WQdDARCo=;
        b=R6d9ZSZ57bLmRv1v5PagTzHrrRAr5L1gu345CHjBLWf3dSKBTokiNqwiaua1A+bEuE
         bMCQ9gHQKlE6ReLEeMhRzLEAjvzMcNoEij4MooYCFFWr1DuOooVpCXBY4DnqIDdWycca
         P/R3in//CUxsle4IcZ6aYDCg2TzwMNBjCJjF0CPL5P/sDIs2Si6UbHCUcMQFgjLQc8rR
         YFX96Yk7jSpMht38Xe/pMujfC+jbN6zLWOF0mrIfMlO2nDwabcWkGaWoZsTla7LI4BJR
         7OsJpncjKbyjD0VQIVYRqpJZZwkmldM+q7RQWrSZ8/W4dLcoNVs1lD2uyiVRVwsYh1Ln
         SpqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlAEcXWb+XhgIxQl9WwEJfFcnXgq6Tqmkf/j3UKvrPYK/2rzwquhXQus46FV60nmzpuSHtJ+0kp3JfIns=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WeaOTqHGOsF+tET2Gclfiuh4x7S6VMK0T+5pk5BUaYzZ2VcFN
	DzRtXK9h+1RDOVlpL0UpOybMrLhNo7hYpcZce8O42OHtUHjRGubT0LC/CFiMRhgk0S3ERozul5R
	OIBEtD4AuoicIKyFxz3uinLyZ0xSUXWpkcGu7HvIn0g==
X-Gm-Gg: AYBFou0EzVEol9QPsL+kKQd1Llhj4uydOsmHOI5BAByEdHi4HOcERrrSu1PaEIFxTrq
	lrJubRcj0izxsr+aB1aEXAn7CZgQ5Rk8KFKJP6inF2PwV8K3tDLVyhzxFK/iUGXyXOmLCRpAuf0
	n60J0SgdYZADWj+QjpNwDS4jo1/om6+euAcYuCau3WtdkcfiB7RKw2+rEcSV0rTcS5RqQ2o+e0N
	IFt1RbXUxAgMvN15DIF3msxMMoUS+A0Plm6A1tr2BMIzjEY9c1qr9Je/oGj/pK06FlyWAeEaOKs
	sg5dDhdbi+O5UTseUc3fYd57vocNK97/YRUvnuswnIokURS9DuaMEse5jiBblKdGsWjzdvFbC2t
	4mBF8NyHz08/CNA2VLX7c2skKmP42tOP7zCPj8HVDTKNHQzo1jPUGS95JtrwiN8I21/k=
X-Received: by 2002:a17:906:6411:b0:c42:e6c8:e45a with SMTP id
 a640c23a62f3a-c4ca7a4c8b9mr1386970366b.3.1793780685708; Wed, 04 Nov 2026
 00:24:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179376960391.50454.8822263457423416137@gmail.com>
In-Reply-To: <179376960391.50454.8822263457423416137@gmail.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Wed, 4 Nov 2026 16:24:33 +0800
X-Gm-Features: AclHuK-R2OdQr1K9gGtBoNEjfvIOvN0HOzedAfw3-hfWuJgFyYUBaWV7yfFSPt0
Message-ID: <CAAo+4rXReQNa8q1_zkHn87thQeSLQHyPhioCrDbT_1K8L=rQSw@mail.gmail.com>
Subject: Re: [PATCH v6] Bluetooth: hci_conn: hold a reference for LE
 connection timeout
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yaohan,

On Wed, Nov 4, 2026 at 1:20=E2=80=AFPM Yaohan Li <shunsheng1218@gmail.com> =
wrote:
>
> Hello Chengfeng,
>
> We independently reproduced the LE connection timeout use-after-free
> and tested your [PATCH v6] ("Bluetooth: hci_conn: hold a reference
> for LE connection timeout") on a clean Linux v7.4-rc1 tree
> (6628e7d4c6b2).
>
> Test setup:
>   - QEMU/KVM, KASAN-enabled kernel, /dev/vhci virtual controller
>   - Management SET_ADVERTISING and L2CAP LE connection
>   - Kprobe-assisted timing injection at le_conn_timeout() entry,
>     50 ms park, with mgmt disconnect at discms=3D2015
>
> Results:
>   - Unpatched v7.4-rc1: 42 slab-use-after-free reports,
>     with the first relevant frame in hci_conn_failed()
>   - Your v6 patch applied to the clean tree: 0 KASAN reports,
>     with 200 confirmed probe hits under the same timing setup
>   - Control run without injection: 0 KASAN reports
>
> This is a test of your posted v6 reference-counting patch, not
> merely our independently developed fix. The result supports the
> lifetime fix under the tested interleaving; it does not establish
> coverage of every Bluetooth shutdown path.
>
> I also confirmed your analysis that a naive
> cancel_delayed_work_sync() replacement is NOT safe: the mgmt
> disconnect path holds hdev->lock while calling hci_conn_del,
> which would deadlock against le_conn_timeout's hci_dev_lock
> acquisition. Your reference-counting approach is the correct
> solution.
>
> Tested-by: Yaohan Li <shunsheng1218@gmail.com>

Thank you for reproducing the issue and testing the v6 patch, the
detailed results and your confirmation of the locking issue are
helpful. I also appreciate your Tested-by tag.

> We can provide the full console logs, build configuration, and
> reproducer details privately if useful. The investigation was
> AI-assisted, and the patch application and test results were
> reviewed by the human tester.
>
> Best regards,
> Yaohan Li

Best regards,
Chengfeng
