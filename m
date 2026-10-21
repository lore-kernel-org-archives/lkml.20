Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541014;
	b=U4zGBYgzNaxgoZCsJhDb8dBwpnlv1ytcXjnVkJRXghNK0ilwzG7Dbct83OsQi4sIp0Ad
	 qK9UKBWIoR4CWDyfuxuWnLF0cGUVDR7r5RNiHQVTF0PE1/zO0rYOln4lYdcFrZpVRLgqm
	 JeV5fXL+Tv6VMkufFUwWRBJU/xpQnfdyP8DGujIqZdUCLX141lDPlzLIXfi6uYLnQ5Nuo
	 JRUsa4VZe13fiO1Kq06SgdhOps/jbuiAOBvu5Q5DKjQXUcsTAv/ryUbhDBlXdz98C/rXx
	 jHCI1MonlHY0/oMRCiD6KtYO26pV0FO4B3il4IeoLlf/AOoRDc8x3t6mATbZ6pdXFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=o7cBhNpg0ui+vvenTrI+Qs2agwPMwE+Ym/zTHxHB83I=;
	b=TdkMpB/A7XDh/5IdKIWcU6gzje8kK2+iYrpnnrUKt8EgMi4Qs0Aj8ebgCabglvG9Oj/j
	 tGM7rxHepaPF7nUrsXVbQfGX29SkHQoaxjK26eOgVTHftubXL2Uh3NZPxTx3pmKdYU7ZH
	 +lKIyrzeYFxOZmoFQSe4OJgrg2jvTTfNMAARqD+tty3edy9/2Obg71zaifYSFRyS6XWrS
	 ItoYOF784o/g/GXApmPsUmeL5cOWbiNoX3Kewk0KmbQc8TINhmDGNYkjtA8YpPM+qhK8j
	 T0No9hcDWTTtmWlfMfOPBG0xucEGRuRZaGis+dg4ZxJG9gjLQWrhGXb6epg7uI2qBCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ZMEt/2it";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6452C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZMEt/2it
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a058f74a54so50180b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541014; x=1793145814; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7cBhNpg0ui+vvenTrI+Qs2agwPMwE+Ym/zTHxHB83I=;
        b=ZMEt/2it0rDxDHMN5+p0lAcKOC93Y08ECZcMWhaG3jaszhSDde1PHD/V62CPimWNa8
         u6LCqvl9cxTgr89VJ78O4MkdrFayQRO6Rsat7NW1yW548f15+aJOVqBID5rSSGsj8Hwx
         OW0nw708LIH0SJAb2Uq44DqS29Tu5JK8gmuUM9yWDSqFWqepzcy2OQ1LToPZhZrx76uD
         KXHBo1bZ6o1IU7lhmaJSXSSK6s9VPpbzQo69QUYKGzSiGmckzn+fK4jbxUU1SQEPKoQu
         BxJ/QBXELQpORXGFjfUivFIV8UOU98nOUrUIXaVf7pjJ+xuTGkBU9+fHb1ImSnpDEKF9
         XtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541014; x=1793145814;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7cBhNpg0ui+vvenTrI+Qs2agwPMwE+Ym/zTHxHB83I=;
        b=pcHyG03l9+AbH7zytl9M9vWpHOw40Ye00+jHcxGv/SlI2cujNmh4e/yPNECkFV/xnL
         gw2ZlVvWaoKpRZW3nmaYX9BKjUXzLM/+9S0c8lHA5xo7zb6zbCq5g5HUknkoOLGCVP+b
         LNp0TcZYwxF6bPerK8s46B32Iwf+ptu7s4KBVBpTD5Jfm1biXMlh0/khHBYqra06vDYp
         vpnYgWQzCkClPBlbDdev4DZz/Z7itTZRddCGB6X4PN3j5guyIfSEqPzYkRGFv73sMSt6
         QWlB1Ptg5vnIUgb+tdsBNHrv4lybUpL9Bgea09VjTAsPd5g29IgJFKFid5IXxPPmywLr
         qjsw==
X-Forwarded-Encrypted: i=1; AKwUvBzzV+3KHlEqZsUq5o8X7w+Jk3zCDDEqE/bnnYoIU1vA+0w/Zpjdf6HS8/1XIk3KdER65TDtDks+b5aUSUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMOzoogIsAe23cxCcRk4UUJHTGAxTvHQ825pqMM2kl+bBK48oM
	y73tYQOdQNVznuwxdep4TQaoB1whl444IrLbXTr48+Nx/CiH00bv0vaJ
X-Gm-Gg: AYBFou0mcgnzdtbJoNPbvIFAbicU5jh97CtVssnWN75E9pfshSgJtde8dAMcgIy0JXL
	oDngx/Uaj7JwEZVLVpNUFTgygVqE3pir0/rzJc6xG8gub180NoeOI1aLuLH0Y06nM4O+Un69JOx
	0o36A3KrwKbCqHuyObDUUysQKmJPBkPvclOsYHV/JL84/uF5AVV+zOmWFZ2FeCJYj1tv28Ip0La
	ggSVP5V8JlQ2FRmHpW0X4rGQw8WHwLuxMTjN/txhsIoXk6izYsZUJKt9OvvMX85LQzPm6tYA3SK
	Dz/fgO5eotO9VShwtt5cxXTINPnmk+7205RMXQqicaTDGdw5ynmKFmYy/YPqV8QnJd+yNcigSJr
	TXgCzDt7FeUuJ+l1ZTMCzd17VxNcq5RRFnF+dAwgpcCBTdas40Wg3snowvh3x0Nt9w3ebo5Fl54
	0dqkn03dLmD4N1iHeT/yy+rM1HpRohR6axBii07/ZsPvyOy0t1YTOx8dipnoN38y+s5LItKaor3
	LTG826aXC8eQ3nYnqw4S9xv+UejBeA/sQSj3Da5PZM4dXEoQSfJJNtMB9NCd5LvBjETUotD/TxG
	5Ao=
X-Received: by 2002:a05:6a00:2da9:b0:883:904e:da56 with SMTP id d2e1a72fcca58-8a089d21b81mr372682b3a.36.1792541013696;
        Tue, 20 Oct 2026 17:03:33 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c0affsm153415b3a.29.2026.10.20.17.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:03:32 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:03:31 +0000
Message-Id: <DMA2R8KIUPO2.SR26IDI6VG35@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Validate stack arg reads against caller
 state
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "Xiang Mei" <xmei5@asu.edu>,
 <co+eada64ce90ecebce@bugs.sh>
In-Reply-To: <20261007174203.37071-1-bestswngs@gmail.com>
References: <20261007174203.37071-1-bestswngs@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 07, 2026 at 10:42 AM Weiming Shi <bestswngs@gmail.com> wrote:
> then read a slot that the caller never allocated or initialized. Async
> callback verification also starts at curframe zero, so subtracting one
> to find a caller can underflow the frame array.

Sync callbacks are broken too and this patch doesn't help:
  *(u64 *)(r11 - 8) = r6;
  r1 = 1;
  r2 = cb ll;
  ...
  call bpf_loop;
where cb() has 6 args in BTF and does r1 = *(u64 *)(r11 + 8).
The slot is written, so check_outgoing_stack_args() called from
push_callback_call() passes. push_stack() copies stack_arg_regs[]
of the caller and the load in cb() gets the state of r6.
set_loop_callback_state() marks R3-R5 as not init, but stack args
stay readable.
At run-time bpf_loop(), when not inlined, calls cb(i, ctx, 0, 0, 0).
x86 JIT reads arg6 from r9 and arg7 from the stack frame of bpf_loop().
The verifier thinks it's a map value, but it's garbage.

No helper or kfunc passes more than 5 args to a callback.
Reject callbacks with bpf_in_stack_arg_cnt() in push_callback_call().

> +	if (!vstate->curframe) {
> +		verbose(env, "invalid read from stack arg off %d without caller\n", off);
> +		return -EACCES;
> +	}
> +

Only async callback can get here with curframe == 0.
With the above it's rejected earlier. Drop this check.

Add sync and async callback tests to patch 2.

Also mention in the log that
commit 4286f5deee14 ("bpf: Validate outgoing stack args when btf_prepare_func_args fails")
closed this hole for the first call only.

pw-bot: cr
