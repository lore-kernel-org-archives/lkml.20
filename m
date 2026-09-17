Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D70432ED21
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605402; cv=pass; b=HEKOfDzGG9hffPLkZF3rQOIB9QW6BLtcGZNESQpTNkRpnw9DBN1I2s5zqcLt31iD0UrZ5lJAoSGoDZtWfet15EXl3EFnxntgz3yKO42dNN1mPMiX0HlDAVasKmH6dix0QyQ6/fe+dIRF2LuwF8i6LD9gMz7Z//ZA+EdI62GpeoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605402; c=relaxed/simple;
	bh=ePVneiu8f7HOysaEQkzPf7UPOZIwpLI2NG8wQeL1rIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Su7SygXvhktVnS6qeshUcdHo4bxaWNPiJIj8W5XyS99MlhkTwu0Tyn1wax9sa7b1Pl3SzYGYMi/EWK6f6UXkYLuqWgCHep5a+RoDAmBHmXB2DQg+Dud6VZns3WmTk6TEcnige86JHw+Ne9x55aSNPbu7EB2AdczIHS6UhG6/1uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsogayB/; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsogayB/"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25187so160096b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789605396; cv=none;
        d=google.com; s=arc-20260327;
        b=Eu0QOH811zYjXM8tRmCbHiIxh0eJuXwR9myDlHDuCUJB8wJZ6FU3Ll3BNNC8N6q4gl
         Y3crGhfDYjl6x9DZer4VlYEAC6LtkAHLVyeQJNBJZ7nPwhblxLfIDpiyF9uiXtZTfEya
         0OoGy0fgdJQ7HnR2xUcDq5S4Qh+jl2BYJKcid0s9/ovzhEhR8Me8MLbdY4EX5eCwCI40
         S79bYF6N+4+z/VZHnSD/GKwu5ztWHLd6UBsWaKB4cXGB5M1QiyR+FNNnI76UPOb2Dogd
         u4/YDVzlTxloz64+7O0N/5/AtNSyOB9BMGLk1dbpigDuWhQDqBD84/Dy7D7czHwg2bKe
         933w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z3t40gbdtLCD1G2xLbWdqCI7O6nv21XGGKYIiPoR+Ps=;
        fh=cZPwjWIhlJi2XSoz8yPkXQwYeXuQ9638SgOW5Ae4qHg=;
        b=hPKgw8O1tAZ8sHD56Nq031mKZEugjWHhNCChugiNSsj+ol7zcb5w8wjydm58jTaCEq
         5r3NdgLV4a/7jCS+Uv/r+/lmU7UPgZcc+vyTVwoS3ONRfJIvHcyWqXf11BsTXLlSe6oO
         eT4kJHc9kH6QzbKPrsjJPVhg/lRa0XFB+luo01uHKx06/cgsiopYMKeiSBoh0eslwpDT
         rePZ/FKHKkouP61L+8RVfuOnqpzEEFQBOi+4WIJmcwAtoSvOu3f9Wh8SglB7Rl5Xpj1L
         ekiCf9+HSzh/uxKVSkc5JH1/YbHHbrB404DQhPuDtSVV+s3IUZhrOEyLTVG+8urULe2M
         uigw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789605396; x=1790210196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3t40gbdtLCD1G2xLbWdqCI7O6nv21XGGKYIiPoR+Ps=;
        b=TsogayB/+IpRHhnz2DwNm62FAk2EHgYbawS3Z6sx3RD2VGhurlv6sJhlNn+T+9zbx0
         COknBFb2b681fvXkln/uR1k0d36lT9jeKImG72cHiS+fGf2sre496ZD+A95YwID5vWjN
         RFt4NQKI2IPOMUPnjYDaM6zGfbWAB/yD9Bx42V7nM2lyjiW8wHEQTr7yqfkviGfzn9S6
         uQfO8chLF2isgWfqPI9t5sar7KMbSUzPNa4u/3wdGXbFAJADOoGYJBfkqYcVUeTazVTb
         KQLI3TKayjbQa1QSzRxEJkfcB94tk1o4CbnrGk/Tk4C2SZBN/LIHxEJ3CbyY18jZE9Om
         tT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789605396; x=1790210196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3t40gbdtLCD1G2xLbWdqCI7O6nv21XGGKYIiPoR+Ps=;
        b=hAbkMsHHEQ30npfqruDLo/YLzJmX4U5enI+SnQ42KEgwIUp5PKhg+VviuujFFdF7GM
         5cOP1+wJZo0TLfO+QTSGdCXwhtmZvXsAMx/FXu51ndOfavxxu3ldeydYTQnYomzCRP+2
         3HTzV+6nrTpKgUPc1MGS7ThZIplzsNiEY0iArWLjsE6yzMbHx3YDp+inN+K29ACiEIuk
         n3Exyq1o1FJVIaVK113/g21xOAPKbiqYW3iAUtlWsV3HBaiE9pFOGzMMh9tHewDARRZb
         vq0FdNl/QntNft3sx+EIajf3d2KRD7cW0F2laF9LnSXEcoWJc8PoV84QKWROBx4dnpiF
         ExlQ==
X-Forwarded-Encrypted: i=1; AKwUvBypus8aHhBl8tmv7AtqNdFOa/3krndhsU58zr1+CynNnGO9bhi7wbvW+G6DJvqy1Jf3tknNPDpAJ8QItq0=@vger.kernel.org
X-Gm-Message-State: AFuF++kclLWl+c2+0sGisVGvjyVvK1JLykU2F4ZRUqZCeZf0dywtJnao
	LJ834dxSHhx0yOk19Nz2crXz4C4W6zM4nJGk/iloGjkD+1p/73Ms5bMV9UT1b3bE5VUQe0lFrsR
	P7u7/frrLp0swVYMeKT3JFTUKHQp+brc=
X-Gm-Gg: AYBFou3HGYnSb8+GRDCZGEvnV+LG3rctpU4pgQIDddbalZpuoiftgtuGc3Rh898QWY5
	6TzoqZ1mVjUL+DDTMvkfTTZ1u7J2qyAMzwOk6BOiNU3XWKfm9ZlYPcIBo0SnRMBNQySaep2e9vY
	dMKw+P8K05k5jzmE7ZCuRNqP2IDsP0u8lvuOERMXRQSQHtBJzHkhFR2HPSGT59/KIioFroAGBod
	RSo/ujolSaXoKYn+UIYYVilRb7Vt+69nLbD0uQoWN42Sc7jNudsh/1yH1STbo1i47xtJVauCZO5
	/oLaOZbgkOdF/1Nf0FcRVS5gtFBCpz1rQhR6+t76o/KHY25r5Fb7E/RCH3GgOugk/I32bN+IlIe
	foDQqERvXLalePpDVxQI/WM0R9CXc9dUX7MJGoB3arRlLp9gC2Ci4
X-Received: by 2002:a05:6a20:548d:b0:3d2:df:1854 with SMTP id
 adf61e73a8af0-3dd5f403cd9mr11548203637.6.1789605395452; Wed, 16 Sep 2026
 17:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-2-vineet.gupta@linux.dev> <DLDKB6BTHVXE.PFK87O3QY1J5@gmail.com>
 <f575fe19-a5a0-4f43-b1bd-cdec2c6e9830@linux.dev> <DLH1MDZPU5G0.228555JR34D3N@gmail.com>
 <76ca0a2e-dd9a-41c9-90e4-5fd3c9171172@linux.dev>
In-Reply-To: <76ca0a2e-dd9a-41c9-90e4-5fd3c9171172@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 16 Sep 2026 17:36:24 -0700
X-Gm-Features: AcwNN1XO4HwAR37E3WIkB8E7DX_-wst1NccGMR8T31Mz-rEIep-eXEJg6HLexr8
Message-ID: <CAADnVQKKWBV+pFMAStB_-POKveeO83RiXU+VKeua3odSu-Xrmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 01/13] bpf: move linked-scalar flags out of
 bpf_reg_state->id [NFC]
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:24=E2=80=AFPM Vineet Gupta <vineet.gupta@linux.de=
v> wrote:
>
> On 9/16/26 2:02 PM, Alexei Starovoitov wrote:
> > On Tue Sep 15, 2026 at 1:17 AM UTC, Vineet Gupta wrote:
> >> Back when I started, keeping it NFC made more sense. But with all the
> >> nuances discovered in the process, I'm inclined to drop the NFC stance
> > What is NFC ?
>
> non functional change aka refactoring.
> Like I said when I started I wanted to keep the id / flag breakout
> purely non functional. But given that splitting it does change one thing
> (mentioned below) - I'm dropping NFC attribution.
>
> >> and make functional changes - there's at least one which is the
> >> following accepted pre-series and now rejected.
> >>
> >>         old {r2.id=3DA+delta32}         vs cur {r2.id=3DB+delta64}
> > that's a red flag, no? The refactoring patch shouldn't have
> > any changes to selftest and veristat numbers?
> > Unless I'm missing it again.
>
> Yes understood except that it is no longer refactoring.

NFC is gcc probably lingvo? In kernel people just put in the commit
log "No functional changes", so it's easier for humans and for AI
to review patches.
So pls skip such unusual tags in the future,
but keep the first patch as "No functional change".
