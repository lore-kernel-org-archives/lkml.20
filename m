Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397521;
	b=IQu09vO1DsPp8rw7k454RbclSJZ1sXAQtp3iIXoYwk8cinZfw/yDldvmj0HRaIW93a5w
	 Hue0R4PQBttTjgvCYYkTXPyFXRlgCbqfwzDGpIbWIA8xLdCa60Lby2cpW8SzomZMbemDQ
	 krtnNNWhzMozmzhfMrbUlsw3FkHG8hzmw4ayjggivSF3XXYWCKNsL5wYVN+WO67jGWoHc
	 rDboV1oFzwwjGnuSrgXIsVPFlMuJY24ngehKNPPD7/AtWQQLn1vMMOfKjhDnVTNbpWgcB
	 uytO/d1kLrX/ck/x0PFQaW7V2y4Q56dg5ZpPh3KRlgtGiOJAPNlCdloDtqCHhMoq35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
	b=A8v95V02ANseNs/e9si3zgCwq/H5Lai6i8UO/oIrOizrZiyE23LtVsgpfAGI0jpvwdl8
	 GvZefoo+XFQrD6taKn7UFKmuGPTFhxPxP3E13icgXXBY4PUTGvu2XOKT+9lnhgGoRQsfc
	 cg1fDiKhG2okflkwbPFhLRvDzU4bSk+mxl93hpyfk31wTBNWzo29SWrTQX1RdmdPzXozk
	 f+u6UjZ+mzzjS3m1mtvMeoO9LdABILbq3YTBaS3jZSaRk1w9+56dgD08YkpehoNp3H7gU
	 pU9OjOUIBK4Awt35Ku/CpxMxtK0r6sYyQNJfnv39FHEL1O2AR43FoPOrRNhzon/k0KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=c9DA1cFS;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADAF606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADAF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=c9DA1cFS
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-998569550adso1734949241.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794397515; x=1795002315; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
        b=c9DA1cFSmxCvO39uVubU9GovzfKszsFQBrJmlM2Z9CBevLDLmE6mQZuJVOweGh6q92
         0i/zFk4uRueqghCvx+g0+EWpI118FoHTAGu+B4lBXBLA4cgYDizfhGfUvUEQ7YGmsFKL
         m+Xp7kjZh8p19s2Oe8TjPO/gkx1lizaudJ41A2Cz32W6t1h7aNO644Jrm9adsvfwrUWb
         T9ISwCJMNe01okSmWCNQRK3WtK7JqMxeGtVhdx7lkJUWuP5P0RRYGt/AOr7mBU5aX3r6
         pRxCfdWUSag0sw8VpJMWFolX9dxNsern051lY7I2xzQeMMO9clCGP/e1NYzjUyXpksnd
         6qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397515; x=1795002315;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
        b=BiZoOXN/kz3Z7PCBUHjxKg4ToBrBrH5BkOP4Z1qb6J6sev9mnWMMeKwuvxNNIW9caC
         W24togE8vVMYPW6fZxzBBvslBDw6dGlsstGPD0fgLeKmm1HPbVP94KlLAjij0twbzt5k
         CiRNBX8feuziNdJksvj27PrN8q8hkfAbG/i1+mNM2ruRKYetEdUEe8DTxh/n8wGtQ+LY
         fcPpCpSQdlT5iCw0BnH9RsKnUTZ9i8donrY5WXcjDhXIrmiVX3mzZTzGkirjs8YUbBud
         iKGSRZ5WTPX0f6E+5JPZV7AV+psHCjw6KRfKylF6nrwrsXAFCzFvPG+nLCMrisyeQ81j
         C1aA==
X-Forwarded-Encrypted: i=1; AL+hErFE5SoCA99KmIW4fTQnvN1lJKC+CzzJMS1UOYO7iElJII3PifMSTutgN7LsZwma2B5h1WfLmj4yyoMOUDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uK43+JRap6FjAHqb/dNCcGosN0axF/xUV0Kqr18yf8p7N3DVy
	9zEqIuInostujfHHhucABmPF1v/3XzSzzppqKDv8NQrN9LcOk+0RrY413mlBKVSKnuk=
X-Gm-Gg: AYBFou1UIj8VFJim1WQusZdKPxJHsw8K3KVBW3irUxNtX+SG15VGkuagfWE3C/yZpeQ
	d3lVGC9Gtj7moLXaa4PUjrHh/cb0CPEnc493NPSn44ghsUfDQC96srHlJ6CG8Cxs/34cMyfBt3S
	WqfvCUK54sBCYzLTs6WTondWMzuUYMJk4W7ulh5zQcxhrvGNvX8AGmkXRpPY9xJrv0ncvRTfEOs
	PNoRN5taEYUTHTCSNyzPxUHSskLvXbxs1fvSPU0Y56kLwTRs8x81oCjj5J9w4QjwyMGKefoLmU/
	nhzCOATUlPquzZQoJIayiqriutGIoeXOeqixt6m3/jqa5RJn67NY2QNq36YwklRqwG6aG1lBoip
	k1GwnOFqhiH9dcf0rEjJ8QthUuND73lEGEsZ5wFy6+O+jx+ssEd1tTYJpq64NZGSS2syOgarCJh
	SwSFTmlNn26a6wx5/DJab3NsT8QX8Rqbn/olLXcV5ced/3PK/eV3CQIraCeXc48DM8eG85zZNvP
	CvnzP6Y3mCqiqHzbOD3Btx9QomnXvqDhP5yyeT48GZvsPCB6kWqAeXsmsvKMK1mWnU3NDrzvMuZ
	Y5+CGTxpO+0vaAQyiKWSh6zSujfe8tggKMKfnYnJi50RAo5LmAIGFuoDSKSTUTqVUEpRKKWjDM5
	xqcieryexj3KiFT+2rqOcUUivYbsrPFU=
X-Received: by 2002:a05:6102:5241:b0:7cc:306:d3ab with SMTP id ada2fe7eead31-7d4efab730fmr666726137.5.1794397515001;
        Wed, 11 Nov 2026 03:45:15 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023543casm3548860137.5.2026.11.11.03.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:45:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 06:45:13 -0500
Message-Id: <DMSCTXTWCJWK.QF8T3E7OJ7L2@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
Subject: Re: [PATCH v5 0/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <179439592040.425130.10808690337075841196.b4-review@b4>
In-Reply-To: <179439592040.425130.10808690337075841196.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> Currently, LUO freezes outgoing sessions only inside the
>> reboot(LINUX_REBOOT_CMD_KEXEC) syscall path, serially under global write
>> locks, and binds every outgoing session's lifetime strictly to an open
>> session FD until reboot.
>>=20
>> On hosts running many workloads (such as VMs or stateful daemons),
>> workloads do not all pause simultaneously inside reboot(): they quiesce
>> one by one ahead of the host kexec. Userspace needs an explicit
>> per-session freeze point to snapshot final file state (.freeze()) as
>> each workload pauses -- concurrently across sessions under per-session
>> locks -- along with a way to commit a frozen session into KHO so it
>> survives closing the session FD.
>>=20
>> This series introduces LIVEUPDATE_SESSION_FREEZE on session FDs:
>>=20
>> 1. Freeze (flags =3D=3D 0):
>>    Freezes all preserved files in the session under the per-session
>>    mutex while keeping session lifetime tied to the session FD. The
>>    session stays frozen as long as the FD remains open; closing the
>>    session FD before reboot (for example, to abort the session or on
>>    process exit/crash) runs .unfreeze() and .unpreserve() and reclaims
>>    all resources. At kexec time, already-frozen sessions skip the late
>>    auto-freeze step and are published into the outgoing KHO subtree.
>
> Let me bikeshed for a moment :)
> I'm not fond of "published" terminology. We just moved serialization
> from one place to another, why not keep the naming?

sgtm, I serialization it is.

--=20
Pasha

