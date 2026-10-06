Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B924A484D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312124; cv=pass; b=Ux+IiNw8/IeYr7GDTu0EP3FUSj+XfuQmohWGTZJdU81i/UJyWJgnPuUJ9y2kDFl/HytBMAcL18S1yi5HOOjY/rFbuKtGRChDBDXyR9HOdg+MVSRzLAM2d3L9q1VOk8ZwrGku70VmeH0NBp+RTBVCHkoKh5HMJro/p2RY7hkgi4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312124; c=relaxed/simple;
	bh=VsySStT+bTHVUZ7K5MQkKgFZxIMQ6ua4cfuOsS0U3mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upRvglNH/RFS84TZMdDElc1OLwB0Z8xtdENiNSAkUyIk8FiVsjycU1CfnNJ7ELWPv0i5hWhmB9mMW6g+FK8fGFCzlTZP3SbIhjeUO4QRbCjuPc6yj/IyPN6nS+ey5CGDG4wj3unfMjRIHlarFet61XXKSDfOsmU0mw+/4mAFrXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVGZiPbl; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVGZiPbl"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-144e1b6d52cso1232c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791312117; cv=none;
        d=google.com; s=arc-20260327;
        b=CJ6wRBQa/qy5afm548oVQjDUCBIqZoYRF5oTPZEihaNsGM16LIAUE4hIFkIGDnVj2n
         1+P+Fqj5VT5wqXmOLwd9LlFa+iVvZwB2U0212z4O9QnE0k1XTrJcsvkBzCq4iy+RDTx+
         JleCUJy+++wfOfKtWAZbKKhRIw0Np+YnUY+9XTb/yLMxqp3aXw62NusSriYgUoXgY6RZ
         7AtnLeZ8UgHQl6eRplHmZOMizhcu+fUbqt6eCKDWIwZjn13xtDTEgJVC7AMJBy58RJip
         S/T4TIANCQBiREpJhjl1K/z9qrrfDrp11Ps2E5tyT9RUqzyUwMZ02YXb2NwKOUN5dMiG
         yPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VsySStT+bTHVUZ7K5MQkKgFZxIMQ6ua4cfuOsS0U3mo=;
        fh=vRiog0hUJWO0wWpfzukEuhnxK8fJc3CZpr5ADkWFu8Q=;
        b=bFpQeyKCBVYtjKEBlsgKoKJ4JGvFULD/MNs/ocTpe68nYkRqrHowm0swhuDBAybFs8
         qRTZFn2Xx6z1JEGfS9WgCo/8m+ga3X5UN4kjbTPFXK1YAGbO6PvLvpxGv7qhqXup1Cra
         U5GDsqIWqFAKmenfI6jMnQAN3/9TMJ/Ujt896hXyr8LOJbi1ylv1KEnHSd9UotZM5V32
         A7En7ujuof+L8kM3J8o0Zh976EmwjPVS421rr8JlcRGa1Cgv/GMqZ7ZSJNjTq72cferm
         3S43KYptMSaAZXzfhkuuYFR884XOMML77vtXSvGMChOg7hsliZ9dK38Bz1wMDDzwKg13
         vCgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791312117; x=1791916917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsySStT+bTHVUZ7K5MQkKgFZxIMQ6ua4cfuOsS0U3mo=;
        b=MVGZiPblrW2Iq1U9q2FPT1NPM5mJXtwHxtlLB5hLlrZvXSoxgYzAVvjagFeEGIHaCy
         W77CZythHwNcpuWQKrq2z/oQu4N0iJTSMUU2TsP8G2l2N3xdUc+rKNUqtj3dd9iR9p18
         jlRmAQBw+hgJKyXwjxkzyOybBhLQPy/hpxvUdO2GZyda2NXw5h3X170k/kQ/82pryEmu
         auTENj6np1yGJAKJnB/sClzPcao2Gx7Yzv9V/FltqmAN1qgDwdTtIagnz7ZVyDsEGoQu
         moIHFEJPaauE1wYvzgVvDg85LRpradPn1Ds9PUqYWIZmrLsCUHffYTRjpO2h0y/zturj
         j3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312117; x=1791916917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VsySStT+bTHVUZ7K5MQkKgFZxIMQ6ua4cfuOsS0U3mo=;
        b=xMOurUERrntW6EenY92NjXkzLJJpuoo3sHTcFYVLCNl4WN3e6A+RCA825qkEAdOsjV
         xxQga5fWjsnMlCm1oxEuyab5FCcgJBoiK/9dIW7jATPlTwank7Ev+xugW8ZudfktW/6+
         bfHtiS+Ilz1bLm/+qS/hPOoRuC6OGLmtvzNDyMow8VAd6RjLyOckFNcihhIuE7LICtrb
         41bse1pFRXeVjrhPfhBxTX3gwEZ+xX+yNrZ0hm+56jHRLFZ8la6PgDOKMBzoujL1jxr1
         YCAxQEHE5OnfH6Ytbyr7nNtgyJdbEG6BfFFjRNMfiyfKuD1fxWsaO1n3AgBfR5ZkCge/
         NqGw==
X-Forwarded-Encrypted: i=1; AKwUvByhkh2UTRxfWYvmI+zy6w3zEkm8hYsFA9arAtvwGV/CseA0V7MWb4bShrzTOMSn2aFf7dM7CR3m7/Vfnos=@vger.kernel.org
X-Gm-Message-State: AFuF++mvaroi0D34XfcliBGzNbGXWpW0b41zjVng/H8QruKnejpCJOax
	GGArc9wrlmgmWBFBLkps2LTilokSa7NauAHDh4yj/4Q7stzJkHdI5hMtCX+4kEpNort0055aSVV
	HsHUKcpL7qllDqFK7K6LVrxqp9m46v6cshDbmeyE=
X-Gm-Gg: AYBFou2hJ9eC0913JYDf8szCKF13iLYvYi4YHJk5ysBmYCIYgWGDvxVBIPE87Zo0GOo
	LU6XSzxqDLQK9HVuZ2+rLYgkylc1exJk/PhSS4ioCiG8UZ/3NVDvtHQZk6YyOdk/0TSpvExCYrS
	0/y115is5VnWIqEntOIRapllaXsE6T3k6tAsesBugtBdzIL2U9KlCfbxVuJUyS42nmBX492Pvrz
	yx8qng9dY/RRE3UthQuReX0W/x8n/rEvBIsC14IDQNw4yxb6GsWZfIoP6U1qUclj04s+Jrj5a7q
	2SI+TN+mRCNzSdxYToCzhlht0hhMoR9cyC3Ww4ywHjiUYJF/uFh1STL90L8dQuESXyMgIzj79Ut
	s3SRqjr6Ic4ZuQmgfKhWgRAU5oi9Zjf3mTsfjnwCEofFr3XM=
X-Received: by 2002:a05:701b:42c7:20b0:151:5aef:b375 with SMTP id
 a92af1059eb24-15df6a22909mr440182c88.15.1791312116126; Tue, 06 Oct 2026
 11:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com> <20260924173501.856380-8-dmatlack@google.com>
In-Reply-To: <20260924173501.856380-8-dmatlack@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 6 Oct 2026 11:41:44 -0700
X-Gm-Features: AclHuK9XxyGsPYngcwP1eLyAaqdgOZtLG2-uiexY-er63NSOcNYsX4saqv5yQk8
Message-ID: <CAAdrzjs_T6PV1j-9n9vZFHLaORZQ8Py=g-Ms8F1hQq-NwPq9Uw@mail.gmail.com>
Subject: Re: [PATCH 07/15] PCI/ASPM: Save L1SS state in the saved capability store
To: David Matlack <dmatlack@google.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 10:34 AM David Matlack <dmatlack@google.com> wrote:
>
> Reserve PCI_L1SS_CTL1 and PCI_L1SS_CTL2 with a single request, since
> they are adjacent DWORDs, just as the old code allocated one two-DWORD
> buffer for both. Skip the reservation entirely for devices without the
> capability, which the previous code could not do because it allocated
> the buffer through pci_add_ext_cap_save_buffer() before looking at
> pdev->l1ss.

The last sentence needs rephrasing. The previous code didn't allocate a
buffer for devices without L1SS either: _pci_add_cap_save_buffer() did
its own pci_find_ext_capability() and returned 0 when the capability was
absent. The explicit "if (!pdev->l1ss) return;" in this patch is
required because pci_reserve_saved_cap() takes an offset, and
l1ss + PCI_L1SS_CTL1 with l1ss == 0 would hit the WARN_ON for offsets
below PCI_STD_HEADER_SIZEOF.


- Josh Hilke
