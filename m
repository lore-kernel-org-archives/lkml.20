Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329705;
	b=09xOkmHgbMFpEuBOI0XyX9Fj2Rv2jLxJ7W3IGiZgln3zi87l0IUVNmtr1/xQ5KwvtFV4
	 yLodBr0KuFKf4uepHO3ZWEsZuDjY6xHcjCdfHgMm+Uskgc2ipScffMSsQOmSyqesm1B5u
	 BGXonQM0FNGz6hkbiLU5U9jgU4OQRdx5eHdnmWfqsORaY0rTqcEzK0bIIRFUczJMCnhgC
	 x8yVHn0lNibw9ur8FKf5AMGvDfexIQ5ZO8o9pGHnVblHl/YTYr9V6g36z4LKDLLhDazkB
	 7LoQZ5Ehs8t0u7zClUW/tSWJHyN9tuLSNxUyle9oBpxjigUqp0XRvD1A6qbzhsAXNKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
	b=TuZn2wh45iv2Xa6N3CCWTF1ZgF2skXCB2mcJaqRFy9qMZ8Yz9MYWD2GkNpbGhd3yHJDc
	 sJO62IUuhN2JiNDDwVeADoYCOSuvcAydwnheguPkoRadwBsEsXf3owfjRFgh4t3gDMTG8
	 ch0Uqy1C6M3SIDASHuiuBIGZNRUb/uIomcel35OMCQrJOl2b7YHOQ9PwPMW69xa3L+gvh
	 VQTJCl2deioykRHcPSs3o6sDJkLZ8evtgczFOZanNyW38TMtPMdpTHlVwYfp4C6jJi9CR
	 D4leOlMMyRaByEp5nXyZbvCK9JvpRfuVbit8XVG2kRMqrY//Cw2aXZmeecLbr600JlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQ9MXEHj;
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068D606D202
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9068D606D202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQ9MXEHj
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-67a51292ce3so1428278d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329704; x=1794934504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=iQ9MXEHj99R6Za/CnMtjaRwnq8PN5Dw1EHSfCZVwssJsk4YnLOJoks79peXJeTzgPn
         R5r26EzF5+5eSXOIv3mjeK5Xya+e7y9SELgiLIrEoSbZG4m/F1DZ4TrehaJ+KtXRBtT4
         871s0OCP5Yee7408DlzCO/1xf1hLqak4jTbyEXjfh9PH6uhoTUdnfC38UaL4w0PsGaa1
         I6+b1iruk6ZRzuQsaxu5gp319ZDjneKSXTj5x6wfM7ULxuq1SD4QXhp1mBXkXd4Eg2dO
         IDZOICE7voNmZ/6vXCSJ0CU1mTZy7eAXHCYANfpLPIGdKdELQfEiATA/4g6+IX2TyHla
         ZIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329704; x=1794934504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=pJelxGlk+D66LNukRNqjeugB4aNSyBA+Ucyjd/4KeTtXb7aY/IoZwAaDSDn4md48ZU
         CUwPNiubHuCC0JV2kDSVtRpIYup7CJ2elFhTTbYxPeFuWv0CYNSq/zDayUXL/vk7JR+I
         X7KvwAhqIv1dJez+PRmnHg4zmgmGjPi38oIjCK+skHJWcuF3+IBkmBZjth8gfHcSEcQY
         AS9hO25sYBXP0qImc8Pwkmwx5tQHEt4X6Cae9fg6jwglKIkj7jFjkUuazoTzmD3mQ1o4
         P1wD69HRvKkVDPGp6mKL5fN2BWQ6CkMs+mFl4XEV7ZzN80TV82BfodRGIeKVAisq3ok1
         Yt9g==
X-Forwarded-Encrypted: i=1; AL+hErEoHzuoCptMHpI5Yo2sw9FfD0ncT9mfBg+HEqfyNSLbf9xzJd7MfttnA6LKlIKS0m/XxyBRk90GuX1Bvjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mZreynycSQvdVhsW08/qOvzJRTQLMIRnQ1YVglVLPnOUb4MSM
	sHhzQiNY7j49KXjZmm8ycNXFgpS3nOgqapp7r+kmLa8jqX/4hNM4lrA8
X-Gm-Gg: AYBFou0nOcDdOKTr3E58xKDnTUP+Gp3CeZqNgCXWZLE7vZU4tsU3WqnTe06j0M1AO/Y
	Y5X+rjtqAsbDO+FwWDRXfN0RNzLXrYzIIHdEfYPR8xnrgCD7+87cWvPWBMMoRKwZythG4L3NUrO
	x23N4VHcOIdhbqoT5vKMQMiTXxoLFcVBkWrVx3H05hnPf2fTkvtPcuEiYM6mpgWtZWENWOXKzHC
	p8IKoi15OgsW/nfo/IToktyUHsA+wq3cSZoD+h9Y8Tortt9iBaisg3rDK2vyv9kA6IyebzuwKiw
	v/S9MXofd9vJDDfGoI5fJ+U1DRVhKmBOIHgVxC3ic0VOmvLkjtFyXCpnTHJgV90S83731gZtScr
	kQh1co9fgWMFc59AGs9h7Z0whEh7YYgGiqMQ/8rhVMfuGoEtVfhzGNwsfjUXa4AIUvbgt2yQSrr
	H5H+YObB96Q1Fu8NxQ9yIcuA88qALxKIpsTaPY+NIvpIOBCU0IoRZXirBTDUyi6IypoSsGUYVVO
	MNEZVEskHfjhyjlitZj9QY4dkHas0vv66YELQBMnqMG19QNlCVWEopzdZRMPAdmSVAST7FVewz3
	mSKo3yQImIVGqKphi5nYLEePO9ILQtIHx9g=
X-Received: by 2002:a53:ed04:0:b0:679:b810:6df3 with SMTP id 956f58d0204a3-67c568c72d0mr1465408d50.84.1794329704143;
        Tue, 10 Nov 2026 08:55:04 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2255948d50.6.2026.11.10.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:55:03 -0800 (PST)
Message-ID: <a24bc088-3316-40f6-a9c2-acb77fc9befd@gmail.com>
Date: Tue, 10 Nov 2026 11:55:03 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-5-99b695f9eb4f@gmail.com>
 <179424471332.994134.12793914111732564453@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471332.994134.12793914111732564453@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> Is 2^24 the right limit for AES-128-CCM?

No. RFC 9147 section 4.5.3 and Appendix B.1 give 2^23 records for
AES-128-CCM, for the same 2^-60 target as TLS 1.3. v7 will use a limit
below 2^23 for CCM.

> Should TLS_TX and TLS_TX_TRAFFIC_SECRET take tx_lock, as
> TLS_TX_KEY_UPDATE and TLS_TX_MAX_PAYLOAD_LEN do?

This is the lock drop listed under "Not changed" since v4. A TLS_TX
setsockopt() during a sendmsg() in another thread is an application
error. Mainline has the same window: the existing rekey takes only the
socket lock, and the records of that sendmsg() can go out under two
keys. Taking tx_lock in TLS_TX would make the setsockopt() wait behind
a blocked sendmsg(), which changes mainline behavior. The design of
this path is under discussion in the thread on 0/6, so I keep it
unchanged until that is settled.

> Can setsockopt(SOL_TLS, TLS_TX_KEY_UPDATE) block indefinitely on a
> non-blocking socket?

Yes. v7 will remove TLS_TX_KEY_UPDATE (see my reply on 0/6). The
kernel will then send a KeyUpdate only from sendmsg(), with the
caller's flags.

> This isn't a bug, but two parts of this text don't seem to match the code.

In v7, the text will say "before the next Application Data record".
The TLS_TX_KEY_UPDATE text will go away with the option.
