Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833B3B83E0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103610; cv=pass; b=SMTcgxh1oVC9RjZNegXezX5yimMae3SdSiRBd5nYOhQt9UEVxBKrKylKv4Ee1hr1nP6H+4YBMD2SPlSZkrF4fnAS1OgFbNdg06YYkina+UTH8LkuXag0Wz14PaI2I3ef8IqAFLqABTFQaUlatqMZVvuE3PdKgwO6PPVYQidKLug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103610; c=relaxed/simple;
	bh=BibMPohthJhTfbXcbpwdRGzuy13tYrFhPSpi/AgmBSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POAMQ3LNP4tHomlrXcWQGoZgTAThwC89ymuVVh5fmAqW0WiqwZFojmHTvQHcPEVZSIYGsJVD+8Lt/CUlmoWzDEHJ7VLdKAwTveNfySswMpTw/Wiha1G3psjT3blEOyQcm+lkgEDgDdxxidWjAAxHYyQnYM+9b9CBVAyH/MWbIhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KlvJ0ufi; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KlvJ0ufi"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5337c7b9937so103321cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792103608; cv=none;
        d=google.com; s=arc-20260327;
        b=PZMlSn6ZL57FE+xGIsfzogsgzBpQhA7zcZZAxI/a0wgA98onSWT3xhbtJirWc0Sox3
         0xlFUDBpYcVNjNlAJFClwgiVzE0ndRXAHNlkK8uAsVaF1sRRtqUwCQJiCEZiMY3qpMxb
         wrmtz0GYUYk1x0p6VFA6Ri6iTz5C1golfm7ZBu5o3o54jEPAsfTkyBupbodwyUQu3LkF
         L9ua5pT/WZuQrCCeLNY2aN11iQo71sJI4zz8o4L8Ndre28Pf/48Y49nfksr3iD03rqlM
         fRVQ0brflzxKNqwM6/8FqnTkH6VXoBArwftrZ5CArdJ/i+4+htvLXLZT6Ebz2ebbJ2WN
         KSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BibMPohthJhTfbXcbpwdRGzuy13tYrFhPSpi/AgmBSg=;
        fh=+T05mF91CFLNDHnGxPwOkNoWJ8lIo7DAToJZ802k4Ao=;
        b=d9i2xO9WHNpL+iOLem3gCKuYUhxmbX6dNEi01RnyDHoUZ7G12MGrFOy2PW95+j3WLe
         wDY5AN09qyyhYxifctEre5Xm75JfI7EB23gW+0IwIwagov+pIcwNTUYMJzPFhVcOL5tU
         eeSo/Gq7o4lFPnqqnLq5fgk4VEGy8m26qpYfCBhnlNgwZvhw++iAfgS2q1kiAzP6KVIZ
         syA44Ew1d7cx4SIw5hGfzHgXd2rreml9NTS+5ZesGlvD3EoUY2IYUJmjzdKAAz3ZiVv9
         8I5O0rE75g7QYZZ620Lfrm7qxf+a0Lo6a7YFIIzjQ6kPo6ieWagQXnIH/o+myyYfHJ6o
         +ZSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792103608; x=1792708408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BibMPohthJhTfbXcbpwdRGzuy13tYrFhPSpi/AgmBSg=;
        b=KlvJ0ufiX/1gevjOITkMVNOJSz9KUFbEN6M/OMYcqedSAs/JeUZ4gpTTLkdrTqbHaz
         Y2oIdzdQzMxW47JCSa3HAA76lkR8HpJJ1FyUDA6yskFxtDvAPA0TdqsPlkta/OUzYMGn
         IKYtOB7kuOYLY/TJLm2YioBapalxOpgOVgzfG9GKKTJwEm7FqllP25uDhskMhC34UYn7
         t2jF0JNqNiPCM5l22HIUbxZ3Unp5qiRlzEj0meyK+1fnWbBgF9z95hiYLn0wVCXv0Qnl
         lg0XbZ1j7OZJLP28PYPEZdTSy3kcv968Gk6JJuVSQBUy2hjd0TTRo5UfYUSQCe496tHz
         GdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103608; x=1792708408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BibMPohthJhTfbXcbpwdRGzuy13tYrFhPSpi/AgmBSg=;
        b=lqgnqtAO+PVUh/DBmdwF6QyfhGwK7R9DURqhUyBcSqcQSDur1aKbBM+OYBFt1RyNhM
         YD7zb9tUqDSYRkR5LzT9GnTaI1yd45z2gBZ8jj/iAZAQeJcLLmWafZHvttj8Un08Zy6n
         V51nX3niHkoSgKZVlZTxz6x0iaU34kZpeZ6FIUvg05V9cTDNGtuiwz8nQHdL25+ijGG0
         fI8IbltYbCj7miL0VVX/RpLM1BHpY8b5qXKSJX824LBwdnWaQRtYDGyRquLXivyOAnjI
         VVBmw/hjSnEEd2GeEUjRS4TMZGMIB7uYpz8Fga+h3VBrklu++8ueaUKXx4bOmOqMqpX1
         mrZA==
X-Forwarded-Encrypted: i=1; AKwUvBzJR/y5jWroRkLa0Li+OMQJ9IsS15CqMiy5VJf5JwXSUnKh65BhHnP8jMn9B7eaIS05a1pT/eCk3k2oDfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUATmgzK8aODhZvomRO6yRaTUZYCiBuNUDAGVH0DbpaIsK24KE
	lLQmSsR0BIIXSW/RF1n3B9sX9SvorVTmj8XDwXxXsLLn0eViDrp5JkCqg86yv0eKK773Pgu9q/m
	0ifThJHk34N3JxiyQi3egAKrrBphxcDKec4CXuznG
X-Gm-Gg: AYBFou2JGerX5bcXLgdPN11psIX2TPgyJWO1N5++tpzq1OC3NlZSkF/ZIdTCopl1LwL
	atvUIRhI8rJbPrE+qfrdi1HBkX47LrWGYY6QzsKhDh4nq+D9MoLLeefJ7/gaL5Xg0NkM3/i8Xw6
	6Jbg0clZfEXn7BEIPn4MnqeMXtIN2FEMExROfXu5cQYSaZ+AvGpmRR/GoGBvvV4TOqSeoDWO9Xa
	V96sa4aTxieaZSsjWLZ1L+k+JPfEVY84CfTOarfeAV3cm+19oN73TQ3NREy2SQ/sN0Pn2fbMnkO
	MPwbpXhFjRp0V282lAVOaem1mkQyrEnp4TYmDLaEoGawISMIROy3Cd+F49d+yjDfhjC57Cr4EU7
	L1H78NYS4bXvUqXQkVphIdZrdlWrTxN7WlySg2ldKYDchIGYvINoIyXh/hQ==
X-Received: by 2002:ac8:574c:0:b0:532:d36c:7094 with SMTP id
 d75a77b69052e-53629899acemr5292911cf.4.1792103607214; Thu, 15 Oct 2026
 15:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-22-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-22-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:33:10 -0700
X-Gm-Features: AclHuK9gItNgiMo4HaNu3uew9VFJbrQSsU2AIuA_LVIEA02ZBc73weCPD4MgjW8
Message-ID: <CALMp9eRa2TYPEK2Y4bVkQq1SD6U2kQ0bZ+magc_EnhASL3jZbg@mail.gmail.com>
Subject: Re: [PATCH v3 21/27] KVM: nSVM: Handle nested TLB flush requests
 through TLB_CONTROL
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Handle L1's requests to flush L2's TLB through the TLB_CONTROL field of
> VMCB12. According to the APM, TLB_CONTROL is not modified by VMRUN, so
> only read the field from VMCB12 but do not clear it.
>
> On nested VM-Enter, flush L2's ASID if any flush is specified in
> TLB_CONTROL. This handles TLB_CONTROL_FLUSH_ASID and
> TLB_CONTROL_FLUSH_ASID_LOCAL equally for simplicity.
>
> On nested VM-Exit, flush L1's own ASID if L1 requested a *full* TLB
> flush (i.e. TLB_CONTROL_FLUSH_ALL_ASID).
>
> Essentially, TLB_CONTROL_FLUSH_ASID[_LOCAL] cause a TLB flush on nested
> VM-Enter only, while TLB_CONTROL_FLUSH_ALL_ASID causes a TLB flush on
> both nested VM-Enter and nested VM-Exit.
>
> Additionally, sync the nested NPTs on nested VM-Enter on an ASID flush,
> as ASID flushes also invalidate guest-physical translations on SVM
> (unlike VMX, which has separate VPID-based and EPT-based flushing). Sync
> all roots, as shadow mappings are not tagged with an ASID, and there
> could be translations belonging to the outgoing or flushed ASID in
> previous roots.
>
> All TLB_CONTROL values can be handled by KVM regardless of FLUSHBYASID
> support on the underlying CPU, so keep advertising FLUSHBYASID to the
> guest unconditionally.
>
> Note, TLB_CONTROL_FLUSH_ALL_ASID is never propagated from the vmcb12 to
> the vmcb02 (unless FLUSHBYASID is not available), as this gives the
> guest the power to flush the entire physical TLB (including translations
> for the host and other VMs).
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
