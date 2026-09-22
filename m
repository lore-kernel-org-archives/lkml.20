Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774E55616CC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094499; cv=pass; b=Dqh58pT+ogDRXkjgdaZehEUYNWmGrPLfIBckqPjNH+uv9MZxTqVI7Y4BJy44ZuinuPRPtZ6uTNr62136r4/PEKDq0ndwNGqFd6AlgpMs8ebkcyEUv12J1MKOVbRKNZKcCRlI/M1KIxAL94Z7/HaVaXozeqvs0eVs0FrC/QHgUP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094499; c=relaxed/simple;
	bh=g41lSEJVifoLLki8xKaYXd2wESUfC9pFlILsyKjBmxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYF5XNX6BNo/ncy1Qlb9Ic/GBq3hEUVqrLk3cJeRvjuRL8anZq7vUnJZ59bp7opDUyey6UEIvvn9eIESG9cUMn9TM4ZdntQQS9MYrgRhYcHc1qB34xJo1Vjy2TZvouXOucn40AnFlGHSIzbMepcQo0KJhEgRWBX/3cOewjQFscg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyrzTAks; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyrzTAks"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so23807701fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790094495; cv=none;
        d=google.com; s=arc-20260327;
        b=aGpmydG2YDXZI1PXmqmCsXKx4VQnBOBNVMSmaWJ+xCcUMiuBT2XIgY/yLH/g+NJdJ2
         9yO4qph96fVbuc/JyrFnEee0r5MnKeWsvV8gf2Z4RvZyvmMQgz5GT1+H4rOHYj7rd55C
         VCHktXVS4KcVQYWXxE/SFADlv5qc3ZDYzJxrtdzXnoXlp76ywweGeEeuk7TsddV3WKXa
         Gp03yR6u07vPBIpPVDjFTNsneau/OKs+YiCDZE6aZLsSh9UDfOfSazLnDHdMOj38ck0T
         ats/Q0VOuZOi/AWeHFGH2sPVE6LMw9aOLj83wLYD2o2Oh0smFdq5czc3O1rZWZ4NlHv8
         LOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a/BHeMU5owW/H6JFz/PFt/fhWxi9JFNw6SR1iQIoH/8=;
        fh=7ztGWPt3xobvGuvXbWHlChR5oej6JSAL9wVIG6LU1gQ=;
        b=FCYW0VHfKCZK5gby2RLPfqGgoiinhgZnBztXbbuWAOrOOZ+gocu5XmJxQSDUn0wxh5
         z3SDckwUKBahoisel2jN+wqW4xm3gdXA0i6ntrc5Px16kFO8k2XJegxsxrIxSDd4SmLd
         s3yvy0afeAZcQHgK7w/hKjQYi2nn41F1VgSayCH49pCqSWVjwW23/CZytQEwB2XvUYdB
         U7z2VCvQ8+raX77kV25+ommmSJQPXgPQCNoHhHBWC9KjrUv3v0TJ+9H+J/U1ImjUNSqm
         52qBzxlnNn/R9H5H7vMovP7tmjzzgRJUZDiPCD3PtCs1Y3SC9Wd+uQ9K1ntyeDZH+stB
         gZTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790094495; x=1790699295; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/BHeMU5owW/H6JFz/PFt/fhWxi9JFNw6SR1iQIoH/8=;
        b=qyrzTAks1dM4rPBUF+gxjTisJo0cY9jLiPW7MCiPoxPMHg67NsJs1tIC736ZuBpSYL
         hofM3msNBORAN5ybS6ecvZ9x6d4CM9zxiOaHao4GFkY/8o6Aybyq6caOqbWYIjmdPL+A
         wBIBeMoOplpYAQgTHmnOMVn5mW6K+osLEJidHLic9P5fZoSet8xTjHiskZPhEC4nKc7D
         BH2x167UdM37hEOiBKJdp3JC19SYPHtR4uXEsUkSUMPUiaMT4JubrY1ZFcxNKFKWsc7Z
         fStmP/3koB8u62ja3Icbgeff54eeLdal9NPjgCEqMeHLxjzJwRcpMxVWI5kr6hOj9EJf
         kwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094495; x=1790699295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a/BHeMU5owW/H6JFz/PFt/fhWxi9JFNw6SR1iQIoH/8=;
        b=1gdZFgX+1QGBko0kAOaBUGLH+PJJbLqx/Wt7fARTR+zb7v1wd2GvKFk8ZbJInk4S/6
         pngDzzmv8pA5aBooiNnkGZv6em2f6eIYFc2fJ16oiuBqat4OOWFFFkW/TlVvJ9dOHk+k
         WBli9R8KmwKiTAUFmfqZOTM+vixeiIc5EQZeC200lBlStgmAaowyuQgIV+QEl23mrHuA
         lqieBfZlV6Ery/UDywQgIDB4ZH2ixRscl/shOgDWQukfaCQjT1i41Uhsz3TnSRnhUpsD
         aaN8mFK/yVCcRq68PHwAhQx5MqD5Sks0miPmsLhviff/VL7pNuA81Zbt3ikbf+2gknxs
         2tFA==
X-Forwarded-Encrypted: i=1; AKwUvBz0rDb2utNq9pOu8RDjH1EeHmYxA2NAc3RKzEqhWPaE7lbtD3zMC7zvLquliR04i7mEgBrskhL6/sjba4o=@vger.kernel.org
X-Gm-Message-State: AFuF++nBy/UTrc4s/fB0iTqZf6GhrcMEIl4R2rEVsqaTUhhwNzmm04Hp
	zTdsouSkFxrqhLfrNIN607mVynm0mJp4riJs7hj3gWIrqxwj5wYRLQGjWLKZrDfaQux5PwCcpcd
	j5yBCqfR29DAEA5HI1Epe9syKkPqhu4ppZ/rB
X-Gm-Gg: AYBFou2XThvvuyRRIgRi0SzsocyXRSwg9pHzyLZwIilvVXpx89eNnLYMopw93YzNcD3
	MZoK5RTX0VJD91WhFhPFw/WI/wOTAVzSAtNBlSbBJrqDTUVv0PoSGoUm3PPn1MDd4BULmK6StfV
	hNz+UVL++e0H+LL5VdbEFLw+mbJtcHQ5R/kHvYmvQVGl2+SBOIXED67h8Gy//oeqyKD8jcmr4Vq
	fkFRJflsid6v1mKIp6a4luy9TnTO35rkgGOgya/vWd0bOxvQeiAF8tYoe4JqqpeFgh2PCzXXX0a
	AbeP5wO7DWZ26RiT61RNyww9X5BnIViN0UyuYX32JE07fvx+pXNn55E94JrQrRZMSmOmji9yD7y
	vNe7zsQV1Gp+hvw==
X-Received: by 2002:a05:651c:30c9:b0:3a5:f982:9c78 with SMTP id
 38308e7fff4ca-3a5fbebfc4emr31286961fa.2.1790094494779; Tue, 22 Sep 2026
 09:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANGjgdnoz4NdqzOV9+SZaYTc+O_GkNNn5NVp+ZpHUQbp5h-QVQ@mail.gmail.com>
 <075aec24-cb7b-44ea-b3d8-be913a87c958@canonical.com>
In-Reply-To: <075aec24-cb7b-44ea-b3d8-be913a87c958@canonical.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Wed, 23 Sep 2026 00:27:59 +0800
X-Gm-Features: AcwNN1WT15TcNQbGkaUlrPH7CYeriQ9Jzn6FIklMTfXi30WpsDL6oO2ILNL91P0
Message-ID: <CANGjgdmQZ3AdU5Lr-vYYph9iJ_YwFDd5XaeF6XFgOMEEmaL3nQ@mail.gmail.com>
Subject: Re: [REGRESSION] apparmor: AF_UNIX datagram send slowdown after 6456ccbd2ff7
To: John Johansen <john.johansen@canonical.com>
Cc: georgia.garcia@canonical.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000079fc08065c14da23"

--00000000000079fc08065c14da23
Content-Type: text/plain; charset="UTF-8"

Hi John,

I tested a small early-return prototype on v7.3-rc4 (93f51579e7df).
It reduced send syscall time by 12.84% in the original unconfined
socketpair benchmark. A separate two-process test found a 1.25% cost
when both peers were confined but allowed to communicate.

The attached patch returns early from aa_unix_peer_perm() only when the
whole label is unconfined. It skips peer-address and audit preparation.
The sender and receiver are still checked separately. The patch adds no
per-object fields and does not change label updates or locking.

For each prototype comparison, I used original -> patched -> original,
with a separate boot for each point. Both kernels used the same baseline,
GCC 15.2.0 and config, except for the kernel release suffix
(CONFIG_LOCALVERSION). The machine was the same bare-metal i7-12700KF
with 32 GiB RAM, full preemption, performance governor/EPP and Turbo off.

Each condition had three invocations per boot. Each invocation had
3 warm-up and 15 measured rounds of 65,536 messages, sent in batches of
32 messages of 128 bytes. Only sendmmsg() was timed; peer draining and
payload checks were outside the timed interval.

The original socketpair test ran on CPU 2. Results in ns/message were:

  original A       patched       original B
     416.073       359.448          408.719

The patch saved 52.95 ns/message, or 12.84%, against the original midpoint.
Maximum within-invocation CV was 0.114%; original-kernel drift was 1.78%.

The two-process test used connected abstract AF_UNIX datagram sockets,
with the sender on CPU 2 and receiver on CPU 4. Both ran as UID 1000.
The confined policies allowed communication. Results in ns/message were:

  peers                  original midpoint   patched      change
  both unconfined                  455.564     412.052      -9.55%
  sender confined only             569.902     561.786      -1.42%
  receiver confined only           578.244     562.807      -2.67%
  both confined                    741.385     750.620      +1.25%

The socketpair and two-process tests have different workload shapes.
Their absolute timings should not be compared directly.
The both-confined case added 9.24 ns/message, with maximum CV 0.51%
and original-kernel drift 0.16%. Across all four cases, these maxima
were 1.80% and 0.60%. These are send-only microbenchmark results,
not application timings.

I tested confined/unconfined peer combinations, stacked labels, datagram
and stream sockets, old and new policy ABIs, and serial policy replacement
followed by socket recreation. Allow and deny results matched expectations
on both the original and patched kernels. Fine-grained UNIX permission
tests used ABI 5.0 with network_v9.

Separate untimed probes confirmed that the outer checks still ran for
both sender and receiver. In the unconfined socketpair probe, internal
unix_peer_perm() calls were 2,112 -> 0 -> 2,112 across
original -> patched -> original. The two-process probes also confirmed
that only unconfined sides skipped this internal check.

The follow-up kept sockets open across policy and mode changes. Permission
results matched between the original and patched kernels. Each boot also
had two concurrent tests, each lasting two seconds with 16 policy
replacements during the send loop. A fixed sender deny remained effective
while the receiver policy changed.

One limit is worth noting: receiver-side deny updates did not revoke
access through the existing socket, on either kernel. That path uses the
socket's stored label, so matching the original behavior does not prove
immediate revocation. The live-update tests did not cover stacked labels
and were not exhaustive.

Separately, the original controlled source delta still reproduced a
13.61% slowdown. v7.3-rc4 was 20.35% slower than the same old baseline.
The latter includes other source and config changes; I do not attribute
that whole gap to 6456ccbd2ff7.

Results and test sources are at [1].

Would this whole-label early return be worth pursuing, given the small
cost on the both-confined path? This is a prototype for review.

Thanks,
Chengfeng

[1] https://github.com/lcf0399/linux-regression-evidence/tree/23b61ebab6aff0d8316334da7a988811082d204d/apparmor-af-unix-send-old-abi-6456cc/bare-metal/early-unconfined-20260922

--00000000000079fc08065c14da23
Content-Type: text/plain; charset="US-ASCII"; name="0002-early-unconfined.patch"
Content-Disposition: attachment; filename="0002-early-unconfined.patch"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

LS0tIGEvc2VjdXJpdHkvYXBwYXJtb3IvYWZfdW5peC5jCisrKyBiL3NlY3VyaXR5L2FwcGFybW9y
L2FmX3VuaXguYwpAQCAtNjM0LDEyICs2MzQsMTcgQEAKIAlzdHJ1Y3QgdW5peF9zb2NrICpwZWVy
dSA9IHVuaXhfc2socGVlcl9zayk7CiAJc3RydWN0IHVuaXhfc29jayAqdSA9IHVuaXhfc2soc2sp
OwogCWludCBwbGVuOwotCXN0cnVjdCBzb2NrYWRkcl91biAqcGFkZHIgPSBhYV9zdW5hZGRyKHVu
aXhfc2socGVlcl9zayksICZwbGVuKTsKKwlzdHJ1Y3Qgc29ja2FkZHJfdW4gKnBhZGRyOwogCiAJ
QUFfQlVHKCFsYWJlbCk7CiAJQUFfQlVHKCFzayk7CiAJQUFfQlVHKCFwZWVyX3NrKTsKIAlBQV9C
VUcoIXBlZXJfbGFiZWwpOworCisJaWYgKHVuY29uZmluZWQobGFiZWwpKQorCQlyZXR1cm4gMDsK
KworCXBhZGRyID0gYWFfc3VuYWRkcih1bml4X3NrKHBlZXJfc2spLCAmcGxlbik7CiAKIAlyZXR1
cm4gdW5peF9wZWVyX3Blcm0oc3Vial9jcmVkLCBsYWJlbCwgb3AsIHJlcXVlc3QsIHNrLAogCQkJ
ICAgICAgaXNfdW5peF9mcyhzaykgPyAmdS0+cGF0aCA6IE5VTEwsCkBAIC04MDksNCArODE0LDMg
QEAKIAogCXJldHVybiBlcnJvcjsKIH0KLQo=
--00000000000079fc08065c14da23--
