Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490297;
	b=jWSnwIeCkY2LXvaxY3MTJPgsdCxymJM55VhAHam4kaK4bojoSzWs1Rxtv9qIHv/4m4Gr
	 jKNjqYKHkUom+X+gAN6w9r/lH1CSjTsmwvglrHkpzonMz152EJ7DJ9aaJppf27RfMS8nb
	 ujoEJkMINzMnu11IB0NzlAIYH53Ya/V5TejT1UEHHyw/Dz4/5Y8Ng34hMRh6pD3n6a5qK
	 PK5sG995370N7u70VB/IXRW/yi/a4RgNIo6kiB/wXrWq1qcUiwgvADTVXOa95/+sNWE6m
	 d3Cs7jqWlY1ilRh9a+/ONYv3d6ck3LDtm14gHLRBJ4E+KAIXQcCSAwXZX25//BG8FiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=FkczQkrlsHUpyp5C71Vb5YxWTFStgOTkUESg1X8sWls=;
	b=cIyKBA9+xj0YSyw6c5nPktWKUmKSAaRdml6Z/yRgJsHFVixjrKl2KCi4EloP+0SMLoj1
	 MAcngp1SDzplFoFMWH2qm3j5Iw2NUD0AhHyuOztHYbKT32CmpxD+UUMdYJXn0z/Lfe4kg
	 E2xcCMGsQeD622ooGiFz1Nuvukq4PSP+BLANGRp1NPWo/omuwg0N3kJLLClV1N3saO5gK
	 fmEAETm9IsbVgwRFUqQM3bYIZFqtGA82PsBUekaiDa7iubQihcpQh++0We+cubEROttzm
	 1BM7tzTl8OG5R0zk7r8sTzT57hxSyBJ300ZSnI8b9DhoAhMgQiUXadvTl5IUPtlitfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cbVu4UnL;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F96606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F96606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cbVu4UnL
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so2414680f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794490296; x=1795095096; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FkczQkrlsHUpyp5C71Vb5YxWTFStgOTkUESg1X8sWls=;
        b=cbVu4UnL/2wLjP5O/IAZJhNryAwEIeRelW1gkVPXauVZ7kpQs5nvxLtuoZz2LbLAk9
         ho7jhQ+ikfjAIPJ9OyiYUkwWKY8aNTnL5jStJpdABOvIJiNWWTNroUAb4sLLfEpEFia0
         2oNcoQkuTTVNlM+i52s9KcLsLSTGRrM9x9ETUsBCg3Kb1BAzQ9WHMuaT9qzJ/n97K4tI
         NOmoYevxjiBEbMjpnxLL1FrnPrBcOIVZ6sA7LyYuPDQt6dkI16vjVHLn+Y/H0VVQf5S2
         QJIeyVrJWuxFzUbimDWnBj6UItlZm9PWovFEeOfUrcg2ORYUozNBcxorhgiDQ/EwijkD
         iE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490296; x=1795095096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FkczQkrlsHUpyp5C71Vb5YxWTFStgOTkUESg1X8sWls=;
        b=ZjLp+xOPa6jf5cvK1vGcvu1Nmc/t4UJv2HbWT+zC4SSSVp3mtGO/+HpNkQy7fGO1To
         5bKG5AszBecaNcAcn0MdB06YutgAZeVixQ1TwC3SjsTZkAV0ZL3AvW9yZbPyA+d3yKgF
         nqMf8EKcZNuB28S4ohC8rbwbL8cbuRClQJJBYIZGHQK8qlzub9MlU2+kds3ZuQgqPgYn
         S+iw2Fbx/oAnyUJQgZfcLLpwNtOyEitnEus5C0uhlnbKHX8YXcer6LKl4+CnrgaAJbzG
         RmRcMv2d96TJKw757YkxExUvznhnTKNBfdgumF8xqVk8Xhu1Jjjy9zPAwqsVdbJTUa44
         Kq5A==
X-Forwarded-Encrypted: i=1; AL+hErHgt46LebODh0Bznp2EU5EBnjgSoqIQ0qNEUelM32EdooQe7Pe3ar+4nMGGCzdYDdhi/7bOe/RGaTfx2e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nVaPCUnl3K9C6itvph3TMI45uAJI3Ske/9aonaAuD1YDXZUNK
	bvlP3/+5umjivlS5+HWj0dmFnzidxZF2B3Ng99EyPTijFEq/sUS7FBDNS2IWq9/fyM8thGVcRCX
	h5ftnvcU=
X-Gm-Gg: AYBFou2o0T7tth/a0fgECrD0mqq/oFHEFBnw8KWVQ/Eoj3UxFrg017KVy2AJWxDagYH
	uN3MtnFKm2L8Nv1enMlBqxN/Jqym/SlBparhrHjX7QSpmzQYQrYFGpa8lcw4gtoo6l6cSFMtGzh
	5B2vMGrjEq8TDL8ONlqmcdTwnT55Tq1kBA3vCHjhXzVjLXcowSOX0VLnBIB1NnblMvpm+4JHL6/
	mzfnGzTwV/2GvXPsRo/xJn/3NuJkd0crF2tNhQr88zf1+ntCD+lMQB17zHFHOHL3lLAlgX27+1y
	0N8LufwZQahGiJheBx5OfYm/C080IWgAEYaZZpIIw2KGSSZ8MYWZfv5tAcCp0nFKv9P1aF2TqAX
	cfQItgs9nx/EmhDguYMUH7yFLeMQA+tINLPfMXPQRgk0MZ9Ze46QJowBSna42dpJcOwhACFoCO9
	JdLEwipp958/r58K4up+tf0osdlGIAJsDwsFYvqDrxMv0atXFALUZqMiL10kgBu/PaOzDGko95v
	DO6VF/MoegpowatUnKles4PwEL81eI3P/UC35cPprgcM/M6mUduJvf/vvnX2oT6wa/xR3+qj6fG
	/Kyme997SD044Mt3ldh0p8MF6cEQw78=
X-Received: by 2002:a05:6000:2611:b0:490:d197:bde8 with SMTP id ffacd0b85a97d-499c150ed5bmr9292233f8f.0.1794490295828;
        Thu, 12 Nov 2026 05:31:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm15259248f8f.20.2026.11.12.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:31:35 -0800 (PST)
Date: Thu, 12 Nov 2026 14:31:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] klp-build: Fix dependent patches, add selftests
Message-ID: <avW_ta_T6CBdn4Rq@pathway.suse.cz>
References: <20261028214534.1919398-1-song@kernel.org>
 <avMR6tKwddVBrkpk@pathway.suse.cz>
 <CAPhsuW4Dh=QRgChcfbrTZtxCko90+o5cgzFpytBEQcHh9xd61A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4Dh=QRgChcfbrTZtxCko90+o5cgzFpytBEQcHh9xd61A@mail.gmail.com>

On Tue 2026-11-10 19:58:50, Song Liu wrote:
> On Tue, Nov 10, 2026 at 4:45 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> [...]
> > >  create mode 100755 scripts/livepatch/klp-prepare-patch
> > >  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/Makefile
> > >  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/functions.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/run-tests.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-basic.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-cancelling-patches.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-independent-patches.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-line-directives.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-new-and-deleted-files.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-offset-and-fuzz.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-patch-not-applying.sh
> > >  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-unsupported-files.sh
> >
> > I am sorry, I am overloaded and do not have time for a proper review.
> 
> No worries.
> 
> > I just see that it adds a lot of new files. And I wonder how much it
> > shares with the livepatch selftests. Would it make sense to put
> > it into a separate directory, e.g. tools/testing/selftests/klp-build ?
> 
> This set of tests is mostly independent to current livepatch selftests.
> But in the longer term, as we add more end to end tests with klp-build,
> there will be more overlap between klp-build tests, and livepatch tests.

OK, fair enough. It was just an idea based on the git log stats
of this patchset.

Best Regards,
Petr
