Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501662;
	b=N/nPugTj6DlCrbjMEaT0cqcMtEVfnvpXhFsiOQQ1Qxbt1V74XQATQ+DdgXUvMyvUpHu+
	 x2rlyC5oCo8ZGhh/VtCm84D600qqYKzjE5uGsHNdKkm0z1VU3vlyi4YyzKXTfw/+1qPxZ
	 VuYhS79OXDOb6CZBPNk+TEk5QYXjvrdHhmrWDObNVcwmOmXH1/gU6ZPu5wdWv1DDumGOE
	 skcPrDzW+kbEKXN7fgmOIingACCarfq9cslTNKJRoo03Fz+iLpBaIio7isgCUdvkG1KXa
	 B+RsTKj5e7U/WwEXuiqzJ9SNh4UQQgID37v/BZHIcbcIrEOmbNf5tVl/RVEfmQ9gzXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IBC4BwbngFExwxTmiTkfTdZarJDe7r1VPiz0JfI2IbM=;
	b=UdftIRpL93FHCt4J78WnJ6lAzB6dpBEAQdXgJnIDSVcm718v1HTA4wOPEcG+swibu4Q8
	 lgGcWUxG1xWL5Xkh3n04OfGwrSieQPuIoiTBu6eX8+JXkLwROHRyABUyv6+F7hhXY4HK+
	 +Kc4Fs1ReIxWjytvWTZiE1UM4gQ5QBsea2k8zWIW6pyY/9JkKQaohq9IB0/hMfJwbJVjT
	 3uQdd4nYtkixFSTys0oRJ/HR8NLZyde0QljtZ77o9WwoI2f9uYZDz05/jskYSOBp40BBT
	 QHKdMmd86UcAsKgnsfMdysR+ZMVk4/zwJ5TuUnW+ubimY7l5jmnablDVk0yDyTuyPKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vjZvUhJ1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA560A2622
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CEA560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vjZvUhJ1
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492690dd5daso3651255f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501661; cv=none;
        d=google.com; s=arc-20260327;
        b=llHKrYw5ryDZ3N9VzKI/BgFaptEQzsJq8xdvNP4m5SswjA+FWNQBw8D3Z0YjYWZ0OE
         kuqNP1+XUp3dhENh0EMFZOGjQPB2Fh9gxDLWrA6phSC0W4lIGXdNh/Q1ARqKN0REhZI3
         R306xf6Ei8XIdPoVKh/1i3dYO996Hx60k8/ycAEVpp4B++mpmZPXgk/8EF9Bvbs8YFgw
         VvhbeUGeFqUObR/S4P5ERkmmorOVAs+9NdGSdlcPExIGpcNhM3NHSFwhyADcWEjEL7MC
         dEOP0sQzIAYiVOseqQ6oDZRSsRkk01vjU+qtVa1rJj0wsrt5iJoavl9w3MuA369hpqAP
         BKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IBC4BwbngFExwxTmiTkfTdZarJDe7r1VPiz0JfI2IbM=;
        fh=wMTuVmLYXr4ybBUMlpFjJPP38mYnoWzSI6qmFOSpk6M=;
        b=n08allfQcgPwZaO6dDsCqLAwJKKaL8Hm/RGyS9iP2aR1wQO2l0Jp7AgRMjWqc1zK2k
         wRxgBS/sFx5TGa2OBA9XKDCqlxRseSQf9EolrWRTcVXpiNFwE+D1x8VBzPjFTEpgUOVu
         2DL+V/kdgPwSsE4m+2xczW4NnLmj1x1TcIu7QplDS++BIfA9GaBaUMEmrfGIp3o00emm
         dyrBDjwP+u/xQwAX1SznC8sFSJCKnHa72jZguLXcP7S3PSWz/NdPlM0k1YHExy58KZYS
         CzOffcJJSVYaXuDP4U9xqUCjWC60S4yqZ5RxNmhmlFYc8wTXiNBbrqhyuMi1tF4h+DU4
         YBJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501661; x=1795106461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IBC4BwbngFExwxTmiTkfTdZarJDe7r1VPiz0JfI2IbM=;
        b=vjZvUhJ19QRU+AiKc6KMqW190hVpWOlrqhNDnTZcTTSXb1vtsAZPTM1uV2b5maBx2U
         RQ6yt8kOTYsT6PGh0oGC42EDyYtvkwLhliyWJuemfr1t6x26L9ZAWHB1CmzNmL3Su/+E
         lkaTNObDft8B2MWiSaGlQMv8rldaSsccfa7O6zbRpisgLeLI8fm/DfB21zF+Nx3Jb4EC
         iOWaines2gkUBveFbdyoEWPkgxswH10MCvWwKgXMD0cDeQHgUdvQP9B0WuqvjNxvTdGV
         pLNJcnMiJ1x3OY1pPvS5ZUOIHIBCHKi0T6nbKAR8TknmO2hmVCjohr6sM12jhueaWZBP
         l2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501661; x=1795106461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBC4BwbngFExwxTmiTkfTdZarJDe7r1VPiz0JfI2IbM=;
        b=nKaRcRRgEVDuk+1zZS7x1gmQ+Os9uLqO9iQ1Bmh8r8E1K0IP5rk3ZpUdVcrx8m1heU
         ReiPme+IN/hkY+rPxL/u6BagsXrmwGXDE/uXNfUY5wOggKQWiGz/9GNP8EeEQguuUIBK
         R1L8IxoMv7mU9GcxXvZOoQijqjB+BrpKglzugir8Rj+qQpxHILS1ipPwR5an0TKd0xnY
         IxrsUcwXEGmMtOfse2MZK9wDbCfzzTf8QAsqaXt8VWZEFHu3x8oIJ9BmEKpyZHUfoHrS
         g2aJ0hoyp/5sXMQQCrzzRJtL+QXkOFRSTZpACLhkN5zhglkg+3tUieVYLamSXNvyEEaY
         ixxg==
X-Forwarded-Encrypted: i=1; AL+hErGAoLHZIcXFLE53zopJ4q1jUaDkEpDJxnWZwumZLBspkJJcBAUH9IxZSbI9Gg5BeXtZcV9Y6jjLGHWkbbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/2LCj6WXl8UHZtWjgjS5upRDwv0/1XRoG2SZtR0jATcq2oL+j
	xrQmikPBbPZORRoQ8KpNLuHPbpTWWl1FnxKLbbCF9uWi6Z3IotD/HjCNYfL+wz9/TluVMasLWKu
	QGSOevd1ULnvpNJ2QQk5pBqufy8y84PYwPrhI
X-Gm-Gg: AYBFou0EcJc95JAw0OETtAI4aksI5PyeT3/UQH0KnD8o+jgTR27BFDBWAbOwob/zWtu
	O/fViCu1GQ2mRv6B/bjod+qj9og6u8yIaj5jiHrEp4szRaWHOiFCtkfi0U2HTGkPf1mOjm/Zv03
	qKDypZV4HOP65ApWZrRTsoxkee2glBhZxaD959czRD8tZxNJ0TXKk1ihfwENSTsg1O6Q2owqffW
	O4+sQnNyOf1M8IcgLPnlU/A1d7MDEIfWpP+l/tFpGPhTT0o6ursSm57Syvkla17g62lL+5XSngs
	P0iUgfDRjPId5TTThtmdtTzXv+/nS37XiC91J4d3opr25uRhMoXCLNN3z+IjehlHdNOjPR8DM7Y
	DC+jr3nClsT4X5nF4AnKTuwUED7iVMwEwS+jK9F0Q0pGVPaLSVNN1s9+nI5aycTCuS8bPzfMZ99
	Z2fTUPkwYVS326xvYBsRcnQwAIWzJJMNbAJw==
X-Received: by 2002:a05:6000:611:b0:48b:9d2:1a6a with SMTP id
 ffacd0b85a97d-499c5783b39mr11321286f8f.1.1794501660442; Thu, 12 Nov 2026
 08:41:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b7456dbb-16fd-45b4-8742-e9ea3f896317@amd.com> <20261105170340.165507-1-puranjay@kernel.org>
 <CAEf4BzZeVd4boXX4Hy1sKAM=dUPS7dvdmrOPybGrrZV+bU7eAA@mail.gmail.com>
 <CAEf4BzaGnsOhpz=bOxoSEyy-8W0epd5Go6juimoqDge+Rc-+Dw@mail.gmail.com> <3b28aa06-1496-42b1-b1d2-c654c7a1ff0c@amd.com>
In-Reply-To: <3b28aa06-1496-42b1-b1d2-c654c7a1ff0c@amd.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 12 Nov 2026 08:40:49 -0800
X-Gm-Features: AclHuK9lJQZ7h-Tjy7NgKie2ud-WbJ_QiIASQW9r183XyGzAbFbdqxpFP6zjSSU
Message-ID: <CAEf4Bzarzbv+Dyg4poo5BM1pjsBT_ggycP-Wrafk5fAf-F2TUg@mail.gmail.com>
Subject: Re: [PATCH RFC] perf/x86/amd/lbr: Don't freeze the LBR on PMI for
 user-only filters
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Puranjay Mohan <puranjay@kernel.org>, Sandipan Das <sandipan.das@amd.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:09=E2=80=AFAM Ravi Bangoria <ravi.bangoria@amd.co=
m> wrote:
>
> Puranjay, Andrii,
>
> >> heh, so we basically either
> >>
> >> a) opt-in freeze with *new config*, but do it *only for non-kernel LBR=
*
> >>
> >> or
> >>
> >> b) opt-out freeze *only for non-kernel LBR* _unconditionally_, but
> >> without adding any new config
> >>
> >> In both cases we have a behavior that makes sense in practice, but a)
> >> adds some new config, while b) doesn't add anything. End result is the
> >> same, just more configuration and need to change user space code to
> >> opt-out the freeze.
> >>
> >> Is a) worth it, or we should stick to b) and keep it simple, Sandipan?
>
> Have you run a PGO experiment with the patch, and does it show a
> benefit? Also, have you seen any regression in any benchmarks? If
> no-freeze regresses some of them, we may need to give the user an
> option to keep the freeze enabled. No?

One of Meta teams internally reported that disabling freezing
unconditionally through the kernel command line showed a lot of
benefit in terms of data consistency, and I don't believe any sort of
regression was reported.

If anything, that same team is asking to unconditionally disable
freezing fleet-wide, and this work by Puranjay is an attempt to have
some middle ground where we don't have to do this all-or-nothing
disablement through the kernel command line.

>
> Thanks,
> Ravi
