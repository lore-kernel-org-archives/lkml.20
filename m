Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58853446B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175764; cv=none; b=MOMAIlXVpAD7ak/7+3xVDD/iv3Wjr0GCy3+Y6HnlBG5eAvtvko/eMKjS1sP7jd30a9tdbs5Tqy7vR9jlD1Dz+VzVrq5cBsAij3KbXZs/d3GSRBi6FHrOuv6FfOWi5NNJuUn/p6SVziWPoizLMd3m1bk+gpN2a5/q9RtT9Zjvi2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175764; c=relaxed/simple;
	bh=UHI1RhtYGQef+Hnl8xvao754eLHDmAqBl8wOTDDyFUs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=g9Aax4GXbJe2aReX1oKdOgFzDgDAJFkUKyfoP3qFe2tQ8e+jmDYFx4bkMRFzJVpYUS+qbrbvbTLgDetrlO4eqyyp6qjz7dTcnuiu9ZllwmE87M06TOpbKr8jaTjfRckYeKaxCWFUc6Y+OrvEvN0M+9a9H+F7UHmu482HmReIZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNL1YHMD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNL1YHMD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9995ce866so1174765ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175761; x=1792780561; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nuY2v1ppZTu7OOAjxLm6de5JB+RdUhZ3i5YpRxbk/IU=;
        b=WNL1YHMDqZSSoB6FTDaeffGOoLegOzvuoshVOf7Fih39HoK1VZn7ly8WKXaEfxLyln
         nIWCv38psi1lim/p/0D0OJMcn2Wj67sscL0Vk6B7m9FW7Jtm3yV8f/atNxlcbn33ZQel
         DIrRz1FxCQtgf1OfCG9YRgxfpr/MRkXXzZ2Fml7uL1k+uH7WQP98gmfnP9YkMYP1rwGu
         sIwdfpl0X71N3Cgtx2+KFPzquH5f4eV/WHiY+EF/ive7PjBFK/DHIbM1+W071C7XLaOy
         dZ/p0+FJTJeAPhTgLQx9cuV3aNWG6CJVCZ0a4WV5+1Sz2FHc8S8ljPgAxd+drHPa0MpW
         jtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175761; x=1792780561;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nuY2v1ppZTu7OOAjxLm6de5JB+RdUhZ3i5YpRxbk/IU=;
        b=AkijVGd/cPk4PRxWvFGWxBoljpvfAWRUd3SFqKLVyqgp9buWv4v61TfRdcnxhc7Vc8
         Y2Cf8vpWYZZh7QTOkdI2TY8o6JxhafuLM6kaBedkQzNhVPslCpZu5Bye09A115vYXdrh
         KkQCXLPeh4Ay+LD4C0CvKf2kVpm4sn1AmtkOTCnvl6x0U9bwHouhvWxBAw9ku9bRp7H7
         pQrNlLl1LX7JQ898FNOI68gZXEFmT1ZDO1q+EwNKzeAC2eKT/NuLM70BXmBLLO4jQLx3
         gzRtv9YTvr0z76QphhRHJU0MYaaXVn5Kn96l9t5hMAJMSoYBWi/rObtBH1B+/Aj5z9vL
         GHWA==
X-Forwarded-Encrypted: i=1; AKwUvByCpylNtpbdDNWerQczxZ+g8FHlZI265fbcs5Vn5+sOvwBi3REq5Z7fGpB2bzeBgS99QWBHgBy1hrouQEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjX3uavfTVu21RFZDY/vE251ftNj9KFgjGgiVdWaKjxP5gsEOI
	tke1DOGXakd8bbX4mF8FnztCWFSGXt6b2xwbNE67RugLkCuhLtRLuY6zkKN2cg==
X-Gm-Gg: AYBFou2gLp/CpM6Dgu2nwuZpfG3g/yZ8KWZ9YA5lZdIXkirZaVz74FmGNOvvSPefHhX
	d4nvvtsmy+5I9K1ub3B5x+1SZyvBiAapCDav8GvXoyc5Tq86VaCHCCcQ9sljkZ6aN92VQCI9syr
	cpyZ+Eiip+uJn5qyPTI1yar41eDYy0By9A6mf+1PyqtfxDdiwvAqf36CpJWNP/IrPNyBD6Kc7hG
	RS2WXHHVAuPasUJVZedS5utLy1AY8hG4ss1hovR7ZwaQdN2NGAEWKkFxOlGjiB0dWjwIbw0G9GX
	3gz+HlU1Q+lDmrUmbjv3N0glJgDaWDHL23ZFWtyC0P+RfWLO+VjPM8eYX69KqrfKNCB1aIEF1GL
	RUxvOXO4hd4IJopdzlnWyeyraXn//TFccX98WBKlEahjXanUwEFzVoOtBSuZGSU83MOlxn5K0rU
	xGTl8HoQDyZ5xtToGoCucKigkMpkZFjbJK7owmcTfqn1wpdyDG9qsdRpUCRVAmnzGV69KTFJNdn
	aRCui5EOEMKcsBXxyKUC2xgLzPO2D1TQoXpQUR26Mw7eXLtgfXaUltEKb4wvXYVEbctvKBMPTIz
	EaM=
X-Received: by 2002:a17:902:db07:b0:2e9:628d:e9c1 with SMTP id d9443c01a7336-2e9a69f8df8mr7920485ad.26.1792175761184;
        Fri, 16 Oct 2026 11:36:01 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d51a6sm14945295ad.12.2026.10.16.11.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:36:00 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 18:35:59 +0000
Message-Id: <DM6HAA1FCDCO.1V38UFFVZNV16@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Run the enable_stats program
 with BPF_PROG_TEST_RUN
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261009-selftests-bpf-enable-stats-inflight-v2-1-691ee379e511@gmail.com>
References: <20261009-selftests-bpf-enable-stats-inflight-v2-1-691ee379e511@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 09, 2026 at 10:04 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> them. As a single run can be shorter than the resolution of the clock,
> run it until its run time shows, unless its runs aren't counted at all.

Did v1 fail anywhere?
It passed BPF CI on x86, arm64 and s390.

> +	do {
> +		err = bpf_prog_test_run_opts(prog_fd, &topts);
> +		if (err)
> +			break;
> +
> +		memset(&info, 0, info_len);
> +		err = bpf_prog_get_info_by_fd(prog_fd, &info, &info_len);
> +	} while (!err && info.run_cnt && !info.run_time_ns);

If the kernel counts the runs, but not the time, this loop never ends.
That's the bug this test is for.
check_stats_enabled below can fire only when run_cnt is zero.
The watchdog of test_progs won't help.
It does pthread_kill(SIGSEGV) once. crash_handler() prints
the backtrace and returns. Both bpf() calls don't block,
so there is no EINTR and the loop keeps going.
The test has to fail instead of hang.

Run the prog 1000 times in a for loop and keep get_info as it was in v1.
Then no need for the comment, and check_run_cnt_valid compares
1000 with 1000 instead of 1 with 1.

Also pls don't respin in 12 hours only because a bot said something. Wait for people to reply.

pw-bot: cr
