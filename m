Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355D519DEB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120562; cv=none; b=UAuRNmg8R4+9LpX8HuRuPKrBZJras0FTR+sUOemQwKd2FKMTWxUpSGu0R7mwZtqFVWWyiX5hn4dlFf/Mz3EftaLBYJTuYUevhFAEAFPjIiplxhN8Gb8AvIuWAbVjBGGfWx26FziN8Q/RNvIdrIw9vT0o809wZxKd9wg8xfSGkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120562; c=relaxed/simple;
	bh=Tm5Q1x/A1C9qLPGuuJEixa/lYRMV/+fSTph2SixjdSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGjmhZaas8/XY4rshwpdjH4CL1nB39oBuYpSwq6XBp3gYiYq3qjzQBCaIsLksnqiS83qpYS3DsfVf80R0XEN0xVZKnjssL6+ehcZq4No83zFMk1K/NHIQ/g2FClrgjz2xnVc1sincEEFAFlZQsX+ZZnsQ8o2rjBIHAxJoz20yBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nUJazm6F; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nUJazm6F"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so44549666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790120554; x=1790725354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6QEQxoavMoQIndMMFiVqJDQ1ivheIExybb74B+VtDiU=;
        b=nUJazm6F17ssn9doIlAiR6ItVQHdioeVXvDt1azF2ucNq/m7i4Xpt0enBIQOoxpeSi
         q+VP5d5VavHoiL3PIVWLE6URltbvi6HjQdvR+Yv8zNKhj1PvcxKUKRYjiNigYbggQDv8
         6pGvhgwKJUA0S98hEo7RoqB8N+TeN/z63a6Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790120554; x=1790725354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QEQxoavMoQIndMMFiVqJDQ1ivheIExybb74B+VtDiU=;
        b=qE5jN8wo5M2gqHEaiOWY/rqwpg99/FXdj4beHSlXr8VtNVxEofR2S8jagh+Y3GpBY5
         WFVPV8+XmRDinRL0PWyLELDbJ/6iEWdUu0XMG87faf44+eGiMzYt84bwX6A8Oe1kTXGp
         P3l7m/AeodQTypSdQeXpn09rzaWWrFgyeN++hNzHUiZ+whLal4PbWRPt9JtcnDkhJ8lN
         TnwgSR8siyvNO4I1MQDPfuR0NSDMxkTNIE9V/Ep6mJb882+wulXeuwu/y0gxeEO1Xetn
         0QFXMwAm9Phs3SqawUchmRXJ7kiXDhCTEy/SdycTwIhwLU0VUhwttRPGzRKy3CEU2+8z
         bgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp6cXuLmNIvVnXKrnCBzBoAqSX7huv1ose+Dl79gDRp6/D/BYvBKKgBq/pnHlYH7hZURqUyr6gzKXOBIk=@vger.kernel.org
X-Gm-Message-State: AFuF++ldvRa8Ib+krCCYQLVLkeXSz+TCMyY0ItmvyjlF3ISVcDh9T8Uv
	G9VDUO8ivmSC1zLqW8iUTYGrdNEY1v5/7z3clgobr8tJCBug/RRgbf+rKOze3ckB5BrBa6Dt+D+
	JbAlR1A==
X-Gm-Gg: AYBFou3II1VMFoRFnCtge+L9FsK/z3SBlnY5Q879brXiXM633AVVAjltXNVxIJGc0Tn
	3FTqzcGurHKj/kfzfQ0NrvJtagPXvHppynZwtFmcJG5doRRRJTFyPhkFLnbAn7ioIy3q8K16KUY
	FWgUDyMP3ZL56ATJM3vJZGM4d6uV0HcOaSQliGj1J+WTFvIGmSpfjXmIL2+FYCFfplW8nZ1lHxw
	qNap0wA1NE7yHki7Zrn0xaGQhY0QVRjH1ICqIWmmJRpYiDpF3WU8JiuRkL+8nL/9C8s0MXtwhPf
	ATO81m2VDV8DhLTrzBmvIW9A2SCy39/RpeT0afyU9ZJKNX2yNciqc46RcMQqMCG3/nTQLVFIWTc
	HsJTeDcOchNyDoXwcDHY1xyXub1JdhGFNTbtgvfn2k6DXYZmagpNG7CPLear9kDnJyuftJfWxa9
	GL1IaWOfIT/vTW1lbh2u1mXbH+p0/nde0+L0HhgkWw3HNsO4eMp3QIOQItkdv0/0DBTgPAIE147
	UxR3hyDQVtcfy+WmBN86CNuvJLspzLXeSN46U4=
X-Received: by 2002:a17:907:9409:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c2aae19b8c9mr52807966b.21.1790120554125;
        Tue, 22 Sep 2026 16:42:34 -0700 (PDT)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com. [74.125.225.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e7bcsm474857a12.10.2026.09.22.16.42.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:42:32 -0700 (PDT)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so359844f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmOk/ZJTIrlQBgjDPxXzwFXQZwXnT3nKftKQL98m7Gyl9uxtlYaIYe2BShvYeWAqJKwwkjwe8RGbj6vys=@vger.kernel.org
X-Received: by 2002:a5d:6f06:0:b0:487:ff2:12f4 with SMTP id
 ffacd0b85a97d-48867095bc9mr1161089f8f.40.1790120551055; Tue, 22 Sep 2026
 16:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922154907.90535-1-fangxy@xiaopeng.com>
In-Reply-To: <20260922154907.90535-1-fangxy@xiaopeng.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Sep 2026 16:42:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDqPUAWw+h-t4Jkno0Sy0_2T8xfXZgfjsVMM1fTG3JkA@mail.gmail.com>
X-Gm-Features: AclHuK-NWZIE87V6rWLLln_WhNGGFfao7sLjyvoRWdgPG1M9Jc2x8BXnX1LZRPc
Message-ID: <CAD=FV=UDqPUAWw+h-t4Jkno0Sy0_2T8xfXZgfjsVMM1fTG3JkA@mail.gmail.com>
Subject: Re: [PATCH v2] kgdb: Fix buffer overflow in the 'M' and 'X' packet handlers
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: jason.wessel@windriver.com, danielt@kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 22, 2026 at 8:49=E2=80=AFAM Fang Xieyan <fangxy@xiaopeng.com> w=
rote:
>
> write_mem_msg() passes the length claimed by an 'M' or 'X' packet directl=
y
> to kgdb_hex2mem() or kgdb_ebin2mem(). A malformed packet can claim more
> data than was actually received, causing the decoders to read past
> remcom_in_buffer.
>
> Record the received payload length in get_packet() and use it to bound
> the decoders. 'M' carries two hex characters per byte, while 'X' carries
> one byte per output byte except that a 0x7d escape consumes an additional
> input byte. Pass the packet end to kgdb_ebin2mem() so both reads are
> checked against the received data.
>
> Keep zero-length 'X' packets valid, as GDB uses them to probe binary
> download support.

My analysis shows that the above isn't true and that zero-length 'X'
packets are no longer valid with your patch. I haven't tested this
myself, though. Yell if I got it wrong.


> @@ -43,6 +43,8 @@
>  /* Our I/O buffers. */
>  static char                    remcom_in_buffer[BUFMAX];
>  static char                    remcom_out_buffer[BUFMAX];
> +/* Payload bytes get_packet() stored in remcom_in_buffer, excluding the =
NUL. */
> +static int                     remcom_in_len;

I don't love making this a global. Can we just pass it down? ...and
maybe for functions where you pass the length you also pass
"remcom_in_buffer" as a parameter and stop accessing the global?

-Doug
