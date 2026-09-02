Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC8A3839A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372281; cv=pass; b=j8eXGB/LJk8d+zbUSiBI/pjAqPaHhFriiRfU49P8ZVeh4HAilhdULWxflZg3WgdAMY7dfCurPX35r1x1JdRGh+p4vTo6I0ImLPz70oZmxtN6OZfnFhfs704hMQ5U8qpXzuo9JUQt02lig9ds2HXAcHSQRMjQ4hOWypO35WKdXJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372281; c=relaxed/simple;
	bh=AFJSrrQW4gF3ANdPDPC4j1IYpWV3iNda9Tgx0JK95J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpD3EYbeV3Ky6xDtVGzqrL24Ct6zuqtgkKrE8l268LZTyHAQpSPKvaf6so4EsQtnmWOVoQT+D6gbrIs720FOrcLLZ1Y7Wv+LXAltrSmgqh5fqwbHsdaveMPCb8zTFEIYodqufMc9A8K71DIOk56Tsz3Q/rIgz780Q/rdPcu+kcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VH6z/fMG; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VH6z/fMG"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff390a6aso78985ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788372280; cv=none;
        d=google.com; s=arc-20260327;
        b=Go/JA58/Px83rL7Iwn+IxXL/4c2skapLehH8Yapuj7H6zyqyGjIisJYEs9lKxzEV8q
         HF8hLp2seRnDEh3Hpub3lv8Kg1wibCZHoJOOLdSHUdqdpDTuEQVYO0ngFNTRSXgHM4HB
         GmfVTS2dqjYL4grjMFT4HEBRsnFKozegLUxY3ngMPJajIdS4GMO8JO4zapVMu5oDCUb8
         24uH/VFVPViHD0API89HWLQdCiG+UZjnqEg4eTy2mlnVu0sRSqmYmJVbCgoxG1vxictM
         wFU3elapxP8JzrigGOj9nGJmS4w8+R/Smw19bu5ImiVgAINvFLDdrw99tfy1HDfVwalN
         1bcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tW+6wZzNoXEx9aEPCU1H6du91aF9vK1xV2VXmS0iwpM=;
        fh=Ho7sV/ffIW3BoGy9dAW5YvrUarveHR9pWFPovlfMBCU=;
        b=NhG6KrpBRPozKsnpvCfIh6cYrtymmbD0bFoVUn+qBoPO2pSOTj9asP8KFgfhiPE+xR
         ZvncxumVWUeD2R6iY90kYeB+sp7/hK+a3EY/8Gq3I8FcoxRkOtpeeQzMmFUPxj6RoStO
         dvDuJX6yLoD2Vac26Z6lZop2GiOdvdCC+EMvaA0GWKBDanOm6ldzPaqURGjVs+I16iSR
         GSOcKQYFmXIiWj+6QCINmM/ZyWtWZVn0KjaeNQCiG6MYuuBWa3Opmneryo7Qo1mo/aA/
         7IkDrr4BurUeKvdLFYlpMoEJkUgh5n2FpLCgQ7bDdIKVD2AXzMSbECQX8NVndzfGWmS6
         tzdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788372280; x=1788977080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tW+6wZzNoXEx9aEPCU1H6du91aF9vK1xV2VXmS0iwpM=;
        b=VH6z/fMGTargi3RauGgwdR3Rd5VknN7sEy/hmANGxcVauJPu/8cftZ1cnRCvFCtA7h
         qtNQgoLqFbHnxRX2BeKyuIVFv1hefh6yA7G3Fj6kYRsIvk8HVs6xGRRqFqhzx/yF2Tw+
         /GT8SG7+iKFXOunBZ8Y0DY9mE7w/obsRWGrR2pxO0WjUlVHUibH++n5KgEeEFjqvG+pv
         JrFkjrMC12cVLxkxXdaRqzrm2IsvzyHifihGkVEH9M5pmkARNlunK3BybTLEFE2CRTul
         ZTg0vvYauGyd4UX0D5O4dmTmiZTBqBsdjaL0ICq4D4AnJFQzhlGKDEptBmxnspBYYxHS
         Ag+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372280; x=1788977080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW+6wZzNoXEx9aEPCU1H6du91aF9vK1xV2VXmS0iwpM=;
        b=rob2v8friHYn+eD4lBOendcdYTdEZWqf9T3YWRQ3m5uuJ7W+RztvT4ItFstdECp4pv
         5t+JhYxi70aF0kEQOln+uBIlgvGQdSKE/4musLPxapqNNii74a/nBgay1kRpnvR+q5Ep
         xAnj7zVzZxeDZezBmW2BjRtK83lymg8NlFIe/g3oB+1WxBobj39EB5DVC+kqiEZinNxp
         5Q8Tk30iG3POJONW3H3Ik8XqYAkxGNTh6rFnxVCpEWCWo30q/CUKlSj2FU+YDdKds+1g
         hIX2lW4gqAGGNYrNjQ1VzPLQVMxc5X5x3CYWZqbq2Zw6Dfj5FpjQCaFdoouIt9XcAvmn
         trTg==
X-Forwarded-Encrypted: i=1; AKwUvBwmEpvsB9diNRo8QdfWej5pXt5DStrCeMTEEIigluU1l76Df/TapkjciwxVtal/1inm5d4wohmE3sNVENc=@vger.kernel.org
X-Gm-Message-State: AFuF++nXI3CHdhv6rsMaYZBrFlXZA7Wch/IMaxd12c8S5zuKVDg2W5Ym
	DbiD8c2FbpKqqxXbATYC4oaoFmqYPe3tIIqyMNpA35otCw9wsAlpU4z3AaGg1Ocnjy5FaTz0Woc
	lyZD3mrnvtt4nR4qql3Yx70lKkDGa2TvQHVcqta6p
X-Gm-Gg: AYBFou2Mhq7+K9go8RakuUmXSVS3SVPo4991mKnC5OIzAMjH5QtHy86hsNuhxtuTk8r
	K349MdI3RVP9LlFWPuQGq0tvbELxfEsZAG3dxOzl4S7tE0HjbTNqj2C6kDHosKhfzSOxeIN4vIm
	Qw8+Ok3Y2mr4vOOSqDmBPi2XgB69RaN0XmNJsaEFfpBze7kmkhfgY0cHYLOPZ2ZL5cj9VVtwCwd
	jakNB4esxEo6PDlQ6B2m1Tl9NoPytTOZS+1zGRn2VZAs8+zc8FSEGozRi3odnU+K8osAFvp50AT
	fvBAk+P/nTCOHjcwRkkIgTzpo9r/1VSVkW2Iwo/AbNoDfPR9t8UFeBCJtpRuuU6GGP8LkLQgwl0
	/9et/6+UTJXZeV+qlgw1NWo/FFlsFgNU=
X-Received: by 2002:a17:902:d58f:b0:2ce:b436:272a with SMTP id
 d9443c01a7336-2dafc04d92amr701505ad.3.1788372279277; Wed, 02 Sep 2026
 11:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f5e8166a-88be-46c5-8939-1e5227ffe4c2@app.fastmail.com>
In-Reply-To: <f5e8166a-88be-46c5-8939-1e5227ffe4c2@app.fastmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 2 Sep 2026 20:04:02 +0200
X-Gm-Features: AcwNN1UioYI-6aY2FlebIGmb7OnaSV6x_bEiOULXJCzjw3r7BAMamy4lB3uuGTY
Message-ID: <CAG48ez3AYt=dYMYLEEhkrzO740wNsD1_3zZbKqo7MXThqEA+Zg@mail.gmail.com>
Subject: Re: deadlock from exec_update_lock and reading procfs
To: Benjamin Peterson <benjamin@locrian.net>, regressions@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arjan van de Ven <arjan@linux.intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Jake Edge <jake@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 4:50=E2=80=AFPM Benjamin Peterson <benjamin@locrian.=
net> wrote:
> After receiving a kernel with 6650527444da ("proc: protect ptrace_may_acc=
ess() with exec_update_lock (part 1)"), we encountered a new deadlock in a =
FUSE server. The FUSE server reads /proc/PID/stat in the file flush callbac=
k, where PID is the pid of flushing process. This can deadlock in exec_upda=
te_lock acquisition when the flushing process is closing O_CLOEXEC files.

Ugh, sorry about that.

#regzbot ^introduced:  6650527444da

> Specifically, a process running execve is blocked with this stack:
>
> __schedule+0x505/0xc00
> schedule+0x27/0xc0
> request_wait_answer+0x158/0x2a0
> __fuse_simple_request+0xd7/0x290
> fuse_flush+0x1a4/0x1e0
> filp_flush+0x30/0x60
> filp_close+0x13/0x30
> do_close_on_exec+0x114/0x160
> begin_new_exec+0x553/0xb50
> load_elf_binary+0x2da/0x1770
> ? load_misc_binary+0x275/0x390 [binfmt_misc]
> bprm_execve+0x241/0x5f0
> do_execveat_common.isra.0+0x182/0x1c0
> __x64_sys_execve+0x36/0x40
> do_syscall_64+0x87/0x180
>
> while the FUSE server is blocked here:
>
> __schedule+0x505/0xc00
> schedule+0x27/0xc0
> schedule_preempt_disabled+0x15/0x30
> rwsem_down_read_slowpath+0x25c/0x480
> down_read_killable+0x48/0xc0
> do_task_stat+0x7f/0xec0
> proc_single_show+0x51/0xc0
> seq_read_iter+0x11f/0x460
> seq_read+0x12d/0x160
> vfs_read+0xe8/0x360
> ksys_read+0x6d/0xf0
> do_syscall_64+0x87/0x180
>
>
> This problems seems to have been acknowledged as a theoretical possibilit=
y in the original patch review thread [1]. Now that it's a practical proble=
m, is it feasible to move do_close_on_exec outside the scope of exec_update=
_lock?

I will take a look at this soon.

> Best regards, Benjamin
>
> [1] https://lore.kernel.org/all/CAG48ez2pmuoTCZh_AVKDDLeQEYmm=3DgLMgThnqF=
hRMFfZvABpdw@mail.gmail.com/
