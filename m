Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017392AE7A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431469; cv=none; b=HvR4uMEUAnKASygYcBcyamy98wlaIVfH2R24UXCrof0epmJ5n2lWjvVGIn5JNzk6hoSMSagU+S0/+VceZmBK97wo9JjKsGTG73xXQ7b7FJjpeGQ/AZYvrcsXGAjgm9Zmrpd9ymlo+F3jxFFwLDZfKUm7u4lpxsS26XGULhmHhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431469; c=relaxed/simple;
	bh=7oHzNDjQwBTrxSh0/2XmZfHLhvLvLS12Vo9uoLTUqOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmUyuBY2qgCDuff9Ue6NiNXB2Je7+aQmoCUJt4PHirh7qg233qtw1X41HQ3PauZJUXyMOPQyYqZiV1r30vRKvZIEKmAnPELQjWqg8BcJwfi8PMWQ7yIVF5D3M9eYJL4z2oGcq2VV+rmg1abJ1R1K09HZwUffJ46+HEGlttK0m0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fxPzDXs2; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fxPzDXs2"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso5253372a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789431466; x=1790036266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSVVYlw+xnmQhzMBOcvIbDbXL6WijAmubWvEw4BRZOc=;
        b=fxPzDXs2+bUZcHHFDmh1eiPr6/VLcT6J0T70I69ROD3YsTi2er47/H1OAvNG6jutjL
         gm9klM+vpBJS+0a6aqBv2Dw614ULfXYW5Wxr66wxJ7yRX3ZXIJLQi7nDg4cmKCi1gPea
         jaeJAhg8LB1WJx2NnRsNsyd9Io+6GjusEzbUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431466; x=1790036266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSVVYlw+xnmQhzMBOcvIbDbXL6WijAmubWvEw4BRZOc=;
        b=U3pJmjTio/vrIrP3ww1n5mfIeI9OehlM2Yc0lhvbYaqDwbV/swYkBQKe3HsMXoQtwk
         n0NvXWHH48eeGPhbkYoSn4RnaJkVptrTpDqt+nVtpHsT0mrxKpXxO+xwvI6BMaZMvvY6
         P/yF44LWq3o0yPCiHawsA1CfVJ2ATkwM6tqm55gWIpLf9fz3Aq4eKIDiVuEJXhJDgmzp
         9hzNn2B4utFfrSxCnPemLlUrs6E+m4LH2xJDUWtlKHa4rFOTLBFFeuMi/+OhQiqcNmW3
         d2TGinl0QN+Yyj4bvCIxdKrg2jUI/NwpIWsRUF7q1S3KsKJnZ4J7L5jxOybcL9wGxLwY
         GIPQ==
X-Forwarded-Encrypted: i=1; AKwUvByqtxeBYCIQDDq0ufuen4Ht0ATUC9gqQt7wCM23/7s4jACFJ4ryJLrkL+vcuRZ6DfqHABftiBbY79StJbk=@vger.kernel.org
X-Gm-Message-State: AFuF++ntov8p8ZYz/ifjyWS2qtu0u/MpZEGJXEkvfAlSKZ/zU+Q3DtyT
	8rmoHmR6WhZHkQvtxjep9PoTRw0YSYIkJv2FnD3QtHrQ6iUxJa32XMMkJ87o4+W4UyBzK9zW1NX
	n8/3omQ==
X-Gm-Gg: AYBFou0/sjl+hXJ7m/D8cCmf2j82mzzYyzy9QhxV5BsN3qeeXshNC0pz7ex6kxrRHVt
	FwGb1tSwgnCiODZHgr9zEBoQFUaGCASO7E5kYkFIeWWa46CGotcDuYoN2f/KnsnSynaAMPp1vNU
	f7dzBqJGK2ph4PovtzX7ibabKaWl2Aj3+HYxC0mUlab5P5xoacOzSxxDEV1FLgrrvfYoUDvgzts
	TQc9XRT5mtl26jUEj0qWFhNRFMXpOG7QsGa/Dx3Bod3Fvg5KA2FfLiYmKxWXolmOJireQlf+OSn
	/iRMtaSuaHcIpEBtbHt+m+xWTuVlIBLKqP2f25YqzfsQHvWpe887CK6/0hjxLsrrYFYQfmF3s4A
	EnQYEKCYbumr/pHtUmLRJ5HpdvBigxSvNIYJHygI+qvulK2AS0J4dT67OzZCwh5VCYXUggl9v9F
	MDW11vOPgzuFOldjWKFEJGP1AI+Y634Ff8sqmLmLEiHVm/N/oGs/KFiAmyW26ifRG27lsSbAJgX
	Mqse2q6b5a0O1gA5WjK+AVOZMmObZVu88BHQw==
X-Received: by 2002:a05:6402:52cd:b0:69c:811f:8f5 with SMTP id 4fb4d7f45d1cf-6a9f62278eamr2783329a12.6.1789431466308;
        Mon, 14 Sep 2026 17:17:46 -0700 (PDT)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com. [74.125.225.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9c17a18bdsm4254797a12.18.2026.09.14.17.17.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 17:17:45 -0700 (PDT)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so1270876f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzO0wdG6yPc6/OucxQN6m15lmiOsi4/bxlxvpM/CmVJKWHV/hDahshtyqYuM0fifYSqgZ3RnvVWB5IurF4=@vger.kernel.org
X-Received: by 2002:a5d:6f09:0:b0:485:ac96:7273 with SMTP id
 ffacd0b85a97d-48702aae62bmr6377643f8f.10.1789431464064; Mon, 14 Sep 2026
 17:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914180344.15485-1-fangxy@xiaopeng.com>
In-Reply-To: <20260914180344.15485-1-fangxy@xiaopeng.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2026 17:17:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1-gNZ8yTsC+D8inePWv=A+9H09hWJojQf5NRpcNvK+Q@mail.gmail.com>
X-Gm-Features: AcwNN1UDclOTfyQ0nueNq6l7CP6C6qRUFPzUdlWRrChZOd77wqGX1Xz-KPSTk3o
Message-ID: <CAD=FV=V1-gNZ8yTsC+D8inePWv=A+9H09hWJojQf5NRpcNvK+Q@mail.gmail.com>
Subject: Re: [PATCH] kgdb: Fix buffer overflow in the 'm' packet handler
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: jason.wessel@windriver.com, danielt@kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 14, 2026 at 11:04=E2=80=AFAM Fang Xieyan <fangxy@xiaopeng.com> =
wrote:
>
> gdb_cmd_memread() passes the length of the 'm' packet straight to
> kgdb_mem2hex(), which hex-encodes the reply into
> remcom_out_buffer[BUFMAX] without checking that the reply fits. A
> client on the KGDB I/O console can ask for a read of any size, and
> the hex encoding runs off the end of the buffer. kgdb_mem2hex() takes
> that length as an int count, so 2^31 truncates to a negative value
> and copy_from_kernel_nofault() is handed buf + count as its
> destination.
>
> On x86 BUFMAX is 1024, so a read of 512 bytes overruns by the single
> byte that terminates the hex string:
>
>   BUG: KASAN: global-out-of-bounds in kgdb_mem2hex+0x1dd/0x230
>   Write of size 1 at addr ffffffff87651780 by task sh/1
>   ...
>   The buggy address belongs to the variable:
>    remcom_out_buffer+0x400/0x420
>
> Bounds check the length before the hex encoding:
>
>                 if (length > (BUFMAX - 1) / 2) {
>                         error_packet(remcom_out_buffer, -EINVAL);
>                         return;
>                 }
>
> gdbstub_msg_write() already bounds the count it hex-encodes
> against BUFMAX. Reads over the limit never returned valid data,
> so an error reply loses nothing.
>
> Fixes: dc7d55270521 ("kgdb: core")
> Cc: stable@vger.kernel.org
> Assisted-by: Hawkeye:GLM-5.3-flash
> Assisted-by: Qoder:Qwen3.8-Max
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

Looks like a good fix to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


> The scanner is a taint-style review of the packet handlers in
> kernel/debug/gdbstub.c. write_mem_msg() ('M' and 'X' packets) trusts
> the same length field and looks like the same class of problem; I can
> send that separately if there is interest.

Yeah, my AI also says 'M' and 'X' packets likely have the same bug. It
also claims qRcmd packet may have similar issues. Sending a patch to
fix would be great.

-Doug
