Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E9B3CB2D0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897939; cv=pass; b=CzUAiNJwhSjs0zGb+V+zu8qfczXSSedlDzVuCdDdxGfAwFitWM/u3Np99r6UfWXm+CfcmYeoqc+Scx01hntD1GeWNg+rvw5jGhRtLlAtdk/ic7CC94mK35+9FmPO4Ku+trCUmY/lHe2F1Y5vGxD0MLDU02PD0yofSR99LBeJiGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897939; c=relaxed/simple;
	bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNq4B1rMUucOpR6Uvf18EOm6Ft2L4QMGqAzxLiSZ7URQiL4BB18NBoT38iyk+wFbRqABw6S1g8qIOwe0e4pcK/enm6gmdeb2uc4jRy8Dbvq8yUOHd2ySfgvW44ArWDfrmPUzzqcEQTyNBl0zrXga86Q5Kl4lgmtN1bT8+mfEdEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV34o4qN; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV34o4qN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d70066b704so617245ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787897937; cv=none;
        d=google.com; s=arc-20260327;
        b=sO7iUXW8coHAvzXfCD8K0CJYMHcAHfooq8nqdC1ZwMbW4q85AfAWeNKOp0bXbEW62v
         cSWpQiTJsjbBIkeVXLxKtcSPvzyDaDO6rM33jSwHapuBbso/cRH0DeepmKC2f1VRHMm9
         ZgYGhEYsN+QXbjnbTupEWv56jmXhPOQCEMPj3yohBNYXSRvCkCsl3u2rhna3HBngrN8B
         nZg+K785pymtuwiVGHXeqmOaY1/7ye3corkZEhzyybwrkqx1FKdjxI7ZRZKJG2FGkv3c
         n+7s5APhNAks9Nt+9ZRjwlm5yagfNELLDH6Uw62mOR+s7LHPWkyE8HqOM2MA5LKCkWMI
         Yv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        fh=m3F6Cr6/XHmDlOqfKHChWy6NVd6OiTUNGHyrlab5OM4=;
        b=GEKMMet/6kEgMbxj88gnlgiqlRbbqLPiVY/OuGw4I6wvXwDxfbgBnlMddRyxBkogt0
         P8lnVxlFFS6u3Mv8uKEfLo+6Wg3j85r97rfOoR7kiM45dn9P6e/ApC036NC0AnuyWL8X
         mK3LyuopHwpgFpqP7CMYh8G3TX/JaZGxubK3eCBZZ9Zbz8ToLiELuiBbDTnPH13o08+z
         bpOIl5xw3PmNd6d9yuaDwQVy3ynrrCKUiVG/DEHJRWkmgC/fySM8ME2pJkrYLA54z7qQ
         11BPsoJbyUnrxj+eNbgi3BpSS429Ttc5Feuc6ru66fpJUgrtMXQ2gUGojzpwUZ1Z7ean
         ce4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897937; x=1788502737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        b=YV34o4qN5DymahBMj0wLjFQ2FYrn7s4hPQD79yiVsYiNMbqCo5rQIyDiipMgJ06TFP
         nLGnhv2cpJumPyjcXIOSorNWV8KaUiRfSe+4GaQcaOPhGDEzhtPPJN92s31cw7FkpziT
         se4BGKaN/UHGiWT3wx1BErDcXNJ5T1+Kn11nzD6wpkiDaS840ULXLsGy0JCObyq/nGsG
         5L7jCBMUo5B19iY98ZCsv9ZOFNWXxdkgHqzd/u5x86F4Q6ZXBiIDQSbsjUOe/5P4wIW7
         CAwOg4kuo5KDZnRc6aHhD/VbEwWCXGv5bDcfS/CN4VH1zqni/D6YA550Q1lprH9BtyK5
         +9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897937; x=1788502737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        b=kpp5qIeCscWK1R8oG4DUIeoON5vHbnvRPuHODSCSrHAE6RePJIJ/owiMltu0rxHlrA
         +vFq0MMXxXarIpi5LkEgjvs5jOH16kVqoKiTns74GZeSs0667Vv4EowWlEafb6EbUkH6
         qCNXzdDk7IHiemAUCz7QamGGwvJRqHn9eKlGCcYAwjyeyRdS6gmeEMBRG8J2MMitwQn4
         W7M5lroHwbkHlQILJfb4vm7fYO5zuI+32ejkzGCehMVDQMfMgot+kMNHSEQIgdLQqBQn
         R5N/KSwNHOKs0eE1o3MGnM+a/Ydptu2/LNKXJsWilFg4MlMuAkubGCkVTJOHZ8le6MJf
         98Vg==
X-Forwarded-Encrypted: i=1; AHgh+RoJ/0lmzUF0Ksu9Usk5/5tb+ynTtElDRptYm7BUHxssZZn9RuzgbKM6D1X7CBOH4t45VS5e9pqhi3gAKEs=@vger.kernel.org
X-Gm-Message-State: AFuF++kAoEVOeL1cC5AohDONtS89wN8gOlfvuSEzIujvnyOruE2GhG5P
	1K4BPiKqtKHcaES00/CoooMhsOqu7V1qzv4uDgYnKLhQjR4G9EMh+0sjmndvT96IJOCbxsL6Z5P
	6bteD4e3UQRDnoNBTEdL2XPpY9NW4urw=
X-Gm-Gg: AR+sD12O7LrhYhNMBBlJ5w2eEYdGIZIiahDqAJ+sG+suarZ44hJYg0sWD4wIrBYbzYz
	Gi7/0N/dohxsSYRwwdtvlvDr+bCciDWZJ1CyKLwAap/1IOWGnCvDV2zVPuf7/A9FWDvbbSD7/9M
	D6vytfhQwhNvgrkEjQqVEuVWIrsncRdsXs2m0pgSBzN3zHCHLb2jd/y4AP8wmU7eG5SwQuOZEOG
	aKlnGOvtIficSal7sqyygiZvLVxc0VbR2qW/iTEGVTAvhxOVlyOlr+3X/N3NTne1SjZOS+50so2
	Gdl0VNEe++V5sC6klg8xVe1mnzQvqTtjS+zw2iRqn/6Nt7AJaG53HrY+ZtbhVbRrPFau9NID4G0
	MdqFhaiB1s6ENpFao14S0o1xiKNFjXwwFUTcFurIJiwdrReJNC+ScDpu3zUn3
X-Received: by 2002:a17:903:4405:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d74dc2ac34mr44339125ad.1.1787897937076; Thu, 27 Aug 2026
 23:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com> <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
In-Reply-To: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:18:42 +0200
X-Gm-Features: AcwNN1ViDyJ9UsnVnyAiW233fz48dbS3nQFZxVUyoEdNjL9Bfhx8up1zdVsAHFA
Message-ID: <CANiq72k3D_zyfsJ7aXRvpdnRTznRkLJNccYmYEWJt5SeO0r3TA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
To: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:52=E2=80=AFAM Mehmet Koseoglu
<mehmet.mkoseoglu@gmail.com> wrote:
>
> Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc print=
ing")
> Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.=
0")

Thanks!

These Fixes tags point to different set of stable releases, but we
probably don't care about backporting this, so it is not a big deal
(otherwise; we would have needed to split the patch).

Cheers,
Miguel
