Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C72ED154
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525556; cv=pass; b=P7X5ACm4iVsrxRKqe0gCtjmJ0ZUWc/uG2udQo4JJfkaQ/BVZkHyAN/nGNv3uRUql56XvTUFmHPHRWuTmkafMuFwr57wEwtRhPlvssR66W8y/4QFlIHRilzH+No4ye4U+0cd/yCK2HtTd5INH945GcodGHAuA6E2twdcvyxsu4Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525556; c=relaxed/simple;
	bh=UbHdjXh+CgiQpvJHaSyIzPDW6diIJy69tmAGod3Q4Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcGB4MuL0kxYYBbvOQDbGnakIVxD0vlCYDYuAQU22xlUAJNfE/zDXxRUORL/bkIZxh7pBTMPFneq9ow67UuxepUj8jZOCWnyay+L+jvz7AMSgCqHjWAaDGx8j/TPc7RkF19rgjsXP4HOswx+i2kuHKqRxmklDg3LuJ7WT02NUGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cq39CDHZ; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cq39CDHZ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so3404a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789525550; cv=none;
        d=google.com; s=arc-20260327;
        b=VeJ+slqqT2Hl7MFLSc0Hv+/ZoQMMU1GHc0mZOONpOS+BupWGVGYqyPBjAwrgQR0UNJ
         f3VjVFJZ40dWh60H2M+RGbYhXIP/lN/7FVxmka2AniRBO2XJbxXWf5Wfj4rsal8QDiW3
         V+SljvuEg3i60oB0nlZEfKXRY4/RDkbbuJ8+NAGWO1159SXzBKrk3WlpNrBm+X47K4EL
         HzmKAGfOKjSsqswuJ5kNvNbWRaNOTuCaTCSBKTB5q/QOkTcjRHF6ZbHBDQBgHQ3z0Rrk
         uKZRy3YxT7ghACegp3e7/ldrHbTpXyLg06cYcOYOQAfLUcc6UbtMte6aEn/rWf7MlLKe
         6ybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4v5CneiAAJU37Ea93Bpgw0r+62LGWh/ZxCVYmbedPc=;
        fh=nTLSCy4kH1U/85sufO95ADY0QdBFDAdjpPK84Qj/Lo4=;
        b=iI3FfYaRzllJ3Amv4Bb5BKVtOWk2kZPa+lf6iW9glAh480aJh3aHkUhwZi/Y2YBB/U
         DT2sEWC1XN0mevxk2OMqN8VIQsu+Kv6pGQxHMIkkUaQh59xHPepYLpYi+Jr0Pkkl6eGz
         518KiJ5DbzZ0CLYUW+Ntn3EzbXcZhJduiL9iioyUPBFklCHA2JmDJK8yr8Sy9HXyGObd
         0E8HjQndN9rvLWdHCB+JFTXDo2w7g3FNs6g5FO5yeYR6RbfpwlL7Z8KASvLHl3vSzh+x
         G+3GPgcLOfc5jlP3/oPB3XOGKKxn3ONhGin5jv1ee4k/UYAfPGECHgr8SYklL+RC9kMg
         v0qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789525550; x=1790130350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4v5CneiAAJU37Ea93Bpgw0r+62LGWh/ZxCVYmbedPc=;
        b=cq39CDHZeCOjj01TE2PhxjSEFjeOC90/0XKd+diB3w98/mdpj237mhKHvGyx4A16AJ
         f0twhaguAexhyvY3jdADqR3ojwNQJA3qjrYuFGxWExYxaMDK3b9Ped39a0nEUuqlgL5l
         ik6WKCGQg/RaGNyX+cxbQ58xlkZFmCh5MIibe7DH20mKXQloWRciN9J4HF19FwR+OtZR
         B8AnYumEuOEEp2toTXVpdm6vHYWc/8wnlFasoETZWr8KIjV2CagsdMsz69XULM+VbCwN
         H4zUTKYBz860u8JbOjSsNcFWtaRZaTXkEAt6R3yqT7Q/vqu0EYu4abeaOQJDCsU84bZ2
         wtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525550; x=1790130350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4v5CneiAAJU37Ea93Bpgw0r+62LGWh/ZxCVYmbedPc=;
        b=gfy/nkzL7tUmWXZuQpShsqegyCIoxHEU6Dhyq1BCDeLtuQQraNbz5JiYHETv84rzQO
         +SkVDbcQo87ESENRosWYvCNdTXaY/QVeuUXtF8wSW+rUmVvg4hWGN0JiG9yjfBrBNk+H
         GPCm2Q7br0gXpvc7b/niMU2LNaaocY9v+OfSP7kJ4nJbsIKsFFu7vVET2smFVFStL3q7
         QPwlgLQAtZZgaeW10bYwU9TOFFENycR0ulJDclsveYgwNBAC1i9S8Azl5ImVgIhYSkzu
         UW5DNCovvkPiBzHvBk5GWquHS10/6Kwhfmi+1DGbHZaXAnOz2bAVEWogtiMUjCS4Bx23
         EYsg==
X-Forwarded-Encrypted: i=1; AKwUvBw/MutYaVvvg5SvAHDedGJ6dldmnweseIEyocXdiCgU6R8zf/SD6ERxCRcfBoevj5Ck1w87MJJIpRrSUyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nYIAKWxT+dFZMU6gsQWbEVP54y9Mz+6QgFBz/GwJZ8DOLb1CQR
	AePEsiO9kNwsQSb+knlEGon1qzrRezbyRAoiZRE5E6L2C1BUF59m7NpdsmDW2n98EnPSijuHtra
	L03E6i04IODfSqXXmEgG1yC25HERRL2eZB0JBpjiuGc88pDnxL0CT8Y9XCg==
X-Gm-Gg: AYBFou0QkQTS6uh9UduuZvWXce9wbDOCcf3qCCrqDMTrgeFZhHq3OGbV+Liu3qmuJfT
	mFe16je6ex9J1r8fvPjNo3RDnlcqdufqPE4qZU09E8Ufdh7gHXjg3+cq4YYK1pGRVhNC3DIy4Fg
	VlsgluwUSE87/31meshxs1GJPz262yGDHCXW9eg+Nl2Qfb8acFuZi2DiY3brB5uf1ek6fU7dY57
	bBtlgxrVt5AzZQixi3DLCpEDYkJe5/QHtgwE5vGQPTOjuy2C3kXf4Dw3lpDFtO39hjsFxk/liK+
	7CVcRZ44HFCYxf9+SAw48isJHX413rL4xJa0m1/g6ufa9ijpQDuRAKM7mqPBSgStey3wXLdk+QF
	qFfKUYFnRVA==
X-Received: by 2002:a05:6402:a204:10b0:69c:39f5:7e36 with SMTP id
 4fb4d7f45d1cf-6aa2242dc9dmr11519a12.0.1789525550214; Tue, 15 Sep 2026
 19:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
 <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com> <aqlWt4jb4CSPnecN@google.com> <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com>
In-Reply-To: <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com>
From: Jacky Li <jackyli@google.com>
Date: Tue, 15 Sep 2026 19:25:38 -0700
X-Gm-Features: AcwNN1XSdLAmVMpNGhlhvJVsI8al7B9K_71Imap5Z5_uyW4qm1svC0PFF6S2QLo
Message-ID: <CAJxe5ctcVxmhRSw3Gt0POQTzRKoxXo7+Y3CPDe7cUZvC0QPK+g@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:21=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> On 9/15/26 09:31, Sean Christopherson wrote:
> > What if we keep this one as -EIO (or better, change it to -EFAULT in a =
separate
> > patch?), but add a comment explaning why KVM needs to exit to userspace=
 in this
> > particular case?  That would be a good compromise; if the guest is atte=
mpting to
> > access non-existent memory, the initial READ will fail, i.e. we still g=
et most
> > of the behavior Jacky wants.  The only fatal case would be where either=
 userspace
> > really did screw up, or the guest managed to find read-only memory (tho=
ugh I
> > would probably argue that's likely also a userspace bug?).
>
> That sounds good to me.

Thinking through the sequence number and VMM bug concerns, I'd still argue
that returning INVALID_INPUT on kvm_write_guest() failure is preferable to
exiting to userspace:

1. req_gpa and resp_gpa are two independent guest inputs, so a guest can pa=
ss
   a valid req_gpa and a resp_gpa that isn't backed by any memslot to sail
   through the initial read and fail only on the write.  Exiting to userspa=
ce
   on write failure therefore still lets a guest kill the VM at will.

2. Comparing the two outcomes after a kvm_write_guest() failure:

   - Case 1 (exit to userspace with -EFAULT/-EIO): unrecoverable.  The PSP'=
s
     response is lost, and userspace can't rewind the PSP's sequence number=
,
     so retrying KVM_RUN would just fail that check.  There is nothing
     userspace can do other than kill the VM.

   - Case 2 (return INVALID_INPUT to the guest): the guest disables the VMP=
CK
     and moves on to the next one, as Tom mentioned.  The worst case, once =
all
     four VMPCKs are exhausted, is that the guest can no longer issue guest
     requests, but the VM keeps running.

   Neither is ideal, but Case 2 seems to be better: a localized loss of
   functionality instead of the entire VM dying over a single bad request.
   It also leaves the decision to the guest, which can carry on with whatev=
er
   doesn't depend on attestation, wind down cleanly, and shut itself down o=
n
   its own terms instead of being killed abruptly.

3. More generally, when KVM can't tell a guest error apart from a VMM bug a=
t a
   hypercall boundary, reporting the error to the guest seems to be the saf=
er
   default: failing the guest request degrades one service while keeping th=
e
   VM alive and debuggable, whereas exiting to userspace turns a single fai=
led
   request into a dead VM, and hands an untrusted guest a way to terminate =
it.

   And in the context of SNP the guest doesn't trust the VMM anyway, so a V=
MM
   that fails to deliver a response is indistinguishable from one that refu=
ses
   to, and the guest already deals with that by disabling the VMPCK on a
   VMGEXIT error.  Letting a host problem bleed into the guest is arguably
   "fine" here, since the guest is designed to cope with it regardless.
