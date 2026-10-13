Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF784BD34F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885514; cv=pass; b=QaoXbm6QCmSMavEy8VHNIiYiA7ZnrlhOXwob029Kwy0xl/5QYuWpwt7gelcRfUSIrebfc5qceuzznnO18jSuWxTntz6gREXkzP4P2DjaCSOPcUGCm1zcd2DxcAWHkSIIIxlRK4pHt9ghXajz7wqB8S677Q3KlfNdElYOEoXxtjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885514; c=relaxed/simple;
	bh=Pijun/c7Q/qMjx7b0OfVDoL7I+g99zc7vkYz1Z6zZyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OydsMmwM8v970fVcYMP5Z6g3QmokDT8qeOGMeWNUAgDxMSZOPNloDNaLwAhhG4hAPqnYUup7522l6bJLst770MFvQxEYuJFRP2gRhum7A4ZrB7s7hOTg4HDKrewFQ8UTqeAjKoZJ9Szjav4nQIkaAvaIP1cSqDgW32WJQtQSKOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgN/5T+z; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgN/5T+z"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso3075120e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885510; cv=none;
        d=google.com; s=arc-20260327;
        b=oqPCnztLYnATTU15Xw+zakgOOnXDId9ok00WOUVlh3iAUwkarDupvCkQZ1760JM9r0
         crp1iKfy7VMociNhqjt7mGxlUhnCd8fnrzL+P4Rf7kyuoXFWqm5DyRadgp20woQXlcKA
         KY5SQ8adIY+wsKHMUYcxM7SH5UnvgFKz4iF0gnZRPOZ3jUVh3ynar54tmsrK310R0psd
         0Kdcg6zJDw3PLhyiXdETcvspaLAPruB410+GOf41e9UNeeE7dO3CMNQoWoJ5u4Fo/izT
         x9BNxSytbl7bqnI3CM/B+Rh9J7RUtenKIHS3vns7mlvNebBrHBxS0FwmQCIFRifldser
         X4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DNeKO4TBDFe4+9cv1Bu0mAOQ8MDYKZNyx3Mk7KxVTVA=;
        fh=eFlrGXDpO+9cW8GoIdKW22kpWwkDyunH360pvL7ZrUY=;
        b=Za8QJFgxUcustn+1oeDgKcvo0P/HbM8NyRG/jAWvHiFSiC90CO6DgwQHoopqv5zQLL
         wnfkL3B0aJ67eAYv0H/VGGhsu1ZMWa+GnxihSiUA6IwnU0jS1iNW4lOUrw+04VgPspJd
         zmO5ttxve+MvlJ5LLZsJRsbnOHi4Euo0tVLbwPt7uRqj0DUnAnrg0Bj+67YkWMdiyRdP
         cFkcKPcCwxXmQ5R+Zb1zgkzgZztJMGF9/+TWkTKls66eyrhcfQK+bKYEhIMir3N08tbN
         x0aIh3upFGodrNJWpdKqsLay6V7wPKzrSKvm/QqCx2qeh6+BwDPhqzhecMIt0iX47vNw
         kcTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885510; x=1792490310; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNeKO4TBDFe4+9cv1Bu0mAOQ8MDYKZNyx3Mk7KxVTVA=;
        b=SgN/5T+zW2rZuoRHymOus3pgF42feCGgECrO4S8EuANWoGdaGN0xkpByIgszCCRsBW
         CCGe9B6isuuZYAniM7N989XIucedYnx/Ivfj3f57gHQQA+v9HS3SP6dHB+XpcTqm00L+
         Io56HZaCKHzGiorOMVWMihA8jcCVGo1frYcLPrVCsBc96goCwrdjvxt8vVcNvBvQpSSe
         lPtmHbmxAOBqXGbMJ8hyPS497tHLgIf4Snv0Qtx+BNu/LzKe/AcfKYbs8CPW2Njfi48O
         tTsOGWAnarbmyFcVLI3xTPBZ09ciiqSNvsxWlMkxu6ZucmG2yQwM/CBNfZb+/dWAIW4g
         aY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885510; x=1792490310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DNeKO4TBDFe4+9cv1Bu0mAOQ8MDYKZNyx3Mk7KxVTVA=;
        b=PeILgl1psyRK9XTIJldqpyJI/PBhcBmnvjAgE+avVjVUgCeO/2VESvRUbgO953mfzh
         OFaN8DVPmyi4+uNX2iRHUrnocM0tt80eSC5nyYYhXuZxqZC6SwXByrta/3offcjVlhyG
         AsGHOb6KfSBz3CmouGw4VZfX7byFPny4KUbX6CgbytCrkWfJql8i66mvB5BY5AsJW81v
         hOgkM+LGnRJQdHewRuBryPJuwP1DLuRPoyPiPE/RvCzZyL4nz6aROkUVYntgxRhUtl0E
         SvHDh9ZMkokkXqmpktwIGQJzXSbkYfeoxYaTfhd1ByiRA95SEKnKls1yTIYzbq7V/hRs
         YwEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZY1keSlbr3LpvEmkaq4iR7ix0whGiRSyuinUUe3NtOmu9GLwVTxlnRYrepMMLAcL//wsD8QX0JKEe9lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYInz+z/04m9omYufLzchxUkpQOYLk2ymMI1qdBpYSqAPminjkzC
	92jGgbCRQA7xHcLL4s425M9WEuvbB17vOHr0CJC7TCyxMdo3bHsYvPykmDSGXHCGYzyf0rbM3X1
	ffNDqnrWoEJLfBAgZODIRhtC7OxrztswsnQ==
X-Gm-Gg: AYBFou0J8hnDADeKpJyJt/RvBzzIze8nkDpptGFddk3DSXZpVgsA4CA76067CsANMTh
	RC6BdP8ME8MVIL8AiHee73H79ISBSHqRqrwpXUDLru9Kx510asQME4YcnJqExNvkS/V4AhKywNY
	u7OP6jjIrAxD25SjM/CSR7REIOTGR4ls08GtvEGDcURTOlNLhxUgZ9jD5rkpMrKC+97cRfpBfht
	Usu0oZWqFLcZJ4I8XGoT63AGAOspJBdrq8ITlSSCNy7ALH+YunRm1D9jgm9MbRxpViFZetCHsYY
	opBxLBjWxLYf3wVV2Whz0olLjblPvECU5MD8ZQmQyBqhj3+tp/tfYML78ZeN4EERq+xNkJujt1u
	1yjdselOCq+zit+7q8W6iw21iyKAobmsULch1NXzunnNrJ9egqpVnFvI=
X-Received: by 2002:a05:6512:3045:b0:5b8:f453:b0e with SMTP id
 2adb3069b0e04-5bcde6caea0mr3852793e87.35.1791885509909; Tue, 13 Oct 2026
 02:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANGjgdnO3HXAxA33cT_rv=on6Qwyf95jgicj6cZKA86Q6tv0Sg@mail.gmail.com>
 <20261012105953.GR4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20261012105953.GR4121339@noisy.programming.kicks-ass.net>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Tue, 13 Oct 2026 17:58:17 +0800
X-Gm-Features: AclHuK-8HebT0C2u40u8b79Hg7Sby3aKNq3Es3_ypIBWHGmIZAIz_cHpLdf-UmY
Message-ID: <CANGjgdnmcm101FneQse==f-YQhKyoARzt20AMyWz21HLQLEFew@mail.gmail.com>
Subject: Re: [RFC] sched/fair: avoid redundant updates for unchanged default slices
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000004bf46f065db5dbcd"

--0000000000004bf46f065db5dbcd
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Sorry for the long and confusing explanation. The performance test was
not a PI test: it repeatedly called sched_setparam(0, priority=0) from an
ordinary SCHED_OTHER task using the default slice. PI was only part of
the correctness checks.

You are right that equal runtimes alone are not enough. Both problems
occur in unmodified v7.2 and my previous prototype. The attached revision
uses your mode-first comparison and fixes both in the tests:

- Requesting a custom slice now switches the task to custom mode, even
  if its duration equals the current default. Later changes to the
  default no longer change that task's slice.
- In the RT-PI test, sched_setparam() resets the implicit uclamp_min
  from 1024 to 0 after the boost ends, even though the slice duration
  is unchanged.

The revision and unmodified v7.2 also passed the basic syscall checks
and the other controls: RT/DL PI, default-duration changes, explicit
uclamp requests and bounded concurrent default changes.
The revision keeps the update path when the default
duration has changed, an implicit clamp needs resetting, or the task is
not currently in the fair class. Explicit uclamp requests still take the
existing update path.

I reran the benchmark with the same parameters on unmodified v7.2,
the revision, and unmodified v7.2 again. These are new measurements,
not the previous prototype's numbers (ns per sched_setparam call):

                         Original A    Revision    Original B
  Unchanged default slice    615.98      162.39        617.03
  Unchanged custom slice     162.69      163.22        162.45

The default-slice case saves about 454 ns (73.66%); the existing custom
fast path costs about 0.65 ns more (0.40%), relative to the midpoint of
the two original runs. The runs used the same GCC 15.2 build settings
apart from the release suffix, CPU 2 on the same bare-metal machine,
full preemption, performance mode with turbo disabled, and 15 samples
of 500,000 calls per case per boot. Control drift was below 0.18% and
within-run CV below 0.30%. Probes were used separately, not during timing.

The attached default-slice-peter-v4.patch is the revision tested here,
against unmodified v7.2. Does this look like a reasonable way to keep
the unchanged-parameter fast path while handling these cases?

Thanks,
Chengfeng

Assisted-by: LLM

--0000000000004bf46f065db5dbcd
Content-Type: text/x-patch; charset="US-ASCII"; name="default-slice-peter-v4.patch"
Content-Disposition: attachment; filename="default-slice-peter-v4.patch"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

U3ViamVjdDogW1JGQyBwcm90b3R5cGVdIHNjaGVkL2ZhaXI6IGRpc3Rpbmd1aXNoIHNsaWNlIG1v
ZGUgYmVmb3JlIHNraXBwaW5nIHVwZGF0ZXMKClVzZSBzZXBhcmF0ZSBjaGVja3MgZm9yIGRlZmF1
bHQvY3VzdG9tIG1vZGUgYW5kIHJlcXVlc3RlZCBkdXJhdGlvbi4KS2VlcCBzdGFsZS1kZWZhdWx0
IHJlZnJlc2hlcywgaW1wbGljaXQgY2xhbXAgcmVzZXRzIGFuZCB0aGUgZnVsbAp1cGRhdGUgcGF0
aCBvdXRzaWRlIHRoZSBhY3R1YWwgZmFpciBjbGFzcy4gRXF1YWwgbnVtZXJpYyBydW50aW1lcwph
bG9uZSBtdXN0IG5vdCBza2lwIGEgcmVxdWVzdGVkIG1vZGUgY2hhbmdlIG9yIGNsYW1wIHJlc2V0
LgoKVGhpcyBleHBlcmltZW50YWwgcHJvdG90eXBlIHdhcyBwcmVwYXJlZCB3aXRoIExMTSBhc3Np
c3RhbmNlLgpJdCBpcyBub3QgYSBzaWduZWQtb2ZmIHN1Ym1pc3Npb24uCgotLS0KLS0tIGEva2Vy
bmVsL3NjaGVkL3N5c2NhbGxzLmMKKysrIGIva2VybmVsL3NjaGVkL3N5c2NhbGxzLmMKQEAgLTQ4
OCw2ICs0ODgsMzggQEAKIAkJcmV0dXJuIC1FUEVSTTsKIAogCXJldHVybiAwOworfQorCitzdGF0
aWMgYm9vbCBmYWlyX3BhcmFtc19jaGFuZ2VkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwKKwkJCQlj
b25zdCBzdHJ1Y3Qgc2NoZWRfYXR0ciAqYXR0cikKK3sKKwlpZiAoYXR0ci0+c2NoZWRfbmljZSAh
PSB0YXNrX25pY2UocCkpCisJCXJldHVybiB0cnVlOworCisJLyogS2VlcCB0aGUgZnVsbCB1cGRh
dGUgcGF0aCBmb3IgUEktYm9vc3RlZCBhbmQgc2NoZWRfZXh0IHRhc2tzLiAqLworCWlmIChwLT5z
Y2hlZF9jbGFzcyAhPSAmZmFpcl9zY2hlZF9jbGFzcykKKwkJcmV0dXJuIHRydWU7CisKKwlpZiAo
ISFhdHRyLT5zY2hlZF9ydW50aW1lICE9ICEhcC0+c2UuY3VzdG9tX3NsaWNlKQorCQlyZXR1cm4g
dHJ1ZTsKKworCWlmIChhdHRyLT5zY2hlZF9ydW50aW1lICYmIGF0dHItPnNjaGVkX3J1bnRpbWUg
IT0gcC0+c2Uuc2xpY2UpCisJCXJldHVybiB0cnVlOworCisJaWYgKCFhdHRyLT5zY2hlZF9ydW50
aW1lICYmCisJICAgIHAtPnNlLnNsaWNlICE9IFJFQURfT05DRShzeXNjdGxfc2NoZWRfYmFzZV9z
bGljZSkpCisJCXJldHVybiB0cnVlOworCisjaWZkZWYgQ09ORklHX1VDTEFNUF9UQVNLCisJLyog
RXF1YWwgZmFpciBwYXJhbWV0ZXJzIGRvIG5vdCBydWxlIG91dCBhbiBpbXBsaWNpdCBjbGFtcCBy
ZXNldC4gKi8KKwlpZiAoKCFwLT51Y2xhbXBfcmVxW1VDTEFNUF9NSU5dLnVzZXJfZGVmaW5lZCAm
JgorCSAgICAgcC0+dWNsYW1wX3JlcVtVQ0xBTVBfTUlOXS52YWx1ZSAhPSB1Y2xhbXBfbm9uZShV
Q0xBTVBfTUlOKSkgfHwKKwkgICAgKCFwLT51Y2xhbXBfcmVxW1VDTEFNUF9NQVhdLnVzZXJfZGVm
aW5lZCAmJgorCSAgICAgcC0+dWNsYW1wX3JlcVtVQ0xBTVBfTUFYXS52YWx1ZSAhPSB1Y2xhbXBf
bm9uZShVQ0xBTVBfTUFYKSkpCisJCXJldHVybiB0cnVlOworI2VuZGlmCisKKwlyZXR1cm4gZmFs
c2U7CiB9CiAKIGludCBfX3NjaGVkX3NldHNjaGVkdWxlcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAs
CkBAIC01ODksOCArNjIxLDcgQEAKIAkgKi8KIAlpZiAodW5saWtlbHkocG9saWN5ID09IHAtPnBv
bGljeSkpIHsKIAkJaWYgKGZhaXJfcG9saWN5KHBvbGljeSkgJiYKLQkJICAgIChhdHRyLT5zY2hl
ZF9uaWNlICE9IHRhc2tfbmljZShwKSB8fAotCQkgICAgIChhdHRyLT5zY2hlZF9ydW50aW1lICE9
IHAtPnNlLnNsaWNlKSkpCisJCSAgICBmYWlyX3BhcmFtc19jaGFuZ2VkKHAsIGF0dHIpKQogCQkJ
Z290byBjaGFuZ2U7CiAJCWlmIChydF9wb2xpY3kocG9saWN5KSAmJiBhdHRyLT5zY2hlZF9wcmlv
cml0eSAhPSBwLT5ydF9wcmlvcml0eSkKIAkJCWdvdG8gY2hhbmdlOwo=
--0000000000004bf46f065db5dbcd--
