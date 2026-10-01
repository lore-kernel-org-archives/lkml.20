Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BB2E7378
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837399; cv=pass; b=abW5CJpJYaPnxZL2A14uPGTmGTqB0VTJLZDbDPNsILpDvjl6gWh6EXfda+hrPNvCc7/CxC+zd/6mC2dCMefq3vSoHW45vIBr/g/nPcSVhcJd9LK3QQxr8wRcETll97abh2PZZhlYRy9COW2UQPR6dP5VN/f4RqVZ4Cxb5dJzWq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837399; c=relaxed/simple;
	bh=5f79PSE08PBkaNMafHH6+G/l1zxi7gn96hpXQ+wAxkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQtR78mjSo3TeQkWpE9LDPSulHH+S566hMKJ77ZaY2AVdmpEpgJJDd3hFr6yA0ZijEdh3xUlvwRK6kcMvVrx8JjXh73OwVI84tpQSqW2QBGuCeK2QgIMOcrPWM4clMeeEPx1Dj9bElH73V4jDQuMtCbE9099DKr215AyPIOKoNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I6K4U0QN; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I6K4U0QN"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5337c7b9937so205911cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790837397; cv=none;
        d=google.com; s=arc-20260327;
        b=nLXJTi4wr76z3dMF/Xz6Eyp8JjD4ZuYb79lu+nGUnn2zddfiRLEuPwHpmnT1yTEXXQ
         1dM1V6KyDjSjALR+4/u+vhYPB9+aal5fnrZBKad5RkhcRNqOajC3R7HSY6+YRru+hV+k
         rGX0jgE1/AgWyZCSBgWhHO3DKrBxhbFz9JIpzUYQn9UHmSAa3lVQCpCiM5lyZXKcrJKU
         wjhuNH7mBmi/xGNsv+IEwLV+5tL9gOzTzAle6UxTiUJFfdOBisLUf5YkEfVAPvuadwrf
         7rTAk1QUNS5jTfbuZi7HWBfnaWTnCEQ7ADaLZ+1BFG1YJX1HSTyVroBtH4bZVGMg/LGC
         93eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ANNww94QlmRaV8/wIkBwlyMEyhmACv8DyF59iTSMNXI=;
        fh=UhPANzQEnXpkrffknC8rqhiggY6rDP2JIt3loIIMVvo=;
        b=WsxjdJwbJVAP+H5t3dWxzTPbxWhzeSrwndQdkVt31uq0oyDag0DTvADAxK4Q8W+9lQ
         FbBGL5RKAXuhb/cVBP9l1hLtnUqSJeYhLmo4+LDRZkYgyCyJg72vswLpfpA/N+xy9ti4
         KxamM0bDgSl9tJpyOBfBF9tcs0XrmnJvSUqxtclOaDw72lY1KlbIjfHNVM4ZnOc6sWzU
         3xJdrApb1VQ/z+TrPb8bS+cKddmzv04q3FcMexGa/DxDhFVDuFsHOJoZMsK7OS50ezTj
         Pd8UVF5Fiz2MCNdEMJBD+svXNummjNtOV5/+J1g+fdsxDaNwc642KwdN3tZ2HAgaY/GT
         K8CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790837397; x=1791442197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ANNww94QlmRaV8/wIkBwlyMEyhmACv8DyF59iTSMNXI=;
        b=I6K4U0QN2Ljw/5oUVVipsqXG0s5QszP7HoZTRF+5ITMYs01+2RFqxjLEgpJOhzAjoe
         DeUxLq85iUaTpzM8dv2ff68P6KSUGPz9bzu1L6sHNMHK93vSCnvPI91nIrmFIBZ2jZ2o
         yUGcoZvdxhUn6Pjk8vkMmGI263FuPUFqImvo2vcjP5OWKjIy97rZBSWxdAYMhInlkzvf
         bHH1UQpHUe5WyukQJ5P8hlYWK1d+yuczz2c/IArBKARCidWicyNzmqNviuAeMDhYBWJc
         aSh8avANt+aM+22KNiXUkz0odtZLYlxBLjdgdCG3xnrbUxmnja+gF12EMwNL25gC6FBf
         CtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837397; x=1791442197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANNww94QlmRaV8/wIkBwlyMEyhmACv8DyF59iTSMNXI=;
        b=qbNNwgTovv5H3V7dmaHQ1dnbb8NyvZfvfa6MCM/TQGcp9vZ7Zcw5QBq15CRE5ubTV+
         I70BwmrcZfCiq+Kz8EGimM+fXT4GmIRncYexVIm73ICA7SlzsfoXKBtfK3Tz39fEO/rc
         RoCHXFM8pabx/WNtPTeHlYX+ofPnVInWAtQzwRa5I0bpwkGsZcbCWakmeCDYBjmEFik6
         Rw0/YoHe0SGhsue3jgaMUJVCKRVTbQNepmnZIG5B63kedZdroAtMN35Jp8jQsL9UAzqB
         qqsxyrmBpw3nEIv+LiQJcIn1P64VwmWdB0Nn8VmuJbnxjQ6uEzTe91OLSqMg/lVLRv9w
         vQLQ==
X-Gm-Message-State: AFuF++kFA8lO+oBE1Tjkkm0UM+nrttw99v3dTLyfr+r4pdQKH4JZPHJM
	LTALeZNcNQ2xMrzxa8y0FQCMhCtvG2FUzbfQqo2PRmhfTECUVLM26kCQfs2KQpTt+QjbYNcnc3P
	hLlKP/jVPacUGOnAFStkqJi1AWaK/iDcmqCp4X3MP
X-Gm-Gg: AYBFou10djdMwkukmMPmE5VH5zYsgjBBGaQwG/enUKc4uf37rxJM9m8+G+2O/d6oSlP
	wmcsUJ+rAhsA6d9mfsCw6YVcxZPne5HIZFQUaiZQHBVlixAkvlX9B7juNVJOrBpgjXsTA5iXdBV
	9SGzVU3Ynv/gOCu+6ytSbBHz+dEacXEOEG/syeycdvQ50R9o9TDNBnq7WItUP3CdYxM38uxPZF7
	t1Lj0EOSz/0Qaqfz0rtqqBVVWIx1JKjm5RStiWf2CjWl72Or6KGwLpGpcqtkz/bI9x1ZoKecJVU
	NUwHyX7LRqfLHZDKq5e6TK9+ML1CprtPpHlFRLyAkU6lUsGNMkG0PsPj+7aMQIVBiXWyVveNDS/
	gDiplZKY9ZXO2AyZA1Iepe7o=
X-Received: by 2002:a05:622a:6110:b0:532:a17b:9581 with SMTP id
 d75a77b69052e-533845a628cmr6735861cf.3.1790837396410; Wed, 30 Sep 2026
 23:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821093957.1722167-1-binbin.wu@linux.intel.com>
In-Reply-To: <20260821093957.1722167-1-binbin.wu@linux.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 30 Sep 2026 23:49:45 -0700
X-Gm-Features: AclHuK9dhHQKCtFtugTdvUfdTMSI4UfZzBSmgWLYPu5iC0NMzKBfnF-OSJYnBWY
Message-ID: <CAGtprH8NqkyCUohpmeP_T_M+ejD7a3Pw6pwTYg35Y4EDC-r-tQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: TDX: Charge misc cgroup before allocating HKID
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, seanjc@google.com, 
	pbonzini@redhat.com, kas@kernel.org, rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 2:52=E2=80=AFAM Binbin Wu <binbin.wu@linux.intel.co=
m> wrote:
>
> Add a tdx_hkid_alloc() helper that charges the misc cgroup before
> allocating an HKID, and unwind the charge if HKID allocation fails.
>
> __tdx_td_init() currently allocates an HKID before charging the misc
> cgroup. If the charge fails, the error path calls tdx_hkid_free(), which
> uncharges a resource that was never successfully charged. This can make
> the misc-cgroup usage negative.
>
> Charge the cgroup before allocating the HKID.  Wrapping both steps in
> tdx_hkid_alloc() makes it the exact counterpart of tdx_hkid_free(), i.e.
> keeps resource allocation and release symmetric, and lets __tdx_td_init()
> simply bail on failure instead of open coding the unwind.
>
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260710040153.D8EA71F000E9@smtp.kern=
el.org
> Closes: https://lore.kernel.org/all/20260718020348.3B4221F000E9@smtp.kern=
el.org
> Fixes: 7c035bea9407 ("KVM: TDX: Register TDX host key IDs to cgroup misc =
controller")
> Signed-off-by: Binbin Wu <binbin.wu@linux.intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
