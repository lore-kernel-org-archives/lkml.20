Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548048;
	b=oTmfWo5DH4fVgk3WAqZzJ2kV5gBYA8GCuLA3Z6+Z0LVWa+bvxcu5tdNwUuK48k3NgPHu
	 qrShENYYSsldShiLPN368i4P4zeMIZObJSbhOtBPsNs3blaxEknDPj2ONM+L3BLpZ4Y3Q
	 c/rXEQUogRyX+sKVX2yENbO2rTz7rHB8xK4U2wPkQlM7pSxffuXKPmWdbhfkuFdw8uNIG
	 4OTIfNAMFnpkVc/vwA/AbJ7+R9Obpsqpw54aCotn1YbaPNGThZVv1/KpyJQSNhY8nTsLv
	 xrg943+6s9j3atI52E1m9wGuFsaJajYbqnisY6Nymd4xLkqgzeA8DogU3+9xJFB04wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0m+xqvVXfwi6bGLSM3IcTuTXSdD1kmi77WYfUfwTd10=;
	b=qngkUKFC07DR3e8WaJhRsXW850+9kfwcv/jmLoJ5XJWrJYr7RBDM9nqsEdgjl7cHHieA
	 xk4Jo+x8/8HpdRAYogDHc1acTAQQyEh76aMRfgp334NDknNAd9EU8LZDER1K5ISYL4xaR
	 f8qtzTw/oGCuYJ8sUZDlgvpz332vM9OwKDyeVyXiqEG0+hhfK6gnkloKtCBrE9Ra0aWrk
	 aonwDsligeN6wLGIzydxe7/pRRcQJThEsLz96QdLJ/iuiDxCmvPkV5pWeWwb0Fkkl8wFv
	 rZPdI4ZqKHn7e5cacTV2BBGDwfWUyvKSobloQTZHUerex4G5y2tKppvrM9o5UZWq6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eCw5zMQb;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0E606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB0E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eCw5zMQb
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so86788666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794548046; x=1795152846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0m+xqvVXfwi6bGLSM3IcTuTXSdD1kmi77WYfUfwTd10=;
        b=eCw5zMQb16+BQe5yGjxSpnWySSlWPcKFyBzk3y3AWGxu3wSjexVJSfUZVJshLbd5Ac
         jvnOz27+97odW8+cKvNzafRaUBRAxbAqJHQeSbbk3ORA/pwG9+GTjvdJyAROZxRjvMmg
         rooxkSo8GrMvLEBwKm03pvKTbiHmrajKt/2IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548046; x=1795152846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m+xqvVXfwi6bGLSM3IcTuTXSdD1kmi77WYfUfwTd10=;
        b=qWow/E+qeO74W8ueYEmylCVS+ov2qbTkJEqQ64W9KB7iRRluld9gQdCrr1wFDlBaNC
         27YkJcS0aOD81Zi7WdAHD8Vv+qHzWRs4IbmsDJAMD9+kFDvkA4PMvgFqZlCyXSg55Kof
         5xcJXHR0P6gUzyRayB6VpepJOSFmGTFxoUpffy2PZzv45BVkMT8uknQ0AiLtXY63yJVg
         iqJe7ze23mVxNhzJ+I4OoZAMhdKWF39tHP38iD4qTisWhKSPtrmJvTxtXa+OPL1zR9gc
         N2xDqi5VlRDWLGdfuAn2mlKZd38+V3NNg8WFns98XNm+K6NxhOWqq+B9FKZCp9EnuCqG
         hqUw==
X-Forwarded-Encrypted: i=1; AL+hErHPAGlshrScdHv8hnLluKTIM/GAy4nV4F+bO6jSk+kvtEkZi74eIDVODbiezXT4Fq2SQieRpOch9FlRRwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AGyOufCvn56LFwTo0ubALr7TsthBFxSl8gw4z+OFZnbkm94em
	kIkRjU05Ih905kpoppf8Z4O2c8ritXrlCRQv2JzMhg7FOB+fmTe8MnSo84hwh9utrNhQPwgODll
	H+Y/hfJxc
X-Gm-Gg: AYBFou3ycTTobVIOj6L7jIKwgHmrH2IAggbT0ieirj24q4LT/DyH8H3MPOizioDaq7M
	mF+02SzxJtydv+ZzAhhOrUohhvG3lHDoanEX2HYjYNYbacQkRA6/RyaPbVaQlvhQ2lBIagKBvVV
	qZAfJfopuqcs3rJ2sJrlxGtgVUsXsdAi68lRFM3+q6LJlNtm01LY2bAjeZirIBTwAQ52he+qk1W
	xjoz4+ocXESdDh2VX+w3m0IF/cOfnTydpV9zS3Tv4jl9HuBup/4OTQHxtY6VYSz5TySzmq93iVe
	ywwlFMGyfifHWAYalrnIv0sYyzoVPdwFy3hk6T3rVScYq5Mt6bXxlYO/3EvFBK6cSwM99dN8JTX
	PgQtQy8omA6aUgc4o7eqACAkHSCTVBzQdCHVBdlEeEj9Wi9w2J+6vmCaLrFLnNeHoPT4Pr+nacY
	IxylwD52iOsjSiWeBj3rGw7WcX9mIWtwpVvgtPnCh28owmrMBF4ASqwOBeFnqKhiyAiMlR854kW
	Cxm+p9s0qdLcT/I6fT/PKDw0Eh0XChgt3aYiV1ka4NJaLGuwqjls24OYNJe9zXG8JiKVR9OHTkL
	MWZ9E6BYaWPVaX9H5mYNVfeThNkZsFBn49jcXlOVbY+oVWZaQarYl6rcHUTaUNmk1eUf
X-Received: by 2002:a17:907:843:b0:c42:24ea:3220 with SMTP id a640c23a62f3a-c50963995eamr102483166b.31.1794548046188;
        Thu, 12 Nov 2026 21:34:06 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm51161066b.76.2026.11.12.21.34.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f563d1c6so314638f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG2w9pLlJp9Om1Nic13lXW9YnHmRCPXBHwmwdF1mBjyrarjqbhBVOv6+otWB1MollfUshDGr8VSmXMZzAs=@vger.kernel.org
X-Received: by 2002:a05:6000:46c2:b0:48f:db47:6ebf with SMTP id
 ffacd0b85a97d-49c729bb31fmr2136437f8f.38.1794548043513; Thu, 12 Nov 2026
 21:34:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110081946.38783-1-christian.aurichzm@gmail.com>
In-Reply-To: <20261110081946.38783-1-christian.aurichzm@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:33:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XN+oAR+sgS1+Ri+GkoCK3gLKEvGM4RQ6RorpsKjsLO6g@mail.gmail.com>
X-Gm-Features: AclHuK8y1Mn1015o-m9cW0ZwT98Hu-8_Qa9FF-4FegCdyW6v_68cpgBnLgAX7B4
Message-ID: <CAD=FV=XN+oAR+sgS1+Ri+GkoCK3gLKEvGM4RQ6RorpsKjsLO6g@mail.gmail.com>
Subject: Re: [PATCH v2] kgdb: Fix buffer overflow in the qfThreadInfo packet handler
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, 
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 10, 2026 at 12:20=E2=80=AFAM Christian Aurich Zanettini Martins
<christian.aurichzm@gmail.com> wrote:
>
> gdb_cmd_query() answers qfThreadInfo with a thread ID and a comma for
> every online CPU, 9 bytes each, followed by the first page of tasks.
> Only the tasks are paged, KGDB_MAX_THREAD_QUERY at a time, so the CPU
> entries overrun remcom_out_buffer[BUFMAX] once there are enough CPUs.
> On x86, where BUFMAX is 1024, a typical boot hits this from 109 online
> CPUs (222 on arm64 and riscv), and GDB sends qfThreadInfo as soon as it
> connects:
>
>   BUG: KASAN: global-out-of-bounds in pack_threadid+0x2a8/0x2e0
>   Write of size 1 at addr ffffffff86eecc20 by task swapper/0/1
>   ...
>   The buggy address belongs to the variable:
>    remcom_out_buffer+0x400/0x420
>
> Page the CPU entries together with the tasks, with one helper for both
> loops, so no reply holds more than KGDB_MAX_THREAD_QUERY threads. The
> CPUs still come first, which scripts/gdb relies on to detect KGDB.
>
> Fixes: 25fc99991383 ("kgdb: fix gdb serial thread queries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gma=
il.com>
> ---
>
> Notes:
>     Changes in v2:
>     - Move the shared paging code into append_threadid() (Doug)
>     - Link to v1: https://lore.kernel.org/all/20261103190622.925741-1-chr=
istian.aurichzm@gmail.com/
>
>     Tested in QEMU with KASAN and GDB 15.1. Unpatched, connecting GDB to
>     a 109-CPU guest gives the report above; patched, 109, 128 and 255 CPU=
s
>     return the full thread list with no report.
>
>     Based on v7.4-rc1.
>
>  kernel/debug/gdbstub.c | 45 ++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 21 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
