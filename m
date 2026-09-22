Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC930C160
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043338; cv=none; b=OycRFsaNlQaicKHw+7jtnmPNcQjknKznJ++QhhKtCTjJYFN+buqTHQjdtJ58qmtfJ7fmJOZu29e7CKUYxOFPYp1SRlwHtUCsZCOfhqTQkViOhYPgrtChkUCDfHRyhjTOoAjd6BB1yZfD2poMtagg64rzcQv7Slebx6BglN10MZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043338; c=relaxed/simple;
	bh=estz9036jhOCyptL6P7XbpDuYAT3nR4TDFVhFqpU4dk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VUExhEWAhMEtwDdCJfl8jNcjarUVLIyYKgKYma+vw1AzXbg+OXlWx5RXy8AtRlbhxSLrnQGo3/IoWjr5tmg2tLmZTj3mOUNZ6YKTvJh7trAdTtQcM0Qp8cnLcztcC3jpNDDaTy0fM0m6F/a+qpY1X1vsfmzsZAWzLG+TfTGLk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyvO99Ot; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyvO99Ot"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49e8361492fso14235375e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790043335; x=1790648135; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hxB3du36QEhM+5rIVLMv9L+rOeqXn1CgyNGA4L6zhYM=;
        b=FyvO99OtbhtCHiMy9FRpe/jYLeppGfAR74qSNENQPYpRi6JvVKLS81wUu4Z2YVicc0
         k2kQFNMhO5IlrNN/AvY61EgJ68DWWYfcZtUa0ejkUnpSriFwypAf6EHCQkiyxV+sJPr7
         XWrNhxX9Xiec5wtCOjPJbH7ZSbZlrps3vtehTliKvY9rl0vq+D15gqotpqzVeDGN857O
         x2g9+98hCemKo9z7FUxYF/URRNGmm0f+KcAnPlfOgJc7O7DfQW9rKEymPDF2hnc0kvma
         zlSP13TerQQ20ggK/FUlEscL5z+NRosivZmOw6TahxwuSCCO1EyTLj2EEWOVVsaElXDd
         xRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790043335; x=1790648135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxB3du36QEhM+5rIVLMv9L+rOeqXn1CgyNGA4L6zhYM=;
        b=M0RvGJ4ZyKb3rV9LpkbzDJmznZWYP3TWbITbObWOu9zNU733gDmbbsfyaTgu3UCefT
         Aj0paHlboSpw9is5lWCevP/4IWK0rQ7WNbZ/FfqkK7HSsyT1BpA5BbE3Ay2DXBLvjVQu
         Q08zrsnEfwEZajTUiCm1MSM0iEeVAS9ncWc4iaKx3SyIS5pKifXnOKrh85ZU10Bf5f3S
         e5Nmcbx+Jep3f8C6RH0Kj+FCckK/bOszb8ysIw96LD3eYwL+M51DDQHIFDNzH0J9VfOM
         QAWbJlSsmWcgJMT7GAOimjcu5RICvVdHBj7pf7+fLcNpscVWpxaP1PV1cbrwvVXuAliI
         KByQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbGbxYj72cGE8f7iqsqhTC9epL1bDTGVQu4IuvcPq7hRtLaKdCXSR/wG2cHnxOaR/Hr8C9KorB70AtBEY=@vger.kernel.org
X-Gm-Message-State: AFuF++mPCqWTaKOkSZFxurImNW6TJm3eu94GogiVW2RD1QlbtQaAGs2Q
	29R4msYSdCsBf/SaY977dkGZKmAe62T/8FiyXTKanVxxGj9HQ7mFpsIG
X-Gm-Gg: AYBFou2V8fKdPdHa1nD5L76YKofs2BYhICQijkDnSzgbPC0xz0FWV3R12sTqbzXqvVA
	w7t2C0K/uQIvAhuOP21g0AAvRoKLUHuXlxroX0HwsqwrJVd6ZjMIrcCazy5gqR7FkG591EVI77M
	tK2a38oCZqspYSs+45UYj+7+J8w1JlKInaAPc92pbMEpVDbbZt6BEnNllPE6o/CJgTX87cQRO8q
	GVWiXCYVU4IotSb2OwlyXCN87rvU21dRDB75WwFMl+syKPEnyFtgGw/VRZdnCrt96bQ/lPfslIJ
	rMMhU9z2Laa0BHb6T6CGX6zZyp0JuxV91lUxgCXLhl4+yWa2VLuWq2tA9aZI1rxoig3i5u17RXM
	s8yN3AUJmXCIeueh8Yi8k/fsb1w6bLucc1+IcSQ18i4JZL6gW/1Zh+5nR1SXqvlQDj7llTnCP7s
	xooRkrSoUa3mUY2FAmmZhPaxEUgu1heECXndz0w3HbsRw7rXORcWawZy38wu86hm3Wp3RUCY6US
	56VDTSzfRV8YUXEI52jO6oK1DglmKwl5YTVOGqcjP2dMmQ2pjhG9ISEVUbX7hLit7WrTRO3Hv/S
	CuuaNjPPPxbHSpi2MqTfHUPmHcIPG9oGPg==
X-Received: by 2002:a05:600c:a14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49fc568f7a7mr165868005e9.10.1790043335375;
        Mon, 21 Sep 2026 19:15:35 -0700 (PDT)
Received: from localhost ([2a04:ee40:2228:a500:f8e2:3a74:69bf:2c6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cc061fsm34968545e9.4.2026.09.21.19.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 19:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 04:15:34 +0200
Message-Id: <DLLHEJEV6BLC.11XRTTF4NRGBI@gmail.com>
Cc: "Amery Hung" <ameryhung@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Nicholas Carlini" <npc@anthropic.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH bpf-next v1 0/6] bpf: Scope callback arguments to their
 frame
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260922010333.1226537-1-ihor.solodrai@linux.dev>
 <DLLGYV7DI406.JRNDNAZ4S29I@gmail.com>
In-Reply-To: <DLLGYV7DI406.JRNDNAZ4S29I@gmail.com>

On Tue Sep 22, 2026 at 3:55 AM CEST, Alexei Starovoitov wrote:
> On Mon, Sep 21, 2026 at 06:03 PM Ihor Solodrai <ihor.solodrai@linux.dev> =
wrote:
>
>> Neither has a local fix: both arguments point into a helper's own
>> frame, with nothing longer-lived to anchor them to.
>
> It's the same problem as a pointer to callee's stack.
> check_stack_write_fixed_off() deals with it like this:
>   if (state !=3D cur && reg->type =3D=3D PTR_TO_STACK) {
>           verbose(env, "cannot spill pointers to stack into stack frame o=
f the caller\n");
>           return -EINVAL;
>   }
> CONST_PTR_TO_DYNPTR wasn't spillable before 7.3, so nothing depends
> on parking it in the caller's frame. Reject it there too ?
> and then no need for REF_TYPE_FRAME complexity?

+1, will be much simpler fix.
