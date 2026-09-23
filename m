Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CF4EB877
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180812; cv=pass; b=peR9eZSBOqgLXCqnFWVsLZ0CQDHdDDN3HRdIPj6Qt/QpMMkUxhtKcSnQb6m85CuAbe0WRW3Aj16h8P0fUhDjAgVmr8xGCwMkTJ70A4FKmRxAgXkveKJI9MGm0/NKo/S8Kjm2fqkYOWbyb7EJv0kQDZBOiohZ9NI5KpXmat3RMXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180812; c=relaxed/simple;
	bh=nikGN8S3nY6kcpfCNAE6HAbgdnxKqm3uFGyEPxB9Fj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+XTLjpHMpEXjpw8nN1/VihPbMtyUX9CLHBfQKBiIg6V4lBq57g5iGXc6s9naXQY8QdQjE4U9peb97tT0Gs35co25jbOwMSf24U+9PEk1uwGO3kn+O087rn36HYb/y3YCDjsZBSTJMPPaw6ihO6WdLgoVpodMK/UsPEvkv0ROHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVtM0WXT; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVtM0WXT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso7458095e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790180809; cv=none;
        d=google.com; s=arc-20260327;
        b=aNkphCK5xQfl5hIgzSBL/nDsiQF4j3b0Ap6ie2nqZDRdsZkaqpHvNrdtMQgd0/DxLE
         LdaUfC2q10lHroVw5LkzHAmpopQ+VhEHuoYtahXLYMpgRxQrFvyeWmIFqwsq+4hS9iVu
         LS1ShkqMnKE4R99GIT3iwKyJKfFyqBICyX8IPMSg2rpdv2casSrMdOrt3cxpc4G9+A1Q
         VXynONa/GNHX/Oc4/3NVSdzFsP522MI9EdYSRnuZFDeR6FsAH0YYVced060idFE6gbBM
         ydFyp0dvQYQOWKT5JxYhPow86POqrQCg5WAqhS1oqTyjPvm0Tef3zQrBf8hFo68EwF7D
         WRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nikGN8S3nY6kcpfCNAE6HAbgdnxKqm3uFGyEPxB9Fj4=;
        fh=G9UfkzKSstQchiqL92Hjlw1tibFSX1NHdPkAZSWNVdI=;
        b=GnJenVPg+PhEnhsoBib8kRHRRYb6uv6GAUBYlZ9bTklTSqJ4DKiGrpJAna9yvqXogk
         AYrCZnEEbQLv4N9AljUSCXDbkWX2YtPIWCYyz0ZcnBre/0Ipn+MaPUW1dMwlEMnzjt+r
         DIuY1VkKsEuEIF0j21ezj1Un0pAhx0FSdu4+jQEV4sYWsyqqDDGQ3TyJd/aNRn0WlHA1
         gfdfzzpXHA1KAKHHCr+OuGS2i0flFTgivOK5rEmd/WPn6uG9dTLOlLr7dTOd9NNSv1Qv
         sjY6Mf5syS4XMZo7Yoj/o7TvBUv+lRSxXy1VZsB+BJ+JN36Dy6sbUtwbw7ou58fdpVGX
         xXfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790180809; x=1790785609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nikGN8S3nY6kcpfCNAE6HAbgdnxKqm3uFGyEPxB9Fj4=;
        b=KVtM0WXTYvLW4EAI56QD2d2oXwXIgutE1WFkbx13JgsskMlBk4Te+52MNOtq7paHrL
         1vFqQ6XrRbHucUTiPSvPOIMASzP+A8cgjFo+pRpMybfSCEmbsq4qhGENed5V3+6ry9fR
         vBOG5MHgxNHjZutlIKzzEvi9VrSfO5QwUXYZWmzrd1XrJJfNRNunYfUS4O9DdsvkwoTi
         pB60AKhF+L9FMgFev08HOOl6oZ6FlGoXroxn8peiIcDYLLZWxOrvyUK95JD03lGdQxG1
         Dz1ZqE11dve+tv1ZCh4knAlID97kXYuK/1/oq5VTvf5r7Ar66RfgIIoJuTd7kNTiIEkc
         TuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180809; x=1790785609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nikGN8S3nY6kcpfCNAE6HAbgdnxKqm3uFGyEPxB9Fj4=;
        b=xD2kIrw8xSF2/amW82SVr4PD8YUgPaE9p/9To8QpAm7MHu82yoX9KXbPuzuHerGKEL
         EJbSoqDhmumpZXqhjX6cyJBUOpg9GSmfoSRmgtkTMiBeCA2WRxx8eI91rJRp20Iabmxx
         zQQZIWFybMxKAz5CsSQNKB6HVUUcE6GgS5SaBqeepSawsIld52nOKubAhV3gWmih6On1
         xa8nMe+La7wD+WhPpJVnzxQBW0ciRgMp1DrAMjnNbA3LctQ3titbwCQG/SFFHPk2Jdne
         QLGRW/U2GKT9rVMXAuSo4TpG0F0vTx4mV49lm08Vymx055+NHXn8VECuFf33Kuo8a77/
         msMg==
X-Forwarded-Encrypted: i=1; AKwUvByVvrjeSVYdGDFtp/7WnNrS8lemrQbWi1EFbm+1xtBPSMJzqvS8N/AFp+2nq11Z1UYbGWwlcM6ZHZ/lunw=@vger.kernel.org
X-Gm-Message-State: AFuF++nop2RJj32ROxOEckioWyen/qeYqxK7C9GxKC0lXAL7GCb2NMPy
	bPoTNXls1XUWuV7715nrgmJMRN6QMPCUgMgy6PmrE5ZH0TxA/D/6m4sUUCQq2buiGVv/UWmrexH
	kBH1sULakgjHQe3zvS6mU0vgBjnSkEwI=
X-Gm-Gg: AYBFou3gfC+Fh+KJ9uZ4iUsp41LSRjUAPt9qk5KvgHtMFBfZ5e+ReP6CXdO49HKOtYu
	q/FRerF7riwgyjt5g8QakhNI1CjlLdBDUsYLfijHG1zBHpHUDpNC1kLC0FfStdM8u86vjwt+E2U
	meEv7rCh+JGb+pN90uBsEq+w0fnuWpEsJSlj7opx2oZFM6G85TsEck9cH5kJsexkluJhabqjWGG
	tJ3e0FOBMgicsf0KyH2Lr6rsz+V2aGGCn+YRw+erE4F362sI7nBciDPIl5c3qjPZlhyey3BMdN9
	JGE68V3MrYhCatQRhztYdEAFTX6a9hV8S7A+tYTyrQjSfRw9picfadRIFcMP7cxuo4SR14O1TuW
	Rfpl2Lz26hDVa+zqLlrq16AI=
X-Received: by 2002:a05:600c:4fc2:b0:49f:bd3c:bc23 with SMTP id
 5b1f17b1804b1-49fdf25367dmr45779865e9.30.1790180808596; Wed, 23 Sep 2026
 09:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923095435.591542-1-kunwu.chan@gmail.com> <7efbc8e2ecbf397fc8e44327d13e9a7021b97212.camel@infradead.org>
 <CAN_Opa-tDcZOEk=Mt5MAqUTkg2as5G79uBkxkUaJif8b5QpXYQ@mail.gmail.com> <1cb9c1d40f246ddbe24c9fb930d6dce16aaa25a1.camel@infradead.org>
In-Reply-To: <1cb9c1d40f246ddbe24c9fb930d6dce16aaa25a1.camel@infradead.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 24 Sep 2026 00:26:32 +0800
X-Gm-Features: AclHuK_j1ltAz7PGSRQQV9EaBOqpc5nh8k8vCMKlTaWE_EVcZVCxLKzcJIFegA8
Message-ID: <CAN_Opa-xVAzFAJVU3rwCsiBzVpQYqUYWzgpBBP7EaX3K+ASk1g@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: Use atomic SRCU for gfn-to-pfn cache,
 reinstate guest mode for x86 nesting
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	pbonzini@redhat.com, seanjc@google.com, paul@xen.org, paulmck@kernel.org, 
	kunwu.chan@linux.dev, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 12:07=E2=80=AFAM David Woodhouse <dwmw2@infradead.o=
rg> wrote:
>
> On Wed, 2026-09-23 at 23:58 +0800, KunWu Chan wrote:
> >
> > You mentioned that the SRCU read side scales a lot better and avoids
> > cacheline bouncing. If you happen to have any existing measurements of
> > the reader side, such as throughput or reader-side latency, I would be
> > very interested in seeing them. That would be useful for understanding
> > the reader-side benefit you mentioned.
> >
> > Of course, no need to rerun anything just for this. I was mainly
> > wondering whether you already had such data from the existing testing.
>
> Most of the KVM gfn-to-pfn-cache usage is per-vCPU so doesn't get much
> parallelism. The main case is interrupt delivery to Xen guests' event
> channels, and I did some benchmarking of parallel interrupt delivery.
> I'll see if I still have those results, or tell my friend to go and
> repeat some meaningful tests.

Thanks David, that would be very helpful.

The parallel interrupt delivery case sounds particularly interesting.
Please don't go to any trouble if the old results are not available.
I really appreciate you checking, and I also appreciate your friend's
help with the measurements.

Thanks again,
Kunwu
