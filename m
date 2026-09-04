Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBDA51D536
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546631; cv=none; b=rq1lFBXhz/43Og+PTX7ya7z3+I8aBmajNJOz9+aiF/UTGlDo3RqZN63kIr8PZtqpIoHFNDkVVbnzEt2vFbWhSRfZ9T23I/T3j8KgQNz3nc6faCcxj+6Rv8F18b/WBhS/rykl0ZfEsAMq9JWAsgcOqrzATob+VrZhvsy2xXeOZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546631; c=relaxed/simple;
	bh=HysE8E520xaY1nEBjzznqC8+2L5Rvn2iXKzzy72uc34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gqyPf7MhzEcdq/q3bJhBUTaADO2PqOvHxMXSMFaFzOASDyXMRozL9kFK6WECBtJxvXIW439gUbWwGQmvZy4jJvKZIxQMjHatqoQfSQObLUrPLjTwFHDuAxWc83n8RBQxcSymOcw6WDrwl5OhpaXaRdVUCxyQR0DjC1t3eg16ayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzm6ajfC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzm6ajfC"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe89fb333so877705f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788546628; x=1789151428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pS8SrzEdQfP6FKVjpNTwfBtizGm0EeLQRKJ2J54uwcY=;
        b=nzm6ajfCFcVgwwdYB03s/LpHcVwvIjwinx1X8oHP+WzzyB4TXCJXDQRi8MozgJ7q8q
         FXO6zHT1GfdltPqYzaRP1YUe0oHTp73XTZu9h60I7H3mGhRCeosYI0qbMNU3oPnS/kW7
         CWyZR+Mqix9rYztnoxhzYvah7XGbEqIK7HcLdP55OP5ouEmzHU++tKlUFxQ+wxN9fJbS
         kSVUhhgO5HGCLx7IIXjOelzEZW/8zr322Pfvaj+XvJT3Hmy2sPR/bCn/U/2CPOCJfYum
         CuT+wGRCb0E2YpDW1Ik7CPYjZx9OlKvvOhoOUUwR0JI/83y+0/qZ3NuDTeCVtuRYKzHD
         5kCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546628; x=1789151428;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pS8SrzEdQfP6FKVjpNTwfBtizGm0EeLQRKJ2J54uwcY=;
        b=TXVeuHQMHGHgiRu4NSjK7sxz/UR0CRJtSHTVkMuOp4+8ba4A7/PhWopb0fMQRVHAeL
         f9Oc0rBJIP/IIWBfP5dfzVHhz/msveOMeuOW2WcAmWqp90mXfEOS6qrOF8lrYlsa92wj
         HPR1orRGeia0ydnXcM4FlLi03HiYt6dZzueD7Z19KcR1SyNVIlARplGlmsR6EN0UHgQT
         aPDoRtHFt11Khys2lBEzoKHRjZZXWV9GNqCCXKxA5m64fFxVajMJ4rTiZgqkiRrO8TWC
         srHRMwF4NXF7tU7yr/Zt/jpoccr8yF0PzxSvqvJAzDJ93TwX7Wigrn5HM0s7dSmtIrf8
         T1nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUoNzLLxONy+RXiO8t7d1h6B0bl6gtJmLYvB0BdvzZj/nfYPuL9jAAZYll75xGhaBEU0e2VBxNEM1aVWw=@vger.kernel.org
X-Gm-Message-State: AFuF++mMz7tcUUbC0NEDaC8ku9ePshz6bhe/tsrgdSd7p/ejZlUgGphb
	S6P/kH0kV4xDct/i2ItFB4oHAeFDWY1ExjzWExFHTuOiXoCzrhKElPz4
X-Gm-Gg: AYBFou12Kldia+XTu52vi53V+46F2wT0GHUR8MsZ/5ekjicdhkooMRBfaecv/XwLJEC
	Xm4i9E0CUmGXep8eR2glsdjoDTtjvL1rA5aHtexqa81gIP5Ci/wRo930otdWvNSL6Z5UjEFRgry
	DTcWpFIPel1lCWT9NyaJWId6ZbJNmXIkdZ7gKJuu6wK+P0O7yAOvRkYzEnhvMh74tLn8875sUNd
	i9TQHGJPpuOuOS8gGGXqRg8MDNQmTtz5Np4V2ZsYqS72Z8sqn28EMWWhG9UCmA9sN3Yas+6X4nV
	7iry02fcWiLk1rf3s5lDeD6HZlLnKxuVVpgZWSTN+tz67nqy6uTZORwXq35tFw2yWoxECj6IruT
	neSapfaCwyVsdWEFEnsxPuTk7QZiTKcKfq8EQQ3z6v1ZsrHzXZSS7TGI2dCtaZJlMndKVW5+8FL
	apkknpAxFumRWyE2jBVDHrn72+qoCNkT9fIy3LwhA7extolnVx/9KAt+3WZ7iDyjDAOCN5Nn39O
	Y3OBA7K7YMec0VhgIikVA==
X-Received: by 2002:a05:6000:250f:b0:485:8a47:5b8a with SMTP id ffacd0b85a97d-4858a475d57mr7048023f8f.39.1788546627780;
        Fri, 04 Sep 2026 11:30:27 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm8659525f8f.35.2026.09.04.11.30.26
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 04 Sep 2026 11:30:27 -0700 (PDT)
Date: Fri, 4 Sep 2026 20:30:24 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260904203024.52398f1f.michal.pecio@gmail.com>
In-Reply-To: <20260904154652.65709-1-scarabeeta@gmail.com>
References: <20260904154652.65709-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Please wrap your lines at 72 characters and maybe ask your LLM to write
something that a human can read within reasonable timeframe ;)

On Sat,  5 Sep 2026 00:46:52 +0900, wakasio wrote:
> On an AMD X870E system with an onboard ASMedia ASM4242
> USB4/Thunderbolt host controller (PCI ID 1b21:2426), a specific USB
> Bulk-Only-Transport optical drive (HL-DT-ST BD-RE BU40N, running
> "OmniDrive" third-party firmware) reliably fails during sustained
> large writes (optical disc burning, i.e. SCSI WRITE(10) with large
> multi-block data-out phases) when connected through this controller's
> ports. The Bulk-OUT data-stage URB completes with -EPROTO after
> transferring only part of the requested data, at an unpredictable
> byte offset, well before completion.
> 
> The exact same physical cable, adapter, and drive succeed 100% of the
> time (byte-perfect, verified via SHA-1 against known-good reference
> images) on every other USB controller in the same machine (a separate
> 10Gbps Type-C host path/controller, the chipset's own rear USB-A
> ports, and a front-panel Type-C port). A second, completely different
> USB mass-storage device (an internal DVD-RAM drive, HL-DT-ST DVDRAM
> GUD1N, attached via an unrelated ASMedia USB-to-SATA bridge dongle)
> succeeds 100% of the time on the same problem controller/port that
> fails for the BU40N drive.
> 
> Read operations (large Bulk-IN transfers, e.g. ripping discs with the
> same drive through the same controller) have never failed in several
> days of prior use. The failure has so far only been observed with
> this device/controller combination during sustained higher-rate
> DVD+RW recording workloads. Bulk-OUT is necessary for the observed
> failure, but is not by itself sufficient: CD-R and 2x DVD-RAM writes
> on the same device/controller combination completed successfully (see
> test matrix below).

EPROTO would typically be bad link quality or some protocol violation
by one or another end of the link. I guess you could try other cables;
gigabit serial links are practically voodo magic.

One quick check worth trying would be to see if xHCI "soft retries" are
being used and to what effect. Run:

  echo 'func handle_tx_event +p' >/proc/dynamic_debug/control
  echo 'func xhci_reset_halted_ep +p' >/proc/dynamic_debug/control

and see how much "Transfer error" and "Soft-reset ep" spam you get. Is
it constant background noise or only one burst and then "Hard-reset"?

Regards,
Michal
