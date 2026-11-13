Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587712;
	b=N3gJOfP1b+fdxv+o1Y0hRxyMKaXVSLaSySCAjmEGmT5COGqjM6r3rfi266JlBlNzF0la
	 N/nuibkhtAQXMtxr++9/FCDaYE/esRH2voRVn5XMZvgJcQ/Z0RdzD5COtw12dy8fk17kC
	 OVSTm+h9ZTTcxjbkEBSkDcmugi533QsfP5ge4QpPxDfqiG060Zi3CNocA/8xvo0VoZuX8
	 kuuChH3xgNctar11ogrKqTzhJWrEhw7V7JT3FhcZ2ZAFjejOYDKrg9BlqzdHbcJ3eTKDW
	 efC/6r+O6A7ZSCvc7h0vD6LwFdHJmRfgRRRlpLHiuU2tqr5Y2CjxgDsBj8LDo/y39Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
	b=bYqCBRIjBkp+xNcrLuasbqDJLCTT7AZKzgxMrrkbdLl8Dk30+kYBukaPcscHvodMKPLU
	 P/82hnpne2Mdcok69kgN63hy3pZENEJ88rM+dfvbBv6mP1nL8ARMlo0RdDJTMJ6ZYRtYi
	 Y5L4+M9EE3Hi/mGC3Ozuwhl6SjA3UQ81CkKxwJTuYDwfvEj+m/E1oLbjy8vDbEQOTqqy7
	 3qir96ciJSLRAkKkOwOfl8ll6hNF0E8YHOni5K+btlQUEyGMDTA4hpSnoby3cU31eFCMP
	 KX09kpy4ATp7QWvVQb7iGWXHs3UdFkTCQKSBF9fSQVsRqH7JQ4NBlaLbEsHaEqB01cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bjZkwKQw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51868606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51868606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bjZkwKQw
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5383c97c8cfso447931cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587711; cv=none;
        d=google.com; s=arc-20260327;
        b=AauGDuCCHNSiiEdWdd+TAN52ZBCKxdx/z8dYoHjyLMKBWLYZV6AOtP8zj2OsuwtSHJ
         +alOvO91WKOyqQ6q/dz1/8BkyUVlqXUsAMO9DBLUDR5BO64wUPeizudSRABKlMiIooqm
         LK3NYWs/Idz708fXNhM/1u7tf2TW8SxUi00036Ly26g8ufgwDNHYibRolx++lLz4Fo9G
         TrNC8KjxVddZW2vgk9Hycd14i0B1fgroUK0d4SIRBbiglJhVz8PggHFEHZ0ZpXRFfFyw
         tGXioe3/Vrw1FbJoWIgO1jOuB+Dar3J7n7pncdC2FZCt+2u6PgDMGCNA+2XdwFxLQ+r+
         UW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
        fh=xXmgtvXdzIxsJrZpmb+UQCwAlYdKioBy7bU30nkAIYE=;
        b=UmYPAw3KdwRHBLrurS9ekXdmvcmAaJWd3i4msHXxrvcr8nr2dYKuuNRpThPzOB4cAX
         yihihaAH/BsI7dpb7a7TxzV5GBVhL60DJeH0hRDI/5T39o6PkHQpCG90FKIi4EbPVV/b
         r3lmFaWSLEsDO6eFQLwv4dXjt15FtDjKJgMi/5qRmiD4yY88Pd52RYk/zIp/zoCKtOpV
         o+mpQoYJhwVwBz5MrOBUbZBjJ8GQhz3uNv6ni5G351AWglBK9Egdc3TLUEcOjSQ2/UcY
         Thzt3e9rmoOXvmJ1zx/atfsoIrlL4kSwNxs5TXHcJlGsrqL4KDbgbYpvnEkhcMUIGs6g
         LhEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587711; x=1795192511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
        b=bjZkwKQwarfQCokl+bReY7YfF50Xxtjoqdd0QOvCX76RT1KRX0mKFan/bMPKql3RvN
         dHVzSEcOIXLorbkJz9imLGgsXS63UwQhqSiQ0xnubEQjksGFBwLRL85cUj2aHDPCYc90
         Yi0JyHsfiUByilFI/7DemKLLmJ1suBzQj7XdERvzgN+VGW7R/FlVqKTfy5g065sPk1P0
         9EWs5k8Pri3znfXL9l8hOwkbYUTilLjX5OOzgQcJ4LhjWjp3n41ctNfCVLG9WHMcspzO
         QHxEfIn+jEugkeal06YEod4E0LHsDnWH5ctf6HZGQuvPS3Lnp9zsCIw8gfwwxmaEFTIy
         bTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587711; x=1795192511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
        b=ESfk1NJvMs8i/eITPnGYoRnPuOS9vVXeOSoorWe96+QibZP09MtnJWgStcXQteqxbX
         1ndFgjoEPEW3dmgCQjAFm8s/2BVyfv856FvnWCsIDvSSePGVsRANBXrr+vSNSCZ7jl1f
         ERYWfn0bHb2+NzadttGRtdCIhTErBK5rPO8led8YYdrcjknz6ME2nfp/ALNXeJ8mcbDm
         pjNxIH9HQ9T6D7YPGjs9D9kMjD3zWC9SZqWeOqzKkKYAfksA1qU1VrJGwbo2rwgreGU5
         ZToikqzEonv9vtTVSAqVQqFofuA7a/onNfQLq5Czq1frRLLdzB8OffTfZWlrHMDJeaEF
         fMeA==
X-Forwarded-Encrypted: i=1; AL+hErE28ILUod13O8simDd/0sbuFDjVLGd8gfezJbfVEplmXKuxBgAGmx0Tggh6c7Gogw7BvTdlM1FKFq3Sw0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h6SXIRLuN7IHbHJcUFaeArDqhcNpeaBeHkJ43P3HMK3eNfaS7
	rJ34QCJYdjRuFBkCQxreY3qGVCEk2b/+QdcAruYA0I5aajXSG7b2kRfXGXfqCEEMd4tmwnYjxj8
	ahsuVBZCpb/KO05qnZ4BDQ5QMJ5mBmOdE2yqFEMMh
X-Gm-Gg: AYBFou29sYppfV1zQYEV9TLkMYMoGKl4ZrYk7PdFRyDDWp7Qbd8mO2j4zyxx5lEpnFg
	wUPzU3nuXVoaPl7aRu8bBrzBWkAFzh5BXK8PR5EmUiueed0JN7lwoW8ma8/aA0TREIIpCzrSUNp
	c4tqer7qS9D5gt4Zpby1A5w2zKT0dE/pxNZk4N+yjY10mq/Y6mlTADrc3sVPxgmPK2XO05G7lji
	70DR+6DlcXvdJIVmkxwSg95haQRnXXk+8F9/B8C6z5bFI3RPKxKQSa7G1lB4oMvH32KYe5FaT5s
	IFR4zGGyhC6QPT0n+KVxk60c2F4f1oXvh+jSJ/FdxIhAJvC7aW69ZjGBsU40/WrU02VLlQNUXah
	5QMXi9fg5d2ljMrk01eEcQPGSgTKhNO0nyJgyyWYYjFHYCx2YdQETStEJ1hrv904vS2E=
X-Received: by 2002:a05:622a:1ccf:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55bce7e113emr6611301cf.12.1794587710393; Fri, 13 Nov 2026
 08:35:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-16-irogers@google.com>
 <avVoe_hajXqJpfmq@google.com>
In-Reply-To: <avVoe_hajXqJpfmq@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:34:58 -0800
X-Gm-Features: AclHuK_7fmidtjnY23su_Zqg7HL7UTKU7Xj3J_Z1_BDHCkhGqtFv7HpxmgYMpYE
Message-ID: <CAP-5=fV3hTWRH3B=rZ9LQeubu2mb+caXyQxdRtAfRtYO7PCA6g@mail.gmail.com>
Subject: Re: [PATCH v12 15/20] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:19=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:07AM -0800, Ian Rogers wrote:
> > In tpebs_stop(), read tpebs_reader_thread into a local variable before
> > releasing tpebs_mtx to call pthread_join().
> >
> > Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it
> > as the thread argument and setting tpebs_cmd.out =3D -1 in
> > evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
> > by perf_session__delete(). Also reset tpebs_cmd.pid =3D 0 and
> > tpebs_cmd.out =3D -1 and return early if start_command() fails in
> > evsel__tpebs_start_perf_record(), as start_command() closes the pipe
> > internally and may leave cmd->pid =3D -1 on error.
> >
> > Serialize tpebs_send_record_cmd() with teardown via tpebs_cmd_in_flight
> > and tpebs_cmd_cond, newline-terminate control commands so consecutive
> > writes cannot coalesce in evlist__ctlfd_recv(), check
> > check_if_command_finished(&tpebs_cmd) under tpebs_mtx only when not
> > stopping, ignore late samples in process_sample_event() once
> > tpebs_stopping is set, and guard evsel__tpebs_open() against a
> > concurrent tpebs_stop() with tpebs_gen, tpebs_enabled, and
> > tpebs_stopping across closing the fds and finish_command().
> >
> > Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, an=
d
> > <unistd.h> explicitly.
>
> I feel it's too verbose and not clear what's problem.  Please explain
> the race and how it fixes the issue concisely.

Agreed, the commit message grew unwieldy across revisions. In v13, I've
rewritten it into two short paragraphs summarizing the two bugs (the
tpebs_cmd.out double-close/leak between __sample_reader() and
tpebs_stop(), and the unlocked tpebs_reader_thread read / concurrent
open-close teardown race across tpebs_send_record_cmd()'s unlocked
window) and how they are fixed.

Thanks,
Ian

> Thanks,
> Namhyung
