Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934732;
	b=WRtF82OUjHVW6Sw0GBPsT612qWCQnrKFn2fnTAo7szyi6HF1vvGSXq17BPvFH9ZhZuc8
	 pyNdm+1LF23Zw8iVJMmr5cirH0bAgULYfFw9SNepVC3VVqvP1w/DNwClRMPpKuphXiX6D
	 ViPAgxeNIXHYK5GbDrgLfDA9cJ1cHMfQX8HCTMdSCB5q29WQRaIjn9XSX2C+kL0dP8qEW
	 sZtOA/Y9YpRYRZJLJOO3Cms4oDt0JtfPLjR3g+BSjwfJaq8pz6KJRFHvn4q3OWsi2boAc
	 ktVWqXYvJ/lMu+E8fWBu8bpZBbwKwf6HkPQt/nkuqcprrm4numby1zKO33ZaOxx87zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
	b=UpMaEExVUnskfLazJ/SfBltCyPpaCtXppNeMtt5m0SqfdLJiR384jVIWCTWg5dK1IuY+
	 zranegEoPHbH2ia8VPgTxP1TCumJh6x3ryVHyHxJ5HNj51Gc36ddF3KwXVzVrEMqQisBK
	 Jhz8nlPxZPimsWAdH6THCACWd2ehqTlBA3HvuFM116ZJ3usyASiBKrN+vFDrv1q585MkM
	 tR87zoYBrmZYl0vwtyB+KvNZuzayj3k2yEVMK7jxlIBqIyBqztjwaIzZMyObtYbH/iQJC
	 RZKYEItS+LR8w3L1BO6kWpfYWT86De9L32uNly7PGj91uqZTcZylTv+k6OqAFgRbxZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE5606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCE5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b834592afso27349766d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934731; cv=none;
        d=google.com; s=arc-20260327;
        b=FpIMSVeG20OP32p5mwqHhD3X/cDcS0dh34gvy443nKuPPyMYNO9/nIB+nam3mDtZV0
         Nzisra0u9o9Z07/2WfC5yDzgl/HhRht1YXp3jtWwKyUVRv87rSMFje/hMyC1rM+iYQwD
         r8/yH5iYUXk4ufsEVThp8/FvjXMghZSFhEirE7HdswMEupqFWYE5HJrYtb+adA9nikRR
         9XAMdG+yePwxusssc5MZ74cl23dZhix3pdryYlxtbjoame/gkJtmpYoM9EhWHeFL5Dbz
         VYCPIo7LD3LJUHNHTYdJ27TQbPWt48jPEuLhsDpZyhGLHr1AoNfUxJqaHUmxAImEjvLM
         zkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        fh=11vAuRWWxrhKNN8WpN27ihtAcKeXA4d7mxFdyGhbWuM=;
        b=bHrvb3mWXdX43t1NWTgG1u8DEmHR6qB1RDyyo6ilY2eHctp2VuS0ilXxAJnzzCwYOH
         J4DIaW4iYkubYeUcnZmqxFErKyXDn1113swSeEsVCjUTL81Z9zPPCZRTz/XMixvzmxRs
         Keumz0TrKC3mppK+R5EIYpAev1W+AHuM/+l3zoYiS17m8OsyfUkMCjOECjPjKh0vr/Wi
         wy43ymS1D2cFffS3X90mTirJu4z8YmCPwjKWBWSBgrCAHPrB4DyMFV1X07ZQYE6ouEDT
         B3VvvxF6531n2Nx4Kk7AgVa3qZ07WOsZ9D/Y3DxSdz5ZxW0pxmCJUTEPhxcc/hKWk9m7
         NHYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934731; x=1793539531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=EHrJZaLt7VtHx1yPQ10O8lA7efwKTyBBrss4U2TzyzskcZWD/Cl1vDMWLSemzmGcSy
         05pxNF//4W5lw3GnguMsycI1rXKU+yVLV2WQ0ZOWd48jO4wHr65waWsdjrqxm58RM4NU
         W9RmPpCzZS4d79Y0NBPb/wChJHF3kDBY1B3/Logmoe4mkOlsV5NES9XQ6WuZwFIVGUwy
         BCbTn/cPLibvdW3WevChQIYSS+f4WJN7IUoEX+/ZdPO/S+WbIwfoec+Pyz1hOM58DajV
         lKkztwJvGAo7pd5IXqaLpkxdK+KIuQuZfR7UDO6kZD2ZlpyuGWUAsCw6/siT57GKeir+
         Rsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934731; x=1793539531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=OGwD0eiacm8LpFWHMilIJvVO9JhyvfKmERlYFndR0fkyFEmcyc1x4awQtKZ7lanNKA
         M63fixDQw8m1646DcnxXdSTbM2oe94XK7/ZCF29PD8Xg+IuT/M7fI+gbm+ghWl2+CpV+
         NMi0OXEAzYE8cVy/lgKfINQbzZCxf0NdhYnWpq2aKbrWrLUbiDjrsHGqhMQTdWE6Dmt2
         bTg9GXS1vQE+dYoZmXNsCsBd83NqsNX6mtvTeXPTUqXITXQckUPlYIk3aTQrPhKRg5TJ
         r6ChQjXgwhnFQCrL8l+NYpfCBNzenZyaa+/q9RUl8dqMm/oZdo6tA93wAtshvXtEmG7j
         OCVw==
X-Forwarded-Encrypted: i=1; AKwUvByQj2K2uVoZWgCbdE8PVJnZpr6E5Tr3KTZXD7ZGufZcjElgI+wR7XjN4dkhnEBfJb+l4BZkB2W0DEdoFSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5SoRlmgykZDzOm/7JCz0e/KRawAfd83DZGIE/2AGCGeg+rqtV
	rXU/MKB9KS69CKxgZ1oyCGiUEkRdf6zVclCwaOwBR7zhDwV7AHAzWhCX/xg72mK1dketDqqTjyW
	DE2ztGtzuDNe+9A3LG4JO8zlxWhWM9mc=
X-Gm-Gg: AYBFou07Jq9u5KVzl3QpL+4VwcumlZBdUA5OYZSif7Br5jh2yAFyBIlIbl4yay9lZOH
	tAQdYvwVt6s4mczHDn9CzfLlkRBxP/3Xww9wDHCss+JgRqrZUUMEMMDpDOH15kcK5qbE5p1vVxl
	5svuHg7HpOGTTu0wTCmX1F18bKJkvnG8AfCOWJ/L1xKAWjxgFl/tab4cCT5m7hZWeboD+o6TkGu
	hxnQWO0COTuOuttjnxh0sRnzbRsp7BVC/BMQPntHDV1pURXXereJCKnQLDcJ1dj50Dk208o/S9Y
	41nzouuDTlcHHyVUsl3hNLK4VklWLezcErpOQkrLK/yxdiKA1Vii1TZJ14k2WbuFykQYYkM0yuI
	89BPbbpvo3Q4IZNSebt/Zof8n8anaHL4qz/bmV+rWj2Ds5eMWUZBNX7ZoL2U15uQyYlpMRTKK+z
	QQoBEQoiMyjNMGl9Jnop0aoL8doTosjspWrxl4GKC4G0CRfd1pqmnoLBZywvSLPxK6a/UMRM30
X-Received: by 2002:a05:6214:76e:b0:914:4376:4ef8 with SMTP id
 6a1803df08f44-91c48d17173mr71961046d6.6.1792934730661; Sun, 25 Oct 2026
 06:25:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
In-Reply-To: <179250646543.2190262.8632957027583518623@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:25:19 -0300
X-Gm-Features: AclHuK9kZbLYrL_1P7Nb5PvMxv1l7G9aeHa0aDH5ksgUMzl9ooOaFs_24PQ2VeA
Message-ID: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
To: eugenio.zuccarelli@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026, Eugenio Zuccarelli wrote:
> +- ``--summary``: If set, prints only the summary line for parsed test
> + results, rather than the result of every individual test. Does nothing
> + if ``--raw_output`` is set.
> +
> +- ``--failed``: If set, prints only the tests that failed or crashed, along
> + with the summary line, once all tests have run. Does nothing if
> + ``--raw_output`` is set.

Hi Eugenio,

Thanks for documenting these. I compared both entries with kunit.py and
kunit_parser.py and the descriptions match the code: --summary silences
the per-test output and only prints the summary line, --failed prints
only the failed or crashed tests plus the summary once everything has
been parsed, and both are ignored with --raw_output.

I noticed two things while testing the patch, in case they are useful
to the KUnit maintainers:

1) With the patch applied, "make SPHINXDIRS=dev-tools htmldocs"
reports two new warnings, and that file had none before:

run_wrapper.rst:331: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]
run_wrapper.rst:335: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]

The continuation lines of the new items are indented by one space.
Docutils wants them aligned with the text after "- ", that is two
spaces, like the --json and --junit items just above. I checked
that with two spaces both warnings go away, so this may be a simple
fix for whoever applies the patch.

2) "Assisted-by: LLM" is not a tag that Documentation/process/ describes
in docs-next, and
"https://www.google.com/url?q=http://checkpatch.pl&source=gmail&ust=1793021034312000&sa=E
--strict" reports it ("Unrecognized
email address: 'LLM'"). Documentation/process/generated-content.rst
asks for the use of a tool to be described in the changelog instead,
so maybe the trailer could be dropped, or turned into a sentence in
the commit message.

These are only suggestions; how to proceed is of course up to you and
the maintainers.

Thanks,
Daniel
