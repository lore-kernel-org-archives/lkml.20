Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8B3DA7D0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915962; cv=pass; b=HFYPsgAmCZL6U61OJ5XaLTepZdBPmvlzKJoKmJGA5XSqzvj6apE0hhc3jeHrweo6Os10RUet5WtGjLNk02PwxSrA1CL9xQB3cuJTQufuRczRGkLj/cz4UDEZk/j78oQqi7vVvspkS5baBPd/o6qTX625jabvzGVlxa+egU/e+w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915962; c=relaxed/simple;
	bh=QYvSa0bITS46trNZt8jRRzM5UlKEPCTWXzhCtYA37gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxcQ3XXSayk7eHxZrT0Hkn5H2wBFc4hDm1gLMZPc2LDhvzyu5Dl83Bf4htzBfG1w7RzoKP+gn1jMqMdHqAUK0cDucD1QdwAQBCe52tk2tHKe8T4/8TgbsLfzFISpF8zeEK8XooC4jgW6YJR1+sqz4dRQvyO1vdBcZq+sWLUnZgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=iHtCSZqu; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="iHtCSZqu"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so772619a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787915960; cv=none;
        d=google.com; s=arc-20260327;
        b=Pijz0R24ZZR7gmiXr07N8bc7LUe/ancJ/J2WPKr9vcx3Iit1MrhVqBrwJ1TkfMvGrg
         l3r9OipEyDNKaVmwPN2C01+505ncAXqCv+O5tGkgz72fES/CgRAhPLY2hoJ2Mw9s6XCn
         p8iXBStc0PAbDTn+2neGX4qZAYRM4XcRMooc1242lYztLm3df/7tGZsHSq2/pM5Xt+v1
         1Hnvx0+cRUweHhOdRlyyrcJqB051Im5a/bhSkwlfrhyo3bLBAg1AksRhnec+8Mw4DKbv
         ABrbiAG0FKC2k8hwW0F9IXC2jEjsGcQMRcWBHuoPR/kAiqNCMyauXH8biqOXDQhMhuew
         OvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XHV/c33+UZ0gfJQBaixU2xMfyx2z6ZYTrHSRI/+UPHM=;
        fh=TJBcWgLLfuGMLTGuZ7BvAX4NonwoWwgRlHZ6xbbNpJQ=;
        b=iOea9nbzcv6shH+uv7Wqcg+CPH8BEYVsS6w5p/WyFcQaqrvvS5xxKWBHkz1/XLH1Bo
         zBUb1Q40tqUb+BYDmJKvfGOxur/4fjkj+gyCtwXTB36f5aaVWZjoj9/YKaouCl7lZyJJ
         2qFJi0R8PTD+Ip9FF6DG/jEdWEUkC/SEHztsXomziHh6yrnIaA8kDFy3g8BK2LaiQrZf
         3wfMEuH5aG7NqNwCYLf8UQUaCkr/1cV7B+MAWt2yU+/5+wly5nOyaqAQJ2cN6fwv+HTX
         Ihv6oaG3XbLPvSz3ddcMmSWbODhG+Ggpok/Vml67JX41q8yRK01vLpM5sAXuLhPZkmb8
         V47Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787915960; x=1788520760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHV/c33+UZ0gfJQBaixU2xMfyx2z6ZYTrHSRI/+UPHM=;
        b=iHtCSZqul6qJ4lb1BWwAQQLUbvDidXlS3PaNogbQTV/GBOFSPFqdu6dhfEHPviN3oh
         KonET4OLNSqV24sOl3Lq2BCW+CbfvJB+5F7r0Mh29wPHpFO9aKhBCYCNx849DwleSqU9
         Nyitm4x4HzczanZQxBb2+94/RtTTjkm5YbV/lGN6vVLTBt101W8DuIKbLX1DFEwMjP4i
         /2qQZWmp9UeAytbkmqIuOJtvPzuz2M9D77Jinh3VFS3ezqhM5ntPYQW8bPahufInqCuC
         Jc3w+mLQeIxgAp0deA8uQiTVE7RiXQ1dgD4iBi7MrRM6B1jspfeuDW1R0kex4hqp3109
         s/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915960; x=1788520760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHV/c33+UZ0gfJQBaixU2xMfyx2z6ZYTrHSRI/+UPHM=;
        b=agUfSXFC5kFLh7uaPt5ZQZOlZ87RjolG2iVMhQx0MtKxIILxrCF07pslWsECKTA3lb
         64OxvTz8UfJQJ7zwjornKJ2Q87CWqRLDL87z2dJvGsnxOrtXamlsY6/Qw9ExiwDLRjD0
         fE6kz7D3ncVyWpcqQIr0dUAlY5xOwMSOIDEm2PojaiTOSmvmkY78BGxjcdEQ8cH3+6b5
         M7ntiHgZqE4nCZUmvEIDr4z3palFj/ibjWFaRu3VTS609mPTh5okYKa3iEUc67UABBOq
         R6JYMfrz8eDNXUZGXQNlRWvsWhqSZNVlqIKk7kk9NnnGvb87mPStupMcPwzbliYHMbY1
         koAA==
X-Forwarded-Encrypted: i=1; AHgh+RpeSkPFTdxDDG5I8JsGIUBwPgJSg/OopqD3o9Xz31++2QWqDsIqem3GsMhpu+kXzYg53sZXRahqU2uQIis=@vger.kernel.org
X-Gm-Message-State: AFuF++n+m54UUMsb24DTHuCZ8yfyKWvmBMLNvukTIR3X1JAcnn90f5i5
	jHdzJWihXmccXKMWVDQgxHnVS8586tQXtJGXFSu993FP/+rDoLiH3G2hciE9YGkALQ1ehl00FYw
	TFIwCqEC52WZqGXi4+yPRWv0boTOdGFe58P447b0FpGBSSTmkIw12Ze/S
X-Gm-Gg: AR+sD11qaEQqvyfQwyaxRXMdz3715yjTMhRf9Is68ATlIo/FJxOa7na1HCWqH+LWmmx
	6urnQ1Fm6zTvJW4MYyf87xqYkLesHyQeSv/QEWrWNYdyLAhG6gC0uKKz/jZ5833UB9I8rbMOLEW
	2XOqQbLpnKc5uk4iRm4UFXSSfJhaV+Ll+uVA20qc0qaMbR57E4eYGNxq3fowRlBU5CM5FUeSpAn
	Tiw3bQHqqcUbVn9RSJ+JkVzP70B+YG3LiaM9NSu7//4dFmId9AGW/Qn5ZT1eVCvZ0QPx+XS955J
	gkjXnIWQXPYc7lN6EkUJF9Qya3HkMW6Oae7hlerddNllMvH8RnGZ3EBCn8QFUqOgkmgx8U//10T
	2hZY5jiNWPlOYsgW7vctw8yEfd68y
X-Received: by 2002:a17:90b:3f50:b0:381:a766:efc9 with SMTP id
 98e67ed59e1d1-396d0df72e2mr12544716a91.7.1787915925380; Fri, 28 Aug 2026
 04:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
 <2026082817-trough-wasting-29bd@gregkh>
In-Reply-To: <2026082817-trough-wasting-29bd@gregkh>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 28 Aug 2026 04:18:32 -0700
X-Gm-Features: AcwNN1W2M9DEag7qNF2zcfc89TEMPyYwDUox742H1H1jepKnzMWTt2CUyAQ4W0Q
Message-ID: <CA+0ovChRcs0scwASAKRdeZuTJS6KyA4g3JpoTA_iCEPXZK3c8w@mail.gmail.com>
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, falemi@asu.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg,

We are not sending more emails after receiving your earlier set of
messages. These are all some classifier backlogs.

On Fri, Aug 28, 2026 at 4:01=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 27, 2026 at 10:34:56PM -0700, Farhad Alemi wrote:
> > Hello,
> >
> > As part of the kernel research at ASU's SEFCOM
> > lab, we hit the crash below. Crash reports can be found here:
> >
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/150-usb-=
chipidea-foreign-platform_data-oob/
> >
> >   BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
> >   Read of size 4 at addr ffff88810e9061c8 by task repro/9505
> >   Call Trace:
> >    ci_hdrc_add_device+0xb76/0xd10
> >    ci_hdrc_usb2_probe+0x22d/0x370
> >    platform_probe+0xf9/0x190
> >    really_probe+0x267/0xaf0
> >    __driver_probe_device+0x1e2/0x350
> >    device_driver_attach+0xe0/0x1d0
> >    bind_store+0x1d0/0x220
> >    kernfs_fop_write_iter+0x3af/0x540
> >    vfs_write+0x61d/0xb90
> >    ksys_write+0x150/0x270
> >
> > Our reproducer.c is available upon request.
>
> Why are these still being sent?
>
> confused,
>
> greg k-h
