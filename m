Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093025;
	b=zlDfcsul1Bid/y/7cXMSg/9p0Pqw+4Njtd6+C9wYzs8H/YYMPdociJi9r9BW7JjRTPjJ
	 ggZImebZ5klZvRXNF/8gGLOBLFmt5FR0TEkYBqFGnRZ0T5DTbkHB7n3cONukt9Szv3xKh
	 P+OUHflVlXA24CUEpo1iWBk7yg6HOkNuvgMr43OpHpsqc9HO9vnV6qFzwfMSFwSVPIwmn
	 OBtzPujhgdXTMK8Jp3m/5e/KtQta2w4JCDaV9bPxmifKFvbBvid272yoWEBHjKv4GHtqe
	 IzGYl/Id7Luxk/TkV2GwfyO7iUpyxEEj7g5LxlIy2Px1snTxF+zPeBraSvVhWnWaxYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
	b=eBhzp3uF7zb48nMpmFp0a/pywCzf29eWKNRnbkof3gq0yGsJqD93gWX8l0KDKGFm7Ijb
	 kXp4YBZuXU34WmSSKssEmGYVtEsnuF0QCONvD9CHQoaU5yt9s/dCJf3AEEXxQsoOIA7fs
	 ThfbPlc6BD46YYU2ojrIXm2oVP/qgIKzGhpj7NOj+hrxFfYh8X0LTZiqJKtZJjR3m8w7S
	 bol+h1/0fI2O5uKrUlth18+XQZGnlvYGR++k1zDe67wcGgcyeNNSbA8/njaYaF5iaYzmz
	 UNXlqzCa8pJbf4wZYMKd4f62IaQqlTYXXI245sl4lEJG/mGep1wyW6CT7F1JlbUfSAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gs1hjsad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD94606A339
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD94606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gs1hjsad
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso1501794b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793093025; cv=none;
        d=google.com; s=arc-20260327;
        b=dyJ6XXZIA6pFe3SWWR1/+Lm0VR+ebwLd2zx/FAi2zrJlB/RfM8+BsQq7qkpXxeQPuF
         Q5sVZBUWcIbza0W10Hd/EpTcCgN2mV/mpOeWK5O9LWdrIg45NVbeFg/cfsQHaoWXqoam
         vRz7K/DW7v1DdRdbu8SFNB2GfT69fKLZTW4ZqrvMMSvsvZiMA8sDEWRzRfWKH8Ehi+HO
         vquJjfCVLv9KVNHWa7TgKIEpF6Z6SB3n6ZR4qbkg175zRuUamhvKR9z6oeeVRnoI1w+Y
         EgUdvS+rkCpUuxn2llvoNY7p4djvc7S0qRuatqka3piWywqPJerWtGKE+F8PNA9B2Kc+
         VfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
        fh=k3ikjkS7mNA6ns2jkS9DmssLSfLXzVrHqtD2aRhN7oo=;
        b=QoErhP1sqbcz7tBKrBMkrj3cozbnZ73ulXi1Yx6qIeh52YonbkbGJQFjYq2aalcQ4Q
         Yhkl/MJl4O+96MJXFRcWnX3TC3/NboFf/DaYpEB6q5sdw5KNQW129rlXKYMpopiy699L
         ubnAfX/yFRytEQKlumIDmAg9oBTiPLAw+NQ4n6NlubIWjP9/7mKHVXaGl4RvAY0WNW8N
         OEXOHLCEoXHkCu2FrrCAN9BdcPnVhPuQP7x6DmNkiTnzb6P50DbPDHkh7Hsj0dNgGRc5
         K9xY87Os7b5uNDcwQIjT94+eV8Yo3DrdOF7WnV0oTq7bR9TnKnQ4v6p3R+C3+LiAUNf3
         NWFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093025; x=1793697825; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
        b=Gs1hjsadhhTrOMc6iSu4+8C6/UqhNf5aVe2ySfU5CC8jEZy6gmQOa2Gj97TPqyElEx
         436p7r643883lPt4v8gBeVwOqtS3e+w2OLMGYQ7fDpyGD7toTgXSF0E8THZkxLoJh/3E
         ciiEMBSNlWoqtRxIVYIrDetzHzvn1vahQQ8kKzjixIbmOLzI2tbWIF4zUMgAS87XAkiG
         qhqUEFOcbLLI6O4nYuNvVJd/+0q3SgtXjI3NU77jD7XegOnXr9ZeEitVxOOVgDIpcVTg
         9d3XkRg+pP1X5G/+6o+6uKIKHreniXuaBRGteaCuC7aMkjBb2v1tr6bVjqlrs/290nRW
         4wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093025; x=1793697825;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
        b=wB+n3IWy3DSeHKYq1GLbFm5qIB0Fm5a3jmrJxLVzByG6FWC6Bek1MA+CkpuAr3Pg4T
         z9+wY7tcspNK+5rfDB20LO4NypnTvZkDm/bwzmnDY00fYnbn/K/v/KoyF1Xzngi7ZChU
         o5iJ4h5jrigp7hPrDcUAqcgrBS23f0mY7LktDBiFWOflELcaYDfcYGh6iBeZc4CwINuz
         R+wl4jK6PYYM+AKDtfRVYRT555yWNvUGF1Og34ilm5lWlc0cv0LPrQAU80VbndZu+wEq
         eX9modjpB17gNsU5Ycg08GRMaliWQ98bZcWjwua0FuD7pledAVzJlJAYAnIRrxqCkB0Z
         6pCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC9/Ln1FBNppg2Ek33IbOOBc4cLUlf2L3r43td3Qh+b/0pe7oKaPaqcia2VOXxE0mrZbfN553/g0+MX3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHt6f9x3wnS7BZiGjbyL+TkImT2LR15PKcuhKHi1SVL04nV9/8
	rqMiPM3cg6rOgresZZg8C3yslyam2ud8Fmx6nWbvNIjTbfDNSOibi81wEXIFudbP1aJK/fN4cFc
	XOsLJ/8ZDnqzV4zFVkirzNV+UxyVR9eU=
X-Gm-Gg: AYBFou1hcCKrwOqHvb92sy44qbdgXGMwhsFQ64gxBkIs6xptW3+vNcPVBbfm8wUmMjI
	jT3o5v+TMT3yvEuEwpjrsdV7en5OAHjjQ3S+9OkMnNskWT8wvISvJqtaVOlfYJDGDzbY1NwbtKk
	vTBVVpNbRrH25sedtTKweZk9TCp/Z2KhWF85+hx/M/kOUAsBzGUWiD9JjeTDnCGosi8apgyqneE
	5IkkFq1NqKcbMxHD5iuKZOqtVzoljkyeTK5G9OcrlOOqSHAP4YhsKXke7PpgBDxzugVLuLtGJxf
	C8dC2hNkYxhZRBOHKEdjLzrFcLJe/RlkBsHBoK7AEEZNitUG+iEFsttHigKIhBflOjxjwYenTo9
	xaZcs4+OAVp753mruFcTIFZXstD20va8OjqWm5Atn3gifZlDehL8LyjlX06EWbSyIVc3M+886V1
	hT
X-Received: by 2002:a05:6a21:880a:b0:3e2:7e0c:134f with SMTP id
 adf61e73a8af0-3e7af80effcmr5634590637.3.1793093024830; Tue, 27 Oct 2026
 02:23:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net> <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 27 Oct 2026 10:23:33 +0100
X-Gm-Features: AclHuK8-pbrEOhB7S4T7aoKC56lROm_LkCCEjp9fGZ_EnNBKx3YVsCLkjoXmb1g
Message-ID: <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
To: remy@demangeot.net
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 26 Oct 2026 at 09:57, Remy Demangeot via B4 Relay
<devnull+remy.demangeot.net@kernel.org> wrote:
>
> From: Remy Demangeot <remy@demangeot.net>
>
> The MAXIMUS IX EXTREME has a second EC (firmware ID "RGE2-Z270-0109"),
> not handled by the ACPI EC driver, at I/O ports 0x68 (data) and 0x6c
> (command/status). It uses the standard EC protocol (0x80 read, 0x81
> write) and the same bank register (0xff).

I'm not fond of re-implementing EC access logic in this driver. I
believe the ec.c driver needs to be changed to allow us to simply
create another acpi_ec structure to operate the second EC.

Cheers,
Eugene
