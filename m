Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF9C4F055A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.231
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573890; cv=pass; b=iprArasvIDv/n/3OYA3htdt7xiwKfbeWLweSPuJnRMsppgF2GqTdjxmy8dTCpey+ducM4YA7cln7IUQXkiViKf3EtBXBcIiQb79Fpom/FyxiJmtEmsm6qn3QMHn7M0ruwme2b4/XBFpM/DgE4WXlVFyyZdToPxkT3UmMpf+IqcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573890; c=relaxed/simple;
	bh=bo+nR5vgnm+LSKdCiwZsyqB138gI9BLV55OIiNb16sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeKKqw9QhRLtCIFD6dvT1AUhpa1v+cajUOFzoNtkc9XLxPcUDcGzumJLv0dBfT9YnM+GnEBogIhN8N4k8gQyUOSpEMleAR7PKMsGZkFz1hru8Z5RdIWeAEvLul5lpxr/b58M4IEZwtR8O+nmQdMt8POvOY5FBOtvqq6KdyeigIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGLcz3J6; arc=pass smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGLcz3J6"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-939922847efso97435185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573887; cv=none;
        d=google.com; s=arc-20260327;
        b=UmM5u9NHTRDyhP7Psbu6oan4wwAlAcWGnWJbNP8JlpCKPPkDnHAuBEOW2oM5K1wcfL
         PdLne8sHLUsoWLmEwy5Yuyo2ISs8YGzEgEio5dbzvZbJWlCxWAoyPVVTVifuaV0FiJTa
         eNEKzl5ZulXjr7+U305EqCkqh/IDKO1rj/oZvZ5EURCX8FjWcUZnDNZ52SRTZ9nHYSdn
         R9gwmmaPdDyApvGECCimHh2QCHz3CcaZ5cceSw/RUKVoP7mCsOpPgFxQIDWPrjKDFwVo
         Gb7BxniDmHdQ68QOxn7HnqLo70PPdhSj8B0tfLFJqdj75FE1ZnYHyK4rZS+A+EFCG5Uf
         ZU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        fh=+Q4BNQfghkL8yhkfiJp8ecQV2EDEzrAVh514ByWlmpI=;
        b=nripCCmLLwuMe/DRuHZlIypEaV5e7835O5yPMTUEnkgzlxaxrqNQYS5g3XRRqv/UKN
         cqvqd9t/RQAL5YI0PMmUCtxHAA8YHlr4kCVVbwl1ylFT4Pfp0GgzNaNpW6En15HgYNWN
         0dvOVWu8Gw33iGiWbNiFNJmEk17lIcGGBh2+Cch7qrqXIGFahcL8ED8jXJB+nEYZHRa/
         Mky5EL8qeSVpMhUDMQ0dAYf9OIR2khpAjgvDtvU/XwOlP+c1sedsSR0IRjWV2+zESjx2
         cg5/cfxoX7PmDGWzMUcvV7bgSezBS1+5oY2nsSBKHrMBx0Ej8mGNswEw/sul2PQu084w
         d4Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573887; x=1790178687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=AGLcz3J6D8cp2rGznRsPFyPcIvINU1v/yg7T48xqnGt5dkha28eLx3ZfmOg1Su4v+i
         /gU/fpKa6rhN0owZ4/z7QDHBl+dedwCtQ8/XevU3H9AHT8xYD526w8nZWwY+2u6tgSn+
         ECGKKVv8XmSgeHCWNtcxogjK0+ftF4vWAK5bmZ16DQfFDw4LBTQwNd1OauDstAgUzGwe
         /ii8ms4kdiMyTe5T94twxodV7yW7QFT+ihV66946r04t8j6+vO06ssdSlbh0i1CBBHrm
         BL54/wxrNbgksxPZNnheUgK6K1QcnXXGIMDgDvva+4M0BWNy/4lnjgNU9xDcGxEuDm2a
         VDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573887; x=1790178687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=jixBdwrJpzG+7vd87yFHSDlS9G69bAxjQ4urkfxEAY/TeJm2XQWgokFOwlZDowzlt+
         sFjAm2RcoqMH+ANoiByZbI+nrgUjW+Ay3ci6igR6dmyj94pI9WtL1efncPbLcGAUfIeV
         46eLymT0yO/1N+8/gHKIKIu/TL7TlnxAjhk2qw91JW84ZjWMM4gZ+eVfUkhAXUkZRqTC
         GjlQX3MNteQq/siIoOg18ZwTAKeg2CLVqRHQAA/RPODmgolb91VeFS5LT3NLkX5x5QBP
         lZ2MTMzlme2NrZ8cu1z+wR9Wm7k/IJvmejjY8ji9ITkI3M5GjDJC3WnA5K/AgmZJ8Eq8
         OBOw==
X-Forwarded-Encrypted: i=1; AKwUvBzDDQfL8jS2OsLVIlpX8Lr90nOAN+vmkIJAaRhwWQ/AtJMqzfj1WdRXK9BogNs3UpypumcFUs+3bovt7CU=@vger.kernel.org
X-Gm-Message-State: AFuF++mYeAaQ0mR9MWNzlv93JmLQiiAyLuWylEbVwAmFl2miFl7zZwk4
	0yuo2+4xYPu683+w00NuTLKkRTNX+Ob1miFtaaVUgTJ4mtoWu32KPIRD6Omv122xvvEL7R5OHMY
	+4EHvx+U1OST9cKS9yXpuqvyJu2IBeB0=
X-Gm-Gg: AYBFou3PzwcEVQ+pUc1TfMJs12s7Y2Ay+a/uLUlx2TPZPx33UfYK5k+dYcA/WTZzmW1
	G+7qEQuJwKH3tw+7lFWQ96ruR6zhLzhozml9ogT6ImIHaetbffKm+/rMDBfo4w5DkREoniZDbd9
	nOHNv9voj/MUlir1XmhasB+SjphKMTQw4BvGc/SSPIu2s5ioSRsJERl6t8ftk+ou5r+77NKXi+M
	tv+5dDfeinrXFXxVN+Rxfw5uel6cwH4IXMFm2HJT8IaARub0TzMinn/ym5iW/7FlZvxKBqgcH8R
	DkLrEv/zPSn4DOq+mzqvKRcecQ9scjYh0vVMwV3xAL76yGkMjOVzsACvQXkf0IO0TiIVXkD2Ry2
	syDaqO7ma323ZdRfkFxqfMSXJWKKp0znJI/Z3XdYspA062w==
X-Received: by 2002:a05:620a:2b41:b0:93a:463:1296 with SMTP id
 af79cd13be357-93bb77012a6mr512342585a.18.1789573887002; Wed, 16 Sep 2026
 08:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914155301.14499-1-tharitt97@gmail.com> <20260914161000.E3CD21F000FF@smtp.kernel.org>
In-Reply-To: <20260914161000.E3CD21F000FF@smtp.kernel.org>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 16 Sep 2026 22:51:14 +0700
X-Gm-Features: AcwNN1XHwQyBqLjDeQ7jaI6DM6CbzWrYOn3V2n8CNvXZZDMWJ0_m1PdaYmObsWE
Message-ID: <CACak8wMDhXTXkS6PAMCY1_SbvGK_v6YQBCZxBLJZY382JuKbiw@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Test partial KVM_CLEAR_DIRTY_LOG requests
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +/* Use the 2nd 64-page range to exercise a non-zero offset. */
> > +#define TEST_CLEAR_LOG_FIRST_PAGE    64
> > +#define TEST_CLEAR_LOG_NUM_PAGES     64
> > +#define TEST_CLEAR_LOG_BIT           1
> > +#define TEST_CLEAR_LOG_PAGE          (TEST_CLEAR_LOG_FIRST_PAGE + \
> > +                                      TEST_CLEAR_LOG_BIT)
> > +static void guest_code_clear_log(void)
> > +{
> > +     u64 addr =3D guest_test_virt_mem + TEST_CLEAR_LOG_PAGE * host_pag=
e_size;
> > +
> > +     while (true) {
> > +             vcpu_arch_put_guest(*(u64 *)addr, 1);
>
> [Severity: Medium]
> Will this result in an out-of-bounds guest memory access on architectures=
 where
> the host page size is larger than the guest page size?

Agreed.
The allocation is sized in guest pages, but the clear request and
guest write offset are expressed in host pages.
I'll fix this in v2 by starting with 3*64=3D192 host pages and
converting that count to guest pages before applying the allocation
adjustment.

> > +     kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
> > +     for (page =3D 0; page < host_num_pages; page++)
> > +             TEST_ASSERT(test_bit_le(page, bmap),
> > +                         "Page %lu should be dirty after INITIALLY_SET=
", page);
>
> [Severity: Medium]
> Does this assertion assume that KVM_DIRTY_LOG_INITIALLY_SET is always sup=
ported
> if KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is present?
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914155301.14=
499-1-tharitt97@gmail.com?part=3D1

Agreed.
I'll check for the KVM_DIRTY_LOG_INITIALLY_SET at the start of the
test, and skip the test if it is unavailable.
