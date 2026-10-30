Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793386345;
	b=TjNH+oIPCuWp5tPwBIerJNhJdpTmPSRN9ctPlk06gbs9H/eVTZFqy8N8Bj6jSSz74t37
	 gOSD2zHl2T1lqBnY1NrxARg72m9gw2xgtT49z6IHy0C8NI563awggrrP5P4jpggFSZ9A7
	 1xteQtIGXD2cFvGax+jkcFnX1OXul3lAWc84Vh/LX+oNo8o5LMKTQ37EK5odY+cQ9hfGc
	 OleNpocQHoCWtV+4UrLOOPl5/pPZ5Sk1IvcEvZDqtwJ7NCwNCPR+Srg6CPdJ3HJiTy++s
	 w+p+0x6cg+I+5XvHh44860Y6Xwf4yhwoF6DhEXz85MKsGcDyHyWYnX7rV3DierHouQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gMwNgz1K+UqwzHDkUSJ+VAnfcnDPwyj0X4MirnZJBJA=;
	b=a2eULYevnIaDTfSm94pfi4WmfEXsV78Tlk3HyR1R97TF4FtiaLfxJoEhhK7RoskmFoZ4
	 ar/TEn0tttS/YGwudZgY1sWe5jU1ja3f4sJVBYS3da9ARcCriWFIGTLA07QEXOnzGiDgO
	 siof8DNv+VNIAjGkf31llIhKa72N7kDIWIy7WzFpE9cirH7jahZFj46/k/HuxLyG/IFZW
	 kW9f4GAbPjTV5EvAAsXJWBQjGd/reLi7RSahPv3jp9YxXV6aTPbS8hsotOnEmiFnmoU5N
	 huo+tetEo87GxrpdrUZFdP08ze4wfpclzHAcGWXfmE6/OjskG0lUKbag98P/0LoHK2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3cvAagc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F36606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F36606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3cvAagc
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so1723a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793386344; cv=none;
        d=google.com; s=arc-20260327;
        b=anxI0vUMoMJvBZx6mdViIqmpmcZxItY7YN5ivV1za/2SRkTV/yrrDny+IEVKA5eEL8
         6DPYokcOWRdJiK3DF9e7iaNpWGcATw37i5u6Y3dPN6Ac8dWqSDT8f6j6vw7Q+vr/noGd
         mHLZIfOifCWUdDq+5h7lNzvOAvYDWsVhenZ8cxmDhXCMiK+qbmN5/66nuOwtwL8PRplN
         r2ud3YFF1hkdnAwxBA6q7ImbnAt27uBLdxjU60nWpnI+EG5CGsjvbuTJgbM2qBF5xfN9
         IMvgGu2aoZ2DHkT//9XkEjvOhjRk1gPJqT1lQemAArmKN4PhpETjKbMLxzpRayWHqezo
         r/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMwNgz1K+UqwzHDkUSJ+VAnfcnDPwyj0X4MirnZJBJA=;
        fh=xq13oRKEC4IZIrioSLV/l1vjgmMmUqnBhQcUJK7wcxw=;
        b=T1W3CM7sxjWdqfZobDBitpC1FVcaIG5VesSdwL4A1p7MlWIzfvQXLmeJUJn/+W8By5
         ZABd4m1I4Zo0hAMDgqk07z9seelq5UHazL7IZyY4tgmrOnLLcd01remn4uZkHUMsuE1d
         MUVaBxRdn9u7qSTHbKjqw8RnX5AjYO1Zxe8YTjfNvoBWfQtncuTcUP05i8xQxKlnSL5L
         iYUyPpga8wErV/BIvVdF8F72Qpg+zSNoZicRy8JsfaCpwXQ6Sle6OulFT2D7fbxjFiTN
         EWdQtDjGNMboJ9zIPbdpGqtg9CQpTpN5bkJTayyjXWwLqlb/rLvPjdFF7CjmOxroOyW5
         F4tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793386344; x=1793991144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMwNgz1K+UqwzHDkUSJ+VAnfcnDPwyj0X4MirnZJBJA=;
        b=V3cvAagcz9NLofy2x5V2qdojwN62XrQReT7yU1/H0u/CkKSQBHAO7aR/e7S8j61bYC
         blm0qi7J3m1EoRlDtyplZzCyPjinrcsRQk+qbEVoI5sK1sFhb21EtdsYP43iRDXxyazA
         8e41dmxWENNUsxZP3RYHtUQ5YfNxOtYr8YvlzH2qXGOzTWCscdPG5dVNeQW9qBZsGFT+
         QKGf4+uJlzMxeAQQHK0RynIqyUCvJ81fGy4suDZ1L6UnEtsFH8zicGr2v/HsNsDCVvbQ
         ku0DVSt69ARpc+iJJe0BJNexq0rmsy2Hzm2RIPFwG1NBtWhdwjJD8lCyx0mHgoBRYsIV
         yU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386344; x=1793991144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMwNgz1K+UqwzHDkUSJ+VAnfcnDPwyj0X4MirnZJBJA=;
        b=oMPnGIWf9oCPhdBm1rUh71I8waTn5VPqs1Q4Ok7HJe+xmYSSuEgkJsayePZF8qWvK6
         lY94D+T3a0b2WMpLH9LcBdKMd/uzroesEXorM+xVeVDMSW9cOtUIvA3HT0LcYAKHPZyK
         GCtWp6Dg0l+dNicy/0wYVNHR2zEO48ilzXq0A9eckaSahwR7EWA+3NsZwWbo7d2dL+hi
         XFPMatSo5NTmtK29ZWOOhX3zsdIAw349fOklMtx4dNHx1hE/6c2l5K233t0Q/DSy0u1s
         Qh0X/3dGT5fqAh7g0/1Aq2u9HQ67czSC93s4FHUXlpXRZByicV+iqFzPm6MNKNkllhv3
         6+/g==
X-Forwarded-Encrypted: i=1; AKwUvBwXY4HOEsjajM+nLz/i4hq9TsGpqnffSKF9FbYwRG4aLEaCxv8s16B7zHed+66S6T1IhmBkOM7KJ1HQR28=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdhMFsQFe5vix9hw632t2aa5PAO/5cRoRWwiOnfeTLJt+VLAiK
	vGmdWMZoawwTdNCierYB6iKUq4233UJo87yB0BPDIqXBZQVWE30a+7geJBHjpDwXCidL7MGwubj
	zZduEi8ON40/UxZ7NG1DjeOFxYai+HYC6/sJpvkdj
X-Gm-Gg: AYBFou3uQz1aEGn/TWrftndGiJ6DYlck45oZTbUuHYqVugcWWTPzd9lCxRrwSisT0i7
	wJdlKQEMwUGEaN8kUSDHTl+DSWC1zUdm+B8RsHy5DFf9BEwd/LRYlZoHosAMx2Jqh3kG5Km9mmD
	Afq7Dt4pNefkK3jDt49Xmb5GwIzTmEgsExiKvWh6qnG/lnrV/gpR10opRBLPJA5j7yhnynNNifM
	ZYIkxjNWfxawC0ENAJlOsfrebujf8q0lRC0f7pZEKdzZKleutDnAYjNjcRYTHNRqHeGx0eZbTCs
	WyYnm2cGsdW/Zz12k5cDpLuD+N8sn9OmG9yvyg4XRQ3qhPn3A9YFHOj3GZnC0aOg1cBuSMdY/82
	1VIdI3/jqexqaxwrFGF9VB4cE3gWC7dIDqb00
X-Received: by 2002:a05:6402:c4e0:20b0:6aa:babf:adeb with SMTP id
 4fb4d7f45d1cf-6b4b10e30dcmr165270a12.4.1793386343403; Fri, 30 Oct 2026
 11:52:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030032937.2813-1-ma.mandourr@gmail.com> <auTnBZMSHWKL4j4b@google.com>
In-Reply-To: <auTnBZMSHWKL4j4b@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 30 Oct 2026 11:52:10 -0700
X-Gm-Features: AclHuK8UAHwHFUNmjuKkJElV7FdxGOJ-JWfm2QtM5AP_cHYOKFcNO1M9-rt650E
Message-ID: <CALMp9eS_XAyfRQ0aa7pGmC2t-=mbHA7rngWD9oqOB2U8AJZMsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: nVMX: Don't let L2's LMSW modify CR0 bits
 owned by L1
To: Sean Christopherson <seanjc@google.com>
Cc: Mahmoud Abumandour <ma.mandourr@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 11:51=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Oct 29, 2026, Mahmoud Abumandour wrote:
> > When L2's LMSW exits to L0 but not to L1, KVM emulates it with
> > kvm_lmsw(), which ignores vmcs12's CR0 guest/host mask, so L2 can chang=
e
> > CR0 bits that L1 owns.
> >
> > v2:
> >  - Patch 2: order the CR0 store before FNOP and check L2's whole CR0.
>
> I'll send a v3, I already spent an absurd amount of time figuring all of =
this
> out.  I really hate x86 sometimes.

You should redirect that emotion to KVM APIs!
